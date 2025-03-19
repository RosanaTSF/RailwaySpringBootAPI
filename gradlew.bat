@rem ==================================================================
@rem Verifica se JAVA_HOME está configurado corretamente, caso não esteja, tenta localizar o Java no PATH do sistema.
if not defined JAVA_HOME (
    echo JAVA_HOME não está definido. Tentando localizar o Java no PATH do sistema...
    
    rem O comando "where" busca o executável "java" no PATH do sistema
    where java > NUL 2>&1
    
    rem Se o comando "where" não encontrar o Java, irá retornar um erro
    if %ERRORLEVEL% neq 0 (
        echo ERROR: JAVA_HOME não está definido e o comando 'java' não foi encontrado no PATH.
        echo Por favor, defina a variável JAVA_HOME para apontar para a instalação do Java.
        exit /b 1
    )
)

@rem Definir o diretório onde o script está localizado e configurar APP_HOME
set DIRNAME=%~dp0
set APP_HOME=%DIRNAME%

@rem Configuração de opções padrões para a JVM
@rem Essas opções determinam a memória inicial e máxima alocada para a JVM.
set DEFAULT_JVM_OPTS="-Xmx64m" "-Xms64m"

@rem Definir o classpath para o Gradle Wrapper
@rem O classpath especifica onde o Gradle Wrapper JAR está localizado, permitindo que o Java o execute.
set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

@rem Inicia o Gradle Wrapper com a JVM e as opções configuradas
@rem O comando executa o Gradle Wrapper usando o arquivo JAR definido no CLASSPATH.
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% "-Dorg.gradle.appname=%APP_BASE_NAME%" -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %*

@rem Verifica se a execução do Gradle foi bem-sucedida
if %ERRORLEVEL% neq 0 (
    echo ERROR: A execução do Gradle falhou.
    exit /b %ERRORLEVEL%
)

echo Gradle iniciou com sucesso.
exit /b 0

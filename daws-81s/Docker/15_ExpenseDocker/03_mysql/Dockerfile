

FROM mysql:8.0
ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1
RUN groupadd expense && \
    useradd -g expense expense && \
    chown -R expense:expense /var/lib/mysql /var/run/mysqld /docker-entrypoint-initdb.d
ADD scripts/*.sql /docker-entrypoint-initdb.d

# BEFORE BEST PRACTICES
# FROM mysql:8.0
# ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1
# ADD scripts/*.sql /docker-entrypoint-initdb.d
# # MYSQL_DATABASE=transactions \ 
#     # MYSQL_USER=expense \
#     # MYSQL_PASSWORD=ExpenseApp@1
# NESTJS

## Decorators (컨트롤러)

- @Request() req
- @Response(),@Res() res
- @Next() next
- @Session() req.session
- @Param(key?:string) req.params/req.params[key] Path 파람
- @Body(key?:string) req.body/req.body[key] JSON 파람
- @Query(key?:string) req.query/req.query[key] URL 파람
- @Headers(name?:string) req.headers/req.headers[name]
- @Ip() req.ip

## Decorators (Open API)

- @ApiExcludeEndpoint() API에서 제외
- @ApiBody({ type: [CreateUserDto] })
- @ApiProperty({ enum: ['Admin', 'Moderator', 'User']})
- @ApiQuery({ name: 'role', enum: UserRole })

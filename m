Content-Type: multipart/mixed; boundary="===============3665684017794575147=="
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [arm-integrator:kasan 6/6] mm/kasan/init.c:318:9: warning: variable 'pud' set but not used
Date: Fri, 02 Oct 2020 11:19:11 +0200
Message-ID: <CACRpkdbUbpk6w934m2-BAqqB7Y5SqocUo=jJzw9iQib5P0_nig@mail.gmail.com>
In-Reply-To: <202010020641.i181Kexx-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3665684017794575147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Help me out on this one.

On Fri, Oct 2, 2020 at 12:26 AM kernel test robot <lkp@intel.com> wrote:

>    mm/kasan/init.c: In function 'kasan_free_pud':
> >> mm/kasan/init.c:318:9: warning: variable 'pud' set but not used [-Wunu=
sed-but-set-variable]
>      318 |  pud_t *pud;
>          |         ^~~

Aha

> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  316  sta=
tic void kasan_free_pud(pud_t *pud_start, p4d_t *p4d)
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  317  {
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17 @318    p=
ud_t *pud;

There it is

> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  319    i=
nt i;
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  320
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  321    f=
or (i =3D 0; i < PTRS_PER_PUD; i++) {
> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  322     =
       pud =3D pud_start + i;

There it is set

> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  323     =
       if (!pud_none(*pud))

There it is used

What am I not seeing? I know I can't trust my human brain parser
so I guess I'm wrong.

Yours,
Linus Walleij
--===============3665684017794575147==--


Content-Type: multipart/mixed; boundary="===============4311222124715915599=="
MIME-Version: 1.0
From: Xia, Hui <hui.xia@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [arm-integrator:kasan 6/6] mm/kasan/init.c:318:9: warning: variable 'pud' set but not used
Date: Wed, 21 Oct 2020 15:02:31 +0000
Message-ID: <MWHPR11MB1613B2E003146213FD9CFDDDE51C0@MWHPR11MB1613.namprd11.prod.outlook.com>
In-Reply-To: <CACRpkdbUbpk6w934m2-BAqqB7Y5SqocUo=jJzw9iQib5P0_nig@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4311222124715915599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Linus Walleij <linus.walleij@linaro.org>
>Sent: 2020=E5=B9=B410=E6=9C=882=E6=97=A5 17:19
>To: lkp <lkp@intel.com>
>Cc: Andrey Ryabinin <ryabinin@virtuozzo.com>; kbuild-all(a)lists.01.org;=
 Ard
>Biesheuvel <ardb@kernel.org>; Abbott Liu <liuwenliang@huawei.com>;
>Florian Fainelli <f.fainelli@gmail.com>
>Subject: [kbuild-all] Re: [arm-integrator:kasan 6/6] mm/kasan/init.c:318:9:
>warning: variable 'pud' set but not used
>
>Help me out on this one.
>
>On Fri, Oct 2, 2020 at 12:26 AM kernel test robot <lkp@intel.com> wrote:
>
>>    mm/kasan/init.c: In function 'kasan_free_pud':
>> >> mm/kasan/init.c:318:9: warning: variable 'pud' set but not used
>> >> [-Wunused-but-set-variable]
>>      318 |  pud_t *pud;
>>          |         ^~~
>
>Aha
>
>> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  316
>> static void kasan_free_pud(pud_t *pud_start, p4d_t *p4d)
>> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  317  {
>> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17 @318
>pud_t *pud;
>
>There it is
>
>> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  319
>int i;
>> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  320
>> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  321
>for (i =3D 0; i < PTRS_PER_PUD; i++) {
>> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  322
>pud =3D pud_start + i;
>
>There it is set
>
>> 0207df4fa1a869 mm/kasan/kasan_init.c Andrey Ryabinin 2018-08-17  323
>if (!pud_none(*pud))
>
>There it is used
>
>What am I not seeing? I know I can't trust my human brain parser so I guess
>I'm wrong.

It probably because pud_none was not implemented when CONFIG_PGTABLE_LEVELS=
=3D2.
Check:
arch/arm/include/asm/pgtable-2level.h:#define pud_none(pud)             (0)
arch/arm/include/asm/pgtable-3level.h:#define pud_none(pud)             (!p=
ud_val(pud))

Regards,
Hui


>
>Yours,
>Linus Walleij
>_______________________________________________
>kbuild-all mailing list -- kbuild-all(a)lists.01.org To unsubscribe send a=
n email to
>kbuild-all-leave(a)lists.01.org
--===============4311222124715915599==--


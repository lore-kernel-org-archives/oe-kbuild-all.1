Content-Type: multipart/mixed; boundary="===============8583082548049804285=="
MIME-Version: 1.0
From: Michael Ellerman <mpe@ellerman.id.au>
To: kbuild-all@lists.01.org
Subject: Re: [linuxppc:next-test 48/49] arch/x86/kernel/signal.c:312:7: error: implicit declaration of function 'user_access_begin'; did you mean 'user_access_end'?
Date: Fri, 01 May 2020 14:39:57 +1000
Message-ID: <87ftcke09u.fsf@mpe.ellerman.id.au>
In-Reply-To: <e783c701-e6da-02d8-7eb7-014b555e9ebf@c-s.fr>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8583082548049804285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Hi Michael,
>
> Le 30/04/2020 =C3=A0 16:13, kbuild test robot a =C3=A9crit=C2=A0:
>> tree:   https://github.com/linuxppc/linux next-test
>> head:   7d204d846b04d0a1b4d3712736029fbf2e7a7359
>> commit: 5bb3b9d986426296507d3ef58d1e5fe4625de01f [48/49] uaccess: Rename=
 user_access_begin/end() to user_full_access_begin/end()
>> config: i386-tinyconfig (attached as .config)
>> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
>> reproduce:
>>          git checkout 5bb3b9d986426296507d3ef58d1e5fe4625de01f
>>          # save the attached .config to linux build tree
>>          make ARCH=3Di386
>> =

>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kbuild test robot <lkp@intel.com>
>> =

>> All errors (new ones prefixed by >>):
>> =

>>     arch/x86/kernel/signal.c: In function '__setup_frame':
>>>> arch/x86/kernel/signal.c:312:7: error: implicit declaration of functio=
n 'user_access_begin'; did you mean 'user_access_end'? [-Werror=3Dimplicit-=
function-declaration]
>>       if (!user_access_begin(frame, sizeof(*frame)))
>>            ^~~~~~~~~~~~~~~~~
>>            user_access_end
>>     cc1: some warnings being treated as errors
>
>
>
> I see you took the entire series.
>
> The problem is that people added additional uses of user_access_begin() =

> after I submitted the series.
>
> In the meantime, Linus has suggested to keep the original name of the =

> function and drop patch 5 (see discussion at =

> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/42da416106d5c1cf9=
2bda1e058434fe240b35f44.1585898438.git.christophe.leroy(a)c-s.fr/#2400813)

Yep sorry for the spam.

I forgot to drop the last patch before I pushed, and then the build bot
picked it up.

I've dropped the rename patch now.

cheers
--===============8583082548049804285==--


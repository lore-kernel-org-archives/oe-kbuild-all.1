Content-Type: multipart/mixed; boundary="===============7572655474757883689=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: kbuild-all@lists.01.org
Subject: Re: [peterz-queue:ras/urgent 1/1] arch/x86//kernel/cpu/mce/therm_throt.c:491:2: error: use of undeclared identifier 'l'
Date: Wed, 26 Feb 2020 10:48:46 +0100
Message-ID: <20200226094846.GA17448@zn.tnic>
In-Reply-To: <202002261227.tXCI013J%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7572655474757883689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 12:38:29PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git =
ras/urgent
> head:   bf69bac4d3ef188ee8cf536a31ecbb230a8ba91a
> commit: bf69bac4d3ef188ee8cf536a31ecbb230a8ba91a [1/1] x86/mce/therm_thro=
t: Undo thermal polling properly on CPU offline
> config: x86_64-defconfig (attached as .config)
> compiler: clang version 11.0.0 (git://gitmirror/llvm_project 7f9f027c6262=
3bff79730cd30d1a8a534e2ddb06)
> reproduce:
>         # FIXME the reproduce steps for clang is not ready yet
> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

> >> arch/x86//kernel/cpu/mce/therm_throt.c:491:2: error: use of undeclared=
 identifier 'l'
>            l =3D apic_read(APIC_LVTTHMR);
>            ^
>    arch/x86//kernel/cpu/mce/therm_throt.c:492:27: error: use of undeclare=
d identifier 'l'
>            apic_write(APIC_LVTTHMR, l | APIC_LVT_MASKED);
>                                     ^
>    2 errors generated.

Already fixed, thx.

-- =

Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imend=C3=B6rffer, HRB 36809=
, AG N=C3=BCrnberg
--===============7572655474757883689==--


Content-Type: multipart/mixed; boundary="===============4560814929401037485=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 08/15] x86: add new features for paravirt patching
Date: Thu, 14 Jan 2021 19:30:24 +0100
Message-ID: <20210114183024.GF12284@zn.tnic>
In-Reply-To: <202012172021.VSDLPK5D-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4560814929401037485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 09:12:57PM +0800, kernel test robot wrote:
>    ld: arch/x86/kernel/alternative.o: in function `paravirt_set_cap':
> >> arch/x86/kernel/alternative.c:605: undefined reference to `pv_is_nativ=
e_spin_unlock'
> >> ld: arch/x86/kernel/alternative.c:608: undefined reference to `pv_is_n=
ative_vcpu_is_preempted'

Looks like alternative.c needs #include <asm/paravirt.h>.

-- =

Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
--===============4560814929401037485==--


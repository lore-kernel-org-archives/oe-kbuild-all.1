Content-Type: multipart/mixed; boundary="===============5758510040112763945=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: arch/ia64/include/uapi/asm/siginfo.h:15:27: error: expected ':', ',', '; ', '}' or '__attribute__' before '.' token
Date: Sun, 30 May 2021 07:37:32 -0700
Message-ID: <ddd58e03-2f30-101a-d4b1-3304cc9212e6@infradead.org>
In-Reply-To: <202105301826.MwSrFnm9-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5758510040112763945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/30/21 3:07 AM, kernel test robot wrote:
> Hi Christoph,
> =

> FYI, the error/warning still remains.
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   b90e90f40b4ff23c753126008bf4713a42353af6
> commit: 8cad3b66bff4ee7c7d52b9a663cb6a2c5f66a7f7 Buslogic: remove ISA sup=
port
> date:   8 weeks ago
> config: ia64-allyesconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D8cad3b66bff4ee7c7d52b9a663cb6a2c5f66a7f7
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 8cad3b66bff4ee7c7d52b9a663cb6a2c5f66a7f7
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dia64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    In file included from include/uapi/linux/signal.h:6,
>                     from include/linux/signal_types.h:10,
>                     from include/linux/sched.h:30,
>                     from arch/ia64/include/asm/hw_irq.h:11,
>                     from include/linux/irq.h:589,
>                     from arch/ia64/include/asm/hardirq.h:19,
>                     from include/linux/hardirq.h:10,
>                     from include/linux/interrupt.h:11,
>                     from drivers/scsi/BusLogic.c:27:
>>> arch/ia64/include/uapi/asm/siginfo.h:15:27: error: expected ':', ',', '=
;', '}' or '__attribute__' before '.' token
>       15 | #define si_flags _sifields._sigfault._flags
>          |                           ^
>    drivers/scsi/FlashPoint.c:43:6: note: in expansion of macro 'si_flags'
>       43 |  u16 si_flags;
>          |      ^~~~~~~~

> vim +15 arch/ia64/include/uapi/asm/siginfo.h
> =

> 43e40f25d2c0903 David Howells 2012-10-09  13  =

> 43e40f25d2c0903 David Howells 2012-10-09  14  #define si_imm		_sifields._=
sigfault._imm	/* as per UNIX SysV ABI spec */
> 43e40f25d2c0903 David Howells 2012-10-09 @15  #define si_flags	_sifields.=
_sigfault._flags
> 43e40f25d2c0903 David Howells 2012-10-09  16  /*
> 43e40f25d2c0903 David Howells 2012-10-09  17   * si_isr is valid for SIGI=
LL, SIGFPE, SIGSEGV, SIGBUS, and SIGTRAP provided that
> 43e40f25d2c0903 David Howells 2012-10-09  18   * si_code is non-zero and =
__ISR_VALID is set in si_flags.
> 43e40f25d2c0903 David Howells 2012-10-09  19   */
> 43e40f25d2c0903 David Howells 2012-10-09  20  #define si_isr		_sifields._=
sigfault._isr
> 43e40f25d2c0903 David Howells 2012-10-09  21  =

> =

> :::::: The code at line 15 was first introduced by commit
> :::::: 43e40f25d2c090392fc36cb900b42972e88cc2e2 UAPI: (Scripted) Disinteg=
rate arch/ia64/include/asm
> =

> :::::: TO: David Howells <dhowells@redhat.com>
> :::::: CC: David Howells <dhowells@redhat.com>


Patch is here:
  https://lore.kernel.org/linux-scsi/b631c661-44fa-57f5-6540-1721f3df61e8(a=
)suse.de/T/#ma8097b011095a7b4cc73381f45312eb634166187


-- =

~Randy
https://people.kernel.org/tglx/notes-about-netiquette
--===============5758510040112763945==--


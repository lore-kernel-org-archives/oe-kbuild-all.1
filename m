Content-Type: multipart/mixed; boundary="===============5768124896193220029=="
MIME-Version: 1.0
From: Mark Rutland <mark.rutland@arm.com>
To: kbuild-all@lists.01.org
Subject: Re: arch/arm64/kernel/syscall.c:164:6: warning: no previous prototype for 'do_el0_svc_compat'
Date: Thu, 14 Jan 2021 11:58:11 +0000
Message-ID: <20210114115811.GC2739@C02TD0UTHF1T.local>
In-Reply-To: <202101141046.n8iPO3mw-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5768124896193220029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 10:41:59AM +0800, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> =

>    arch/arm64/kernel/syscall.c:157:6: warning: no previous prototype for =
'do_el0_svc' [-Wmissing-prototypes]
>      157 | void do_el0_svc(struct pt_regs *regs)
>          |      ^~~~~~~~~~
> >> arch/arm64/kernel/syscall.c:164:6: warning: no previous prototype for =
'do_el0_svc_compat' [-Wmissing-prototypes]
>      164 | void do_el0_svc_compat(struct pt_regs *regs)
>          |      ^~~~~~~~~~~~~~~~~

Looks like this is down to syscall.c not including <asm/exception.h>,
since do_el0_svc_compat() has a prototype there.

I'll spin a patch...

Mark.
--===============5768124896193220029==--


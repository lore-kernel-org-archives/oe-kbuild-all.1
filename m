Content-Type: multipart/mixed; boundary="===============2707638728605727148=="
MIME-Version: 1.0
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [rcu:dev.2021.05.18a 19/26] arch/powerpc/include/asm/kvm_para.h:27:40: error: 'KVM_HC_FEATURES' undeclared
Date: Fri, 21 May 2021 14:19:05 +0900
Message-ID: <YKdCyQWqMVChz3Is@google.com>
In-Reply-To: <202105211023.BuU7Y7IQ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2707638728605727148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (21/05/21 10:35), kernel test robot wrote:
> =

>    In file included from arch/powerpc/include/asm/epapr_hcalls.h:53,
>                     from arch/powerpc/include/uapi/asm/kvm_para.h:82,
>                     from arch/powerpc/include/asm/kvm_para.h:13,
>                     from kernel/rcu/tree_stall.h:10,
>                     from kernel/rcu/tree.c:4783:

I think I #include wrong header.

It should be

#include <linux/kvm_para.h>

not

#include <asm/kvm_para.h>
--===============2707638728605727148==--


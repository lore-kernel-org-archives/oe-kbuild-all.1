Content-Type: multipart/mixed; boundary="===============0629335063398533698=="
MIME-Version: 1.0
From: Ard Biesheuvel <ardb@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [integrity:next-integrity-testing 13/13] security/integrity/ima/ima_appraise.c:21:62: error: expected ')' before numeric constant
Date: Tue, 13 Oct 2020 20:28:58 +0200
Message-ID: <CAMj1kXH2tM5WD5Hg5ThZ5_v8MyztBCN=wQ0_H6We018jgg1RHw@mail.gmail.com>
In-Reply-To: <202010140256.feiUaqBx-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0629335063398533698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Oct 2020 at 20:09, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integ=
rity.git next-integrity-testing
> head:   bfa46be051c194a941641c128f5e6f315f1ec232
> commit: bfa46be051c194a941641c128f5e6f315f1ec232 [13/13] ima: defer arch_=
ima_get_secureboot() call to IMA init time
> config: xtensa-allyesconfig (attached as .config)
> compiler: xtensa-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-int=
egrity.git/commit/?id=3Dbfa46be051c194a941641c128f5e6f315f1ec232
>         git remote add integrity https://git.kernel.org/pub/scm/linux/ker=
nel/git/zohar/linux-integrity.git
>         git fetch --no-tags integrity next-integrity-testing
>         git checkout bfa46be051c194a941641c128f5e6f315f1ec232
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dxtensa
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> security/integrity/ima/ima_appraise.c:21:62: error: expected ')' befor=
e numeric constant
>       21 | core_param(ima_appraise, ima_appraise_cmdline_default, charp, =
0);
>          |                                                              ^~
>          |                                                              )
>
> vim +21 security/integrity/ima/ima_appraise.c
>
>     18
>     19  #ifdef CONFIG_IMA_APPRAISE_BOOTPARAM
>     20  static char *ima_appraise_cmdline_default __initdata;
>   > 21  core_param(ima_appraise, ima_appraise_cmdline_default, charp, 0);
>     22
>

The error message is a bit misleading here, but this can be fixed by adding

#include <linux/module.h>

at the top. Let me know if I need to respin for this.
--===============0629335063398533698==--


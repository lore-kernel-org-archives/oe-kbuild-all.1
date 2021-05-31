Content-Type: multipart/mixed; boundary="===============7342930817725116648=="
MIME-Version: 1.0
From: Jinpu Wang <jinpu.wang@ionos.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCHv3 for-next 05/20] RDMA/rtrs: Change MAX_SESS_QUEUE_DEPTH
Date: Mon, 31 May 2021 13:44:22 +0200
Message-ID: <CAMGffEnoYGoNwXe75KcP8WCTXAYBKkhJ=cx3aC=4mm77stWzUA@mail.gmail.com>
In-Reply-To: <202105290002.LSBHvezM-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7342930817725116648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 28, 2021 at 6:20 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Jack,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on rdma/for-next]
> [also build test WARNING on v5.13-rc3 next-20210528]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Jack-Wang/RTRS-update-fo=
r-5-14/20210528-193313
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for=
-next
> config: x86_64-randconfig-a012-20210526 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 6505=
c630407c5feec818f0bb1c284f9eeebf2071)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/66f95f659060028d1f0f914=
73ad1c16a6595fcac
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Jack-Wang/RTRS-update-for-5-14/2=
0210528-193313
>         git checkout 66f95f659060028d1f0f91473ad1c16a6595fcac
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/infiniband/ulp/rtrs/rtrs-clt.c:1786:19: warning: result of com=
parison of constant 'MAX_SESS_QUEUE_DEPTH' (65536) with expression of type =
'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-o=
f-range-compare]
>                    if (queue_depth > MAX_SESS_QUEUE_DEPTH) {
>                        ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
 Thanks for the reporting.

As the check is checking against u16 max,I think we should reduce
MAX_SESS_QUEUE_DEPTH to 65535, and drop the check in line rtrs-clt:
1786

Jason, you mentioned v3 is applied in for-next, I guess I'll wait when
you push it out, and send the patch to fix this. is it ok?

Thanks!
--===============7342930817725116648==--


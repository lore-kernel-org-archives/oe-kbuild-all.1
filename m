Content-Type: multipart/mixed; boundary="===============8290042107020289655=="
MIME-Version: 1.0
From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 15/17] crypto: qce: Defer probing if BAM dma is not yet initialized
Date: Sat, 08 May 2021 02:46:21 +0530
Message-ID: <CAH=2NtzgdAnMxY0ih9TD9WEW2-7JN4-doywPG6x88rDzZjDCgw@mail.gmail.com>
In-Reply-To: <202105061257.2mFnfdJE-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8290042107020289655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 6 May 2021 at 10:23, kernel test robot <lkp@intel.com> wrote:
>
> Hi Bhupesh,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on cryptodev/master]
> [also build test ERROR on crypto/master vkoul-dmaengine/next robh/for-nex=
t v5.12 next-20210505]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Bhupesh-Sharma/Enable-Qu=
alcomm-Crypto-Engine-on-sm8250/20210506-054114
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev=
-2.6.git master
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/4c00d66a1b254454e85dc82=
cb7358649e1dda72c
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Bhupesh-Sharma/Enable-Qualcomm-C=
rypto-Engine-on-sm8250/20210506-054114
>         git checkout 4c00d66a1b254454e85dc82cb7358649e1dda72c
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Dm68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "bam_is_probed" [drivers/crypto/qce/qcrypto.ko] undefi=
ned!

Thanks, I will fix this in v3.

Regards,
Bhupesh
--===============8290042107020289655==--


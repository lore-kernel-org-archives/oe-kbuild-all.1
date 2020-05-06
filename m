Content-Type: multipart/mixed; boundary="===============0691470252011717677=="
MIME-Version: 1.0
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] ASoC: qcom: Use devm_platform_ioremap_resource_byname()to simplify code
Date: Wed, 06 May 2020 21:48:34 +0800
Message-ID: <4b2fba97-6f04-622c-f69a-ba00de19335d@cmss.chinamobile.com>
In-Reply-To: <202005051301.uK51h1pS%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0691470252011717677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 2020/5/5 13:35, kbuild test robot wrote:
> Hi Tang,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on asoc/for-next]
> [also build test ERROR on v5.7-rc4 next-20200504]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/Tang-Bin/ASoC-qcom-Use-d=
evm_platform_ioremap_resource_byname-to-simplify-code/20200505-051041
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git=
 for-next
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cros=
s ARCH=3Dsh
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     sound/soc/qcom/lpass-cpu.c: In function 'asoc_qcom_lpass_cpu_platform=
_probe':
>>> sound/soc/qcom/lpass-cpu.c:445:21: error: expected ';' before 'if'

Sorry, please forget this patch, it's my fault.

Thanks



--===============0691470252011717677==--


Content-Type: multipart/mixed; boundary="===============6523245656894376110=="
MIME-Version: 1.0
From: Lee Jones <lee.jones@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 12774/13554] drivers/mfd/mt6360-core.c:148:2: warning: initializer overrides prior initialization of this subobject
Date: Fri, 29 May 2020 08:30:15 +0100
Message-ID: <20200529073015.GQ3628@dell>
In-Reply-To: <202005291101.X3TXWqSi%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6523245656894376110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Gene,

On Fri, 29 May 2020, kbuild test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   ff387fc20c697cdc887b2abf7ef494e853795a2f
> commit: 7edd363421dab1d4806802ac65613d1c0ec85824 [12774/13554] mfd: Add s=
upport for PMIC MT6360
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 2d06=
8e534f1671459e1b135852c1b3c10502e929)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout 7edd363421dab1d4806802ac65613d1c0ec85824
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> drivers/mfd/mt6360-core.c:148:2: warning: initializer overrides prior =
initialization of this subobject [-Winitializer-overrides]
> REGMAP_IRQ_REG_LINE(MT6360_CHG_TREG_EVT, 8),
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/regmap.h:1191:10: note: expanded from macro 'REGMAP_IRQ_REG=
_LINE'
> [_id] =3D {                                                  ^~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/mt6360-core.c:124:2: note: previous initialization is here
> REGMAP_IRQ_REG_LINE(MT6360_CHG_TREG_EVT, 8),
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/regmap.h:1191:10: note: expanded from macro 'REGMAP_IRQ_REG=
_LINE'
> [_id] =3D {                                                  ^~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
> 1 warning generated.

Could you fix this today please?

> vim +148 drivers/mfd/mt6360-core.c
> =

>    122	=

>    123	static const struct regmap_irq mt6360_pmu_irqs[] =3D  {
>    124		REGMAP_IRQ_REG_LINE(MT6360_CHG_TREG_EVT, 8),
>    125		REGMAP_IRQ_REG_LINE(MT6360_CHG_AICR_EVT, 8),
>    126		REGMAP_IRQ_REG_LINE(MT6360_CHG_MIVR_EVT, 8),
>    127		REGMAP_IRQ_REG_LINE(MT6360_PWR_RDY_EVT, 8),
>    128		REGMAP_IRQ_REG_LINE(MT6360_CHG_BATSYSUV_EVT, 8),
>    129		REGMAP_IRQ_REG_LINE(MT6360_FLED_CHG_VINOVP_EVT, 8),
>    130		REGMAP_IRQ_REG_LINE(MT6360_CHG_VSYSUV_EVT, 8),
>    131		REGMAP_IRQ_REG_LINE(MT6360_CHG_VSYSOV_EVT, 8),
>    132		REGMAP_IRQ_REG_LINE(MT6360_CHG_VBATOV_EVT, 8),
>    133		REGMAP_IRQ_REG_LINE(MT6360_CHG_VBUSOV_EVT, 8),
>    134		REGMAP_IRQ_REG_LINE(MT6360_WD_PMU_DET, 8),
>    135		REGMAP_IRQ_REG_LINE(MT6360_WD_PMU_DONE, 8),
>    136		REGMAP_IRQ_REG_LINE(MT6360_CHG_TMRI, 8),
>    137		REGMAP_IRQ_REG_LINE(MT6360_CHG_ADPBADI, 8),
>    138		REGMAP_IRQ_REG_LINE(MT6360_CHG_RVPI, 8),
>    139		REGMAP_IRQ_REG_LINE(MT6360_OTPI, 8),
>    140		REGMAP_IRQ_REG_LINE(MT6360_CHG_AICCMEASL, 8),
>    141		REGMAP_IRQ_REG_LINE(MT6360_CHGDET_DONEI, 8),
>    142		REGMAP_IRQ_REG_LINE(MT6360_WDTMRI, 8),
>    143		REGMAP_IRQ_REG_LINE(MT6360_SSFINISHI, 8),
>    144		REGMAP_IRQ_REG_LINE(MT6360_CHG_RECHGI, 8),
>    145		REGMAP_IRQ_REG_LINE(MT6360_CHG_TERMI, 8),
>    146		REGMAP_IRQ_REG_LINE(MT6360_CHG_IEOCI, 8),
>    147		REGMAP_IRQ_REG_LINE(MT6360_PUMPX_DONEI, 8),
>  > 148		REGMAP_IRQ_REG_LINE(MT6360_CHG_TREG_EVT, 8),
>    149		REGMAP_IRQ_REG_LINE(MT6360_BAT_OVP_ADC_EVT, 8),
>    150		REGMAP_IRQ_REG_LINE(MT6360_TYPEC_OTP_EVT, 8),
>    151		REGMAP_IRQ_REG_LINE(MT6360_ADC_WAKEUP_EVT, 8),
>    152		REGMAP_IRQ_REG_LINE(MT6360_ADC_DONEI, 8),
>    153		REGMAP_IRQ_REG_LINE(MT6360_BST_BATUVI, 8),
>    154		REGMAP_IRQ_REG_LINE(MT6360_BST_VBUSOVI, 8),
>    155		REGMAP_IRQ_REG_LINE(MT6360_BST_OLPI, 8),
>    156		REGMAP_IRQ_REG_LINE(MT6360_ATTACH_I, 8),
>    157		REGMAP_IRQ_REG_LINE(MT6360_DETACH_I, 8),
>    158		REGMAP_IRQ_REG_LINE(MT6360_QC30_STPDONE, 8),
>    159		REGMAP_IRQ_REG_LINE(MT6360_QC_VBUSDET_DONE, 8),
>    160		REGMAP_IRQ_REG_LINE(MT6360_HVDCP_DET, 8),
>    161		REGMAP_IRQ_REG_LINE(MT6360_CHGDETI, 8),
>    162		REGMAP_IRQ_REG_LINE(MT6360_DCDTI, 8),
>    163		REGMAP_IRQ_REG_LINE(MT6360_FOD_DONE_EVT, 8),
>    164		REGMAP_IRQ_REG_LINE(MT6360_FOD_OV_EVT, 8),
>    165		REGMAP_IRQ_REG_LINE(MT6360_CHRDET_UVP_EVT, 8),
>    166		REGMAP_IRQ_REG_LINE(MT6360_CHRDET_OVP_EVT, 8),
>    167		REGMAP_IRQ_REG_LINE(MT6360_CHRDET_EXT_EVT, 8),
>    168		REGMAP_IRQ_REG_LINE(MT6360_FOD_LR_EVT, 8),
>    169		REGMAP_IRQ_REG_LINE(MT6360_FOD_HR_EVT, 8),
>    170		REGMAP_IRQ_REG_LINE(MT6360_FOD_DISCHG_FAIL_EVT, 8),
>    171		REGMAP_IRQ_REG_LINE(MT6360_USBID_EVT, 8),
>    172		REGMAP_IRQ_REG_LINE(MT6360_APWDTRST_EVT, 8),
>    173		REGMAP_IRQ_REG_LINE(MT6360_EN_EVT, 8),
>    174		REGMAP_IRQ_REG_LINE(MT6360_QONB_RST_EVT, 8),
>    175		REGMAP_IRQ_REG_LINE(MT6360_MRSTB_EVT, 8),
>    176		REGMAP_IRQ_REG_LINE(MT6360_OTP_EVT, 8),
>    177		REGMAP_IRQ_REG_LINE(MT6360_VDDAOV_EVT, 8),
>    178		REGMAP_IRQ_REG_LINE(MT6360_SYSUV_EVT, 8),
>    179		REGMAP_IRQ_REG_LINE(MT6360_FLED_STRBPIN_EVT, 8),
>    180		REGMAP_IRQ_REG_LINE(MT6360_FLED_TORPIN_EVT, 8),
>    181		REGMAP_IRQ_REG_LINE(MT6360_FLED_TX_EVT, 8),
>    182		REGMAP_IRQ_REG_LINE(MT6360_FLED_LVF_EVT, 8),
>    183		REGMAP_IRQ_REG_LINE(MT6360_FLED2_SHORT_EVT, 8),
>    184		REGMAP_IRQ_REG_LINE(MT6360_FLED1_SHORT_EVT, 8),
>    185		REGMAP_IRQ_REG_LINE(MT6360_FLED2_STRB_EVT, 8),
>    186		REGMAP_IRQ_REG_LINE(MT6360_FLED1_STRB_EVT, 8),
>    187		REGMAP_IRQ_REG_LINE(MT6360_FLED2_STRB_TO_EVT, 8),
>    188		REGMAP_IRQ_REG_LINE(MT6360_FLED1_STRB_TO_EVT, 8),
>    189		REGMAP_IRQ_REG_LINE(MT6360_FLED2_TOR_EVT, 8),
>    190		REGMAP_IRQ_REG_LINE(MT6360_FLED1_TOR_EVT, 8),
>    191		REGMAP_IRQ_REG_LINE(MT6360_BUCK1_PGB_EVT, 8),
>    192		REGMAP_IRQ_REG_LINE(MT6360_BUCK1_OC_EVT, 8),
>    193		REGMAP_IRQ_REG_LINE(MT6360_BUCK1_OV_EVT, 8),
>    194		REGMAP_IRQ_REG_LINE(MT6360_BUCK1_UV_EVT, 8),
>    195		REGMAP_IRQ_REG_LINE(MT6360_BUCK2_PGB_EVT, 8),
>    196		REGMAP_IRQ_REG_LINE(MT6360_BUCK2_OC_EVT, 8),
>    197		REGMAP_IRQ_REG_LINE(MT6360_BUCK2_OV_EVT, 8),
>    198		REGMAP_IRQ_REG_LINE(MT6360_BUCK2_UV_EVT, 8),
>    199		REGMAP_IRQ_REG_LINE(MT6360_LDO1_OC_EVT, 8),
>    200		REGMAP_IRQ_REG_LINE(MT6360_LDO2_OC_EVT, 8),
>    201		REGMAP_IRQ_REG_LINE(MT6360_LDO3_OC_EVT, 8),
>    202		REGMAP_IRQ_REG_LINE(MT6360_LDO5_OC_EVT, 8),
>    203		REGMAP_IRQ_REG_LINE(MT6360_LDO6_OC_EVT, 8),
>    204		REGMAP_IRQ_REG_LINE(MT6360_LDO7_OC_EVT, 8),
>    205		REGMAP_IRQ_REG_LINE(MT6360_LDO1_PGB_EVT, 8),
>    206		REGMAP_IRQ_REG_LINE(MT6360_LDO2_PGB_EVT, 8),
>    207		REGMAP_IRQ_REG_LINE(MT6360_LDO3_PGB_EVT, 8),
>    208		REGMAP_IRQ_REG_LINE(MT6360_LDO5_PGB_EVT, 8),
>    209		REGMAP_IRQ_REG_LINE(MT6360_LDO6_PGB_EVT, 8),
>    210		REGMAP_IRQ_REG_LINE(MT6360_LDO7_PGB_EVT, 8),
>    211	};
>    212	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



-- =

Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
Linaro Services Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--===============6523245656894376110==--


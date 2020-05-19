Content-Type: multipart/mixed; boundary="===============4367986907325432764=="
MIME-Version: 1.0
From: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 11/14] ASoC: amd: enable Renoir acp3x drivers build
Date: Tue, 19 May 2020 14:46:34 +0000
Message-ID: <
 <DM6PR12MB26331AE3789EEE2A2EE0125497B90@DM6PR12MB2633.namprd12.prod.outlook.com>>
In-Reply-To: <202005191950.eIcpPpMP%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4367986907325432764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]



> -----Original Message-----
> From: kbuild test robot <lkp@intel.com>
> Sent: Tuesday, May 19, 2020 5:29 PM
> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Cc: kbuild-all(a)lists.01.org
> Subject: Re: [PATCH v3 11/14] ASoC: amd: enable Renoir acp3x drivers build
> =

> Hi Vijendar,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on asoc/for-next]
> [also build test WARNING on v5.7-rc6 next-20200518]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fstacko
> verflow.com%2Fa%2F37406982&amp;data=3D02%7C01%7CVijendar.Mukunda%4
> 0amd.com%7C5b44e0b07699447dc1a108d7fbec2252%7C3dd8961fe4884e608e
> 11a82d994e183d%7C0%7C0%7C637254864058083221&amp;sdata=3DosGaw1pX
> T7zlbrW8NvLM0UzY989Ls3sMFza1f821iEA%3D&amp;reserved=3D0]
> =

> url:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub
> .com%2F0day-ci%2Flinux%2Fcommits%2FVijendar-Mukunda%2FAdd-Renoir-
> ACP-driver%2F20200519-
> 012848&amp;data=3D02%7C01%7CVijendar.Mukunda%40amd.com%7C5b44e0b
> 07699447dc1a108d7fbec2252%7C3dd8961fe4884e608e11a82d994e183d%7C0
> %7C0%7C637254864058083221&amp;sdata=3DNxcU2WReor0gsaf9SE8lO8kZYbQ
> nuSyYrH4HJXCZHGg%3D&amp;reserved=3D0
> base:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
er
> nel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbroonie%2Fsound.git&am
> p;data=3D02%7C01%7CVijendar.Mukunda%40amd.com%7C5b44e0b07699447dc
> 1a108d7fbec2252%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63
> 7254864058083221&amp;sdata=3D33Gksslc5zGoQPQvOkeg5k2Z6HKoJG%2F79cH
> u%2Befz8xs%3D&amp;reserved=3D0 for-next
> config: i386-allyesconfig (attached as .config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Di386
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> sound/soc/amd/renoir/acp3x-pdm-dma.c: In function 'stop_pdm_dma':
> >> sound/soc/amd/renoir/acp3x-pdm-dma.c:153:34: warning: variable
> 'pdm_fifo_flush' set but not used [-Wunused-but-set-variable]
Fixed the issue. submitted the incremental patch for the same
for upstream review.

> u32 pdm_enable, pdm_dma_enable, pdm_fifo_flush;
> ^~~~~~~~~~~~~~
> =

> vim +/pdm_fifo_flush +153 sound/soc/amd/renoir/acp3x-pdm-dma.c
> =

> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  150
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  151  static int
> stop_pdm_dma(void __iomem *acp_base)
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  152  {
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19 @153  	u32 pdm_enable,
> pdm_dma_enable, pdm_fifo_flush;
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  154  	int timeout;
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  155
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  156  	pdm_enable =3D 0x00;
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  157  	pdm_dma_enable  =3D
> 0x00;
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  158  	pdm_fifo_flush =3D
> 0x00;
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  159
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  160  	pdm_enable =3D
> rn_readl(acp_base + ACP_WOV_PDM_ENABLE);
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  161  	pdm_dma_enable =3D
> rn_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  162  	if (pdm_dma_enable
> & 0x01) {
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  163
> 	pdm_dma_enable =3D 0x02;
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  164
> 	rn_writel(pdm_dma_enable, acp_base +
> ACP_WOV_PDM_DMA_ENABLE);
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  165
> 	pdm_dma_enable =3D 0x00;
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  166  		timeout =3D 0;
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  167  		while
> (++timeout < ACP_COUNTER) {
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  168
> 	pdm_dma_enable =3D rn_readl(acp_base +
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  169
> 			  ACP_WOV_PDM_DMA_ENABLE);
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  170  			if
> ((pdm_dma_enable & 0x02) =3D=3D 0x00)
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  171
> 	break;
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  172
> 	udelay(DELAY_US);
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  173  		}
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  174  		if (timeout =3D=3D
> ACP_COUNTER)
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  175
> 	return -ETIMEDOUT;
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  176  	}
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  177  	if (pdm_enable =3D=3D
> ACP_PDM_ENABLE) {
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  178  		pdm_enable
> =3D ACP_PDM_DISABLE;
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  179
> 	rn_writel(pdm_enable, acp_base + ACP_WOV_PDM_ENABLE);
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  180  	}
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  181  	rn_writel(0x01,
> acp_base + ACP_WOV_PDM_FIFO_FLUSH);
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  182  	return 0;
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  183  }
> 041ae75cda4ae70 Vijendar Mukunda 2020-05-19  184
> =

> :::::: The code at line 153 was first introduced by commit
> :::::: 041ae75cda4ae7035ab23ccf422dc5229871e720 ASoC: amd: add ACP PDM
> DMA driver dai ops
> =

> :::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> :::::: CC: 0day robot <lkp@intel.com>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.01
> .org%2Fhyperkitty%2Flist%2Fkbuild-
> all%40lists.01.org&amp;data=3D02%7C01%7CVijendar.Mukunda%40amd.com%7
> C5b44e0b07699447dc1a108d7fbec2252%7C3dd8961fe4884e608e11a82d994e1
> 83d%7C0%7C0%7C637254864058083221&amp;sdata=3D89pbq33S9cUGVVRCvvy
> bh%2FRLeZ0m0ZUxj%2BA8RCm0rxc%3D&amp;reserved=3D0
--===============4367986907325432764==--


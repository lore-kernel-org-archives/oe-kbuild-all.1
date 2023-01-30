Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F557323D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675090568; x=1706626568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HOglHh4Rvjibz9O//rh2/JK+FybY90BWwIdozpyXjLA=;
  b=RFCnZQtiopHaEOKxHEBFXNxmdSQ1qyXzRhjPmluurGNzEdQs8jLNoqgQ
   9yP2E2pIQ+oQUScKUMl+ehbNQTXoVLKmlY0TE+eR4rm4PzBrTj5p8nj39
   1DvWyUzNQtjjILWR0/glZcpYf1iCJogJd2j9Zm6bduWFZgYnXMCnhA1Z7
   uh9PK5NDZD9Oe2nf1hWPPoshVOa2JWidiSpaWam2lLBGkpWpMhlIW15ql
   fS+F/+XCmsp5qGoCPDmldUPf69ZFHHHcKwFSfi/s95fyUhFrYMuRzVrnQ
   qLZgEFOL9+/X1O3eHwQ2LkXvmB5e98/nRhFFg6RUCtaHOx232LY+UON8t
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307225499"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="307225499"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 06:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="837991288"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="837991288"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Jan 2023 06:56:06 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMVZl-0003h4-1J;
	Mon, 30 Jan 2023 14:56:05 +0000
Date: Mon, 30 Jan 2023 22:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 34/62]
 drivers/mmc/host/sdhci-esdhc-imx.c:1166:31: error: implicit declaration of
 function 'cqhci_readl'; did you mean 'sdhci_readl'?
Message-ID: <202301302244.gMHam0L2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   6c45fd8472ed235c0a8d400ca5733f12301560f3
commit: 30f3bbabc75bfa914204127757a4b3dfd0a88921 [34/62] mmc: sdhci-esdhc-imx: clear pending interrupt and halt cqhci
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230130/202301302244.gMHam0L2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=30f3bbabc75bfa914204127757a4b3dfd0a88921
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.19
        git checkout 30f3bbabc75bfa914204127757a4b3dfd0a88921
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/mmc/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/mmc/host/sdhci-esdhc-imx.c: In function 'sdhci_esdhc_imx_hwinit':
>> drivers/mmc/host/sdhci-esdhc-imx.c:1166:31: error: implicit declaration of function 'cqhci_readl'; did you mean 'sdhci_readl'? [-Werror=implicit-function-declaration]
    1166 |                         tmp = cqhci_readl(cq_host, CQHCI_IS);
         |                               ^~~~~~~~~~~
         |                               sdhci_readl
   drivers/mmc/host/sdhci-esdhc-imx.c:1166:52: error: 'CQHCI_IS' undeclared (first use in this function)
    1166 |                         tmp = cqhci_readl(cq_host, CQHCI_IS);
         |                                                    ^~~~~~~~
   drivers/mmc/host/sdhci-esdhc-imx.c:1166:52: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/mmc/host/sdhci-esdhc-imx.c:1167:25: error: implicit declaration of function 'cqhci_writel'; did you mean 'sdhci_writel'? [-Werror=implicit-function-declaration]
    1167 |                         cqhci_writel(cq_host, tmp, CQHCI_IS);
         |                         ^~~~~~~~~~~~
         |                         sdhci_writel
>> drivers/mmc/host/sdhci-esdhc-imx.c:1168:47: error: 'CQHCI_HALT' undeclared (first use in this function)
    1168 |                         cqhci_writel(cq_host, CQHCI_HALT, CQHCI_CTL);
         |                                               ^~~~~~~~~~
>> drivers/mmc/host/sdhci-esdhc-imx.c:1168:59: error: 'CQHCI_CTL' undeclared (first use in this function)
    1168 |                         cqhci_writel(cq_host, CQHCI_HALT, CQHCI_CTL);
         |                                                           ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +1166 drivers/mmc/host/sdhci-esdhc-imx.c

  1090	
  1091	static void sdhci_esdhc_imx_hwinit(struct sdhci_host *host)
  1092	{
  1093		struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
  1094		struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
  1095		struct cqhci_host *cq_host = host->mmc->cqe_private;
  1096		int tmp;
  1097	
  1098		if (esdhc_is_usdhc(imx_data)) {
  1099			/*
  1100			 * The imx6q ROM code will change the default watermark
  1101			 * level setting to something insane.  Change it back here.
  1102			 */
  1103			writel(ESDHC_WTMK_DEFAULT_VAL, host->ioaddr + ESDHC_WTMK_LVL);
  1104	
  1105			/*
  1106			 * ROM code will change the bit burst_length_enable setting
  1107			 * to zero if this usdhc is chosen to boot system. Change
  1108			 * it back here, otherwise it will impact the performance a
  1109			 * lot. This bit is used to enable/disable the burst length
  1110			 * for the external AHB2AXI bridge. It's useful especially
  1111			 * for INCR transfer because without burst length indicator,
  1112			 * the AHB2AXI bridge does not know the burst length in
  1113			 * advance. And without burst length indicator, AHB INCR
  1114			 * transfer can only be converted to singles on the AXI side.
  1115			 */
  1116			writel(readl(host->ioaddr + SDHCI_HOST_CONTROL)
  1117				| ESDHC_BURST_LEN_EN_INCR,
  1118				host->ioaddr + SDHCI_HOST_CONTROL);
  1119	
  1120			/*
  1121			 * erratum ESDHC_FLAG_ERR004536 fix for MX6Q TO1.2 and MX6DL
  1122			 * TO1.1, it's harmless for MX6SL
  1123			 */
  1124			writel(readl(host->ioaddr + 0x6c) & ~BIT(7),
  1125				host->ioaddr + 0x6c);
  1126	
  1127			/* disable DLL_CTRL delay line settings */
  1128			writel(0x0, host->ioaddr + ESDHC_DLL_CTRL);
  1129	
  1130			if (imx_data->socdata->flags & ESDHC_FLAG_STD_TUNING) {
  1131				tmp = readl(host->ioaddr + ESDHC_TUNING_CTRL);
  1132				tmp |= ESDHC_STD_TUNING_EN |
  1133					ESDHC_TUNING_START_TAP_DEFAULT;
  1134				if (imx_data->boarddata.tuning_start_tap) {
  1135					tmp &= ~ESDHC_TUNING_START_TAP_MASK;
  1136					tmp |= imx_data->boarddata.tuning_start_tap;
  1137				}
  1138	
  1139				if (imx_data->boarddata.tuning_step) {
  1140					tmp &= ~ESDHC_TUNING_STEP_MASK;
  1141					tmp |= imx_data->boarddata.tuning_step
  1142						<< ESDHC_TUNING_STEP_SHIFT;
  1143				}
  1144				writel(tmp, host->ioaddr + ESDHC_TUNING_CTRL);
  1145			} else if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING) {
  1146				/*
  1147				 * ESDHC_STD_TUNING_EN may be configed in bootloader
  1148				 * or ROM code, so clear this bit here to make sure
  1149				 * the manual tuning can work.
  1150				 */
  1151				tmp = readl(host->ioaddr + ESDHC_TUNING_CTRL);
  1152				tmp &= ~ESDHC_STD_TUNING_EN;
  1153				writel(tmp, host->ioaddr + ESDHC_TUNING_CTRL);
  1154			}
  1155	
  1156			/*
  1157			 * On i.MX8MM, we are running Dual Linux OS, with 1st Linux using SD Card
  1158			 * as rootfs storage, 2nd Linux using eMMC as rootfs storage. We let the
  1159			 * the 1st linux configure power/clock for the 2nd Linux.
  1160			 *
  1161			 * When the 2nd Linux is booting into rootfs stage, we let the 1st Linux
  1162			 * to destroy the 2nd linux, then restart the 2nd linux, we met SDHCI dump.
  1163			 * After we clear the pending interrupt and halt CQCTL, issue gone.
  1164			 */
  1165			if (cq_host) {
> 1166				tmp = cqhci_readl(cq_host, CQHCI_IS);
> 1167				cqhci_writel(cq_host, tmp, CQHCI_IS);
> 1168				cqhci_writel(cq_host, CQHCI_HALT, CQHCI_CTL);
  1169			}
  1170		}
  1171	}
  1172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

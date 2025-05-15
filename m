Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3C31F4163
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 19:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335858; cv=none; b=egkFz005gZx1vpdkWFSDoDPXlgH3rIn7Xb+sHPgV95N7T4oaEAjlJGUPX/rsMn5pS4o+K1ngR4Ohm5yNT9gaNJfIPV4jOuRZ/xioPBOsBSCbqYRdSUWAopHjeSP/5bEWG+/V4rqk+UVdcAoi1Lxq+BQXOm8VduNzZceWHkpRltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335858; c=relaxed/simple;
	bh=vvUnE1RnxrLb9PPGQ0k+CcHDBa52OL+fp51mXGNBjl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BaUeNDchCWTa8lOVgd5rTiiABRw13Qon1b+iaFXBNQJuMBXjkAiRQj7LGJvvpX6Oz4e2YsoZHvglv/GbhvPcJNO3Y3dEGZ+BMaYCWuGeiE+m37q1WOSMvtESbZqmCmKDIjpAiDd3+T4lH+koru/+kn60MVS8NGnwVXqEoX/nqUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8L2xnCK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8L2xnCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747335857; x=1778871857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vvUnE1RnxrLb9PPGQ0k+CcHDBa52OL+fp51mXGNBjl4=;
  b=j8L2xnCK7nVcymsNtmRK28+GBG9oy7thQNy75x+mtiwwralmr5oog+K4
   W4C0NpVpLJhkUjfQXuF5WQhmDIzVPskOuLUJFpKF2CNrHVBEemz0vJ7Sg
   KB+YiFchkbjzzK6kxn7uF2uCZxXIQ+UmBWSyVogh2HGk1rA9wuxxoKOQT
   pbE2spZ9SeSwFlU4KwMNXtDA5ZtvtAAVE0ovTbj+Cd3nzItFy72RJGgti
   SqlbvBuXX/KoUuddCNVfog4Eb6KxThpDewmQbX0k/6S15YUk6FpJtGcc0
   Ckzh55T1QLZ8SgrOGD56gRsT3eSxo2rWzT3btpedfhg0q152LANBqjozN
   Q==;
X-CSE-ConnectionGUID: W6Vf05aHTQWxO2RUNlg7RQ==
X-CSE-MsgGUID: 0hY8qm+2R8Gxi1RFK1eTTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="36908117"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="36908117"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 12:04:15 -0700
X-CSE-ConnectionGUID: fI1eXSrARMCNVmTJ9yh1jg==
X-CSE-MsgGUID: a5/RK58wTBuJ5b58YjQb/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="169394610"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 May 2025 12:04:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFdsJ-000Ifn-0g;
	Thu, 15 May 2025 19:04:11 +0000
Date: Fri, 16 May 2025 03:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Luke Wang <ziniu.wang_1@nxp.com>
Subject: [linux-next:master 4533/11093]
 drivers/mmc/host/sdhci-esdhc-imx.c:1566 sdhci_esdhc_imx_hwinit() warn:
 inconsistent indenting
Message-ID: <202505160225.Csr5USfq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   484803582c77061b470ac64a634f25f89715be3f
commit: 472b8a44fb34cab4e74aee1c20f835a475c15377 [4533/11093] mmc: sdhci-esdhc-imx: widen auto-tuning window for standard tuning
config: sparc-randconfig-r073-20250515 (https://download.01.org/0day-ci/archive/20250516/202505160225.Csr5USfq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160225.Csr5USfq-lkp@intel.com/

New smatch warnings:
drivers/mmc/host/sdhci-esdhc-imx.c:1566 sdhci_esdhc_imx_hwinit() warn: inconsistent indenting

Old smatch warnings:
drivers/mmc/host/sdhci-esdhc-imx.c:1251 esdhc_executing_tuning() error: uninitialized symbol 'target_min'.
drivers/mmc/host/sdhci-esdhc-imx.c:1251 esdhc_executing_tuning() error: uninitialized symbol 'target_max'.

vim +1566 drivers/mmc/host/sdhci-esdhc-imx.c

  1478	
  1479	static void sdhci_esdhc_imx_hwinit(struct sdhci_host *host)
  1480	{
  1481		struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
  1482		struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
  1483		struct cqhci_host *cq_host = host->mmc->cqe_private;
  1484		u32 tmp;
  1485	
  1486		if (esdhc_is_usdhc(imx_data)) {
  1487			/*
  1488			 * The imx6q ROM code will change the default watermark
  1489			 * level setting to something insane.  Change it back here.
  1490			 */
  1491			writel(ESDHC_WTMK_DEFAULT_VAL, host->ioaddr + ESDHC_WTMK_LVL);
  1492	
  1493			/*
  1494			 * ROM code will change the bit burst_length_enable setting
  1495			 * to zero if this usdhc is chosen to boot system. Change
  1496			 * it back here, otherwise it will impact the performance a
  1497			 * lot. This bit is used to enable/disable the burst length
  1498			 * for the external AHB2AXI bridge. It's useful especially
  1499			 * for INCR transfer because without burst length indicator,
  1500			 * the AHB2AXI bridge does not know the burst length in
  1501			 * advance. And without burst length indicator, AHB INCR
  1502			 * transfer can only be converted to singles on the AXI side.
  1503			 */
  1504			writel(readl(host->ioaddr + SDHCI_HOST_CONTROL)
  1505				| ESDHC_BURST_LEN_EN_INCR,
  1506				host->ioaddr + SDHCI_HOST_CONTROL);
  1507	
  1508			/*
  1509			 * erratum ESDHC_FLAG_ERR004536 fix for MX6Q TO1.2 and MX6DL
  1510			 * TO1.1, it's harmless for MX6SL
  1511			 */
  1512			if (!(imx_data->socdata->flags & ESDHC_FLAG_SKIP_ERR004536)) {
  1513				writel(readl(host->ioaddr + 0x6c) & ~BIT(7),
  1514					host->ioaddr + 0x6c);
  1515			}
  1516	
  1517			/* disable DLL_CTRL delay line settings */
  1518			writel(0x0, host->ioaddr + ESDHC_DLL_CTRL);
  1519	
  1520			/*
  1521			 * For the case of command with busy, if set the bit
  1522			 * ESDHC_VEND_SPEC2_EN_BUSY_IRQ, USDHC will generate a
  1523			 * transfer complete interrupt when busy is deasserted.
  1524			 * When CQHCI use DCMD to send a CMD need R1b respons,
  1525			 * CQHCI require to set ESDHC_VEND_SPEC2_EN_BUSY_IRQ,
  1526			 * otherwise DCMD will always meet timeout waiting for
  1527			 * hardware interrupt issue.
  1528			 */
  1529			if (imx_data->socdata->flags & ESDHC_FLAG_CQHCI) {
  1530				tmp = readl(host->ioaddr + ESDHC_VEND_SPEC2);
  1531				tmp |= ESDHC_VEND_SPEC2_EN_BUSY_IRQ;
  1532				writel(tmp, host->ioaddr + ESDHC_VEND_SPEC2);
  1533	
  1534				host->quirks &= ~SDHCI_QUIRK_NO_BUSY_IRQ;
  1535			}
  1536	
  1537			if (imx_data->socdata->flags & ESDHC_FLAG_STD_TUNING) {
  1538				tmp = readl(host->ioaddr + ESDHC_TUNING_CTRL);
  1539				tmp |= ESDHC_STD_TUNING_EN;
  1540	
  1541				/*
  1542				 * ROM code or bootloader may config the start tap
  1543				 * and step, unmask them first.
  1544				 */
  1545				tmp &= ~(ESDHC_TUNING_START_TAP_MASK | ESDHC_TUNING_STEP_MASK);
  1546				if (imx_data->boarddata.tuning_start_tap)
  1547					tmp |= imx_data->boarddata.tuning_start_tap;
  1548				else
  1549					tmp |= ESDHC_TUNING_START_TAP_DEFAULT;
  1550	
  1551				if (imx_data->boarddata.tuning_step) {
  1552					tmp |= imx_data->boarddata.tuning_step
  1553						<< ESDHC_TUNING_STEP_SHIFT;
  1554				} else {
  1555					tmp |= ESDHC_TUNING_STEP_DEFAULT
  1556						<< ESDHC_TUNING_STEP_SHIFT;
  1557				}
  1558	
  1559				/*
  1560				 * Config the tuning window to the hardware suggested value 3.
  1561				 * This tuning window is used for auto tuning logic. The default
  1562				 * tuning window is 2, here change to 3 make the window a bit
  1563				 * wider, give auto tuning enough space to handle the sample
  1564				 * point shift cause by temperature change.
  1565				 */
> 1566				 tmp &= ~ESDHC_TUNING_WINDOW_MASK;
  1567				 tmp |= FIELD_PREP(ESDHC_TUNING_WINDOW_MASK, ESDHC_AUTO_TUNING_WINDOW);
  1568	
  1569				/* Disable the CMD CRC check for tuning, if not, need to
  1570				 * add some delay after every tuning command, because
  1571				 * hardware standard tuning logic will directly go to next
  1572				 * step once it detect the CMD CRC error, will not wait for
  1573				 * the card side to finally send out the tuning data, trigger
  1574				 * the buffer read ready interrupt immediately. If usdhc send
  1575				 * the next tuning command some eMMC card will stuck, can't
  1576				 * response, block the tuning procedure or the first command
  1577				 * after the whole tuning procedure always can't get any response.
  1578				 */
  1579				tmp |= ESDHC_TUNING_CMD_CRC_CHECK_DISABLE;
  1580				writel(tmp, host->ioaddr + ESDHC_TUNING_CTRL);
  1581			} else if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING) {
  1582				/*
  1583				 * ESDHC_STD_TUNING_EN may be configured in bootloader
  1584				 * or ROM code, so clear this bit here to make sure
  1585				 * the manual tuning can work.
  1586				 */
  1587				tmp = readl(host->ioaddr + ESDHC_TUNING_CTRL);
  1588				tmp &= ~ESDHC_STD_TUNING_EN;
  1589				writel(tmp, host->ioaddr + ESDHC_TUNING_CTRL);
  1590			}
  1591	
  1592			/*
  1593			 * On i.MX8MM, we are running Dual Linux OS, with 1st Linux using SD Card
  1594			 * as rootfs storage, 2nd Linux using eMMC as rootfs storage. We let
  1595			 * the 1st linux configure power/clock for the 2nd Linux.
  1596			 *
  1597			 * When the 2nd Linux is booting into rootfs stage, we let the 1st Linux
  1598			 * to destroy the 2nd linux, then restart the 2nd linux, we met SDHCI dump.
  1599			 * After we clear the pending interrupt and halt CQCTL, issue gone.
  1600			 */
  1601			if (cq_host) {
  1602				tmp = cqhci_readl(cq_host, CQHCI_IS);
  1603				cqhci_writel(cq_host, tmp, CQHCI_IS);
  1604				cqhci_writel(cq_host, CQHCI_HALT, CQHCI_CTL);
  1605			}
  1606		}
  1607	}
  1608	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

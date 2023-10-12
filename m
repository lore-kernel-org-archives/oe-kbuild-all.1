Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232761D559
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNrLZfZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697099669; x=1728635669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MMMU7n97tYEgOWKQU4f/4vngMq27JmnCH0L5OFs5tog=;
  b=CNrLZfZ9q+9bkzgWhIDkJxLYHJYTP+VSeb0h+YgU6Tgo4CwqlZ79R8Bo
   WXDsVXWg3f9LcmCtxZlEc8PewFdcJrkQDyBIDMSM+uN7aZ2M21NOgSao7
   8qvfeAQDhpLMkDm8vqySz9qEdceetRTo/WtWH8nALzWqgwEzfEaXEV/Is
   fS4mja3hZU5rDuAllPQTPdIa6h5T9CtjPWFK6VodudLWQBQEhB973IOE1
   OK8qYj0Se2851Y2e8MKbLffCpCE7oe3zmffLgql0Z+duSUx6VgkFQf8rg
   ay2txULs/RM9zxgoJ8n0JxrlozfLAOD6mEaD205jrhJOBL/PvewPQL3Zq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="387703207"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="387703207"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 01:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="783606149"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="783606149"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2023 01:34:23 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqr9A-0003KX-2j;
	Thu, 12 Oct 2023 08:34:20 +0000
Date: Thu, 12 Oct 2023 16:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linusw-pinctrl:ib-no-global-numberspace 6/66] checkpatch: ERROR:
 Macros with complex values should be enclosed in parentheses
Message-ID: <202310121655.YbjOcId5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-no-global-numberspace
head:   c341ac65bf2bf297a6e4db61c34c00971876fad6
commit: acf4884a571709cad99f98aabe08b7cacd62dc80 [6/66] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121655.YbjOcId5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121655.YbjOcId5-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#665: FILE: drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:607:
+#define NPCM8XX_GRPS \
+	NPCM8XX_GRP(gpi36), \
+	NPCM8XX_GRP(gpi35), \
+	NPCM8XX_GRP(tp_jtag3), \
+	NPCM8XX_GRP(tp_uart), \
+	NPCM8XX_GRP(tp_smb2), \
+	NPCM8XX_GRP(tp_smb1), \
+	NPCM8XX_GRP(tp_gpio7), \
+	NPCM8XX_GRP(tp_gpio6), \
+	NPCM8XX_GRP(tp_gpio5), \
+	NPCM8XX_GRP(tp_gpio4), \
+	NPCM8XX_GRP(tp_gpio3), \
+	NPCM8XX_GRP(tp_gpio2), \
+	NPCM8XX_GRP(tp_gpio1), \
+	NPCM8XX_GRP(tp_gpio0), \
+	NPCM8XX_GRP(tp_gpio2b), \
+	NPCM8XX_GRP(tp_gpio1b), \
+	NPCM8XX_GRP(tp_gpio0b), \
+	NPCM8XX_GRP(vgadig), \
+	NPCM8XX_GRP(nbu1crts), \
+	NPCM8XX_GRP(fm2), \
+	NPCM8XX_GRP(fm1), \
+	NPCM8XX_GRP(fm0), \
+	NPCM8XX_GRP(gpio1836), \
+	NPCM8XX_GRP(gpio1889), \
+	NPCM8XX_GRP(gpo187), \
+	NPCM8XX_GRP(cp1urxd), \
+	NPCM8XX_GRP(r3rxer), \
+	NPCM8XX_GRP(cp1gpio2c), \
+	NPCM8XX_GRP(cp1gpio3c), \
+	NPCM8XX_GRP(cp1gpio0b), \
+	NPCM8XX_GRP(cp1gpio1b), \
+	NPCM8XX_GRP(cp1gpio2b), \
+	NPCM8XX_GRP(cp1gpio3b), \
+	NPCM8XX_GRP(cp1gpio4b), \
+	NPCM8XX_GRP(cp1gpio5b), \
+	NPCM8XX_GRP(cp1gpio6b), \
+	NPCM8XX_GRP(cp1gpio7b), \
+	NPCM8XX_GRP(cp1gpio0), \
+	NPCM8XX_GRP(cp1gpio1), \
+	NPCM8XX_GRP(cp1gpio2), \
+	NPCM8XX_GRP(cp1gpio3), \
+	NPCM8XX_GRP(cp1gpio4), \
+	NPCM8XX_GRP(cp1gpio5), \
+	NPCM8XX_GRP(cp1gpio6), \
+	NPCM8XX_GRP(cp1gpio7), \
+	NPCM8XX_GRP(cp1utxd), \
+	NPCM8XX_GRP(spi1cs3), \
+	NPCM8XX_GRP(spi1cs2), \
+	NPCM8XX_GRP(spi1cs1), \
+	NPCM8XX_GRP(spi1cs0), \
+	NPCM8XX_GRP(spi1d23), \
+	NPCM8XX_GRP(j2j3), \
+	NPCM8XX_GRP(r3oen), \
+	NPCM8XX_GRP(r2oen), \
+	NPCM8XX_GRP(r1oen), \
+	NPCM8XX_GRP(bu4b), \
+	NPCM8XX_GRP(bu4), \
+	NPCM8XX_GRP(bu5b), \
+	NPCM8XX_GRP(bu5), \
+	NPCM8XX_GRP(bu6), \
+	NPCM8XX_GRP(rmii3), \
+	NPCM8XX_GRP(jm1), \
+	NPCM8XX_GRP(jm2), \
+	NPCM8XX_GRP(tpgpio5b), \
+	NPCM8XX_GRP(tpgpio4b), \
+	NPCM8XX_GRP(clkrun), \
+	NPCM8XX_GRP(i3c5), \
+	NPCM8XX_GRP(i3c4), \
+	NPCM8XX_GRP(i3c3), \
+	NPCM8XX_GRP(i3c2), \
+	NPCM8XX_GRP(i3c1), \
+	NPCM8XX_GRP(i3c0), \
+	NPCM8XX_GRP(hsi1a), \
+	NPCM8XX_GRP(hsi2a), \
+	NPCM8XX_GRP(hsi1b), \
+	NPCM8XX_GRP(hsi2b), \
+	NPCM8XX_GRP(hsi1c), \
+	NPCM8XX_GRP(hsi2c), \
+	NPCM8XX_GRP(smb0), \
+	NPCM8XX_GRP(smb0b), \
+	NPCM8XX_GRP(smb0c), \
+	NPCM8XX_GRP(smb0d), \
+	NPCM8XX_GRP(smb0den), \
+	NPCM8XX_GRP(smb1), \
+	NPCM8XX_GRP(smb1b), \
+	NPCM8XX_GRP(smb1c), \
+	NPCM8XX_GRP(smb1d), \
+	NPCM8XX_GRP(smb2), \
+	NPCM8XX_GRP(smb2b), \
+	NPCM8XX_GRP(smb2c), \
+	NPCM8XX_GRP(smb2d), \
+	NPCM8XX_GRP(smb3), \
+	NPCM8XX_GRP(smb3b), \
+	NPCM8XX_GRP(smb3c), \
+	NPCM8XX_GRP(smb3d), \
+	NPCM8XX_GRP(smb4), \
+	NPCM8XX_GRP(smb4b), \
+	NPCM8XX_GRP(smb4c), \
+	NPCM8XX_GRP(smb4d), \
+	NPCM8XX_GRP(smb4den), \
+	NPCM8XX_GRP(smb5), \
+	NPCM8XX_GRP(smb5b), \
+	NPCM8XX_GRP(smb5c), \
+	NPCM8XX_GRP(smb5d), \
+	NPCM8XX_GRP(ga20kbc), \
+	NPCM8XX_GRP(smb6), \
+	NPCM8XX_GRP(smb6b), \
+	NPCM8XX_GRP(smb6c), \
+	NPCM8XX_GRP(smb6d), \
+	NPCM8XX_GRP(smb7), \
+	NPCM8XX_GRP(smb7b), \
+	NPCM8XX_GRP(smb7c), \
+	NPCM8XX_GRP(smb7d), \
+	NPCM8XX_GRP(smb8), \
+	NPCM8XX_GRP(smb9), \
+	NPCM8XX_GRP(smb10), \
+	NPCM8XX_GRP(smb11), \
+	NPCM8XX_GRP(smb12), \
+	NPCM8XX_GRP(smb13), \
+	NPCM8XX_GRP(smb14), \
+	NPCM8XX_GRP(smb14b), \
+	NPCM8XX_GRP(smb15), \
+	NPCM8XX_GRP(smb15b), \
+	NPCM8XX_GRP(smb16), \
+	NPCM8XX_GRP(smb16b), \
+	NPCM8XX_GRP(smb17), \
+	NPCM8XX_GRP(smb18), \
+	NPCM8XX_GRP(smb19), \
+	NPCM8XX_GRP(smb20), \
+	NPCM8XX_GRP(smb21), \
+	NPCM8XX_GRP(smb22), \
+	NPCM8XX_GRP(smb23), \
+	NPCM8XX_GRP(smb23b), \
+	NPCM8XX_GRP(fanin0), \
+	NPCM8XX_GRP(fanin1), \
+	NPCM8XX_GRP(fanin2), \
+	NPCM8XX_GRP(fanin3), \
+	NPCM8XX_GRP(fanin4), \
+	NPCM8XX_GRP(fanin5), \
+	NPCM8XX_GRP(fanin6), \
+	NPCM8XX_GRP(fanin7), \
+	NPCM8XX_GRP(fanin8), \
+	NPCM8XX_GRP(fanin9), \
+	NPCM8XX_GRP(fanin10), \
+	NPCM8XX_GRP(fanin11), \
+	NPCM8XX_GRP(fanin12), \
+	NPCM8XX_GRP(fanin13), \
+	NPCM8XX_GRP(fanin14), \
+	NPCM8XX_GRP(fanin15), \
+	NPCM8XX_GRP(faninx), \
+	NPCM8XX_GRP(pwm0), \
+	NPCM8XX_GRP(pwm1), \
+	NPCM8XX_GRP(pwm2), \
+	NPCM8XX_GRP(pwm3), \
+	NPCM8XX_GRP(pwm4), \
+	NPCM8XX_GRP(pwm5), \
+	NPCM8XX_GRP(pwm6), \
+	NPCM8XX_GRP(pwm7), \
+	NPCM8XX_GRP(pwm8), \
+	NPCM8XX_GRP(pwm9), \
+	NPCM8XX_GRP(pwm10), \
+	NPCM8XX_GRP(pwm11), \
+	NPCM8XX_GRP(sg1mdio), \
+	NPCM8XX_GRP(rg2), \
+	NPCM8XX_GRP(rg2mdio), \
+	NPCM8XX_GRP(ddr), \
+	NPCM8XX_GRP(uart1), \
+	NPCM8XX_GRP(uart2), \
+	NPCM8XX_GRP(bmcuart0a), \
+	NPCM8XX_GRP(bmcuart0b), \
+	NPCM8XX_GRP(bmcuart1), \
+	NPCM8XX_GRP(iox1), \
+	NPCM8XX_GRP(iox2), \
+	NPCM8XX_GRP(ioxh), \
+	NPCM8XX_GRP(gspi), \
+	NPCM8XX_GRP(mmc), \
+	NPCM8XX_GRP(mmcwp), \
+	NPCM8XX_GRP(mmccd), \
+	NPCM8XX_GRP(mmcrst), \
+	NPCM8XX_GRP(mmc8), \
+	NPCM8XX_GRP(r1), \
+	NPCM8XX_GRP(r1err), \
+	NPCM8XX_GRP(r1md), \
+	NPCM8XX_GRP(r2), \
+	NPCM8XX_GRP(r2err), \
+	NPCM8XX_GRP(r2md), \
+	NPCM8XX_GRP(sd1), \
+	NPCM8XX_GRP(sd1pwr), \
+	NPCM8XX_GRP(wdog1), \
+	NPCM8XX_GRP(wdog2), \
+	NPCM8XX_GRP(scipme), \
+	NPCM8XX_GRP(smi), \
+	NPCM8XX_GRP(serirq), \
+	NPCM8XX_GRP(jtag2), \
+	NPCM8XX_GRP(spix), \
+	NPCM8XX_GRP(spixcs1), \
+	NPCM8XX_GRP(spi1), \
+	NPCM8XX_GRP(pspi), \
+	NPCM8XX_GRP(ddc), \
+	NPCM8XX_GRP(clkreq), \
+	NPCM8XX_GRP(clkout), \
+	NPCM8XX_GRP(spi3), \
+	NPCM8XX_GRP(spi3cs1), \
+	NPCM8XX_GRP(spi3quad), \
+	NPCM8XX_GRP(spi3cs2), \
+	NPCM8XX_GRP(spi3cs3), \
+	NPCM8XX_GRP(spi0cs1), \
+	NPCM8XX_GRP(lpc), \
+	NPCM8XX_GRP(lpcclk), \
+	NPCM8XX_GRP(espi), \
+	NPCM8XX_GRP(lkgpo0), \
+	NPCM8XX_GRP(lkgpo1), \
+	NPCM8XX_GRP(lkgpo2), \
+	NPCM8XX_GRP(nprd_smi), \
+	NPCM8XX_GRP(hgpio0), \
+	NPCM8XX_GRP(hgpio1), \
+	NPCM8XX_GRP(hgpio2), \
+	NPCM8XX_GRP(hgpio3), \
+	NPCM8XX_GRP(hgpio4), \
+	NPCM8XX_GRP(hgpio5), \
+	NPCM8XX_GRP(hgpio6), \
+	NPCM8XX_GRP(hgpio7), \
+	\
+

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

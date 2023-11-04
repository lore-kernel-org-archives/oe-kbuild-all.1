Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5247F8494
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 06:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIKl/5fR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699078899; x=1730614899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vLuonepy4F4VNphgk+hJeDK0gvtqyCr84AGhCt0Bxdc=;
  b=nIKl/5fRU5Y+3S28bAifXQSbk0glANiVlTS13bW0wg/JZut7mdrfqiAY
   qaRUIz8QNX3o1l2hOTahgcvZxTGniHhKE55c0ZpPpWQtVBYp08sPfcaYq
   1UoSiKDgeoUkH2ZK+03vce11QoXkKrvCwkrx1I06EsVRI8bA84UR278b1
   nhLESeousQIO4ozfeXuwycxTYVqrpGWStqGhsfnh2LtJ1vLiNEcyitSrJ
   PCsyu7nLRhjvVa9VGZiJfcJ/qVKM5f0/yOoxwpGQaRmU28VCUXpYiq0HW
   w1a39fsRrrrv/QMB0s67D0uwMALQZTU+sYeYgG+EDwo7PfvLMkA2wV07X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="386240113"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="386240113"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 23:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="905560053"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="905560053"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Nov 2023 23:21:37 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzA2I-0003Xx-2R;
	Sat, 04 Nov 2023 06:21:34 +0000
Date: Sat, 4 Nov 2023 14:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6.x+fslc 2/10] arch/arm/mach-imx/reboot.c:31:6:
 warning: no previous prototype for 'do_switch_recovery'
Message-ID: <202311041422.LKfjU2Ic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6.x+fslc
head:   34836895e19e910f736b06d7dbe522f4a33857f8
commit: fd23fe4e28e3b491a3851a0f320704d66bdf42da [2/10] MA-7633-2 [Android-Reboot]reboot to fastboot\recovery mode
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041422.LKfjU2Ic-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041422.LKfjU2Ic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041422.LKfjU2Ic-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/reboot.c:31:6: warning: no previous prototype for 'do_switch_recovery' [-Wmissing-prototypes]
      31 | void do_switch_recovery(void)
         |      ^~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/reboot.c:61:6: warning: no previous prototype for 'do_switch_fastboot' [-Wmissing-prototypes]
      61 | void do_switch_fastboot(void)
         |      ^~~~~~~~~~~~~~~~~~


vim +/do_switch_recovery +31 arch/arm/mach-imx/reboot.c

    30	
  > 31	void do_switch_recovery(void)
    32	{
    33		u32 reg;
    34		void *addr;
    35		struct clk *snvs_root;
    36		if (cpu_is_imx6()) {
    37			addr = ioremap(MX6_SNVS_BASE_ADDR, MX6_SNVS_SIZE);
    38			if (!addr) {
    39				pr_warn("SNVS ioremap failed!\n");
    40				return;
    41			}
    42			reg = __raw_readl(addr + MX6_SNVS_LPGPR);
    43			reg |= ANDROID_RECOVERY_BOOT;
    44			__raw_writel(reg, (addr + MX6_SNVS_LPGPR));
    45		} else {
    46			snvs_root = clk_get_sys("imx-snvs.0", "snvs");
    47			addr = ioremap(MX7_SNVS_BASE_ADDR, MX7_SNVS_SIZE);
    48			if (!addr) {
    49				pr_warn("SNVS ioremap failed!\n");
    50				return;
    51			}
    52			clk_enable(snvs_root);
    53			reg = __raw_readl(addr + MX7_SNVS_LPGPR);
    54			reg |= ANDROID_RECOVERY_BOOT;
    55			__raw_writel(reg, (addr + MX7_SNVS_LPGPR));
    56			clk_disable(snvs_root);
    57		}
    58		iounmap(addr);
    59	}
    60	
  > 61	void do_switch_fastboot(void)
    62	{
    63		u32 reg;
    64		void *addr;
    65		struct clk *snvs_root;
    66		if (cpu_is_imx6()) {
    67			addr = ioremap(MX6_SNVS_BASE_ADDR, MX6_SNVS_SIZE);
    68			if (!addr) {
    69				pr_warn("SNVS ioremap failed!\n");
    70				return;
    71			}
    72			reg = __raw_readl(addr + MX6_SNVS_LPGPR);
    73			reg |= ANDROID_FASTBOOT_BOOT;
    74			__raw_writel(reg, addr + MX6_SNVS_LPGPR);
    75		} else {
    76			snvs_root = clk_get_sys("imx-snvs.0", "snvs");
    77			addr = ioremap(MX7_SNVS_BASE_ADDR, MX7_SNVS_SIZE);
    78			if (!addr) {
    79				pr_warn("SNVS ioremap failed!\n");
    80				return;
    81			}
    82			clk_enable(snvs_root);
    83			reg = __raw_readl(addr + MX7_SNVS_LPGPR);
    84			reg |= ANDROID_FASTBOOT_BOOT;
    85			__raw_writel(reg, addr + MX7_SNVS_LPGPR);
    86			clk_disable(snvs_root);
    87		}
    88		iounmap(addr);
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

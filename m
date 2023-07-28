Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C3A525C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 23:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690588127; x=1722124127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S9IBxkNG+RbHBQj2Nn9W+yro3ABRrGiQH5vd15aoFAA=;
  b=HqkINuSEAqBft6jz363e1RZsoMsyUsCT5X878Q9yCn8cZP9bKaMfifRu
   1LfT/j9sVY26Fk++Gs+EQcMfdAycXnVlOfqIOq0oZq+YryjRc21b6Aicr
   5Sx6Tk+Brap66i274jA1DTQeVtnny6ytt6SOnHCvs38M5L1vT4um83SeP
   EMqHxjDjgwfl8TqmrM6Outq4a1VFTgWfc+Z3cimw3a+jpLqewdIhdQlGH
   Bzl+CS8cGtxr3hLBs/yVk03QlhKnIqWfCVWmz49B5ORPJCeRCs/Pah3+e
   y4db6sOOSaM+RdG8C/9PvNsCjtpKgsDy53XeA8xWSz50PrVa/vc+v3oki
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="367590265"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="367590265"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 16:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="793075782"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="793075782"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jul 2023 16:48:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPXC3-0003fp-12;
	Fri, 28 Jul 2023 23:48:28 +0000
Date: Sat, 29 Jul 2023 07:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Stanley Chang <stanley_chang@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-next 26/67] drivers/phy/realtek/phy-rtk-usb2.c:715:
 undefined reference to `usb_debug_root'
Message-ID: <202307290733.weSlHrGp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   ba0b3af706305e5b11fd832eecd2c4a7fce57156
commit: 134e6d25f6bd06071e5aac0a7eefcea6f7713955 [26/67] phy: realtek: usb: Add driver for the Realtek SoC USB 2.0 PHY
config: openrisc-randconfig-r005-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290733.weSlHrGp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290733.weSlHrGp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290733.weSlHrGp-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/phy/realtek/phy-rtk-usb2.o: in function `create_phy_debug_root':
>> drivers/phy/realtek/phy-rtk-usb2.c:715: undefined reference to `usb_debug_root'
>> or1k-linux-ld: drivers/phy/realtek/phy-rtk-usb2.c:715: undefined reference to `usb_debug_root'
   or1k-linux-ld: drivers/phy/realtek/phy-rtk-usb2.c:717: undefined reference to `usb_debug_root'
   pahole: .tmp_vmlinux.btf: Invalid argument
   .btf.vmlinux.bin.o: file not recognized: file format not recognized


vim +715 drivers/phy/realtek/phy-rtk-usb2.c

   709	
   710	#ifdef CONFIG_DEBUG_FS
   711	static struct dentry *create_phy_debug_root(void)
   712	{
   713		struct dentry *phy_debug_root;
   714	
 > 715		phy_debug_root = debugfs_lookup("phy", usb_debug_root);
   716		if (!phy_debug_root)
   717			phy_debug_root = debugfs_create_dir("phy", usb_debug_root);
   718	
   719		return phy_debug_root;
   720	}
   721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

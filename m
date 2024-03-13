Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC601626B9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 17:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710350523; cv=none; b=hqe4ItRho1ZcmfmpoysJJ7TKg9HLJDDVOE5hZLgJqi+58sJwmRNll0oOQYqaQ+kNRkaJjR8ceW4yafPi56I0+my/qjvm+a2W99Fr6ZpR/+pCY8XXTIDPVEA9byypmOD9FILPgkcwpe15PhngdKpZJ6LCToPlL52vG5vH6MceNLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710350523; c=relaxed/simple;
	bh=Z5t+3dExT9vzF855hLau0FAnG53fIUyONdtaExctD7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EMWzZONiORL5ysUybaIR4qZSQ3W6BorPU2QLmlShaciLkM114wdYuLvuzXqGcEXEWgWkqq2I/2zzqahlwsPPPlF3vq56Ll/tthytGlVPJx1ewCSQCi4AyMnP493yS6/avbQ7TA9R7rpSZcYlgOWHensSotP4mc8IIsv3QvP1ojg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIObKx/i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIObKx/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710350521; x=1741886521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z5t+3dExT9vzF855hLau0FAnG53fIUyONdtaExctD7s=;
  b=iIObKx/iTjfJgDzSyTAHRi7keG3QvLPgQehMrFSIOZ0QQWBg2aG4GEg1
   L2XK23ZWkZwyVLkl2EfaffgfKboqNFokOGTMn+c+2Jorqwt2ldq7bPUr1
   afZa5YOAoofbm+CaJq32LBGc99eAXUcjbmvh7SriAJi+xHM0FE6DGL/2k
   GElKa5rUerIdch7oZcI3SAyROXWbJDzYmiwfbjhJrbGxXTNQPO0FS9G6S
   1XFmw06ndgkWEm3O25D5GW6sslHgzqwHYMoxp53UUXw0/YjHmEVbWj4tE
   itQ22UUMtkWcznY9gfAYVj+QfOP8fRAHJg9EYYh/uA3HTWbpwTgomlG4k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15770567"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="15770567"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 10:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="43011853"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Mar 2024 10:21:57 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkSId-000CcN-0A;
	Wed, 13 Mar 2024 17:21:55 +0000
Date: Thu, 14 Mar 2024 01:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/net/ethernet/intel/e1000e/intel/netdev.c:8120:9: error:
 implicit declaration of function 'e1000e_pm_thaw'; did you mean
 'e1000e_pm_freeze'?
Message-ID: <202403140139.QAJmQ6C3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   ef4270af264f76e609dfd098345acae7e024b403
commit: f219393fa69408fc55e023efbf174c3c0347abac driver: update e1000e to 3.8.4
date:   1 year ago
config: x86_64-randconfig-004-20240313 (https://download.01.org/0day-ci/archive/20240314/202403140139.QAJmQ6C3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140139.QAJmQ6C3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140139.QAJmQ6C3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers/net/ethernet/intel/e1000e/intel/netdev.c:6:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   drivers/net/ethernet/intel/e1000e/intel/netdev.c: In function 'e1000_io_resume':
>> drivers/net/ethernet/intel/e1000e/intel/netdev.c:8120:9: error: implicit declaration of function 'e1000e_pm_thaw'; did you mean 'e1000e_pm_freeze'? [-Werror=implicit-function-declaration]
    8120 |         e1000e_pm_thaw(&pdev->dev);
         |         ^~~~~~~~~~~~~~
         |         e1000e_pm_freeze
   drivers/net/ethernet/intel/e1000e/intel/netdev.c: At top level:
>> drivers/net/ethernet/intel/e1000e/intel/netdev.c:7261:13: warning: 'e1000e_s0ix_exit_flow' defined but not used [-Wunused-function]
    7261 | static void e1000e_s0ix_exit_flow(struct e1000_adapter *adapter)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/e1000e/intel/netdev.c:7129:13: warning: 'e1000e_s0ix_entry_flow' defined but not used [-Wunused-function]
    7129 | static void e1000e_s0ix_entry_flow(struct e1000_adapter *adapter)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +8120 drivers/net/ethernet/intel/e1000e/intel/netdev.c

^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8104  
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8105  /**
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8106   * e1000_io_resume - called when traffic can start flowing again.
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8107   * @pdev: Pointer to PCI device
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8108   *
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8109   * This callback is called when the error recovery driver tells us that
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8110   * its OK to resume normal operation. Implementation resembles the
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8111   * second-half of the e1000e_pm_resume routine.
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8112   */
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8113  static void e1000_io_resume(struct pci_dev *pdev)
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8114  {
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8115  	struct net_device *netdev = pci_get_drvdata(pdev);
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8116  	struct e1000_adapter *adapter = netdev_priv(netdev);
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8117  
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8118  	e1000_init_manageability_pt(adapter);
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8119  
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16 @8120  	e1000e_pm_thaw(&pdev->dev);
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8121  
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8122  	/* If the controller has AMT, do not set DRV_LOAD until the interface
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8123  	 * is up.  For all other cases, let the f/w know that the h/w is now
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8124  	 * under the control of the driver.
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8125  	 */
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8126  	if (!(adapter->flags & FLAG_HAS_AMT))
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8127  		e1000e_get_hw_control(adapter);
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8128  }
f219393fa69408 drivers/net/ethernet/intel/e1000e/intel/netdev.c caelli    2023-02-28  8129  #endif /* HAVE_PCI_ERS */
^590eaf1fec755 drivers/net/ethernet/intel/e1000e/netdev.c       Kaixu Xia 2021-03-16  8130  

:::::: The code at line 8120 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

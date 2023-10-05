Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86BB1170F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 13:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gvaa+0Xf"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696513347; x=1728049347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YFbslygQ4QMZwgwZtuxc5R9liMm86lQWzc9E8+sZhR8=;
  b=Gvaa+0XfjmLqhln0INCb/QHU5T4zyDNDvX2NvjFgBzrGZDbhJeIIgyrg
   qg+G+3+TjAG4xQzZ4yohD1J/S6Ke1JZoplgFHTaHPx7E3BDNLIuOQL8hE
   mWnltNgqk37XqS+CRg/TKjBg5QFt1fkHJHS343uG0pGSkiiXimeP0T3It
   /L3Qx69M/mLgtPUWSkYUuVJG4rYpDRRJFF49QKM7VpSLpRlHvq9pDMSAB
   RS19mMC+MzsHzKpKTKWsPjwdlW1JN+AN4Xyxczs9ULCKOa1TQ5gZap/DD
   P4zkjgVMUwRAxkCtrHtr44QeHlkjg4tWeihFQZYQeb1tcC0MwnxCs1VLJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="386331960"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="386331960"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 06:42:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="728455491"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="728455491"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Oct 2023 06:42:21 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoOcN-000LSq-1Y;
	Thu, 05 Oct 2023 13:42:19 +0000
Date: Thu, 5 Oct 2023 21:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-soc 7/14] drivers/soc/apple/rtkit.c:639:37:
 error: 'struct apple_rtkit' has no member named 'mbox_chan'
Message-ID: <202310052146.J9pi91Zs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/010-soc
head:   abc064b291ae70bd89dd4b95a587bd87c8b86585
commit: 818b34e17da79772d796cfbe9cb923f2025af007 [7/14] mailbox: apple: Delete driver
config: arm64-randconfig-001-20231005 (https://download.01.org/0day-ci/archive/20231005/202310052146.J9pi91Zs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310052146.J9pi91Zs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310052146.J9pi91Zs-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/apple/rtkit.c: In function 'apple_rtkit_send_message_wait':
>> drivers/soc/apple/rtkit.c:639:37: error: 'struct apple_rtkit' has no member named 'mbox_chan'
     639 |                 ret = mbox_flush(rtk->mbox_chan, timeout);
         |                                     ^~


vim +639 drivers/soc/apple/rtkit.c

9bd1d9a0d8bb1a Sven Peter 2022-05-01  626  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  627  int apple_rtkit_send_message_wait(struct apple_rtkit *rtk, u8 ep, u64 message,
9bd1d9a0d8bb1a Sven Peter 2022-05-01  628  				  unsigned long timeout, bool atomic)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  629  {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  630  	DECLARE_COMPLETION_ONSTACK(completion);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  631  	int ret;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  632  	long t;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  633  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  634  	ret = apple_rtkit_send_message(rtk, ep, message, &completion, atomic);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  635  	if (ret < 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  636  		return ret;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  637  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  638  	if (atomic) {
9bd1d9a0d8bb1a Sven Peter 2022-05-01 @639  		ret = mbox_flush(rtk->mbox_chan, timeout);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  640  		if (ret < 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  641  			return ret;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  642  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  643  		if (try_wait_for_completion(&completion))
9bd1d9a0d8bb1a Sven Peter 2022-05-01  644  			return 0;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  645  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  646  		return -ETIME;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  647  	} else {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  648  		t = wait_for_completion_interruptible_timeout(
9bd1d9a0d8bb1a Sven Peter 2022-05-01  649  			&completion, msecs_to_jiffies(timeout));
9bd1d9a0d8bb1a Sven Peter 2022-05-01  650  		if (t < 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  651  			return t;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  652  		else if (t == 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  653  			return -ETIME;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  654  		return 0;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  655  	}
9bd1d9a0d8bb1a Sven Peter 2022-05-01  656  }
9bd1d9a0d8bb1a Sven Peter 2022-05-01  657  EXPORT_SYMBOL_GPL(apple_rtkit_send_message_wait);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  658  

:::::: The code at line 639 was first introduced by commit
:::::: 9bd1d9a0d8bb1a549831fd98fcc3105960f7068b soc: apple: Add RTKit IPC library

:::::: TO: Sven Peter <sven@svenpeter.dev>
:::::: CC: Sven Peter <sven@svenpeter.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

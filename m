Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE72133E7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 21:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwMeCzd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698873959; x=1730409959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z4cvtj0Y2SRXvnYO8keNVhZh8I9AacirY1sSCjMmpjQ=;
  b=OwMeCzd1eIgogwuA7Y8UegjWFQv7vLiaGEFKB4OOGzdCLngXLiKhvTA9
   LUJjznOQdGCaP8IlPU0o9fuYUhKXOF+r9SpB+h4df0HCZTIg11CFHf89j
   xNLjw7+9Omvx/eOy6EqwJLl+u6lWzScIAizN0gh1NQ+q7hgZPo8HrgC7C
   IK2E64EzeXn0/9zX4hdZ+DzRONu5DvnGRwWpXfyHFGm8ID22yncNKDY0I
   nUdo5Y94K+oOzr/CajqUd91SPdDE+9OkBpfuQ90LUvjKAf3xz+tZ60tmu
   7hAQulLDz1fOpXndaz6lPMrXYuxFDK7hMXEAPEZXAhLBE2+O4QjkdO2C9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="368792975"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="368792975"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 14:25:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="8791383"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Nov 2023 14:25:58 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyIip-0000xg-14;
	Wed, 01 Nov 2023 21:25:55 +0000
Date: Thu, 2 Nov 2023 05:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-soc 6/15] drivers/soc/apple/rtkit.c:639:37:
 error: 'struct apple_rtkit' has no member named 'mbox_chan'
Message-ID: <202311020520.vQ4qXpEt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/010-soc
head:   41a44245cb63db3b411ae54a561946acbaad1517
commit: 6168774375dd26415946ceb1f8bed63adedda7dc [6/15] soc: apple: rtkit: Port to the internal mailbox driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231102/202311020520.vQ4qXpEt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311020520.vQ4qXpEt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311020520.vQ4qXpEt-lkp@intel.com/

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

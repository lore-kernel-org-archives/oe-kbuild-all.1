Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9826200B4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 17:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691082965; x=1722618965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=abnmQtC/jcZ/cT3qF61c7k8d0pNVyE7nuDOM3uWcksw=;
  b=ZM8SjNSbNhXxCJ/E9yM0UPmSRirq2pEwGUg1Y3Ql/B5tTd5hq8iJvSys
   iI7ZycztT1zg7jF41I6tSecu0rdNdUgR6Fnxhvuxcfv7j3SUvbeTyWB1p
   kn0D23WJk8CmbPJqq885RIc4wcpz63AJ5ZX9OqUCZtVH9kWpdVPh1Fuz2
   nFSUIGxI8y7An6Xz1RIH/zyqzWxHhAAuoaeYUi7E6ZWtglT4SIa/I/Ytz
   gozQZGdYO58Uv9O2F0VClNw8sTNN3Yi2edZUc+Vg8raRgAFlfp2lzIqa2
   kqxoJYl/6r8tWiYwHm1hXqyeQAYQkgsEt6YyjsCnznY7IKTEGLnnR2U0S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="400899115"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="400899115"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 10:15:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="732870171"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="732870171"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Aug 2023 10:15:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRbvL-0002FV-1M;
	Thu, 03 Aug 2023 17:15:43 +0000
Date: Fri, 4 Aug 2023 01:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-soc 6/12] drivers/soc/apple/rtkit.c:639:37:
 error: 'struct apple_rtkit' has no member named 'mbox_chan'
Message-ID: <202308040143.3RniuVPI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/010-soc
head:   1d78c04b8f6f12e0ef63a95d381a97eee5201ba7
commit: c354dae36471380b138804fcaeee26374ecbff66 [6/12] soc: apple: rtkit: Port to the internal mailbox driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230804/202308040143.3RniuVPI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040143.3RniuVPI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040143.3RniuVPI-lkp@intel.com/

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

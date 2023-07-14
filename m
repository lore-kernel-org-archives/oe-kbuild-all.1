Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869AD10946
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689328171; x=1720864171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=13xOOPf05I4rS8CRFqBS1vTZ67QH+FDSGnYV4sW7eIo=;
  b=WsaLOEc+uD8lejYqYxxYdbix7TWfQq26Xdh8JNzCCTl9Y3L0TprCGRZZ
   E+q9UqDZkyufUOiss/0WbcRuwJJpOqahMcDEkjJ1yBEMCzbJH0B43FBOg
   qddbFXJjIKEebtjjfC8NJ9wLz3viBz0kExIeDqf7mkhK9frvXUTk9aOuS
   ids+RjZjwUk6GhpSXPh0FeuMIAd/kVyB+gSeKmSdu3SbR5mnZLd/m1eQ4
   hXTrImF7hQXDv2XpBM7XhrLbVIMBPo71bzUfQ7SaPpNFDsy3bm/Vzq8t+
   Un1HhJ7zKUnn1FqzBPkAxlrpqBYxkKpAK12cz/nfjpKW9TFg9GifRVovR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364310912"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="364310912"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 02:49:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="1053002958"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="1053002958"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2023 02:49:29 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKFQW-0007M7-2l;
	Fri, 14 Jul 2023 09:49:28 +0000
Date: Fri, 14 Jul 2023 17:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-soc 7/12] drivers/soc/apple/rtkit.c:639:37:
 error: 'struct apple_rtkit' has no member named 'mbox_chan'
Message-ID: <202307141729.ZHJh3eCd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hector,

First bad commit (maybe != root cause):

tree:   https://github.com/AsahiLinux/linux bits/010-soc
head:   4e398443bc8954189feef7690a142d4cdfa2ec8c
commit: 33e58c87bbd34917ba153a3f8357f19cf4c15d08 [7/12] mailbox: apple: Delete driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230714/202307141729.ZHJh3eCd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141729.ZHJh3eCd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141729.ZHJh3eCd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/apple/rtkit.c: In function 'apple_rtkit_send_message_wait':
>> drivers/soc/apple/rtkit.c:639:37: error: 'struct apple_rtkit' has no member named 'mbox_chan'
     639 |                 ret = mbox_flush(rtk->mbox_chan, timeout);
         |                                     ^~


vim +639 drivers/soc/apple/rtkit.c

9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  626  
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  627  int apple_rtkit_send_message_wait(struct apple_rtkit *rtk, u8 ep, u64 message,
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  628  				  unsigned long timeout, bool atomic)
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  629  {
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  630  	DECLARE_COMPLETION_ONSTACK(completion);
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  631  	int ret;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  632  	long t;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  633  
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  634  	ret = apple_rtkit_send_message(rtk, ep, message, &completion, atomic);
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  635  	if (ret < 0)
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  636  		return ret;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  637  
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  638  	if (atomic) {
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01 @639  		ret = mbox_flush(rtk->mbox_chan, timeout);
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  640  		if (ret < 0)
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  641  			return ret;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  642  
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  643  		if (try_wait_for_completion(&completion))
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  644  			return 0;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  645  
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  646  		return -ETIME;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  647  	} else {
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  648  		t = wait_for_completion_interruptible_timeout(
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  649  			&completion, msecs_to_jiffies(timeout));
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  650  		if (t < 0)
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  651  			return t;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  652  		else if (t == 0)
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  653  			return -ETIME;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  654  		return 0;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  655  	}
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  656  }
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  657  EXPORT_SYMBOL_GPL(apple_rtkit_send_message_wait);
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  658  

:::::: The code at line 639 was first introduced by commit
:::::: 9bd1d9a0d8bb1a549831fd98fcc3105960f7068b soc: apple: Add RTKit IPC library

:::::: TO: Sven Peter <sven@svenpeter.dev>
:::::: CC: Sven Peter <sven@svenpeter.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

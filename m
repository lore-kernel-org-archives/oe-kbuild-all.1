Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29B87B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 05:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682400028; x=1713936028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=trLOlqqreRZR7cfnhacMxfmhse6aCaZZu3OAw3usngE=;
  b=TqytGQ1pKPqJvHl+u0DKWxB69o8xI/49LsuPvcVTzQUc9SI9yntaarVx
   iQQOeY/liEwjal9FwYu5+T+a/hsjHJxQTM4L3y6jkkBKHJkyBR7EyC+3F
   xw3Z6SPr5YpiloEzdzAEW5Y/VzSZ83cmzHzM/lihv9MrRCW/OqFmNTkVo
   j+3qBP3EhcNHV/nDvVdNk92h5KDHTf6aFG3QJg1hN1mdJZHQxUvHQUB8N
   z7+HF8qEi9EUg8gWwNR/xrXsuzIyKUElhAQ8YbZod0qTmN7W0On/cCyLX
   A3a8Ix5ELP0/7ycyPXpSpwx0iz5Xj8yl1H7sKyCttk6fdvUa3LNXH6cgk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="374604799"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="374604799"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 22:20:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="696028114"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="696028114"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Apr 2023 22:20:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prB69-000j1e-2h;
	Tue, 25 Apr 2023 05:20:17 +0000
Date: Tue, 25 Apr 2023 13:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-soc 8/14] drivers/soc/apple/rtkit.c:627:37:
 error: 'struct apple_rtkit' has no member named 'mbox_chan'
Message-ID: <202304251325.fsh5EBuw-lkp@intel.com>
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
head:   64314818271dd6e78606e3d5197a5d74bf5d9e7c
commit: 718fdf42575923c879b29752487020a8add88766 [8/14] mailbox: apple: Delete driver
config: arm64-buildonly-randconfig-r004-20230423 (https://download.01.org/0day-ci/archive/20230425/202304251325.fsh5EBuw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/718fdf42575923c879b29752487020a8add88766
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/010-soc
        git checkout 718fdf42575923c879b29752487020a8add88766
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251325.fsh5EBuw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/apple/rtkit.c: In function 'apple_rtkit_send_message_wait':
>> drivers/soc/apple/rtkit.c:627:37: error: 'struct apple_rtkit' has no member named 'mbox_chan'
     627 |                 ret = mbox_flush(rtk->mbox_chan, timeout);
         |                                     ^~


vim +627 drivers/soc/apple/rtkit.c

9bd1d9a0d8bb1a Sven Peter 2022-05-01  614  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  615  int apple_rtkit_send_message_wait(struct apple_rtkit *rtk, u8 ep, u64 message,
9bd1d9a0d8bb1a Sven Peter 2022-05-01  616  				  unsigned long timeout, bool atomic)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  617  {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  618  	DECLARE_COMPLETION_ONSTACK(completion);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  619  	int ret;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  620  	long t;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  621  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  622  	ret = apple_rtkit_send_message(rtk, ep, message, &completion, atomic);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  623  	if (ret < 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  624  		return ret;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  625  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  626  	if (atomic) {
9bd1d9a0d8bb1a Sven Peter 2022-05-01 @627  		ret = mbox_flush(rtk->mbox_chan, timeout);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  628  		if (ret < 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  629  			return ret;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  630  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  631  		if (try_wait_for_completion(&completion))
9bd1d9a0d8bb1a Sven Peter 2022-05-01  632  			return 0;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  633  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  634  		return -ETIME;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  635  	} else {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  636  		t = wait_for_completion_interruptible_timeout(
9bd1d9a0d8bb1a Sven Peter 2022-05-01  637  			&completion, msecs_to_jiffies(timeout));
9bd1d9a0d8bb1a Sven Peter 2022-05-01  638  		if (t < 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  639  			return t;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  640  		else if (t == 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  641  			return -ETIME;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  642  		return 0;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  643  	}
9bd1d9a0d8bb1a Sven Peter 2022-05-01  644  }
9bd1d9a0d8bb1a Sven Peter 2022-05-01  645  EXPORT_SYMBOL_GPL(apple_rtkit_send_message_wait);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  646  

:::::: The code at line 627 was first introduced by commit
:::::: 9bd1d9a0d8bb1a549831fd98fcc3105960f7068b soc: apple: Add RTKit IPC library

:::::: TO: Sven Peter <sven@svenpeter.dev>
:::::: CC: Sven Peter <sven@svenpeter.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

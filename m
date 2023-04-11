Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5AE15A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681216521; x=1712752521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hAC11/laMKIXL1hSh4od8Ot5dyX929cvxwX4eu0EO9o=;
  b=W9YAwF1Tez22goGPLsvDmrd/aOKr42EzeC1K5cT282/vTuM6bdxCgaOw
   FxuQiczqbLZmJyRLk3FNWIjxIrI8kt98OFhwWy/9SXJoaI8Pm4Gl3fe1s
   fIxdhqd07u0JscOZTOlpZUAw15mEDcUoRE5XeHQsak+R6XHQkDlMzwE4q
   ar0LYaN0AL5asHmxgdeiXCqgmjsQinuS6HT2L73dbkwRk/OX5fPQ3G6nj
   oANn+Bavmk/PQlLAB4YFwvWG59hMOOZoLtX7Ad8AX/F1Yd/apYAejaS0c
   breinp1CkyYZWyspHCXxix031Z6mJl0Y7uGCTn5LISwnJ1UcFhmF9LZsl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="323237432"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="323237432"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 05:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="799895808"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="799895808"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2023 05:35:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmDDJ-000WIR-2U;
	Tue, 11 Apr 2023 12:35:09 +0000
Date: Tue, 11 Apr 2023 20:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-mailbox 7/9] drivers/soc/apple/rtkit.c:627:37:
 error: 'struct apple_rtkit' has no member named 'mbox_chan'
Message-ID: <202304112055.8F022XCG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/010-mailbox
head:   4cadfe6eccffb8a2972ee06381d3eb82702daec6
commit: 23053282af14856566a489754b9f45450c87ad6b [7/9] soc: apple: rtkit: Port to the internal mailbox driver
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230411/202304112055.8F022XCG-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/23053282af14856566a489754b9f45450c87ad6b
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/010-mailbox
        git checkout 23053282af14856566a489754b9f45450c87ad6b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304112055.8F022XCG-lkp@intel.com/

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

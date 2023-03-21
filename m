Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0D87C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 04:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679372412; x=1710908412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HsMZA4ltV2jKvsoi9yihPsBK05mU94uEm07Lzztr/1U=;
  b=mcVHNy213p75L3Fw1y9d/XrGWnDAv3iN7ZJfMjRbdt0Cnlb9DUxARz6H
   dlTEjy9v/2ra1Hr885/ZSUC4jbtiFxp+CZa0702oewIa3lAkElkL24zax
   9aOJo1kfepbIZ5USZJWCKAdebXB6EdfUGh1h3BKOnXbYWn+QamXFPgFPO
   sMxTWc1WfCtgesQV6JfLwhd3wDgnYZ08gR+soW57Z8NsTi2ceqM+WvUdk
   jT8UrDzRseB0P6elEyLE2t8oRg3hjfiWplsO8ImhiZLwJWjkVYi5mcprb
   PsxIZFtuHLjVpPXU/uo32Flu4ij5YX6FNGWHHYwVc7WNNc3jNG3lS5HG1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="338878906"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="338878906"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 21:20:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="631397889"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="631397889"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Mar 2023 21:20:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peTTl-000Ba6-39;
	Tue, 21 Mar 2023 04:20:09 +0000
Date: Tue, 21 Mar 2023 12:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-mailbox 7/10] drivers/soc/apple/rtkit.c:626:37:
 error: 'struct apple_rtkit' has no member named 'mbox_chan'
Message-ID: <202303211235.0n6WNggF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/010-mailbox
head:   29506b44eb09be69c248d69061154f3cc0304ac0
commit: 62f3af80169e0b672435004586f085751defc26d [7/10] soc: apple: rtkit: Port to the internal mailbox driver
config: arm64-randconfig-c023-20230319 (https://download.01.org/0day-ci/archive/20230321/202303211235.0n6WNggF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/62f3af80169e0b672435004586f085751defc26d
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/010-mailbox
        git checkout 62f3af80169e0b672435004586f085751defc26d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211235.0n6WNggF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/apple/rtkit.c: In function 'apple_rtkit_send_message_wait':
>> drivers/soc/apple/rtkit.c:626:37: error: 'struct apple_rtkit' has no member named 'mbox_chan'
     626 |                 ret = mbox_flush(rtk->mbox_chan, timeout);
         |                                     ^~
   drivers/soc/apple/rtkit.c: At top level:
   drivers/soc/apple/rtkit.c:670:21: warning: no previous prototype for 'apple_rtkit_init' [-Wmissing-prototypes]
     670 | struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
         |                     ^~~~~~~~~~~~~~~~


vim +626 drivers/soc/apple/rtkit.c

9bd1d9a0d8bb1a Sven Peter 2022-05-01  613  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  614  int apple_rtkit_send_message_wait(struct apple_rtkit *rtk, u8 ep, u64 message,
9bd1d9a0d8bb1a Sven Peter 2022-05-01  615  				  unsigned long timeout, bool atomic)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  616  {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  617  	DECLARE_COMPLETION_ONSTACK(completion);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  618  	int ret;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  619  	long t;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  620  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  621  	ret = apple_rtkit_send_message(rtk, ep, message, &completion, atomic);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  622  	if (ret < 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  623  		return ret;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  624  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  625  	if (atomic) {
9bd1d9a0d8bb1a Sven Peter 2022-05-01 @626  		ret = mbox_flush(rtk->mbox_chan, timeout);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  627  		if (ret < 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  628  			return ret;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  629  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  630  		if (try_wait_for_completion(&completion))
9bd1d9a0d8bb1a Sven Peter 2022-05-01  631  			return 0;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  632  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  633  		return -ETIME;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  634  	} else {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  635  		t = wait_for_completion_interruptible_timeout(
9bd1d9a0d8bb1a Sven Peter 2022-05-01  636  			&completion, msecs_to_jiffies(timeout));
9bd1d9a0d8bb1a Sven Peter 2022-05-01  637  		if (t < 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  638  			return t;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  639  		else if (t == 0)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  640  			return -ETIME;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  641  		return 0;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  642  	}
9bd1d9a0d8bb1a Sven Peter 2022-05-01  643  }
9bd1d9a0d8bb1a Sven Peter 2022-05-01  644  EXPORT_SYMBOL_GPL(apple_rtkit_send_message_wait);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  645  

:::::: The code at line 626 was first introduced by commit
:::::: 9bd1d9a0d8bb1a549831fd98fcc3105960f7068b soc: apple: Add RTKit IPC library

:::::: TO: Sven Peter <sven@svenpeter.dev>
:::::: CC: Sven Peter <sven@svenpeter.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

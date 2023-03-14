Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D848F63
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 14:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678803162; x=1710339162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14FHr2aZU8By+5tzSCrgy6b5bdOpQwJcqciPm47ZXzs=;
  b=LrgdOCPTNBRXHf7n3MWEE1CTlYqPLHItbp73i983oojthFObL5b56Je/
   nxmQxBFa2+LnElru44uzvByXTTctw0SCa5azzHvZLU6aneJgqAQo0E7y8
   rlNedKhvXYeME3p38PPhsn7FWEoSyQzSdw5ZxVldptkpuH0PCct9DBd2J
   DrwB3BTgeD9HhaZpTRMYjWi7wCWjyl3WLggQJOFYyiR+60qfd9sz6p3dH
   zqoKEsJhwsblEuOyWZrb+gXliqkfymjJnsk5ZbO8ayixGG1fvdjlcaCb2
   Pn2Famlc6GyIeuZfaPshjyK/cfCdUNXO1gUGxMoEV97D66tC6eClT9q5e
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="423706675"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="423706675"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 07:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="629056161"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="629056161"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2023 07:12:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc5OJ-0006ye-1i;
	Tue, 14 Mar 2023 14:12:39 +0000
Date: Tue, 14 Mar 2023 22:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/010-mailbox 7/10] drivers/soc/apple/rtkit.c:625:37:
 error: 'struct apple_rtkit' has no member named 'mbox_chan'
Message-ID: <202303142244.rS2u3j6T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/010-mailbox
head:   6c4ce154f77d8de759ffc90c817b68191a010c18
commit: 359eb0b5ab26d199347e6aa29045363381fd2973 [7/10] soc: apple: rtkit: Port to the internal mailbox driver
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230314/202303142244.rS2u3j6T-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/359eb0b5ab26d199347e6aa29045363381fd2973
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/010-mailbox
        git checkout 359eb0b5ab26d199347e6aa29045363381fd2973
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303142244.rS2u3j6T-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/apple/rtkit.c: In function 'apple_rtkit_send_message_wait':
>> drivers/soc/apple/rtkit.c:625:37: error: 'struct apple_rtkit' has no member named 'mbox_chan'
     625 |                 ret = mbox_flush(rtk->mbox_chan, timeout);
         |                                     ^~
   drivers/soc/apple/rtkit.c: At top level:
   drivers/soc/apple/rtkit.c:669:21: warning: no previous prototype for 'apple_rtkit_init' [-Wmissing-prototypes]
     669 | struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
         |                     ^~~~~~~~~~~~~~~~


vim +625 drivers/soc/apple/rtkit.c

9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  612  
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  613  int apple_rtkit_send_message_wait(struct apple_rtkit *rtk, u8 ep, u64 message,
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  614  				  unsigned long timeout, bool atomic)
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  615  {
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  616  	DECLARE_COMPLETION_ONSTACK(completion);
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  617  	int ret;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  618  	long t;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  619  
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  620  	ret = apple_rtkit_send_message(rtk, ep, message, &completion, atomic);
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  621  	if (ret < 0)
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  622  		return ret;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  623  
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  624  	if (atomic) {
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01 @625  		ret = mbox_flush(rtk->mbox_chan, timeout);
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  626  		if (ret < 0)
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  627  			return ret;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  628  
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  629  		if (try_wait_for_completion(&completion))
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  630  			return 0;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  631  
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  632  		return -ETIME;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  633  	} else {
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  634  		t = wait_for_completion_interruptible_timeout(
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  635  			&completion, msecs_to_jiffies(timeout));
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  636  		if (t < 0)
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  637  			return t;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  638  		else if (t == 0)
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  639  			return -ETIME;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  640  		return 0;
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  641  	}
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  642  }
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  643  EXPORT_SYMBOL_GPL(apple_rtkit_send_message_wait);
9bd1d9a0d8bb1a5 Sven Peter 2022-05-01  644  

:::::: The code at line 625 was first introduced by commit
:::::: 9bd1d9a0d8bb1a549831fd98fcc3105960f7068b soc: apple: Add RTKit IPC library

:::::: TO: Sven Peter <sven@svenpeter.dev>
:::::: CC: Sven Peter <sven@svenpeter.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

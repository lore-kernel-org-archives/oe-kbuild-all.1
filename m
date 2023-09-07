Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDD6EA9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 04:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694059725; x=1725595725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HlCgeYcGbKm2BsYc0043+V4R4icab1o5Wx41+4vyEAA=;
  b=Q3cdNIB6vgdNnzYjyxaIQQAc1du5r92pL4ZGek+U9xpaWsqw/yuy0cTh
   vm008v+KUjPstgmY1oTWMbaZBVK5xYPn4r3NZ4aRM1YgfgBk7nYibE0pn
   xf55YudUC+VtYjEGTx4XVfflphLBtGmVYyqEowsZ0rylDwxNvPt7WzED0
   WtxK3yZugv4zBgeow96+sSt2mUFAF7wH+/sxfwqw2omAD4nCHzOyB5ELu
   Ter6qiz5+z5KVXYW7q+Lv/1xa85Z/rmZWrZx/Nes5RMdFX5fhL3VjKoEJ
   xqPfcCbRx55achZPzA7jNoqnWO05iCot+ZzsMfa88B/awu3PZkXl9jUmN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="376155581"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="376155581"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 21:08:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="831994036"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="831994036"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Sep 2023 21:08:43 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe6Jt-0000rf-1J;
	Thu, 07 Sep 2023 04:08:41 +0000
Date: Thu, 7 Sep 2023 12:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 12/25]
 arch/arm64/kvm/hyp/nvhe/serial.c:41:6: warning: no previous prototype for
 'hyp_puts'
Message-ID: <202309071211.rCuWkafh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   89a4bca2629d5169c163e3ec353812226b0a1435
commit: b00bb0eab0f0ea18bd65af5f6ef00b249348b853 [12/25] ANDROID: KVM: arm64: Add serial framework for pKVM
config: arm64-randconfig-r035-20230906 (https://download.01.org/0day-ci/archive/20230907/202309071211.rCuWkafh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309071211.rCuWkafh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309071211.rCuWkafh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/serial.c:41:6: warning: no previous prototype for 'hyp_puts' [-Wmissing-prototypes]
      41 | void hyp_puts(const char *s)
         |      ^~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/serial.c:53:6: warning: no previous prototype for 'hyp_putx64' [-Wmissing-prototypes]
      53 | void hyp_putx64(u64 x)
         |      ^~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/serial.c:59:6: warning: no previous prototype for 'hyp_putc' [-Wmissing-prototypes]
      59 | void hyp_putc(char c)
         |      ^~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/serial.c:65:5: warning: no previous prototype for '__pkvm_register_serial_driver' [-Wmissing-prototypes]
      65 | int __pkvm_register_serial_driver(void (*cb)(char))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hyp_puts +41 arch/arm64/kvm/hyp/nvhe/serial.c

    40	
  > 41	void hyp_puts(const char *s)
    42	{
    43		if (!hyp_serial_enabled())
    44			return;
    45	
    46		while (*s)
    47			__hyp_putc(*s++);
    48	
    49		__hyp_putc('\n');
    50		__hyp_putc('\r');
    51	}
    52	
  > 53	void hyp_putx64(u64 x)
    54	{
    55		if (hyp_serial_enabled())
    56			__hyp_putx4n(x, 64);
    57	}
    58	
  > 59	void hyp_putc(char c)
    60	{
    61		if (hyp_serial_enabled())
    62			__hyp_putc(c);
    63	}
    64	
  > 65	int __pkvm_register_serial_driver(void (*cb)(char))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

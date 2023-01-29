Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C4115A2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 06:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674974092; x=1706510092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0mq/7Llexw7Gu8hdwJ5bRia1QapmElzs4BUuruZUZ38=;
  b=J9v/MyZ11IpCgZFFzXabo1oQNiyXF2UX2bWqJ+KAug7hXiceBAR7+KWq
   qMB9JtXRdzJi9g2Y0AEwc3owDBZ4jgBrRkm40Z5T/v/Oo9ny/pmB0arhu
   pJgnc4Gji9hqYN7fLi/pUGWvDBXm+emcjQOcfBflWtXGxhvwRd85Y70gV
   Cn5UFL7ezCEouBnPEAWComg+D9ED7fYloG1OiKAONKeWPGPbwuXC0Yog6
   V5CUEdwr3uh06MsE07o0RxK8fyjcFwv94vNosZcjkLp0giF5H8Vlyr1bB
   iFPHsC8hrw9RuLqpq73lR5zqJsle9nX62pRQzkJsJY5oQMxSAMHJ6k5ak
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="413588252"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="413588252"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 22:34:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="663747833"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="663747833"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2023 22:34:50 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM1H7-0002Wu-1w;
	Sun, 29 Jan 2023 06:34:49 +0000
Date: Sun, 29 Jan 2023 14:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Price <steven.price@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 06/28] arm64: RME: ioctls to create and configure
 realms
Message-ID: <202301291401.lXrOsGbH-lkp@intel.com>
References: <20230127112932.38045-7-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127112932.38045-7-steven.price@arm.com>

Hi Steven,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on arm64/for-next/core]
[cannot apply to kvmarm/next kvm/queue kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Price/arm64-RME-Add-SMC-definitions-for-calling-the-RMM/20230128-180035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230127112932.38045-7-steven.price%40arm.com
patch subject: [RFC PATCH 06/28] arm64: RME: ioctls to create and configure realms
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291401.lXrOsGbH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e7bd258153be4522bd16992b408adc812a1d587b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Steven-Price/arm64-RME-Add-SMC-definitions-for-calling-the-RMM/20230128-180035
        git checkout e7bd258153be4522bd16992b408adc812a1d587b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/reset.c:399:5: warning: no previous prototype for 'kvm_arm_setup_stage2' [-Wmissing-prototypes]
     399 | int kvm_arm_setup_stage2(struct kvm *kvm, unsigned long type)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/kvm_arm_setup_stage2 +399 arch/arm64/kvm/reset.c

   398	
 > 399	int kvm_arm_setup_stage2(struct kvm *kvm, unsigned long type)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

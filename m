Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B5710F8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 08:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690966405; x=1722502405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mBZNCT6g/x3Rq/14qYYA0mdZvzZyyHlBQP47lk09HfY=;
  b=OcmKTHXIjjNpQzRdXXi3de/x86O0lEPHMrIrWtDK1w7KcbzeGfyCwqoB
   QiXvHeHontrBxoK67Zk8BfVJfWJlJWc1OAGz0lfHRa9LkGHOro5reznKz
   wSxfMqkS1yiprIQuinPDdphZyhQWqg8xcJo2Jxl+LOIHayAX/s69hVEl+
   8Bf++QgcEebORKLBjyBjss5GIGkp3/6I4EG7uiqL2S1XguqGu1jRtMPIk
   KUJnQ0hm1RGsny6Dlyu4zw0fWJeK/SKMBXesVMCl8PaqP+VzptAoDGgbg
   MdTYtSRsFqwsIIoxQ//WffS0lo9Tp1CpL8oJ/t4CmvHxSIOfXQRoIaMkS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368422544"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="368422544"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 01:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852808958"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="852808958"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Aug 2023 01:53:21 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR7bc-00013b-1q;
	Wed, 02 Aug 2023 08:53:20 +0000
Date: Wed, 2 Aug 2023 16:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:misc 2/3] arch/arm64/kvm/hyp/nvhe/list_debug.c:29:6: error:
 redefinition of '__list_add_valid'
Message-ID: <202308021625.hSFe7Uob-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marco,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git misc
head:   3309d318962fa5c02c116278d9035ae7d45ff2ca
commit: 4b437903bd62af72f74c3381654f01040cb57ba3 [2/3] list_debug: Introduce inline wrappers for debug checks
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230802/202308021625.hSFe7Uob-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021625.hSFe7Uob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021625.hSFe7Uob-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/list_debug.c:29:6: error: redefinition of '__list_add_valid'
      29 | bool __list_add_valid(struct list_head *new, struct list_head *prev,
         |      ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/list_debug.c:7:
   include/linux/list.h:45:29: note: previous definition of '__list_add_valid' with type 'bool(struct list_head *, struct list_head *, struct list_head *)' {aka '_Bool(struct list_head *, struct list_head *, struct list_head *)'}
      45 | static __always_inline bool __list_add_valid(struct list_head *new,
         |                             ^~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/list_debug.c:40:6: error: redefinition of '__list_del_entry_valid'
      40 | bool __list_del_entry_valid(struct list_head *entry)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:53:29: note: previous definition of '__list_del_entry_valid' with type 'bool(struct list_head *)' {aka '_Bool(struct list_head *)'}
      53 | static __always_inline bool __list_del_entry_valid(struct list_head *entry)
         |                             ^~~~~~~~~~~~~~~~~~~~~~


vim +/__list_add_valid +29 arch/arm64/kvm/hyp/nvhe/list_debug.c

4c68d6c0a17571 Keir Fraser 2022-01-31  28  
4c68d6c0a17571 Keir Fraser 2022-01-31 @29  bool __list_add_valid(struct list_head *new, struct list_head *prev,
4c68d6c0a17571 Keir Fraser 2022-01-31  30  		      struct list_head *next)
4c68d6c0a17571 Keir Fraser 2022-01-31  31  {
4c68d6c0a17571 Keir Fraser 2022-01-31  32  	if (NVHE_CHECK_DATA_CORRUPTION(next->prev != prev) ||
4c68d6c0a17571 Keir Fraser 2022-01-31  33  	    NVHE_CHECK_DATA_CORRUPTION(prev->next != next) ||
4c68d6c0a17571 Keir Fraser 2022-01-31  34  	    NVHE_CHECK_DATA_CORRUPTION(new == prev || new == next))
4c68d6c0a17571 Keir Fraser 2022-01-31  35  		return false;
4c68d6c0a17571 Keir Fraser 2022-01-31  36  
4c68d6c0a17571 Keir Fraser 2022-01-31  37  	return true;
4c68d6c0a17571 Keir Fraser 2022-01-31  38  }
4c68d6c0a17571 Keir Fraser 2022-01-31  39  
4c68d6c0a17571 Keir Fraser 2022-01-31 @40  bool __list_del_entry_valid(struct list_head *entry)

:::::: The code at line 29 was first introduced by commit
:::::: 4c68d6c0a1757139c791ccf1a781cbd81e35a063 KVM: arm64: pkvm: Implement CONFIG_DEBUG_LIST at EL2

:::::: TO: Keir Fraser <keirf@google.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ECA101FC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 12:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694780757; x=1726316757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0j7sTXO1uqKwSGS0MeTX2m25ZApgS8s5wjr54hmORa0=;
  b=VOW9dlEDJxVNNMIe7paPL1OL3F021P4UhanyTrGz4gOYVgfHdtqvxTAt
   vVHcrmui1aZVaADmWQQXtFGIQdnCJvXc5uFJk3FUq6hj+kAr/cLaBexLG
   xPuHhE4n/TWu5nO6mtNVuXgbut2m4HQn5owiX6VLzitHt0TH3/vpshjGZ
   qJjAAekXhdIPbLKaqRpey5LHqArtRGWpe/HLycuh80RrjryPo+kAXrXqC
   jsoTJomBmMFmuvi0gJu6eeQ6cxWpGK/TeWvlHTBn16+C44fnpxcf9A9ZU
   /wQza106aFLYmhw42ctcqihF4ELvs5fi8dCosAxbljlD1Z/Wk7+4fHYn+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358650462"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="358650462"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 05:25:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="918637894"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="918637894"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Sep 2023 05:25:55 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh7tQ-0002xV-2i;
	Fri, 15 Sep 2023 12:25:52 +0000
Date: Fri, 15 Sep 2023 20:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Thornber <ejt@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, dm-devel@redhat.com,
	Mike Snitzer <snitzer@kernel.org>
Subject: [device-mapper-dm:for-next 2/4] dm-extent-allocator.c:undefined
 reference to `__udivdi3'
Message-ID: <202309152007.7euOF5Fr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
head:   df3f51f6ca53e525420cd4cf4c7d9f5cabe9a29e
commit: b97bcee4b9999c9f5aadc06317ade18c5cbe37f6 [2/4] dm persistent data: Introduce extent allocator
config: i386-buildonly-randconfig-004-20230915 (https://download.01.org/0day-ci/archive/20230915/202309152007.7euOF5Fr-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309152007.7euOF5Fr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309152007.7euOF5Fr-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/md/persistent-data/dm-extent-allocator.o: in function `dm_alloc_context_alloc':
>> dm-extent-allocator.c:(.text+0x773): undefined reference to `__udivdi3'
>> ld: dm-extent-allocator.c:(.text+0x791): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

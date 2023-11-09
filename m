Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EF51E534
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lx1880Zs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699539869; x=1731075869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j2L4gW6FHHrfJJX6lwLF7Hv55vnDkDUVjbvPjCXPryE=;
  b=lx1880ZsTHtPILkJifHB4KBy0NmA3/N+p+JPAUeLBqVe5vLKSwh7cK9D
   yrZBTWI6EyxrF4vmJo7MGtrFzxhI6/X/0j50Pm4i7ooVnfhljB1xC/Odg
   Jxq6mXWCxtrSjjLo9lnWmGvt0J49hyT+8s/y/uGFmDZ/hqH3tjseC59r5
   in7dEk8vHas1MeF4HepVV0I9gcKvQYq8CfsilqZ2t3zCsuaOrZGajTrW1
   q8R8SV9+2e1e977R8SWJubWE76bvfSUE7PzsgsVR0QM4UMzLTy1Pwb2F8
   Svhz+g55LsGAjdJMriljFcoG14gglc8OzE+nL/45YbpoAVRWa15u35aMO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="3021506"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="3021506"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 06:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="763411301"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="763411301"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Nov 2023 06:24:27 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r15xJ-0008mt-0S;
	Thu, 09 Nov 2023 14:24:25 +0000
Date: Thu, 9 Nov 2023 22:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Georgia Garcia <georgia.garcia@canonical.com>
Subject: security/apparmor/domain.c:1314:12: sparse: sparse: symbol
 'stack_msg' was not declared. Should it be static?
Message-ID: <202311092251.TwKSNZ0u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bc986ab839c844e78a2333a02e55f02c9e57935
commit: 2d9da9b188b8cd3b579d7ef5ba5d334be9dd38fc apparmor: allow restricting unprivileged change_profile
date:   3 weeks ago
config: i386-randconfig-062-20231104 (https://download.01.org/0day-ci/archive/20231109/202311092251.TwKSNZ0u-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092251.TwKSNZ0u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092251.TwKSNZ0u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/apparmor/domain.c:1314:12: sparse: sparse: symbol 'stack_msg' was not declared. Should it be static?

vim +/stack_msg +1314 security/apparmor/domain.c

  1313	
> 1314	const char *stack_msg = "change_profile unprivileged unconfined converted to stacking";
  1315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

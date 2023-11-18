Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE85223C8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 06:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vu3osMxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700289234; x=1731825234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DoiodNZ989Sx0xcHLPXRD6kDMptCzj02RdIJjawkdAk=;
  b=Vu3osMxC191RVdNlZ2MUxdMpJp2RAV3dRLkqIIjYucyYnphI/kjDgFDw
   uf/KTNkpW40B4ypwfR46jacwFcgN2Ijod11Jw4sbFNiJCwUqUS+7tC5TO
   AAaxWv7vnV0pNHFVIHqaAB1t69Nx36utZ8yd49g9FMZVAf9BA7cC1cbVX
   GnHc2IzEaQ6hznDvUXbvZoww739+1v4hWCj+T4MCfV9k58ltOAwqT8QYR
   5dl9nuKAvGUo3PNxUWIX2fZl4jhbmjF/BJ/U5nEA8GII/YxHk431PYtLM
   eYMP0Ogy1La3Loj1zZ8GecS6J8jhuQguMnsT2bzt5ZoCfxr/supv/WyYA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="12962295"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="12962295"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 22:33:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="742276570"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="742276570"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Nov 2023 22:33:48 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Etm-0003bV-04;
	Sat, 18 Nov 2023 06:33:46 +0000
Date: Sat, 18 Nov 2023 14:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_id 14/16] mm/rmap_id.c:541:13: warning:
 unused variable 'i'
Message-ID: <202311181433.eXdD6L7o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_id
head:   373f2bbb81b52f1516e1ba1f20e0ded7d0c369ae
commit: 57d8279517bef4a6387420656de2e3dd92b8af13 [14/16] mm/rmap_id: verify precalculated subids with CONFIG_DEBUG_VM
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231118/202311181433.eXdD6L7o-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181433.eXdD6L7o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181433.eXdD6L7o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/rmap_id.c: In function 'rmap_id_init':
>> mm/rmap_id.c:541:13: warning: unused variable 'i' [-Wunused-variable]
     541 |         int i;
         |             ^


vim +/i +541 mm/rmap_id.c

   537	
   538	#ifdef CONFIG_DEBUG_VM
   539	static int __init rmap_id_init(void)
   540	{
 > 541		int i;
   542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

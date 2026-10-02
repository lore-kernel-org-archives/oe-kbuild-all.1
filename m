Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28EB463B9E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 14:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950182; cv=none; b=tZK7NIiqKMYv1Hl73Q4i+StgmbCrrco/y3hWjLOq4s2vqdrwvLxy3rRPZV7UwqdteLkVPQPU00quueTG5fLGBtPeRtHH6x0wmla3Z6VOW17fo27ZgUVAl0lZWIjhNpPJtYDr+Pbq21lUBjVIFw+41NGBGsS1XDkiE6gYwqBEQFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950182; c=relaxed/simple;
	bh=cl77HjegL6k9ESCvYk4X/3NCm2jeO8h+NEYRzaMeGvQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KgtXUiXPJ7IMTx+q3DnihmKejDfgMHq585u2wsJBD44rOvVqG8AdlVPC53CaOMofYubIHnzQSPAyepE3P1I9U4o++Mmv+EVlkgYhiLdVyIedCCcDN0HrQZCrncWbt54HrJ7KVVvXos0iidTFq1Ai6OcQRfY6HV9tNoasdKOjXxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IcfPLOME; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IcfPLOME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790950179; x=1822486179;
  h=date:from:to:cc:subject:message-id;
  bh=cl77HjegL6k9ESCvYk4X/3NCm2jeO8h+NEYRzaMeGvQ=;
  b=IcfPLOMEDIeEjaKK5oNI7jKuXWpkdcq3w/a54CCV5n9XciE1EbAUJ6mB
   6HKTEZLfGPWcMkidDQ/J7rNkH9Su5LWO0FjGDYJjNM0noOorQzqgyGs1Y
   DN8jVass8s6vQgy/YOgTGTUmq9FEc9sjOPdsNHoZDNu7VXbwK9mp/OZV1
   ahjxQr8mkCCgoM1tQlDDnvDnRw8Bkvw/tlME55bN0L3A4XX3J+GKuzS6p
   xVE2KL3RAjHuxr+Og+qGPeVLh97kg/bJwQsnrPb8MLoH99ozfgI6eweSS
   lSO+EdpGu9aqAsUTiMDpi/J3Y69kvjmrnJn2g9/PqBGzjaX4fW919cAvF
   A==;
X-CSE-ConnectionGUID: hDK1OEIRScCIMEx2J8liuQ==
X-CSE-MsgGUID: M5nC1rKkTW6lMAyts54beA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="91817360"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="91817360"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 07:08:37 -0700
X-CSE-ConnectionGUID: m/nYeJalS2SUvtpbM7vtyw==
X-CSE-MsgGUID: c1/T4iizQuuUOY8XlEYnOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="274062707"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 02 Oct 2026 07:08:34 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCdw4-000000000ZB-06uE;
	Fri, 02 Oct 2026 14:08:28 +0000
Date: Fri, 02 Oct 2026 16:08:08 +0200
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett (Oracle)" <liam@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liam:maple_marks_v4 26/37] mm/alloc_tag.c:740:15: warning:
 cast to pointer from integer of different size
Message-ID: <202610021618.Szhr2saE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v4
head:   2b62f73048b4ae3621680db6e895375832f9d458
commit: 10166ec28c930e60d2dd7d7e7dc4da6476fae643 [26/37] maple_tree: Convert data structures to u64
config: microblaze-randconfig-r2200-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021618.Szhr2saE-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021618.Szhr2saE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021618.Szhr2saE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/alloc_tag.c: In function 'clean_unused_module_areas_locked':
>> mm/alloc_tag.c:740:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      start_tag = (struct alloc_tag *)(module_tags.start_addr + mas.index);
                  ^
   mm/alloc_tag.c:741:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      end_tag = (struct alloc_tag *)(module_tags.start_addr + mas.last);
                ^
   mm/alloc_tag.c: In function 'release_module_tags':
   mm/alloc_tag.c:943:14: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     start_tag = (struct alloc_tag *)(module_tags.start_addr + mas.index);
                 ^
   mm/alloc_tag.c:944:12: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     end_tag = (struct alloc_tag *)(module_tags.start_addr + mas.last);
               ^


vim +740 mm/alloc_tag.c

3c77682d80d07e Lorenzo Stoakes 2026-06-25  725  
3c77682d80d07e Lorenzo Stoakes 2026-06-25  726  /* Called with mod_area_mt locked */
3c77682d80d07e Lorenzo Stoakes 2026-06-25  727  static void clean_unused_module_areas_locked(void)
3c77682d80d07e Lorenzo Stoakes 2026-06-25  728  {
3c77682d80d07e Lorenzo Stoakes 2026-06-25  729  	MA_STATE(mas, &mod_area_mt, 0, module_tags.size);
3c77682d80d07e Lorenzo Stoakes 2026-06-25  730  	struct module *val;
3c77682d80d07e Lorenzo Stoakes 2026-06-25  731  
3c77682d80d07e Lorenzo Stoakes 2026-06-25  732  	mas_for_each(&mas, val, module_tags.size) {
3c77682d80d07e Lorenzo Stoakes 2026-06-25  733  		struct alloc_tag *start_tag;
3c77682d80d07e Lorenzo Stoakes 2026-06-25  734  		struct alloc_tag *end_tag;
3c77682d80d07e Lorenzo Stoakes 2026-06-25  735  
3c77682d80d07e Lorenzo Stoakes 2026-06-25  736  		if (val != &unloaded_mod)
3c77682d80d07e Lorenzo Stoakes 2026-06-25  737  			continue;
3c77682d80d07e Lorenzo Stoakes 2026-06-25  738  
3c77682d80d07e Lorenzo Stoakes 2026-06-25  739  		/* Release area if all tags are unused */
3c77682d80d07e Lorenzo Stoakes 2026-06-25 @740  		start_tag = (struct alloc_tag *)(module_tags.start_addr + mas.index);
3c77682d80d07e Lorenzo Stoakes 2026-06-25  741  		end_tag = (struct alloc_tag *)(module_tags.start_addr + mas.last);
3c77682d80d07e Lorenzo Stoakes 2026-06-25  742  		if (clean_unused_counters(start_tag, end_tag))
3c77682d80d07e Lorenzo Stoakes 2026-06-25  743  			mas_erase(&mas);
3c77682d80d07e Lorenzo Stoakes 2026-06-25  744  	}
3c77682d80d07e Lorenzo Stoakes 2026-06-25  745  }
3c77682d80d07e Lorenzo Stoakes 2026-06-25  746  

:::::: The code at line 740 was first introduced by commit
:::::: 3c77682d80d07e673c7e6eb04f2211688ab494c4 mm: move alloc tag to mm

:::::: TO: Lorenzo Stoakes <ljs@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

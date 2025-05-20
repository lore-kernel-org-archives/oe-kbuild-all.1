Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CCD2641EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 09:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732817; cv=none; b=J9LyWyZD52ACNGrk6zOg4kNUlSmK2eVo4KlnJCzYD4wgbxkp0sgDLg0QsHVkg9N478aBvDf952x2CozRVovwgHBs1S0XxQCYWIoswTXgBRWL9bnd2bw0mGFTDxNwTYdgoreFZ+N4x//wxA/rvTK+Q6lJM8ZiTKmAqqW/c88kP8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732817; c=relaxed/simple;
	bh=iGVEC2oy8mEGe3JKj/zKWH/9oDny/wLaIibqajVZV5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k8ScDBVXhS6dxOGjlGPujolBBOg1Sgx7DWzlVkY11qlh/woO9beuon2oQs6sK6PEh4Z1yv6FGTpIy8ipyYsje4XlB/4ZEa0mtukKzpTnZ0kDHqR3UDf3LBDyTqGBvQ23t40bBOUKhmai82d7dMc25IntfMB+AJY6E2MkjOzKetA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dg5a1zdk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dg5a1zdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747732816; x=1779268816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iGVEC2oy8mEGe3JKj/zKWH/9oDny/wLaIibqajVZV5E=;
  b=dg5a1zdkZUsdeli1qNOpZr7Mu5egbSnR5m/Tcs4T1rsSjkU8ehSBoCD4
   +00JHPVqeDi10gxuPIlGrEaOKNhBpkE0WbWA82UmaZj/Xspy0Ev1Qg59G
   txB/WrcsJu8JJK0AH0TvmxHJJKMjBLTEfDFn4UKAOUUE7wYc2G/+cEAeP
   p2sTgM0woGXHJdJyDWNLvTKr5gCw2o4QbMbGST3391IsxCt3PNKxBzcAX
   5uo3/ucXiI1K9q+4E6j6GgBLCrudP9c/O5/gduzFPrzG/kpqBKX+oZT8q
   pk1SBcyOHigTa/LIPprwzPxAthwHRvdhsz4jFucsmUhIhnInOqOhne5zi
   g==;
X-CSE-ConnectionGUID: GzupiBikRwuFeYfIpRviSQ==
X-CSE-MsgGUID: smjX6+/WRC6hCSmapPiFeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49353656"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49353656"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 02:20:15 -0700
X-CSE-ConnectionGUID: BE5pJaMQSMq/DS5aYfLtXw==
X-CSE-MsgGUID: hk1J2GAORe2XVz87HNFeSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140168470"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 May 2025 02:20:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHJ8t-000MNg-3C;
	Tue, 20 May 2025 09:20:11 +0000
Date: Tue, 20 May 2025 17:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1646/1646] mm/memory_hotplug.c:482:23:
 warning: variable 'start_pfn' set but not used
Message-ID: <202505201731.rOzzhiIH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   2eb609d2f89b2d85d89cb018c3f97050989807e2
commit: 8de9a7ef5533b50d0054c06cb04bd266ecac17b7 [1646/1646] mm/memory_hotplug: shrink zones when offlining memory
config: arm64-randconfig-001-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201731.rOzzhiIH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201731.rOzzhiIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201731.rOzzhiIH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory_hotplug.c: In function '__remove_section':
>> mm/memory_hotplug.c:482:23: warning: variable 'start_pfn' set but not used [-Wunused-but-set-variable]
     482 |         unsigned long start_pfn;
         |                       ^~~~~~~~~


vim +/start_pfn +482 mm/memory_hotplug.c

815121d2b5cd56 Yasuaki Ishimatsu 2013-02-22  478  
8de9a7ef5533b5 David Hildenbrand 2020-09-22  479  static void __remove_section(struct mem_section *ms, unsigned long map_offset,
b9f9a54ea6ea41 David Hildenbrand 2020-09-22  480  			     struct vmem_altmap *altmap)
ea01ea937dcae2 Badari Pulavarty  2008-04-28  481  {
815121d2b5cd56 Yasuaki Ishimatsu 2013-02-22 @482  	unsigned long start_pfn;
815121d2b5cd56 Yasuaki Ishimatsu 2013-02-22  483  	int scn_nr;
ea01ea937dcae2 Badari Pulavarty  2008-04-28  484  
b9f9a54ea6ea41 David Hildenbrand 2020-09-22  485  	if (WARN_ON_ONCE(!valid_section(ms)))
b9f9a54ea6ea41 David Hildenbrand 2020-09-22  486  		return;
ea01ea937dcae2 Badari Pulavarty  2008-04-28  487  
815121d2b5cd56 Yasuaki Ishimatsu 2013-02-22  488  	scn_nr = __section_nr(ms);
1dd2bfc86818dd YASUAKI ISHIMATSU 2017-10-03  489  	start_pfn = section_nr_to_pfn((unsigned long)scn_nr);
815121d2b5cd56 Yasuaki Ishimatsu 2013-02-22  490  
457dd3c8002ca0 David Hildenbrand 2020-09-22  491  	sparse_remove_one_section(ms, map_offset, altmap);
ea01ea937dcae2 Badari Pulavarty  2008-04-28  492  }
ea01ea937dcae2 Badari Pulavarty  2008-04-28  493  

:::::: The code at line 482 was first introduced by commit
:::::: 815121d2b5cd56f1757d4468dc3abadd06a0ed6b memory_hotplug: clear zone when removing the memory

:::::: TO: Yasuaki Ishimatsu <isimatu.yasuaki@jp.fujitsu.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

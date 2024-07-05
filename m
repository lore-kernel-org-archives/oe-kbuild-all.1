Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850111B963
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 03:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720149690; cv=none; b=Whld6U9uuIyvmue+M5KVoh4Eun7gkpkWHEogrlL3QFuXWRwLSQajBxNqeyH8eKnA/zAG0T2QSr+IUIcU75fqigOAFjFsdUTALLyitz02li+9bFC4u11SHIujQaURJf/gsidJWrInGzeARldtx8tr1QGyR27vXCrLKyAZj1/coGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720149690; c=relaxed/simple;
	bh=O4ViN9U3eF8LAzNrc2g5U4nXSG1wLCnQcT89yijgPu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHIyI8Re1eRtZzp6bFknR8Pplv8fyN4H8E+bCOuxRA727/+jCX/iSgP1kydLg8ZH/2CUQyl5wnima78P0fUPvdM7/FFLM0E6tCUBnUJwZ2nk/KuubWdcH0EYrFqaKVyn21xUXDQcSHdkO/siFrlnkZEzOc+5RwRGpjJVV6sYETE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntqQzSGO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntqQzSGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720149687; x=1751685687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O4ViN9U3eF8LAzNrc2g5U4nXSG1wLCnQcT89yijgPu4=;
  b=ntqQzSGOFYD8hesXJgIq1mnQKchrbHmJnNe8jz0BcO45qCKxHUB8zoUp
   2+TBEjK+pkDfSFSJh8c9tEQi0Q3eXMRtN/YAno6dCOw46/PrCOfQ6NMJo
   CN2SSBj2/8A1hzXwpikDgl1emH+qZfyLPCPT4pKDejd1DaEOh9zKCKJUX
   w9Z+cQBKZ+iUyK0x29sAeA+7CTgUsnVohNgYUA+o5QGX0zOdNkgWtG4BJ
   Q0vp/ftlA6+SJxDS2HRdkHM8b/Xdav/Y9wI/zdaFTXEL49MIyrYZeIo6M
   djVapw+cCeC700Qyuu4USfrRzD7lcO8OYt77GCsbzNcVfkZtYd4MjGdq1
   g==;
X-CSE-ConnectionGUID: 660f/0EZSwCWw+fWmEhfnw==
X-CSE-MsgGUID: 0m3TG12fQ6CbNNGeDl41sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17385778"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17385778"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 20:21:26 -0700
X-CSE-ConnectionGUID: L41eHbgZRSCVZOFqQ7J+Rw==
X-CSE-MsgGUID: 1jud6lYTRDG6HUEg/GpUuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46656395"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Jul 2024 20:21:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPZVh-000RqO-18;
	Fri, 05 Jul 2024 03:21:21 +0000
Date: Fri, 5 Jul 2024 11:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 48/53]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in
 call to 'always_inline' '__map_pages': recursive inlining
Message-ID: <202407051140.7pHweYaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   2bf23486e7eae67485953abf3529ad2d3a90384b
commit: 798311d40e98b02c18a121da0dd52ff75d21b543 [48/53] iommupt: Add the 64 bit ARM page table format
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20240705/202407051140.7pHweYaZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051140.7pHweYaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051140.7pHweYaZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:13:
   drivers/iommu/generic_pt/fmt/../pt_common.h: In function 'pt_next_entry':
   drivers/iommu/generic_pt/fmt/../pt_common.h:186:41: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     186 |                 WALK_PRINTK("next", pts);
         |                                         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:15:
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__unmap_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:324:10:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:312:28: error: inlining failed in call to 'always_inline' '__unmap_pages': recursive inlining
     312 | static __always_inline int __unmap_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__iova_to_phys' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:29:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__iova_to_phys' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:29:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__iova_to_phys' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:29:10:
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:21:28: error: inlining failed in call to 'always_inline' '__iova_to_phys': recursive inlining
      21 | static __always_inline int __iova_to_phys(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__iova_to_phys' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:29:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__iova_to_phys' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:29:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__iova_to_phys' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:29:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__iova_to_phys' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:29:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__iova_to_phys' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:29:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__iova_to_phys' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:29:10,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_iova_to_phys' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:43:8:
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:21:28: error: inlining failed in call to 'always_inline' '__iova_to_phys': recursive inlining
      21 | static __always_inline int __iova_to_phys(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__collect_tables' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:152:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__collect_tables' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:152:10:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:137:28: error: inlining failed in call to 'always_inline' '__collect_tables': recursive inlining
     137 | static __always_inline int __collect_tables(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:137:28: error: inlining failed in call to 'always_inline' '__collect_tables': recursive inlining
     137 | static __always_inline int __collect_tables(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__unmap_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:324:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__unmap_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:324:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__unmap_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:324:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__unmap_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:324:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__unmap_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:324:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__unmap_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:324:10,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_unmap_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:367:2:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:312:28: error: inlining failed in call to 'always_inline' '__unmap_pages': recursive inlining
     312 | static __always_inline int __unmap_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__collect_tables' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:152:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__collect_tables' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:152:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__collect_tables' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:152:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__collect_tables' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:152:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__collect_tables' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:152:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__collect_tables' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:152:10,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__collect_tables' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:152:10,
       inlined from 'pt_iommu_collect_tables' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:172:8:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:137:28: error: inlining failed in call to 'always_inline' '__collect_tables': recursive inlining
     137 | static __always_inline int __collect_tables(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:137:28: error: inlining failed in call to 'always_inline' '__collect_tables': recursive inlining
     137 | static __always_inline int __collect_tables(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
>> drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_common.h:288:9,
       inlined from 'armv8_4k_map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:299:8:
   drivers/iommu/generic_pt/fmt/../iommu_pt.h:212:28: error: inlining failed in call to 'always_inline' '__map_pages': recursive inlining
     212 | static __always_inline int __map_pages(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:255:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__map_pages' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:228:11,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
..


vim +212 drivers/iommu/generic_pt/fmt/../iommu_pt.h

6f52cdf885d141 Jason Gunthorpe 2024-06-28  136  
6f52cdf885d141 Jason Gunthorpe 2024-06-28 @137  static __always_inline int __collect_tables(struct pt_state *pts, void *arg)
6f52cdf885d141 Jason Gunthorpe 2024-06-28  138  {
6f52cdf885d141 Jason Gunthorpe 2024-06-28  139  	struct pt_iommu_collect_args *collect = arg;
6f52cdf885d141 Jason Gunthorpe 2024-06-28  140  	enum pt_entry_type type;
6f52cdf885d141 Jason Gunthorpe 2024-06-28  141  	int ret;
6f52cdf885d141 Jason Gunthorpe 2024-06-28  142  
6f52cdf885d141 Jason Gunthorpe 2024-06-28  143  	if ((collect->flags & PT_IOMMU_COLLECT_IGNORE_MAPPED) &&
6f52cdf885d141 Jason Gunthorpe 2024-06-28  144  	    !pt_could_have_tables(pts))
6f52cdf885d141 Jason Gunthorpe 2024-06-28  145  	    return 0;
6f52cdf885d141 Jason Gunthorpe 2024-06-28  146  
6f52cdf885d141 Jason Gunthorpe 2024-06-28  147  	for_each_pt_level_item(pts, type)
6f52cdf885d141 Jason Gunthorpe 2024-06-28  148  	{
6f52cdf885d141 Jason Gunthorpe 2024-06-28  149  		if (type == PT_ENTRY_TABLE) {
6f52cdf885d141 Jason Gunthorpe 2024-06-28  150  			pt_radix_add_list(pt_table_ptr(pts),
6f52cdf885d141 Jason Gunthorpe 2024-06-28  151  					  &collect->free_list);
6f52cdf885d141 Jason Gunthorpe 2024-06-28  152  			ret = pt_descend(pts, arg, __collect_tables);
6f52cdf885d141 Jason Gunthorpe 2024-06-28  153  			if (ret)
6f52cdf885d141 Jason Gunthorpe 2024-06-28  154  				return ret;
6f52cdf885d141 Jason Gunthorpe 2024-06-28  155  			continue;
6f52cdf885d141 Jason Gunthorpe 2024-06-28  156  		}
6f52cdf885d141 Jason Gunthorpe 2024-06-28  157  		if (type == PT_ENTRY_OA &&
6f52cdf885d141 Jason Gunthorpe 2024-06-28  158  		    !(collect->flags & PT_IOMMU_COLLECT_IGNORE_MAPPED))
6f52cdf885d141 Jason Gunthorpe 2024-06-28  159  			return -EADDRINUSE;
6f52cdf885d141 Jason Gunthorpe 2024-06-28  160  	}
6f52cdf885d141 Jason Gunthorpe 2024-06-28  161  	return 0;
6f52cdf885d141 Jason Gunthorpe 2024-06-28  162  }
6f52cdf885d141 Jason Gunthorpe 2024-06-28  163  
6f52cdf885d141 Jason Gunthorpe 2024-06-28  164  static int pt_iommu_collect_tables(struct pt_state *pts,
6f52cdf885d141 Jason Gunthorpe 2024-06-28  165  				   struct pt_radix_list_head *free_list,
6f52cdf885d141 Jason Gunthorpe 2024-06-28  166  				   unsigned int flags)
6f52cdf885d141 Jason Gunthorpe 2024-06-28  167  {
6f52cdf885d141 Jason Gunthorpe 2024-06-28  168  	struct pt_iommu_collect_args collect = { .free_list = *free_list,
6f52cdf885d141 Jason Gunthorpe 2024-06-28  169  						.flags = flags };
6f52cdf885d141 Jason Gunthorpe 2024-06-28  170  	int ret;
6f52cdf885d141 Jason Gunthorpe 2024-06-28  171  
6f52cdf885d141 Jason Gunthorpe 2024-06-28  172  	ret = __collect_tables(pts, &collect);
6f52cdf885d141 Jason Gunthorpe 2024-06-28  173  	if (ret) {
6f52cdf885d141 Jason Gunthorpe 2024-06-28  174  		WARN_ON(flags & PT_IOMMU_COLLECT_IGNORE_MAPPED);
6f52cdf885d141 Jason Gunthorpe 2024-06-28  175  		return ret;
6f52cdf885d141 Jason Gunthorpe 2024-06-28  176  	}
6f52cdf885d141 Jason Gunthorpe 2024-06-28  177  
6f52cdf885d141 Jason Gunthorpe 2024-06-28  178  	/* If the operation fails then the passed list isn't changed */
6f52cdf885d141 Jason Gunthorpe 2024-06-28  179  	*free_list = collect.free_list;
6f52cdf885d141 Jason Gunthorpe 2024-06-28  180  	return 0;
6f52cdf885d141 Jason Gunthorpe 2024-06-28  181  }
6f52cdf885d141 Jason Gunthorpe 2024-06-28  182  
8edc40d032b601 Jason Gunthorpe 2024-06-28  183  struct pt_iommu_map_args {
8edc40d032b601 Jason Gunthorpe 2024-06-28  184  	struct pt_radix_list_head free_list;
8edc40d032b601 Jason Gunthorpe 2024-06-28  185  	struct pt_write_attrs attrs;
8edc40d032b601 Jason Gunthorpe 2024-06-28  186  	pt_oaddr_t pa;
8edc40d032b601 Jason Gunthorpe 2024-06-28  187  };
8edc40d032b601 Jason Gunthorpe 2024-06-28  188  
8edc40d032b601 Jason Gunthorpe 2024-06-28  189  static inline int pt_iommu_new_table(struct pt_state *pts, pt_vaddr_t pgsize,
8edc40d032b601 Jason Gunthorpe 2024-06-28  190  				     struct pt_write_attrs *attrs)
8edc40d032b601 Jason Gunthorpe 2024-06-28  191  {
8edc40d032b601 Jason Gunthorpe 2024-06-28  192  	void *table_mem;
8edc40d032b601 Jason Gunthorpe 2024-06-28  193  
8edc40d032b601 Jason Gunthorpe 2024-06-28  194  	/* Given PA/VA/length can't be represented */
8edc40d032b601 Jason Gunthorpe 2024-06-28  195  	if (unlikely(!pt_could_have_tables(pts)))
8edc40d032b601 Jason Gunthorpe 2024-06-28  196  		return -ENXIO;
8edc40d032b601 Jason Gunthorpe 2024-06-28  197  
8edc40d032b601 Jason Gunthorpe 2024-06-28  198  	table_mem = pt_radix_alloc(pts->table, attrs->nid,
8edc40d032b601 Jason Gunthorpe 2024-06-28  199  				   pt_table_memory_lg2sz(pts), attrs->gfp);
8edc40d032b601 Jason Gunthorpe 2024-06-28  200  	if (IS_ERR(table_mem))
8edc40d032b601 Jason Gunthorpe 2024-06-28  201  		return PTR_ERR(table_mem);
8edc40d032b601 Jason Gunthorpe 2024-06-28  202  
8edc40d032b601 Jason Gunthorpe 2024-06-28  203  	if (!pt_install_table_entry(pts, virt_to_phys(table_mem), attrs)) {
8edc40d032b601 Jason Gunthorpe 2024-06-28  204  		pt_radix_free(table_mem);
8edc40d032b601 Jason Gunthorpe 2024-06-28  205  		return -EAGAIN;
8edc40d032b601 Jason Gunthorpe 2024-06-28  206  	}
8edc40d032b601 Jason Gunthorpe 2024-06-28  207  	pts->tables[pts->level - 1] = table_mem;
8edc40d032b601 Jason Gunthorpe 2024-06-28  208  	return 0;
8edc40d032b601 Jason Gunthorpe 2024-06-28  209  }
8edc40d032b601 Jason Gunthorpe 2024-06-28  210  
8edc40d032b601 Jason Gunthorpe 2024-06-28  211  /* FIXME dma flushing */
8edc40d032b601 Jason Gunthorpe 2024-06-28 @212  static __always_inline int __map_pages(struct pt_state *pts, void *arg)
8edc40d032b601 Jason Gunthorpe 2024-06-28  213  {
8edc40d032b601 Jason Gunthorpe 2024-06-28  214  	struct pt_iommu_map_args *map = arg;
8edc40d032b601 Jason Gunthorpe 2024-06-28  215  	enum pt_entry_type type;
8edc40d032b601 Jason Gunthorpe 2024-06-28  216  	int ret;
8edc40d032b601 Jason Gunthorpe 2024-06-28  217  
8edc40d032b601 Jason Gunthorpe 2024-06-28  218  again:
8edc40d032b601 Jason Gunthorpe 2024-06-28  219  	for_each_pt_level_item (pts, type) {
8edc40d032b601 Jason Gunthorpe 2024-06-28  220  		pt_vaddr_t pgsize =
8edc40d032b601 Jason Gunthorpe 2024-06-28  221  			pt_compute_best_pgsize(pts, map->pa, pts->last_va);
8edc40d032b601 Jason Gunthorpe 2024-06-28  222  
8edc40d032b601 Jason Gunthorpe 2024-06-28  223  		switch (type) {
8edc40d032b601 Jason Gunthorpe 2024-06-28  224  		case PT_ENTRY_TABLE: {
8edc40d032b601 Jason Gunthorpe 2024-06-28  225  			struct pt_state table_pts;
8edc40d032b601 Jason Gunthorpe 2024-06-28  226  
8edc40d032b601 Jason Gunthorpe 2024-06-28  227  			if (!pgsize) {
8edc40d032b601 Jason Gunthorpe 2024-06-28  228  				ret = pt_descend(pts, arg, __map_pages);
8edc40d032b601 Jason Gunthorpe 2024-06-28  229  				if (ret)
8edc40d032b601 Jason Gunthorpe 2024-06-28  230  					return ret;
8edc40d032b601 Jason Gunthorpe 2024-06-28  231  				continue;
8edc40d032b601 Jason Gunthorpe 2024-06-28  232  			}
8edc40d032b601 Jason Gunthorpe 2024-06-28  233  
8edc40d032b601 Jason Gunthorpe 2024-06-28  234  			/*
8edc40d032b601 Jason Gunthorpe 2024-06-28  235  			 * A previous map left a table behind that we now wish
8edc40d032b601 Jason Gunthorpe 2024-06-28  236  			 * to convert into an OA. Free the table and its
8edc40d032b601 Jason Gunthorpe 2024-06-28  237  			 * children.
8edc40d032b601 Jason Gunthorpe 2024-06-28  238  			 */
8edc40d032b601 Jason Gunthorpe 2024-06-28  239  			pt_init_children(&table_pts, pts);
8edc40d032b601 Jason Gunthorpe 2024-06-28  240  			ret = pt_iommu_collect_tables(&table_pts,
8edc40d032b601 Jason Gunthorpe 2024-06-28  241  						     &map->free_list, 0);
8edc40d032b601 Jason Gunthorpe 2024-06-28  242  			if (ret)
8edc40d032b601 Jason Gunthorpe 2024-06-28  243  				return ret;
8edc40d032b601 Jason Gunthorpe 2024-06-28  244  			pt_radix_add_list(pt_table_ptr(pts), &map->free_list);
8edc40d032b601 Jason Gunthorpe 2024-06-28  245  			fallthrough;
8edc40d032b601 Jason Gunthorpe 2024-06-28  246  		}
8edc40d032b601 Jason Gunthorpe 2024-06-28  247  		case PT_ENTRY_EMPTY:
8edc40d032b601 Jason Gunthorpe 2024-06-28  248  			if (!pgsize) {
8edc40d032b601 Jason Gunthorpe 2024-06-28  249  				ret = pt_iommu_new_table(pts, pgsize, &map->attrs);
8edc40d032b601 Jason Gunthorpe 2024-06-28  250  				if (ret) {
8edc40d032b601 Jason Gunthorpe 2024-06-28  251  					if (ret == -EAGAIN)
8edc40d032b601 Jason Gunthorpe 2024-06-28  252  						goto again;
8edc40d032b601 Jason Gunthorpe 2024-06-28  253  					return ret;
8edc40d032b601 Jason Gunthorpe 2024-06-28  254  				}
8edc40d032b601 Jason Gunthorpe 2024-06-28  255  				ret = pt_descend(pts, arg, __map_pages);
8edc40d032b601 Jason Gunthorpe 2024-06-28  256  				if (ret)
8edc40d032b601 Jason Gunthorpe 2024-06-28  257  					return ret;
8edc40d032b601 Jason Gunthorpe 2024-06-28  258  				continue;
8edc40d032b601 Jason Gunthorpe 2024-06-28  259  			}
8edc40d032b601 Jason Gunthorpe 2024-06-28  260  
8edc40d032b601 Jason Gunthorpe 2024-06-28  261  			/* FIXME we don't check every contiguous entry for collision */
8edc40d032b601 Jason Gunthorpe 2024-06-28  262  			pt_install_leaf_entry(pts, map->pa, pgsize,
8edc40d032b601 Jason Gunthorpe 2024-06-28  263  					      &map->attrs);
8edc40d032b601 Jason Gunthorpe 2024-06-28  264  			type = PT_ENTRY_OA;
8edc40d032b601 Jason Gunthorpe 2024-06-28  265  			map->pa += pgsize;
8edc40d032b601 Jason Gunthorpe 2024-06-28  266  			continue;
8edc40d032b601 Jason Gunthorpe 2024-06-28  267  		case PT_ENTRY_OA:
8edc40d032b601 Jason Gunthorpe 2024-06-28  268  			printk("Addr in use %llx %u %u\n", pts->va, pts->level, pts->index);
8edc40d032b601 Jason Gunthorpe 2024-06-28  269  			BUG();
8edc40d032b601 Jason Gunthorpe 2024-06-28  270  			return -EADDRINUSE;
8edc40d032b601 Jason Gunthorpe 2024-06-28  271  		}
8edc40d032b601 Jason Gunthorpe 2024-06-28  272  	}
8edc40d032b601 Jason Gunthorpe 2024-06-28  273  	return 0;
8edc40d032b601 Jason Gunthorpe 2024-06-28  274  }
8edc40d032b601 Jason Gunthorpe 2024-06-28  275  
8edc40d032b601 Jason Gunthorpe 2024-06-28  276  static int NS(map_pages)(struct pt_iommu *iommu_table, dma_addr_t iova,
8edc40d032b601 Jason Gunthorpe 2024-06-28  277  			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
8edc40d032b601 Jason Gunthorpe 2024-06-28  278  			 int prot, gfp_t gfp, size_t *mapped)
8edc40d032b601 Jason Gunthorpe 2024-06-28  279  {
8edc40d032b601 Jason Gunthorpe 2024-06-28  280  	struct pt_common *table = common_from_iommu(iommu_table);
8edc40d032b601 Jason Gunthorpe 2024-06-28  281  	struct pt_iommu_map_args map = { .pa = paddr };
8edc40d032b601 Jason Gunthorpe 2024-06-28  282  	int ret;
8edc40d032b601 Jason Gunthorpe 2024-06-28  283  
8edc40d032b601 Jason Gunthorpe 2024-06-28  284  	if (WARN_ON(pgsize * pgcount == 0))
8edc40d032b601 Jason Gunthorpe 2024-06-28  285  		return -EINVAL;
8edc40d032b601 Jason Gunthorpe 2024-06-28  286  
8edc40d032b601 Jason Gunthorpe 2024-06-28  287  	if (WARN_ON(!(prot & (IOMMU_READ | IOMMU_WRITE))))
8edc40d032b601 Jason Gunthorpe 2024-06-28  288  		return -EINVAL;
8edc40d032b601 Jason Gunthorpe 2024-06-28  289  
8edc40d032b601 Jason Gunthorpe 2024-06-28  290  	if (paddr & table->invalid_oa_mask)
8edc40d032b601 Jason Gunthorpe 2024-06-28  291  		return -ERANGE;
8edc40d032b601 Jason Gunthorpe 2024-06-28  292  
8edc40d032b601 Jason Gunthorpe 2024-06-28  293  	ret = pt_set_iommu_prot(table, &map.attrs, prot);
8edc40d032b601 Jason Gunthorpe 2024-06-28  294  	if (ret)
8edc40d032b601 Jason Gunthorpe 2024-06-28  295  		return ret;
8edc40d032b601 Jason Gunthorpe 2024-06-28  296  	map.attrs.gfp = gfp;
8edc40d032b601 Jason Gunthorpe 2024-06-28  297  
8edc40d032b601 Jason Gunthorpe 2024-06-28  298  	/* FIXME: We don't want the core code to break up things for */
8edc40d032b601 Jason Gunthorpe 2024-06-28  299  	ret = pt_walk_range(table, iova, pgsize * pgcount, __map_pages, &map);
8edc40d032b601 Jason Gunthorpe 2024-06-28  300  
8edc40d032b601 Jason Gunthorpe 2024-06-28  301  	/* Bytes successfully mapped */
8edc40d032b601 Jason Gunthorpe 2024-06-28  302  	*mapped += map.pa - paddr;
8edc40d032b601 Jason Gunthorpe 2024-06-28  303  	return ret;
8edc40d032b601 Jason Gunthorpe 2024-06-28  304  }
8edc40d032b601 Jason Gunthorpe 2024-06-28  305  
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  306  struct pt_unmap_args {
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  307  	struct pt_radix_list_head free_list;
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  308  	pt_vaddr_t unmapped;
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  309  };
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  310  
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  311  /* FIXME dma flushing */
4951fb7a65ef3f Jason Gunthorpe 2024-06-28 @312  static __always_inline int __unmap_pages(struct pt_state *pts, void *arg)
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  313  {
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  314  	struct pt_unmap_args *unmap = arg;
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  315  	enum pt_entry_type type;
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  316  	int ret;
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  317  
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  318  	for_each_pt_level_item(pts, type)
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  319  	{
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  320  		bool fully_covered = pt_entry_fully_covered(pts, pts->last_va);
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  321  
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  322  		switch (type) {
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  323  		case PT_ENTRY_TABLE: {
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  324  			ret = pt_descend(pts, arg, __unmap_pages);
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  325  			if (ret)
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  326  				return ret;
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  327  
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  328  			/*
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  329  			 * If the unmapping range fully covers the table then we
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  330  			 * can free it as well. The clear is delayed until we
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  331  			 * succeed in clearing the lower table levels.
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  332  			 */
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  333  			if (fully_covered) {
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  334  				pt_radix_add_list(&unmap->free_list,
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  335  						  pts->tables[pts->level + 1]);
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  336  				pt_clear_entry(pts, ilog2(1));
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  337  			}
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  338  			break;
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  339  		}
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  340  		case PT_ENTRY_EMPTY:
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  341  			return -EFAULT;
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  342  		case PT_ENTRY_OA:
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  343  			/*
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  344  			 * The IOMMU API does not require drivers to support
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  345  			 * unmapping parts of pages. Only legacy VFIO type 1 v1
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  346  			 * will attempt it after probing for "fine-grained
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  347  			 * superpages" support. There it allows the v1 version
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  348  			 * of VFIO (that nobody uses) to pass more than
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  349  			 * PAGE_SIZE to map.
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  350  			 */
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  351  			if (!fully_covered)
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  352  				return -EADDRINUSE;
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  353  			unmap->unmapped += 1ULL << pt_entry_oa_lg2sz(pts);
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  354  			pt_clear_entry(pts, pt_entry_num_contig_lg2(pts));
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  355  			break;
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  356  		}
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  357  	}
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  358  	return 0;
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  359  }
4951fb7a65ef3f Jason Gunthorpe 2024-06-28  360  

:::::: The code at line 212 was first introduced by commit
:::::: 8edc40d032b6015f9c0835073b6865758bc80174 iommupt: Add map_pages op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

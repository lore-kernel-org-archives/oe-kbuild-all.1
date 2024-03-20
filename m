Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEF34AEE0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710946818; cv=none; b=ohQtTtkDWeIhDJFQkI2CIArH/ZNeKKgqyicmij0qJHQujQnWNOjFYR3l3gWJ+beIg/0OJCeFszYGRZydFfE91Yzxu4vp+RoM7t/kRGb/5k7lgRQ+74loDSSAZyw4WNXj6Ezo9u+Rl2vmF53lavtM+n/Hf+IwiLv8h0/e3wYNT60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710946818; c=relaxed/simple;
	bh=v4qr9/DVfLnxwH99v1VN17r/i8qQ8s/lnW88LM8KTI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mlOq888PLalobihqZseFirTzHOcXAQsVDdy3nxRSZRyJ6ZpulmW8bukVx6jc9ZLO5GmPlPSmPQ1Udaq8NCPdPy4t5gEgUqFKG200q7p0dcYt/+1Jx86CfEibRWBfQq1sskS1ilRwk5YaR5aL1xZoEzt4si0MHI1Bu9mWWFMSD8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3G8bPNj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3G8bPNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710946816; x=1742482816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v4qr9/DVfLnxwH99v1VN17r/i8qQ8s/lnW88LM8KTI8=;
  b=S3G8bPNjs213Co1yL4Jl006EfGNo3kni2BKmTQ3zgXc/2/OLLtwXwmul
   t2/JbYLm6WPSToptsIQMMq2xCGTBPDY0WaMX6uYoM7IijD/UI7GOqyxAe
   cExi3jkF7bORs36KzXSmS+jPNrRS7s9tjcmbHCUrysSDzpSV9LUwDwwxX
   mIT/S799o0LO88ZN+CYrMhuSPxfzPfcf0WhT0HWSN2rrYmxvawqFW0Sh1
   q+HRgn4OekoEIMzJta+ykl5CQDxFLTck8hic21jliGL2q+5izsWm4gx4x
   ULloNtb9gbWg7sgobyoqoLvPz7a1TsB3jjJnGkeM2A06gmSmzqAYSSXUV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6083721"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="6083721"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 08:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="14177699"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Mar 2024 08:00:13 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmxQI-000Ii5-37;
	Wed, 20 Mar 2024 15:00:10 +0000
Date: Wed, 20 Mar 2024 22:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 26/52] mm/internal.h:1127:22: error: 'struct
 pglist_data' has no member named 'deferred_split_queue'
Message-ID: <202403202222.mfp1LH04-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   a824831a082f1d8f9b51a4c0598e633d38555fcf
commit: 1166721383f8962e2c6c388b2adc7c6f1e9901d5 [26/52] mm/migrate: split source folio if it is on deferred split list
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240320/202403202222.mfp1LH04-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403202222.mfp1LH04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403202222.mfp1LH04-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:51:
   mm/internal.h: In function 'get_deferred_split_queue':
>> mm/internal.h:1127:22: error: 'struct pglist_data' has no member named 'deferred_split_queue'
    1127 |         return &pgdat->deferred_split_queue;
         |                      ^~


vim +1127 mm/internal.h

  1101	
  1102	/*
  1103	 * mm/huge_memory.c
  1104	 */
  1105	struct page *follow_trans_huge_pmd(struct vm_area_struct *vma,
  1106					   unsigned long addr, pmd_t *pmd,
  1107					   unsigned int flags);
  1108	
  1109	#ifdef CONFIG_MEMCG
  1110	static inline
  1111	struct deferred_split *get_deferred_split_queue(struct folio *folio)
  1112	{
  1113		struct mem_cgroup *memcg = folio_memcg(folio);
  1114		struct pglist_data *pgdat = NODE_DATA(folio_nid(folio));
  1115	
  1116		if (memcg)
  1117			return &memcg->deferred_split_queue;
  1118		else
  1119			return &pgdat->deferred_split_queue;
  1120	}
  1121	#else
  1122	static inline
  1123	struct deferred_split *get_deferred_split_queue(struct folio *folio)
  1124	{
  1125		struct pglist_data *pgdat = NODE_DATA(folio_nid(folio));
  1126	
> 1127		return &pgdat->deferred_split_queue;
  1128	}
  1129	#endif
  1130	
  1131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

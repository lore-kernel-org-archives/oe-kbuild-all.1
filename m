Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8698625776
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 05:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744610172; cv=none; b=fODJ+fn0IWpGL3xoicAZYZMQ3aw/q9fd2Cdi8ca8Ee+63XLby6kADV6qRheVe/AluT8jE+VtLJFcB1aGgJ1c9muVIaHnLkDh+udJaME8W7WskvtsOxTOiSYDHkoBZE5ArAW25vNJ5BwnLqzzDu/c1EGuTxOP+T/PwoYLyL5uk3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744610172; c=relaxed/simple;
	bh=oY2UITU06DZCIHZ2H9CbGA9LxbihSx09z3LwCwJwha8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bz8gV4Wj5IljDTmHcLT3E0TtiMvqVYK1dA3WjgLRC4fIvHfK+/SGX3JCWPoTWRMb+eXuhyjrU5RfhsnxdPd3uriOu6E2vZKVMcOKm04e8rUbzX4cFnmoAEb9qJnI9zkDm2zSw1Kwmx9HUpBGRi02okrMuZt93DIclo+XBKd0rHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBSEbS4B; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBSEbS4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744610170; x=1776146170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oY2UITU06DZCIHZ2H9CbGA9LxbihSx09z3LwCwJwha8=;
  b=RBSEbS4BH6UWWZaptZvmh1N2Yuc/iUEIWOJ2gc7l3g0PzaCtJ6t64eZV
   1jrjDdFcincHlkXQrcg51kHHbGxPfYUIQb0nb7/lLAuzEj7OvOQ9nadp2
   3a4FehHMISFnNynLf6gHHa/R7DOXwMMwP1csPs3FXlv1jO8mx50AbonIU
   m3JjDPNj7GnzmIj9ftXHaTO4wTCb24YgIpTIeJ6OoCQ/WPRrM0FEnCFd9
   JPy4yW0g9P50MMnRrW+B8S5J91sXvey18rn/FQ88ZMjmD74WMSjZVpcyQ
   0xBTN43BR1shxh+X04/rlIfWxjXSL/nnYu5ZkoAdrUQIv27MSCtI+W5X9
   g==;
X-CSE-ConnectionGUID: TGxL3JmBTviMDWjE/+qzVQ==
X-CSE-MsgGUID: yiLV4tYrQPupZvzFjWR3tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57434685"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="57434685"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 22:56:10 -0700
X-CSE-ConnectionGUID: 5cej2fhJQ9anc2YQcCJ8Eg==
X-CSE-MsgGUID: HYNKoUXERnO9JR9QPo75rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="134563199"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Apr 2025 22:56:08 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4Cnd-000Dlc-36;
	Mon, 14 Apr 2025 05:56:05 +0000
Date: Mon, 14 Apr 2025 13:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/khugepaged.c:601:6: warning:
 no previous prototype for 'adapt_hugetext_add_entry'
Message-ID: <202504141318.5RXNNbVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rongwei,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   a3551a1593289aa46ae6f085ec80d9d0a7a1bfed
commit: b188234c53aafe8941f2f2662bf015353418eb81 [9/9] anolis: mm: hugetext: Implement principal part
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250414/202504141318.5RXNNbVE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504141318.5RXNNbVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504141318.5RXNNbVE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/khugepaged.c:601:6: warning: no previous prototype for 'adapt_hugetext_add_entry' [-Wmissing-prototypes]
     601 | void adapt_hugetext_add_entry(struct mm_slot *mm_slot, unsigned long start,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> mm/khugepaged.c:634:6: warning: no previous prototype for 'adapt_hugetext_free_entry' [-Wmissing-prototypes]
     634 | void adapt_hugetext_free_entry(struct mm_slot *mm_slot)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   mm/khugepaged.c:150: warning: Function parameter or member 'nr_pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:150: warning: Function parameter or member 'pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:150: warning: Function parameter or member 'nr_exec_vma' not described in 'mm_slot'
   mm/khugepaged.c:150: warning: Function parameter or member 'exec_vma' not described in 'mm_slot'
>> mm/khugepaged.c:150: warning: Function parameter or member 'nr_adapt_vma' not described in 'mm_slot'
>> mm/khugepaged.c:150: warning: Function parameter or member 'adapt_vmas' not described in 'mm_slot'
>> mm/khugepaged.c:150: warning: Function parameter or member 'adaptive_regions' not described in 'mm_slot'
>> mm/khugepaged.c:150: warning: Function parameter or member 'work' not described in 'mm_slot'
>> mm/khugepaged.c:150: warning: Function parameter or member 'state' not described in 'mm_slot'
>> mm/khugepaged.c:150: warning: Function parameter or member 'nr_hugetext' not described in 'mm_slot'
   mm/khugepaged.c:1705: warning: Function parameter or member 'mm' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:1705: warning: Function parameter or member 'addr' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:1907: warning: Function parameter or member 'mm' not described in 'collapse_file'
   mm/khugepaged.c:1907: warning: Function parameter or member 'file' not described in 'collapse_file'
   mm/khugepaged.c:1907: warning: Function parameter or member 'start' not described in 'collapse_file'
   mm/khugepaged.c:1907: warning: Function parameter or member 'hpage' not described in 'collapse_file'
   mm/khugepaged.c:1907: warning: Function parameter or member 'node' not described in 'collapse_file'


vim +/adapt_hugetext_add_entry +601 mm/khugepaged.c

   600	
 > 601	void adapt_hugetext_add_entry(struct mm_slot *mm_slot, unsigned long start,
   602				      unsigned long end)
   603	{
   604		XA_STATE_ORDER(xas, &mm_slot->adaptive_regions, start, HPAGE_PMD_ORDER);
   605		unsigned long i;
   606		struct region_entry *entry;
   607	
   608		xas_lock(&xas);
   609		/*
   610		 * Back early by checking whether last entry has
   611		 * been allocated or not.
   612		 */
   613		xas_set(&xas, end - HPAGE_PMD_SIZE);
   614		if (xas_load(&xas))
   615			goto out;
   616	
   617		for (i = start; i < end; i += HPAGE_PMD_SIZE) {
   618			xas_set(&xas, i);
   619			if (xas_load(&xas))
   620				continue;
   621			entry = kmalloc(sizeof(*entry), GFP_ATOMIC);
   622			if (!entry)
   623				break;
   624			entry->start = i;
   625			entry->end = i + HPAGE_PMD_SIZE;
   626			entry->refcount = 0;
   627			entry->status = 0;
   628			xas_store(&xas, entry);
   629		}
   630	out:
   631		xas_unlock(&xas);
   632	}
   633	
 > 634	void adapt_hugetext_free_entry(struct mm_slot *mm_slot)
   635	{
   636		XA_STATE_ORDER(xas, &mm_slot->adaptive_regions, 0, HPAGE_PMD_ORDER);
   637		struct region_entry *entry;
   638	
   639		xas_lock(&xas);
   640		xas_for_each(&xas, entry, ULONG_MAX) {
   641			__xa_erase(&mm_slot->adaptive_regions, xas.xa_index);
   642			kfree(entry);
   643		}
   644		xas_unlock(&xas);
   645	
   646		xa_destroy(&mm_slot->adaptive_regions);
   647	}
   648	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79046357A3B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887270; cv=none; b=R6z0AIomP+vc/3CgclPGiFbIAKIZnFoDlXxQzue5g9tomn2JMtXMguBWUJ+ZrINf3oxTm3pMsLdULDNZ7dk/23ek1xcLU7DZlRpO9smXbpRHKQB6KPDfogu3yeCULGYZCLfg88KKy7CprKdYSBEuw6SJ81VfWKUIyUKa/sAyoHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887270; c=relaxed/simple;
	bh=TCkb3cMMnCilkXdfgXX/dYrrMGKTqbu3QhFRbmOVoRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ua6I+GeOnkxKi15YoERC14P2ZbkLwlR4v8mND5ybu1jJWDx6orRkdnE5Z+fO13Cd9Ya0irtFuCUICH/Kc2zFasOo862kuR03O7HyltisLPyp7sS6MOFrpRxxQDt97NiepSyX8POB2P7OqiRMNoZj+2LEJb5gXfyIKMLawHjENXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aF1q/1/J; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aF1q/1/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765887261; x=1797423261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TCkb3cMMnCilkXdfgXX/dYrrMGKTqbu3QhFRbmOVoRA=;
  b=aF1q/1/JfemaVvpWPnsfWfLSq6qovpKYBJ5fJ9pL8XE3Ee7gV1ua2W0Z
   ALSf/esDjIvnzvJm29WOvL+/WmabATKuFmdeImDEuQIr41UfOn8lU0RfX
   WchxEzec7msOrfi2FuRkTGwxywN5EfQD7SszoQZTwjPyGBxVq2JVNbFhz
   E05pJjT/AOsWLBqVvTB0vPDzvxbB32M5WglxSSDrUxi7CDyqKS5cpHqit
   ZwCNIjCl0/ZJ6U9nNzFy9buuF85tpYK8ZyXexB7WzMfrws1gHbbmEldoU
   5I8/KRVFmKhELbqAJF4kRtzH1BmHOiYIFb3DKrQz+OL0m+iWHwkwAoFDc
   g==;
X-CSE-ConnectionGUID: a19G9z+sRumth1lrIzfxjQ==
X-CSE-MsgGUID: GkQEoB53TlS9kcl/drTMqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67682253"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67682253"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 04:14:21 -0800
X-CSE-ConnectionGUID: 9NsoZwmqQWKxdFmw4UI3kg==
X-CSE-MsgGUID: 5ajR5gmGTO6sJjivMsbeHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198060024"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 16 Dec 2025 04:14:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVTwT-0000000035o-3e26;
	Tue, 16 Dec 2025 12:14:13 +0000
Date: Tue, 16 Dec 2025 13:13:41 +0100
From: kernel test robot <lkp@intel.com>
To: Zhang Qilong <zhangqilong3@huawei.com>, akpm@linux-foundation.org,
	david@kernel.org, lorenzo.stoakes@oracle.com, corbet@lwn.net
Cc: oe-kbuild-all@lists.linux.dev, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH next 2/2] mm/huge_memory: Add sysfs knob for executable
 THP COW
Message-ID: <202512161328.lAGmHVt0-lkp@intel.com>
References: <20251215123407.380813-3-zhangqilong3@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215123407.380813-3-zhangqilong3@huawei.com>

Hi Zhang,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251215]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Qilong/mm-huge_memory-Implementation-of-THP-COW-for-executable-file-mmap/20251215-204035
base:   next-20251215
patch link:    https://lore.kernel.org/r/20251215123407.380813-3-zhangqilong3%40huawei.com
patch subject: [PATCH next 2/2] mm/huge_memory: Add sysfs knob for executable THP COW
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251216/202512161328.lAGmHVt0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161328.lAGmHVt0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161328.lAGmHVt0-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'wp_huge_pmd':
>> mm/memory.c:6131:13: error: implicit declaration of function 'transparent_hugepage_use_exec_cow' [-Wimplicit-function-declaration]
    6131 |         if (transparent_hugepage_use_exec_cow() &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/transparent_hugepage_use_exec_cow +6131 mm/memory.c

  6104	
  6105	/* `inline' is required to avoid gcc 4.1.2 build error */
  6106	static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
  6107	{
  6108		struct vm_area_struct *vma = vmf->vma;
  6109		const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
  6110		vm_fault_t ret;
  6111	
  6112		if (vma_is_anonymous(vma)) {
  6113			if (likely(!unshare) &&
  6114			    userfaultfd_huge_pmd_wp(vma, vmf->orig_pmd)) {
  6115				if (userfaultfd_wp_async(vmf->vma))
  6116					goto split;
  6117				return handle_userfault(vmf, VM_UFFD_WP);
  6118			}
  6119			return do_huge_pmd_wp_page(vmf);
  6120		}
  6121	
  6122		if (vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) {
  6123			if (vma->vm_ops->huge_fault) {
  6124				ret = vma->vm_ops->huge_fault(vmf, PMD_ORDER);
  6125				if (!(ret & VM_FAULT_FALLBACK))
  6126					return ret;
  6127			}
  6128		}
  6129	
  6130	
> 6131		if (transparent_hugepage_use_exec_cow() &&
  6132		    is_exec_mapping(vma->vm_flags) &&
  6133		    is_cow_mapping(vma->vm_flags)) {
  6134			/* Skip special and shmem */
  6135			if (vma_is_special_huge(vma) || vma_is_shmem(vma))
  6136				goto split;
  6137	
  6138			ret = do_huge_pmd_exec_cow(vmf);
  6139			if (!(ret & VM_FAULT_FALLBACK))
  6140				return ret;
  6141		}
  6142	
  6143	split:
  6144		/* COW or write-notify handled on pte level: split pmd. */
  6145		__split_huge_pmd(vma, vmf->pmd, vmf->address, false);
  6146	
  6147		return VM_FAULT_FALLBACK;
  6148	}
  6149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

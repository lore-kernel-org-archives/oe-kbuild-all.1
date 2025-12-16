Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9A9274B58
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 04:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765860184; cv=none; b=sRw6BgRAEUCY7X+mHX+7q6iN0+h8YRJnPVzHteCcjE+jZ5X5G0HwokpSPqy/oDtqqhUGwGS3O81Cd96A52IEGqRQsPUWsuwzg/zx0GhnB1ReC4gTT9DpRCG+QVgsHsONTuurdH8RRMivo2jKrYjZqk+vmPYjwNNQvXSu8ubkNN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765860184; c=relaxed/simple;
	bh=Fkq8HbuoAJDko5Bgr6cLebDBGD2rT8Jq8r/WQ28UcIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oA7SA3vSOMbW6bl5OSmjLLkg0+tMXJK7qAKrV3qs8CltET/J9G+FQaerK7smIsfiQT7D0DMU+HNqa86Ek8daToO3hEz0NQaDGvRFlF7N5s7n8F7Kvp/aKEKP2qGVjKauEFQhCtoxGd0aSMX4feabAPpyJIcgnNAV4hvDdWZk+tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FsfuAwi1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FsfuAwi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765860179; x=1797396179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fkq8HbuoAJDko5Bgr6cLebDBGD2rT8Jq8r/WQ28UcIQ=;
  b=FsfuAwi11GcRf31JowDF7UlgDNzcv0xJmua8bSzNjOOpvRazYt19XDgf
   5mEcMjMrk6hz52ynQWA/63cR4AFyPLlrZqtnhAc9P7hyzTf6OIJ7P/6Lk
   kHkMW93I+C0hKaQvqcVTKmHdXt3XrecjgXxUWq9paMzfFK2Rai7gc9ceE
   BBSq78K5a+UnhH22oLl19EZvSBpa1bU+f379Pn15kBYe3gxzVXi0WGfJr
   2eCi2PVtrpkbQT4PCAbay9ZgQNHp+IBanlk5gdAvtjjXlpGXN6Dc6/mtP
   wnCh2GixnP23m+bQunjRQUyBGpt3F+0IJ5gohKS26bLyHA5ICTWj+RJSE
   w==;
X-CSE-ConnectionGUID: rQC6f6FsQvig0EwGa8UK6w==
X-CSE-MsgGUID: MnGgMsZaTGqLMzDqErAnoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67844116"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67844116"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 20:42:55 -0800
X-CSE-ConnectionGUID: Lf88ju+rRASp+h3UWXr5vA==
X-CSE-MsgGUID: de11S+tETEqRidJqhi4H6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="228986796"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 Dec 2025 20:42:51 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVMtc-000000001A9-2XhZ;
	Tue, 16 Dec 2025 04:42:48 +0000
Date: Tue, 16 Dec 2025 12:42:40 +0800
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
Subject: Re: [PATCH next 1/2] mm/huge_memory: Implementation of THP COW for
 executable file mmap
Message-ID: <202512161243.Dm4FDP0T-lkp@intel.com>
References: <20251215123407.380813-2-zhangqilong3@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215123407.380813-2-zhangqilong3@huawei.com>

Hi Zhang,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251215]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Qilong/mm-huge_memory-Implementation-of-THP-COW-for-executable-file-mmap/20251215-204035
base:   next-20251215
patch link:    https://lore.kernel.org/r/20251215123407.380813-2-zhangqilong3%40huawei.com
patch subject: [PATCH next 1/2] mm/huge_memory: Implementation of THP COW for executable file mmap
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20251216/202512161243.Dm4FDP0T-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161243.Dm4FDP0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161243.Dm4FDP0T-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'wp_huge_pmd':
>> mm/memory.c:6134:21: error: implicit declaration of function 'vma_is_special_huge'; did you mean 'vma_is_special_mapping'? [-Werror=implicit-function-declaration]
    6134 |                 if (vma_is_special_huge(vma) || vma_is_shmem(vma))
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     vma_is_special_mapping
   cc1: some warnings being treated as errors


vim +6134 mm/memory.c

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
  6131		if (is_exec_mapping(vma->vm_flags) &&
  6132		    is_cow_mapping(vma->vm_flags)) {
  6133			/* Skip special and shmem */
> 6134			if (vma_is_special_huge(vma) || vma_is_shmem(vma))
  6135				goto split;
  6136	
  6137			ret = do_huge_pmd_exec_cow(vmf);
  6138			if (!(ret & VM_FAULT_FALLBACK))
  6139				return ret;
  6140		}
  6141	
  6142	split:
  6143		/* COW or write-notify handled on pte level: split pmd. */
  6144		__split_huge_pmd(vma, vmf->pmd, vmf->address, false);
  6145	
  6146		return VM_FAULT_FALLBACK;
  6147	}
  6148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

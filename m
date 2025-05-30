Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA8C125D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 01:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748567541; cv=none; b=GqiFo5SkOpr8sbBLy3EIGB57bsYbzPYzEYov/TvitdlgzkskUu/I4AZS9xzcOZh5EY4zKDviPINTEoLgUZFY7EMvKXR3bLx2NVOm01g9JkXhEg5S6Z9q2IqhFCWxpjIa+k+tn6XWQdWwSoSgpixPdJ8oxszi4uft09oQPCWgZOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748567541; c=relaxed/simple;
	bh=zUEFD12gbe5NwkIzEFlWKSjdebeFy68REXpnLmu5B/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PI5PjjcNlCkz6HMzgfXWNHTeQPulDpruSSpl3SJ+InMd7PQx8Qj1JrzbIoBvuxb24Wv3Z7yUlZJKqXp3nIOGWNax7K3cBYIeZdQhbUuGcbbL9whn0RPof9J6o8caCwC6pgeH+qDRtCWk4DA8z1JhcQ7kFONfN5Z9immqR3cgHMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EdEzcgU5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EdEzcgU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748567540; x=1780103540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zUEFD12gbe5NwkIzEFlWKSjdebeFy68REXpnLmu5B/Y=;
  b=EdEzcgU5QZBY9afMM+tISDpwlXtnWIugpVT3AIgRk91KOfCJFQowPZ+Z
   1cntl5lZrp9DKXH/ReEd7QMlyiIJj9XcpKRDEER9iOfy77E7+pCrNx2WS
   xUhBiNyKhXJO2xcgzemKqPtdp9lCQEJlayNlQS0xHkLdPjMkmNllIwgy3
   Of+9FoSppgcX2zniclFPqyalYP423aMRX92EiKVvjnBh+R+OVJpXqWWs8
   mzwkXiqAPRMwpDD4z02iEBOgbHYUg86Pd/Woo4wQX31c6xMpcAo3/nlcE
   UWc3KrJOFfRa1lj/oZmkJftp6RUTMhJZCGaOs32DYTEKHI1XOS5/P1+F+
   w==;
X-CSE-ConnectionGUID: xFMZufjqRiaS7igCKyCICw==
X-CSE-MsgGUID: bE8ajOu9R6iaPyeOv7HGdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="60912238"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="60912238"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 18:12:19 -0700
X-CSE-ConnectionGUID: 40RggcGjR/iQ90CdRk+P6Q==
X-CSE-MsgGUID: zaNLHDPjSEqOMshsRni1Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="147598741"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 May 2025 18:12:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKoIB-000XEu-1w;
	Fri, 30 May 2025 01:12:15 +0000
Date: Fri, 30 May 2025 09:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 17/19] drm/xe/uapi: Add UAPI for querying VMA count
 and memory attributes
Message-ID: <202505300820.fmdHkQH6-lkp@intel.com>
References: <20250527164003.1068118-18-himal.prasad.ghimiray@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-18-himal.prasad.ghimiray@intel.com>

Hi Himal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250529]
[cannot apply to linus/master v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/Introduce-drm_gpuvm_sm_map_ops_flags-enums-for-sm_map_ops/20250528-041919
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250527164003.1068118-18-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v3 17/19] drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
config: loongarch-randconfig-r073-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300820.fmdHkQH6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505300820.fmdHkQH6-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2213 xe_vm_query_vmas_attrs_ioctl() warn: unsigned 'args->num_vmas' is never less than zero.
drivers/gpu/drm/xe/xe_vm.c:2249 xe_vm_query_vmas_attrs_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2583 new_vma() error: we previously assumed 'bo' could be null (see line 2557)
drivers/gpu/drm/xe/xe_vm.c:2595 new_vma() error: 'vma' dereferencing possible ERR_PTR()
drivers/gpu/drm/xe/xe_vm.c:3033 prefetch_ranges() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_vm.c:4035 xe_vm_range_tilemask_tlb_invalidation() error: uninitialized symbol 'err'.
arch/loongarch/include/asm/atomic.h:135 arch_atomic_fetch_add_unless() warn: inconsistent indenting
drivers/gpu/drm/xe/xe_vm.c:4241 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/xe/xe_vm.c:4402 xe_vm_alloc_madvise_vma() warn: variable dereferenced before check 'ops' (see line 4341)

vim +2213 drivers/gpu/drm/xe/xe_vm.c

  2202	
  2203	int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
  2204	{
  2205		struct xe_device *xe = to_xe_device(dev);
  2206		struct xe_file *xef = to_xe_file(file);
  2207		struct drm_xe_vma_mem_attr *mem_attrs;
  2208		struct drm_xe_vm_query_vmas_attr *args = data;
  2209		u64 __user *attrs_user = NULL;
  2210		struct xe_vm *vm;
  2211		int err = 0;
  2212	
> 2213		if (XE_IOCTL_DBG(xe, args->num_vmas < 0))
  2214			return -EINVAL;
  2215	
  2216		vm = xe_vm_lookup(xef, args->vm_id);
  2217		if (XE_IOCTL_DBG(xe, !vm))
  2218			return -EINVAL;
  2219	
  2220		down_read(&vm->lock);
  2221	
  2222		attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
  2223	
  2224		if (args->num_vmas == 0 && !attrs_user) {
  2225			xe_vm_query_vmas(vm, &args->num_vmas, args->start, args->start + args->range);
  2226			goto unlock_vm;
  2227		}
  2228	
  2229		mem_attrs = kvmalloc_array(args->num_vmas, sizeof(struct drm_xe_vma_mem_attr),
  2230					   GFP_KERNEL | __GFP_ACCOUNT |
  2231					   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
  2232		if (!mem_attrs) {
  2233			err = args->num_vmas > 1 ? -ENOBUFS : -ENOMEM;
  2234			goto unlock_vm;
  2235		}
  2236	
  2237		err = get_mem_attrs(vm, &args->num_vmas, args->start,
  2238				    args->start + args->range, mem_attrs);
  2239		if (err)
  2240			goto free_mem_attrs;
  2241	
  2242		err = __copy_to_user(attrs_user, mem_attrs,
  2243				     sizeof(struct drm_xe_vma_mem_attr) * args->num_vmas);
  2244	
  2245	free_mem_attrs:
  2246		kvfree(mem_attrs);
  2247	unlock_vm:
  2248		up_read(&vm->lock);
> 2249		return err;
  2250	}
  2251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

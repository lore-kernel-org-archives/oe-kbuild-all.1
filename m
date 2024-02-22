Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA01A18AE8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708591599; cv=none; b=lN7Y2AQhkArcI6MPI4pLjnzGJdsUOcLT9iic1HLHG0LbMQM78b7QsytO/DwDN32tBdXBC2diBXBa7piyMyXLVAQYJsWgdJVtHjhFyoRiH/ht13l36DBcqJBnpmE4pz5/tNwAYsbRG4EwX24VnZHez5CjXQO4Jkq7p073ekBr2RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708591599; c=relaxed/simple;
	bh=97f/yA/P3x7nnlJrVgpqa5wARXH286UZeH0IbXFLq+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=az4NgrYuWaZdAX4fw0dfS+UNyA2Dk+2jaEIAPjnqiTUfRiN6UAMF3C+Hsp7DVwhi/Bs7cCKbZQYDNGOoMFqkimIF588ScncOfmJmLVJ1KjEBKGfk2oxBNXDs+RRwDrim7Lq3RDHRLnoYa2p5AOCYlhrEAEKwEWaojRKNmrm9wVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGUoRrBe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGUoRrBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708591597; x=1740127597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=97f/yA/P3x7nnlJrVgpqa5wARXH286UZeH0IbXFLq+8=;
  b=TGUoRrBe9ixQNVSm4BhkD2rmeYMZD14DDGk48ItuqexBLm8VtXhw77/Q
   DsJDSKtnvj8bfl6ByVKkYkbqkdmJQ3dKu7mvscVJrjdZEDK2sttN08Fii
   K9p55nO++Y9lNtpiiI/uyXCdNo4CjpdlZnV1tkEi0H459c+Tkp3kf+XxC
   PEqzXDoZTn10dcasc7c2eSn57d7YJVlx2DZGFAc6D9WwBhufR5E8PRpsS
   YDaWzoFeh8LHDAF/s7AnqkYZqT0lU8KwWRbqCQ8v/spEJY+We5/kLpZ8o
   X4mBI/9125IKuMvSaTfWRXOZI8/RLCQf4zObaM0B5sRUC60p+1k/RaxUV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6580882"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="6580882"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 00:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5319376"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Feb 2024 00:46:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd4hO-00068y-0J;
	Thu, 22 Feb 2024 08:45:28 +0000
Date: Thu, 22 Feb 2024 16:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/bpf/arraymap.c:481:5: warning: no previous prototype for
 function 'array_map_mmap'
Message-ID: <202402221644.OqTCUvdz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: baf209a9c2de44e08631b16d89b30a77bc186b79 bpf: Add mmap() support for BPF_MAP_TYPE_ARRAY
date:   2 years, 11 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240222/202402221644.OqTCUvdz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221644.OqTCUvdz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221644.OqTCUvdz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/arraymap.c:481:5: warning: no previous prototype for function 'array_map_mmap' [-Wmissing-prototypes]
     481 | int array_map_mmap(struct bpf_map *map, struct vm_area_struct *vma)
         |     ^
   kernel/bpf/arraymap.c:481:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     481 | int array_map_mmap(struct bpf_map *map, struct vm_area_struct *vma)
         | ^
         | static 
   1 warning generated.


vim +/array_map_mmap +481 kernel/bpf/arraymap.c

   480	
 > 481	int array_map_mmap(struct bpf_map *map, struct vm_area_struct *vma)
   482	{
   483		struct bpf_array *array = container_of(map, struct bpf_array, map);
   484		pgoff_t pgoff = PAGE_ALIGN(sizeof(*array)) >> PAGE_SHIFT;
   485	
   486		if (!(map->map_flags & BPF_F_MMAPABLE))
   487			return -EINVAL;
   488	
   489		return remap_vmalloc_range(vma, array_map_vmalloc_addr(array), pgoff);
   490	}
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

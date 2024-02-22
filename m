Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B16173F13
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 21:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708638467; cv=none; b=tIVCrWPaQiHpWsoriCVf/y3RjUQ2YbIh8XV38ObKy5KYr25BJAZ/L95YHOZSjInX+rScYkdS2KTOQyK4MfD/LKhif7D32MDWD6dY6oUmmtmyPj4Igg4z5k9tth3rFrs4YPmdWQSAkRx1RKCTIKEm/F6WcYpvHqlzS9zaZUszGCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708638467; c=relaxed/simple;
	bh=GYCYV5cEfPzTX5YDPgrampsGX9gWS3Mb1SHhs7hmQPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PDafdQ6J6v0amHtgXPJmBLJ6vgxzSXExzo3LAujFshMIlenlDLmQVRsfpPNPiPnIDUt9bbGz9hDTLMjASRrOiD+A2ubFEDdx28V72KOAu3hLs9hhO1dGYGHsYCb0ZFkKwVCy3SZfVFrasrjO61ZWxFQUntFvaEKc3UI0Q9yLMXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d20/eEq8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d20/eEq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708638466; x=1740174466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GYCYV5cEfPzTX5YDPgrampsGX9gWS3Mb1SHhs7hmQPA=;
  b=d20/eEq8hixu2rqFebR3cHBYu7HowlALlzTHaEJfkgr2rw0UPvZKRZOE
   VGuk2VJFCemJniYn6i2hnmOPFH/6Rjj2c29BJZ8bi+n9eNjRMCfsW0xjh
   Gm9XgpPdR6GJdc+klQUHGOIKzUxCce/AtMuA6X1uTUPOHEyzaf0Jks32M
   pgNj3pJaQ4gEPjZ9TLfHWVBin1Y6hcn9Cb308aEd2GrpZKLeL2+Uu6bft
   NbtSwLXOUtgAmiaHNuWGW+7ijc6qaMTtKprSTcjQNCfApU1MIEMfmUmq2
   I/JQf7ScHXif//r1BzHDw6Km1QOtN7N6iSpgUdEalPweHq6ZPYXV+YvhT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28338741"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="28338741"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 13:47:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10219455"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Feb 2024 13:47:42 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdGup-0006jg-2e;
	Thu, 22 Feb 2024 21:47:39 +0000
Date: Fri, 23 Feb 2024 05:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/bpf/arraymap.c:481:5: sparse: sparse: symbol 'array_map_mmap'
 was not declared. Should it be static?
Message-ID: <202402230533.1XSfMcAk-lkp@intel.com>
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
config: x86_64-randconfig-123-20240222 (https://download.01.org/0day-ci/archive/20240223/202402230533.1XSfMcAk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230533.1XSfMcAk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230533.1XSfMcAk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/arraymap.c:481:5: sparse: sparse: symbol 'array_map_mmap' was not declared. Should it be static?

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

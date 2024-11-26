Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A76ECA64
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 02:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732588767; cv=none; b=D+jjpybQ3pD4sF8P0tDKwBRpX7CqrfcazDvXkChkzSe5Ev7d6pOTx98kpI4zU1KRWyFy7dEqSBORotkWv4XqHV5ImoVV5RVQk2zf+aPmCs5SB8MPej9SjKDyoVdKmupcgFzjj/a9+3S0hwQS3pDTHPsAQjnYmbO1tAjb1LmP6vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732588767; c=relaxed/simple;
	bh=FZkPfy8tPqfbk6vJ7GOikXflpBczPToo4Ke07i9EOMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=moVx5hBYhBQlIffv3zMer3Yq5+Q7D6iPWq9aJVnXFrFoGeQqy9qXfI3+DFYTRZeIX9qAV9hBsqc7Si6IqWpf3/UsSlimfjcGpMb0a5khh42ANqteHh6xo3KwWRABwv/Ki9VXk+9ikOE9USMpGOpsb2Ap1Gm77tQuMTz+thD1Ww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IypGrbCw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IypGrbCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732588766; x=1764124766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FZkPfy8tPqfbk6vJ7GOikXflpBczPToo4Ke07i9EOMA=;
  b=IypGrbCwVXYodoQpo1j/jEhuWFi2lgdCuVOdxMmS1PGt/Akan+OoiJEi
   VwVADTAewnDPyGTZmm86sKqLVOqSF7KYJ33ZL7AyYx9mao3TqGIfMVjI0
   jPIe6aiwzJDyOi/tBKJWB7jLU6Nxf+vJ99Y80+9XGZwLBs9nvnS1di1PV
   IAVwo8eWpFBpYsmvxA/dXqCQmdS6iZ120UM3yoAbqmSQDqpgFUXJxLLSL
   2rHeu8GhNqdcfe1HLf5/URobEKsc7vlKTL334DsYgtiGs7l21y4CGOF7r
   fZMkbDOmqge0hxC/s8ITLXa5JpCr5nlNvYnKh7GmlVjW5yBUbAblR7qpr
   w==;
X-CSE-ConnectionGUID: D3PkpCEURe2N1H+mMLXAVg==
X-CSE-MsgGUID: pxVjhNBcRdyyD8WtrjaZzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32879913"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="32879913"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 18:39:25 -0800
X-CSE-ConnectionGUID: hAQ4eSsaRoufbdvk3s805g==
X-CSE-MsgGUID: wphyBh3TRV2Ebt39Tu7XdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="91084216"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2024 18:39:24 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFlU1-000701-2i;
	Tue, 26 Nov 2024 02:39:21 +0000
Date: Tue, 26 Nov 2024 10:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:syz/region-conversion-3 13/20] io_uring/memmap.c:386:12:
 warning: 'io_region_mmap' defined but not used
Message-ID: <202411261012.C28PcFox-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux syz/region-conversion-3
head:   eab28eddf62efd7e9a5d20b3b41e5943c9065e90
commit: 9d971641dc86981b9f6d12433fe55ed9d506ae32 [13/20] io_uring/memmap: implement mmap for regions
config: arm-vf610m4_defconfig (https://download.01.org/0day-ci/archive/20241126/202411261012.C28PcFox-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261012.C28PcFox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261012.C28PcFox-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/memmap.c:386:12: warning: 'io_region_mmap' defined but not used [-Wunused-function]
     386 | static int io_region_mmap(struct io_ring_ctx *ctx,
         |            ^~~~~~~~~~~~~~


vim +/io_region_mmap +386 io_uring/memmap.c

   385	
 > 386	static int io_region_mmap(struct io_ring_ctx *ctx,
   387				  struct io_mapped_region *mr,
   388				  struct vm_area_struct *vma)
   389	{
   390		unsigned long nr_pages = mr->nr_pages;
   391	
   392		vm_flags_set(vma, VM_DONTEXPAND);
   393		return vm_insert_pages(vma, vma->vm_start, mr->pages, &nr_pages);
   394	}
   395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

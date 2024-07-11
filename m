Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09F216B72E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 15:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720713453; cv=none; b=snzxmfL6ZWZaZ0tm+L8GCUi30LMtE44Xgsf/ESyCr4o0qxU50shxMPKg13KSqcW83hxcUXrNatQ8LfAjub30mKOMmwf9znc+wJN75/3rboSHiDVRNIFu0ahp0ujt1TGf2/gPImNw6Tk8rJfZqNi4UKACex4fVT2fviLLhLmMIxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720713453; c=relaxed/simple;
	bh=7phXK4iDnNzzODPudDZKIZ/bNGOzKVvyssWtKQgoW5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DMjSMX9MFwFuxmRXxncOrOhlPNEtXaa3jz3VpjgFBfTb0FZZ8xsIAzeuepzBXc/EiXHHc2xouJBcjO/rHyo+VS+FpnPe970VxmRrR33SCCmhSZAP/+K+j7SxLwe2M+AUrnmZaZy1GEZK60QA+fURvZSmM6mOPYG9rW1q/Bw+Ick=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VCiqJTFD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCiqJTFD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720713452; x=1752249452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7phXK4iDnNzzODPudDZKIZ/bNGOzKVvyssWtKQgoW5c=;
  b=VCiqJTFDL2k9I1FFjrVqoLsT2czQGxJrtqqv64HbXZ3nrI1lssrijQ/A
   YzdorjOnBifWREo3w7yko5smKupWS18KVicd7y8UENOJjPUPd/KFOq20f
   8WrNn3Z7ZnCz210VU7/6krwewt6sVyZhslRa3xDlxfmrelB7XAX48wN8D
   yY1Ytwavr7KX2hgHKYz+VsINiPV4Zwz7w9sP2desiPKGY2QO95AuUCsVn
   ypPSUypBSH8tpTVKmKN+MEVGAgTt9iR62WxM4dZvT1Q+Noh7LZUr+17wQ
   LE0XurtgFseaZuMxRKUH/LOx4BDBj8ZmKWRU41VVu7gYKU0RB9VWpQY+L
   Q==;
X-CSE-ConnectionGUID: DjeQ4hyKTHm3OtR+3WO80A==
X-CSE-MsgGUID: DWUGN3EVRC2Fczh8+zdQuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29258525"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="29258525"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 08:57:32 -0700
X-CSE-ConnectionGUID: A/B3TwXzQk6A47gTcTI6FA==
X-CSE-MsgGUID: 1guV5VLLSzq/ZwO9nOTrJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="52992694"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jul 2024 08:57:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRwAi-000ZSS-1S;
	Thu, 11 Jul 2024 15:57:28 +0000
Date: Thu, 11 Jul 2024 23:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-static-calls 2/2] mapping.c:undefined reference to
 `iommu_dma_map_sg'
Message-ID: <202407112346.hSHAH9PY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-static-calls
head:   f2b699aea8fff5589a674da2a567fd593ed2d386
commit: f2b699aea8fff5589a674da2a567fd593ed2d386 [2/2] dma: Add IOMMU static calls with clear default ops
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240711/202407112346.hSHAH9PY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112346.hSHAH9PY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407112346.hSHAH9PY-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: kernel/dma/mapping.o: in function `__dma_map_sg_attrs':
>> mapping.c:(.text+0x22c): undefined reference to `iommu_dma_map_sg'
   sparc64-linux-ld: kernel/dma/mapping.o: in function `dma_unmap_sg_attrs':
>> mapping.c:(.text+0x4ac): undefined reference to `iommu_dma_unmap_sg'
   sparc64-linux-ld: kernel/dma/mapping.o: in function `dma_map_page_attrs':
   mapping.c:(.text+0x1a34): undefined reference to `iommu_dma_map_page'
   sparc64-linux-ld: kernel/dma/mapping.o: in function `dma_unmap_page_attrs':
   mapping.c:(.text+0x22e0): undefined reference to `iommu_dma_unmap_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

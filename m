Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34771B0F23
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 19:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765048500; cv=none; b=eDdDsuH1sB/MzHK9HBSuw8VcmOZyjprboqsx+LSJUnhvzcWYW3//XRR7xErTHtHevvNjzlOzlSsYlEbfAMHo7Q0g7oAcSEnMh3EFrfl0pzqcYduUyR037KbWM2gkBhRkCZu6qFmyIovjuWosg3+wCoGT2qHo5PA/QBHn2R2KDhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765048500; c=relaxed/simple;
	bh=SbNuzdsaQ6vdqN3IPUAVMnz/Sv2uJF3ASxFg8Iodd+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e5HKLazt6dd07DzTTyJ3AZ8F4ZsCB6tHYAy0PIga0hq50SJ+mnnfDSpYSeYcSA+qBEv1Ebp0aU6WcLSLkjq4y+PsFnyH1jKmEXtvWCD/DKHoKSMEavC7itD7U+DC0B26gINdGxay6uKS57DzPU4pz3Q4gADsmS+/raAjWidk/uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YeddEg3Y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YeddEg3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765048499; x=1796584499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SbNuzdsaQ6vdqN3IPUAVMnz/Sv2uJF3ASxFg8Iodd+8=;
  b=YeddEg3Y9Xdo/YDJuTajyOfUl2UHHdrbZmgq2puDRncnMUdXoMQBD1ti
   iVIRh6UnPjnKFj20k+ERNdc2w4ry6AVmC3jmePcEjyI79bMZdulV0UINR
   mBr0o5M9s3FZ65uMY13d9T13Ulh5XlHHYDQur96FGlYIoNeJbRj9UVF5y
   SdZY+v9gUOByeIhU/or96iEWoaWli7W0LVUYyg3PklAfnMzrqt/qiFU9A
   0RrXBl8HHFDHaJddQx9GleBMrVVyxI2z4MOhvEPcY/J7SNGH1qNRknKNk
   43nD2HgP/dmbRetiOTo81o5cffN4DIZ82uTDwRcwkDN0kfJQoHtTLCv4Z
   w==;
X-CSE-ConnectionGUID: VRzRpU80SPK20E3T2xslbQ==
X-CSE-MsgGUID: w7kAsFe4SB26Ycryj+ujmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="54596085"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="54596085"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 11:14:58 -0800
X-CSE-ConnectionGUID: zx80sjKSRSq99f7cLyxVYQ==
X-CSE-MsgGUID: 1mYDqFOoRvegY/2K7gLF9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="194865032"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Dec 2025 11:14:58 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRxk6-00000000Ih3-35OW;
	Sat, 06 Dec 2025 19:14:54 +0000
Date: Sun, 7 Dec 2025 03:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.2 12/32] ld.lld: error: undefined symbol:
 bpf_struct_ops_link_to_ops
Message-ID: <202512070325.66t3fDqE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.3.2
head:   757d46bae762bfc65cab977e0365e3f110f4e300
commit: be141dd2b9c46247d3c6027219b6ce84a01badce [12/32] mm: introduce BPF struct ops for OOM handling
config: x86_64-buildonly-randconfig-003-20251206 (https://download.01.org/0day-ci/archive/20251207/202512070325.66t3fDqE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070325.66t3fDqE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070325.66t3fDqE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_struct_ops_link_to_ops
   >>> referenced by bpf_oom.c:44 (mm/bpf_oom.c:44)
   >>>               mm/bpf_oom.o:(bpf_handle_oom) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

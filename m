Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB3423FC5A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 02:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767754161; cv=none; b=EN3iKFCAhrayr9ntZTCNpnAf38GH9FARKH/3b4FqI/vR7uOLUmrp7Y9dM67c7DS52WkXlgD1Xb3jJwOvxg0ucbhFyJI9JqYJVRV5CiXSK3e5cljcpwhk9YWcvy15VqTdBUKsaR1wAdPUesbFkrczrU3UPXoZq0VXSAhIpGMzv9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767754161; c=relaxed/simple;
	bh=vDJS0XJIvShHvy1s5LI88yF/ezwgGudEa1Vg4keUD5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hmy7gAaLfXhrFkS65gOT0mCZKF6uW2kEKqEkxjPO6MGM/rEM+cGVm1FOnBOQzGfP8kvQz1o2JENXFrqCOyRIyKVygNrt1ug0EoPwVMSHn+3OxjRV+ieI0vzZ/iveVJXA8ppySWckp6iop0eqGvq6m95XhY6lulHnmIlZmapw2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PrkLMM/1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrkLMM/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767754160; x=1799290160;
  h=date:from:to:cc:subject:message-id;
  bh=vDJS0XJIvShHvy1s5LI88yF/ezwgGudEa1Vg4keUD5M=;
  b=PrkLMM/1uq7c/IrefRbPqgWnjZZKHszwqqXOlcgSEzndc2jx+1qJoMc3
   eI4pfKk8WQs8b5Dr1K0zyh/+urSzxIdqC2gtI9nW87dBUQjREvtZ0oPGy
   c5HrOW/ayvyU48Ylx5PO62mYJMB04ql1u2pS1wwr/GEf6CGIthWiOpDLe
   JibHE2R9y5BRd33NXtcgp1uWsBvxp5IggWNrn0swWk473SeKNij0SkMFd
   PXgZwe9NeV6duYqX5YvO2z+xJni+Br6RGKHZMFiAsQdd3gyGYPKNJTWZu
   BhChQcwAAAZQnR+GdIU7r3OxoaIh6d7WNsjKbw27KgWZB5ySglRYPAiXg
   Q==;
X-CSE-ConnectionGUID: qqut/HQgQZGpqOo80XvrhQ==
X-CSE-MsgGUID: dxVuxTMSSO6+nDzQv43Z6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91780223"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="91780223"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 18:49:18 -0800
X-CSE-ConnectionGUID: Wn6dzBCtQjWRv50KH13oYQ==
X-CSE-MsgGUID: W6VBBuUSQC2w3bGu9iPxfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="207680682"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jan 2026 18:49:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdJbl-000000003P7-3ofK;
	Wed, 07 Jan 2026 02:49:13 +0000
Date: Wed, 07 Jan 2026 10:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ERROR: modpost: "__ld_r13_to_r20_ret"
 [lib/zstd/zstd_decompress.ko] undefined!
Message-ID: <202601071032.PQHPKfyf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Nick,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
commit: 65d1f5507ed2c78c64fce40e44e5574a9419eb09 zstd: Import upstream v1.5.7
date:   10 months ago
config: arc-randconfig-r061-20260107 (https://download.01.org/0day-ci/archive/20260107/202601071032.PQHPKfyf-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601071032.PQHPKfyf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601071032.PQHPKfyf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__ld_r13_to_r23_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r19_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r15" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r24" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r19" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r23" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r24_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r18_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__ld_r13_to_r20_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__ld_r13_to_r15_ret" [lib/zstd/zstd_decompress.ko] undefined!
WARNING: modpost: suppressed 2 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

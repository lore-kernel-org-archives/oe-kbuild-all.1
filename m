Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791B53EBF38
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 02:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771034457; cv=none; b=B9vI4AOSS2gBwR7bnMeQD0GIx2Bk7okgJopmsP/g34QcT3xEOnA3PkvQA2zGotPDpUf6QHnOm9g8j9ImI/NEBSpGE/ssk/bSh8VwgHQggS4wACrBfnJkkHTZeNZ6hg/iZsay2mYHXc4yaj9KRnmkfk8HE4pJSyINgf1HOmnwQyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771034457; c=relaxed/simple;
	bh=cCnZh+QDfCMqHPnKUbPyyDGXR2m0Ek6gc2qMX8QKEcE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yc06AUxap1RAL1J7umdfdGPEBQ+aqflUCxBV1lT3NJCKl4wbN1dQcfWgS+4lvOV1I+6lUgZq4PS2xhPEGSjdBLRmBk1GsMVHsb4wOsM5r8HcqbBGkcrbcEonopF4zICa8q6cePAGCUusqvnqi0Z0VFtXo8M0whXUpcAunwhAZhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sm2BErtm; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sm2BErtm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771034455; x=1802570455;
  h=date:from:to:cc:subject:message-id;
  bh=cCnZh+QDfCMqHPnKUbPyyDGXR2m0Ek6gc2qMX8QKEcE=;
  b=Sm2BErtmBkv10YKPDfYrfbCvM0pcIUhEO7nVO64MPIRWJZmHJFlA3hTX
   RhNBHs3jac2+TLPlq741cIi8leU8GYnkAHMalinOf95zRst42c3dIlJ6e
   iRpik2YxECs8Tqo6MfJ0fYxoPPLaZrZIdyw+RdUkjg/O8o5O3d4lP0s2u
   aPwbHe4KSWTAOtlygZg0O990VlpOhivGIay691OqTKC4ZIpLF8IpC2w6V
   a58YpF8cY8yWALf+cCHikkANu69LKzHUis9WRMROdXNLOdfbpsvn6THYQ
   3VF/DP4xatzZ7YQnmoVu3HhsJccO+wC1e2ZNsLF4GdG/3wGM+sbvA8F3a
   w==;
X-CSE-ConnectionGUID: rDMZZTOrSba3cvggEc88cg==
X-CSE-MsgGUID: Ib0+D5AvSSeno1fKCntDBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71417525"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="71417525"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 18:00:55 -0800
X-CSE-ConnectionGUID: KQLdzc4GRleWtviUjmH1Wg==
X-CSE-MsgGUID: XiibxT7hQ6K53OfJA08QJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="213091968"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 13 Feb 2026 18:00:54 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr4xn-000000001jZ-1WOK;
	Sat, 14 Feb 2026 02:00:51 +0000
Date: Sat, 14 Feb 2026 03:00:01 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-mbu 1/1]
 ncdevmem.c:364:33: warning: unused variable 'queues'
Message-ID: <202602140233.xllk6B7a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Cosmin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-mbu
head:   6edf3ba07207a117cb90e8ac84c475191d0d227d
commit: d308312acd0cbbf40b97a018eff5659b09660fae [1/1] tests/ncdevmem: Fix double-free of queue array
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260214/202602140233.xllk6B7a-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140233.xllk6B7a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140233.xllk6B7a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ncdevmem.c: In function 'do_server':
>> ncdevmem.c:364:33: warning: unused variable 'queues' [-Wunused-variable]
     364 |         struct netdev_queue_id *queues;
         |                                 ^~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

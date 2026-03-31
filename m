Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA882D3A69
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 02:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774923957; cv=none; b=BHLVOvmZt2GIE1CUuOdPOjuoE6Z4BZHKCnlQ68PoxZZ3kszG0LSmINZA2jg4K2haFx2f9fov6TT/1EerO14yIf77IOSF+QivlIRZ2XDDPjAAO9h6cyF18At9zi2XAHMsWpG4GpyEyxdWvddaB3RIMMivayUj8s7Wl0I8njCY4CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774923957; c=relaxed/simple;
	bh=/kpMDltukmD8sIG6BMt4SQPEfht/WNQyKIoAc8YIlYg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g3Dnd6N807ql87KHXwhQ1H095DJA2UR60A84+/N2AGCcFBz8xdkDNmVmZmBajIfV/MRNDmsptzMRY6tKzoKaOsdURpODNiIjlBb81svxXrw8+85xceCqcUOX1uqeT6ixzOrAh7dhJR+tY0gwhft4sdDEScJ00L/M9sXs4/TfhsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYfu3vGl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYfu3vGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774923957; x=1806459957;
  h=date:from:to:cc:subject:message-id;
  bh=/kpMDltukmD8sIG6BMt4SQPEfht/WNQyKIoAc8YIlYg=;
  b=jYfu3vGlei0Z1gTZqF4xarCTmCGhxjPSZqC3t3kbTs1J+DBAeu171hHf
   Ad8QLp/cuwsm64/ME6TMJ+LyXfzjs0anxYddvov3IrtSUUgob7XwGhZUw
   3CYddXB81TZWpbeHDPfk6r+efY0neHuc0qM5Bk4XKU+JJP3FzczRhU5NC
   5WzwNW/BhLJ1pAEsV6lFaeJZvCHjMd+3yRONSuA12zUuAFO0mzmQyplgc
   68yyQs4qqG0JNTNaoHxFmeq2Q3kvDVXLlqayS/d7FzeYQgEHQVx7Efslc
   WcmmVb2pheuFePnedMk26wnSbL/8hGjW1fg3LeppovX6fZwPn4jKrEaj2
   A==;
X-CSE-ConnectionGUID: ugWvxGU3R4SyFcDdZ8Stog==
X-CSE-MsgGUID: lUBb57sMQTiY+yMrR5EcTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="101385237"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="101385237"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 19:25:56 -0700
X-CSE-ConnectionGUID: DYDUdLYXQxOyJZCazG09KQ==
X-CSE-MsgGUID: DHK8teVORjyDCuL9o1lIWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="223345058"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Mar 2026 19:25:52 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Ond-0000000022X-2ecn;
	Tue, 31 Mar 2026 02:25:49 +0000
Date: Tue, 31 Mar 2026 10:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:alloc-token 1/1] Warning: mm/slub.c:5287 function
 parameter 'token' not described in '_kmalloc_nolock'
Message-ID: <202603311022.GRy4rRnk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   6347bd6a238222ad586e6595a04c9b07c668e2f2
commit: 6347bd6a238222ad586e6595a04c9b07c668e2f2 [1/1] slab: support for compiler-assisted type-based slab cache partitioning
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260331/202603311022.GRy4rRnk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311022.GRy4rRnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311022.GRy4rRnk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/slub.c:5287 function parameter 'token' not described in '_kmalloc_nolock'
>> Warning: mm/slub.c:5287 expecting prototype for kmalloc_nolock(). Prototype was for _kmalloc_nolock() instead
>> Warning: mm/slub.c:6743 function parameter 'token' not described in '__kvmalloc_node'
>> Warning: mm/slub.c:6743 function parameter 'token' not described in '__kvmalloc_node'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A218025A34F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 22:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760568153; cv=none; b=cXEfQKW0vVwb1jB8S7+c4fzdkFYsVswLOL6KNr7AENreYQhz2CT0p0i8kWG+xU6KFZkqG6ZZT+1QGK6pViRkU1V8uhj+p342Ijv3obb2UkFLGn201AIOGTOhGKdf7cTVTQoKKULGUbgUe6jYsH1dpgDnWkRArY+bhcU9qnjz4Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760568153; c=relaxed/simple;
	bh=rAkFymKhCV4uLono4L4rRGPsUZNSns6Ue0Kx97YPXSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OuxEfMUrhILB2PugJtL6rRh6ooEU7UvA5EoAoKU2UgbOKIaJ+obUFShapdc0frEmwRogWewH+w2jn8sZSh+KjMF1OLX1Yk0x4+NAzAZKoFJ5/BhmRAiCSrUhmuMN3ssEd0djt1vFyVu9g5LCkyJvOxLBqdPTqBsNl0z4GWbTJkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgrbclJd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgrbclJd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760568152; x=1792104152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rAkFymKhCV4uLono4L4rRGPsUZNSns6Ue0Kx97YPXSo=;
  b=LgrbclJdrL8hrxLoTDnYKgV8zaNjfOpMp5nKOEifuIAUC3RrGLZ8GgEz
   nTGHOqZ+XXVaTB/hGM8H3E5DqFUWg9M7T1FnbFlr4pkAzF+C++2W915ov
   qUk75357UEGrv5OHHIN6XR8dBUr7Van6R6m83RI0+FK0vVnc9a+WfkYcL
   FT4qnN+cG1cz+GDYON5VbMKl75DCnbAOEamdgmun7WfxEQ/1/MhO+QfyF
   HITKsSnVssubQQPkww9Y1bSVKU++m6AK6OuXr5lo4UO14KJ0zqfZJn4v1
   2GPXH/1HkJFafcYVkVBoCpmmm19p8ezj1iRVFnlne7kZayJll2UCQU0Lz
   g==;
X-CSE-ConnectionGUID: nWw0Gd7iStWpeHkj7ZgAIA==
X-CSE-MsgGUID: GD8a0yy3S2GqV3QZXEjqwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="50320750"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="50320750"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 15:42:31 -0700
X-CSE-ConnectionGUID: IdomcS8yRL6sCl3chD8QyA==
X-CSE-MsgGUID: F/In1XlfRyqls0HkTP0v0g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2025 15:42:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9ACN-0004Gx-2x;
	Wed, 15 Oct 2025 22:42:25 +0000
Date: Thu, 16 Oct 2025 06:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Kirsher <jeff.kirsher@gmail.com>,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: [jkirsher-net-queue:master 4/4]
 arch/arm64/net/bpf_jit_comp.c:2258:6: warning: no previous prototype for
 'bpf_jit_supports_private_stack'
Message-ID: <202510160654.3Xq2RJTy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git master
head:   c9a8544415241209a476e56cc98a09ab074e29a8
commit: c9a8544415241209a476e56cc98a09ab074e29a8 [4/4] bpf: Add support for certain atomics in bpf_arena to x86 JIT
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251016/202510160654.3Xq2RJTy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160654.3Xq2RJTy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160654.3Xq2RJTy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/net/bpf_jit_comp.c:2258:6: warning: no previous prototype for 'bpf_jit_supports_private_stack' [-Wmissing-prototypes]
    2258 | bool bpf_jit_supports_private_stack(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/net/bpf_jit_comp.c:3096:6: warning: no previous prototype for 'bpf_jit_supports_timed_may_goto' [-Wmissing-prototypes]
    3096 | bool bpf_jit_supports_timed_may_goto(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_jit_supports_private_stack +2258 arch/arm64/net/bpf_jit_comp.c

91fc957c9b1d6c Ard Biesheuvel 2018-11-23  2257  
6c17a882d3804d Puranjay Mohan 2025-07-24 @2258  bool bpf_jit_supports_private_stack(void)
6c17a882d3804d Puranjay Mohan 2025-07-24  2259  {
6c17a882d3804d Puranjay Mohan 2025-07-24  2260  	return true;
6c17a882d3804d Puranjay Mohan 2025-07-24  2261  }
6c17a882d3804d Puranjay Mohan 2025-07-24  2262  

:::::: The code at line 2258 was first introduced by commit
:::::: 6c17a882d3804dce1c66e1fec25f96d39a184067 bpf, arm64: JIT support for private stack

:::::: TO: Puranjay Mohan <puranjay@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

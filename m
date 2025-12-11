Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16751F30A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 02:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765421133; cv=none; b=GAgG/wDbmsn1CxXN5beg5rb6BTmonMku4nyeoS+Ca8PPORzQ5ujyVsjhaMR61YV6IzJzL+GxC5nzX2KdM6+qw60hxleHMJr9C1/K3CphgwyCcoupyLwRgrDiGJMTuFd7RO8fH3/62t25eLbyco1HDU2iABwcfVkFQ9y1v0+Itq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765421133; c=relaxed/simple;
	bh=NKwhP9ifmmxfMcRXa72xuK/xsRqh0zVSX4OyAPb+U/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GhkWyqUMVNaFtOtD/oDaciK3MFwKt6/maHOloU9dP7SlOHe1XGOeqmA4RnYJsvalynOHOvpyheRGASidh0cwl9Ly2sQV5uwWTCCQonG9Vj3MWD9axReZDViD6bpq/9Sssk9H6T3IMulZMy/jAhyje+xKjMgwXsgo+3nL1Z+zj2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQel8D+T; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQel8D+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765421131; x=1796957131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NKwhP9ifmmxfMcRXa72xuK/xsRqh0zVSX4OyAPb+U/o=;
  b=KQel8D+TdXSneoHw7c/nIvU6eQlevhGpIbPBQna8E3fyQq9vJDOyRTBx
   icqJuxKp4MWVx4XT40bPWyVeV3tUKEWYhO6kUz7Yc42m+dP8FkNUarxgV
   JJqbaGa4D5UkXuu2TXAsxtRs5H4C2lTbXQSdghPbK+qNZEKR0IXL+cH+j
   48yUk1e6dusrfgam+0tquGAYL0VJ/SmiNPi2RyWNTP96TtKu+lQ5oJLIO
   KnDxcXJeVV8Bv7fxi1APBzfcDz2JidmK07NAz8Bc4Gl4z549DpM3ffU8C
   62A+GM5VapHDWBZZzEif08808lAkElMf2DtBGJDs9fWMfnxm1n1U3lKbw
   w==;
X-CSE-ConnectionGUID: OdQ+yHB8RXq+EEufahMTsg==
X-CSE-MsgGUID: 2jIGx1ZeSdqXc/9WzkY+gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71246983"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71246983"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:45:30 -0800
X-CSE-ConnectionGUID: YhACNYDrTlytFlr2eeCV1A==
X-CSE-MsgGUID: qVkZyH3XR7Wy6hmID4mwig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196685903"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 18:45:28 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTWgI-0000000044F-1pU4;
	Thu, 11 Dec 2025 02:45:26 +0000
Date: Thu, 11 Dec 2025 10:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: Mykyta Yatsenko <yatsenko@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>
Subject: kernel/trace/bpf_trace.c:3619:52: sparse: sparse: cast removes
 address space '__user' of expression
Message-ID: <202512111057.s2Tp972J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c8081cc599fcafa25371d50959c17e154f9fd08
commit: a498ee7576de24b4b0916ce56cf2686e261a29f7 bpf: Implement dynptr copy kfuncs
date:   7 months ago
config: x86_64-randconfig-123-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111057.s2Tp972J-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111057.s2Tp972J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111057.s2Tp972J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/bpf_trace.c:835:41: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *[addressable] [assigned] [usertype] sival_ptr @@     got void * @@
   kernel/trace/bpf_trace.c:835:41: sparse:     expected void [noderef] __user *[addressable] [assigned] [usertype] sival_ptr
   kernel/trace/bpf_trace.c:835:41: sparse:     got void *
>> kernel/trace/bpf_trace.c:3619:52: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3633:56: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3647:52: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3654:56: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3662:52: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3670:56: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:871:25: sparse: sparse: context imbalance in 'uprobe_prog_run' - unexpected unlock

vim +/__user +3619 kernel/trace/bpf_trace.c

  3615	
  3616	__bpf_kfunc int bpf_probe_read_user_dynptr(struct bpf_dynptr *dptr, u32 off,
  3617						   u32 size, const void __user *unsafe_ptr__ign)
  3618	{
> 3619		return __bpf_dynptr_copy(dptr, off, size, (const void *)unsafe_ptr__ign,
  3620					 copy_user_data_nofault, NULL);
  3621	}
  3622	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

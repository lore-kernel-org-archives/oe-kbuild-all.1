Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D1F326927
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 03:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786075165; cv=none; b=jl7XefzyKk88DSE8McNu1xYdEjUENbjz/+78L5YUhkI4pJbvUGO+epJrCASidc5KI/EkkI4AhgVBoLttiyqf2KH5H/xzqd3Y8KbamL/bC+0e4B36U1wgbYCJ3dF5whqrEIiC1aVRFDaxdsINzzpI/QvpAIMBeJRGLX0s4Oit51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786075165; c=relaxed/simple;
	bh=0cg0mvAKifosR3bKJhkk28DnrAAjsXEjgKOIywCWF7A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RxYNKKmQk2NXTlMpy4wTUMPvXG3N/pi7wvyHvi1iPOQbrneIytCheowv8WhYWf9bFs/f/bRgz3q+kr/Dh4/ky9Ph6EOhmwzMrCo799v0koYLZkAGS5UwQ2M7lELqSV7AXrm1uPRhPLlFqTEp0lEY5EmF0Wc7jdjv6DLkosEMgo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hr2UrPYv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hr2UrPYv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786075163; x=1817611163;
  h=date:from:to:cc:subject:message-id;
  bh=0cg0mvAKifosR3bKJhkk28DnrAAjsXEjgKOIywCWF7A=;
  b=hr2UrPYv9J8BXFYQx2QfdfWl+7Fo8eeYWc0kvcfgYgPFkdim2G3MKqoi
   bX4o/F+17tFmHwjc5OhOITwTwF8vot193dX6gS+wmVTj+LOTGpiTk+fR2
   YsDjrlqhrda19wodCFWZqUlYSKLjQ6iB4/rfGtuxKg22uD6qa1XfpglTN
   NOMGYaZyEXg9TKTfElnbodnJEO/UQ6dqvu/3ijQoXTcdnzsMCE/u4RndF
   cn1CJUy/87eFM27z3uctna51DKFU3WbFAciw7GOguBT+KosVO5M1LInBd
   0jNNQDGsNboUly54+oyrotieVJH6PAgDuGgpj3T911g+F0jL0dQTTM6jh
   A==;
X-CSE-ConnectionGUID: 4xsm+ve/S/qL6hcab/sROA==
X-CSE-MsgGUID: gFP5fj4kSmO5uabnB9Lt+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="85651103"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="85651103"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 20:59:22 -0700
X-CSE-ConnectionGUID: FQBgs1Z2Q8avWlxTvNMU7Q==
X-CSE-MsgGUID: zvMIiEpSTDaejQSS8wNXsA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Aug 2026 20:59:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsBjq-00000000H5p-42D0;
	Fri, 07 Aug 2026 03:59:18 +0000
Date: Fri, 07 Aug 2026 11:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-args 14/14] trampoline.c:undefined
 reference to `bpf_prog_has_arena_ctx_arg'
Message-ID: <202608071131.ThQbWPKi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux arena-args
head:   15ae81f222268f3e796b1a2ab478fa12eda2354d
commit: 15ae81f222268f3e796b1a2ab478fa12eda2354d [14/14] bpf: Reject tracing progs for struct_ops with arena args
config: arm-randconfig-002-20260807 (https://download.01.org/0day-ci/archive/20260807/202608071131.ThQbWPKi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608071131.ThQbWPKi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608071131.ThQbWPKi-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/bpf/trampoline.o: in function `__bpf_trampoline_link_prog.constprop.0':
>> trampoline.c:(.text+0x5804): undefined reference to `bpf_prog_has_arena_ctx_arg'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

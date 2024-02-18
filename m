Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E21E86B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708276848; cv=none; b=svM/6/bdq9nTOESPTOQsoZbQLSCWQhx6yDlh04uHMwJupXq9JSKn5rNRHfzfFiSZDoBnauRwDwHt3C4MRZn4+LXnz/nbj57nJLMYfD6r2AhFHve93Fncr6RIe8oYNAL8v1U0u4GkOEQiwQ1lCCzPqaS2GpCOSmhCkm48iSR0EDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708276848; c=relaxed/simple;
	bh=Pn8BO21MVYOyT0tfTmKFD+KwpWLSyiDThagUTbH7OXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IFAhZ8HURACHcKi/MeiXkfbWc3Gaa8YKMjDJ9bKrnnBOIOYnY8HucYn5URFWss1dUGiCChwg+qLDE6QR+meCuZWc8hWmm0e4zP5iVsN3D3MZBO0/0WFrR8tqRD13SCYRFDDgXd0HWR7anQfXTWhwxbFW33wCQwOlApLE/y6/7dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNo9gEAw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNo9gEAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708276847; x=1739812847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pn8BO21MVYOyT0tfTmKFD+KwpWLSyiDThagUTbH7OXQ=;
  b=mNo9gEAw0sVuqn6gLu9fvVUqQ6KVo2vKUCB/22q7rt///7aqIZh0EFQZ
   iXYXRjmPFHh9WzenjpgwSURm8xMsjiSRzNYah1I81wHdQEiFhyPaC5+H2
   9E36ufQX9iBQo+aHV5Q9xujxbsjS6DLTQVfH09JMnaDeKDqGcnwWLafC3
   99xp9QWbFQWFIB6IitFt/DRbWAWD002JI/ixnaZGpyvQOk3MhKBOFXVe/
   TgHaykV/pddbnY0GC3x/YlmxhyeuyA1lh3lHFi0vQoXlC2m0vxxKlLAYE
   9nJpSl276VEsCIRPcB8ozfbcori2E3lGBSxAtrWtMocfxfqTPmmun/8Bq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="13761702"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="13761702"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 09:20:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="35327475"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Feb 2024 09:20:44 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbkqI-0003Cs-0L;
	Sun, 18 Feb 2024 17:20:42 +0000
Date: Mon, 19 Feb 2024 01:20:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 1503/7658] powerpc64-linux-ld: warning: orphan
 section `.bss..Lubsan_data37' from `fs/overlayfs/copy_up.o' being placed in
 section `.bss..Lubsan_data37'
Message-ID: <202402190155.8QIggQsx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d37e1e4c52bc60578969f391fb81f947c3e83118
commit: f568a3d49af9aed813a184353592efe29b0e3d16 [1503/7658] bpf,lsm: Add BPF token LSM hooks
config: powerpc64-randconfig-r002-20220227 (https://download.01.org/0day-ci/archive/20240219/202402190155.8QIggQsx-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402190155.8QIggQsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402190155.8QIggQsx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data42' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data42'
   powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data75' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data75'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data37' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data37'
   powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data42' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data42'
   powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data75' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data75'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data37' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data37'
   powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data42' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data42'
   powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data75' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data75'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data37' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data37'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

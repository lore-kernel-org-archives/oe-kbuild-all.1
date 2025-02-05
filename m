Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFC61519BB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 11:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755332; cv=none; b=KPuDyuQKYSgaUtZFLWUes6vbv6Tlz6VN6nrChzfkh403ifE/OoaZecUVIBICLvrfCKuL8iH7EwOfqq+hivQ1T9xd15eyzdmnHnyyYYFoBmJdIOWbZQ5Ajo1fwi4f4pzmj5Glp177MU4vjsK7gL5RK7+gBX4wCX/98g3r1YcExOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755332; c=relaxed/simple;
	bh=MBYSYxOMAl467s+Yp0WNUn4zTKJkztI++juZQ324Np4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SuTrvJI8YO482T3NDc17uHvsKubnVrpkpLcSZnwaXKSwjH8Wxg7nuJR4zRG+HLQOggD6L90Wduh7c2DW9+fb5fJ5ki2w8Hkc6mcUXy87sTDFgZDkbr8YkM5u/89S2HtCkXCSI6DS/qE9YPjmuvnLixAAzprklK45qu11Im8sc+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsPAVF+z; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsPAVF+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738755330; x=1770291330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MBYSYxOMAl467s+Yp0WNUn4zTKJkztI++juZQ324Np4=;
  b=gsPAVF+zn/CG9wxiKg4LmVCO57LLBdo+rkpN1HiBFajQJ1eFuvf+w8+B
   yTS5pvUJX4CPCGzR63EV8IagnWNCezaYOIxiJQJzVzeOo/olNynb8YYy5
   D+mogpcxc6vSTGBIS4YkRXTu1Wzj8Hijf5coTLELiq9UMgfV6gVcMd/lx
   j4MJoajDPRYKENpwtdNuJM2hPZG+LMC+WPHZ0PgiM9moZrrY0zQEY4CXe
   jeUOxkZYUfNhIL4Lb9ZkaT5q5QK81zdRRBZ/N+jv+K04HFJ6NvLkcwh+8
   dRdTaQs9St5k4dWo8sg9xPKxbSS7PFpTE66n3S1BRbiOyevcVdGPxVeAo
   A==;
X-CSE-ConnectionGUID: HwjVzFc3RvuIB4BacZBq3Q==
X-CSE-MsgGUID: BrZmBEciRKSukgfxqXmjfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39474814"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39474814"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 03:35:29 -0800
X-CSE-ConnectionGUID: 4pW89JHRQLyqQAqTsh5fGg==
X-CSE-MsgGUID: znhBr6qoRs+0JkqF7SAfnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="110773167"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Feb 2025 03:35:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfdgk-000tpL-0W;
	Wed, 05 Feb 2025 11:35:26 +0000
Date: Wed, 5 Feb 2025 19:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:pmc 1/26] arch/x86/kernel/cpu/microcode/core.c:754:6:
 error: conflicting types for 'microcode_bsp_resume'; have 'void(struct
 syscore_ops *)'
Message-ID: <202502051939.qCBFHp3i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thierryreding/linux pmc
head:   a402c19b24a5dc1ba2f6fb41de0080a97c202c1b
commit: f5ff652a1c2ce0a75ce86425cbc5f499933c9018 [1/26] syscore: Pass context data to callbacks
config: i386-buildonly-randconfig-003-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051939.qCBFHp3i-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051939.qCBFHp3i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051939.qCBFHp3i-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/microcode/core.c:754:6: error: conflicting types for 'microcode_bsp_resume'; have 'void(struct syscore_ops *)'
     754 | void microcode_bsp_resume(struct syscore_ops *ops)
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/cpu/microcode/internal.h:9,
                    from arch/x86/kernel/cpu/microcode/core.c:42:
   arch/x86/include/asm/microcode.h:19:6: note: previous declaration of 'microcode_bsp_resume' with type 'void(void)'
      19 | void microcode_bsp_resume(void);
         |      ^~~~~~~~~~~~~~~~~~~~
--
>> kernel/printk/printk.c:3649: warning: Function parameter or struct member 'ops' not described in 'printk_kthreads_shutdown'


vim +754 arch/x86/kernel/cpu/microcode/core.c

   750	
   751	/**
   752	 * microcode_bsp_resume - Update boot CPU microcode during resume.
   753	 */
 > 754	void microcode_bsp_resume(struct syscore_ops *ops)
   755	{
   756		int cpu = smp_processor_id();
   757		struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
   758	
   759		if (uci->mc)
   760			microcode_ops->apply_microcode(cpu);
   761		else
   762			reload_early_microcode(cpu);
   763	}
   764	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

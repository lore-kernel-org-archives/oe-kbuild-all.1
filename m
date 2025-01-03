Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AEB1119A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 01:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735868988; cv=none; b=fiN0yp37zCIk0dZv+Iy6hd7yEKKVEhvMKPlOMnNIB/Ptz5k5GTCsi/5qcYdQAsp1TeptGBTAM8Z5EYe/MfPzGBmeNov0QF6AT2FLWSr1KeQ9XtTP7GuwLQjZS+gjifkXkZ6F40yy4VDaPOgjbC6F6OnHG4p26K/wVrHPWDXK/cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735868988; c=relaxed/simple;
	bh=/Xf2VGx/TK9+F722eMyn/g7+/vHANMGQdOFfKsjJVJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pX59OBAaC8aCXcqIsJjaFNPkMla9JOab5JUAZfgH7DwjF+Sn0eYeeW/HMEa4+8YW2ohUDB2VR9bNxgMYKhPsHile3lvitrpKbOLlOo2EbXceMnj0o7a++Ct1xc9JCFzOAFuwzlbGPTezreMXTdV5Heb4cME4GqwKeD00KHv6hDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APUuQKXg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APUuQKXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735868987; x=1767404987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Xf2VGx/TK9+F722eMyn/g7+/vHANMGQdOFfKsjJVJ4=;
  b=APUuQKXgcO2D9R65ecii5FMDM0qI5OEFQME9DxzQzIWYE4mBBfWNtROp
   6109yXGQLusFH3UIgiaawPq5aQ5nNHB7NNMUXMvmhbWPDUqpx05AcoJ4B
   lCVu6UrBmR5j+GZQLTyqfOF21QiQfZQxSNnBKufStnYmhOYWbsymgRXBA
   TqFO+JJgQC8Y8l2JG1PDmF10ovPDcOAzsZ76POtakMlF5cehRc4OX5x9O
   gXCfDLhemjf6S+7C5frssgth/keO6vH8dcz5KOogwGSQQiK6ZLA7nYuEL
   ozJLXbXcyPHGX6ga7EDHlQN6dk9b3VISYbUXNSyJMkR1CoLuYODM9AtvL
   A==;
X-CSE-ConnectionGUID: cTx1L3FsQDuHFrE2asEYBw==
X-CSE-MsgGUID: calsHyHFSb+qbZ9aCOmsdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36022759"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36022759"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 17:49:46 -0800
X-CSE-ConnectionGUID: 1ppA//8oTtKQvNJ2NKv+hA==
X-CSE-MsgGUID: AJkF3+U2SBqEX1dAXH0t2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102517389"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Jan 2025 17:49:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTWop-00093T-0e;
	Fri, 03 Jan 2025 01:49:43 +0000
Date: Fri, 3 Jan 2025 09:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 11/15] ld.lld: error:
 drivers/platform/x86/intel_ips.o <inline asm>:26:3: unknown directive
Message-ID: <202501031131.9vyO86wE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   eaa81ab93145df5a8414e5d1c00c9228a947cced
commit: a7ec2803038cf2ce4567973fe0cd9f8fd58ecadb [11/15] x86/msr: Use the alternatives mechanism to call Xen MSR APIs
config: x86_64-randconfig-001-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031131.9vyO86wE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031131.9vyO86wE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031131.9vyO86wE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/platform/x86/intel_ips.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $416{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/platform/x86/intel_ips.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $428{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/platform/x86/intel_ips.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $409{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/platform/x86/intel_ips.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $206{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/platform/x86/intel/ifs/core.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $207{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/platform/x86/intel/ifs/runtest.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $261{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/platform/x86/intel/ifs/runtest.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $727{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/platform/x86/intel/ifs/runtest.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $701{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/platform/x86/intel/ifs/core.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $729{:u32}, %rax
   ^
--
>> ld.lld: error: drivers/platform/x86/intel/ifs/runtest.o <inline asm>:26:3: unknown directive
   .insn VEX.128.F2.M7.W0 0xf6 /0, $711{:u32}, %rax
   ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

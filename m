Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB55175D53
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 10:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743243963; cv=none; b=MRS7Hfl2S0oLrqh7TDPuXzu2zEWyAfYl7MEyw9RSgtPUPb0GAl52YeXFW/3qJkojsYh3MR0fam2b6kvgso10fjevXPVo+kh56a5eyo76WscXkmbQypIW5A5nZ0bVAQAARrHOIIZUZWBzid3v5NGzIjBwWsXD8K5/edwYOHp2Brs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743243963; c=relaxed/simple;
	bh=2J3Sysw7v6WhG9qB/Lkf43r4r/+kdacv8VVScp+H5uU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fy5/9kFIQ0RTF7RqhVa4qIkVluVjmHxajFPTVcTZxzZ/FQvRLfnMAvwIeoDAM/LGPBGlq+Tcg23QScvxIAncXF2fcYsmypSsiHf87fqUQJ97QeyhqU2x+k8pthkUBZHeOpWePohaba9Ku0XS+Q2EiGbwXu/4ubOwP3yuoFueED0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acZ0KZ5s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acZ0KZ5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743243962; x=1774779962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2J3Sysw7v6WhG9qB/Lkf43r4r/+kdacv8VVScp+H5uU=;
  b=acZ0KZ5sLh4j2k3uq7T0wOo56Blk5ygkRA4wY8XYZ6gn5YVPXG6Aky1S
   UFulZ0QydKJJtyEAdKN5t1mbvmdQo2VHTOoR7tOFLnGejlRL3aNt424f5
   Qk+xOEeqkcMhghKoAA8xhy52TcIf/+NhJIivy556bCDDS2RnMgpg79/oE
   64tJa6JMZezrwyo1egbSSbE3edJrWM7GDwC8OJFSleJ13nlHKy2pFXPnX
   hn/HrUE+LIeHDvrYSIZMrEizz2hT2/E+mnKkBppcL7QSNT0bDjMnF5AF2
   KIIyq766BzD7AtofnmaYyta251HPILuME6NKJ11qBEpktsfClzJDiHSPR
   g==;
X-CSE-ConnectionGUID: XiTEkb3JTtySexNd6don6A==
X-CSE-MsgGUID: fmKA2oB6QHqrXNFQhp4Klw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="43846085"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="43846085"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 03:26:01 -0700
X-CSE-ConnectionGUID: /NFB0p6tS228epjgx7ZPsA==
X-CSE-MsgGUID: aqeKE10xSVmgT7I0FLys+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="130758970"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Mar 2025 03:26:00 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyTNw-00082i-35;
	Sat, 29 Mar 2025 10:25:57 +0000
Date: Sat, 29 Mar 2025 18:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 4/17]
 arch/x86/mm/extable.c:177:19: warning: unused variable 'msr_imm_insn_prefix'
Message-ID: <202503291853.lXNCxymw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   a9a80dfcc256aeb93a6df01a82fc9bda4b10e3b7
commit: fe26083e06e9c7508dbdf6a9d06586ecd53a34fe [4/17] x86/extable: Add support for the immediate form MSR instructions
config: i386-buildonly-randconfig-002-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291853.lXNCxymw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291853.lXNCxymw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291853.lXNCxymw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/extable.c: In function 'ex_handler_msr':
>> arch/x86/mm/extable.c:177:19: warning: unused variable 'msr_imm_insn_prefix' [-Wunused-variable]
     177 |         static u8 msr_imm_insn_prefix[] = { 0xc4, 0xe7 };
         |                   ^~~~~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c: At top level:
>> arch/x86/mm/extable.c:177:19: warning: 'msr_imm_insn_prefix' defined but not used [-Wunused-variable]


vim +/msr_imm_insn_prefix +177 arch/x86/mm/extable.c

   166	
   167	static bool ex_handler_msr(const struct exception_table_entry *fixup,
   168				   struct pt_regs *regs, bool wrmsr, bool safe)
   169	{
   170		/*
   171		 * To ensure consistency with the existing RDMSR and WRMSR(NS), the register
   172		 * operand of the immediate form MSR access instructions is ALWAYS encoded as
   173		 * RAX in <asm/msr.h> for the MSR value to be written or read.
   174		 *
   175		 * Full decoder for the immediate form MSR access instructions looks overkill.
   176		 */
 > 177		static u8 msr_imm_insn_prefix[] = { 0xc4, 0xe7 };
   178		bool is_imm_insn;
   179		u32 msr;
   180		u64 msr_val;
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

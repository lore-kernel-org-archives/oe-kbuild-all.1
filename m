Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04F0192B98
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730106834; cv=none; b=D4/MemZ1LCzLxYqhoi1II0SAbrVoR4YDyQ6CMl08SyyrtoLSOEvgfDordDVclZTV3DnuuKqVxiNdY5Gg2oas8Bk+QKWKYuDyeXvKSS3DheO4hlppfyse3PjUmPV8ge+qMG1v1WMqfVWV6iViGUeNKftJ6CdsBCHCEYyZcHtAHDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730106834; c=relaxed/simple;
	bh=hP58l7P+C/36VHXcNa2H1mt55GXiSDHGwvS0jYPU8XM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mXf2SlyMq3xqf28HrXby2T5BszBMEkeaD1UyzmsmvVvehCUUQIAXEe7wNr2JbyE3k/IBGT+Fkpp/exsBoqnDFc+a4fIsJTNxLIKXkhL4ZOlL9zo00MH9ODzO+wwDEBqrZ/WUQqzxPaYr3hVLW+9I2hMmaPCNMGfTZWSlFJyMOZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaCoZos0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaCoZos0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730106833; x=1761642833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hP58l7P+C/36VHXcNa2H1mt55GXiSDHGwvS0jYPU8XM=;
  b=kaCoZos07g9JLv6gTP3wpMYyk+AlGaCqx02zS94QGO7ObHOwsYJ8u+Kh
   dENUQDfSQ74fXXaWaaD265Ecbgr3GrWfpVv6fNDoX7+DY6V6vVrdkZYMa
   Gp2LoUc3PpqIs76vvE1IAevVHjqq5DRpMmwwflH+NdA/yWAt/AvesZ6YL
   T/K+KD1irLBeHtPxMfPy+RisKGHxqHK28PLj9lLBcWVnmHbGe7GfckbdZ
   gaSD1Ar2YdVw98cTgmHqdCXpRMBksXOkVkThXfDL82/rlJJcCtfLMl0X5
   eH/xTN5tlYt0teDw7Ec1F/vjbScN/KxzDayy8HjvNVMvAyk39ytA+RKBM
   g==;
X-CSE-ConnectionGUID: 6Wpob0uASC2XaVcFNxsZRA==
X-CSE-MsgGUID: iZeeVSAMQV+9OjOzBbbs/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33607018"
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="33607018"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 02:13:49 -0700
X-CSE-ConnectionGUID: yQEZpglhR1+Fh1XR/AHRDQ==
X-CSE-MsgGUID: ToQCyPxSSwejNfC0m4SNsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="86130242"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2024 02:13:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Lon-000cFM-3A;
	Mon, 28 Oct 2024 09:13:45 +0000
Date: Mon, 28 Oct 2024 17:13:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_5 19/26]
 arch/arm/probes/uprobes/core.c:32:16: error: too few arguments to function
 'uprobe_write_opcode'
Message-ID: <202410281743.rjhs8hcp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_5
head:   748f02be1adc50c8aea1e580791e8085f8713c07
commit: 50e835aa3f397de2a9c72606596f055ec05e1445 [19/26] uprobes: Add len argument to uprobe_write_opcode
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20241028/202410281743.rjhs8hcp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281743.rjhs8hcp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281743.rjhs8hcp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from arch/arm/probes/uprobes/core.c:9:
   arch/arm/probes/uprobes/core.c: In function 'set_swbp':
   arch/arm/include/asm/opcodes.h:92:34: warning: passing argument 4 of 'uprobe_write_opcode' makes pointer from integer without a cast [-Wint-conversion]
      92 | #define ___opcode_identity32(x) ((u32)(x))
         |                                 ~^~~~~~~~~
         |                                  |
         |                                  unsigned int
   arch/arm/include/asm/opcodes.h:109:32: note: in expansion of macro '___opcode_identity32'
     109 | #define __opcode_to_mem_arm(x) ___opcode_identity32(x)
         |                                ^~~~~~~~~~~~~~~~~~~~
   arch/arm/probes/uprobes/core.c:33:20: note: in expansion of macro '__opcode_to_mem_arm'
      33 |                    __opcode_to_mem_arm(auprobe->bpinsn));
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13:
   include/linux/uprobes.h:134:104: note: expected 'uprobe_opcode_t *' {aka 'unsigned int *'} but argument is of type 'unsigned int'
     134 | extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm, unsigned long vaddr, uprobe_opcode_t*, int);
         |                                                                                                        ^~~~~~~~~~~~~~~~
>> arch/arm/probes/uprobes/core.c:32:16: error: too few arguments to function 'uprobe_write_opcode'
      32 |         return uprobe_write_opcode(auprobe, mm, vaddr,
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/uprobes.h:134:12: note: declared here
     134 | extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm, unsigned long vaddr, uprobe_opcode_t*, int);
         |            ^~~~~~~~~~~~~~~~~~~
   arch/arm/probes/uprobes/core.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
      34 | }
         | ^


vim +/uprobe_write_opcode +32 arch/arm/probes/uprobes/core.c

c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  28  
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  29  int set_swbp(struct arch_uprobe *auprobe, struct mm_struct *mm,
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  30  	     unsigned long vaddr)
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  31  {
6d43743e9079ac arch/arm/probes/uprobes/core.c Ravi Bangoria 2018-08-09 @32  	return uprobe_write_opcode(auprobe, mm, vaddr,
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  33  		   __opcode_to_mem_arm(auprobe->bpinsn));
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  34  }
c7edc9e326d53c arch/arm/kernel/uprobes.c      David A. Long 2014-03-07  35  

:::::: The code at line 32 was first introduced by commit
:::::: 6d43743e9079ac0531b60cde7eadd0f042873344 Uprobe: Additional argument arch_uprobe to uprobe_write_opcode()

:::::: TO: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

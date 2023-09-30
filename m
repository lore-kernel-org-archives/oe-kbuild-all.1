Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A038A28ED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 07:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696059428; x=1727595428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AD6RvUTlIGikG/E4heCya0cvUoFPjtmgkrB2Ed1BLjU=;
  b=JFrmH/pFsR/JQxZv/CvFSGAybFwfc73JDbZji+eaSDkHsaJpYzc7GVQV
   uUAjX+lYdA29qaJCIXXiif5Kw06Mfu2eqNsVbT3p1xyc2+n0L63BDAkP4
   CoXsnhoiVyGMUcyqzCYVaF/73v0EOOLpdcZcmnL476RSCy+Xo/BBhfbhg
   Rhkfdl27yN8fCfKCy87TNxw4oe+D+mVfBlp+oqMdGv9CHhXkYlh43ldvJ
   bxoMb387zUyavRBZnUbpccyJ8Pgt10j/R7IyZsWXSGulsZ1Dc2VZ+4VMZ
   DbIUKYlk3pk53Y/NSwKjuFM5UqrwG2DW4ZHByM1LqsP+LG6w7erDlWXtK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="413332350"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="413332350"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 00:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="743645121"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="743645121"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Sep 2023 00:37:06 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmUXA-0003rB-11;
	Sat, 30 Sep 2023 07:37:04 +0000
Date: Sat, 30 Sep 2023 15:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-kexec 13/13] vmlinux.o: warning: objtool:
 asm_acpi_mp_play_dead+0x25: missing int3 after indirect jump
Message-ID: <202309301550.ygAZuh2U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-kexec
head:   34488d4fd2b299a51196e878575dd1e83cbbbc7f
commit: 34488d4fd2b299a51196e878575dd1e83cbbbc7f [13/13] x86/acpi: Add support for CPU offlining for ACPI MADT wakeup method
config: x86_64-randconfig-072-20230930 (https://download.01.org/0day-ci/archive/20230930/202309301550.ygAZuh2U-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301550.ygAZuh2U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301550.ygAZuh2U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: asm_acpi_mp_play_dead+0x25: missing int3 after indirect jump


objdump-func vmlinux.o asm_acpi_mp_play_dead:
0000 00000000000e6000 <asm_acpi_mp_play_dead>:
0000    e6000:	f3 0f 1e fa          	endbr64
0004    e6004:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # e600b <asm_acpi_mp_play_dead+0xb>	e6007: R_X86_64_PC32	acpi_mp_reset_vector_paddr-0x4
000b    e600b:	6a 00                	push   $0x0
000d    e600d:	9d                   	popf
000e    e600e:	0f 20 e2             	mov    %cr4,%rdx
0011    e6011:	48 81 e2 7f ff ff ff 	and    $0xffffffffffffff7f,%rdx
0018    e6018:	0f 22 e2             	mov    %rdx,%cr4
001b    e601b:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # e6022 <asm_acpi_mp_play_dead+0x22>	e601e: R_X86_64_PC32	acpi_mp_pgd-0x4
0022    e6022:	0f 22 d8             	mov    %rax,%cr3
0025    e6025:	ff e1                	jmp    *%rcx
0027    e6027:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

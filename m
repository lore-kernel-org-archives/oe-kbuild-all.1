Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDF77E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 15:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674314970; x=1705850970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ASvDpKEwfTZ91fIjsreAhlWCSmH1paKjBbjjLQA+0Ow=;
  b=h10yeC6TFfy4gdm7C9PUMs+RIG1Om0yqAUcapV2Qff+VmSfirL+KA/50
   qvnBT5b+8BtD+5ALeYI4/kFKFGFOtBezU1z1cxgvJoArwh5XudnkbIGYO
   5rSXlSByNio9oxiGTpiAYnHHS5qzqc1xBFG1ADt18N3vmx/vUVm5C+yhl
   YU/zOWPCg6HpSSq/7W+s4DVWybiy1MpkjQdsAJ9lkaROmsxH93oh6+fdY
   SGe8e8Ebkn1PpfXlqOktPIeauyVb+1l/rrlemhT8VIFeYQb2PFn4gZR6j
   6KPRtukqas14QnFdNHItmiB3PVw/vwaqhLMgcd5bFeCmSIzcJOX2ZIj1S
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="313683188"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="313683188"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 07:29:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="662858211"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="662858211"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jan 2023 07:29:28 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJFo7-0004Cy-1l;
	Sat, 21 Jan 2023 15:29:27 +0000
Date: Sat, 21 Jan 2023 23:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 3/5] vmlinux.o: warning: objtool:
 native_sched_clock+0x53: call to mul_u64_u32_shr() leaves .noinstr.text
 section
Message-ID: <202301212346.B9QoF3L6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   2f4db18052727418ff37088ea7b08d5380aa91ad
commit: 60b4bbc6b378aeb9625a39f0afc9dcaee6f78589 [3/5] x86: Mark sched_clock() noinstr
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230121/202301212346.B9QoF3L6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=60b4bbc6b378aeb9625a39f0afc9dcaee6f78589
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core
        git checkout 60b4bbc6b378aeb9625a39f0afc9dcaee6f78589
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __asan_memset+0x39: call to __memset() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memmove+0x4f: call to __memmove() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memcpy+0x4f: call to __memcpy() with UACCESS enabled
>> vmlinux.o: warning: objtool: native_sched_clock+0x53: call to mul_u64_u32_shr() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: vmware_sched_clock+0x21: call to mul_u64_u32_shr() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: pvclock_clocksource_read+0xca: call to arch_atomic64_read.constprop.0() leaves .noinstr.text section


objdump-func vmlinux.o native_sched_clock:
0000 0000000000001437 <native_sched_clock>:
0000     1437:	f3 0f 1e fa          	endbr64
0004     143b:	eb 5d                	jmp    149a <native_sched_clock+0x63>
0006     143d:	53                   	push   %rbx
0007     143e:	0f 31                	rdtsc
0009     1440:	48 89 d7             	mov    %rdx,%rdi
000c     1443:	48 c1 e7 20          	shl    $0x20,%rdi
0010     1447:	48 09 c7             	or     %rax,%rdi
0013     144a:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 1450 <native_sched_clock+0x19>	144c: R_X86_64_PC32	pcpu_hot+0x4
0019     1450:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx        # 1456 <native_sched_clock+0x1f>	1452: R_X86_64_PC32	.data..shared_aligned+0x1c
001f     1456:	89 d0                	mov    %edx,%eax
0021     1458:	83 e0 01             	and    $0x1,%eax
0024     145b:	48 89 c1             	mov    %rax,%rcx
0027     145e:	48 c1 e1 04          	shl    $0x4,%rcx
002b     1462:	48 8b 99 00 00 00 00 	mov    0x0(%rcx),%rbx	1465: R_X86_64_32S	.data..shared_aligned+0x8
0032     1469:	48 89 c1             	mov    %rax,%rcx
0035     146c:	48 c1 e1 04          	shl    $0x4,%rcx
0039     1470:	8b b1 00 00 00 00    	mov    0x0(%rcx),%esi	1472: R_X86_64_32S	.data..shared_aligned
003f     1476:	44 8b 81 00 00 00 00 	mov    0x0(%rcx),%r8d	1479: R_X86_64_32S	.data..shared_aligned+0x4
0046     147d:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 1483 <native_sched_clock+0x4c>	147f: R_X86_64_PC32	.data..shared_aligned+0x1c
004c     1483:	39 c2                	cmp    %eax,%edx
004e     1485:	75 c9                	jne    1450 <native_sched_clock+0x19>
0050     1487:	44 89 c2             	mov    %r8d,%edx
0053     148a:	e8 00 00 00 00       	call   148f <native_sched_clock+0x58>	148b: R_X86_64_PC32	.text+0x56e29
0058     148f:	48 01 d8             	add    %rbx,%rax
005b     1492:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 1498 <native_sched_clock+0x61>	1494: R_X86_64_PC32	pcpu_hot+0x4
0061     1498:	5b                   	pop    %rbx
0062     1499:	c3                   	ret
0063     149a:	48 69 05 00 00 00 00 80 96 98 00 	imul   $0x989680,0x0(%rip),%rax        # 14a5 <native_sched_clock+0x6e>	149d: R_X86_64_PC32	jiffies_64-0x8
006e     14a5:	48 ba 00 b8 64 d9 c5 69 67 ff 	movabs $0xff6769c5d964b800,%rdx
0078     14af:	48 01 d0             	add    %rdx,%rax
007b     14b2:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

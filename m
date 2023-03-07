Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F80833C9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 10:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678184403; x=1709720403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IeOZrv2rZfXcxHVHlPtmO/AS78euuxdbkMG20gb8Gbo=;
  b=ID2JOknG/QWyXboNfJOAB7/lRhj8KHcnjtFswIv8jB0hQSVBUihXVI1x
   xpb44JlB2xglnKbITXGXFMpaRjls2te6U1jmXn48E4SQ+eLPNYpGOsabv
   rNWjmkoulXcabZZTmomDl7GBmz/GPcW4OUWFF8RQFO0qKXCKs9ilXN4mg
   4lMVdY/o6GT4KXalXjziNAisYq0iaEqR61V8utVR2uGi8GJ8Mvh6Oa8H/
   rMoedAJpDC9hu+HjVNc3+wJMwLMe1cTfYSI0Hd6hXrYkNe60zJRVKUrdO
   19ydPGnoahyc7IzBlQCt6FAJeLtZHvuDnmD6vvTvZwMyFZFhNtRXyf4vN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="334531483"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="334531483"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 02:20:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="669815361"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="669815361"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Mar 2023 02:20:00 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZUQJ-0001D5-3B;
	Tue, 07 Mar 2023 10:19:59 +0000
Date: Tue, 7 Mar 2023 18:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 3442/9999] vmlinux.o: warning: objtool:
 enter_from_user_mode()+0x4e: call to on_thread_stack() leaves .noinstr.text
 section
Message-ID: <202303071811.9A3wRip6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   d9b4a0c83a2d405dd85bf32d672686146b9bedff
commit: 0853f905e48b92dcf27a8d931104c9aac10de191 [3442/9999] x86/cpu: Elide KCSAN for cpu_has() and friends
config: x86_64-buildonly-randconfig-r005-20230306 (https://download.01.org/0day-ci/archive/20230307/202303071811.9A3wRip6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=0853f905e48b92dcf27a8d931104c9aac10de191
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 0853f905e48b92dcf27a8d931104c9aac10de191
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071811.9A3wRip6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ld: warning: drivers/of/unittest-data/testcases.dtb.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x70: call to __phys_addr_nodebug() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: enter_from_user_mode()+0x4e: call to on_thread_stack() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_enter_from_user_mode()+0x53: call to on_thread_stack() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare()+0x4e: call to on_thread_stack() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_enter_from_user_mode()+0x4e: call to on_thread_stack() leaves .noinstr.text section
   ld: warning: drivers/of/unittest-data/testcases.dtb.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: warning: .tmp_vmlinux.kallsyms1.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms2 has a LOAD segment with RWX permissions
   ld: warning: .tmp_vmlinux.kallsyms2.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: vmlinux has a LOAD segment with RWX permissions


objdump-func vmlinux.o enter_from_user_mode:
0000 0000000000001b20 <enter_from_user_mode>:
0000     1b20:	53                   	push   %rbx
0001     1b21:	48 89 fb             	mov    %rdi,%rbx
0004     1b24:	9c                   	pushf
0005     1b25:	5a                   	pop    %rdx
0006     1b26:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 1b2d <enter_from_user_mode+0xd>	1b29: R_X86_64_PC32	boot_cpu_data+0x2c
000d     1b2d:	b8 00 44 04 00       	mov    $0x44400,%eax
0012     1b32:	48 0f ba e1 34       	bt     $0x34,%rcx
0017     1b37:	72 1f                	jb     1b58 <enter_from_user_mode+0x38>
0019     1b39:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1b40 <enter_from_user_mode+0x20>	1b3c: R_X86_64_PC32	boot_cpu_data+0x2c
0020     1b40:	48 c1 e8 10          	shr    $0x10,%rax
0024     1b44:	83 e0 01             	and    $0x1,%eax
0027     1b47:	3c 01                	cmp    $0x1,%al
0029     1b49:	48 19 c0             	sbb    %rax,%rax
002c     1b4c:	48 25 00 00 fc ff    	and    $0xfffffffffffc0000,%rax
0032     1b52:	48 05 00 44 04 00    	add    $0x44400,%rax
0038     1b58:	48 85 c2             	test   %rax,%rdx
003b     1b5b:	74 04                	je     1b61 <enter_from_user_mode+0x41>
003d     1b5d:	90                   	nop
003e     1b5e:	0f 0b                	ud2
0040     1b60:	90                   	nop
0041     1b61:	f6 83 88 00 00 00 03 	testb  $0x3,0x88(%rbx)
0048     1b68:	75 04                	jne    1b6e <enter_from_user_mode+0x4e>
004a     1b6a:	90                   	nop
004b     1b6b:	0f 0b                	ud2
004d     1b6d:	90                   	nop
004e     1b6e:	e8 00 00 00 00       	call   1b73 <enter_from_user_mode+0x53>	1b6f: R_X86_64_PC32	.text+0x181ac8
0053     1b73:	84 c0                	test   %al,%al
0055     1b75:	75 04                	jne    1b7b <enter_from_user_mode+0x5b>
0057     1b77:	90                   	nop
0058     1b78:	0f 0b                	ud2
005a     1b7a:	90                   	nop
005b     1b7b:	48 8b 3c 25 00 00 00 00 	mov    0x0,%rdi	1b7f: R_X86_64_32S	current_task
0063     1b83:	e8 00 00 00 00       	call   1b88 <enter_from_user_mode+0x68>	1b84: R_X86_64_PC32	.text+0x181ae4
0068     1b88:	48 05 58 3f 00 00    	add    $0x3f58,%rax
006e     1b8e:	48 39 c3             	cmp    %rax,%rbx
0071     1b91:	74 04                	je     1b97 <enter_from_user_mode+0x77>
0073     1b93:	90                   	nop
0074     1b94:	0f 0b                	ud2
0076     1b96:	90                   	nop
0077     1b97:	e8 00 00 00 00       	call   1b9c <enter_from_user_mode+0x7c>	1b98: R_X86_64_PC32	.text+0x181add
007c     1b9c:	84 c0                	test   %al,%al
007e     1b9e:	74 0d                	je     1bad <enter_from_user_mode+0x8d>
0080     1ba0:	e8 00 00 00 00       	call   1ba5 <enter_from_user_mode+0x85>	1ba1: R_X86_64_PC32	.text+0x181ae0
0085     1ba5:	ff c8                	dec    %eax
0087     1ba7:	74 04                	je     1bad <enter_from_user_mode+0x8d>
0089     1ba9:	90                   	nop
008a     1baa:	0f 0b                	ud2
008c     1bac:	90                   	nop
008d     1bad:	90                   	nop
008e     1bae:	90                   	nop
008f     1baf:	5b                   	pop    %rbx
0090     1bb0:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

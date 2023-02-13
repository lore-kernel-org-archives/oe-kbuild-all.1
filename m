Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D473399
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 16:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676305950; x=1707841950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6IU0xFwXCBALFuffby2mNJESgKk/lN52h5rqq9GCVfQ=;
  b=KSMb8IbemqJdua1NHVSudOBNDr7zBo0yy1My9cqdvpq8GVQOUMLxTiRH
   d3HJBpJ1lbtqKjsC/vd5wZ+gYzmUAeLL/m0PP4Wot6uiML2Iyq0SYxYsA
   9W4sYviDAIG6nDTIwERDA1VbVh1UJJUbtKN64NdZthUDnOVW+oUzaPcvW
   4jPgpwvhdLcr3Dasnc+jLW7fLJw6fAg66m9KXFcgQyEuxTQS14skDDewq
   D26fTa2woVxOQsctaPwJmLnH+/yJYzKbpZJZNyWL7FE6zr2nEoGn45pkG
   uN6P8DN4JClQsmM/cUjMwn0/Z9I1nSIGFhKsEjdWLP4IBhxFbGmoW3XuO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393328830"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="393328830"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 08:32:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="914380802"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="914380802"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Feb 2023 08:32:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRbkf-0007sH-2e;
	Mon, 13 Feb 2023 16:32:25 +0000
Date: Tue, 14 Feb 2023 00:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 2/6] arch/x86/kernel/alternative.o: warning:
 objtool: .altinstr_replacement+0x7: call without frame pointer save/setup
Message-ID: <202302140031.w467GOvd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   f89ca8a39b4f905dd5d1e27136188a4663176e1c
commit: 740b56f2ef03b636f1a78a95f4877bb68350bdad [2/6] x86/alternative: Support relocations in alternatives
config: x86_64-randconfig-a012-20221107 (https://download.01.org/0day-ci/archive/20230214/202302140031.w467GOvd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=740b56f2ef03b636f1a78a95f4877bb68350bdad
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/core
        git checkout 740b56f2ef03b636f1a78a95f4877bb68350bdad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140031.w467GOvd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/alternative.c:1397:32: warning: no previous prototype for '__alt_reloc_selftest' [-Wmissing-prototypes]
    1397 | __visible noinline void __init __alt_reloc_selftest(void *arg)
         |                                ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/alternative.o: warning: objtool: .altinstr_replacement+0x7: call without frame pointer save/setup


objdump-func vmlinux.o .altinstr_replacement:
0000 0000000000000000 <.altinstr_replacement>:
0000    0:	e8 00 00 00 00       	call   5 <.altinstr_replacement+0x5>	1: R_X86_64_PLT32	clear_page_rep-0x4
0005    5:	e8 00 00 00 00       	call   a <.altinstr_replacement+0xa>	6: R_X86_64_PLT32	clear_page_erms-0x4
000a    a:	e9 00 00 00 00       	jmp    f <.altinstr_replacement+0xf>	b: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
000f    f:	49 c7 c4 10 00 00 00 	mov    $0x10,%r12
0016   16:	e8 01 00 00 00       	call   1c <.altinstr_replacement+0x1c>
001b   1b:	cc                   	int3
001c   1c:	e8 01 00 00 00       	call   22 <.altinstr_replacement+0x22>
0021   21:	cc                   	int3
0022   22:	48 83 c4 10          	add    $0x10,%rsp
0026   26:	49 ff cc             	dec    %r12
0029   29:	75 eb                	jne    16 <.altinstr_replacement+0x16>
002b   2b:	0f ae e8             	lfence
002e   2e:	e8 01 00 00 00       	call   34 <.altinstr_replacement+0x34>
0033   33:	cc                   	int3
0034   34:	48 83 c4 08          	add    $0x8,%rsp
0038   38:	0f ae e8             	lfence
003b   3b:	0f 01 ca             	clac
003e   3e:	e8 00 00 00 00       	call   43 <.altinstr_replacement+0x43>	3f: R_X86_64_PLT32	xen_error_entry-0x4
0043   43:	0f 01 ca             	clac
0046   46:	e8 00 00 00 00       	call   4b <.altinstr_replacement+0x4b>	47: R_X86_64_PLT32	xen_error_entry-0x4
004b   4b:	0f 01 ca             	clac
004e   4e:	e8 00 00 00 00       	call   53 <.altinstr_replacement+0x53>	4f: R_X86_64_PLT32	xen_error_entry-0x4
0053   53:	0f 01 ca             	clac
0056   56:	e8 00 00 00 00       	call   5b <.altinstr_replacement+0x5b>	57: R_X86_64_PLT32	xen_error_entry-0x4
005b   5b:	0f 01 ca             	clac
005e   5e:	e8 00 00 00 00       	call   63 <.altinstr_replacement+0x63>	5f: R_X86_64_PLT32	xen_error_entry-0x4
0063   63:	0f 01 ca             	clac
0066   66:	e8 00 00 00 00       	call   6b <.altinstr_replacement+0x6b>	67: R_X86_64_PLT32	xen_error_entry-0x4
006b   6b:	0f 01 ca             	clac
006e   6e:	e8 00 00 00 00       	call   73 <.altinstr_replacement+0x73>	6f: R_X86_64_PLT32	xen_error_entry-0x4
0073   73:	0f 01 ca             	clac
0076   76:	e8 00 00 00 00       	call   7b <.altinstr_replacement+0x7b>	77: R_X86_64_PLT32	xen_error_entry-0x4
007b   7b:	0f 01 ca             	clac
007e   7e:	e8 00 00 00 00       	call   83 <.altinstr_replacement+0x83>	7f: R_X86_64_PLT32	xen_error_entry-0x4
0083   83:	0f 01 ca             	clac
0086   86:	e8 00 00 00 00       	call   8b <.altinstr_replacement+0x8b>	87: R_X86_64_PLT32	xen_error_entry-0x4
008b   8b:	0f 01 ca             	clac
008e   8e:	e8 00 00 00 00       	call   93 <.altinstr_replacement+0x93>	8f: R_X86_64_PLT32	xen_error_entry-0x4
0093   93:	0f 01 ca             	clac
0096   96:	e8 00 00 00 00       	call   9b <.altinstr_replacement+0x9b>	97: R_X86_64_PLT32	xen_error_entry-0x4
009b   9b:	0f 01 ca             	clac
009e   9e:	e8 00 00 00 00       	call   a3 <.altinstr_replacement+0xa3>	9f: R_X86_64_PLT32	xen_error_entry-0x4
00a3   a3:	0f 01 ca             	clac
00a6   a6:	e8 00 00 00 00       	call   ab <.altinstr_replacement+0xab>	a7: R_X86_64_PLT32	xen_error_entry-0x4
00ab   ab:	0f 01 ca             	clac
00ae   ae:	e8 00 00 00 00       	call   b3 <.altinstr_replacement+0xb3>	af: R_X86_64_PLT32	xen_error_entry-0x4
00b3   b3:	0f 01 ca             	clac
00b6   b6:	e8 00 00 00 00       	call   bb <.altinstr_replacement+0xbb>	b7: R_X86_64_PLT32	xen_error_entry-0x4
00bb   bb:	0f 01 ca             	clac
00be   be:	e8 00 00 00 00       	call   c3 <.altinstr_replacement+0xc3>	bf: R_X86_64_PLT32	xen_error_entry-0x4
00c3   c3:	0f 01 ca             	clac
00c6   c6:	e8 00 00 00 00       	call   cb <.altinstr_replacement+0xcb>	c7: R_X86_64_PLT32	xen_error_entry-0x4
00cb   cb:	0f 01 ca             	clac
00ce   ce:	0f 01 ca             	clac
00d1   d1:	e8 00 00 00 00       	call   d6 <.altinstr_replacement+0xd6>	d2: R_X86_64_PLT32	xen_error_entry-0x4
00d6   d6:	0f 01 ca             	clac
00d9   d9:	e8 00 00 00 00       	call   de <.altinstr_replacement+0xde>	da: R_X86_64_PLT32	xen_error_entry-0x4
00de   de:	0f 01 ca             	clac
00e1   e1:	e8 00 00 00 00       	call   e6 <.altinstr_replacement+0xe6>	e2: R_X86_64_PLT32	xen_error_entry-0x4
00e6   e6:	0f 01 ca             	clac
00e9   e9:	e8 00 00 00 00       	call   ee <.altinstr_replacement+0xee>	ea: R_X86_64_PLT32	xen_error_entry-0x4
00ee   ee:	0f 01 ca             	clac
00f1   f1:	e8 00 00 00 00       	call   f6 <.altinstr_replacement+0xf6>	f2: R_X86_64_PLT32	xen_error_entry-0x4
00f6   f6:	0f 01 ca             	clac
00f9   f9:	e8 00 00 00 00       	call   fe <.altinstr_replacement+0xfe>	fa: R_X86_64_PLT32	xen_error_entry-0x4
00fe   fe:	0f 01 ca             	clac
0101  101:	e8 00 00 00 00       	call   106 <.altinstr_replacement+0x106>	102: R_X86_64_PLT32	xen_error_entry-0x4
0106  106:	0f 01 ca             	clac
0109  109:	e8 00 00 00 00       	call   10e <.altinstr_replacement+0x10e>	10a: R_X86_64_PLT32	xen_error_entry-0x4
010e  10e:	0f 01 ca             	clac
0111  111:	e8 00 00 00 00       	call   116 <.altinstr_replacement+0x116>	112: R_X86_64_PLT32	xen_error_entry-0x4
0116  116:	0f 01 ca             	clac
0119  119:	e8 00 00 00 00       	call   11e <.altinstr_replacement+0x11e>	11a: R_X86_64_PLT32	xen_error_entry-0x4
011e  11e:	0f 01 ca             	clac
0121  121:	e8 00 00 00 00       	call   126 <.altinstr_replacement+0x126>	122: R_X86_64_PLT32	xen_error_entry-0x4
0126  126:	0f 01 ca             	clac
0129  129:	e8 00 00 00 00       	call   12e <.altinstr_replacement+0x12e>	12a: R_X86_64_PLT32	xen_error_entry-0x4
012e  12e:	0f 01 ca             	clac
0131  131:	e8 00 00 00 00       	call   136 <.altinstr_replacement+0x136>	132: R_X86_64_PLT32	xen_error_entry-0x4
0136  136:	0f 01 ca             	clac
0139  139:	e8 00 00 00 00       	call   13e <.altinstr_replacement+0x13e>	13a: R_X86_64_PLT32	xen_error_entry-0x4
013e  13e:	0f 01 ca             	clac
0141  141:	e8 00 00 00 00       	call   146 <.altinstr_replacement+0x146>	142: R_X86_64_PLT32	xen_error_entry-0x4
0146  146:	0f 01 ca             	clac
0149  149:	e8 00 00 00 00       	call   14e <.altinstr_replacement+0x14e>	14a: R_X86_64_PLT32	xen_error_entry-0x4
014e  14e:	0f 01 ca             	clac
0151  151:	e8 00 00 00 00       	call   156 <.altinstr_replacement+0x156>	152: R_X86_64_PLT32	xen_error_entry-0x4
0156  156:	0f 01 ca             	clac
0159  159:	e8 00 00 00 00       	call   15e <.altinstr_replacement+0x15e>	15a: R_X86_64_PLT32	xen_error_entry-0x4
015e  15e:	0f ae f0             	mfence
0161  161:	b8 2b 00 00 00       	mov    $0x2b,%eax
0166  166:	8e e8                	mov    %eax,%gs
0168  168:	0f ae e8             	lfence
016b  16b:	0f ae e8             	lfence
016e  16e:	0f ae e8             	lfence
0171  171:	0f ae e8             	lfence
0174  174:	0f 01 ca             	clac
0177  177:	0f ae e8             	lfence
017a  17a:	e9 00 00 00 00       	jmp    17f <.altinstr_replacement+0x17f>	17b: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
017f  17f:	e9 00 00 00 00       	jmp    184 <.altinstr_replacement+0x184>	180: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
0184  184:	0f 01 ca             	clac
0187  187:	e9 00 00 00 00       	jmp    18c <.altinstr_replacement+0x18c>	188: R_X86_64_PC32	.entry.text+0x1827
018c  18c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0191  191:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0196  196:	f3 0f b8 c7          	popcnt %edi,%eax
019a  19a:	0f ae e8             	lfence
019d  19d:	0f 31                	rdtsc
019f  19f:	0f 01 f9             	rdtscp
01a2  1a2:	0f ae e8             	lfence
01a5  1a5:	0f 31                	rdtsc
01a7  1a7:	0f 01 f9             	rdtscp
01aa  1aa:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01af  1af:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01b4  1b4:	e9 00 00 00 00       	jmp    1b9 <.altinstr_replacement+0x1b9>	1b5: R_X86_64_PC32	.init.text+0xa307
01b9  1b9:	e9 00 00 00 00       	jmp    1be <.altinstr_replacement+0x1be>	1ba: R_X86_64_PC32	.text+0x31c87
01be  1be:	e9 00 00 00 00       	jmp    1c3 <.altinstr_replacement+0x1c3>	1bf: R_X86_64_PC32	.text+0x31c8d
01c3  1c3:	e9 00 00 00 00       	jmp    1c8 <.altinstr_replacement+0x1c8>	1c4: R_X86_64_PC32	.text+0x31da5
01c8  1c8:	e9 00 00 00 00       	jmp    1cd <.altinstr_replacement+0x1cd>	1c9: R_X86_64_PC32	.text+0x31dae
01cd  1cd:	e9 00 00 00 00       	jmp    1d2 <.altinstr_replacement+0x1d2>	1ce: R_X86_64_PC32	.text+0x3236d
01d2  1d2:	e9 00 00 00 00       	jmp    1d7 <.altinstr_replacement+0x1d7>	1d3: R_X86_64_PC32	.text+0x32f2c
01d7  1d7:	e9 00 00 00 00       	jmp    1dc <.altinstr_replacement+0x1dc>	1d8: R_X86_64_PC32	.text+0x33908
01dc  1dc:	e9 00 00 00 00       	jmp    1e1 <.altinstr_replacement+0x1e1>	1dd: R_X86_64_PC32	.text+0x338aa
01e1  1e1:	e9 00 00 00 00       	jmp    1e6 <.altinstr_replacement+0x1e6>	1e2: R_X86_64_PC32	.text+0x3392f
01e6  1e6:	e9 00 00 00 00       	jmp    1eb <.altinstr_replacement+0x1eb>	1e7: R_X86_64_PC32	.text+0x338f0
01eb  1eb:	e9 00 00 00 00       	jmp    1f0 <.altinstr_replacement+0x1f0>	1ec: R_X86_64_PC32	.text+0x33e0e
01f0  1f0:	e9 00 00 00 00       	jmp    1f5 <.altinstr_replacement+0x1f5>	1f1: R_X86_64_PC32	.text+0x33fff
01f5  1f5:	e9 00 00 00 00       	jmp    1fa <.altinstr_replacement+0x1fa>	1f6: R_X86_64_PC32	.text+0x33f23
01fa  1fa:	e9 00 00 00 00       	jmp    1ff <.altinstr_replacement+0x1ff>	1fb: R_X86_64_PC32	.text+0x34018
01ff  1ff:	e9 00 00 00 00       	jmp    204 <.altinstr_replacement+0x204>	200: R_X86_64_PC32	.text+0x34102
0204  204:	e9 00 00 00 00       	jmp    209 <.altinstr_replacement+0x209>	205: R_X86_64_PC32	.text+0x3410b
0209  209:	e9 00 00 00 00       	jmp    20e <.altinstr_replacement+0x20e>	20a: R_X86_64_PC32	.text+0x341eb
020e  20e:	e9 00 00 00 00       	jmp    213 <.altinstr_replacement+0x213>	20f: R_X86_64_PC32	.text+0x34ffc
0213  213:	e9 00 00 00 00       	jmp    218 <.altinstr_replacement+0x218>	214: R_X86_64_PC32	.text+0x350d3
0218  218:	e9 00 00 00 00       	jmp    21d <.altinstr_replacement+0x21d>	219: R_X86_64_PC32	.text+0x350e2
021d  21d:	e9 00 00 00 00       	jmp    222 <.altinstr_replacement+0x222>	21e: R_X86_64_PC32	.text+0x350dc
0222  222:	e9 00 00 00 00       	jmp    227 <.altinstr_replacement+0x227>	223: R_X86_64_PC32	.text+0x355a1
0227  227:	e9 00 00 00 00       	jmp    22c <.altinstr_replacement+0x22c>	228: R_X86_64_PC32	.text+0x357cf
022c  22c:	e9 00 00 00 00       	jmp    231 <.altinstr_replacement+0x231>	22d: R_X86_64_PC32	.text+0x359ce
0231  231:	e9 00 00 00 00       	jmp    236 <.altinstr_replacement+0x236>	232: R_X86_64_PC32	.text+0x35d79
0236  236:	e9 00 00 00 00       	jmp    23b <.altinstr_replacement+0x23b>	237: R_X86_64_PC32	.text+0x35fab
023b  23b:	e9 00 00 00 00       	jmp    240 <.altinstr_replacement+0x240>	23c: R_X86_64_PC32	.text+0x36fe4
0240  240:	e9 00 00 00 00       	jmp    245 <.altinstr_replacement+0x245>	241: R_X86_64_PC32	.text+0x3722c
0245  245:	f3 0f b8 c7          	popcnt %edi,%eax
0249  249:	f3 48 0f b8 c7       	popcnt %rdi,%rax
024e  24e:	e9 00 00 00 00       	jmp    253 <.altinstr_replacement+0x253>	24f: R_X86_64_PC32	.text+0x66f39
0253  253:	e9 00 00 00 00       	jmp    258 <.altinstr_replacement+0x258>	254: R_X86_64_PC32	.text.unlikely+0x3b20
0258  258:	e9 00 00 00 00       	jmp    25d <.altinstr_replacement+0x25d>	259: R_X86_64_PC32	.text.unlikely+0x3d0e
025d  25d:	e9 00 00 00 00       	jmp    262 <.altinstr_replacement+0x262>	25e: R_X86_64_PC32	.text+0x672ae
0262  262:	e9 00 00 00 00       	jmp    267 <.altinstr_replacement+0x267>	263: R_X86_64_PC32	.text+0x68448
0267  267:	e9 00 00 00 00       	jmp    26c <.altinstr_replacement+0x26c>	268: R_X86_64_PC32	.text+0x6825e
026c  26c:	e9 00 00 00 00       	jmp    271 <.altinstr_replacement+0x271>	26d: R_X86_64_PC32	.text+0x67fe1
0271  271:	e9 00 00 00 00       	jmp    276 <.altinstr_replacement+0x276>	272: R_X86_64_PC32	.text+0x680a3
0276  276:	e9 00 00 00 00       	jmp    27b <.altinstr_replacement+0x27b>	277: R_X86_64_PC32	.text+0x685af
027b  27b:	e9 00 00 00 00       	jmp    280 <.altinstr_replacement+0x280>	27c: R_X86_64_PC32	.text+0x68574
0280  280:	0f 01 cb             	stac
0283  283:	0f ae e8             	lfence
0286  286:	0f 01 ca             	clac
0289  289:	0f 01 ca             	clac
028c  28c:	e9 00 00 00 00       	jmp    291 <.altinstr_replacement+0x291>	28d: R_X86_64_PC32	.text+0x6d756
0291  291:	e9 00 00 00 00       	jmp    296 <.altinstr_replacement+0x296>	292: R_X86_64_PC32	.noinstr.text+0xb14
0296  296:	e9 00 00 00 00       	jmp    29b <.altinstr_replacement+0x29b>	297: R_X86_64_PC32	.noinstr.text+0xdb3
029b  29b:	e9 00 00 00 00       	jmp    2a0 <.altinstr_replacement+0x2a0>	29c: R_X86_64_PC32	.init.text+0x102a3
02a0  2a0:	e9 00 00 00 00       	jmp    2a5 <.altinstr_replacement+0x2a5>	2a1: R_X86_64_PC32	.noinstr.text+0x18dc
02a5  2a5:	0f 01 cb             	stac
02a8  2a8:	0f ae e8             	lfence
02ab  2ab:	0f 01 ca             	clac
02ae  2ae:	0f 01 ca             	clac
02b1  2b1:	0f 01 cb             	stac
02b4  2b4:	0f ae e8             	lfence
02b7  2b7:	0f 01 ca             	clac
02ba  2ba:	0f 01 ca             	clac
02bd  2bd:	0f 01 cb             	stac
02c0  2c0:	0f ae e8             	lfence
02c3  2c3:	e9 00 00 00 00       	jmp    2c8 <.altinstr_replacement+0x2c8>	2c4: R_X86_64_PC32	.text+0x7f4be
02c8  2c8:	0f 01 ca             	clac
02cb  2cb:	0f 01 ca             	clac
02ce  2ce:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 2d5 <.altinstr_replacement+0x2d5>	2d1: R_X86_64_PC32	.init.data+0x4e1dc
02d5  2d5:	e8 00 00 00 00       	call   2da <.altinstr_replacement+0x2da>	2d6: R_X86_64_PLT32	__alt_reloc_selftest-0x4
02da  2da:	e9 00 00 00 00       	jmp    2df <.altinstr_replacement+0x2df>	2db: R_X86_64_PC32	.text+0x84d05
02df  2df:	e9 00 00 00 00       	jmp    2e4 <.altinstr_replacement+0x2e4>	2e0: R_X86_64_PC32	.text+0x852e2
02e4  2e4:	0f ae e8             	lfence
02e7  2e7:	0f 31                	rdtsc
02e9  2e9:	0f 01 f9             	rdtscp
02ec  2ec:	e9 00 00 00 00       	jmp    2f1 <.altinstr_replacement+0x2f1>	2ed: R_X86_64_PC32	.text+0x8b6f4
02f1  2f1:	e9 00 00 00 00       	jmp    2f6 <.altinstr_replacement+0x2f6>	2f2: R_X86_64_PC32	.text+0x8be26
02f6  2f6:	e9 00 00 00 00       	jmp    2fb <.altinstr_replacement+0x2fb>	2f7: R_X86_64_PC32	.text+0x8c534
02fb  2fb:	e9 00 00 00 00       	jmp    300 <.altinstr_replacement+0x300>	2fc: R_X86_64_PC32	.text+0x8c6bd
0300  300:	e9 00 00 00 00       	jmp    305 <.altinstr_replacement+0x305>	301: R_X86_64_PC32	.text+0x8c6da
0305  305:	e9 00 00 00 00       	jmp    30a <.altinstr_replacement+0x30a>	306: R_X86_64_PC32	.text+0x8c71d
030a  30a:	e9 00 00 00 00       	jmp    30f <.altinstr_replacement+0x30f>	30b: R_X86_64_PC32	.text+0x8c4e4
030f  30f:	e9 00 00 00 00       	jmp    314 <.altinstr_replacement+0x314>	310: R_X86_64_PC32	.text+0x8cde0
0314  314:	e9 00 00 00 00       	jmp    319 <.altinstr_replacement+0x319>	315: R_X86_64_PC32	.text+0x8d0e9
0319  319:	e9 00 00 00 00       	jmp    31e <.altinstr_replacement+0x31e>	31a: R_X86_64_PC32	.text+0x8d157
031e  31e:	e9 00 00 00 00       	jmp    323 <.altinstr_replacement+0x323>	31f: R_X86_64_PC32	.text+0x8d19e
0323  323:	e9 00 00 00 00       	jmp    328 <.altinstr_replacement+0x328>	324: R_X86_64_PC32	.text+0x8d11f
0328  328:	e9 00 00 00 00       	jmp    32d <.altinstr_replacement+0x32d>	329: R_X86_64_PC32	.text+0x8cdc0
032d  32d:	e9 00 00 00 00       	jmp    332 <.altinstr_replacement+0x332>	32e: R_X86_64_PC32	.text+0x8d3f4
0332  332:	e9 00 00 00 00       	jmp    337 <.altinstr_replacement+0x337>	333: R_X86_64_PC32	.text+0x8d460
0337  337:	e9 00 00 00 00       	jmp    33c <.altinstr_replacement+0x33c>	338: R_X86_64_PC32	.text+0x8d459
033c  33c:	e9 00 00 00 00       	jmp    341 <.altinstr_replacement+0x341>	33d: R_X86_64_PC32	.text+0x8d07a
0341  341:	e9 00 00 00 00       	jmp    346 <.altinstr_replacement+0x346>	342: R_X86_64_PC32	.text+0x8dc8e
0346  346:	48 0f ae 37          	xsaveopt64 (%rdi)
034a  34a:	48 0f c7 27          	xsavec64 (%rdi)
034e  34e:	48 0f c7 2f          	xsaves64 (%rdi)
0352  352:	e9 00 00 00 00       	jmp    357 <.altinstr_replacement+0x357>	353: R_X86_64_PC32	.text+0x8fa46
0357  357:	e9 00 00 00 00       	jmp    35c <.altinstr_replacement+0x35c>	358: R_X86_64_PC32	.text+0x8fc9e
035c  35c:	e9 00 00 00 00       	jmp    361 <.altinstr_replacement+0x361>	35d: R_X86_64_PC32	.text+0x8fce3
0361  361:	48 0f c7 1f          	xrstors64 (%rdi)
0365  365:	e9 00 00 00 00       	jmp    36a <.altinstr_replacement+0x36a>	366: R_X86_64_PC32	.text+0x9025d
036a  36a:	e9 00 00 00 00       	jmp    36f <.altinstr_replacement+0x36f>	36b: R_X86_64_PC32	.text+0x90922
036f  36f:	e9 00 00 00 00       	jmp    374 <.altinstr_replacement+0x374>	370: R_X86_64_PC32	.text+0x90c31
0374  374:	e9 00 00 00 00       	jmp    379 <.altinstr_replacement+0x379>	375: R_X86_64_PC32	.text+0x91364
0379  379:	48 0f c7 1f          	xrstors64 (%rdi)
037d  37d:	e9 00 00 00 00       	jmp    382 <.altinstr_replacement+0x382>	37e: R_X86_64_PC32	.text+0x91861
0382  382:	48 0f c7 1f          	xrstors64 (%rdi)
0386  386:	e9 00 00 00 00       	jmp    38b <.altinstr_replacement+0x38b>	387: R_X86_64_PC32	.text+0x91842
038b  38b:	e9 00 00 00 00       	jmp    390 <.altinstr_replacement+0x390>	38c: R_X86_64_PC32	.text+0x91a50
0390  390:	e8 00 00 00 00       	call   395 <.altinstr_replacement+0x395>	391: R_X86_64_PLT32	copy_user_generic_string-0x4
0395  395:	e8 00 00 00 00       	call   39a <.altinstr_replacement+0x39a>	396: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
039a  39a:	e9 00 00 00 00       	jmp    39f <.altinstr_replacement+0x39f>	39b: R_X86_64_PC32	.text+0x927a3
039f  39f:	e9 00 00 00 00       	jmp    3a4 <.altinstr_replacement+0x3a4>	3a0: R_X86_64_PC32	.text+0x92a3e
03a4  3a4:	e9 00 00 00 00       	jmp    3a9 <.altinstr_replacement+0x3a9>	3a5: R_X86_64_PC32	.text+0x92b4a
03a9  3a9:	e9 00 00 00 00       	jmp    3ae <.altinstr_replacement+0x3ae>	3aa: R_X86_64_PC32	.text+0x92c60
03ae  3ae:	e9 00 00 00 00       	jmp    3b3 <.altinstr_replacement+0x3b3>	3af: R_X86_64_PC32	.text+0x9325a
03b3  3b3:	e9 00 00 00 00       	jmp    3b8 <.altinstr_replacement+0x3b8>	3b4: R_X86_64_PC32	.text+0x9344d
03b8  3b8:	e8 00 00 00 00       	call   3bd <.altinstr_replacement+0x3bd>	3b9: R_X86_64_PLT32	copy_user_generic_string-0x4
03bd  3bd:	e8 00 00 00 00       	call   3c2 <.altinstr_replacement+0x3c2>	3be: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
03c2  3c2:	48 0f ae 37          	xsaveopt64 (%rdi)
03c6  3c6:	48 0f c7 27          	xsavec64 (%rdi)
03ca  3ca:	48 0f c7 2f          	xsaves64 (%rdi)
03ce  3ce:	e9 00 00 00 00       	jmp    3d3 <.altinstr_replacement+0x3d3>	3cf: R_X86_64_PC32	.text+0x93600
03d3  3d3:	e8 00 00 00 00       	call   3d8 <.altinstr_replacement+0x3d8>	3d4: R_X86_64_PLT32	copy_user_generic_string-0x4
03d8  3d8:	e8 00 00 00 00       	call   3dd <.altinstr_replacement+0x3dd>	3d9: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
03dd  3dd:	e8 00 00 00 00       	call   3e2 <.altinstr_replacement+0x3e2>	3de: R_X86_64_PLT32	copy_user_generic_string-0x4
03e2  3e2:	e8 00 00 00 00       	call   3e7 <.altinstr_replacement+0x3e7>	3e3: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
03e7  3e7:	e9 00 00 00 00       	jmp    3ec <.altinstr_replacement+0x3ec>	3e8: R_X86_64_PC32	.text+0x9410e
03ec  3ec:	0f 01 cb             	stac
03ef  3ef:	0f 01 ca             	clac
03f2  3f2:	0f 01 cb             	stac
03f5  3f5:	0f 01 ca             	clac
03f8  3f8:	48 0f c7 1f          	xrstors64 (%rdi)
03fc  3fc:	0f 01 cb             	stac
03ff  3ff:	0f 01 ca             	clac
0402  402:	48 0f c7 1f          	xrstors64 (%rdi)
0406  406:	e9 00 00 00 00       	jmp    40b <.altinstr_replacement+0x40b>	407: R_X86_64_PC32	.text+0x944c3
040b  40b:	e8 00 00 00 00       	call   410 <.altinstr_replacement+0x410>	40c: R_X86_64_PLT32	copy_user_generic_string-0x4
0410  410:	e8 00 00 00 00       	call   415 <.altinstr_replacement+0x415>	411: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0415  415:	e9 00 00 00 00       	jmp    41a <.altinstr_replacement+0x41a>	416: R_X86_64_PC32	.text+0x94725
041a  41a:	e8 00 00 00 00       	call   41f <.altinstr_replacement+0x41f>	41b: R_X86_64_PLT32	copy_user_generic_string-0x4
041f  41f:	e8 00 00 00 00       	call   424 <.altinstr_replacement+0x424>	420: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0424  424:	e9 00 00 00 00       	jmp    429 <.altinstr_replacement+0x429>	425: R_X86_64_PC32	.text+0x94828
0429  429:	e9 00 00 00 00       	jmp    42e <.altinstr_replacement+0x42e>	42a: R_X86_64_PC32	.text+0x94930
042e  42e:	e9 00 00 00 00       	jmp    433 <.altinstr_replacement+0x433>	42f: R_X86_64_PC32	.text+0x94bfe
0433  433:	0f 01 cb             	stac
0436  436:	e8 00 00 00 00       	call   43b <.altinstr_replacement+0x43b>	437: R_X86_64_PLT32	clear_user_erms-0x4
043b  43b:	e8 00 00 00 00       	call   440 <.altinstr_replacement+0x440>	43c: R_X86_64_PLT32	clear_user_rep_good-0x4
0440  440:	e8 00 00 00 00       	call   445 <.altinstr_replacement+0x445>	441: R_X86_64_PLT32	clear_user_original-0x4
0445  445:	0f 01 ca             	clac
0448  448:	e9 00 00 00 00       	jmp    44d <.altinstr_replacement+0x44d>	449: R_X86_64_PC32	.text+0x94da5
044d  44d:	0f 01 cb             	stac
0450  450:	0f 01 ca             	clac
0453  453:	0f 01 cb             	stac
0456  456:	e8 00 00 00 00       	call   45b <.altinstr_replacement+0x45b>	457: R_X86_64_PLT32	clear_user_erms-0x4
045b  45b:	e8 00 00 00 00       	call   460 <.altinstr_replacement+0x460>	45c: R_X86_64_PLT32	clear_user_rep_good-0x4
0460  460:	e8 00 00 00 00       	call   465 <.altinstr_replacement+0x465>	461: R_X86_64_PLT32	clear_user_original-0x4
0465  465:	0f 01 ca             	clac
0468  468:	0f 01 cb             	stac
046b  46b:	0f 01 ca             	clac
046e  46e:	e8 00 00 00 00       	call   473 <.altinstr_replacement+0x473>	46f: R_X86_64_PLT32	copy_user_generic_string-0x4
0473  473:	e8 00 00 00 00       	call   478 <.altinstr_replacement+0x478>	474: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0478  478:	e9 00 00 00 00       	jmp    47d <.altinstr_replacement+0x47d>	479: R_X86_64_PC32	.text+0x94f3f
047d  47d:	e9 00 00 00 00       	jmp    482 <.altinstr_replacement+0x482>	47e: R_X86_64_PC32	.text+0x9510b
0482  482:	e9 00 00 00 00       	jmp    487 <.altinstr_replacement+0x487>	483: R_X86_64_PC32	.text+0x952b9
0487  487:	e9 00 00 00 00       	jmp    48c <.altinstr_replacement+0x48c>	488: R_X86_64_PC32	.init.text+0x17997
048c  48c:	e9 00 00 00 00       	jmp    491 <.altinstr_replacement+0x491>	48d: R_X86_64_PC32	.text+0x953bd
0491  491:	e9 00 00 00 00       	jmp    496 <.altinstr_replacement+0x496>	492: R_X86_64_PC32	.text+0x95407
0496  496:	e9 00 00 00 00       	jmp    49b <.altinstr_replacement+0x49b>	497: R_X86_64_PC32	.init.text+0x17bf6
049b  49b:	e9 00 00 00 00       	jmp    4a0 <.altinstr_replacement+0x4a0>	49c: R_X86_64_PC32	.text+0x95bf7
04a0  4a0:	e9 00 00 00 00       	jmp    4a5 <.altinstr_replacement+0x4a5>	4a1: R_X86_64_PC32	.text+0x95e7a
04a5  4a5:	e9 00 00 00 00       	jmp    4aa <.altinstr_replacement+0x4aa>	4a6: R_X86_64_PC32	.text+0x96755
04aa  4aa:	e9 00 00 00 00       	jmp    4af <.altinstr_replacement+0x4af>	4ab: R_X86_64_PC32	.text+0x96b81
04af  4af:	e9 00 00 00 00       	jmp    4b4 <.altinstr_replacement+0x4b4>	4b0: R_X86_64_PC32	.text+0x96b9a
04b4  4b4:	e9 00 00 00 00       	jmp    4b9 <.altinstr_replacement+0x4b9>	4b5: R_X86_64_PC32	.text+0x96c16
04b9  4b9:	e9 00 00 00 00       	jmp    4be <.altinstr_replacement+0x4be>	4ba: R_X86_64_PC32	.text+0x96cbf
04be  4be:	e9 00 00 00 00       	jmp    4c3 <.altinstr_replacement+0x4c3>	4bf: R_X86_64_PC32	.text+0x96fd3
04c3  4c3:	e9 00 00 00 00       	jmp    4c8 <.altinstr_replacement+0x4c8>	4c4: R_X86_64_PC32	.init.text+0x17fc9
04c8  4c8:	e9 00 00 00 00       	jmp    4cd <.altinstr_replacement+0x4cd>	4c9: R_X86_64_PC32	.init.text+0x17fdd
04cd  4cd:	e9 00 00 00 00       	jmp    4d2 <.altinstr_replacement+0x4d2>	4ce: R_X86_64_PC32	.init.text+0x181f1
04d2  4d2:	e9 00 00 00 00       	jmp    4d7 <.altinstr_replacement+0x4d7>	4d3: R_X86_64_PC32	.init.text+0x18539
04d7  4d7:	e9 00 00 00 00       	jmp    4dc <.altinstr_replacement+0x4dc>	4d8: R_X86_64_PC32	.init.text+0x18571
04dc  4dc:	e9 00 00 00 00       	jmp    4e1 <.altinstr_replacement+0x4e1>	4dd: R_X86_64_PC32	.init.text+0x186e8
04e1  4e1:	e9 00 00 00 00       	jmp    4e6 <.altinstr_replacement+0x4e6>	4e2: R_X86_64_PC32	.init.text+0x1871f
04e6  4e6:	e9 00 00 00 00       	jmp    4eb <.altinstr_replacement+0x4eb>	4e7: R_X86_64_PC32	.text+0x97578
04eb  4eb:	e9 00 00 00 00       	jmp    4f0 <.altinstr_replacement+0x4f0>	4ec: R_X86_64_PC32	.text+0x975bb
04f0  4f0:	e9 00 00 00 00       	jmp    4f5 <.altinstr_replacement+0x4f5>	4f1: R_X86_64_PC32	.text+0x975b0
04f5  4f5:	e9 00 00 00 00       	jmp    4fa <.altinstr_replacement+0x4fa>	4f6: R_X86_64_PC32	.text+0x9778d
04fa  4fa:	e9 00 00 00 00       	jmp    4ff <.altinstr_replacement+0x4ff>	4fb: R_X86_64_PC32	.text+0x97797
04ff  4ff:	e9 00 00 00 00       	jmp    504 <.altinstr_replacement+0x504>	500: R_X86_64_PC32	.text+0x977d9
0504  504:	e9 00 00 00 00       	jmp    509 <.altinstr_replacement+0x509>	505: R_X86_64_PC32	.text+0x97805
0509  509:	e9 00 00 00 00       	jmp    50e <.altinstr_replacement+0x50e>	50a: R_X86_64_PC32	.text+0x98e24
050e  50e:	e8 00 00 00 00       	call   513 <.altinstr_replacement+0x513>	50f: R_X86_64_PLT32	copy_user_generic_string-0x4
0513  513:	e8 00 00 00 00       	call   518 <.altinstr_replacement+0x518>	514: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0518  518:	e9 00 00 00 00       	jmp    51d <.altinstr_replacement+0x51d>	519: R_X86_64_PC32	.text+0xa200d
051d  51d:	e9 00 00 00 00       	jmp    522 <.altinstr_replacement+0x522>	51e: R_X86_64_PC32	.text+0xa1ff8
0522  522:	e9 00 00 00 00       	jmp    527 <.altinstr_replacement+0x527>	523: R_X86_64_PC32	.text+0xa2002
0527  527:	e9 00 00 00 00       	jmp    52c <.altinstr_replacement+0x52c>	528: R_X86_64_PC32	.text+0xa2009
052c  52c:	e9 00 00 00 00       	jmp    531 <.altinstr_replacement+0x531>	52d: R_X86_64_PC32	.text+0xa204a
0531  531:	e9 00 00 00 00       	jmp    536 <.altinstr_replacement+0x536>	532: R_X86_64_PC32	.text+0xa206a
0536  536:	e9 00 00 00 00       	jmp    53b <.altinstr_replacement+0x53b>	537: R_X86_64_PC32	.text+0xa414f
053b  53b:	e9 00 00 00 00       	jmp    540 <.altinstr_replacement+0x540>	53c: R_X86_64_PC32	.text+0xa6067
0540  540:	e9 00 00 00 00       	jmp    545 <.altinstr_replacement+0x545>	541: R_X86_64_PC32	.text+0xa6067
0545  545:	e9 00 00 00 00       	jmp    54a <.altinstr_replacement+0x54a>	546: R_X86_64_PC32	.text+0xa6067
054a  54a:	e9 00 00 00 00       	jmp    54f <.altinstr_replacement+0x54f>	54b: R_X86_64_PC32	.text+0xa8af6
054f  54f:	e9 00 00 00 00       	jmp    554 <.altinstr_replacement+0x554>	550: R_X86_64_PC32	.text+0xa8afd
0554  554:	e9 00 00 00 00       	jmp    559 <.altinstr_replacement+0x559>	555: R_X86_64_PC32	.text+0xa8aed
0559  559:	e9 00 00 00 00       	jmp    55e <.altinstr_replacement+0x55e>	55a: R_X86_64_PC32	.init.text+0x1c4b2
055e  55e:	e9 00 00 00 00       	jmp    563 <.altinstr_replacement+0x563>	55f: R_X86_64_PC32	.init.text+0x1c4b9
0563  563:	0f 30                	wrmsr
0565  565:	e9 00 00 00 00       	jmp    56a <.altinstr_replacement+0x56a>	566: R_X86_64_PC32	.text+0xa9d98
056a  56a:	e9 00 00 00 00       	jmp    56f <.altinstr_replacement+0x56f>	56b: R_X86_64_PC32	.init.text+0x1cc47
056f  56f:	e9 00 00 00 00       	jmp    574 <.altinstr_replacement+0x574>	570: R_X86_64_PC32	.text+0xab17c
0574  574:	e9 00 00 00 00       	jmp    579 <.altinstr_replacement+0x579>	575: R_X86_64_PC32	.text+0xab3b0
0579  579:	e9 00 00 00 00       	jmp    57e <.altinstr_replacement+0x57e>	57a: R_X86_64_PC32	.text+0xab5c3
057e  57e:	e9 00 00 00 00       	jmp    583 <.altinstr_replacement+0x583>	57f: R_X86_64_PC32	.text+0xb0ed8
0583  583:	e9 00 00 00 00       	jmp    588 <.altinstr_replacement+0x588>	584: R_X86_64_PC32	.text+0xb0fa7
0588  588:	e9 00 00 00 00       	jmp    58d <.altinstr_replacement+0x58d>	589: R_X86_64_PC32	.text+0xb10d9
058d  58d:	e9 00 00 00 00       	jmp    592 <.altinstr_replacement+0x592>	58e: R_X86_64_PC32	.text+0xb10d9
0592  592:	e9 00 00 00 00       	jmp    597 <.altinstr_replacement+0x597>	593: R_X86_64_PC32	.text+0xb1745
0597  597:	e9 00 00 00 00       	jmp    59c <.altinstr_replacement+0x59c>	598: R_X86_64_PC32	.text+0xb1a60
059c  59c:	e9 00 00 00 00       	jmp    5a1 <.altinstr_replacement+0x5a1>	59d: R_X86_64_PC32	.text+0xb1aac
05a1  5a1:	e9 00 00 00 00       	jmp    5a6 <.altinstr_replacement+0x5a6>	5a2: R_X86_64_PC32	.text+0xb1ab5
05a6  5a6:	e9 00 00 00 00       	jmp    5ab <.altinstr_replacement+0x5ab>	5a7: R_X86_64_PC32	.text+0xb5fe8
05ab  5ab:	e9 00 00 00 00       	jmp    5b0 <.altinstr_replacement+0x5b0>	5ac: R_X86_64_PC32	.text+0xb5fd0
05b0  5b0:	e9 00 00 00 00       	jmp    5b5 <.altinstr_replacement+0x5b5>	5b1: R_X86_64_PC32	.text+0xb6111
05b5  5b5:	e9 00 00 00 00       	jmp    5ba <.altinstr_replacement+0x5ba>	5b6: R_X86_64_PC32	.text+0xb6c38
05ba  5ba:	e9 00 00 00 00       	jmp    5bf <.altinstr_replacement+0x5bf>	5bb: R_X86_64_PC32	.noinstr.text+0x2307
05bf  5bf:	e9 00 00 00 00       	jmp    5c4 <.altinstr_replacement+0x5c4>	5c0: R_X86_64_PC32	.noinstr.text+0x229b
05c4  5c4:	e9 00 00 00 00       	jmp    5c9 <.altinstr_replacement+0x5c9>	5c5: R_X86_64_PC32	.text+0xb73cd
05c9  5c9:	e9 00 00 00 00       	jmp    5ce <.altinstr_replacement+0x5ce>	5ca: R_X86_64_PC32	.text+0xb73d4
05ce  5ce:	e9 00 00 00 00       	jmp    5d3 <.altinstr_replacement+0x5d3>	5cf: R_X86_64_PC32	.text+0xb73d8
05d3  5d3:	e9 00 00 00 00       	jmp    5d8 <.altinstr_replacement+0x5d8>	5d4: R_X86_64_PC32	.noinstr.text+0x2a52
05d8  5d8:	e9 00 00 00 00       	jmp    5dd <.altinstr_replacement+0x5dd>	5d9: R_X86_64_PC32	.noinstr.text+0x2a98
05dd  5dd:	e9 00 00 00 00       	jmp    5e2 <.altinstr_replacement+0x5e2>	5de: R_X86_64_PC32	.noinstr.text+0x2aa5
05e2  5e2:	e9 00 00 00 00       	jmp    5e7 <.altinstr_replacement+0x5e7>	5e3: R_X86_64_PC32	.noinstr.text+0x2d5d
05e7  5e7:	e9 00 00 00 00       	jmp    5ec <.altinstr_replacement+0x5ec>	5e8: R_X86_64_PC32	.noinstr.text+0x2e17
05ec  5ec:	e9 00 00 00 00       	jmp    5f1 <.altinstr_replacement+0x5f1>	5ed: R_X86_64_PC32	.text+0xb7b92
05f1  5f1:	e9 00 00 00 00       	jmp    5f6 <.altinstr_replacement+0x5f6>	5f2: R_X86_64_PC32	.text+0xb8e7e
05f6  5f6:	e9 00 00 00 00       	jmp    5fb <.altinstr_replacement+0x5fb>	5f7: R_X86_64_PC32	.text.unlikely+0x72ee
05fb  5fb:	e9 00 00 00 00       	jmp    600 <.altinstr_replacement+0x600>	5fc: R_X86_64_PC32	.text.unlikely+0x7258
0600  600:	e9 00 00 00 00       	jmp    605 <.altinstr_replacement+0x605>	601: R_X86_64_PC32	.text.unlikely+0x728d
0605  605:	0f ae e8             	lfence
0608  608:	0f 31                	rdtsc
060a  60a:	0f 01 f9             	rdtscp
060d  60d:	e9 00 00 00 00       	jmp    612 <.altinstr_replacement+0x612>	60e: R_X86_64_PC32	.text+0xb9ef7
0612  612:	0f ae e8             	lfence
0615  615:	0f 31                	rdtsc
0617  617:	0f 01 f9             	rdtscp
061a  61a:	0f ae e8             	lfence
061d  61d:	0f 31                	rdtsc
061f  61f:	0f 01 f9             	rdtscp
0622  622:	0f ae e8             	lfence
0625  625:	0f 31                	rdtsc
0627  627:	0f 01 f9             	rdtscp
062a  62a:	0f 01 c1             	vmcall
062d  62d:	0f 01 d9             	vmmcall
0630  630:	e9 00 00 00 00       	jmp    635 <.altinstr_replacement+0x635>	631: R_X86_64_PC32	.text+0xdb61b
0635  635:	e9 00 00 00 00       	jmp    63a <.altinstr_replacement+0x63a>	636: R_X86_64_PC32	.text+0xdb567
063a  63a:	e9 00 00 00 00       	jmp    63f <.altinstr_replacement+0x63f>	63b: R_X86_64_PC32	.init.text+0x24ed0
063f  63f:	e9 00 00 00 00       	jmp    644 <.altinstr_replacement+0x644>	640: R_X86_64_PC32	.init.text+0x25688
0644  644:	0f ae e8             	lfence
0647  647:	0f 31                	rdtsc
0649  649:	0f 01 f9             	rdtscp
064c  64c:	0f ae e8             	lfence
064f  64f:	0f 31                	rdtsc
0651  651:	0f 01 f9             	rdtscp
0654  654:	87 34 25 00 d3 5f ff 	xchg   %esi,0xffffffffff5fd300
065b  65b:	87 04 25 10 d3 5f ff 	xchg   %eax,0xffffffffff5fd310
0662  662:	87 04 25 00 d3 5f ff 	xchg   %eax,0xffffffffff5fd300
0669  669:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
0670  670:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
0677  677:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
067e  67e:	87 b7 00 d0 5f ff    	xchg   %esi,-0xa03000(%rdi)
0684  684:	0f ae e8             	lfence
0687  687:	0f 31                	rdtsc
0689  689:	0f 01 f9             	rdtscp
068c  68c:	e8 00 00 00 00       	call   691 <.altinstr_replacement+0x691>	68d: R_X86_64_PLT32	clear_page_rep-0x4
0691  691:	e8 00 00 00 00       	call   696 <.altinstr_replacement+0x696>	692: R_X86_64_PLT32	clear_page_erms-0x4
0696  696:	e8 00 00 00 00       	call   69b <.altinstr_replacement+0x69b>	697: R_X86_64_PLT32	clear_page_rep-0x4
069b  69b:	e8 00 00 00 00       	call   6a0 <.altinstr_replacement+0x6a0>	69c: R_X86_64_PLT32	clear_page_erms-0x4
06a0  6a0:	e9 00 00 00 00       	jmp    6a5 <.altinstr_replacement+0x6a5>	6a1: R_X86_64_PC32	.init.text+0x2ebb4
06a5  6a5:	e9 00 00 00 00       	jmp    6aa <.altinstr_replacement+0x6aa>	6a6: R_X86_64_PC32	.text+0x10ffda
06aa  6aa:	0f 01 d9             	vmmcall
06ad  6ad:	e9 00 00 00 00       	jmp    6b2 <.altinstr_replacement+0x6b2>	6ae: R_X86_64_PC32	.text+0x110059
06b2  6b2:	0f 01 d9             	vmmcall
06b5  6b5:	0f ae e8             	lfence
06b8  6b8:	0f 31                	rdtsc
06ba  6ba:	0f 01 f9             	rdtscp
06bd  6bd:	e8 00 00 00 00       	call   6c2 <.altinstr_replacement+0x6c2>	6be: R_X86_64_PLT32	clear_page_rep-0x4
06c2  6c2:	e8 00 00 00 00       	call   6c7 <.altinstr_replacement+0x6c7>	6c3: R_X86_64_PLT32	clear_page_erms-0x4
06c7  6c7:	e9 00 00 00 00       	jmp    6cc <.altinstr_replacement+0x6cc>	6c8: R_X86_64_PC32	.text+0x11aca6
06cc  6cc:	e9 00 00 00 00       	jmp    6d1 <.altinstr_replacement+0x6d1>	6cd: R_X86_64_PC32	.text+0x11aca6
06d1  6d1:	e9 00 00 00 00       	jmp    6d6 <.altinstr_replacement+0x6d6>	6d2: R_X86_64_PC32	.text+0x11b595
06d6  6d6:	e9 00 00 00 00       	jmp    6db <.altinstr_replacement+0x6db>	6d7: R_X86_64_PC32	.text+0x11b9fd
06db  6db:	0f 0d 88 f0 00 00 00 	prefetchw 0xf0(%rax)
06e2  6e2:	e9 00 00 00 00       	jmp    6e7 <.altinstr_replacement+0x6e7>	6e3: R_X86_64_PC32	.text+0x11dd48
06e7  6e7:	e9 00 00 00 00       	jmp    6ec <.altinstr_replacement+0x6ec>	6e8: R_X86_64_PC32	.text+0x121570
06ec  6ec:	e9 00 00 00 00       	jmp    6f1 <.altinstr_replacement+0x6f1>	6ed: R_X86_64_PC32	.text+0x1219fd
06f1  6f1:	e9 00 00 00 00       	jmp    6f6 <.altinstr_replacement+0x6f6>	6f2: R_X86_64_PC32	.text+0x121c60
06f6  6f6:	0f 30                	wrmsr
06f8  6f8:	e9 00 00 00 00       	jmp    6fd <.altinstr_replacement+0x6fd>	6f9: R_X86_64_PC32	.text+0x121def
06fd  6fd:	0f 30                	wrmsr
06ff  6ff:	e9 00 00 00 00       	jmp    704 <.altinstr_replacement+0x704>	700: R_X86_64_PC32	.text+0x122a26
0704  704:	e9 00 00 00 00       	jmp    709 <.altinstr_replacement+0x709>	705: R_X86_64_PC32	.text+0x12347f
0709  709:	e9 00 00 00 00       	jmp    70e <.altinstr_replacement+0x70e>	70a: R_X86_64_PC32	.text+0x1235e2
070e  70e:	e9 00 00 00 00       	jmp    713 <.altinstr_replacement+0x713>	70f: R_X86_64_PC32	.text+0x123748
0713  713:	e9 00 00 00 00       	jmp    718 <.altinstr_replacement+0x718>	714: R_X86_64_PC32	.text+0x124084
0718  718:	66 0f ae 38          	clflushopt (%rax)
071c  71c:	66 0f ae 38          	clflushopt (%rax)
0720  720:	e9 00 00 00 00       	jmp    725 <.altinstr_replacement+0x725>	721: R_X86_64_PC32	.text+0x12744e
0725  725:	66 0f ae 38          	clflushopt (%rax)
0729  729:	e9 00 00 00 00       	jmp    72e <.altinstr_replacement+0x72e>	72a: R_X86_64_PC32	.init.text+0x33114
072e  72e:	e9 00 00 00 00       	jmp    733 <.altinstr_replacement+0x733>	72f: R_X86_64_PC32	.init.text+0x33157
0733  733:	e9 00 00 00 00       	jmp    738 <.altinstr_replacement+0x738>	734: R_X86_64_PC32	.init.text+0x33e23
0738  738:	e9 00 00 00 00       	jmp    73d <.altinstr_replacement+0x73d>	739: R_X86_64_PC32	.text+0x12f5fb
073d  73d:	e9 00 00 00 00       	jmp    742 <.altinstr_replacement+0x742>	73e: R_X86_64_PC32	.text+0x12f67c
0742  742:	e9 00 00 00 00       	jmp    747 <.altinstr_replacement+0x747>	743: R_X86_64_PC32	.text+0x12f957
0747  747:	e9 00 00 00 00       	jmp    74c <.altinstr_replacement+0x74c>	748: R_X86_64_PC32	.text.unlikely+0xc066
074c  74c:	e9 00 00 00 00       	jmp    751 <.altinstr_replacement+0x751>	74d: R_X86_64_PC32	.text+0x16a892
0751  751:	e9 00 00 00 00       	jmp    756 <.altinstr_replacement+0x756>	752: R_X86_64_PC32	.text+0x16e9c8
0756  756:	0f 01 cb             	stac
0759  759:	0f ae e8             	lfence
075c  75c:	0f 01 ca             	clac
075f  75f:	0f 01 ca             	clac
0762  762:	0f 01 cb             	stac
0765  765:	0f ae e8             	lfence
0768  768:	0f 01 ca             	clac
076b  76b:	0f 01 ca             	clac
076e  76e:	0f 01 cb             	stac
0771  771:	e8 00 00 00 00       	call   776 <.altinstr_replacement+0x776>	772: R_X86_64_PLT32	clear_user_erms-0x4
0776  776:	e8 00 00 00 00       	call   77b <.altinstr_replacement+0x77b>	777: R_X86_64_PLT32	clear_user_rep_good-0x4
077b  77b:	e8 00 00 00 00       	call   780 <.altinstr_replacement+0x780>	77c: R_X86_64_PLT32	clear_user_original-0x4
0780  780:	0f 01 ca             	clac
0783  783:	41 0f 0d 08          	prefetchw (%r8)
0787  787:	e9 00 00 00 00       	jmp    78c <.altinstr_replacement+0x78c>	788: R_X86_64_PC32	.noinstr.text+0x42a0
078c  78c:	e9 00 00 00 00       	jmp    791 <.altinstr_replacement+0x791>	78d: R_X86_64_PC32	.noinstr.text+0x43da
0791  791:	e9 00 00 00 00       	jmp    796 <.altinstr_replacement+0x796>	792: R_X86_64_PC32	.noinstr.text+0x44ec
0796  796:	e9 00 00 00 00       	jmp    79b <.altinstr_replacement+0x79b>	797: R_X86_64_PC32	.noinstr.text+0x46a0
079b  79b:	0f 01 cb             	stac
079e  79e:	0f ae e8             	lfence
07a1  7a1:	0f 01 ca             	clac
07a4  7a4:	0f 01 cb             	stac
07a7  7a7:	0f ae e8             	lfence
07aa  7aa:	0f 01 ca             	clac
07ad  7ad:	0f 01 ca             	clac
07b0  7b0:	0f 01 ca             	clac
07b3  7b3:	e8 00 00 00 00       	call   7b8 <.altinstr_replacement+0x7b8>	7b4: R_X86_64_PLT32	clear_page_rep-0x4
07b8  7b8:	e8 00 00 00 00       	call   7bd <.altinstr_replacement+0x7bd>	7b9: R_X86_64_PLT32	clear_page_erms-0x4
07bd  7bd:	0f 01 cb             	stac
07c0  7c0:	0f ae e8             	lfence
07c3  7c3:	0f 01 ca             	clac
07c6  7c6:	0f 01 ca             	clac
07c9  7c9:	0f 01 cb             	stac
07cc  7cc:	0f ae e8             	lfence
07cf  7cf:	0f 01 ca             	clac
07d2  7d2:	0f 01 ca             	clac
07d5  7d5:	e8 00 00 00 00       	call   7da <.altinstr_replacement+0x7da>	7d6: R_X86_64_PLT32	copy_user_generic_string-0x4
07da  7da:	e8 00 00 00 00       	call   7df <.altinstr_replacement+0x7df>	7db: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
07df  7df:	e8 00 00 00 00       	call   7e4 <.altinstr_replacement+0x7e4>	7e0: R_X86_64_PLT32	copy_user_generic_string-0x4
07e4  7e4:	e8 00 00 00 00       	call   7e9 <.altinstr_replacement+0x7e9>	7e5: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
07e9  7e9:	0f ae e8             	lfence
07ec  7ec:	0f 0d 0c 30          	prefetchw (%rax,%rsi,1)
07f0  7f0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07f5  7f5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07fa  7fa:	e8 00 00 00 00       	call   7ff <.altinstr_replacement+0x7ff>	7fb: R_X86_64_PLT32	copy_user_generic_string-0x4
07ff  7ff:	e8 00 00 00 00       	call   804 <.altinstr_replacement+0x804>	800: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0804  804:	e8 00 00 00 00       	call   809 <.altinstr_replacement+0x809>	805: R_X86_64_PLT32	copy_user_generic_string-0x4
0809  809:	e8 00 00 00 00       	call   80e <.altinstr_replacement+0x80e>	80a: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
080e  80e:	0f 0d 48 f8          	prefetchw -0x8(%rax)
0812  812:	e8 00 00 00 00       	call   817 <.altinstr_replacement+0x817>	813: R_X86_64_PLT32	clear_page_rep-0x4
0817  817:	e8 00 00 00 00       	call   81c <.altinstr_replacement+0x81c>	818: R_X86_64_PLT32	clear_page_erms-0x4
081c  81c:	e8 00 00 00 00       	call   821 <.altinstr_replacement+0x821>	81d: R_X86_64_PLT32	clear_page_rep-0x4
0821  821:	e8 00 00 00 00       	call   826 <.altinstr_replacement+0x826>	822: R_X86_64_PLT32	clear_page_erms-0x4
0826  826:	e8 00 00 00 00       	call   82b <.altinstr_replacement+0x82b>	827: R_X86_64_PLT32	clear_page_rep-0x4
082b  82b:	e8 00 00 00 00       	call   830 <.altinstr_replacement+0x830>	82c: R_X86_64_PLT32	clear_page_erms-0x4
0830  830:	0f 01 cb             	stac
0833  833:	0f ae e8             	lfence
0836  836:	0f 01 ca             	clac
0839  839:	0f 01 cb             	stac
083c  83c:	0f ae e8             	lfence
083f  83f:	0f 01 ca             	clac
0842  842:	e9 00 00 00 00       	jmp    847 <.altinstr_replacement+0x847>	843: R_X86_64_PC32	.text+0x6f1900
0847  847:	e9 00 00 00 00       	jmp    84c <.altinstr_replacement+0x84c>	848: R_X86_64_PC32	.text+0x6f2e04
084c  84c:	e9 00 00 00 00       	jmp    851 <.altinstr_replacement+0x851>	84d: R_X86_64_PC32	.text+0x6f36c5
0851  851:	e9 00 00 00 00       	jmp    856 <.altinstr_replacement+0x856>	852: R_X86_64_PC32	.text+0x6f3c27
0856  856:	e9 00 00 00 00       	jmp    85b <.altinstr_replacement+0x85b>	857: R_X86_64_PC32	.text+0x6f43e7
085b  85b:	e8 00 00 00 00       	call   860 <.altinstr_replacement+0x860>	85c: R_X86_64_PLT32	copy_user_generic_string-0x4
0860  860:	e8 00 00 00 00       	call   865 <.altinstr_replacement+0x865>	861: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0865  865:	e8 00 00 00 00       	call   86a <.altinstr_replacement+0x86a>	866: R_X86_64_PLT32	copy_user_generic_string-0x4
086a  86a:	e8 00 00 00 00       	call   86f <.altinstr_replacement+0x86f>	86b: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
086f  86f:	e8 00 00 00 00       	call   874 <.altinstr_replacement+0x874>	870: R_X86_64_PLT32	clear_page_rep-0x4
0874  874:	e8 00 00 00 00       	call   879 <.altinstr_replacement+0x879>	875: R_X86_64_PLT32	clear_page_erms-0x4
0879  879:	e9 00 00 00 00       	jmp    87e <.altinstr_replacement+0x87e>	87a: R_X86_64_PC32	.text+0x711d82
087e  87e:	e8 00 00 00 00       	call   883 <.altinstr_replacement+0x883>	87f: R_X86_64_PLT32	clear_page_rep-0x4
0883  883:	e8 00 00 00 00       	call   888 <.altinstr_replacement+0x888>	884: R_X86_64_PLT32	clear_page_erms-0x4
0888  888:	e8 00 00 00 00       	call   88d <.altinstr_replacement+0x88d>	889: R_X86_64_PLT32	clear_page_rep-0x4
088d  88d:	e8 00 00 00 00       	call   892 <.altinstr_replacement+0x892>	88e: R_X86_64_PLT32	clear_page_erms-0x4
0892  892:	e8 00 00 00 00       	call   897 <.altinstr_replacement+0x897>	893: R_X86_64_PLT32	clear_page_rep-0x4
0897  897:	e8 00 00 00 00       	call   89c <.altinstr_replacement+0x89c>	898: R_X86_64_PLT32	clear_page_erms-0x4
089c  89c:	e8 00 00 00 00       	call   8a1 <.altinstr_replacement+0x8a1>	89d: R_X86_64_PLT32	clear_page_rep-0x4
08a1  8a1:	e8 00 00 00 00       	call   8a6 <.altinstr_replacement+0x8a6>	8a2: R_X86_64_PLT32	clear_page_erms-0x4
08a6  8a6:	e8 00 00 00 00       	call   8ab <.altinstr_replacement+0x8ab>	8a7: R_X86_64_PLT32	clear_page_rep-0x4
08ab  8ab:	e8 00 00 00 00       	call   8b0 <.altinstr_replacement+0x8b0>	8ac: R_X86_64_PLT32	clear_page_erms-0x4
08b0  8b0:	e9 00 00 00 00       	jmp    8b5 <.altinstr_replacement+0x8b5>	8b1: R_X86_64_PC32	.text+0x72bc78
08b5  8b5:	e9 00 00 00 00       	jmp    8ba <.altinstr_replacement+0x8ba>	8b6: R_X86_64_PC32	.text+0x73036a
08ba  8ba:	e9 00 00 00 00       	jmp    8bf <.altinstr_replacement+0x8bf>	8bb: R_X86_64_PC32	.text+0x7304e0
08bf  8bf:	e9 00 00 00 00       	jmp    8c4 <.altinstr_replacement+0x8c4>	8c0: R_X86_64_PC32	.text+0x730aa6
08c4  8c4:	e9 00 00 00 00       	jmp    8c9 <.altinstr_replacement+0x8c9>	8c5: R_X86_64_PC32	.text+0x730d66
08c9  8c9:	e9 00 00 00 00       	jmp    8ce <.altinstr_replacement+0x8ce>	8ca: R_X86_64_PC32	.text+0x733e60
08ce  8ce:	e9 00 00 00 00       	jmp    8d3 <.altinstr_replacement+0x8d3>	8cf: R_X86_64_PC32	.text+0x734273
08d3  8d3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08d8  8d8:	e8 00 00 00 00       	call   8dd <.altinstr_replacement+0x8dd>	8d9: R_X86_64_PLT32	clear_page_rep-0x4
08dd  8dd:	e8 00 00 00 00       	call   8e2 <.altinstr_replacement+0x8e2>	8de: R_X86_64_PLT32	clear_page_erms-0x4
08e2  8e2:	e8 00 00 00 00       	call   8e7 <.altinstr_replacement+0x8e7>	8e3: R_X86_64_PLT32	clear_page_rep-0x4
08e7  8e7:	e8 00 00 00 00       	call   8ec <.altinstr_replacement+0x8ec>	8e8: R_X86_64_PLT32	clear_page_erms-0x4
08ec  8ec:	0f 0d 0a             	prefetchw (%rdx)
08ef  8ef:	41 0f 0d 0e          	prefetchw (%r14)
08f3  8f3:	e8 00 00 00 00       	call   8f8 <.altinstr_replacement+0x8f8>	8f4: R_X86_64_PLT32	clear_page_rep-0x4
08f8  8f8:	e8 00 00 00 00       	call   8fd <.altinstr_replacement+0x8fd>	8f9: R_X86_64_PLT32	clear_page_erms-0x4
08fd  8fd:	e8 00 00 00 00       	call   902 <.altinstr_replacement+0x902>	8fe: R_X86_64_PLT32	clear_page_rep-0x4
0902  902:	e8 00 00 00 00       	call   907 <.altinstr_replacement+0x907>	903: R_X86_64_PLT32	clear_page_erms-0x4
0907  907:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
090c  90c:	0f 94 c0             	sete   %al
090f  90f:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
0913  913:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0918  918:	0f 94 c0             	sete   %al
091b  91b:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
091f  91f:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0924  924:	0f 94 c0             	sete   %al
0927  927:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
092b  92b:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0930  930:	0f 94 c0             	sete   %al
0933  933:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0938  938:	0f 94 c0             	sete   %al
093b  93b:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0940  940:	0f 94 c0             	sete   %al
0943  943:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
0947  947:	65 49 0f c7 08       	cmpxchg16b %gs:(%r8)
094c  94c:	0f 94 c0             	sete   %al
094f  94f:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0954  954:	0f 94 c0             	sete   %al
0957  957:	9c                   	pushf
0958  958:	8f 85 68 ff ff ff    	pop    -0x98(%rbp)
095e  95e:	0f 01 ca             	clac
0961  961:	ff b5 68 ff ff ff    	push   -0x98(%rbp)
0967  967:	9d                   	popf
0968  968:	e8 00 00 00 00       	call   96d <.altinstr_replacement+0x96d>	969: R_X86_64_PLT32	clear_page_rep-0x4
096d  96d:	e8 00 00 00 00       	call   972 <.altinstr_replacement+0x972>	96e: R_X86_64_PLT32	clear_page_erms-0x4
0972  972:	e8 00 00 00 00       	call   977 <.altinstr_replacement+0x977>	973: R_X86_64_PLT32	clear_page_rep-0x4
0977  977:	e8 00 00 00 00       	call   97c <.altinstr_replacement+0x97c>	978: R_X86_64_PLT32	clear_page_erms-0x4
097c  97c:	e8 00 00 00 00       	call   981 <.altinstr_replacement+0x981>	97d: R_X86_64_PLT32	clear_page_rep-0x4
0981  981:	e8 00 00 00 00       	call   986 <.altinstr_replacement+0x986>	982: R_X86_64_PLT32	clear_page_erms-0x4
0986  986:	0f 01 cb             	stac
0989  989:	0f ae e8             	lfence
098c  98c:	0f 01 ca             	clac
098f  98f:	0f 01 ca             	clac
0992  992:	0f 01 cb             	stac
0995  995:	0f ae e8             	lfence
0998  998:	0f 01 ca             	clac
099b  99b:	0f 01 ca             	clac
099e  99e:	0f 01 cb             	stac
09a1  9a1:	0f ae e8             	lfence
09a4  9a4:	0f 01 ca             	clac
09a7  9a7:	0f 01 ca             	clac
09aa  9aa:	0f 01 cb             	stac
09ad  9ad:	0f ae e8             	lfence
09b0  9b0:	0f 01 ca             	clac
09b3  9b3:	0f 01 ca             	clac
09b6  9b6:	0f 01 cb             	stac
09b9  9b9:	0f ae e8             	lfence
09bc  9bc:	0f 01 ca             	clac
09bf  9bf:	0f 01 ca             	clac
09c2  9c2:	0f 01 cb             	stac
09c5  9c5:	0f ae e8             	lfence
09c8  9c8:	0f 01 ca             	clac
09cb  9cb:	0f 01 ca             	clac
09ce  9ce:	0f 01 cb             	stac
09d1  9d1:	0f ae e8             	lfence
09d4  9d4:	0f 01 ca             	clac
09d7  9d7:	0f 01 ca             	clac
09da  9da:	0f 01 cb             	stac
09dd  9dd:	0f ae e8             	lfence
09e0  9e0:	0f 01 ca             	clac
09e3  9e3:	0f 01 ca             	clac
09e6  9e6:	e8 00 00 00 00       	call   9eb <.altinstr_replacement+0x9eb>	9e7: R_X86_64_PLT32	copy_user_generic_string-0x4
09eb  9eb:	e8 00 00 00 00       	call   9f0 <.altinstr_replacement+0x9f0>	9ec: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
09f0  9f0:	e8 00 00 00 00       	call   9f5 <.altinstr_replacement+0x9f5>	9f1: R_X86_64_PLT32	copy_user_generic_string-0x4
09f5  9f5:	e8 00 00 00 00       	call   9fa <.altinstr_replacement+0x9fa>	9f6: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
09fa  9fa:	e8 00 00 00 00       	call   9ff <.altinstr_replacement+0x9ff>	9fb: R_X86_64_PLT32	copy_user_generic_string-0x4
09ff  9ff:	e8 00 00 00 00       	call   a04 <.altinstr_replacement+0xa04>	a00: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0a04  a04:	0f 01 cb             	stac
0a07  a07:	0f ae e8             	lfence
0a0a  a0a:	0f 01 ca             	clac
0a0d  a0d:	0f 01 ca             	clac
0a10  a10:	0f 01 cb             	stac
0a13  a13:	0f ae e8             	lfence
0a16  a16:	0f 01 ca             	clac
0a19  a19:	0f 01 ca             	clac
0a1c  a1c:	0f 0d 8f 80 09 00 00 	prefetchw 0x980(%rdi)
0a23  a23:	f3 0f b8 c7          	popcnt %edi,%eax
0a27  a27:	0f 01 cb             	stac
0a2a  a2a:	e8 00 00 00 00       	call   a2f <.altinstr_replacement+0xa2f>	a2b: R_X86_64_PLT32	clear_user_erms-0x4
0a2f  a2f:	e8 00 00 00 00       	call   a34 <.altinstr_replacement+0xa34>	a30: R_X86_64_PLT32	clear_user_rep_good-0x4
0a34  a34:	e8 00 00 00 00       	call   a39 <.altinstr_replacement+0xa39>	a35: R_X86_64_PLT32	clear_user_original-0x4
0a39  a39:	0f 01 ca             	clac
0a3c  a3c:	0f 01 cb             	stac
0a3f  a3f:	e8 00 00 00 00       	call   a44 <.altinstr_replacement+0xa44>	a40: R_X86_64_PLT32	clear_user_erms-0x4
0a44  a44:	e8 00 00 00 00       	call   a49 <.altinstr_replacement+0xa49>	a45: R_X86_64_PLT32	clear_user_rep_good-0x4
0a49  a49:	e8 00 00 00 00       	call   a4e <.altinstr_replacement+0xa4e>	a4a: R_X86_64_PLT32	clear_user_original-0x4
0a4e  a4e:	0f 01 ca             	clac
0a51  a51:	0f 01 cb             	stac
0a54  a54:	e8 00 00 00 00       	call   a59 <.altinstr_replacement+0xa59>	a55: R_X86_64_PLT32	clear_user_erms-0x4
0a59  a59:	e8 00 00 00 00       	call   a5e <.altinstr_replacement+0xa5e>	a5a: R_X86_64_PLT32	clear_user_rep_good-0x4
0a5e  a5e:	e8 00 00 00 00       	call   a63 <.altinstr_replacement+0xa63>	a5f: R_X86_64_PLT32	clear_user_original-0x4
0a63  a63:	0f 01 ca             	clac
0a66  a66:	0f 01 cb             	stac
0a69  a69:	e8 00 00 00 00       	call   a6e <.altinstr_replacement+0xa6e>	a6a: R_X86_64_PLT32	clear_user_erms-0x4
0a6e  a6e:	e8 00 00 00 00       	call   a73 <.altinstr_replacement+0xa73>	a6f: R_X86_64_PLT32	clear_user_rep_good-0x4
0a73  a73:	e8 00 00 00 00       	call   a78 <.altinstr_replacement+0xa78>	a74: R_X86_64_PLT32	clear_user_original-0x4
0a78  a78:	0f 01 ca             	clac
0a7b  a7b:	0f 01 cb             	stac
0a7e  a7e:	e8 00 00 00 00       	call   a83 <.altinstr_replacement+0xa83>	a7f: R_X86_64_PLT32	clear_user_erms-0x4
0a83  a83:	e8 00 00 00 00       	call   a88 <.altinstr_replacement+0xa88>	a84: R_X86_64_PLT32	clear_user_rep_good-0x4
0a88  a88:	e8 00 00 00 00       	call   a8d <.altinstr_replacement+0xa8d>	a89: R_X86_64_PLT32	clear_user_original-0x4
0a8d  a8d:	0f 01 ca             	clac
0a90  a90:	0f 01 cb             	stac
0a93  a93:	e8 00 00 00 00       	call   a98 <.altinstr_replacement+0xa98>	a94: R_X86_64_PLT32	clear_user_erms-0x4
0a98  a98:	e8 00 00 00 00       	call   a9d <.altinstr_replacement+0xa9d>	a99: R_X86_64_PLT32	clear_user_rep_good-0x4
0a9d  a9d:	e8 00 00 00 00       	call   aa2 <.altinstr_replacement+0xaa2>	a9e: R_X86_64_PLT32	clear_user_original-0x4
0aa2  aa2:	0f 01 ca             	clac
0aa5  aa5:	e9 00 00 00 00       	jmp    aaa <.altinstr_replacement+0xaaa>	aa6: R_X86_64_PC32	.text+0x922db7
0aaa  aaa:	e8 00 00 00 00       	call   aaf <.altinstr_replacement+0xaaf>	aab: R_X86_64_PLT32	clear_page_rep-0x4
0aaf  aaf:	e8 00 00 00 00       	call   ab4 <.altinstr_replacement+0xab4>	ab0: R_X86_64_PLT32	clear_page_erms-0x4
0ab4  ab4:	e8 00 00 00 00       	call   ab9 <.altinstr_replacement+0xab9>	ab5: R_X86_64_PLT32	clear_page_rep-0x4
0ab9  ab9:	e8 00 00 00 00       	call   abe <.altinstr_replacement+0xabe>	aba: R_X86_64_PLT32	clear_page_erms-0x4
0abe  abe:	0f 01 cb             	stac
0ac1  ac1:	e8 00 00 00 00       	call   ac6 <.altinstr_replacement+0xac6>	ac2: R_X86_64_PLT32	clear_user_erms-0x4
0ac6  ac6:	e8 00 00 00 00       	call   acb <.altinstr_replacement+0xacb>	ac7: R_X86_64_PLT32	clear_user_rep_good-0x4
0acb  acb:	e8 00 00 00 00       	call   ad0 <.altinstr_replacement+0xad0>	acc: R_X86_64_PLT32	clear_user_original-0x4
0ad0  ad0:	0f 01 ca             	clac
0ad3  ad3:	0f 01 cb             	stac
0ad6  ad6:	e8 00 00 00 00       	call   adb <.altinstr_replacement+0xadb>	ad7: R_X86_64_PLT32	clear_user_erms-0x4
0adb  adb:	e8 00 00 00 00       	call   ae0 <.altinstr_replacement+0xae0>	adc: R_X86_64_PLT32	clear_user_rep_good-0x4
0ae0  ae0:	e8 00 00 00 00       	call   ae5 <.altinstr_replacement+0xae5>	ae1: R_X86_64_PLT32	clear_user_original-0x4
0ae5  ae5:	0f 01 ca             	clac
0ae8  ae8:	f3 0f b8 c7          	popcnt %edi,%eax
0aec  aec:	f3 0f b8 c7          	popcnt %edi,%eax
0af0  af0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0af5  af5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0afa  afa:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0aff  aff:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b04  b04:	e8 00 00 00 00       	call   b09 <.altinstr_replacement+0xb09>	b05: R_X86_64_PLT32	copy_user_generic_string-0x4
0b09  b09:	e8 00 00 00 00       	call   b0e <.altinstr_replacement+0xb0e>	b0a: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0b0e  b0e:	e8 00 00 00 00       	call   b13 <.altinstr_replacement+0xb13>	b0f: R_X86_64_PLT32	copy_user_generic_string-0x4
0b13  b13:	e8 00 00 00 00       	call   b18 <.altinstr_replacement+0xb18>	b14: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0b18  b18:	0f 01 cb             	stac
0b1b  b1b:	0f ae e8             	lfence
0b1e  b1e:	0f 01 ca             	clac
0b21  b21:	0f 01 ca             	clac
0b24  b24:	0f 01 cb             	stac
0b27  b27:	e8 00 00 00 00       	call   b2c <.altinstr_replacement+0xb2c>	b28: R_X86_64_PLT32	clear_user_erms-0x4
0b2c  b2c:	e8 00 00 00 00       	call   b31 <.altinstr_replacement+0xb31>	b2d: R_X86_64_PLT32	clear_user_rep_good-0x4
0b31  b31:	e8 00 00 00 00       	call   b36 <.altinstr_replacement+0xb36>	b32: R_X86_64_PLT32	clear_user_original-0x4
0b36  b36:	0f 01 ca             	clac
0b39  b39:	0f 01 cb             	stac
0b3c  b3c:	e8 00 00 00 00       	call   b41 <.altinstr_replacement+0xb41>	b3d: R_X86_64_PLT32	clear_user_erms-0x4
0b41  b41:	e8 00 00 00 00       	call   b46 <.altinstr_replacement+0xb46>	b42: R_X86_64_PLT32	clear_user_rep_good-0x4
0b46  b46:	e8 00 00 00 00       	call   b4b <.altinstr_replacement+0xb4b>	b47: R_X86_64_PLT32	clear_user_original-0x4
0b4b  b4b:	0f 01 ca             	clac
0b4e  b4e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b53  b53:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b58  b58:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b5d  b5d:	f3 0f b8 c7          	popcnt %edi,%eax
0b61  b61:	f3 0f b8 c7          	popcnt %edi,%eax
0b65  b65:	0f 01 cb             	stac
0b68  b68:	0f ae e8             	lfence
0b6b  b6b:	0f 01 ca             	clac
0b6e  b6e:	0f 01 ca             	clac
0b71  b71:	e8 00 00 00 00       	call   b76 <.altinstr_replacement+0xb76>	b72: R_X86_64_PLT32	copy_user_generic_string-0x4
0b76  b76:	e8 00 00 00 00       	call   b7b <.altinstr_replacement+0xb7b>	b77: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0b7b  b7b:	e8 00 00 00 00       	call   b80 <.altinstr_replacement+0xb80>	b7c: R_X86_64_PLT32	copy_user_generic_string-0x4
0b80  b80:	e8 00 00 00 00       	call   b85 <.altinstr_replacement+0xb85>	b81: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0b85  b85:	0f 01 cb             	stac
0b88  b88:	0f ae e8             	lfence
0b8b  b8b:	0f 01 ca             	clac
0b8e  b8e:	0f 01 cb             	stac
0b91  b91:	0f ae e8             	lfence
0b94  b94:	0f 01 ca             	clac
0b97  b97:	9c                   	pushf
0b98  b98:	5b                   	pop    %rbx
0b99  b99:	0f 01 ca             	clac
0b9c  b9c:	53                   	push   %rbx
0b9d  b9d:	9d                   	popf
0b9e  b9e:	9c                   	pushf
0b9f  b9f:	41 5d                	pop    %r13
0ba1  ba1:	0f 01 ca             	clac
0ba4  ba4:	41 55                	push   %r13
0ba6  ba6:	9d                   	popf
0ba7  ba7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0bac  bac:	e9 00 00 00 00       	jmp    bb1 <.altinstr_replacement+0xbb1>	bad: R_X86_64_PC32	.init.text+0x641cb
0bb1  bb1:	e9 00 00 00 00       	jmp    bb6 <.altinstr_replacement+0xbb6>	bb2: R_X86_64_PC32	.text+0x12305da
0bb6  bb6:	e9 00 00 00 00       	jmp    bbb <.altinstr_replacement+0xbbb>	bb7: R_X86_64_PC32	.text+0x1230524
0bbb  bbb:	e9 00 00 00 00       	jmp    bc0 <.altinstr_replacement+0xbc0>	bbc: R_X86_64_PC32	.text+0x12e6c46
0bc0  bc0:	e9 00 00 00 00       	jmp    bc5 <.altinstr_replacement+0xbc5>	bc1: R_X86_64_PC32	.text+0x12e8e49
0bc5  bc5:	e9 00 00 00 00       	jmp    bca <.altinstr_replacement+0xbca>	bc6: R_X86_64_PC32	.text+0x1321142
0bca  bca:	e9 00 00 00 00       	jmp    bcf <.altinstr_replacement+0xbcf>	bcb: R_X86_64_PC32	.cpuidle.text+0x10b9
0bcf  bcf:	e9 00 00 00 00       	jmp    bd4 <.altinstr_replacement+0xbd4>	bd0: R_X86_64_PC32	.cpuidle.text+0x1553
0bd4  bd4:	f3 0f b8 c7          	popcnt %edi,%eax
0bd8  bd8:	0f 01 cb             	stac
0bdb  bdb:	e8 00 00 00 00       	call   be0 <.altinstr_replacement+0xbe0>	bdc: R_X86_64_PLT32	clear_user_erms-0x4
0be0  be0:	e8 00 00 00 00       	call   be5 <.altinstr_replacement+0xbe5>	be1: R_X86_64_PLT32	clear_user_rep_good-0x4
0be5  be5:	e8 00 00 00 00       	call   bea <.altinstr_replacement+0xbea>	be6: R_X86_64_PLT32	clear_user_original-0x4
0bea  bea:	0f 01 ca             	clac
0bed  bed:	e9 00 00 00 00       	jmp    bf2 <.altinstr_replacement+0xbf2>	bee: R_X86_64_PC32	.text+0x147f294
0bf2  bf2:	e9 00 00 00 00       	jmp    bf7 <.altinstr_replacement+0xbf7>	bf3: R_X86_64_PC32	.text+0x147f2cf
0bf7  bf7:	e9 00 00 00 00       	jmp    bfc <.altinstr_replacement+0xbfc>	bf8: R_X86_64_PC32	.text+0x14805b9
0bfc  bfc:	e9 00 00 00 00       	jmp    c01 <.altinstr_replacement+0xc01>	bfd: R_X86_64_PC32	.text+0x14805db
0c01  c01:	f3 0f b8 c7          	popcnt %edi,%eax
0c05  c05:	e9 00 00 00 00       	jmp    c0a <.altinstr_replacement+0xc0a>	c06: R_X86_64_PC32	.text+0x14eb129
0c0a  c0a:	66 0f ae 38          	clflushopt (%rax)
0c0e  c0e:	66 0f ae 7e ff       	clflushopt -0x1(%rsi)
0c13  c13:	66 0f ae 38          	clflushopt (%rax)
0c17  c17:	e9 00 00 00 00       	jmp    c1c <.altinstr_replacement+0xc1c>	c18: R_X86_64_PC32	.text+0x14eb31a
0c1c  c1c:	e9 00 00 00 00       	jmp    c21 <.altinstr_replacement+0xc21>	c1d: R_X86_64_PC32	.text+0x14eb475
0c21  c21:	e9 00 00 00 00       	jmp    c26 <.altinstr_replacement+0xc26>	c22: R_X86_64_PC32	.text+0x14eba70
0c26  c26:	f3 0f b8 c7          	popcnt %edi,%eax
0c2a  c2a:	f3 0f b8 c7          	popcnt %edi,%eax
0c2e  c2e:	f3 0f b8 c7          	popcnt %edi,%eax
0c32  c32:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c37  c37:	0f 01 cb             	stac
0c3a  c3a:	e8 00 00 00 00       	call   c3f <.altinstr_replacement+0xc3f>	c3b: R_X86_64_PLT32	clear_user_erms-0x4
0c3f  c3f:	e8 00 00 00 00       	call   c44 <.altinstr_replacement+0xc44>	c40: R_X86_64_PLT32	clear_user_rep_good-0x4
0c44  c44:	e8 00 00 00 00       	call   c49 <.altinstr_replacement+0xc49>	c45: R_X86_64_PLT32	clear_user_original-0x4
0c49  c49:	0f 01 ca             	clac
0c4c  c4c:	f3 0f b8 c7          	popcnt %edi,%eax
0c50  c50:	f3 0f b8 c7          	popcnt %edi,%eax
0c54  c54:	f3 0f b8 c7          	popcnt %edi,%eax
0c58  c58:	f3 0f b8 c7          	popcnt %edi,%eax
0c5c  c5c:	f3 0f b8 c7          	popcnt %edi,%eax
0c60  c60:	f3 0f b8 c7          	popcnt %edi,%eax
0c64  c64:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c69  c69:	f3 0f b8 c7          	popcnt %edi,%eax
0c6d  c6d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c72  c72:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c77  c77:	f3 0f b8 c7          	popcnt %edi,%eax
0c7b  c7b:	e9 00 00 00 00       	jmp    c80 <.altinstr_replacement+0xc80>	c7c: R_X86_64_PC32	.text+0x1d295c6
0c80  c80:	0f 01 d9             	vmmcall
0c83  c83:	e9 00 00 00 00       	jmp    c88 <.altinstr_replacement+0xc88>	c84: R_X86_64_PC32	.text+0x1d29680
0c88  c88:	0f 01 d9             	vmmcall
0c8b  c8b:	e9 00 00 00 00       	jmp    c90 <.altinstr_replacement+0xc90>	c8c: R_X86_64_PC32	.text+0x1d29a05
0c90  c90:	0f 01 d9             	vmmcall
0c93  c93:	f3 0f b8 c7          	popcnt %edi,%eax
0c97  c97:	f3 0f b8 c7          	popcnt %edi,%eax
0c9b  c9b:	f3 0f b8 c7          	popcnt %edi,%eax
0c9f  c9f:	f3 0f b8 c7          	popcnt %edi,%eax
0ca3  ca3:	f3 0f b8 c7          	popcnt %edi,%eax
0ca7  ca7:	e9 00 00 00 00       	jmp    cac <.altinstr_replacement+0xcac>	ca8: R_X86_64_PC32	.text+0x1ef7717
0cac  cac:	f3 0f b8 c7          	popcnt %edi,%eax
0cb0  cb0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cb5  cb5:	f3 0f b8 c7          	popcnt %edi,%eax
0cb9  cb9:	0f 01 cb             	stac
0cbc  cbc:	e8 00 00 00 00       	call   cc1 <.altinstr_replacement+0xcc1>	cbd: R_X86_64_PLT32	clear_user_erms-0x4
0cc1  cc1:	e8 00 00 00 00       	call   cc6 <.altinstr_replacement+0xcc6>	cc2: R_X86_64_PLT32	clear_user_rep_good-0x4
0cc6  cc6:	e8 00 00 00 00       	call   ccb <.altinstr_replacement+0xccb>	cc7: R_X86_64_PLT32	clear_user_original-0x4
0ccb  ccb:	0f 01 ca             	clac
0cce  cce:	41 0f 0d 0f          	prefetchw (%r15)
0cd2  cd2:	41 0f 0d 0c 01       	prefetchw (%r9,%rax,1)
0cd7  cd7:	0f 01 cb             	stac
0cda  cda:	0f ae e8             	lfence
0cdd  cdd:	0f 01 ca             	clac
0ce0  ce0:	0f 01 ca             	clac
0ce3  ce3:	f3 0f b8 c7          	popcnt %edi,%eax
0ce7  ce7:	f3 0f b8 c7          	popcnt %edi,%eax
0ceb  ceb:	f3 0f b8 c7          	popcnt %edi,%eax
0cef  cef:	f3 0f b8 c7          	popcnt %edi,%eax
0cf3  cf3:	f3 0f b8 c7          	popcnt %edi,%eax
0cf7  cf7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cfc  cfc:	0f 0d 09             	prefetchw (%rcx)
0cff  cff:	e9 00 00 00 00       	jmp    d04 <.altinstr_replacement+0xd04>	d00: R_X86_64_PC32	.text+0x2b57a0e
0d04  d04:	e9 00 00 00 00       	jmp    d09 <.altinstr_replacement+0xd09>	d05: R_X86_64_PC32	.text+0x2b57b21
0d09  d09:	0f 01 cb             	stac
0d0c  d0c:	0f 01 ca             	clac
0d0f  d0f:	0f 01 cb             	stac
0d12  d12:	0f 01 ca             	clac
0d15  d15:	e8 00 00 00 00       	call   d1a <.altinstr_replacement+0xd1a>	d16: R_X86_64_PLT32	copy_user_generic_string-0x4
0d1a  d1a:	e8 00 00 00 00       	call   d1f <.altinstr_replacement+0xd1f>	d1b: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0d1f  d1f:	0f 01 cb             	stac
0d22  d22:	0f 01 cb             	stac
0d25  d25:	0f 01 ca             	clac
0d28  d28:	0f 01 cb             	stac
0d2b  d2b:	0f 01 ca             	clac
0d2e  d2e:	0f 01 ca             	clac
0d31  d31:	0f 01 ca             	clac
0d34  d34:	0f 01 ca             	clac
0d37  d37:	0f 01 cb             	stac
0d3a  d3a:	0f 01 ca             	clac
0d3d  d3d:	0f ae e8             	lfence
0d40  d40:	0f 31                	rdtsc
0d42  d42:	0f 01 f9             	rdtscp
0d45  d45:	0f ae e8             	lfence
0d48  d48:	0f 31                	rdtsc
0d4a  d4a:	0f 01 f9             	rdtscp
0d4d  d4d:	0f ae e8             	lfence
0d50  d50:	0f 31                	rdtsc
0d52  d52:	0f 01 f9             	rdtscp
0d55  d55:	0f ae e8             	lfence
0d58  d58:	0f 31                	rdtsc
0d5a  d5a:	0f 01 f9             	rdtscp
0d5d  d5d:	0f ae e8             	lfence
0d60  d60:	0f 31                	rdtsc
0d62  d62:	0f 01 f9             	rdtscp
0d65  d65:	0f 01 cb             	stac
0d68  d68:	0f 01 ca             	clac
0d6b  d6b:	0f 01 cb             	stac
0d6e  d6e:	0f 01 ca             	clac
0d71  d71:	0f 01 cb             	stac
0d74  d74:	0f 01 ca             	clac
0d77  d77:	0f 01 cb             	stac
0d7a  d7a:	0f 01 ca             	clac
0d7d  d7d:	0f 01 cb             	stac
0d80  d80:	0f ae e8             	lfence
0d83  d83:	0f 01 ca             	clac
0d86  d86:	0f 01 cb             	stac
0d89  d89:	0f ae e8             	lfence
0d8c  d8c:	0f 01 ca             	clac
0d8f  d8f:	0f 01 cb             	stac
0d92  d92:	0f ae e8             	lfence
0d95  d95:	0f 01 ca             	clac
0d98  d98:	0f 01 cb             	stac
0d9b  d9b:	0f ae e8             	lfence
0d9e  d9e:	0f 01 ca             	clac
0da1  da1:	0f 01 ca             	clac
0da4  da4:	e8 00 00 00 00       	call   da9 <.altinstr_replacement+0xda9>	da5: R_X86_64_PLT32	copy_user_generic_string-0x4
0da9  da9:	e8 00 00 00 00       	call   dae <.altinstr_replacement+0xdae>	daa: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0dae  dae:	e9 00 00 00 00       	jmp    db3 <.altinstr_replacement+0xdb3>	daf: R_X86_64_PC32	.noinstr.text+0x513c
0db3  db3:	e9 00 00 00 00       	jmp    db8 <.altinstr_replacement+0xdb8>	db4: R_X86_64_PC32	.text+0x2b61715
0db8  db8:	e9 00 00 00 00       	jmp    dbd <.altinstr_replacement+0xdbd>	db9: R_X86_64_PC32	.text+0x2b6177c
0dbd  dbd:	0f 01 cb             	stac
0dc0  dc0:	0f 01 ca             	clac
0dc3  dc3:	0f 01 cb             	stac
0dc6  dc6:	0f 01 ca             	clac
0dc9  dc9:	0f 01 cb             	stac
0dcc  dcc:	0f 01 ca             	clac
0dcf  dcf:	0f 01 cb             	stac
0dd2  dd2:	0f 01 ca             	clac
0dd5  dd5:	0f 01 cb             	stac
0dd8  dd8:	0f 01 ca             	clac
0ddb  ddb:	0f 01 cb             	stac
0dde  dde:	0f 01 ca             	clac
0de1  de1:	0f 01 cb             	stac
0de4  de4:	0f 01 ca             	clac
0de7  de7:	0f 01 cb             	stac
0dea  dea:	0f 01 ca             	clac
0ded  ded:	0f 01 ca             	clac
0df0  df0:	e8 00 00 00 00       	call   df5 <.altinstr_replacement+0xdf5>	df1: R_X86_64_PLT32	copy_user_generic_string-0x4
0df5  df5:	e8 00 00 00 00       	call   dfa <.altinstr_replacement+0xdfa>	df6: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0dfa  dfa:	66 0f ae 38          	clflushopt (%rax)
0dfe  dfe:	66 0f ae 30          	clwb   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DB5EA2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 02:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680833066; x=1712369066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IDTcVIfZcNQH5+xkpQShvpv9scXSJEj1E9PpSz/jsTA=;
  b=d8DKabmd0ejLFjMcXK/bGpLc6AHAGBQqPPb409MPK4Vd53xatwfAXB7/
   0C3ZPTr1EzROmXDlp8a8wbNpwXZ0/JmW4VHc5bnTAHnQv0R8DR9E6bs7v
   /iElLqlW2kaPyxc4oAWS+XKC6OqINLua3XZV5QJK6lcRnVnXKx3LaDcE9
   mt1zmlzVih4Dg6c37QibxwmdtqD8P5KlLw6EvkuAJHINcsgTbF4R5Shdy
   7mH49EQFk/csbMHiaAuS0TEen26e/K0YefoUeymj6AmxMfHN+VECatjKV
   KzAa/ptiNaDnP6xLjN3P7xi5nX7lHq5IWbs3PckBroPjhTRX/GgtAf/Ah
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326969008"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="326969008"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 19:04:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="751875746"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="751875746"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Apr 2023 19:04:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkbSh-000S1C-0D;
	Fri, 07 Apr 2023 02:04:23 +0000
Date: Fri, 7 Apr 2023 10:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/alt 2/6] vmlinux.o: warning: objtool:
 .altinstr_replacement+0x267: call without frame pointer save/setup
Message-ID: <202304070935.2wrSfKJ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/alt
head:   262584364576d25c0e5b6902314a019f0d35f7c8
commit: db0cf73244348ff083d6dfd1222d0a33d0239e1b [2/6] x86/alternative: Support relocations in alternatives
config: x86_64-randconfig-r026-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070935.2wrSfKJ8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=db0cf73244348ff083d6dfd1222d0a33d0239e1b
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/alt
        git checkout db0cf73244348ff083d6dfd1222d0a33d0239e1b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070935.2wrSfKJ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .altinstr_replacement+0x267: call without frame pointer save/setup


objdump-func vmlinux.o .altinstr_replacement:
0000 0000000000000000 <.altinstr_replacement>:
0000    0:	e9 00 00 00 00       	jmp    5 <.altinstr_replacement+0x5>	1: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
0005    5:	49 c7 c4 10 00 00 00 	mov    $0x10,%r12
000c    c:	e8 01 00 00 00       	call   12 <.altinstr_replacement+0x12>
0011   11:	cc                   	int3
0012   12:	e8 01 00 00 00       	call   18 <.altinstr_replacement+0x18>
0017   17:	cc                   	int3
0018   18:	48 83 c4 10          	add    $0x10,%rsp
001c   1c:	49 ff cc             	dec    %r12
001f   1f:	75 eb                	jne    c <.altinstr_replacement+0xc>
0021   21:	0f ae e8             	lfence
0024   24:	90                   	nop
0025   25:	90                   	nop
0026   26:	e8 01 00 00 00       	call   2c <.altinstr_replacement+0x2c>
002b   2b:	cc                   	int3
002c   2c:	48 83 c4 08          	add    $0x8,%rsp
0030   30:	0f ae e8             	lfence
0033   33:	0f 01 ca             	clac
0036   36:	e8 00 00 00 00       	call   3b <.altinstr_replacement+0x3b>	37: R_X86_64_PLT32	xen_error_entry-0x4
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
00c6   c6:	0f 01 ca             	clac
00c9   c9:	e8 00 00 00 00       	call   ce <.altinstr_replacement+0xce>	ca: R_X86_64_PLT32	xen_error_entry-0x4
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
0126  126:	0f ae f0             	mfence
0129  129:	b8 2b 00 00 00       	mov    $0x2b,%eax
012e  12e:	8e e8                	mov    %eax,%gs
0130  130:	0f ae e8             	lfence
0133  133:	0f ae e8             	lfence
0136  136:	0f ae e8             	lfence
0139  139:	0f ae e8             	lfence
013c  13c:	0f 01 ca             	clac
013f  13f:	0f ae e8             	lfence
0142  142:	e9 00 00 00 00       	jmp    147 <.altinstr_replacement+0x147>	143: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
0147  147:	e9 00 00 00 00       	jmp    14c <.altinstr_replacement+0x14c>	148: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
014c  14c:	0f 01 ca             	clac
014f  14f:	e9 00 00 00 00       	jmp    154 <.altinstr_replacement+0x154>	150: R_X86_64_PC32	.entry.text+0x1afa
0154  154:	e9 00 00 00 00       	jmp    159 <.altinstr_replacement+0x159>	155: R_X86_64_PC32	.text+0x7107
0159  159:	f3 48 0f b8 c7       	popcnt %rdi,%rax
015e  15e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0163  163:	0f ae e8             	lfence
0166  166:	0f 31                	rdtsc
0168  168:	0f 01 f9             	rdtscp
016b  16b:	0f ae e8             	lfence
016e  16e:	0f 31                	rdtsc
0170  170:	0f 01 f9             	rdtscp
0173  173:	e8 00 00 00 00       	call   178 <.altinstr_replacement+0x178>	174: R_X86_64_PLT32	clear_page_rep-0x4
0178  178:	e8 00 00 00 00       	call   17d <.altinstr_replacement+0x17d>	179: R_X86_64_PLT32	clear_page_erms-0x4
017d  17d:	e9 00 00 00 00       	jmp    182 <.altinstr_replacement+0x182>	17e: R_X86_64_PC32	.text+0x11f4d
0182  182:	e9 00 00 00 00       	jmp    187 <.altinstr_replacement+0x187>	183: R_X86_64_PC32	.text+0x1207a
0187  187:	e9 00 00 00 00       	jmp    18c <.altinstr_replacement+0x18c>	188: R_X86_64_PC32	.text+0x12048
018c  18c:	e9 00 00 00 00       	jmp    191 <.altinstr_replacement+0x191>	18d: R_X86_64_PC32	.text+0x128e0
0191  191:	e9 00 00 00 00       	jmp    196 <.altinstr_replacement+0x196>	192: R_X86_64_PC32	.text+0x138fa
0196  196:	e9 00 00 00 00       	jmp    19b <.altinstr_replacement+0x19b>	197: R_X86_64_PC32	.text+0x13724
019b  19b:	e9 00 00 00 00       	jmp    1a0 <.altinstr_replacement+0x1a0>	19c: R_X86_64_PC32	.text+0x13712
01a0  1a0:	e9 00 00 00 00       	jmp    1a5 <.altinstr_replacement+0x1a5>	1a1: R_X86_64_PC32	.text+0x13a7c
01a5  1a5:	e9 00 00 00 00       	jmp    1aa <.altinstr_replacement+0x1aa>	1a6: R_X86_64_PC32	.text+0x13aa7
01aa  1aa:	e9 00 00 00 00       	jmp    1af <.altinstr_replacement+0x1af>	1ab: R_X86_64_PC32	.text+0x13c17
01af  1af:	e9 00 00 00 00       	jmp    1b4 <.altinstr_replacement+0x1b4>	1b0: R_X86_64_PC32	.text+0x13adb
01b4  1b4:	e9 00 00 00 00       	jmp    1b9 <.altinstr_replacement+0x1b9>	1b5: R_X86_64_PC32	.text+0x13be4
01b9  1b9:	e9 00 00 00 00       	jmp    1be <.altinstr_replacement+0x1be>	1ba: R_X86_64_PC32	.text+0x13adb
01be  1be:	e9 00 00 00 00       	jmp    1c3 <.altinstr_replacement+0x1c3>	1bf: R_X86_64_PC32	.text+0x13c52
01c3  1c3:	e9 00 00 00 00       	jmp    1c8 <.altinstr_replacement+0x1c8>	1c4: R_X86_64_PC32	.text+0x13adb
01c8  1c8:	e9 00 00 00 00       	jmp    1cd <.altinstr_replacement+0x1cd>	1c9: R_X86_64_PC32	.text+0x144a9
01cd  1cd:	0f 01 cb             	stac
01d0  1d0:	0f ae e8             	lfence
01d3  1d3:	0f 01 ca             	clac
01d6  1d6:	0f 01 ca             	clac
01d9  1d9:	0f 01 cb             	stac
01dc  1dc:	0f ae e8             	lfence
01df  1df:	0f 01 ca             	clac
01e2  1e2:	0f 01 ca             	clac
01e5  1e5:	e9 00 00 00 00       	jmp    1ea <.altinstr_replacement+0x1ea>	1e6: R_X86_64_PC32	.text+0x1a8b6
01ea  1ea:	e9 00 00 00 00       	jmp    1ef <.altinstr_replacement+0x1ef>	1eb: R_X86_64_PC32	.noinstr.text+0x43e
01ef  1ef:	e9 00 00 00 00       	jmp    1f4 <.altinstr_replacement+0x1f4>	1f0: R_X86_64_PC32	.noinstr.text+0xad7
01f4  1f4:	e9 00 00 00 00       	jmp    1f9 <.altinstr_replacement+0x1f9>	1f5: R_X86_64_PC32	.noinstr.text+0xd15
01f9  1f9:	e9 00 00 00 00       	jmp    1fe <.altinstr_replacement+0x1fe>	1fa: R_X86_64_PC32	.init.text+0x7c16
01fe  1fe:	e9 00 00 00 00       	jmp    203 <.altinstr_replacement+0x203>	1ff: R_X86_64_PC32	.noinstr.text+0x1613
0203  203:	0f 01 cb             	stac
0206  206:	e8 00 00 00 00       	call   20b <.altinstr_replacement+0x20b>	207: R_X86_64_PLT32	clear_user_erms-0x4
020b  20b:	e8 00 00 00 00       	call   210 <.altinstr_replacement+0x210>	20c: R_X86_64_PLT32	clear_user_rep_good-0x4
0210  210:	e8 00 00 00 00       	call   215 <.altinstr_replacement+0x215>	211: R_X86_64_PLT32	clear_user_original-0x4
0215  215:	0f 01 ca             	clac
0218  218:	0f 01 cb             	stac
021b  21b:	e8 00 00 00 00       	call   220 <.altinstr_replacement+0x220>	21c: R_X86_64_PLT32	clear_user_erms-0x4
0220  220:	e8 00 00 00 00       	call   225 <.altinstr_replacement+0x225>	221: R_X86_64_PLT32	clear_user_rep_good-0x4
0225  225:	e8 00 00 00 00       	call   22a <.altinstr_replacement+0x22a>	226: R_X86_64_PLT32	clear_user_original-0x4
022a  22a:	0f 01 ca             	clac
022d  22d:	e9 00 00 00 00       	jmp    232 <.altinstr_replacement+0x232>	22e: R_X86_64_PC32	.text+0x24f56
0232  232:	0f 01 cb             	stac
0235  235:	0f ae e8             	lfence
0238  238:	0f 01 ca             	clac
023b  23b:	0f 01 ca             	clac
023e  23e:	e9 00 00 00 00       	jmp    243 <.altinstr_replacement+0x243>	23f: R_X86_64_PC32	.text+0x2948f
0243  243:	0f 01 cb             	stac
0246  246:	0f ae e8             	lfence
0249  249:	0f 01 ca             	clac
024c  24c:	0f 01 ca             	clac
024f  24f:	0f 01 cb             	stac
0252  252:	0f ae e8             	lfence
0255  255:	e9 00 00 00 00       	jmp    25a <.altinstr_replacement+0x25a>	256: R_X86_64_PC32	.text+0x2b3bc
025a  25a:	0f 01 ca             	clac
025d  25d:	0f 01 ca             	clac
0260  260:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 267 <.altinstr_replacement+0x267>	263: R_X86_64_PC32	.init.data+0x4eefc
0267  267:	e8 00 00 00 00       	call   26c <.altinstr_replacement+0x26c>	268: R_X86_64_PLT32	__alt_reloc_selftest-0x4
026c  26c:	e9 00 00 00 00       	jmp    271 <.altinstr_replacement+0x271>	26d: R_X86_64_PC32	.text+0x31469
0271  271:	e9 00 00 00 00       	jmp    276 <.altinstr_replacement+0x276>	272: R_X86_64_PC32	.text+0x3153a
0276  276:	0f ae e8             	lfence
0279  279:	0f 31                	rdtsc
027b  27b:	0f 01 f9             	rdtscp
027e  27e:	e9 00 00 00 00       	jmp    283 <.altinstr_replacement+0x283>	27f: R_X86_64_PC32	.init.text+0x1244a
0283  283:	e9 00 00 00 00       	jmp    288 <.altinstr_replacement+0x288>	284: R_X86_64_PC32	.text+0x38987
0288  288:	e9 00 00 00 00       	jmp    28d <.altinstr_replacement+0x28d>	289: R_X86_64_PC32	.text+0x38a03
028d  28d:	e9 00 00 00 00       	jmp    292 <.altinstr_replacement+0x292>	28e: R_X86_64_PC32	.text+0x38a68
0292  292:	e9 00 00 00 00       	jmp    297 <.altinstr_replacement+0x297>	293: R_X86_64_PC32	.text+0x38966
0297  297:	e9 00 00 00 00       	jmp    29c <.altinstr_replacement+0x29c>	298: R_X86_64_PC32	.text+0x38dd2
029c  29c:	e9 00 00 00 00       	jmp    2a1 <.altinstr_replacement+0x2a1>	29d: R_X86_64_PC32	.text+0x38f4a
02a1  2a1:	e9 00 00 00 00       	jmp    2a6 <.altinstr_replacement+0x2a6>	2a2: R_X86_64_PC32	.text+0x38fb8
02a6  2a6:	e9 00 00 00 00       	jmp    2ab <.altinstr_replacement+0x2ab>	2a7: R_X86_64_PC32	.text+0x38f83
02ab  2ab:	e9 00 00 00 00       	jmp    2b0 <.altinstr_replacement+0x2b0>	2ac: R_X86_64_PC32	.text+0x38dc3
02b0  2b0:	e9 00 00 00 00       	jmp    2b5 <.altinstr_replacement+0x2b5>	2b1: R_X86_64_PC32	.text+0x3905f
02b5  2b5:	e9 00 00 00 00       	jmp    2ba <.altinstr_replacement+0x2ba>	2b6: R_X86_64_PC32	.text+0x390a5
02ba  2ba:	e9 00 00 00 00       	jmp    2bf <.altinstr_replacement+0x2bf>	2bb: R_X86_64_PC32	.text+0x38dc3
02bf  2bf:	48 0f ae 37          	xsaveopt64 (%rdi)
02c3  2c3:	48 0f c7 27          	xsavec64 (%rdi)
02c7  2c7:	48 0f c7 2f          	xsaves64 (%rdi)
02cb  2cb:	e9 00 00 00 00       	jmp    2d0 <.altinstr_replacement+0x2d0>	2cc: R_X86_64_PC32	.text+0x3aaba
02d0  2d0:	e9 00 00 00 00       	jmp    2d5 <.altinstr_replacement+0x2d5>	2d1: R_X86_64_PC32	.text+0x3ad39
02d5  2d5:	e9 00 00 00 00       	jmp    2da <.altinstr_replacement+0x2da>	2d6: R_X86_64_PC32	.text+0x3ad8e
02da  2da:	48 0f c7 1f          	xrstors64 (%rdi)
02de  2de:	e9 00 00 00 00       	jmp    2e3 <.altinstr_replacement+0x2e3>	2df: R_X86_64_PC32	.text+0x3b171
02e3  2e3:	e9 00 00 00 00       	jmp    2e8 <.altinstr_replacement+0x2e8>	2e4: R_X86_64_PC32	.text+0x3b8d4
02e8  2e8:	e9 00 00 00 00       	jmp    2ed <.altinstr_replacement+0x2ed>	2e9: R_X86_64_PC32	.text+0x3b832
02ed  2ed:	e9 00 00 00 00       	jmp    2f2 <.altinstr_replacement+0x2f2>	2ee: R_X86_64_PC32	.text+0x3c021
02f2  2f2:	48 0f c7 1f          	xrstors64 (%rdi)
02f6  2f6:	e9 00 00 00 00       	jmp    2fb <.altinstr_replacement+0x2fb>	2f7: R_X86_64_PC32	.text+0x3c4a3
02fb  2fb:	48 0f c7 1f          	xrstors64 (%rdi)
02ff  2ff:	e9 00 00 00 00       	jmp    304 <.altinstr_replacement+0x304>	300: R_X86_64_PC32	.noinstr.text+0x1b84
0304  304:	e8 00 00 00 00       	call   309 <.altinstr_replacement+0x309>	305: R_X86_64_PLT32	copy_user_generic_string-0x4
0309  309:	e8 00 00 00 00       	call   30e <.altinstr_replacement+0x30e>	30a: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
030e  30e:	e9 00 00 00 00       	jmp    313 <.altinstr_replacement+0x313>	30f: R_X86_64_PC32	.text+0x3d31a
0313  313:	e9 00 00 00 00       	jmp    318 <.altinstr_replacement+0x318>	314: R_X86_64_PC32	.text+0x3d5bc
0318  318:	e9 00 00 00 00       	jmp    31d <.altinstr_replacement+0x31d>	319: R_X86_64_PC32	.text+0x3d6bd
031d  31d:	e9 00 00 00 00       	jmp    322 <.altinstr_replacement+0x322>	31e: R_X86_64_PC32	.text+0x3d7b4
0322  322:	e9 00 00 00 00       	jmp    327 <.altinstr_replacement+0x327>	323: R_X86_64_PC32	.text+0x3ddd3
0327  327:	e9 00 00 00 00       	jmp    32c <.altinstr_replacement+0x32c>	328: R_X86_64_PC32	.text+0x3dfc7
032c  32c:	e8 00 00 00 00       	call   331 <.altinstr_replacement+0x331>	32d: R_X86_64_PLT32	copy_user_generic_string-0x4
0331  331:	e8 00 00 00 00       	call   336 <.altinstr_replacement+0x336>	332: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0336  336:	48 0f ae 37          	xsaveopt64 (%rdi)
033a  33a:	48 0f c7 27          	xsavec64 (%rdi)
033e  33e:	48 0f c7 2f          	xsaves64 (%rdi)
0342  342:	e9 00 00 00 00       	jmp    347 <.altinstr_replacement+0x347>	343: R_X86_64_PC32	.text+0x3e13e
0347  347:	e8 00 00 00 00       	call   34c <.altinstr_replacement+0x34c>	348: R_X86_64_PLT32	copy_user_generic_string-0x4
034c  34c:	e8 00 00 00 00       	call   351 <.altinstr_replacement+0x351>	34d: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0351  351:	e9 00 00 00 00       	jmp    356 <.altinstr_replacement+0x356>	352: R_X86_64_PC32	.text+0x3e56a
0356  356:	0f 01 cb             	stac
0359  359:	0f 01 ca             	clac
035c  35c:	0f 01 cb             	stac
035f  35f:	0f 01 ca             	clac
0362  362:	48 0f c7 1f          	xrstors64 (%rdi)
0366  366:	0f 01 cb             	stac
0369  369:	0f 01 ca             	clac
036c  36c:	48 0f c7 1f          	xrstors64 (%rdi)
0370  370:	e9 00 00 00 00       	jmp    375 <.altinstr_replacement+0x375>	371: R_X86_64_PC32	.text+0x3ea17
0375  375:	e8 00 00 00 00       	call   37a <.altinstr_replacement+0x37a>	376: R_X86_64_PLT32	copy_user_generic_string-0x4
037a  37a:	e8 00 00 00 00       	call   37f <.altinstr_replacement+0x37f>	37b: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
037f  37f:	e8 00 00 00 00       	call   384 <.altinstr_replacement+0x384>	380: R_X86_64_PLT32	copy_user_generic_string-0x4
0384  384:	e8 00 00 00 00       	call   389 <.altinstr_replacement+0x389>	385: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0389  389:	e9 00 00 00 00       	jmp    38e <.altinstr_replacement+0x38e>	38a: R_X86_64_PC32	.text+0x3ed12
038e  38e:	e8 00 00 00 00       	call   393 <.altinstr_replacement+0x393>	38f: R_X86_64_PLT32	copy_user_generic_string-0x4
0393  393:	e8 00 00 00 00       	call   398 <.altinstr_replacement+0x398>	394: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0398  398:	e9 00 00 00 00       	jmp    39d <.altinstr_replacement+0x39d>	399: R_X86_64_PC32	.text+0x3ee15
039d  39d:	e9 00 00 00 00       	jmp    3a2 <.altinstr_replacement+0x3a2>	39e: R_X86_64_PC32	.text+0x3ef21
03a2  3a2:	e9 00 00 00 00       	jmp    3a7 <.altinstr_replacement+0x3a7>	3a3: R_X86_64_PC32	.text+0x3f252
03a7  3a7:	0f 01 cb             	stac
03aa  3aa:	e8 00 00 00 00       	call   3af <.altinstr_replacement+0x3af>	3ab: R_X86_64_PLT32	clear_user_erms-0x4
03af  3af:	e8 00 00 00 00       	call   3b4 <.altinstr_replacement+0x3b4>	3b0: R_X86_64_PLT32	clear_user_rep_good-0x4
03b4  3b4:	e8 00 00 00 00       	call   3b9 <.altinstr_replacement+0x3b9>	3b5: R_X86_64_PLT32	clear_user_original-0x4
03b9  3b9:	0f 01 ca             	clac
03bc  3bc:	e9 00 00 00 00       	jmp    3c1 <.altinstr_replacement+0x3c1>	3bd: R_X86_64_PC32	.text+0x3f4c0
03c1  3c1:	0f 01 cb             	stac
03c4  3c4:	0f 01 ca             	clac
03c7  3c7:	0f 01 cb             	stac
03ca  3ca:	e8 00 00 00 00       	call   3cf <.altinstr_replacement+0x3cf>	3cb: R_X86_64_PLT32	clear_user_erms-0x4
03cf  3cf:	e8 00 00 00 00       	call   3d4 <.altinstr_replacement+0x3d4>	3d0: R_X86_64_PLT32	clear_user_rep_good-0x4
03d4  3d4:	e8 00 00 00 00       	call   3d9 <.altinstr_replacement+0x3d9>	3d5: R_X86_64_PLT32	clear_user_original-0x4
03d9  3d9:	0f 01 ca             	clac
03dc  3dc:	0f 01 cb             	stac
03df  3df:	0f 01 ca             	clac
03e2  3e2:	e8 00 00 00 00       	call   3e7 <.altinstr_replacement+0x3e7>	3e3: R_X86_64_PLT32	copy_user_generic_string-0x4
03e7  3e7:	e8 00 00 00 00       	call   3ec <.altinstr_replacement+0x3ec>	3e8: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
03ec  3ec:	e9 00 00 00 00       	jmp    3f1 <.altinstr_replacement+0x3f1>	3ed: R_X86_64_PC32	.text+0x3f702
03f1  3f1:	e9 00 00 00 00       	jmp    3f6 <.altinstr_replacement+0x3f6>	3f2: R_X86_64_PC32	.text+0x3f98e
03f6  3f6:	e9 00 00 00 00       	jmp    3fb <.altinstr_replacement+0x3fb>	3f7: R_X86_64_PC32	.text+0x3fb1c
03fb  3fb:	e9 00 00 00 00       	jmp    400 <.altinstr_replacement+0x400>	3fc: R_X86_64_PC32	.init.text+0x13024
0400  400:	e9 00 00 00 00       	jmp    405 <.altinstr_replacement+0x405>	401: R_X86_64_PC32	.init.text+0x132f7
0405  405:	e9 00 00 00 00       	jmp    40a <.altinstr_replacement+0x40a>	406: R_X86_64_PC32	.init.text+0x13340
040a  40a:	e9 00 00 00 00       	jmp    40f <.altinstr_replacement+0x40f>	40b: R_X86_64_PC32	.text+0x3ffe7
040f  40f:	e9 00 00 00 00       	jmp    414 <.altinstr_replacement+0x414>	410: R_X86_64_PC32	.text+0x4011a
0414  414:	e9 00 00 00 00       	jmp    419 <.altinstr_replacement+0x419>	415: R_X86_64_PC32	.text+0x40a12
0419  419:	e9 00 00 00 00       	jmp    41e <.altinstr_replacement+0x41e>	41a: R_X86_64_PC32	.text+0x41354
041e  41e:	e9 00 00 00 00       	jmp    423 <.altinstr_replacement+0x423>	41f: R_X86_64_PC32	.text+0x41781
0423  423:	e9 00 00 00 00       	jmp    428 <.altinstr_replacement+0x428>	424: R_X86_64_PC32	.text+0x4179a
0428  428:	e9 00 00 00 00       	jmp    42d <.altinstr_replacement+0x42d>	429: R_X86_64_PC32	.text+0x4181a
042d  42d:	e9 00 00 00 00       	jmp    432 <.altinstr_replacement+0x432>	42e: R_X86_64_PC32	.text+0x418d7
0432  432:	e9 00 00 00 00       	jmp    437 <.altinstr_replacement+0x437>	433: R_X86_64_PC32	.init.text+0x1396b
0437  437:	e9 00 00 00 00       	jmp    43c <.altinstr_replacement+0x43c>	438: R_X86_64_PC32	.init.text+0x13963
043c  43c:	e9 00 00 00 00       	jmp    441 <.altinstr_replacement+0x441>	43d: R_X86_64_PC32	.init.text+0x13bad
0441  441:	e9 00 00 00 00       	jmp    446 <.altinstr_replacement+0x446>	442: R_X86_64_PC32	.init.text+0x13e28
0446  446:	e9 00 00 00 00       	jmp    44b <.altinstr_replacement+0x44b>	447: R_X86_64_PC32	.init.text+0x143d3
044b  44b:	e9 00 00 00 00       	jmp    450 <.altinstr_replacement+0x450>	44c: R_X86_64_PC32	.init.text+0x14ad6
0450  450:	e9 00 00 00 00       	jmp    455 <.altinstr_replacement+0x455>	451: R_X86_64_PC32	.init.text+0x14ac4
0455  455:	e9 00 00 00 00       	jmp    45a <.altinstr_replacement+0x45a>	456: R_X86_64_PC32	.init.text+0x14ace
045a  45a:	e9 00 00 00 00       	jmp    45f <.altinstr_replacement+0x45f>	45b: R_X86_64_PC32	.text+0x41a3c
045f  45f:	e9 00 00 00 00       	jmp    464 <.altinstr_replacement+0x464>	460: R_X86_64_PC32	.text+0x41a7f
0464  464:	e9 00 00 00 00       	jmp    469 <.altinstr_replacement+0x469>	465: R_X86_64_PC32	.text+0x41a74
0469  469:	e9 00 00 00 00       	jmp    46e <.altinstr_replacement+0x46e>	46a: R_X86_64_PC32	.text+0x430b8
046e  46e:	e9 00 00 00 00       	jmp    473 <.altinstr_replacement+0x473>	46f: R_X86_64_PC32	.text+0x4796e
0473  473:	e8 00 00 00 00       	call   478 <.altinstr_replacement+0x478>	474: R_X86_64_PLT32	copy_user_generic_string-0x4
0478  478:	e8 00 00 00 00       	call   47d <.altinstr_replacement+0x47d>	479: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
047d  47d:	e9 00 00 00 00       	jmp    482 <.altinstr_replacement+0x482>	47e: R_X86_64_PC32	.text+0x4b991
0482  482:	e9 00 00 00 00       	jmp    487 <.altinstr_replacement+0x487>	483: R_X86_64_PC32	.text+0x4b97c
0487  487:	e9 00 00 00 00       	jmp    48c <.altinstr_replacement+0x48c>	488: R_X86_64_PC32	.text+0x4b986
048c  48c:	e9 00 00 00 00       	jmp    491 <.altinstr_replacement+0x491>	48d: R_X86_64_PC32	.text+0x4b98d
0491  491:	e9 00 00 00 00       	jmp    496 <.altinstr_replacement+0x496>	492: R_X86_64_PC32	.text+0x4b9ae
0496  496:	e9 00 00 00 00       	jmp    49b <.altinstr_replacement+0x49b>	497: R_X86_64_PC32	.text+0x4b9ce
049b  49b:	e9 00 00 00 00       	jmp    4a0 <.altinstr_replacement+0x4a0>	49c: R_X86_64_PC32	.text+0x4cc39
04a0  4a0:	e9 00 00 00 00       	jmp    4a5 <.altinstr_replacement+0x4a5>	4a1: R_X86_64_PC32	.text+0x4ccd0
04a5  4a5:	e9 00 00 00 00       	jmp    4aa <.altinstr_replacement+0x4aa>	4a6: R_X86_64_PC32	.text+0x4cd0f
04aa  4aa:	e9 00 00 00 00       	jmp    4af <.altinstr_replacement+0x4af>	4ab: R_X86_64_PC32	.text+0x4e697
04af  4af:	e9 00 00 00 00       	jmp    4b4 <.altinstr_replacement+0x4b4>	4b0: R_X86_64_PC32	.text+0x4e78d
04b4  4b4:	e9 00 00 00 00       	jmp    4b9 <.altinstr_replacement+0x4b9>	4b5: R_X86_64_PC32	.init.text+0x16912
04b9  4b9:	e9 00 00 00 00       	jmp    4be <.altinstr_replacement+0x4be>	4ba: R_X86_64_PC32	.text+0x51109
04be  4be:	e9 00 00 00 00       	jmp    4c3 <.altinstr_replacement+0x4c3>	4bf: R_X86_64_PC32	.text+0x51110
04c3  4c3:	e9 00 00 00 00       	jmp    4c8 <.altinstr_replacement+0x4c8>	4c4: R_X86_64_PC32	.text+0x51100
04c8  4c8:	0f 30                	wrmsr
04ca  4ca:	e9 00 00 00 00       	jmp    4cf <.altinstr_replacement+0x4cf>	4cb: R_X86_64_PC32	.init.text+0x180a4
04cf  4cf:	e9 00 00 00 00       	jmp    4d4 <.altinstr_replacement+0x4d4>	4d0: R_X86_64_PC32	.init.text+0x180ab
04d4  4d4:	e9 00 00 00 00       	jmp    4d9 <.altinstr_replacement+0x4d9>	4d5: R_X86_64_PC32	.text+0x51f0a
04d9  4d9:	e9 00 00 00 00       	jmp    4de <.altinstr_replacement+0x4de>	4da: R_X86_64_PC32	.init.text+0x19270
04de  4de:	e9 00 00 00 00       	jmp    4e3 <.altinstr_replacement+0x4e3>	4df: R_X86_64_PC32	.init.text+0x198d7
04e3  4e3:	e9 00 00 00 00       	jmp    4e8 <.altinstr_replacement+0x4e8>	4e4: R_X86_64_PC32	.text+0x52f39
04e8  4e8:	e9 00 00 00 00       	jmp    4ed <.altinstr_replacement+0x4ed>	4e9: R_X86_64_PC32	.text+0x53036
04ed  4ed:	e9 00 00 00 00       	jmp    4f2 <.altinstr_replacement+0x4f2>	4ee: R_X86_64_PC32	.text+0x53105
04f2  4f2:	e9 00 00 00 00       	jmp    4f7 <.altinstr_replacement+0x4f7>	4f3: R_X86_64_PC32	.text+0x5459f
04f7  4f7:	e9 00 00 00 00       	jmp    4fc <.altinstr_replacement+0x4fc>	4f8: R_X86_64_PC32	.text+0x545eb
04fc  4fc:	e9 00 00 00 00       	jmp    501 <.altinstr_replacement+0x501>	4fd: R_X86_64_PC32	.text+0x545f4
0501  501:	e9 00 00 00 00       	jmp    506 <.altinstr_replacement+0x506>	502: R_X86_64_PC32	.text+0x5859f
0506  506:	e9 00 00 00 00       	jmp    50b <.altinstr_replacement+0x50b>	507: R_X86_64_PC32	.text+0x586bc
050b  50b:	e9 00 00 00 00       	jmp    510 <.altinstr_replacement+0x510>	50c: R_X86_64_PC32	.text+0x586a9
0510  510:	e9 00 00 00 00       	jmp    515 <.altinstr_replacement+0x515>	511: R_X86_64_PC32	.text+0x587a5
0515  515:	e9 00 00 00 00       	jmp    51a <.altinstr_replacement+0x51a>	516: R_X86_64_PC32	.text+0x58ff3
051a  51a:	e9 00 00 00 00       	jmp    51f <.altinstr_replacement+0x51f>	51b: R_X86_64_PC32	.noinstr.text+0x219d
051f  51f:	e9 00 00 00 00       	jmp    524 <.altinstr_replacement+0x524>	520: R_X86_64_PC32	.noinstr.text+0x214a
0524  524:	e9 00 00 00 00       	jmp    529 <.altinstr_replacement+0x529>	525: R_X86_64_PC32	.text+0x5968d
0529  529:	e9 00 00 00 00       	jmp    52e <.altinstr_replacement+0x52e>	52a: R_X86_64_PC32	.text+0x59694
052e  52e:	e9 00 00 00 00       	jmp    533 <.altinstr_replacement+0x533>	52f: R_X86_64_PC32	.text+0x5969b
0533  533:	e9 00 00 00 00       	jmp    538 <.altinstr_replacement+0x538>	534: R_X86_64_PC32	.noinstr.text+0x28e5
0538  538:	e9 00 00 00 00       	jmp    53d <.altinstr_replacement+0x53d>	539: R_X86_64_PC32	.noinstr.text+0x292b
053d  53d:	e9 00 00 00 00       	jmp    542 <.altinstr_replacement+0x542>	53e: R_X86_64_PC32	.noinstr.text+0x2938
0542  542:	e9 00 00 00 00       	jmp    547 <.altinstr_replacement+0x547>	543: R_X86_64_PC32	.noinstr.text+0x2bb0
0547  547:	e9 00 00 00 00       	jmp    54c <.altinstr_replacement+0x54c>	548: R_X86_64_PC32	.noinstr.text+0x2c3a
054c  54c:	0f 01 c1             	vmcall
054f  54f:	0f 01 d9             	vmmcall
0552  552:	e9 00 00 00 00       	jmp    557 <.altinstr_replacement+0x557>	553: R_X86_64_PC32	.cpuidle.text+0x114
0557  557:	e9 00 00 00 00       	jmp    55c <.altinstr_replacement+0x55c>	558: R_X86_64_PC32	.cpuidle.text+0xcd
055c  55c:	e9 00 00 00 00       	jmp    561 <.altinstr_replacement+0x561>	55d: R_X86_64_PC32	.init.text+0x1ffd1
0561  561:	87 34 25 00 d3 5f ff 	xchg   %esi,0xffffffffff5fd300
0568  568:	87 04 25 10 d3 5f ff 	xchg   %eax,0xffffffffff5fd310
056f  56f:	87 04 25 00 d3 5f ff 	xchg   %eax,0xffffffffff5fd300
0576  576:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
057d  57d:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
0584  584:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
058b  58b:	87 b7 00 d0 5f ff    	xchg   %esi,-0xa03000(%rdi)
0591  591:	0f ae e8             	lfence
0594  594:	0f 31                	rdtsc
0596  596:	0f 01 f9             	rdtscp
0599  599:	e8 00 00 00 00       	call   59e <.altinstr_replacement+0x59e>	59a: R_X86_64_PLT32	clear_page_rep-0x4
059e  59e:	e8 00 00 00 00       	call   5a3 <.altinstr_replacement+0x5a3>	59f: R_X86_64_PLT32	clear_page_erms-0x4
05a3  5a3:	e8 00 00 00 00       	call   5a8 <.altinstr_replacement+0x5a8>	5a4: R_X86_64_PLT32	clear_page_rep-0x4
05a8  5a8:	e8 00 00 00 00       	call   5ad <.altinstr_replacement+0x5ad>	5a9: R_X86_64_PLT32	clear_page_erms-0x4
05ad  5ad:	e9 00 00 00 00       	jmp    5b2 <.altinstr_replacement+0x5b2>	5ae: R_X86_64_PC32	.init.text+0x28dd9
05b2  5b2:	0f ae e8             	lfence
05b5  5b5:	0f 31                	rdtsc
05b7  5b7:	0f 01 f9             	rdtscp
05ba  5ba:	0f ae e8             	lfence
05bd  5bd:	0f 31                	rdtsc
05bf  5bf:	0f 01 f9             	rdtscp
05c2  5c2:	e8 00 00 00 00       	call   5c7 <.altinstr_replacement+0x5c7>	5c3: R_X86_64_PLT32	clear_page_rep-0x4
05c7  5c7:	e8 00 00 00 00       	call   5cc <.altinstr_replacement+0x5cc>	5c8: R_X86_64_PLT32	clear_page_erms-0x4
05cc  5cc:	e9 00 00 00 00       	jmp    5d1 <.altinstr_replacement+0x5d1>	5cd: R_X86_64_PC32	.text+0x8dc86
05d1  5d1:	0f 0d 88 f8 00 00 00 	prefetchw 0xf8(%rax)
05d8  5d8:	e9 00 00 00 00       	jmp    5dd <.altinstr_replacement+0x5dd>	5d9: R_X86_64_PC32	.text+0x908f8
05dd  5dd:	e9 00 00 00 00       	jmp    5e2 <.altinstr_replacement+0x5e2>	5de: R_X86_64_PC32	.text+0x93e55
05e2  5e2:	e9 00 00 00 00       	jmp    5e7 <.altinstr_replacement+0x5e7>	5e3: R_X86_64_PC32	.text+0x93f09
05e7  5e7:	e9 00 00 00 00       	jmp    5ec <.altinstr_replacement+0x5ec>	5e8: R_X86_64_PC32	.text+0x93fb4
05ec  5ec:	e9 00 00 00 00       	jmp    5f1 <.altinstr_replacement+0x5f1>	5ed: R_X86_64_PC32	.text+0x94439
05f1  5f1:	e9 00 00 00 00       	jmp    5f6 <.altinstr_replacement+0x5f6>	5f2: R_X86_64_PC32	.text+0x945ad
05f6  5f6:	0f 30                	wrmsr
05f8  5f8:	e9 00 00 00 00       	jmp    5fd <.altinstr_replacement+0x5fd>	5f9: R_X86_64_PC32	.text+0x948f4
05fd  5fd:	0f 30                	wrmsr
05ff  5ff:	e9 00 00 00 00       	jmp    604 <.altinstr_replacement+0x604>	600: R_X86_64_PC32	.text+0x954c9
0604  604:	e9 00 00 00 00       	jmp    609 <.altinstr_replacement+0x609>	605: R_X86_64_PC32	.text+0x95a56
0609  609:	e9 00 00 00 00       	jmp    60e <.altinstr_replacement+0x60e>	60a: R_X86_64_PC32	.text+0x95b84
060e  60e:	e9 00 00 00 00       	jmp    613 <.altinstr_replacement+0x613>	60f: R_X86_64_PC32	.text+0x95c9c
0613  613:	e9 00 00 00 00       	jmp    618 <.altinstr_replacement+0x618>	614: R_X86_64_PC32	.text+0x96248
0618  618:	66 0f ae 38          	clflushopt (%rax)
061c  61c:	66 0f ae 38          	clflushopt (%rax)
0620  620:	e9 00 00 00 00       	jmp    625 <.altinstr_replacement+0x625>	621: R_X86_64_PC32	.text+0x990e8
0625  625:	66 0f ae 38          	clflushopt (%rax)
0629  629:	e9 00 00 00 00       	jmp    62e <.altinstr_replacement+0x62e>	62a: R_X86_64_PC32	.init.text+0x2dddd
062e  62e:	e9 00 00 00 00       	jmp    633 <.altinstr_replacement+0x633>	62f: R_X86_64_PC32	.text+0x118ebf
0633  633:	0f 01 cb             	stac
0636  636:	0f ae e8             	lfence
0639  639:	0f 01 ca             	clac
063c  63c:	0f 01 ca             	clac
063f  63f:	0f 01 cb             	stac
0642  642:	0f ae e8             	lfence
0645  645:	0f 01 ca             	clac
0648  648:	0f 01 ca             	clac
064b  64b:	0f 01 cb             	stac
064e  64e:	e8 00 00 00 00       	call   653 <.altinstr_replacement+0x653>	64f: R_X86_64_PLT32	clear_user_erms-0x4
0653  653:	e8 00 00 00 00       	call   658 <.altinstr_replacement+0x658>	654: R_X86_64_PLT32	clear_user_rep_good-0x4
0658  658:	e8 00 00 00 00       	call   65d <.altinstr_replacement+0x65d>	659: R_X86_64_PLT32	clear_user_original-0x4
065d  65d:	0f 01 ca             	clac
0660  660:	e9 00 00 00 00       	jmp    665 <.altinstr_replacement+0x665>	661: R_X86_64_PC32	.text+0x1abe42
0665  665:	e9 00 00 00 00       	jmp    66a <.altinstr_replacement+0x66a>	666: R_X86_64_PC32	.text+0x1abe4c
066a  66a:	e9 00 00 00 00       	jmp    66f <.altinstr_replacement+0x66f>	66b: R_X86_64_PC32	.text+0x1e0376
066f  66f:	e9 00 00 00 00       	jmp    674 <.altinstr_replacement+0x674>	670: R_X86_64_PC32	.text+0x1e0380
0674  674:	e9 00 00 00 00       	jmp    679 <.altinstr_replacement+0x679>	675: R_X86_64_PC32	.noinstr.text+0x3d6e
0679  679:	e9 00 00 00 00       	jmp    67e <.altinstr_replacement+0x67e>	67a: R_X86_64_PC32	.noinstr.text+0x3e5b
067e  67e:	e9 00 00 00 00       	jmp    683 <.altinstr_replacement+0x683>	67f: R_X86_64_PC32	.noinstr.text+0x3f36
0683  683:	e9 00 00 00 00       	jmp    688 <.altinstr_replacement+0x688>	684: R_X86_64_PC32	.noinstr.text+0x408e
0688  688:	0f 01 cb             	stac
068b  68b:	0f ae e8             	lfence
068e  68e:	0f 01 ca             	clac
0691  691:	0f 01 cb             	stac
0694  694:	0f ae e8             	lfence
0697  697:	0f 01 ca             	clac
069a  69a:	0f 01 ca             	clac
069d  69d:	0f 01 ca             	clac
06a0  6a0:	e8 00 00 00 00       	call   6a5 <.altinstr_replacement+0x6a5>	6a1: R_X86_64_PLT32	clear_page_rep-0x4
06a5  6a5:	e8 00 00 00 00       	call   6aa <.altinstr_replacement+0x6aa>	6a6: R_X86_64_PLT32	clear_page_erms-0x4
06aa  6aa:	0f 01 cb             	stac
06ad  6ad:	0f ae e8             	lfence
06b0  6b0:	0f 01 ca             	clac
06b3  6b3:	0f 01 ca             	clac
06b6  6b6:	0f 01 cb             	stac
06b9  6b9:	0f ae e8             	lfence
06bc  6bc:	0f 01 ca             	clac
06bf  6bf:	0f 01 ca             	clac
06c2  6c2:	e8 00 00 00 00       	call   6c7 <.altinstr_replacement+0x6c7>	6c3: R_X86_64_PLT32	copy_user_generic_string-0x4
06c7  6c7:	e8 00 00 00 00       	call   6cc <.altinstr_replacement+0x6cc>	6c8: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
06cc  6cc:	e8 00 00 00 00       	call   6d1 <.altinstr_replacement+0x6d1>	6cd: R_X86_64_PLT32	copy_user_generic_string-0x4
06d1  6d1:	e8 00 00 00 00       	call   6d6 <.altinstr_replacement+0x6d6>	6d2: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
06d6  6d6:	0f ae e8             	lfence
06d9  6d9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06de  6de:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06e3  6e3:	0f 01 cb             	stac
06e6  6e6:	0f ae e8             	lfence
06e9  6e9:	0f 01 ca             	clac
06ec  6ec:	0f 01 ca             	clac
06ef  6ef:	e8 00 00 00 00       	call   6f4 <.altinstr_replacement+0x6f4>	6f0: R_X86_64_PLT32	copy_user_generic_string-0x4
06f4  6f4:	e8 00 00 00 00       	call   6f9 <.altinstr_replacement+0x6f9>	6f5: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
06f9  6f9:	e8 00 00 00 00       	call   6fe <.altinstr_replacement+0x6fe>	6fa: R_X86_64_PLT32	copy_user_generic_string-0x4
06fe  6fe:	e8 00 00 00 00       	call   703 <.altinstr_replacement+0x703>	6ff: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0703  703:	0f 0d 48 f8          	prefetchw -0x8(%rax)
0707  707:	e8 00 00 00 00       	call   70c <.altinstr_replacement+0x70c>	708: R_X86_64_PLT32	clear_page_rep-0x4
070c  70c:	e8 00 00 00 00       	call   711 <.altinstr_replacement+0x711>	70d: R_X86_64_PLT32	clear_page_erms-0x4
0711  711:	0f 01 cb             	stac
0714  714:	0f ae e8             	lfence
0717  717:	0f 01 ca             	clac
071a  71a:	0f 01 cb             	stac
071d  71d:	0f ae e8             	lfence
0720  720:	0f 01 ca             	clac
0723  723:	e8 00 00 00 00       	call   728 <.altinstr_replacement+0x728>	724: R_X86_64_PLT32	copy_user_generic_string-0x4
0728  728:	e8 00 00 00 00       	call   72d <.altinstr_replacement+0x72d>	729: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
072d  72d:	e8 00 00 00 00       	call   732 <.altinstr_replacement+0x732>	72e: R_X86_64_PLT32	copy_user_generic_string-0x4
0732  732:	e8 00 00 00 00       	call   737 <.altinstr_replacement+0x737>	733: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0737  737:	e8 00 00 00 00       	call   73c <.altinstr_replacement+0x73c>	738: R_X86_64_PLT32	clear_page_rep-0x4
073c  73c:	e8 00 00 00 00       	call   741 <.altinstr_replacement+0x741>	73d: R_X86_64_PLT32	clear_page_erms-0x4
0741  741:	e8 00 00 00 00       	call   746 <.altinstr_replacement+0x746>	742: R_X86_64_PLT32	clear_page_rep-0x4
0746  746:	e8 00 00 00 00       	call   74b <.altinstr_replacement+0x74b>	747: R_X86_64_PLT32	clear_page_erms-0x4
074b  74b:	e8 00 00 00 00       	call   750 <.altinstr_replacement+0x750>	74c: R_X86_64_PLT32	clear_page_rep-0x4
0750  750:	e8 00 00 00 00       	call   755 <.altinstr_replacement+0x755>	751: R_X86_64_PLT32	clear_page_erms-0x4
0755  755:	e8 00 00 00 00       	call   75a <.altinstr_replacement+0x75a>	756: R_X86_64_PLT32	clear_page_rep-0x4
075a  75a:	e8 00 00 00 00       	call   75f <.altinstr_replacement+0x75f>	75b: R_X86_64_PLT32	clear_page_erms-0x4
075f  75f:	e8 00 00 00 00       	call   764 <.altinstr_replacement+0x764>	760: R_X86_64_PLT32	clear_page_rep-0x4
0764  764:	e8 00 00 00 00       	call   769 <.altinstr_replacement+0x769>	765: R_X86_64_PLT32	clear_page_erms-0x4
0769  769:	e8 00 00 00 00       	call   76e <.altinstr_replacement+0x76e>	76a: R_X86_64_PLT32	clear_page_rep-0x4
076e  76e:	e8 00 00 00 00       	call   773 <.altinstr_replacement+0x773>	76f: R_X86_64_PLT32	clear_page_erms-0x4
0773  773:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0778  778:	f3 48 0f b8 c7       	popcnt %rdi,%rax
077d  77d:	e8 00 00 00 00       	call   782 <.altinstr_replacement+0x782>	77e: R_X86_64_PLT32	clear_page_rep-0x4
0782  782:	e8 00 00 00 00       	call   787 <.altinstr_replacement+0x787>	783: R_X86_64_PLT32	clear_page_erms-0x4
0787  787:	e8 00 00 00 00       	call   78c <.altinstr_replacement+0x78c>	788: R_X86_64_PLT32	clear_page_rep-0x4
078c  78c:	e8 00 00 00 00       	call   791 <.altinstr_replacement+0x791>	78d: R_X86_64_PLT32	clear_page_erms-0x4
0791  791:	0f 0d 0a             	prefetchw (%rdx)
0794  794:	41 0f 0d 0e          	prefetchw (%r14)
0798  798:	e8 00 00 00 00       	call   79d <.altinstr_replacement+0x79d>	799: R_X86_64_PLT32	clear_page_rep-0x4
079d  79d:	e8 00 00 00 00       	call   7a2 <.altinstr_replacement+0x7a2>	79e: R_X86_64_PLT32	clear_page_erms-0x4
07a2  7a2:	e8 00 00 00 00       	call   7a7 <.altinstr_replacement+0x7a7>	7a3: R_X86_64_PLT32	clear_page_rep-0x4
07a7  7a7:	e8 00 00 00 00       	call   7ac <.altinstr_replacement+0x7ac>	7a8: R_X86_64_PLT32	clear_page_erms-0x4
07ac  7ac:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07b1  7b1:	48 0f c7 0f          	cmpxchg16b (%rdi)
07b5  7b5:	0f 94 c0             	sete   %al
07b8  7b8:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
07bc  7bc:	48 0f c7 0f          	cmpxchg16b (%rdi)
07c0  7c0:	0f 94 c0             	sete   %al
07c3  7c3:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
07c7  7c7:	48 0f c7 0f          	cmpxchg16b (%rdi)
07cb  7cb:	0f 94 c0             	sete   %al
07ce  7ce:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
07d2  7d2:	48 0f c7 0f          	cmpxchg16b (%rdi)
07d6  7d6:	0f 94 c0             	sete   %al
07d9  7d9:	48 0f c7 0f          	cmpxchg16b (%rdi)
07dd  7dd:	0f 94 c0             	sete   %al
07e0  7e0:	48 0f c7 0f          	cmpxchg16b (%rdi)
07e4  7e4:	0f 94 c0             	sete   %al
07e7  7e7:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
07eb  7eb:	48 0f c7 0f          	cmpxchg16b (%rdi)
07ef  7ef:	0f 94 c0             	sete   %al
07f2  7f2:	48 0f c7 0f          	cmpxchg16b (%rdi)
07f6  7f6:	0f 94 c0             	sete   %al
07f9  7f9:	9c                   	pushf
07fa  7fa:	41 5d                	pop    %r13
07fc  7fc:	0f 01 ca             	clac
07ff  7ff:	41 55                	push   %r13
0801  801:	9d                   	popf
0802  802:	e8 00 00 00 00       	call   807 <.altinstr_replacement+0x807>	803: R_X86_64_PLT32	clear_page_rep-0x4
0807  807:	e8 00 00 00 00       	call   80c <.altinstr_replacement+0x80c>	808: R_X86_64_PLT32	clear_page_erms-0x4
080c  80c:	e8 00 00 00 00       	call   811 <.altinstr_replacement+0x811>	80d: R_X86_64_PLT32	clear_page_rep-0x4
0811  811:	e8 00 00 00 00       	call   816 <.altinstr_replacement+0x816>	812: R_X86_64_PLT32	clear_page_erms-0x4
0816  816:	e8 00 00 00 00       	call   81b <.altinstr_replacement+0x81b>	817: R_X86_64_PLT32	clear_page_rep-0x4
081b  81b:	e8 00 00 00 00       	call   820 <.altinstr_replacement+0x820>	81c: R_X86_64_PLT32	clear_page_erms-0x4
0820  820:	0f 01 cb             	stac
0823  823:	0f ae e8             	lfence
0826  826:	0f 01 ca             	clac
0829  829:	0f 01 ca             	clac
082c  82c:	0f 01 cb             	stac
082f  82f:	0f ae e8             	lfence
0832  832:	0f 01 ca             	clac
0835  835:	0f 01 ca             	clac
0838  838:	0f 01 cb             	stac
083b  83b:	0f ae e8             	lfence
083e  83e:	0f 01 ca             	clac
0841  841:	0f 01 ca             	clac
0844  844:	0f 01 cb             	stac
0847  847:	0f ae e8             	lfence
084a  84a:	0f 01 ca             	clac
084d  84d:	0f 01 ca             	clac
0850  850:	0f 01 cb             	stac
0853  853:	0f ae e8             	lfence
0856  856:	0f 01 ca             	clac
0859  859:	0f 01 ca             	clac
085c  85c:	0f 01 cb             	stac
085f  85f:	0f ae e8             	lfence
0862  862:	0f 01 ca             	clac
0865  865:	0f 01 ca             	clac
0868  868:	0f 01 cb             	stac
086b  86b:	0f ae e8             	lfence
086e  86e:	0f 01 ca             	clac
0871  871:	0f 01 ca             	clac
0874  874:	0f 01 cb             	stac
0877  877:	0f ae e8             	lfence
087a  87a:	0f 01 ca             	clac
087d  87d:	0f 01 ca             	clac
0880  880:	0f 01 cb             	stac
0883  883:	0f ae e8             	lfence
0886  886:	0f 01 ca             	clac
0889  889:	0f 01 ca             	clac
088c  88c:	0f 01 cb             	stac
088f  88f:	0f ae e8             	lfence
0892  892:	0f 01 ca             	clac
0895  895:	0f 01 ca             	clac
0898  898:	e8 00 00 00 00       	call   89d <.altinstr_replacement+0x89d>	899: R_X86_64_PLT32	copy_user_generic_string-0x4
089d  89d:	e8 00 00 00 00       	call   8a2 <.altinstr_replacement+0x8a2>	89e: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
08a2  8a2:	e8 00 00 00 00       	call   8a7 <.altinstr_replacement+0x8a7>	8a3: R_X86_64_PLT32	copy_user_generic_string-0x4
08a7  8a7:	e8 00 00 00 00       	call   8ac <.altinstr_replacement+0x8ac>	8a8: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
08ac  8ac:	e8 00 00 00 00       	call   8b1 <.altinstr_replacement+0x8b1>	8ad: R_X86_64_PLT32	copy_user_generic_string-0x4
08b1  8b1:	e8 00 00 00 00       	call   8b6 <.altinstr_replacement+0x8b6>	8b2: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
08b6  8b6:	0f 01 cb             	stac
08b9  8b9:	0f ae e8             	lfence
08bc  8bc:	0f 01 ca             	clac
08bf  8bf:	0f 01 ca             	clac
08c2  8c2:	0f 01 cb             	stac
08c5  8c5:	0f ae e8             	lfence
08c8  8c8:	0f 01 ca             	clac
08cb  8cb:	0f 01 ca             	clac
08ce  8ce:	0f 0d 8f 68 09 00 00 	prefetchw 0x968(%rdi)
08d5  8d5:	f3 0f b8 c7          	popcnt %edi,%eax
08d9  8d9:	41 0f 0d 0f          	prefetchw (%r15)
08dd  8dd:	0f 01 cb             	stac
08e0  8e0:	e8 00 00 00 00       	call   8e5 <.altinstr_replacement+0x8e5>	8e1: R_X86_64_PLT32	clear_user_erms-0x4
08e5  8e5:	e8 00 00 00 00       	call   8ea <.altinstr_replacement+0x8ea>	8e6: R_X86_64_PLT32	clear_user_rep_good-0x4
08ea  8ea:	e8 00 00 00 00       	call   8ef <.altinstr_replacement+0x8ef>	8eb: R_X86_64_PLT32	clear_user_original-0x4
08ef  8ef:	0f 01 ca             	clac
08f2  8f2:	0f 01 cb             	stac
08f5  8f5:	e8 00 00 00 00       	call   8fa <.altinstr_replacement+0x8fa>	8f6: R_X86_64_PLT32	clear_user_erms-0x4
08fa  8fa:	e8 00 00 00 00       	call   8ff <.altinstr_replacement+0x8ff>	8fb: R_X86_64_PLT32	clear_user_rep_good-0x4
08ff  8ff:	e8 00 00 00 00       	call   904 <.altinstr_replacement+0x904>	900: R_X86_64_PLT32	clear_user_original-0x4
0904  904:	0f 01 ca             	clac
0907  907:	0f 01 cb             	stac
090a  90a:	e8 00 00 00 00       	call   90f <.altinstr_replacement+0x90f>	90b: R_X86_64_PLT32	clear_user_erms-0x4
090f  90f:	e8 00 00 00 00       	call   914 <.altinstr_replacement+0x914>	910: R_X86_64_PLT32	clear_user_rep_good-0x4
0914  914:	e8 00 00 00 00       	call   919 <.altinstr_replacement+0x919>	915: R_X86_64_PLT32	clear_user_original-0x4
0919  919:	0f 01 ca             	clac
091c  91c:	0f 01 cb             	stac
091f  91f:	e8 00 00 00 00       	call   924 <.altinstr_replacement+0x924>	920: R_X86_64_PLT32	clear_user_erms-0x4
0924  924:	e8 00 00 00 00       	call   929 <.altinstr_replacement+0x929>	925: R_X86_64_PLT32	clear_user_rep_good-0x4
0929  929:	e8 00 00 00 00       	call   92e <.altinstr_replacement+0x92e>	92a: R_X86_64_PLT32	clear_user_original-0x4
092e  92e:	0f 01 ca             	clac
0931  931:	0f 01 cb             	stac
0934  934:	e8 00 00 00 00       	call   939 <.altinstr_replacement+0x939>	935: R_X86_64_PLT32	clear_user_erms-0x4
0939  939:	e8 00 00 00 00       	call   93e <.altinstr_replacement+0x93e>	93a: R_X86_64_PLT32	clear_user_rep_good-0x4
093e  93e:	e8 00 00 00 00       	call   943 <.altinstr_replacement+0x943>	93f: R_X86_64_PLT32	clear_user_original-0x4
0943  943:	0f 01 ca             	clac
0946  946:	0f 01 cb             	stac
0949  949:	e8 00 00 00 00       	call   94e <.altinstr_replacement+0x94e>	94a: R_X86_64_PLT32	clear_user_erms-0x4
094e  94e:	e8 00 00 00 00       	call   953 <.altinstr_replacement+0x953>	94f: R_X86_64_PLT32	clear_user_rep_good-0x4
0953  953:	e8 00 00 00 00       	call   958 <.altinstr_replacement+0x958>	954: R_X86_64_PLT32	clear_user_original-0x4
0958  958:	0f 01 ca             	clac
095b  95b:	0f 01 cb             	stac
095e  95e:	e8 00 00 00 00       	call   963 <.altinstr_replacement+0x963>	95f: R_X86_64_PLT32	clear_user_erms-0x4
0963  963:	e8 00 00 00 00       	call   968 <.altinstr_replacement+0x968>	964: R_X86_64_PLT32	clear_user_rep_good-0x4
0968  968:	e8 00 00 00 00       	call   96d <.altinstr_replacement+0x96d>	969: R_X86_64_PLT32	clear_user_original-0x4
096d  96d:	0f 01 ca             	clac
0970  970:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0975  975:	f3 48 0f b8 c7       	popcnt %rdi,%rax
097a  97a:	e8 00 00 00 00       	call   97f <.altinstr_replacement+0x97f>	97b: R_X86_64_PLT32	clear_page_rep-0x4
097f  97f:	e8 00 00 00 00       	call   984 <.altinstr_replacement+0x984>	980: R_X86_64_PLT32	clear_page_erms-0x4
0984  984:	e8 00 00 00 00       	call   989 <.altinstr_replacement+0x989>	985: R_X86_64_PLT32	clear_page_rep-0x4
0989  989:	e8 00 00 00 00       	call   98e <.altinstr_replacement+0x98e>	98a: R_X86_64_PLT32	clear_page_erms-0x4
098e  98e:	41 0f 0d 0b          	prefetchw (%r11)
0992  992:	0f 01 cb             	stac
0995  995:	e8 00 00 00 00       	call   99a <.altinstr_replacement+0x99a>	996: R_X86_64_PLT32	clear_user_erms-0x4
099a  99a:	e8 00 00 00 00       	call   99f <.altinstr_replacement+0x99f>	99b: R_X86_64_PLT32	clear_user_rep_good-0x4
099f  99f:	e8 00 00 00 00       	call   9a4 <.altinstr_replacement+0x9a4>	9a0: R_X86_64_PLT32	clear_user_original-0x4
09a4  9a4:	0f 01 ca             	clac
09a7  9a7:	0f 01 cb             	stac
09aa  9aa:	e8 00 00 00 00       	call   9af <.altinstr_replacement+0x9af>	9ab: R_X86_64_PLT32	clear_user_erms-0x4
09af  9af:	e8 00 00 00 00       	call   9b4 <.altinstr_replacement+0x9b4>	9b0: R_X86_64_PLT32	clear_user_rep_good-0x4
09b4  9b4:	e8 00 00 00 00       	call   9b9 <.altinstr_replacement+0x9b9>	9b5: R_X86_64_PLT32	clear_user_original-0x4
09b9  9b9:	0f 01 ca             	clac
09bc  9bc:	f3 0f b8 c7          	popcnt %edi,%eax
09c0  9c0:	f3 0f b8 c7          	popcnt %edi,%eax
09c4  9c4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09c9  9c9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09ce  9ce:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09d3  9d3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09d8  9d8:	e8 00 00 00 00       	call   9dd <.altinstr_replacement+0x9dd>	9d9: R_X86_64_PLT32	copy_user_generic_string-0x4
09dd  9dd:	e8 00 00 00 00       	call   9e2 <.altinstr_replacement+0x9e2>	9de: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
09e2  9e2:	e8 00 00 00 00       	call   9e7 <.altinstr_replacement+0x9e7>	9e3: R_X86_64_PLT32	copy_user_generic_string-0x4
09e7  9e7:	e8 00 00 00 00       	call   9ec <.altinstr_replacement+0x9ec>	9e8: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
09ec  9ec:	0f 01 cb             	stac
09ef  9ef:	0f ae e8             	lfence
09f2  9f2:	0f 01 ca             	clac
09f5  9f5:	0f 01 ca             	clac
09f8  9f8:	0f 01 cb             	stac
09fb  9fb:	e8 00 00 00 00       	call   a00 <.altinstr_replacement+0xa00>	9fc: R_X86_64_PLT32	clear_user_erms-0x4
0a00  a00:	e8 00 00 00 00       	call   a05 <.altinstr_replacement+0xa05>	a01: R_X86_64_PLT32	clear_user_rep_good-0x4
0a05  a05:	e8 00 00 00 00       	call   a0a <.altinstr_replacement+0xa0a>	a06: R_X86_64_PLT32	clear_user_original-0x4
0a0a  a0a:	0f 01 ca             	clac
0a0d  a0d:	0f 01 cb             	stac
0a10  a10:	e8 00 00 00 00       	call   a15 <.altinstr_replacement+0xa15>	a11: R_X86_64_PLT32	clear_user_erms-0x4
0a15  a15:	e8 00 00 00 00       	call   a1a <.altinstr_replacement+0xa1a>	a16: R_X86_64_PLT32	clear_user_rep_good-0x4
0a1a  a1a:	e8 00 00 00 00       	call   a1f <.altinstr_replacement+0xa1f>	a1b: R_X86_64_PLT32	clear_user_original-0x4
0a1f  a1f:	0f 01 ca             	clac
0a22  a22:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a27  a27:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a2c  a2c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a31  a31:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a36  a36:	f3 0f b8 c7          	popcnt %edi,%eax
0a3a  a3a:	f3 0f b8 c7          	popcnt %edi,%eax
0a3e  a3e:	0f 01 cb             	stac
0a41  a41:	0f ae e8             	lfence
0a44  a44:	0f 01 ca             	clac
0a47  a47:	0f 01 ca             	clac
0a4a  a4a:	0f ae e8             	lfence
0a4d  a4d:	e8 00 00 00 00       	call   a52 <.altinstr_replacement+0xa52>	a4e: R_X86_64_PLT32	copy_user_generic_string-0x4
0a52  a52:	e8 00 00 00 00       	call   a57 <.altinstr_replacement+0xa57>	a53: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0a57  a57:	e8 00 00 00 00       	call   a5c <.altinstr_replacement+0xa5c>	a58: R_X86_64_PLT32	copy_user_generic_string-0x4
0a5c  a5c:	e8 00 00 00 00       	call   a61 <.altinstr_replacement+0xa61>	a5d: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0a61  a61:	0f 01 cb             	stac
0a64  a64:	0f ae e8             	lfence
0a67  a67:	0f 01 ca             	clac
0a6a  a6a:	0f 01 cb             	stac
0a6d  a6d:	0f ae e8             	lfence
0a70  a70:	0f 01 ca             	clac
0a73  a73:	9c                   	pushf
0a74  a74:	41 5d                	pop    %r13
0a76  a76:	0f 01 ca             	clac
0a79  a79:	41 55                	push   %r13
0a7b  a7b:	9d                   	popf
0a7c  a7c:	9c                   	pushf
0a7d  a7d:	41 5e                	pop    %r14
0a7f  a7f:	0f 01 ca             	clac
0a82  a82:	41 56                	push   %r14
0a84  a84:	9d                   	popf
0a85  a85:	9c                   	pushf
0a86  a86:	41 5e                	pop    %r14
0a88  a88:	0f 01 ca             	clac
0a8b  a8b:	41 56                	push   %r14
0a8d  a8d:	9d                   	popf
0a8e  a8e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a93  a93:	e9 00 00 00 00       	jmp    a98 <.altinstr_replacement+0xa98>	a94: R_X86_64_PC32	.text+0x14dc678
0a98  a98:	e9 00 00 00 00       	jmp    a9d <.altinstr_replacement+0xa9d>	a99: R_X86_64_PC32	.text+0x14e0aff
0a9d  a9d:	e9 00 00 00 00       	jmp    aa2 <.altinstr_replacement+0xaa2>	a9e: R_X86_64_PC32	.text+0x1550d7f
0aa2  aa2:	e9 00 00 00 00       	jmp    aa7 <.altinstr_replacement+0xaa7>	aa3: R_X86_64_PC32	.cpuidle.text+0x475
0aa7  aa7:	e9 00 00 00 00       	jmp    aac <.altinstr_replacement+0xaac>	aa8: R_X86_64_PC32	.cpuidle.text+0x50c
0aac  aac:	f3 0f b8 c7          	popcnt %edi,%eax
0ab0  ab0:	f3 0f b8 c7          	popcnt %edi,%eax
0ab4  ab4:	0f 01 cb             	stac
0ab7  ab7:	e8 00 00 00 00       	call   abc <.altinstr_replacement+0xabc>	ab8: R_X86_64_PLT32	clear_user_erms-0x4
0abc  abc:	e8 00 00 00 00       	call   ac1 <.altinstr_replacement+0xac1>	abd: R_X86_64_PLT32	clear_user_rep_good-0x4
0ac1  ac1:	e8 00 00 00 00       	call   ac6 <.altinstr_replacement+0xac6>	ac2: R_X86_64_PLT32	clear_user_original-0x4
0ac6  ac6:	0f 01 ca             	clac
0ac9  ac9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ace  ace:	e9 00 00 00 00       	jmp    ad3 <.altinstr_replacement+0xad3>	acf: R_X86_64_PC32	.text+0x1709c49
0ad3  ad3:	e9 00 00 00 00       	jmp    ad8 <.altinstr_replacement+0xad8>	ad4: R_X86_64_PC32	.text+0x1709c6b
0ad8  ad8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0add  add:	e9 00 00 00 00       	jmp    ae2 <.altinstr_replacement+0xae2>	ade: R_X86_64_PC32	.init.text+0x806be
0ae2  ae2:	e9 00 00 00 00       	jmp    ae7 <.altinstr_replacement+0xae7>	ae3: R_X86_64_PC32	.init.text+0x806db
0ae7  ae7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0aec  aec:	f3 0f b8 c7          	popcnt %edi,%eax
0af0  af0:	f3 0f b8 c7          	popcnt %edi,%eax
0af4  af4:	f3 0f b8 c7          	popcnt %edi,%eax
0af8  af8:	e8 00 00 00 00       	call   afd <.altinstr_replacement+0xafd>	af9: R_X86_64_PLT32	clear_page_rep-0x4
0afd  afd:	e8 00 00 00 00       	call   b02 <.altinstr_replacement+0xb02>	afe: R_X86_64_PLT32	clear_page_erms-0x4
0b02  b02:	e8 00 00 00 00       	call   b07 <.altinstr_replacement+0xb07>	b03: R_X86_64_PLT32	clear_page_rep-0x4
0b07  b07:	e8 00 00 00 00       	call   b0c <.altinstr_replacement+0xb0c>	b08: R_X86_64_PLT32	clear_page_erms-0x4
0b0c  b0c:	e8 00 00 00 00       	call   b11 <.altinstr_replacement+0xb11>	b0d: R_X86_64_PLT32	clear_page_rep-0x4
0b11  b11:	e8 00 00 00 00       	call   b16 <.altinstr_replacement+0xb16>	b12: R_X86_64_PLT32	clear_page_erms-0x4
0b16  b16:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b1b  b1b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b20  b20:	f3 0f b8 c7          	popcnt %edi,%eax
0b24  b24:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b29  b29:	0f 0d 08             	prefetchw (%rax)
0b2c  b2c:	0f 0d 0b             	prefetchw (%rbx)
0b2f  b2f:	41 0f 0d 08          	prefetchw (%r8)
0b33  b33:	f3 0f b8 c7          	popcnt %edi,%eax
0b37  b37:	f3 0f b8 c7          	popcnt %edi,%eax
0b3b  b3b:	f3 0f b8 c7          	popcnt %edi,%eax
0b3f  b3f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b44  b44:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b49  b49:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b4e  b4e:	f3 0f b8 c7          	popcnt %edi,%eax
0b52  b52:	f3 0f b8 c7          	popcnt %edi,%eax
0b56  b56:	f3 0f b8 c7          	popcnt %edi,%eax
0b5a  b5a:	f3 0f b8 c7          	popcnt %edi,%eax
0b5e  b5e:	f3 0f b8 c7          	popcnt %edi,%eax
0b62  b62:	f3 0f b8 c7          	popcnt %edi,%eax
0b66  b66:	f3 0f b8 c7          	popcnt %edi,%eax
0b6a  b6a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b6f  b6f:	e8 00 00 00 00       	call   b74 <.altinstr_replacement+0xb74>	b70: R_X86_64_PLT32	clear_page_rep-0x4
0b74  b74:	e8 00 00 00 00       	call   b79 <.altinstr_replacement+0xb79>	b75: R_X86_64_PLT32	clear_page_erms-0x4
0b79  b79:	e8 00 00 00 00       	call   b7e <.altinstr_replacement+0xb7e>	b7a: R_X86_64_PLT32	clear_page_rep-0x4
0b7e  b7e:	e8 00 00 00 00       	call   b83 <.altinstr_replacement+0xb83>	b7f: R_X86_64_PLT32	clear_page_erms-0x4
0b83  b83:	e8 00 00 00 00       	call   b88 <.altinstr_replacement+0xb88>	b84: R_X86_64_PLT32	clear_page_rep-0x4
0b88  b88:	e8 00 00 00 00       	call   b8d <.altinstr_replacement+0xb8d>	b89: R_X86_64_PLT32	clear_page_erms-0x4
0b8d  b8d:	e8 00 00 00 00       	call   b92 <.altinstr_replacement+0xb92>	b8e: R_X86_64_PLT32	clear_page_rep-0x4
0b92  b92:	e8 00 00 00 00       	call   b97 <.altinstr_replacement+0xb97>	b93: R_X86_64_PLT32	clear_page_erms-0x4
0b97  b97:	f3 0f b8 c7          	popcnt %edi,%eax
0b9b  b9b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ba0  ba0:	f3 0f b8 c7          	popcnt %edi,%eax
0ba4  ba4:	f3 0f b8 c7          	popcnt %edi,%eax
0ba8  ba8:	f3 0f b8 c7          	popcnt %edi,%eax
0bac  bac:	f3 0f b8 c7          	popcnt %edi,%eax
0bb0  bb0:	f3 0f b8 c7          	popcnt %edi,%eax
0bb4  bb4:	f3 0f b8 c7          	popcnt %edi,%eax
0bb8  bb8:	f3 0f b8 c7          	popcnt %edi,%eax
0bbc  bbc:	f3 0f b8 c7          	popcnt %edi,%eax
0bc0  bc0:	f3 0f b8 c7          	popcnt %edi,%eax
0bc4  bc4:	f3 0f b8 c7          	popcnt %edi,%eax
0bc8  bc8:	e9 00 00 00 00       	jmp    bcd <.altinstr_replacement+0xbcd>	bc9: R_X86_64_PC32	.init.text+0x9ce13
0bcd  bcd:	e9 00 00 00 00       	jmp    bd2 <.altinstr_replacement+0xbd2>	bce: R_X86_64_PC32	.init.text+0x9cf9a
0bd2  bd2:	f3 0f b8 c7          	popcnt %edi,%eax
0bd6  bd6:	41 0f 0d 0c 24       	prefetchw (%r12)
0bdb  bdb:	41 0f 0d 8c 00 c0 fe ff ff 	prefetchw -0x140(%r8,%rax,1)
0be4  be4:	0f 01 cb             	stac
0be7  be7:	0f ae e8             	lfence
0bea  bea:	0f 01 ca             	clac
0bed  bed:	0f 01 ca             	clac
0bf0  bf0:	f3 0f b8 c7          	popcnt %edi,%eax
0bf4  bf4:	f3 0f b8 c7          	popcnt %edi,%eax
0bf8  bf8:	0f 0d 08             	prefetchw (%rax)
0bfb  bfb:	f3 0f b8 c7          	popcnt %edi,%eax
0bff  bff:	f3 0f b8 c7          	popcnt %edi,%eax
0c03  c03:	f3 0f b8 c7          	popcnt %edi,%eax
0c07  c07:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c0c  c0c:	0f 0d 09             	prefetchw (%rcx)
0c0f  c0f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c14  c14:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c19  c19:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c1e  c1e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c23  c23:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c28  c28:	f3 0f b8 c7          	popcnt %edi,%eax
0c2c  c2c:	e9 00 00 00 00       	jmp    c31 <.altinstr_replacement+0xc31>	c2d: R_X86_64_PC32	.text+0x2c2b01c
0c31  c31:	e9 00 00 00 00       	jmp    c36 <.altinstr_replacement+0xc36>	c32: R_X86_64_PC32	.text+0x2cb42e9
0c36  c36:	e9 00 00 00 00       	jmp    c3b <.altinstr_replacement+0xc3b>	c37: R_X86_64_PC32	.text+0x2cb43a5
0c3b  c3b:	0f 01 cb             	stac
0c3e  c3e:	0f 01 ca             	clac
0c41  c41:	0f 01 cb             	stac
0c44  c44:	0f 01 ca             	clac
0c47  c47:	e8 00 00 00 00       	call   c4c <.altinstr_replacement+0xc4c>	c48: R_X86_64_PLT32	copy_user_generic_string-0x4
0c4c  c4c:	e8 00 00 00 00       	call   c51 <.altinstr_replacement+0xc51>	c4d: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0c51  c51:	0f 01 cb             	stac
0c54  c54:	0f 01 cb             	stac
0c57  c57:	0f 01 ca             	clac
0c5a  c5a:	0f 01 cb             	stac
0c5d  c5d:	0f 01 ca             	clac
0c60  c60:	0f 01 ca             	clac
0c63  c63:	0f 01 ca             	clac
0c66  c66:	0f 01 ca             	clac
0c69  c69:	0f 01 cb             	stac
0c6c  c6c:	0f 01 ca             	clac
0c6f  c6f:	0f ae e8             	lfence
0c72  c72:	0f 31                	rdtsc
0c74  c74:	0f 01 f9             	rdtscp
0c77  c77:	0f ae e8             	lfence
0c7a  c7a:	0f 31                	rdtsc
0c7c  c7c:	0f 01 f9             	rdtscp
0c7f  c7f:	0f ae e8             	lfence
0c82  c82:	0f 31                	rdtsc
0c84  c84:	0f 01 f9             	rdtscp
0c87  c87:	0f ae e8             	lfence
0c8a  c8a:	0f 31                	rdtsc
0c8c  c8c:	0f 01 f9             	rdtscp
0c8f  c8f:	0f 01 cb             	stac
0c92  c92:	0f 01 ca             	clac
0c95  c95:	0f 01 cb             	stac
0c98  c98:	0f 01 ca             	clac
0c9b  c9b:	0f 01 cb             	stac
0c9e  c9e:	0f 01 ca             	clac
0ca1  ca1:	0f 01 cb             	stac
0ca4  ca4:	0f 01 ca             	clac
0ca7  ca7:	0f 01 cb             	stac
0caa  caa:	0f ae e8             	lfence
0cad  cad:	0f 01 ca             	clac
0cb0  cb0:	0f 01 cb             	stac
0cb3  cb3:	0f ae e8             	lfence
0cb6  cb6:	0f 01 ca             	clac
0cb9  cb9:	0f 01 cb             	stac
0cbc  cbc:	0f ae e8             	lfence
0cbf  cbf:	0f 01 ca             	clac
0cc2  cc2:	0f 01 cb             	stac
0cc5  cc5:	0f ae e8             	lfence
0cc8  cc8:	0f 01 ca             	clac
0ccb  ccb:	0f 01 ca             	clac
0cce  cce:	e8 00 00 00 00       	call   cd3 <.altinstr_replacement+0xcd3>	ccf: R_X86_64_PLT32	copy_user_generic_string-0x4
0cd3  cd3:	e8 00 00 00 00       	call   cd8 <.altinstr_replacement+0xcd8>	cd4: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0cd8  cd8:	e9 00 00 00 00       	jmp    cdd <.altinstr_replacement+0xcdd>	cd9: R_X86_64_PC32	.noinstr.text+0x4a3c
0cdd  cdd:	e9 00 00 00 00       	jmp    ce2 <.altinstr_replacement+0xce2>	cde: R_X86_64_PC32	.noinstr.text+0x4d15
0ce2  ce2:	e9 00 00 00 00       	jmp    ce7 <.altinstr_replacement+0xce7>	ce3: R_X86_64_PC32	.noinstr.text+0x4d5c
0ce7  ce7:	0f 01 cb             	stac
0cea  cea:	0f 01 ca             	clac
0ced  ced:	0f 01 cb             	stac
0cf0  cf0:	0f 01 ca             	clac
0cf3  cf3:	0f 01 cb             	stac
0cf6  cf6:	0f 01 ca             	clac
0cf9  cf9:	0f 01 cb             	stac
0cfc  cfc:	0f 01 ca             	clac
0cff  cff:	0f 01 cb             	stac
0d02  d02:	0f 01 ca             	clac
0d05  d05:	0f 01 cb             	stac
0d08  d08:	0f 01 ca             	clac
0d0b  d0b:	0f 01 cb             	stac
0d0e  d0e:	0f 01 ca             	clac
0d11  d11:	0f 01 cb             	stac
0d14  d14:	0f 01 ca             	clac
0d17  d17:	0f 01 ca             	clac
0d1a  d1a:	e8 00 00 00 00       	call   d1f <.altinstr_replacement+0xd1f>	d1b: R_X86_64_PLT32	copy_user_generic_string-0x4
0d1f  d1f:	e8 00 00 00 00       	call   d24 <.altinstr_replacement+0xd24>	d20: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0d24  d24:	66 0f ae 38          	clflushopt (%rax)
0d28  d28:	66 0f ae 30          	clwb   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

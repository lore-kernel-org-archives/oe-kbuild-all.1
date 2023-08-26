Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D862C151
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 18:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693076230; x=1724612230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/lozW8PmhF7XwXA1Ad4Xb4rOUAxlNQEhNTd+X+KKcKc=;
  b=VQzvV6PmL78QU9kMwnAJpPDWUCffA17YAaWsDY2RtGdZ/2VdFmVC2Xxh
   NX6CQEF/u4wgFAid8sW6N6w/FL0TvK/8DYe1x5o9a1p51U9L2wqfwHmWz
   3KXEGu5KjXNo2CVJWCzUbYBJDtB6rxs2zghe8X0ANAMxUIoj2X3c+9YiP
   6QcOINEutM0Ns1mLA4tduhEiHDVZbOfw5awiOYsNNVqhkU+RM31OB7DhJ
   W8DQHVyr3Vy+6EyOh5q4xoIPM1whWJZ3FN63mGMDELV6CuHqcpVMwXhYQ
   CwGGwg+KIaf5RBw5DTC+B9LNT6fHAhzfmBUqCWJKNTt0XgUglDg87rdiO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="374863757"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="374863757"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 11:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="803269496"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="803269496"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Aug 2023 11:57:04 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZyT1-0004zx-2n;
	Sat, 26 Aug 2023 18:57:03 +0000
Date: Sun, 27 Aug 2023 02:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [stable:linux-5.10.y 9990/9999] arch/x86/lib/retpoline.o: warning:
 objtool: .altinstr_replacement+0x90: unsupported relocation in alternatives
 section
Message-ID: <202308270243.86PKK5Yj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   1599cb60bace881ce05fa520e5251be341e380d2
commit: 06597b650beb49bffc61e077f41e39b830d72128 [9990/9999] x86/cpu: Cleanup the untrain mess
config: x86_64-randconfig-074-20230826 (https://download.01.org/0day-ci/archive/20230827/202308270243.86PKK5Yj-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270243.86PKK5Yj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270243.86PKK5Yj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/retpoline.o: warning: objtool: .altinstr_replacement+0x90: unsupported relocation in alternatives section


objdump-func vmlinux.o .altinstr_replacement:
0000 0000000000000000 <.altinstr_replacement>:
0000    0:	e8 00 00 00 00       	call   5 <.altinstr_replacement+0x5>	1: R_X86_64_PLT32	clear_page_rep-0x4
0005    5:	e8 00 00 00 00       	call   a <.altinstr_replacement+0xa>	6: R_X86_64_PLT32	clear_page_erms-0x4
000a    a:	e8 00 00 00 00       	call   f <.altinstr_replacement+0xf>	b: R_X86_64_PLT32	entry_ibpb-0x4
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
003b   3b:	e8 00 00 00 00       	call   40 <.altinstr_replacement+0x40>	3c: R_X86_64_PLT32	__x86_indirect_thunk_rbx-0x4
0040   40:	0f ae e8             	lfence
0043   43:	ff d3                	call   *%rbx
0045   45:	0f 01 ca             	clac
0048   48:	0f 01 ca             	clac
004b   4b:	0f 01 ca             	clac
004e   4e:	0f 01 ca             	clac
0051   51:	0f 01 ca             	clac
0054   54:	0f 01 ca             	clac
0057   57:	0f 01 ca             	clac
005a   5a:	0f 01 ca             	clac
005d   5d:	0f 01 ca             	clac
0060   60:	0f 01 ca             	clac
0063   63:	0f 01 ca             	clac
0066   66:	0f 01 ca             	clac
0069   69:	0f 01 ca             	clac
006c   6c:	0f 01 ca             	clac
006f   6f:	0f 01 ca             	clac
0072   72:	0f 01 ca             	clac
0075   75:	0f 01 ca             	clac
0078   78:	0f 01 ca             	clac
007b   7b:	0f 01 ca             	clac
007e   7e:	0f 01 ca             	clac
0081   81:	0f 01 ca             	clac
0084   84:	0f 01 ca             	clac
0087   87:	0f 01 ca             	clac
008a   8a:	0f 01 ca             	clac
008d   8d:	0f 01 ca             	clac
0090   90:	0f 01 ca             	clac
0093   93:	0f 01 ca             	clac
0096   96:	0f 01 ca             	clac
0099   99:	0f 01 ca             	clac
009c   9c:	0f 01 ca             	clac
009f   9f:	0f 01 ca             	clac
00a2   a2:	0f 01 ca             	clac
00a5   a5:	0f 01 ca             	clac
00a8   a8:	0f 01 ca             	clac
00ab   ab:	0f 01 ca             	clac
00ae   ae:	0f 01 ca             	clac
00b1   b1:	0f 01 ca             	clac
00b4   b4:	0f ae f0             	mfence
00b7   b7:	b8 2b 00 00 00       	mov    $0x2b,%eax
00bc   bc:	8e e8                	mov    %eax,%gs
00be   be:	e8 00 00 00 00       	call   c3 <.altinstr_replacement+0xc3>	bf: R_X86_64_PLT32	__x86_indirect_thunk_rsi-0x4
00c3   c3:	0f ae e8             	lfence
00c6   c6:	ff d6                	call   *%rsi
00c8   c8:	0f ae e8             	lfence
00cb   cb:	e8 00 00 00 00       	call   d0 <.altinstr_replacement+0xd0>	cc: R_X86_64_PLT32	entry_ibpb-0x4
00d0   d0:	0f ae e8             	lfence
00d3   d3:	e8 00 00 00 00       	call   d8 <.altinstr_replacement+0xd8>	d4: R_X86_64_PLT32	entry_ibpb-0x4
00d8   d8:	0f ae e8             	lfence
00db   db:	0f ae e8             	lfence
00de   de:	e8 00 00 00 00       	call   e3 <.altinstr_replacement+0xe3>	df: R_X86_64_PLT32	entry_ibpb-0x4
00e3   e3:	0f 01 ca             	clac
00e6   e6:	0f ae e8             	lfence
00e9   e9:	e8 00 00 00 00       	call   ee <.altinstr_replacement+0xee>	ea: R_X86_64_PLT32	entry_ibpb-0x4
00ee   ee:	e8 00 00 00 00       	call   f3 <.altinstr_replacement+0xf3>	ef: R_X86_64_PLT32	entry_ibpb-0x4
00f3   f3:	e9 00 00 00 00       	jmp    f8 <.altinstr_replacement+0xf8>	f4: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
00f8   f8:	e8 00 00 00 00       	call   fd <.altinstr_replacement+0xfd>	f9: R_X86_64_PLT32	entry_ibpb-0x4
00fd   fd:	e9 00 00 00 00       	jmp    102 <.altinstr_replacement+0x102>	fe: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
0102  102:	0f 01 ca             	clac
0105  105:	e9 00 00 00 00       	jmp    10a <.altinstr_replacement+0x10a>	106: R_X86_64_PC32	.entry.text+0x129b
010a  10a:	e8 00 00 00 00       	call   10f <.altinstr_replacement+0x10f>	10b: R_X86_64_PLT32	entry_ibpb-0x4
010f  10f:	f3 0f b8 c7          	popcnt %edi,%eax
0113  113:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0118  118:	f3 48 0f b8 c7       	popcnt %rdi,%rax
011d  11d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0122  122:	0f ae e8             	lfence
0125  125:	0f 31                	rdtsc
0127  127:	0f 01 f9             	rdtscp
012a  12a:	0f ae e8             	lfence
012d  12d:	0f 31                	rdtsc
012f  12f:	0f 01 f9             	rdtscp
0132  132:	0f ae e8             	lfence
0135  135:	0f 31                	rdtsc
0137  137:	0f 01 f9             	rdtscp
013a  13a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
013f  13f:	e9 00 00 00 00       	jmp    144 <.altinstr_replacement+0x144>	140: R_X86_64_PC32	.text+0x10aec
0144  144:	e9 00 00 00 00       	jmp    149 <.altinstr_replacement+0x149>	145: R_X86_64_PC32	.text+0x1111a
0149  149:	e9 00 00 00 00       	jmp    14e <.altinstr_replacement+0x14e>	14a: R_X86_64_PC32	.text+0x1114f
014e  14e:	e9 00 00 00 00       	jmp    153 <.altinstr_replacement+0x153>	14f: R_X86_64_PC32	.text+0x111ac
0153  153:	e9 00 00 00 00       	jmp    158 <.altinstr_replacement+0x158>	154: R_X86_64_PC32	.text+0x111e7
0158  158:	e9 00 00 00 00       	jmp    15d <.altinstr_replacement+0x15d>	159: R_X86_64_PC32	.text+0x11a05
015d  15d:	e9 00 00 00 00       	jmp    162 <.altinstr_replacement+0x162>	15e: R_X86_64_PC32	.text+0x11a17
0162  162:	e9 00 00 00 00       	jmp    167 <.altinstr_replacement+0x167>	163: R_X86_64_PC32	.text+0x11a27
0167  167:	e9 00 00 00 00       	jmp    16c <.altinstr_replacement+0x16c>	168: R_X86_64_PC32	.text+0x11a36
016c  16c:	e9 00 00 00 00       	jmp    171 <.altinstr_replacement+0x171>	16d: R_X86_64_PC32	.text+0x11aae
0171  171:	e9 00 00 00 00       	jmp    176 <.altinstr_replacement+0x176>	172: R_X86_64_PC32	.text+0x11ac4
0176  176:	e9 00 00 00 00       	jmp    17b <.altinstr_replacement+0x17b>	177: R_X86_64_PC32	.text+0x11afb
017b  17b:	e9 00 00 00 00       	jmp    180 <.altinstr_replacement+0x180>	17c: R_X86_64_PC32	.text+0x11b16
0180  180:	e9 00 00 00 00       	jmp    185 <.altinstr_replacement+0x185>	181: R_X86_64_PC32	.text+0x11bc4
0185  185:	e9 00 00 00 00       	jmp    18a <.altinstr_replacement+0x18a>	186: R_X86_64_PC32	.text+0x11bae
018a  18a:	e9 00 00 00 00       	jmp    18f <.altinstr_replacement+0x18f>	18b: R_X86_64_PC32	.text+0x11bc4
018f  18f:	e9 00 00 00 00       	jmp    194 <.altinstr_replacement+0x194>	190: R_X86_64_PC32	.text+0x11be7
0194  194:	e9 00 00 00 00       	jmp    199 <.altinstr_replacement+0x199>	195: R_X86_64_PC32	.text+0x11c05
0199  199:	e9 00 00 00 00       	jmp    19e <.altinstr_replacement+0x19e>	19a: R_X86_64_PC32	.text+0x11ca3
019e  19e:	e9 00 00 00 00       	jmp    1a3 <.altinstr_replacement+0x1a3>	19f: R_X86_64_PC32	.text+0x11d89
01a3  1a3:	e9 00 00 00 00       	jmp    1a8 <.altinstr_replacement+0x1a8>	1a4: R_X86_64_PC32	.text+0x11e16
01a8  1a8:	e9 00 00 00 00       	jmp    1ad <.altinstr_replacement+0x1ad>	1a9: R_X86_64_PC32	.text+0x11e86
01ad  1ad:	e9 00 00 00 00       	jmp    1b2 <.altinstr_replacement+0x1b2>	1ae: R_X86_64_PC32	.text+0x11f92
01b2  1b2:	e9 00 00 00 00       	jmp    1b7 <.altinstr_replacement+0x1b7>	1b3: R_X86_64_PC32	.text+0x11ffb
01b7  1b7:	e9 00 00 00 00       	jmp    1bc <.altinstr_replacement+0x1bc>	1b8: R_X86_64_PC32	.text+0x1200e
01bc  1bc:	e9 00 00 00 00       	jmp    1c1 <.altinstr_replacement+0x1c1>	1bd: R_X86_64_PC32	.text+0x1209a
01c1  1c1:	e9 00 00 00 00       	jmp    1c6 <.altinstr_replacement+0x1c6>	1c2: R_X86_64_PC32	.text+0x12103
01c6  1c6:	e9 00 00 00 00       	jmp    1cb <.altinstr_replacement+0x1cb>	1c7: R_X86_64_PC32	.text+0x127fb
01cb  1cb:	e9 00 00 00 00       	jmp    1d0 <.altinstr_replacement+0x1d0>	1cc: R_X86_64_PC32	.text+0x128a7
01d0  1d0:	f3 0f b8 c7          	popcnt %edi,%eax
01d4  1d4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01d9  1d9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01de  1de:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01e3  1e3:	e8 00 00 00 00       	call   1e8 <.altinstr_replacement+0x1e8>	1e4: R_X86_64_PLT32	__x86_indirect_thunk_r13-0x4
01e8  1e8:	0f ae e8             	lfence
01eb  1eb:	41 ff d5             	call   *%r13
01ee  1ee:	e8 00 00 00 00       	call   1f3 <.altinstr_replacement+0x1f3>	1ef: R_X86_64_PLT32	__x86_indirect_thunk_rax-0x4
01f3  1f3:	0f ae e8             	lfence
01f6  1f6:	ff d0                	call   *%rax
01f8  1f8:	e8 00 00 00 00       	call   1fd <.altinstr_replacement+0x1fd>	1f9: R_X86_64_PLT32	__x86_indirect_thunk_r13-0x4
01fd  1fd:	0f ae e8             	lfence
0200  200:	41 ff d5             	call   *%r13
0203  203:	e8 00 00 00 00       	call   208 <.altinstr_replacement+0x208>	204: R_X86_64_PLT32	__x86_indirect_thunk_rax-0x4
0208  208:	0f ae e8             	lfence
020b  20b:	ff d0                	call   *%rax
020d  20d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0212  212:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0217  217:	f3 48 0f b8 c7       	popcnt %rdi,%rax
021c  21c:	e8 00 00 00 00       	call   221 <.altinstr_replacement+0x221>	21d: R_X86_64_PLT32	__x86_indirect_thunk_rax-0x4
0221  221:	0f ae e8             	lfence
0224  224:	ff d0                	call   *%rax
0226  226:	e8 00 00 00 00       	call   22b <.altinstr_replacement+0x22b>	227: R_X86_64_PLT32	__x86_indirect_thunk_r13-0x4
022b  22b:	0f ae e8             	lfence
022e  22e:	41 ff d5             	call   *%r13
0231  231:	e8 00 00 00 00       	call   236 <.altinstr_replacement+0x236>	232: R_X86_64_PLT32	__x86_indirect_thunk_rbx-0x4
0236  236:	0f ae e8             	lfence
0239  239:	ff d3                	call   *%rbx
023b  23b:	87 b7 00 d0 5f ff    	xchg   %esi,-0xa03000(%rdi)
0241  241:	e8 00 00 00 00       	call   246 <.altinstr_replacement+0x246>	242: R_X86_64_PLT32	__x86_indirect_thunk_rsi-0x4
0246  246:	0f ae e8             	lfence
0249  249:	ff d6                	call   *%rsi
024b  24b:	e8 00 00 00 00       	call   250 <.altinstr_replacement+0x250>	24c: R_X86_64_PLT32	__x86_indirect_thunk_rax-0x4
0250  250:	0f ae e8             	lfence
0253  253:	ff d0                	call   *%rax
0255  255:	e9 00 00 00 00       	jmp    25a <.altinstr_replacement+0x25a>	256: R_X86_64_PC32	.noinstr.text+0x2d5
025a  25a:	e9 00 00 00 00       	jmp    25f <.altinstr_replacement+0x25f>	25b: R_X86_64_PC32	.noinstr.text+0x349
025f  25f:	e9 00 00 00 00       	jmp    264 <.altinstr_replacement+0x264>	260: R_X86_64_PC32	.text+0x20fa4
0264  264:	e9 00 00 00 00       	jmp    269 <.altinstr_replacement+0x269>	265: R_X86_64_PC32	.text+0x2140d
0269  269:	e9 00 00 00 00       	jmp    26e <.altinstr_replacement+0x26e>	26a: R_X86_64_PC32	.text+0x218bd
026e  26e:	e9 00 00 00 00       	jmp    273 <.altinstr_replacement+0x273>	26f: R_X86_64_PC32	.text+0x21972
0273  273:	e9 00 00 00 00       	jmp    278 <.altinstr_replacement+0x278>	274: R_X86_64_PC32	.text+0x21a14
0278  278:	e9 00 00 00 00       	jmp    27d <.altinstr_replacement+0x27d>	279: R_X86_64_PC32	.text+0x21a8b
027d  27d:	e9 00 00 00 00       	jmp    282 <.altinstr_replacement+0x282>	27e: R_X86_64_PC32	.text+0x21ba1
0282  282:	e9 00 00 00 00       	jmp    287 <.altinstr_replacement+0x287>	283: R_X86_64_PC32	.text+0x21be7
0287  287:	0f 01 cb             	stac
028a  28a:	0f ae e8             	lfence
028d  28d:	0f 01 ca             	clac
0290  290:	0f 01 ca             	clac
0293  293:	e9 00 00 00 00       	jmp    298 <.altinstr_replacement+0x298>	294: R_X86_64_PC32	.noinstr.text+0x8c1
0298  298:	e9 00 00 00 00       	jmp    29d <.altinstr_replacement+0x29d>	299: R_X86_64_PC32	.noinstr.text+0xd3b
029d  29d:	e9 00 00 00 00       	jmp    2a2 <.altinstr_replacement+0x2a2>	29e: R_X86_64_PC32	.init.text+0x8164
02a2  2a2:	e9 00 00 00 00       	jmp    2a7 <.altinstr_replacement+0x2a7>	2a3: R_X86_64_PC32	.noinstr.text+0x189a
02a7  2a7:	0f 01 cb             	stac
02aa  2aa:	0f ae e8             	lfence
02ad  2ad:	0f 01 ca             	clac
02b0  2b0:	0f 01 ca             	clac
02b3  2b3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
02b8  2b8:	e9 00 00 00 00       	jmp    2bd <.altinstr_replacement+0x2bd>	2b9: R_X86_64_PC32	.text+0x29b88
02bd  2bd:	e9 00 00 00 00       	jmp    2c2 <.altinstr_replacement+0x2c2>	2be: R_X86_64_PC32	.text+0x29d66
02c2  2c2:	e9 00 00 00 00       	jmp    2c7 <.altinstr_replacement+0x2c7>	2c3: R_X86_64_PC32	.text+0x2a39e
02c7  2c7:	e9 00 00 00 00       	jmp    2cc <.altinstr_replacement+0x2cc>	2c8: R_X86_64_PC32	.text+0x2a57b
02cc  2cc:	e9 00 00 00 00       	jmp    2d1 <.altinstr_replacement+0x2d1>	2cd: R_X86_64_PC32	.text+0x2a406
02d1  2d1:	e9 00 00 00 00       	jmp    2d6 <.altinstr_replacement+0x2d6>	2d2: R_X86_64_PC32	.text+0x2a6db
02d6  2d6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
02db  2db:	f3 48 0f b8 c7       	popcnt %rdi,%rax
02e0  2e0:	0f ae e8             	lfence
02e3  2e3:	0f 31                	rdtsc
02e5  2e5:	0f 01 f9             	rdtscp
02e8  2e8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
02ed  2ed:	e9 00 00 00 00       	jmp    2f2 <.altinstr_replacement+0x2f2>	2ee: R_X86_64_PC32	.ref.text+0x4ef
02f2  2f2:	e9 00 00 00 00       	jmp    2f7 <.altinstr_replacement+0x2f7>	2f3: R_X86_64_PC32	.text+0x2d656
02f7  2f7:	e9 00 00 00 00       	jmp    2fc <.altinstr_replacement+0x2fc>	2f8: R_X86_64_PC32	.text+0x2d688
02fc  2fc:	e9 00 00 00 00       	jmp    301 <.altinstr_replacement+0x301>	2fd: R_X86_64_PC32	.text+0x2d7c1
0301  301:	e9 00 00 00 00       	jmp    306 <.altinstr_replacement+0x306>	302: R_X86_64_PC32	.text+0x2d6ac
0306  306:	e9 00 00 00 00       	jmp    30b <.altinstr_replacement+0x30b>	307: R_X86_64_PC32	.text+0x2d7c8
030b  30b:	e9 00 00 00 00       	jmp    310 <.altinstr_replacement+0x310>	30c: R_X86_64_PC32	.text+0x2da2b
0310  310:	e9 00 00 00 00       	jmp    315 <.altinstr_replacement+0x315>	311: R_X86_64_PC32	.text+0x2da68
0315  315:	e9 00 00 00 00       	jmp    31a <.altinstr_replacement+0x31a>	316: R_X86_64_PC32	.text+0x2dc00
031a  31a:	e9 00 00 00 00       	jmp    31f <.altinstr_replacement+0x31f>	31b: R_X86_64_PC32	.text+0x2da97
031f  31f:	e9 00 00 00 00       	jmp    324 <.altinstr_replacement+0x324>	320: R_X86_64_PC32	.text+0x2dc07
0324  324:	e9 00 00 00 00       	jmp    329 <.altinstr_replacement+0x329>	325: R_X86_64_PC32	.text+0x2dcb1
0329  329:	e9 00 00 00 00       	jmp    32e <.altinstr_replacement+0x32e>	32a: R_X86_64_PC32	.text+0x2dce9
032e  32e:	e9 00 00 00 00       	jmp    333 <.altinstr_replacement+0x333>	32f: R_X86_64_PC32	.text+0x2de13
0333  333:	e9 00 00 00 00       	jmp    338 <.altinstr_replacement+0x338>	334: R_X86_64_PC32	.text+0x2dd0d
0338  338:	e9 00 00 00 00       	jmp    33d <.altinstr_replacement+0x33d>	339: R_X86_64_PC32	.text+0x2de1a
033d  33d:	e9 00 00 00 00       	jmp    342 <.altinstr_replacement+0x342>	33e: R_X86_64_PC32	.text+0x2e88b
0342  342:	48 0f ae 37          	xsaveopt64 (%rdi)
0346  346:	48 0f c7 2f          	xsaves64 (%rdi)
034a  34a:	e9 00 00 00 00       	jmp    34f <.altinstr_replacement+0x34f>	34b: R_X86_64_PC32	.text+0x2e98e
034f  34f:	e9 00 00 00 00       	jmp    354 <.altinstr_replacement+0x354>	350: R_X86_64_PC32	.text+0x2eaaf
0354  354:	e9 00 00 00 00       	jmp    359 <.altinstr_replacement+0x359>	355: R_X86_64_PC32	.text+0x2eab6
0359  359:	48 0f c7 1f          	xrstors64 (%rdi)
035d  35d:	48 0f c7 1f          	xrstors64 (%rdi)
0361  361:	e9 00 00 00 00       	jmp    366 <.altinstr_replacement+0x366>	362: R_X86_64_PC32	.text+0x2ecbb
0366  366:	48 0f c7 1f          	xrstors64 (%rdi)
036a  36a:	e9 00 00 00 00       	jmp    36f <.altinstr_replacement+0x36f>	36b: R_X86_64_PC32	.text+0x2ecbb
036f  36f:	48 0f c7 1f          	xrstors64 (%rdi)
0373  373:	e9 00 00 00 00       	jmp    378 <.altinstr_replacement+0x378>	374: R_X86_64_PC32	.text+0x2ee01
0378  378:	e9 00 00 00 00       	jmp    37d <.altinstr_replacement+0x37d>	379: R_X86_64_PC32	.text+0x2ee08
037d  37d:	48 0f c7 1f          	xrstors64 (%rdi)
0381  381:	e9 00 00 00 00       	jmp    386 <.altinstr_replacement+0x386>	382: R_X86_64_PC32	.text+0x2ef87
0386  386:	e9 00 00 00 00       	jmp    38b <.altinstr_replacement+0x38b>	387: R_X86_64_PC32	.text+0x2ef8e
038b  38b:	48 0f c7 1f          	xrstors64 (%rdi)
038f  38f:	e8 00 00 00 00       	call   394 <.altinstr_replacement+0x394>	390: R_X86_64_PLT32	copy_user_generic_string-0x4
0394  394:	e8 00 00 00 00       	call   399 <.altinstr_replacement+0x399>	395: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0399  399:	e8 00 00 00 00       	call   39e <.altinstr_replacement+0x39e>	39a: R_X86_64_PLT32	copy_user_generic_string-0x4
039e  39e:	e8 00 00 00 00       	call   3a3 <.altinstr_replacement+0x3a3>	39f: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
03a3  3a3:	e8 00 00 00 00       	call   3a8 <.altinstr_replacement+0x3a8>	3a4: R_X86_64_PLT32	copy_user_generic_string-0x4
03a8  3a8:	e8 00 00 00 00       	call   3ad <.altinstr_replacement+0x3ad>	3a9: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
03ad  3ad:	e8 00 00 00 00       	call   3b2 <.altinstr_replacement+0x3b2>	3ae: R_X86_64_PLT32	copy_user_generic_string-0x4
03b2  3b2:	e8 00 00 00 00       	call   3b7 <.altinstr_replacement+0x3b7>	3b3: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
03b7  3b7:	e9 00 00 00 00       	jmp    3bc <.altinstr_replacement+0x3bc>	3b8: R_X86_64_PC32	.text+0x2fc46
03bc  3bc:	e8 00 00 00 00       	call   3c1 <.altinstr_replacement+0x3c1>	3bd: R_X86_64_PLT32	copy_user_generic_string-0x4
03c1  3c1:	e8 00 00 00 00       	call   3c6 <.altinstr_replacement+0x3c6>	3c2: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
03c6  3c6:	e9 00 00 00 00       	jmp    3cb <.altinstr_replacement+0x3cb>	3c7: R_X86_64_PC32	.text+0x2fda2
03cb  3cb:	0f 01 cb             	stac
03ce  3ce:	0f 01 ca             	clac
03d1  3d1:	0f 01 cb             	stac
03d4  3d4:	0f 01 ca             	clac
03d7  3d7:	48 0f c7 1f          	xrstors64 (%rdi)
03db  3db:	0f 01 cb             	stac
03de  3de:	0f 01 ca             	clac
03e1  3e1:	48 0f c7 1f          	xrstors64 (%rdi)
03e5  3e5:	48 0f c7 1f          	xrstors64 (%rdi)
03e9  3e9:	e8 00 00 00 00       	call   3ee <.altinstr_replacement+0x3ee>	3ea: R_X86_64_PLT32	copy_user_generic_string-0x4
03ee  3ee:	e8 00 00 00 00       	call   3f3 <.altinstr_replacement+0x3f3>	3ef: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
03f3  3f3:	e9 00 00 00 00       	jmp    3f8 <.altinstr_replacement+0x3f8>	3f4: R_X86_64_PC32	.text+0x300f3
03f8  3f8:	e9 00 00 00 00       	jmp    3fd <.altinstr_replacement+0x3fd>	3f9: R_X86_64_PC32	.text+0x3004d
03fd  3fd:	48 0f c7 1f          	xrstors64 (%rdi)
0401  401:	e9 00 00 00 00       	jmp    406 <.altinstr_replacement+0x406>	402: R_X86_64_PC32	.text+0x300cf
0406  406:	e8 00 00 00 00       	call   40b <.altinstr_replacement+0x40b>	407: R_X86_64_PLT32	copy_user_generic_string-0x4
040b  40b:	e8 00 00 00 00       	call   410 <.altinstr_replacement+0x410>	40c: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0410  410:	e9 00 00 00 00       	jmp    415 <.altinstr_replacement+0x415>	411: R_X86_64_PC32	.text+0x3014d
0415  415:	e9 00 00 00 00       	jmp    41a <.altinstr_replacement+0x41a>	416: R_X86_64_PC32	.text+0x301ab
041a  41a:	48 0f c7 1f          	xrstors64 (%rdi)
041e  41e:	e9 00 00 00 00       	jmp    423 <.altinstr_replacement+0x423>	41f: R_X86_64_PC32	.text+0x303b4
0423  423:	e9 00 00 00 00       	jmp    428 <.altinstr_replacement+0x428>	424: R_X86_64_PC32	.text+0x303bb
0428  428:	48 0f c7 1f          	xrstors64 (%rdi)
042c  42c:	e9 00 00 00 00       	jmp    431 <.altinstr_replacement+0x431>	42d: R_X86_64_PC32	.text+0x30496
0431  431:	0f 01 cb             	stac
0434  434:	0f 01 ca             	clac
0437  437:	0f 01 cb             	stac
043a  43a:	0f 01 ca             	clac
043d  43d:	e8 00 00 00 00       	call   442 <.altinstr_replacement+0x442>	43e: R_X86_64_PLT32	copy_user_generic_string-0x4
0442  442:	e8 00 00 00 00       	call   447 <.altinstr_replacement+0x447>	443: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0447  447:	e9 00 00 00 00       	jmp    44c <.altinstr_replacement+0x44c>	448: R_X86_64_PC32	.text+0x30643
044c  44c:	e9 00 00 00 00       	jmp    451 <.altinstr_replacement+0x451>	44d: R_X86_64_PC32	.text+0x30678
0451  451:	e9 00 00 00 00       	jmp    456 <.altinstr_replacement+0x456>	452: R_X86_64_PC32	.text+0x306b8
0456  456:	e9 00 00 00 00       	jmp    45b <.altinstr_replacement+0x45b>	457: R_X86_64_PC32	.text+0x309c8
045b  45b:	e8 00 00 00 00       	call   460 <.altinstr_replacement+0x460>	45c: R_X86_64_PLT32	copy_user_generic_string-0x4
0460  460:	e8 00 00 00 00       	call   465 <.altinstr_replacement+0x465>	461: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0465  465:	e8 00 00 00 00       	call   46a <.altinstr_replacement+0x46a>	466: R_X86_64_PLT32	copy_user_generic_string-0x4
046a  46a:	e8 00 00 00 00       	call   46f <.altinstr_replacement+0x46f>	46b: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
046f  46f:	e8 00 00 00 00       	call   474 <.altinstr_replacement+0x474>	470: R_X86_64_PLT32	copy_user_generic_string-0x4
0474  474:	e8 00 00 00 00       	call   479 <.altinstr_replacement+0x479>	475: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0479  479:	e9 00 00 00 00       	jmp    47e <.altinstr_replacement+0x47e>	47a: R_X86_64_PC32	.text+0x31608
047e  47e:	e8 00 00 00 00       	call   483 <.altinstr_replacement+0x483>	47f: R_X86_64_PLT32	copy_user_generic_string-0x4
0483  483:	e8 00 00 00 00       	call   488 <.altinstr_replacement+0x488>	484: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0488  488:	0f 30                	wrmsr
048a  48a:	e9 00 00 00 00       	jmp    48f <.altinstr_replacement+0x48f>	48b: R_X86_64_PC32	.text+0x37575
048f  48f:	e9 00 00 00 00       	jmp    494 <.altinstr_replacement+0x494>	490: R_X86_64_PC32	.text+0x3757c
0494  494:	e9 00 00 00 00       	jmp    499 <.altinstr_replacement+0x499>	495: R_X86_64_PC32	.text+0x375c3
0499  499:	e9 00 00 00 00       	jmp    49e <.altinstr_replacement+0x49e>	49a: R_X86_64_PC32	.text+0x3758d
049e  49e:	e9 00 00 00 00       	jmp    4a3 <.altinstr_replacement+0x4a3>	49f: R_X86_64_PC32	.text+0x375f0
04a3  4a3:	e9 00 00 00 00       	jmp    4a8 <.altinstr_replacement+0x4a8>	4a4: R_X86_64_PC32	.init.text+0xd641
04a8  4a8:	e9 00 00 00 00       	jmp    4ad <.altinstr_replacement+0x4ad>	4a9: R_X86_64_PC32	.init.text+0xdf54
04ad  4ad:	e9 00 00 00 00       	jmp    4b2 <.altinstr_replacement+0x4b2>	4ae: R_X86_64_PC32	.init.text+0xdf5b
04b2  4b2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
04b7  4b7:	f7 f1                	div    %ecx
04b9  4b9:	e9 00 00 00 00       	jmp    4be <.altinstr_replacement+0x4be>	4ba: R_X86_64_PC32	.text+0x3d5b7
04be  4be:	e9 00 00 00 00       	jmp    4c3 <.altinstr_replacement+0x4c3>	4bf: R_X86_64_PC32	.text+0x3d638
04c3  4c3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
04c8  4c8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
04cd  4cd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
04d2  4d2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
04d7  4d7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
04dc  4dc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
04e1  4e1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
04e6  4e6:	0f ae e8             	lfence
04e9  4e9:	0f 31                	rdtsc
04eb  4eb:	0f 01 f9             	rdtscp
04ee  4ee:	0f ae e8             	lfence
04f1  4f1:	0f 31                	rdtsc
04f3  4f3:	0f 01 f9             	rdtscp
04f6  4f6:	0f ae e8             	lfence
04f9  4f9:	0f 31                	rdtsc
04fb  4fb:	0f 01 f9             	rdtscp
04fe  4fe:	0f 01 c1             	vmcall
0501  501:	0f 01 d9             	vmmcall
0504  504:	e9 00 00 00 00       	jmp    509 <.altinstr_replacement+0x509>	505: R_X86_64_PC32	.cpuidle.text+0xcf
0509  509:	e9 00 00 00 00       	jmp    50e <.altinstr_replacement+0x50e>	50a: R_X86_64_PC32	.cpuidle.text+0xfb
050e  50e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0513  513:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0518  518:	f3 48 0f b8 c7       	popcnt %rdi,%rax
051d  51d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0522  522:	e9 00 00 00 00       	jmp    527 <.altinstr_replacement+0x527>	523: R_X86_64_PC32	.init.text+0x13244
0527  527:	0f ae e8             	lfence
052a  52a:	0f 31                	rdtsc
052c  52c:	0f 01 f9             	rdtscp
052f  52f:	0f ae e8             	lfence
0532  532:	0f 31                	rdtsc
0534  534:	0f 01 f9             	rdtscp
0537  537:	f3 48 0f b8 c7       	popcnt %rdi,%rax
053c  53c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0541  541:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0546  546:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
054d  54d:	87 3c 25 10 d3 5f ff 	xchg   %edi,0xffffffffff5fd310
0554  554:	87 14 25 00 d3 5f ff 	xchg   %edx,0xffffffffff5fd300
055b  55b:	87 b7 00 d0 5f ff    	xchg   %esi,-0xa03000(%rdi)
0561  561:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0566  566:	e8 00 00 00 00       	call   56b <.altinstr_replacement+0x56b>	567: R_X86_64_PLT32	__x86_indirect_thunk_r8-0x4
056b  56b:	0f ae e8             	lfence
056e  56e:	41 ff d0             	call   *%r8
0571  571:	0f ae e8             	lfence
0574  574:	0f 31                	rdtsc
0576  576:	0f 01 f9             	rdtscp
0579  579:	e9 00 00 00 00       	jmp    57e <.altinstr_replacement+0x57e>	57a: R_X86_64_PC32	.init.text+0x16540
057e  57e:	0f 01 d9             	vmmcall
0581  581:	0f 01 d9             	vmmcall
0584  584:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0589  589:	0f ae e8             	lfence
058c  58c:	0f 31                	rdtsc
058e  58e:	0f 01 f9             	rdtscp
0591  591:	e8 00 00 00 00       	call   596 <.altinstr_replacement+0x596>	592: R_X86_64_PLT32	clear_page_rep-0x4
0596  596:	e8 00 00 00 00       	call   59b <.altinstr_replacement+0x59b>	597: R_X86_64_PLT32	clear_page_erms-0x4
059b  59b:	e9 00 00 00 00       	jmp    5a0 <.altinstr_replacement+0x5a0>	59c: R_X86_64_PC32	.text+0x5bd5b
05a0  5a0:	0f 0d 88 b8 00 00 00 	prefetchw 0xb8(%rax)
05a7  5a7:	e9 00 00 00 00       	jmp    5ac <.altinstr_replacement+0x5ac>	5a8: R_X86_64_PC32	.noinstr.text+0x2a42
05ac  5ac:	e9 00 00 00 00       	jmp    5b1 <.altinstr_replacement+0x5b1>	5ad: R_X86_64_PC32	.text+0x5c6ad
05b1  5b1:	e9 00 00 00 00       	jmp    5b6 <.altinstr_replacement+0x5b6>	5b2: R_X86_64_PC32	.text+0x5c8a9
05b6  5b6:	48 0f c7 1f          	xrstors64 (%rdi)
05ba  5ba:	e9 00 00 00 00       	jmp    5bf <.altinstr_replacement+0x5bf>	5bb: R_X86_64_PC32	.text+0x5dbac
05bf  5bf:	0f 30                	wrmsr
05c1  5c1:	0f 30                	wrmsr
05c3  5c3:	e9 00 00 00 00       	jmp    5c8 <.altinstr_replacement+0x5c8>	5c4: R_X86_64_PC32	.text+0x5dee5
05c8  5c8:	e9 00 00 00 00       	jmp    5cd <.altinstr_replacement+0x5cd>	5c9: R_X86_64_PC32	.text+0x5de0f
05cd  5cd:	e9 00 00 00 00       	jmp    5d2 <.altinstr_replacement+0x5d2>	5ce: R_X86_64_PC32	.text+0x5df20
05d2  5d2:	e9 00 00 00 00       	jmp    5d7 <.altinstr_replacement+0x5d7>	5d3: R_X86_64_PC32	.text+0x5e55a
05d7  5d7:	e9 00 00 00 00       	jmp    5dc <.altinstr_replacement+0x5dc>	5d8: R_X86_64_PC32	.text+0x5e9e1
05dc  5dc:	e9 00 00 00 00       	jmp    5e1 <.altinstr_replacement+0x5e1>	5dd: R_X86_64_PC32	.text+0x5ea6d
05e1  5e1:	e9 00 00 00 00       	jmp    5e6 <.altinstr_replacement+0x5e6>	5e2: R_X86_64_PC32	.text+0x5ead2
05e6  5e6:	66 0f ae 38          	clflushopt (%rax)
05ea  5ea:	66 0f ae 38          	clflushopt (%rax)
05ee  5ee:	e9 00 00 00 00       	jmp    5f3 <.altinstr_replacement+0x5f3>	5ef: R_X86_64_PC32	.text+0x613f5
05f3  5f3:	66 0f ae 3a          	clflushopt (%rdx)
05f7  5f7:	e8 00 00 00 00       	call   5fc <.altinstr_replacement+0x5fc>	5f8: R_X86_64_PLT32	__x86_indirect_thunk_r9-0x4
05fc  5fc:	0f ae e8             	lfence
05ff  5ff:	41 ff d1             	call   *%r9
0602  602:	e9 00 00 00 00       	jmp    607 <.altinstr_replacement+0x607>	603: R_X86_64_PLT32	__x86_indirect_thunk_rdi-0x4
0607  607:	0f ae e8             	lfence
060a  60a:	ff e7                	jmp    *%rdi
060c  60c:	0f 01 cb             	stac
060f  60f:	0f ae e8             	lfence
0612  612:	0f 01 ca             	clac
0615  615:	0f 01 ca             	clac
0618  618:	0f 01 cb             	stac
061b  61b:	0f ae e8             	lfence
061e  61e:	e9 00 00 00 00       	jmp    623 <.altinstr_replacement+0x623>	61f: R_X86_64_PC32	.text+0xbd9c8
0623  623:	0f 01 ca             	clac
0626  626:	0f 01 ca             	clac
0629  629:	0f 30                	wrmsr
062b  62b:	e8 00 00 00 00       	call   630 <.altinstr_replacement+0x630>	62c: R_X86_64_PLT32	__x86_indirect_thunk_rdi-0x4
0630  630:	0f ae e8             	lfence
0633  633:	ff d7                	call   *%rdi
0635  635:	0f 01 cb             	stac
0638  638:	0f ae e8             	lfence
063b  63b:	0f 01 ca             	clac
063e  63e:	0f 01 ca             	clac
0641  641:	0f 01 cb             	stac
0644  644:	0f ae e8             	lfence
0647  647:	0f 01 ca             	clac
064a  64a:	0f 01 ca             	clac
064d  64d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0652  652:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0657  657:	f3 48 0f b8 c7       	popcnt %rdi,%rax
065c  65c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0661  661:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0666  666:	e9 00 00 00 00       	jmp    66b <.altinstr_replacement+0x66b>	667: R_X86_64_PC32	.text+0xf7ea2
066b  66b:	e9 00 00 00 00       	jmp    670 <.altinstr_replacement+0x670>	66c: R_X86_64_PC32	.text+0xf7ea9
0670  670:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0675  675:	f3 48 0f b8 c7       	popcnt %rdi,%rax
067a  67a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
067f  67f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0684  684:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0689  689:	f3 48 0f b8 c7       	popcnt %rdi,%rax
068e  68e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0693  693:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0698  698:	f3 48 0f b8 c7       	popcnt %rdi,%rax
069d  69d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06a2  6a2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06a7  6a7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06ac  6ac:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06b1  6b1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06b6  6b6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06bb  6bb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06c0  6c0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06c5  6c5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06ca  6ca:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06cf  6cf:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06d4  6d4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06d9  6d9:	e9 00 00 00 00       	jmp    6de <.altinstr_replacement+0x6de>	6da: R_X86_64_PC32	.text+0x11cd21
06de  6de:	e9 00 00 00 00       	jmp    6e3 <.altinstr_replacement+0x6e3>	6df: R_X86_64_PC32	.text+0x11cd28
06e3  6e3:	0f 0d 0e             	prefetchw (%rsi)
06e6  6e6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06eb  6eb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06f0  6f0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06f5  6f5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06fa  6fa:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06ff  6ff:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0704  704:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0709  709:	f3 48 0f b8 c7       	popcnt %rdi,%rax
070e  70e:	0f 01 cb             	stac
0711  711:	0f ae e8             	lfence
0714  714:	0f 01 ca             	clac
0717  717:	f3 48 0f b8 c7       	popcnt %rdi,%rax
071c  71c:	0f 01 cb             	stac
071f  71f:	0f ae e8             	lfence
0722  722:	0f 01 ca             	clac
0725  725:	0f 01 ca             	clac
0728  728:	0f 01 ca             	clac
072b  72b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0730  730:	0f 01 cb             	stac
0733  733:	0f ae e8             	lfence
0736  736:	0f 01 ca             	clac
0739  739:	0f 01 ca             	clac
073c  73c:	0f 01 cb             	stac
073f  73f:	0f ae e8             	lfence
0742  742:	0f 01 ca             	clac
0745  745:	0f 01 ca             	clac
0748  748:	f3 48 0f b8 c7       	popcnt %rdi,%rax
074d  74d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0752  752:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0757  757:	f3 48 0f b8 c7       	popcnt %rdi,%rax
075c  75c:	e8 00 00 00 00       	call   761 <.altinstr_replacement+0x761>	75d: R_X86_64_PLT32	copy_user_generic_string-0x4
0761  761:	e8 00 00 00 00       	call   766 <.altinstr_replacement+0x766>	762: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0766  766:	e8 00 00 00 00       	call   76b <.altinstr_replacement+0x76b>	767: R_X86_64_PLT32	copy_user_generic_string-0x4
076b  76b:	e8 00 00 00 00       	call   770 <.altinstr_replacement+0x770>	76c: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0770  770:	0f ae e8             	lfence
0773  773:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0778  778:	f3 48 0f b8 c7       	popcnt %rdi,%rax
077d  77d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0782  782:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0787  787:	f3 48 0f b8 c7       	popcnt %rdi,%rax
078c  78c:	e8 00 00 00 00       	call   791 <.altinstr_replacement+0x791>	78d: R_X86_64_PLT32	copy_user_generic_string-0x4
0791  791:	e8 00 00 00 00       	call   796 <.altinstr_replacement+0x796>	792: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0796  796:	e8 00 00 00 00       	call   79b <.altinstr_replacement+0x79b>	797: R_X86_64_PLT32	copy_user_generic_string-0x4
079b  79b:	e8 00 00 00 00       	call   7a0 <.altinstr_replacement+0x7a0>	79c: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
07a0  7a0:	0f 0d 48 f8          	prefetchw -0x8(%rax)
07a4  7a4:	e8 00 00 00 00       	call   7a9 <.altinstr_replacement+0x7a9>	7a5: R_X86_64_PLT32	clear_page_rep-0x4
07a9  7a9:	e8 00 00 00 00       	call   7ae <.altinstr_replacement+0x7ae>	7aa: R_X86_64_PLT32	clear_page_erms-0x4
07ae  7ae:	e8 00 00 00 00       	call   7b3 <.altinstr_replacement+0x7b3>	7af: R_X86_64_PLT32	clear_page_rep-0x4
07b3  7b3:	e8 00 00 00 00       	call   7b8 <.altinstr_replacement+0x7b8>	7b4: R_X86_64_PLT32	clear_page_erms-0x4
07b8  7b8:	e8 00 00 00 00       	call   7bd <.altinstr_replacement+0x7bd>	7b9: R_X86_64_PLT32	clear_page_rep-0x4
07bd  7bd:	e8 00 00 00 00       	call   7c2 <.altinstr_replacement+0x7c2>	7be: R_X86_64_PLT32	clear_page_erms-0x4
07c2  7c2:	e8 00 00 00 00       	call   7c7 <.altinstr_replacement+0x7c7>	7c3: R_X86_64_PLT32	clear_page_rep-0x4
07c7  7c7:	e8 00 00 00 00       	call   7cc <.altinstr_replacement+0x7cc>	7c8: R_X86_64_PLT32	clear_page_erms-0x4
07cc  7cc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07d1  7d1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07d6  7d6:	e8 00 00 00 00       	call   7db <.altinstr_replacement+0x7db>	7d7: R_X86_64_PLT32	clear_page_rep-0x4
07db  7db:	e8 00 00 00 00       	call   7e0 <.altinstr_replacement+0x7e0>	7dc: R_X86_64_PLT32	clear_page_erms-0x4
07e0  7e0:	e8 00 00 00 00       	call   7e5 <.altinstr_replacement+0x7e5>	7e1: R_X86_64_PLT32	copy_user_generic_string-0x4
07e5  7e5:	e8 00 00 00 00       	call   7ea <.altinstr_replacement+0x7ea>	7e6: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
07ea  7ea:	e8 00 00 00 00       	call   7ef <.altinstr_replacement+0x7ef>	7eb: R_X86_64_PLT32	copy_user_generic_string-0x4
07ef  7ef:	e8 00 00 00 00       	call   7f4 <.altinstr_replacement+0x7f4>	7f0: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
07f4  7f4:	e8 00 00 00 00       	call   7f9 <.altinstr_replacement+0x7f9>	7f5: R_X86_64_PLT32	clear_page_rep-0x4
07f9  7f9:	e8 00 00 00 00       	call   7fe <.altinstr_replacement+0x7fe>	7fa: R_X86_64_PLT32	clear_page_erms-0x4
07fe  7fe:	e8 00 00 00 00       	call   803 <.altinstr_replacement+0x803>	7ff: R_X86_64_PLT32	clear_page_rep-0x4
0803  803:	e8 00 00 00 00       	call   808 <.altinstr_replacement+0x808>	804: R_X86_64_PLT32	clear_page_erms-0x4
0808  808:	e8 00 00 00 00       	call   80d <.altinstr_replacement+0x80d>	809: R_X86_64_PLT32	clear_page_rep-0x4
080d  80d:	e8 00 00 00 00       	call   812 <.altinstr_replacement+0x812>	80e: R_X86_64_PLT32	clear_page_erms-0x4
0812  812:	e8 00 00 00 00       	call   817 <.altinstr_replacement+0x817>	813: R_X86_64_PLT32	clear_page_rep-0x4
0817  817:	e8 00 00 00 00       	call   81c <.altinstr_replacement+0x81c>	818: R_X86_64_PLT32	clear_page_erms-0x4
081c  81c:	e8 00 00 00 00       	call   821 <.altinstr_replacement+0x821>	81d: R_X86_64_PLT32	clear_page_rep-0x4
0821  821:	e8 00 00 00 00       	call   826 <.altinstr_replacement+0x826>	822: R_X86_64_PLT32	clear_page_erms-0x4
0826  826:	0f 0d 0f             	prefetchw (%rdi)
0829  829:	0f 0d 4f 40          	prefetchw 0x40(%rdi)
082d  82d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0832  832:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0837  837:	0f 94 c0             	sete   %al
083a  83a:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
083f  83f:	0f 94 c0             	sete   %al
0842  842:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0847  847:	0f 94 c0             	sete   %al
084a  84a:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
084f  84f:	0f 94 c0             	sete   %al
0852  852:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0857  857:	0f 94 c0             	sete   %al
085a  85a:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
085f  85f:	0f 94 c0             	sete   %al
0862  862:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0867  867:	0f 94 c0             	sete   %al
086a  86a:	e8 00 00 00 00       	call   86f <.altinstr_replacement+0x86f>	86b: R_X86_64_PLT32	clear_page_rep-0x4
086f  86f:	e8 00 00 00 00       	call   874 <.altinstr_replacement+0x874>	870: R_X86_64_PLT32	clear_page_erms-0x4
0874  874:	e8 00 00 00 00       	call   879 <.altinstr_replacement+0x879>	875: R_X86_64_PLT32	clear_page_rep-0x4
0879  879:	e8 00 00 00 00       	call   87e <.altinstr_replacement+0x87e>	87a: R_X86_64_PLT32	clear_page_erms-0x4
087e  87e:	e8 00 00 00 00       	call   883 <.altinstr_replacement+0x883>	87f: R_X86_64_PLT32	clear_page_rep-0x4
0883  883:	e8 00 00 00 00       	call   888 <.altinstr_replacement+0x888>	884: R_X86_64_PLT32	clear_page_erms-0x4
0888  888:	0f 01 cb             	stac
088b  88b:	0f ae e8             	lfence
088e  88e:	0f 01 ca             	clac
0891  891:	0f 01 ca             	clac
0894  894:	0f 01 cb             	stac
0897  897:	0f ae e8             	lfence
089a  89a:	0f 01 ca             	clac
089d  89d:	0f 01 ca             	clac
08a0  8a0:	0f 01 cb             	stac
08a3  8a3:	0f ae e8             	lfence
08a6  8a6:	0f 01 ca             	clac
08a9  8a9:	0f 01 ca             	clac
08ac  8ac:	0f 01 cb             	stac
08af  8af:	0f ae e8             	lfence
08b2  8b2:	0f 01 ca             	clac
08b5  8b5:	0f 01 ca             	clac
08b8  8b8:	0f 01 cb             	stac
08bb  8bb:	0f ae e8             	lfence
08be  8be:	0f 01 ca             	clac
08c1  8c1:	0f 01 ca             	clac
08c4  8c4:	0f 01 cb             	stac
08c7  8c7:	0f ae e8             	lfence
08ca  8ca:	0f 01 ca             	clac
08cd  8cd:	0f 01 ca             	clac
08d0  8d0:	0f 01 cb             	stac
08d3  8d3:	0f ae e8             	lfence
08d6  8d6:	0f 01 ca             	clac
08d9  8d9:	0f 01 ca             	clac
08dc  8dc:	0f 01 cb             	stac
08df  8df:	0f ae e8             	lfence
08e2  8e2:	0f 01 ca             	clac
08e5  8e5:	0f 01 ca             	clac
08e8  8e8:	e8 00 00 00 00       	call   8ed <.altinstr_replacement+0x8ed>	8e9: R_X86_64_PLT32	copy_user_generic_string-0x4
08ed  8ed:	e8 00 00 00 00       	call   8f2 <.altinstr_replacement+0x8f2>	8ee: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
08f2  8f2:	e8 00 00 00 00       	call   8f7 <.altinstr_replacement+0x8f7>	8f3: R_X86_64_PLT32	copy_user_generic_string-0x4
08f7  8f7:	e8 00 00 00 00       	call   8fc <.altinstr_replacement+0x8fc>	8f8: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
08fc  8fc:	e8 00 00 00 00       	call   901 <.altinstr_replacement+0x901>	8fd: R_X86_64_PLT32	copy_user_generic_string-0x4
0901  901:	e8 00 00 00 00       	call   906 <.altinstr_replacement+0x906>	902: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0906  906:	0f 01 cb             	stac
0909  909:	0f ae e8             	lfence
090c  90c:	0f 01 ca             	clac
090f  90f:	0f 01 ca             	clac
0912  912:	0f 01 cb             	stac
0915  915:	0f ae e8             	lfence
0918  918:	0f 01 ca             	clac
091b  91b:	0f 01 ca             	clac
091e  91e:	0f 0d 8f 00 09 00 00 	prefetchw 0x900(%rdi)
0925  925:	e8 00 00 00 00       	call   92a <.altinstr_replacement+0x92a>	926: R_X86_64_PLT32	clear_page_rep-0x4
092a  92a:	e8 00 00 00 00       	call   92f <.altinstr_replacement+0x92f>	92b: R_X86_64_PLT32	clear_page_erms-0x4
092f  92f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0934  934:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0939  939:	f3 48 0f b8 c7       	popcnt %rdi,%rax
093e  93e:	f3 0f b8 c7          	popcnt %edi,%eax
0942  942:	f3 0f b8 c7          	popcnt %edi,%eax
0946  946:	e9 00 00 00 00       	jmp    94b <.altinstr_replacement+0x94b>	947: R_X86_64_PC32	.text.unlikely+0x3b04
094b  94b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0950  950:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0955  955:	e8 00 00 00 00       	call   95a <.altinstr_replacement+0x95a>	956: R_X86_64_PLT32	copy_user_generic_string-0x4
095a  95a:	e8 00 00 00 00       	call   95f <.altinstr_replacement+0x95f>	95b: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
095f  95f:	e8 00 00 00 00       	call   964 <.altinstr_replacement+0x964>	960: R_X86_64_PLT32	copy_user_generic_string-0x4
0964  964:	e8 00 00 00 00       	call   969 <.altinstr_replacement+0x969>	965: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0969  969:	0f 01 cb             	stac
096c  96c:	0f ae e8             	lfence
096f  96f:	0f 01 ca             	clac
0972  972:	f3 0f b8 c7          	popcnt %edi,%eax
0976  976:	f3 0f b8 c7          	popcnt %edi,%eax
097a  97a:	e8 00 00 00 00       	call   97f <.altinstr_replacement+0x97f>	97b: R_X86_64_PLT32	copy_user_generic_string-0x4
097f  97f:	e8 00 00 00 00       	call   984 <.altinstr_replacement+0x984>	980: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0984  984:	0f ae e8             	lfence
0987  987:	e8 00 00 00 00       	call   98c <.altinstr_replacement+0x98c>	988: R_X86_64_PLT32	copy_user_generic_string-0x4
098c  98c:	e8 00 00 00 00       	call   991 <.altinstr_replacement+0x991>	98d: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0991  991:	0f 01 cb             	stac
0994  994:	0f ae e8             	lfence
0997  997:	0f 01 ca             	clac
099a  99a:	0f 01 ca             	clac
099d  99d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09a2  9a2:	0f 01 cb             	stac
09a5  9a5:	0f ae e8             	lfence
09a8  9a8:	0f 01 ca             	clac
09ab  9ab:	0f 01 cb             	stac
09ae  9ae:	0f ae e8             	lfence
09b1  9b1:	0f 01 ca             	clac
09b4  9b4:	e9 00 00 00 00       	jmp    9b9 <.altinstr_replacement+0x9b9>	9b5: R_X86_64_PC32	.text+0x45cf7b
09b9  9b9:	e9 00 00 00 00       	jmp    9be <.altinstr_replacement+0x9be>	9ba: R_X86_64_PC32	.text+0x45cfa8
09be  9be:	e8 00 00 00 00       	call   9c3 <.altinstr_replacement+0x9c3>	9bf: R_X86_64_PLT32	copy_user_generic_string-0x4
09c3  9c3:	e8 00 00 00 00       	call   9c8 <.altinstr_replacement+0x9c8>	9c4: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
09c8  9c8:	0f 01 cb             	stac
09cb  9cb:	0f 01 ca             	clac
09ce  9ce:	0f 01 cb             	stac
09d1  9d1:	0f 01 ca             	clac
09d4  9d4:	0f 01 cb             	stac
09d7  9d7:	0f 01 ca             	clac
09da  9da:	0f 01 cb             	stac
09dd  9dd:	0f 01 ca             	clac
09e0  9e0:	0f 01 ca             	clac
09e3  9e3:	0f 01 ca             	clac
09e6  9e6:	0f 01 cb             	stac
09e9  9e9:	0f 01 ca             	clac
09ec  9ec:	0f 01 cb             	stac
09ef  9ef:	0f ae e8             	lfence
09f2  9f2:	0f 01 ca             	clac
09f5  9f5:	0f 01 cb             	stac
09f8  9f8:	0f ae e8             	lfence
09fb  9fb:	0f 01 ca             	clac
09fe  9fe:	0f ae e8             	lfence
0a01  a01:	0f 31                	rdtsc
0a03  a03:	0f 01 f9             	rdtscp
0a06  a06:	0f ae e8             	lfence
0a09  a09:	0f 31                	rdtsc
0a0b  a0b:	0f 01 f9             	rdtscp
0a0e  a0e:	0f ae e8             	lfence
0a11  a11:	0f 31                	rdtsc
0a13  a13:	0f 01 f9             	rdtscp
0a16  a16:	0f ae e8             	lfence
0a19  a19:	0f 31                	rdtsc
0a1b  a1b:	0f 01 f9             	rdtscp
0a1e  a1e:	0f 01 cb             	stac
0a21  a21:	0f 01 ca             	clac
0a24  a24:	0f 01 cb             	stac
0a27  a27:	0f 01 ca             	clac
0a2a  a2a:	0f 01 cb             	stac
0a2d  a2d:	0f 01 ca             	clac
0a30  a30:	0f 01 cb             	stac
0a33  a33:	0f 01 ca             	clac
0a36  a36:	0f 01 cb             	stac
0a39  a39:	0f ae e8             	lfence
0a3c  a3c:	0f 01 ca             	clac
0a3f  a3f:	0f 01 cb             	stac
0a42  a42:	0f ae e8             	lfence
0a45  a45:	0f 01 ca             	clac
0a48  a48:	0f 01 cb             	stac
0a4b  a4b:	0f ae e8             	lfence
0a4e  a4e:	0f 01 ca             	clac
0a51  a51:	0f 01 cb             	stac
0a54  a54:	0f ae e8             	lfence
0a57  a57:	0f 01 ca             	clac
0a5a  a5a:	0f 01 ca             	clac
0a5d  a5d:	e8 00 00 00 00       	call   a62 <.altinstr_replacement+0xa62>	a5e: R_X86_64_PLT32	copy_user_generic_string-0x4
0a62  a62:	e8 00 00 00 00       	call   a67 <.altinstr_replacement+0xa67>	a63: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0a67  a67:	e9 00 00 00 00       	jmp    a6c <.altinstr_replacement+0xa6c>	a68: R_X86_64_PC32	.noinstr.text+0x3b6c
0a6c  a6c:	e9 00 00 00 00       	jmp    a71 <.altinstr_replacement+0xa71>	a6d: R_X86_64_PC32	.text+0x45fa49
0a71  a71:	e9 00 00 00 00       	jmp    a76 <.altinstr_replacement+0xa76>	a72: R_X86_64_PC32	.text+0x45fa9c
0a76  a76:	0f 01 cb             	stac
0a79  a79:	0f 01 ca             	clac
0a7c  a7c:	0f 01 cb             	stac
0a7f  a7f:	0f 01 ca             	clac
0a82  a82:	0f 01 cb             	stac
0a85  a85:	0f 01 ca             	clac
0a88  a88:	0f 01 cb             	stac
0a8b  a8b:	0f 01 ca             	clac
0a8e  a8e:	0f 01 ca             	clac
0a91  a91:	0f ae e8             	lfence
0a94  a94:	ff e0                	jmp    *%rax
0a96  a96:	cc                   	int3
0a97  a97:	ff e0                	jmp    *%rax
0a99  a99:	0f ae e8             	lfence
0a9c  a9c:	ff e1                	jmp    *%rcx
0a9e  a9e:	cc                   	int3
0a9f  a9f:	ff e1                	jmp    *%rcx
0aa1  aa1:	0f ae e8             	lfence
0aa4  aa4:	ff e2                	jmp    *%rdx
0aa6  aa6:	cc                   	int3
0aa7  aa7:	ff e2                	jmp    *%rdx
0aa9  aa9:	0f ae e8             	lfence
0aac  aac:	ff e3                	jmp    *%rbx
0aae  aae:	cc                   	int3
0aaf  aaf:	ff e3                	jmp    *%rbx
0ab1  ab1:	0f ae e8             	lfence
0ab4  ab4:	ff e4                	jmp    *%rsp
0ab6  ab6:	cc                   	int3
0ab7  ab7:	ff e4                	jmp    *%rsp
0ab9  ab9:	0f ae e8             	lfence
0abc  abc:	ff e5                	jmp    *%rbp
0abe  abe:	cc                   	int3
0abf  abf:	ff e5                	jmp    *%rbp
0ac1  ac1:	0f ae e8             	lfence
0ac4  ac4:	ff e6                	jmp    *%rsi
0ac6  ac6:	cc                   	int3
0ac7  ac7:	ff e6                	jmp    *%rsi
0ac9  ac9:	0f ae e8             	lfence
0acc  acc:	ff e7                	jmp    *%rdi
0ace  ace:	cc                   	int3
0acf  acf:	ff e7                	jmp    *%rdi
0ad1  ad1:	0f ae e8             	lfence
0ad4  ad4:	41 ff e0             	jmp    *%r8
0ad7  ad7:	cc                   	int3
0ad8  ad8:	41 ff e0             	jmp    *%r8
0adb  adb:	0f ae e8             	lfence
0ade  ade:	41 ff e1             	jmp    *%r9
0ae1  ae1:	cc                   	int3
0ae2  ae2:	41 ff e1             	jmp    *%r9
0ae5  ae5:	0f ae e8             	lfence
0ae8  ae8:	41 ff e2             	jmp    *%r10
0aeb  aeb:	cc                   	int3
0aec  aec:	41 ff e2             	jmp    *%r10
0aef  aef:	0f ae e8             	lfence
0af2  af2:	41 ff e3             	jmp    *%r11
0af5  af5:	cc                   	int3
0af6  af6:	41 ff e3             	jmp    *%r11
0af9  af9:	0f ae e8             	lfence
0afc  afc:	41 ff e4             	jmp    *%r12
0aff  aff:	cc                   	int3
0b00  b00:	41 ff e4             	jmp    *%r12
0b03  b03:	0f ae e8             	lfence
0b06  b06:	41 ff e5             	jmp    *%r13
0b09  b09:	cc                   	int3
0b0a  b0a:	41 ff e5             	jmp    *%r13
0b0d  b0d:	0f ae e8             	lfence
0b10  b10:	41 ff e6             	jmp    *%r14
0b13  b13:	cc                   	int3
0b14  b14:	41 ff e6             	jmp    *%r14
0b17  b17:	0f ae e8             	lfence
0b1a  b1a:	41 ff e7             	jmp    *%r15
0b1d  b1d:	cc                   	int3
0b1e  b1e:	41 ff e7             	jmp    *%r15
0b21  b21:	e9 00 00 00 00       	jmp    b26 <.altinstr_replacement+0xb26>	b22: R_X86_64_PLT32	srso_untrain_ret-0x4
0b26  b26:	e9 00 00 00 00       	jmp    b2b <.altinstr_replacement+0xb2b>	b27: R_X86_64_PLT32	srso_alias_untrain_ret-0x4
0b2b  b2b:	e8 00 00 00 00       	call   b30 <.altinstr_replacement+0xb30>	b2c: R_X86_64_PLT32	copy_user_generic_string-0x4
0b30  b30:	e8 00 00 00 00       	call   b35 <.altinstr_replacement+0xb35>	b31: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0b35  b35:	0f 01 cb             	stac
0b38  b38:	0f 01 ca             	clac
0b3b  b3b:	66 0f ae 38          	clflushopt (%rax)
0b3f  b3f:	66 0f ae 30          	clwb   (%rax)
0b43  b43:	66 0f ae 38          	clflushopt (%rax)
0b47  b47:	66 0f ae 30          	clwb   (%rax)
0b4b  b4b:	66 0f ae 38          	clflushopt (%rax)
0b4f  b4f:	66 0f ae 30          	clwb   (%rax)
0b53  b53:	66 0f ae 38          	clflushopt (%rax)
0b57  b57:	66 0f ae 30          	clwb   (%rax)
0b5b  b5b:	66 0f ae 38          	clflushopt (%rax)
0b5f  b5f:	66 0f ae 30          	clwb   (%rax)
0b63  b63:	66 0f ae 38          	clflushopt (%rax)
0b67  b67:	66 0f ae 30          	clwb   (%rax)
0b6b  b6b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b70  b70:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b75  b75:	e8 00 00 00 00       	call   b7a <.altinstr_replacement+0xb7a>	b76: R_X86_64_PLT32	copy_user_generic_string-0x4
0b7a  b7a:	e8 00 00 00 00       	call   b7f <.altinstr_replacement+0xb7f>	b7b: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0b7f  b7f:	e8 00 00 00 00       	call   b84 <.altinstr_replacement+0xb84>	b80: R_X86_64_PLT32	copy_user_generic_string-0x4
0b84  b84:	e8 00 00 00 00       	call   b89 <.altinstr_replacement+0xb89>	b85: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0b89  b89:	e9 00 00 00 00       	jmp    b8e <.altinstr_replacement+0xb8e>	b8a: R_X86_64_PC32	.text+0x4dcda3
0b8e  b8e:	e9 00 00 00 00       	jmp    b93 <.altinstr_replacement+0xb93>	b8f: R_X86_64_PC32	.text+0x4dd476
0b93  b93:	e9 00 00 00 00       	jmp    b98 <.altinstr_replacement+0xb98>	b94: R_X86_64_PC32	.text+0x50fa62
0b98  b98:	e9 00 00 00 00       	jmp    b9d <.altinstr_replacement+0xb9d>	b99: R_X86_64_PC32	.text+0x5110ae
0b9d  b9d:	e9 00 00 00 00       	jmp    ba2 <.altinstr_replacement+0xba2>	b9e: R_X86_64_PC32	.text+0x530e43
0ba2  ba2:	e9 00 00 00 00       	jmp    ba7 <.altinstr_replacement+0xba7>	ba3: R_X86_64_PC32	.cpuidle.text+0x6ca
0ba7  ba7:	e9 00 00 00 00       	jmp    bac <.altinstr_replacement+0xbac>	ba8: R_X86_64_PC32	.cpuidle.text+0x788
0bac  bac:	e9 00 00 00 00       	jmp    bb1 <.altinstr_replacement+0xbb1>	bad: R_X86_64_PC32	.text+0x537b53
0bb1  bb1:	e9 00 00 00 00       	jmp    bb6 <.altinstr_replacement+0xbb6>	bb2: R_X86_64_PC32	.text+0x537b7f
0bb6  bb6:	f3 0f b8 c7          	popcnt %edi,%eax
0bba  bba:	e9 00 00 00 00       	jmp    bbf <.altinstr_replacement+0xbbf>	bbb: R_X86_64_PC32	.text+0x59b4f5
0bbf  bbf:	e9 00 00 00 00       	jmp    bc4 <.altinstr_replacement+0xbc4>	bc0: R_X86_64_PC32	.text+0x59b510
0bc4  bc4:	e9 00 00 00 00       	jmp    bc9 <.altinstr_replacement+0xbc9>	bc5: R_X86_64_PC32	.text+0x59bb5a
0bc9  bc9:	e9 00 00 00 00       	jmp    bce <.altinstr_replacement+0xbce>	bca: R_X86_64_PC32	.text+0x59becf
0bce  bce:	e9 00 00 00 00       	jmp    bd3 <.altinstr_replacement+0xbd3>	bcf: R_X86_64_PC32	.text+0x59beee
0bd3  bd3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0bd8  bd8:	f3 0f b8 c7          	popcnt %edi,%eax
0bdc  bdc:	f3 0f b8 c7          	popcnt %edi,%eax
0be0  be0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0be5  be5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0bea  bea:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0bef  bef:	f3 0f b8 c7          	popcnt %edi,%eax
0bf3  bf3:	f3 0f b8 c7          	popcnt %edi,%eax
0bf7  bf7:	f3 0f b8 c7          	popcnt %edi,%eax
0bfb  bfb:	f3 0f b8 c7          	popcnt %edi,%eax
0bff  bff:	f3 0f b8 c7          	popcnt %edi,%eax
0c03  c03:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c08  c08:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c0d  c0d:	f3 0f b8 c7          	popcnt %edi,%eax
0c11  c11:	f3 0f b8 c7          	popcnt %edi,%eax
0c15  c15:	f3 0f b8 c7          	popcnt %edi,%eax
0c19  c19:	f3 0f b8 c7          	popcnt %edi,%eax
0c1d  c1d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c22  c22:	0f 30                	wrmsr
0c24  c24:	0f 30                	wrmsr
0c26  c26:	0f 30                	wrmsr
0c28  c28:	0f 30                	wrmsr
0c2a  c2a:	0f 30                	wrmsr
0c2c  c2c:	0f 30                	wrmsr
0c2e  c2e:	0f 30                	wrmsr
0c30  c30:	0f 30                	wrmsr
0c32  c32:	0f 30                	wrmsr
0c34  c34:	0f 30                	wrmsr
0c36  c36:	0f 30                	wrmsr
0c38  c38:	0f 30                	wrmsr
0c3a  c3a:	0f 30                	wrmsr
0c3c  c3c:	0f 30                	wrmsr
0c3e  c3e:	0f 30                	wrmsr
0c40  c40:	0f 30                	wrmsr
0c42  c42:	0f 30                	wrmsr
0c44  c44:	0f 30                	wrmsr
0c46  c46:	0f 30                	wrmsr
0c48  c48:	0f 30                	wrmsr
0c4a  c4a:	0f 30                	wrmsr
0c4c  c4c:	0f 30                	wrmsr
0c4e  c4e:	0f 30                	wrmsr
0c50  c50:	0f 30                	wrmsr
0c52  c52:	0f 30                	wrmsr
0c54  c54:	0f 30                	wrmsr
0c56  c56:	0f 30                	wrmsr
0c58  c58:	0f 30                	wrmsr
0c5a  c5a:	0f 30                	wrmsr
0c5c  c5c:	0f 30                	wrmsr
0c5e  c5e:	0f 30                	wrmsr
0c60  c60:	0f 30                	wrmsr
0c62  c62:	0f ae e8             	lfence
0c65  c65:	0f 31                	rdtsc
0c67  c67:	0f 01 f9             	rdtscp
0c6a  c6a:	f3 0f b8 c7          	popcnt %edi,%eax
0c6e  c6e:	f3 0f b8 c7          	popcnt %edi,%eax
0c72  c72:	f3 0f b8 c7          	popcnt %edi,%eax
0c76  c76:	f3 0f b8 c7          	popcnt %edi,%eax
0c7a  c7a:	e8 00 00 00 00       	call   c7f <.altinstr_replacement+0xc7f>	c7b: R_X86_64_PLT32	__x86_indirect_thunk_rbx-0x4
0c7f  c7f:	0f ae e8             	lfence
0c82  c82:	ff d3                	call   *%rbx
0c84  c84:	e8 00 00 00 00       	call   c89 <.altinstr_replacement+0xc89>	c85: R_X86_64_PLT32	__x86_indirect_thunk_rax-0x4
0c89  c89:	0f ae e8             	lfence
0c8c  c8c:	ff d0                	call   *%rax
0c8e  c8e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c93  c93:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c98  c98:	f3 0f b8 c7          	popcnt %edi,%eax
0c9c  c9c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ca1  ca1:	f3 0f b8 c7          	popcnt %edi,%eax
0ca5  ca5:	f3 0f b8 c7          	popcnt %edi,%eax
0ca9  ca9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cae  cae:	e8 00 00 00 00       	call   cb3 <.altinstr_replacement+0xcb3>	caf: R_X86_64_PLT32	copy_user_generic_string-0x4
0cb3  cb3:	e8 00 00 00 00       	call   cb8 <.altinstr_replacement+0xcb8>	cb4: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0cb8  cb8:	e8 00 00 00 00       	call   cbd <.altinstr_replacement+0xcbd>	cb9: R_X86_64_PLT32	copy_user_generic_string-0x4
0cbd  cbd:	e8 00 00 00 00       	call   cc2 <.altinstr_replacement+0xcc2>	cbe: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0cc2  cc2:	0f 0d 08             	prefetchw (%rax)
0cc5  cc5:	0f 0d 0a             	prefetchw (%rdx)
0cc8  cc8:	0f 0d 0b             	prefetchw (%rbx)
0ccb  ccb:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
0ccf  ccf:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cd4  cd4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cd9  cd9:	f3 0f b8 c7          	popcnt %edi,%eax
0cdd  cdd:	f3 0f b8 c7          	popcnt %edi,%eax
0ce1  ce1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ce6  ce6:	f3 0f b8 c7          	popcnt %edi,%eax
0cea  cea:	f3 0f b8 c7          	popcnt %edi,%eax
0cee  cee:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cf3  cf3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cf8  cf8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cfd  cfd:	f3 48 0f b8 c7       	popcnt %rdi,%rax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

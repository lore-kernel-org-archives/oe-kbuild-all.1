Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79640A53
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 20:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693080054; x=1724616054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A1OWfzeRyk6PaogoARosyNtH6K9wV/cA8BvxjakapuQ=;
  b=WkYTUTm2GN+17Gi47ZwbnAKRgY4hENs+NQ4IW6y/IPGIahLrvKQzRZME
   qgiuIX477u00KBG1pisD4HDXNSlyDSbz7PXiZaZMES/Lz25GSD9Wsek65
   Qdymh6qwx0U0FvzjYGTq1WrBP3C6gKpVBHod/TebRPGTrSHJ0Si8tVxJY
   O4c1oWrG4kZMouTWfKNFiNKQmaMFFi2laqFMPCVgJti2IiHDdBkuPAei/
   1eG7vTPuwdKVNcDRm+Ud7Cg6mVZPRKOMrIfIH1ICUIG6nOekZbzYIfciA
   Eiwf5C/+698/YxI2cZ5kfSkzgw0cC3sU2yFoj2jK1JnfnLluTQqxCgcyz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="461259060"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="461259060"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 13:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="911618679"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="911618679"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Aug 2023 13:00:49 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZzSi-00052B-31;
	Sat, 26 Aug 2023 20:00:48 +0000
Date: Sun, 27 Aug 2023 04:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [stable:linux-5.10.y 9990/9999] vmlinux.o: warning: objtool:
 .altinstr_replacement+0x802: unsupported relocation in alternatives section
Message-ID: <202308270340.oAEw4RKr-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-001-20230826 (https://download.01.org/0day-ci/archive/20230827/202308270340.oAEw4RKr-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270340.oAEw4RKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270340.oAEw4RKr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .altinstr_replacement+0x802: unsupported relocation in alternatives section


objdump-func vmlinux.o .altinstr_replacement:
0000 0000000000000000 <.altinstr_replacement>:
0000    0:	e8 00 00 00 00       	call   5 <.altinstr_replacement+0x5>	1: R_X86_64_PLT32	clear_page_rep-0x4
0005    5:	e8 00 00 00 00       	call   a <.altinstr_replacement+0xa>	6: R_X86_64_PLT32	clear_page_erms-0x4
000a    a:	e8 00 00 00 00       	call   f <.altinstr_replacement+0xf>	b: R_X86_64_PLT32	entry_untrain_ret-0x4
000f    f:	e8 00 00 00 00       	call   14 <.altinstr_replacement+0x14>	10: R_X86_64_PLT32	entry_ibpb-0x4
0014   14:	49 c7 c4 10 00 00 00 	mov    $0x10,%r12
001b   1b:	e8 01 00 00 00       	call   21 <.altinstr_replacement+0x21>
0020   20:	cc                   	int3
0021   21:	e8 01 00 00 00       	call   27 <.altinstr_replacement+0x27>
0026   26:	cc                   	int3
0027   27:	48 83 c4 10          	add    $0x10,%rsp
002b   2b:	49 ff cc             	dec    %r12
002e   2e:	75 eb                	jne    1b <.altinstr_replacement+0x1b>
0030   30:	0f ae e8             	lfence
0033   33:	e8 01 00 00 00       	call   39 <.altinstr_replacement+0x39>
0038   38:	cc                   	int3
0039   39:	48 83 c4 08          	add    $0x8,%rsp
003d   3d:	0f ae e8             	lfence
0040   40:	e8 00 00 00 00       	call   45 <.altinstr_replacement+0x45>	41: R_X86_64_PLT32	__x86_indirect_thunk_rbx-0x4
0045   45:	0f ae e8             	lfence
0048   48:	ff d3                	call   *%rbx
004a   4a:	0f 01 ca             	clac
004d   4d:	0f 01 ca             	clac
0050   50:	0f 01 ca             	clac
0053   53:	0f 01 ca             	clac
0056   56:	0f 01 ca             	clac
0059   59:	0f 01 ca             	clac
005c   5c:	0f 01 ca             	clac
005f   5f:	0f 01 ca             	clac
0062   62:	0f 01 ca             	clac
0065   65:	0f 01 ca             	clac
0068   68:	0f 01 ca             	clac
006b   6b:	0f 01 ca             	clac
006e   6e:	0f 01 ca             	clac
0071   71:	0f 01 ca             	clac
0074   74:	0f 01 ca             	clac
0077   77:	0f 01 ca             	clac
007a   7a:	0f 01 ca             	clac
007d   7d:	0f 01 ca             	clac
0080   80:	0f 01 ca             	clac
0083   83:	0f 01 ca             	clac
0086   86:	0f 01 ca             	clac
0089   89:	0f 01 ca             	clac
008c   8c:	0f 01 ca             	clac
008f   8f:	0f 01 ca             	clac
0092   92:	0f 01 ca             	clac
0095   95:	0f 01 ca             	clac
0098   98:	0f 01 ca             	clac
009b   9b:	0f 01 ca             	clac
009e   9e:	0f ae f0             	mfence
00a1   a1:	b8 2b 00 00 00       	mov    $0x2b,%eax
00a6   a6:	8e e8                	mov    %eax,%gs
00a8   a8:	e8 00 00 00 00       	call   ad <.altinstr_replacement+0xad>	a9: R_X86_64_PLT32	__x86_indirect_thunk_rsi-0x4
00ad   ad:	0f ae e8             	lfence
00b0   b0:	ff d6                	call   *%rsi
00b2   b2:	0f ae e8             	lfence
00b5   b5:	e8 00 00 00 00       	call   ba <.altinstr_replacement+0xba>	b6: R_X86_64_PLT32	entry_untrain_ret-0x4
00ba   ba:	e8 00 00 00 00       	call   bf <.altinstr_replacement+0xbf>	bb: R_X86_64_PLT32	entry_ibpb-0x4
00bf   bf:	0f ae e8             	lfence
00c2   c2:	e8 00 00 00 00       	call   c7 <.altinstr_replacement+0xc7>	c3: R_X86_64_PLT32	entry_untrain_ret-0x4
00c7   c7:	e8 00 00 00 00       	call   cc <.altinstr_replacement+0xcc>	c8: R_X86_64_PLT32	entry_ibpb-0x4
00cc   cc:	0f ae e8             	lfence
00cf   cf:	0f ae e8             	lfence
00d2   d2:	e8 00 00 00 00       	call   d7 <.altinstr_replacement+0xd7>	d3: R_X86_64_PLT32	entry_untrain_ret-0x4
00d7   d7:	e8 00 00 00 00       	call   dc <.altinstr_replacement+0xdc>	d8: R_X86_64_PLT32	entry_ibpb-0x4
00dc   dc:	0f 01 ca             	clac
00df   df:	0f ae e8             	lfence
00e2   e2:	e8 00 00 00 00       	call   e7 <.altinstr_replacement+0xe7>	e3: R_X86_64_PLT32	entry_untrain_ret-0x4
00e7   e7:	e8 00 00 00 00       	call   ec <.altinstr_replacement+0xec>	e8: R_X86_64_PLT32	entry_ibpb-0x4
00ec   ec:	f3 48 0f b8 c7       	popcnt %rdi,%rax
00f1   f1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
00f6   f6:	0f ae e8             	lfence
00f9   f9:	0f 31                	rdtsc
00fb   fb:	0f 01 f9             	rdtscp
00fe   fe:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0103  103:	e9 00 00 00 00       	jmp    108 <.altinstr_replacement+0x108>	104: R_X86_64_PC32	.text+0xbe97
0108  108:	e9 00 00 00 00       	jmp    10d <.altinstr_replacement+0x10d>	109: R_X86_64_PC32	.text+0xbec5
010d  10d:	e9 00 00 00 00       	jmp    112 <.altinstr_replacement+0x112>	10e: R_X86_64_PC32	.text+0xbf29
0112  112:	e9 00 00 00 00       	jmp    117 <.altinstr_replacement+0x117>	113: R_X86_64_PC32	.text+0xbf64
0117  117:	e9 00 00 00 00       	jmp    11c <.altinstr_replacement+0x11c>	118: R_X86_64_PC32	.text+0xc36a
011c  11c:	e9 00 00 00 00       	jmp    121 <.altinstr_replacement+0x121>	11d: R_X86_64_PC32	.text+0xc7e6
0121  121:	e9 00 00 00 00       	jmp    126 <.altinstr_replacement+0x126>	122: R_X86_64_PC32	.text+0xc7f8
0126  126:	e9 00 00 00 00       	jmp    12b <.altinstr_replacement+0x12b>	127: R_X86_64_PC32	.text+0xc808
012b  12b:	e9 00 00 00 00       	jmp    130 <.altinstr_replacement+0x130>	12c: R_X86_64_PC32	.text+0xc817
0130  130:	e9 00 00 00 00       	jmp    135 <.altinstr_replacement+0x135>	131: R_X86_64_PC32	.text+0xc85e
0135  135:	e9 00 00 00 00       	jmp    13a <.altinstr_replacement+0x13a>	136: R_X86_64_PC32	.text+0xc873
013a  13a:	e9 00 00 00 00       	jmp    13f <.altinstr_replacement+0x13f>	13b: R_X86_64_PC32	.text+0xc898
013f  13f:	e9 00 00 00 00       	jmp    144 <.altinstr_replacement+0x144>	140: R_X86_64_PC32	.text+0xc8b3
0144  144:	e9 00 00 00 00       	jmp    149 <.altinstr_replacement+0x149>	145: R_X86_64_PC32	.text+0xc917
0149  149:	e9 00 00 00 00       	jmp    14e <.altinstr_replacement+0x14e>	14a: R_X86_64_PC32	.text+0xc92c
014e  14e:	e9 00 00 00 00       	jmp    153 <.altinstr_replacement+0x153>	14f: R_X86_64_PC32	.text+0xc94f
0153  153:	e9 00 00 00 00       	jmp    158 <.altinstr_replacement+0x158>	154: R_X86_64_PC32	.text+0xc96d
0158  158:	e9 00 00 00 00       	jmp    15d <.altinstr_replacement+0x15d>	159: R_X86_64_PC32	.text+0xca00
015d  15d:	e9 00 00 00 00       	jmp    162 <.altinstr_replacement+0x162>	15e: R_X86_64_PC32	.text+0xca9a
0162  162:	e9 00 00 00 00       	jmp    167 <.altinstr_replacement+0x167>	163: R_X86_64_PC32	.text+0xcad7
0167  167:	e9 00 00 00 00       	jmp    16c <.altinstr_replacement+0x16c>	168: R_X86_64_PC32	.text+0xcb1b
016c  16c:	e9 00 00 00 00       	jmp    171 <.altinstr_replacement+0x171>	16d: R_X86_64_PC32	.text+0xcbf9
0171  171:	e9 00 00 00 00       	jmp    176 <.altinstr_replacement+0x176>	172: R_X86_64_PC32	.text+0xcc21
0176  176:	e9 00 00 00 00       	jmp    17b <.altinstr_replacement+0x17b>	177: R_X86_64_PC32	.text+0xcc34
017b  17b:	e9 00 00 00 00       	jmp    180 <.altinstr_replacement+0x180>	17c: R_X86_64_PC32	.text+0xcc81
0180  180:	e9 00 00 00 00       	jmp    185 <.altinstr_replacement+0x185>	181: R_X86_64_PC32	.text+0xccaf
0185  185:	e9 00 00 00 00       	jmp    18a <.altinstr_replacement+0x18a>	186: R_X86_64_PC32	.text+0xd138
018a  18a:	e9 00 00 00 00       	jmp    18f <.altinstr_replacement+0x18f>	18b: R_X86_64_PC32	.text+0xd1ab
018f  18f:	e9 00 00 00 00       	jmp    194 <.altinstr_replacement+0x194>	190: R_X86_64_PC32	.noinstr.text+0x7e
0194  194:	e9 00 00 00 00       	jmp    199 <.altinstr_replacement+0x199>	195: R_X86_64_PC32	.noinstr.text+0xa6
0199  199:	e9 00 00 00 00       	jmp    19e <.altinstr_replacement+0x19e>	19a: R_X86_64_PC32	.text+0xface
019e  19e:	e9 00 00 00 00       	jmp    1a3 <.altinstr_replacement+0x1a3>	19f: R_X86_64_PC32	.text+0xfbfb
01a3  1a3:	e9 00 00 00 00       	jmp    1a8 <.altinstr_replacement+0x1a8>	1a4: R_X86_64_PC32	.text+0xff62
01a8  1a8:	e9 00 00 00 00       	jmp    1ad <.altinstr_replacement+0x1ad>	1a9: R_X86_64_PC32	.text+0x10098
01ad  1ad:	e9 00 00 00 00       	jmp    1b2 <.altinstr_replacement+0x1b2>	1ae: R_X86_64_PC32	.text+0x10199
01b2  1b2:	e9 00 00 00 00       	jmp    1b7 <.altinstr_replacement+0x1b7>	1b3: R_X86_64_PC32	.text+0x10244
01b7  1b7:	e9 00 00 00 00       	jmp    1bc <.altinstr_replacement+0x1bc>	1b8: R_X86_64_PC32	.text+0x10300
01bc  1bc:	e9 00 00 00 00       	jmp    1c1 <.altinstr_replacement+0x1c1>	1bd: R_X86_64_PC32	.text+0x10316
01c1  1c1:	e9 00 00 00 00       	jmp    1c6 <.altinstr_replacement+0x1c6>	1c2: R_X86_64_PC32	.text+0x1036d
01c6  1c6:	0f 01 cb             	stac
01c9  1c9:	0f ae e8             	lfence
01cc  1cc:	0f 01 ca             	clac
01cf  1cf:	0f 01 ca             	clac
01d2  1d2:	e9 00 00 00 00       	jmp    1d7 <.altinstr_replacement+0x1d7>	1d3: R_X86_64_PC32	.noinstr.text+0x51d
01d7  1d7:	e9 00 00 00 00       	jmp    1dc <.altinstr_replacement+0x1dc>	1d8: R_X86_64_PC32	.noinstr.text+0x83d
01dc  1dc:	e9 00 00 00 00       	jmp    1e1 <.altinstr_replacement+0x1e1>	1dd: R_X86_64_PC32	.init.text+0x5455
01e1  1e1:	e9 00 00 00 00       	jmp    1e6 <.altinstr_replacement+0x1e6>	1e2: R_X86_64_PC32	.noinstr.text+0x1105
01e6  1e6:	e9 00 00 00 00       	jmp    1eb <.altinstr_replacement+0x1eb>	1e7: R_X86_64_PC32	.text+0x14d06
01eb  1eb:	e9 00 00 00 00       	jmp    1f0 <.altinstr_replacement+0x1f0>	1ec: R_X86_64_PC32	.text+0x156dd
01f0  1f0:	e9 00 00 00 00       	jmp    1f5 <.altinstr_replacement+0x1f5>	1f1: R_X86_64_PC32	.text+0x157b3
01f5  1f5:	e9 00 00 00 00       	jmp    1fa <.altinstr_replacement+0x1fa>	1f6: R_X86_64_PC32	.text+0x15739
01fa  1fa:	e9 00 00 00 00       	jmp    1ff <.altinstr_replacement+0x1ff>	1fb: R_X86_64_PC32	.text+0x158e9
01ff  1ff:	0f ae e8             	lfence
0202  202:	0f 31                	rdtsc
0204  204:	0f 01 f9             	rdtscp
0207  207:	e9 00 00 00 00       	jmp    20c <.altinstr_replacement+0x20c>	208: R_X86_64_PC32	.ref.text+0x393
020c  20c:	e9 00 00 00 00       	jmp    211 <.altinstr_replacement+0x211>	20d: R_X86_64_PC32	.text+0x17924
0211  211:	e9 00 00 00 00       	jmp    216 <.altinstr_replacement+0x216>	212: R_X86_64_PC32	.text+0x1793c
0216  216:	e9 00 00 00 00       	jmp    21b <.altinstr_replacement+0x21b>	217: R_X86_64_PC32	.text+0x17965
021b  21b:	e9 00 00 00 00       	jmp    220 <.altinstr_replacement+0x220>	21c: R_X86_64_PC32	.text+0x1797d
0220  220:	e9 00 00 00 00       	jmp    225 <.altinstr_replacement+0x225>	221: R_X86_64_PC32	.text+0x17ab8
0225  225:	e9 00 00 00 00       	jmp    22a <.altinstr_replacement+0x22a>	226: R_X86_64_PC32	.text+0x17acb
022a  22a:	e9 00 00 00 00       	jmp    22f <.altinstr_replacement+0x22f>	22b: R_X86_64_PC32	.text+0x17ade
022f  22f:	e9 00 00 00 00       	jmp    234 <.altinstr_replacement+0x234>	230: R_X86_64_PC32	.text+0x17b61
0234  234:	e9 00 00 00 00       	jmp    239 <.altinstr_replacement+0x239>	235: R_X86_64_PC32	.text+0x17b05
0239  239:	e9 00 00 00 00       	jmp    23e <.altinstr_replacement+0x23e>	23a: R_X86_64_PC32	.text+0x17b1d
023e  23e:	e9 00 00 00 00       	jmp    243 <.altinstr_replacement+0x243>	23f: R_X86_64_PC32	.text+0x17b46
0243  243:	e9 00 00 00 00       	jmp    248 <.altinstr_replacement+0x248>	244: R_X86_64_PC32	.text+0x17b61
0248  248:	48 0f c7 1f          	xrstors64 (%rdi)
024c  24c:	e9 00 00 00 00       	jmp    251 <.altinstr_replacement+0x251>	24d: R_X86_64_PC32	.text+0x181bb
0251  251:	e9 00 00 00 00       	jmp    256 <.altinstr_replacement+0x256>	252: R_X86_64_PC32	.text+0x181c7
0256  256:	48 0f ae 37          	xsaveopt64 (%rdi)
025a  25a:	48 0f c7 2f          	xsaves64 (%rdi)
025e  25e:	e9 00 00 00 00       	jmp    263 <.altinstr_replacement+0x263>	25f: R_X86_64_PC32	.text+0x1832f
0263  263:	e9 00 00 00 00       	jmp    268 <.altinstr_replacement+0x268>	264: R_X86_64_PC32	.text+0x1838d
0268  268:	e9 00 00 00 00       	jmp    26d <.altinstr_replacement+0x26d>	269: R_X86_64_PC32	.text+0x18402
026d  26d:	e9 00 00 00 00       	jmp    272 <.altinstr_replacement+0x272>	26e: R_X86_64_PC32	.text+0x18431
0272  272:	e8 00 00 00 00       	call   277 <.altinstr_replacement+0x277>	273: R_X86_64_PLT32	copy_user_generic_string-0x4
0277  277:	e8 00 00 00 00       	call   27c <.altinstr_replacement+0x27c>	278: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
027c  27c:	0f 01 cb             	stac
027f  27f:	0f 01 ca             	clac
0282  282:	48 0f c7 1f          	xrstors64 (%rdi)
0286  286:	e9 00 00 00 00       	jmp    28b <.altinstr_replacement+0x28b>	287: R_X86_64_PC32	.text+0x19016
028b  28b:	e9 00 00 00 00       	jmp    290 <.altinstr_replacement+0x290>	28c: R_X86_64_PC32	.text+0x19041
0290  290:	e9 00 00 00 00       	jmp    295 <.altinstr_replacement+0x295>	291: R_X86_64_PC32	.text+0x1913e
0295  295:	e8 00 00 00 00       	call   29a <.altinstr_replacement+0x29a>	296: R_X86_64_PLT32	copy_user_generic_string-0x4
029a  29a:	e8 00 00 00 00       	call   29f <.altinstr_replacement+0x29f>	29b: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
029f  29f:	e9 00 00 00 00       	jmp    2a4 <.altinstr_replacement+0x2a4>	2a0: R_X86_64_PC32	.text+0x19274
02a4  2a4:	0f 01 cb             	stac
02a7  2a7:	0f 01 ca             	clac
02aa  2aa:	e9 00 00 00 00       	jmp    2af <.altinstr_replacement+0x2af>	2ab: R_X86_64_PC32	.text+0x19464
02af  2af:	e9 00 00 00 00       	jmp    2b4 <.altinstr_replacement+0x2b4>	2b0: R_X86_64_PC32	.text+0x1944e
02b4  2b4:	e8 00 00 00 00       	call   2b9 <.altinstr_replacement+0x2b9>	2b5: R_X86_64_PLT32	copy_user_generic_string-0x4
02b9  2b9:	e8 00 00 00 00       	call   2be <.altinstr_replacement+0x2be>	2ba: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
02be  2be:	e9 00 00 00 00       	jmp    2c3 <.altinstr_replacement+0x2c3>	2bf: R_X86_64_PC32	.text+0x194ca
02c3  2c3:	e9 00 00 00 00       	jmp    2c8 <.altinstr_replacement+0x2c8>	2c4: R_X86_64_PC32	.text+0x1963d
02c8  2c8:	e9 00 00 00 00       	jmp    2cd <.altinstr_replacement+0x2cd>	2c9: R_X86_64_PC32	.text+0x1966b
02cd  2cd:	e9 00 00 00 00       	jmp    2d2 <.altinstr_replacement+0x2d2>	2ce: R_X86_64_PC32	.text+0x19701
02d2  2d2:	0f 01 cb             	stac
02d5  2d5:	0f 01 ca             	clac
02d8  2d8:	0f 01 cb             	stac
02db  2db:	0f 01 ca             	clac
02de  2de:	e8 00 00 00 00       	call   2e3 <.altinstr_replacement+0x2e3>	2df: R_X86_64_PLT32	copy_user_generic_string-0x4
02e3  2e3:	e8 00 00 00 00       	call   2e8 <.altinstr_replacement+0x2e8>	2e4: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
02e8  2e8:	e9 00 00 00 00       	jmp    2ed <.altinstr_replacement+0x2ed>	2e9: R_X86_64_PC32	.text+0x198da
02ed  2ed:	e9 00 00 00 00       	jmp    2f2 <.altinstr_replacement+0x2f2>	2ee: R_X86_64_PC32	.text+0x19c1f
02f2  2f2:	e8 00 00 00 00       	call   2f7 <.altinstr_replacement+0x2f7>	2f3: R_X86_64_PLT32	copy_user_generic_string-0x4
02f7  2f7:	e8 00 00 00 00       	call   2fc <.altinstr_replacement+0x2fc>	2f8: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
02fc  2fc:	e8 00 00 00 00       	call   301 <.altinstr_replacement+0x301>	2fd: R_X86_64_PLT32	copy_user_generic_string-0x4
0301  301:	e8 00 00 00 00       	call   306 <.altinstr_replacement+0x306>	302: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0306  306:	e8 00 00 00 00       	call   30b <.altinstr_replacement+0x30b>	307: R_X86_64_PLT32	copy_user_generic_string-0x4
030b  30b:	e8 00 00 00 00       	call   310 <.altinstr_replacement+0x310>	30c: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0310  310:	e9 00 00 00 00       	jmp    315 <.altinstr_replacement+0x315>	311: R_X86_64_PC32	.text+0x1a4f3
0315  315:	e9 00 00 00 00       	jmp    31a <.altinstr_replacement+0x31a>	316: R_X86_64_PC32	.text+0x1c955
031a  31a:	e9 00 00 00 00       	jmp    31f <.altinstr_replacement+0x31f>	31b: R_X86_64_PC32	.text+0x1d01e
031f  31f:	e9 00 00 00 00       	jmp    324 <.altinstr_replacement+0x324>	320: R_X86_64_PC32	.text+0x1d025
0324  324:	e9 00 00 00 00       	jmp    329 <.altinstr_replacement+0x329>	325: R_X86_64_PC32	.text+0x1d065
0329  329:	e9 00 00 00 00       	jmp    32e <.altinstr_replacement+0x32e>	32a: R_X86_64_PC32	.text+0x1d031
032e  32e:	e9 00 00 00 00       	jmp    333 <.altinstr_replacement+0x333>	32f: R_X86_64_PC32	.text+0x1d608
0333  333:	e9 00 00 00 00       	jmp    338 <.altinstr_replacement+0x338>	334: R_X86_64_PC32	.init.text+0x9e44
0338  338:	e9 00 00 00 00       	jmp    33d <.altinstr_replacement+0x33d>	339: R_X86_64_PC32	.init.text+0xa50a
033d  33d:	e9 00 00 00 00       	jmp    342 <.altinstr_replacement+0x342>	33e: R_X86_64_PC32	.init.text+0xa511
0342  342:	0f 30                	wrmsr
0344  344:	f7 f1                	div    %ecx
0346  346:	e9 00 00 00 00       	jmp    34b <.altinstr_replacement+0x34b>	347: R_X86_64_PC32	.text+0x21335
034b  34b:	e9 00 00 00 00       	jmp    350 <.altinstr_replacement+0x350>	34c: R_X86_64_PC32	.text+0x2139c
0350  350:	e9 00 00 00 00       	jmp    355 <.altinstr_replacement+0x355>	351: R_X86_64_PC32	.cpuidle.text+0xd1
0355  355:	e9 00 00 00 00       	jmp    35a <.altinstr_replacement+0x35a>	356: R_X86_64_PC32	.cpuidle.text+0x114
035a  35a:	e9 00 00 00 00       	jmp    35f <.altinstr_replacement+0x35f>	35b: R_X86_64_PC32	.init.text+0xd171
035f  35f:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
0366  366:	87 3c 25 10 d3 5f ff 	xchg   %edi,0xffffffffff5fd310
036d  36d:	87 04 25 00 d3 5f ff 	xchg   %eax,0xffffffffff5fd300
0374  374:	87 b7 00 d0 5f ff    	xchg   %esi,-0xa03000(%rdi)
037a  37a:	e8 00 00 00 00       	call   37f <.altinstr_replacement+0x37f>	37b: R_X86_64_PLT32	__x86_indirect_thunk_r8-0x4
037f  37f:	0f ae e8             	lfence
0382  382:	41 ff d0             	call   *%r8
0385  385:	0f ae e8             	lfence
0388  388:	0f 31                	rdtsc
038a  38a:	0f 01 f9             	rdtscp
038d  38d:	e8 00 00 00 00       	call   392 <.altinstr_replacement+0x392>	38e: R_X86_64_PLT32	clear_page_rep-0x4
0392  392:	e8 00 00 00 00       	call   397 <.altinstr_replacement+0x397>	393: R_X86_64_PLT32	clear_page_erms-0x4
0397  397:	e8 00 00 00 00       	call   39c <.altinstr_replacement+0x39c>	398: R_X86_64_PLT32	clear_page_rep-0x4
039c  39c:	e8 00 00 00 00       	call   3a1 <.altinstr_replacement+0x3a1>	39d: R_X86_64_PLT32	clear_page_erms-0x4
03a1  3a1:	e9 00 00 00 00       	jmp    3a6 <.altinstr_replacement+0x3a6>	3a2: R_X86_64_PC32	.init.text+0xf39a
03a6  3a6:	e8 00 00 00 00       	call   3ab <.altinstr_replacement+0x3ab>	3a7: R_X86_64_PLT32	clear_page_rep-0x4
03ab  3ab:	e8 00 00 00 00       	call   3b0 <.altinstr_replacement+0x3b0>	3ac: R_X86_64_PLT32	clear_page_erms-0x4
03b0  3b0:	0f 0d 88 a8 00 00 00 	prefetchw 0xa8(%rax)
03b7  3b7:	e9 00 00 00 00       	jmp    3bc <.altinstr_replacement+0x3bc>	3b8: R_X86_64_PC32	.noinstr.text+0x1874
03bc  3bc:	e9 00 00 00 00       	jmp    3c1 <.altinstr_replacement+0x3c1>	3bd: R_X86_64_PC32	.text+0x2c953
03c1  3c1:	e9 00 00 00 00       	jmp    3c6 <.altinstr_replacement+0x3c6>	3c2: R_X86_64_PC32	.text+0x2ca2c
03c6  3c6:	48 0f c7 1f          	xrstors64 (%rdi)
03ca  3ca:	0f 30                	wrmsr
03cc  3cc:	e9 00 00 00 00       	jmp    3d1 <.altinstr_replacement+0x3d1>	3cd: R_X86_64_PC32	.text+0x2d900
03d1  3d1:	e9 00 00 00 00       	jmp    3d6 <.altinstr_replacement+0x3d6>	3d2: R_X86_64_PC32	.text+0x2da09
03d6  3d6:	e9 00 00 00 00       	jmp    3db <.altinstr_replacement+0x3db>	3d7: R_X86_64_PC32	.text+0x2dc09
03db  3db:	e9 00 00 00 00       	jmp    3e0 <.altinstr_replacement+0x3e0>	3dc: R_X86_64_PC32	.text+0x2e080
03e0  3e0:	e9 00 00 00 00       	jmp    3e5 <.altinstr_replacement+0x3e5>	3e1: R_X86_64_PC32	.text+0x2dfda
03e5  3e5:	e9 00 00 00 00       	jmp    3ea <.altinstr_replacement+0x3ea>	3e6: R_X86_64_PC32	.text+0x2e78b
03ea  3ea:	66 0f ae 38          	clflushopt (%rax)
03ee  3ee:	e9 00 00 00 00       	jmp    3f3 <.altinstr_replacement+0x3f3>	3ef: R_X86_64_PC32	.text+0x306f9
03f3  3f3:	e8 00 00 00 00       	call   3f8 <.altinstr_replacement+0x3f8>	3f4: R_X86_64_PLT32	__x86_indirect_thunk_r9-0x4
03f8  3f8:	0f ae e8             	lfence
03fb  3fb:	41 ff d1             	call   *%r9
03fe  3fe:	e9 00 00 00 00       	jmp    403 <.altinstr_replacement+0x403>	3ff: R_X86_64_PLT32	__x86_indirect_thunk_rdi-0x4
0403  403:	0f ae e8             	lfence
0406  406:	ff e7                	jmp    *%rdi
0408  408:	0f 30                	wrmsr
040a  40a:	e9 00 00 00 00       	jmp    40f <.altinstr_replacement+0x40f>	40b: R_X86_64_PC32	.init.text+0x12676
040f  40f:	e8 00 00 00 00       	call   414 <.altinstr_replacement+0x414>	410: R_X86_64_PLT32	__x86_indirect_thunk_rdi-0x4
0414  414:	0f ae e8             	lfence
0417  417:	ff d7                	call   *%rdi
0419  419:	e9 00 00 00 00       	jmp    41e <.altinstr_replacement+0x41e>	41a: R_X86_64_PC32	.text+0x6d6ce
041e  41e:	e9 00 00 00 00       	jmp    423 <.altinstr_replacement+0x423>	41f: R_X86_64_PC32	.text+0x6e9cf
0423  423:	0f 01 cb             	stac
0426  426:	0f ae e8             	lfence
0429  429:	0f 01 ca             	clac
042c  42c:	0f 01 ca             	clac
042f  42f:	e9 00 00 00 00       	jmp    434 <.altinstr_replacement+0x434>	430: R_X86_64_PC32	.text+0x90b82
0434  434:	e9 00 00 00 00       	jmp    439 <.altinstr_replacement+0x439>	435: R_X86_64_PC32	.text+0x90b89
0439  439:	e9 00 00 00 00       	jmp    43e <.altinstr_replacement+0x43e>	43a: R_X86_64_PC32	.text+0x9f1bf
043e  43e:	e9 00 00 00 00       	jmp    443 <.altinstr_replacement+0x443>	43f: R_X86_64_PC32	.text+0x9f1c6
0443  443:	e8 00 00 00 00       	call   448 <.altinstr_replacement+0x448>	444: R_X86_64_PLT32	clear_page_rep-0x4
0448  448:	e8 00 00 00 00       	call   44d <.altinstr_replacement+0x44d>	449: R_X86_64_PLT32	clear_page_erms-0x4
044d  44d:	e8 00 00 00 00       	call   452 <.altinstr_replacement+0x452>	44e: R_X86_64_PLT32	clear_page_rep-0x4
0452  452:	e8 00 00 00 00       	call   457 <.altinstr_replacement+0x457>	453: R_X86_64_PLT32	clear_page_erms-0x4
0457  457:	e8 00 00 00 00       	call   45c <.altinstr_replacement+0x45c>	458: R_X86_64_PLT32	clear_page_rep-0x4
045c  45c:	e8 00 00 00 00       	call   461 <.altinstr_replacement+0x461>	45d: R_X86_64_PLT32	clear_page_erms-0x4
0461  461:	e8 00 00 00 00       	call   466 <.altinstr_replacement+0x466>	462: R_X86_64_PLT32	clear_page_rep-0x4
0466  466:	e8 00 00 00 00       	call   46b <.altinstr_replacement+0x46b>	467: R_X86_64_PLT32	clear_page_erms-0x4
046b  46b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0470  470:	e8 00 00 00 00       	call   475 <.altinstr_replacement+0x475>	471: R_X86_64_PLT32	clear_page_rep-0x4
0475  475:	e8 00 00 00 00       	call   47a <.altinstr_replacement+0x47a>	476: R_X86_64_PLT32	clear_page_erms-0x4
047a  47a:	e8 00 00 00 00       	call   47f <.altinstr_replacement+0x47f>	47b: R_X86_64_PLT32	copy_user_generic_string-0x4
047f  47f:	e8 00 00 00 00       	call   484 <.altinstr_replacement+0x484>	480: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0484  484:	e8 00 00 00 00       	call   489 <.altinstr_replacement+0x489>	485: R_X86_64_PLT32	copy_user_generic_string-0x4
0489  489:	e8 00 00 00 00       	call   48e <.altinstr_replacement+0x48e>	48a: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
048e  48e:	0f ae e8             	lfence
0491  491:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0496  496:	f3 48 0f b8 c7       	popcnt %rdi,%rax
049b  49b:	e8 00 00 00 00       	call   4a0 <.altinstr_replacement+0x4a0>	49c: R_X86_64_PLT32	copy_user_generic_string-0x4
04a0  4a0:	e8 00 00 00 00       	call   4a5 <.altinstr_replacement+0x4a5>	4a1: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
04a5  4a5:	e8 00 00 00 00       	call   4aa <.altinstr_replacement+0x4aa>	4a6: R_X86_64_PLT32	copy_user_generic_string-0x4
04aa  4aa:	e8 00 00 00 00       	call   4af <.altinstr_replacement+0x4af>	4ab: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
04af  4af:	0f 0d 48 f8          	prefetchw -0x8(%rax)
04b3  4b3:	e8 00 00 00 00       	call   4b8 <.altinstr_replacement+0x4b8>	4b4: R_X86_64_PLT32	clear_page_rep-0x4
04b8  4b8:	e8 00 00 00 00       	call   4bd <.altinstr_replacement+0x4bd>	4b9: R_X86_64_PLT32	clear_page_erms-0x4
04bd  4bd:	e8 00 00 00 00       	call   4c2 <.altinstr_replacement+0x4c2>	4be: R_X86_64_PLT32	clear_page_rep-0x4
04c2  4c2:	e8 00 00 00 00       	call   4c7 <.altinstr_replacement+0x4c7>	4c3: R_X86_64_PLT32	clear_page_erms-0x4
04c7  4c7:	e8 00 00 00 00       	call   4cc <.altinstr_replacement+0x4cc>	4c8: R_X86_64_PLT32	copy_user_generic_string-0x4
04cc  4cc:	e8 00 00 00 00       	call   4d1 <.altinstr_replacement+0x4d1>	4cd: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
04d1  4d1:	e8 00 00 00 00       	call   4d6 <.altinstr_replacement+0x4d6>	4d2: R_X86_64_PLT32	copy_user_generic_string-0x4
04d6  4d6:	e8 00 00 00 00       	call   4db <.altinstr_replacement+0x4db>	4d7: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
04db  4db:	e8 00 00 00 00       	call   4e0 <.altinstr_replacement+0x4e0>	4dc: R_X86_64_PLT32	clear_page_rep-0x4
04e0  4e0:	e8 00 00 00 00       	call   4e5 <.altinstr_replacement+0x4e5>	4e1: R_X86_64_PLT32	clear_page_erms-0x4
04e5  4e5:	e8 00 00 00 00       	call   4ea <.altinstr_replacement+0x4ea>	4e6: R_X86_64_PLT32	clear_page_rep-0x4
04ea  4ea:	e8 00 00 00 00       	call   4ef <.altinstr_replacement+0x4ef>	4eb: R_X86_64_PLT32	clear_page_erms-0x4
04ef  4ef:	e8 00 00 00 00       	call   4f4 <.altinstr_replacement+0x4f4>	4f0: R_X86_64_PLT32	clear_page_rep-0x4
04f4  4f4:	e8 00 00 00 00       	call   4f9 <.altinstr_replacement+0x4f9>	4f5: R_X86_64_PLT32	clear_page_erms-0x4
04f9  4f9:	0f 0d 0f             	prefetchw (%rdi)
04fc  4fc:	41 0f 0d 48 40       	prefetchw 0x40(%r8)
0501  501:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0506  506:	f3 48 0f b8 c7       	popcnt %rdi,%rax
050b  50b:	48 0f c7 0f          	cmpxchg16b (%rdi)
050f  50f:	0f 94 c0             	sete   %al
0512  512:	48 0f c7 0f          	cmpxchg16b (%rdi)
0516  516:	0f 94 c0             	sete   %al
0519  519:	48 0f c7 0f          	cmpxchg16b (%rdi)
051d  51d:	0f 94 c0             	sete   %al
0520  520:	48 0f c7 0f          	cmpxchg16b (%rdi)
0524  524:	0f 94 c0             	sete   %al
0527  527:	48 0f c7 0f          	cmpxchg16b (%rdi)
052b  52b:	0f 94 c0             	sete   %al
052e  52e:	48 0f c7 0f          	cmpxchg16b (%rdi)
0532  532:	0f 94 c0             	sete   %al
0535  535:	48 0f c7 0f          	cmpxchg16b (%rdi)
0539  539:	0f 94 c0             	sete   %al
053c  53c:	0f 01 cb             	stac
053f  53f:	0f ae e8             	lfence
0542  542:	0f 01 ca             	clac
0545  545:	0f 01 ca             	clac
0548  548:	0f 01 cb             	stac
054b  54b:	0f ae e8             	lfence
054e  54e:	0f 01 ca             	clac
0551  551:	0f 01 ca             	clac
0554  554:	0f 01 cb             	stac
0557  557:	0f ae e8             	lfence
055a  55a:	0f 01 ca             	clac
055d  55d:	0f 01 ca             	clac
0560  560:	e8 00 00 00 00       	call   565 <.altinstr_replacement+0x565>	561: R_X86_64_PLT32	copy_user_generic_string-0x4
0565  565:	e8 00 00 00 00       	call   56a <.altinstr_replacement+0x56a>	566: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
056a  56a:	0f 01 cb             	stac
056d  56d:	0f ae e8             	lfence
0570  570:	0f 01 ca             	clac
0573  573:	0f 01 ca             	clac
0576  576:	0f 01 cb             	stac
0579  579:	0f ae e8             	lfence
057c  57c:	0f 01 ca             	clac
057f  57f:	0f 01 ca             	clac
0582  582:	0f 0d 8f 90 08 00 00 	prefetchw 0x890(%rdi)
0589  589:	e8 00 00 00 00       	call   58e <.altinstr_replacement+0x58e>	58a: R_X86_64_PLT32	clear_page_rep-0x4
058e  58e:	e8 00 00 00 00       	call   593 <.altinstr_replacement+0x593>	58f: R_X86_64_PLT32	clear_page_erms-0x4
0593  593:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
0597  597:	f3 48 0f b8 c7       	popcnt %rdi,%rax
059c  59c:	f3 0f b8 c7          	popcnt %edi,%eax
05a0  5a0:	e8 00 00 00 00       	call   5a5 <.altinstr_replacement+0x5a5>	5a1: R_X86_64_PLT32	clear_page_rep-0x4
05a5  5a5:	e8 00 00 00 00       	call   5aa <.altinstr_replacement+0x5aa>	5a6: R_X86_64_PLT32	clear_page_erms-0x4
05aa  5aa:	e8 00 00 00 00       	call   5af <.altinstr_replacement+0x5af>	5ab: R_X86_64_PLT32	clear_page_rep-0x4
05af  5af:	e8 00 00 00 00       	call   5b4 <.altinstr_replacement+0x5b4>	5b0: R_X86_64_PLT32	clear_page_erms-0x4
05b4  5b4:	e8 00 00 00 00       	call   5b9 <.altinstr_replacement+0x5b9>	5b5: R_X86_64_PLT32	clear_page_rep-0x4
05b9  5b9:	e8 00 00 00 00       	call   5be <.altinstr_replacement+0x5be>	5ba: R_X86_64_PLT32	clear_page_erms-0x4
05be  5be:	e8 00 00 00 00       	call   5c3 <.altinstr_replacement+0x5c3>	5bf: R_X86_64_PLT32	clear_page_rep-0x4
05c3  5c3:	e8 00 00 00 00       	call   5c8 <.altinstr_replacement+0x5c8>	5c4: R_X86_64_PLT32	clear_page_erms-0x4
05c8  5c8:	f3 0f b8 c7          	popcnt %edi,%eax
05cc  5cc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
05d1  5d1:	f3 0f b8 c7          	popcnt %edi,%eax
05d5  5d5:	f3 0f b8 c7          	popcnt %edi,%eax
05d9  5d9:	e8 00 00 00 00       	call   5de <.altinstr_replacement+0x5de>	5da: R_X86_64_PLT32	clear_page_rep-0x4
05de  5de:	e8 00 00 00 00       	call   5e3 <.altinstr_replacement+0x5e3>	5df: R_X86_64_PLT32	clear_page_erms-0x4
05e3  5e3:	e8 00 00 00 00       	call   5e8 <.altinstr_replacement+0x5e8>	5e4: R_X86_64_PLT32	clear_page_rep-0x4
05e8  5e8:	e8 00 00 00 00       	call   5ed <.altinstr_replacement+0x5ed>	5e9: R_X86_64_PLT32	clear_page_erms-0x4
05ed  5ed:	f3 48 0f b8 c7       	popcnt %rdi,%rax
05f2  5f2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
05f7  5f7:	0f 0d 0b             	prefetchw (%rbx)
05fa  5fa:	41 0f 0d 0c 24       	prefetchw (%r12)
05ff  5ff:	f3 0f b8 c7          	popcnt %edi,%eax
0603  603:	f3 0f b8 c7          	popcnt %edi,%eax
0607  607:	f3 0f b8 c7          	popcnt %edi,%eax
060b  60b:	f3 0f b8 c7          	popcnt %edi,%eax
060f  60f:	f3 0f b8 c7          	popcnt %edi,%eax
0613  613:	f3 0f b8 c7          	popcnt %edi,%eax
0617  617:	f3 0f b8 c7          	popcnt %edi,%eax
061b  61b:	f3 0f b8 c7          	popcnt %edi,%eax
061f  61f:	e9 00 00 00 00       	jmp    624 <.altinstr_replacement+0x624>	620: R_X86_64_PC32	.text.unlikely+0xe2b9
0624  624:	e9 00 00 00 00       	jmp    629 <.altinstr_replacement+0x629>	625: R_X86_64_PC32	.text.unlikely+0xe2cf
0629  629:	e9 00 00 00 00       	jmp    62e <.altinstr_replacement+0x62e>	62a: R_X86_64_PC32	.text.unlikely+0xe2e4
062e  62e:	f3 0f b8 c7          	popcnt %edi,%eax
0632  632:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0637  637:	f3 48 0f b8 c7       	popcnt %rdi,%rax
063c  63c:	e8 00 00 00 00       	call   641 <.altinstr_replacement+0x641>	63d: R_X86_64_PLT32	copy_user_generic_string-0x4
0641  641:	e8 00 00 00 00       	call   646 <.altinstr_replacement+0x646>	642: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0646  646:	e8 00 00 00 00       	call   64b <.altinstr_replacement+0x64b>	647: R_X86_64_PLT32	copy_user_generic_string-0x4
064b  64b:	e8 00 00 00 00       	call   650 <.altinstr_replacement+0x650>	64c: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0650  650:	0f 01 cb             	stac
0653  653:	0f ae e8             	lfence
0656  656:	0f 01 ca             	clac
0659  659:	0f 01 ca             	clac
065c  65c:	f3 0f b8 c7          	popcnt %edi,%eax
0660  660:	0f ae e8             	lfence
0663  663:	e8 00 00 00 00       	call   668 <.altinstr_replacement+0x668>	664: R_X86_64_PLT32	copy_user_generic_string-0x4
0668  668:	e8 00 00 00 00       	call   66d <.altinstr_replacement+0x66d>	669: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
066d  66d:	0f 01 cb             	stac
0670  670:	0f ae e8             	lfence
0673  673:	0f 01 ca             	clac
0676  676:	0f 01 ca             	clac
0679  679:	e8 00 00 00 00       	call   67e <.altinstr_replacement+0x67e>	67a: R_X86_64_PLT32	copy_user_generic_string-0x4
067e  67e:	e8 00 00 00 00       	call   683 <.altinstr_replacement+0x683>	67f: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0683  683:	0f 01 cb             	stac
0686  686:	0f ae e8             	lfence
0689  689:	0f 01 ca             	clac
068c  68c:	0f 01 cb             	stac
068f  68f:	0f ae e8             	lfence
0692  692:	0f 01 ca             	clac
0695  695:	e9 00 00 00 00       	jmp    69a <.altinstr_replacement+0x69a>	696: R_X86_64_PC32	.text+0x550dd5
069a  69a:	e9 00 00 00 00       	jmp    69f <.altinstr_replacement+0x69f>	69b: R_X86_64_PC32	.text+0x550df6
069f  69f:	e8 00 00 00 00       	call   6a4 <.altinstr_replacement+0x6a4>	6a0: R_X86_64_PLT32	copy_user_generic_string-0x4
06a4  6a4:	e8 00 00 00 00       	call   6a9 <.altinstr_replacement+0x6a9>	6a5: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
06a9  6a9:	0f 01 cb             	stac
06ac  6ac:	0f 01 ca             	clac
06af  6af:	0f 01 cb             	stac
06b2  6b2:	0f 01 ca             	clac
06b5  6b5:	0f 01 cb             	stac
06b8  6b8:	0f 01 ca             	clac
06bb  6bb:	0f 01 cb             	stac
06be  6be:	0f 01 ca             	clac
06c1  6c1:	0f 01 ca             	clac
06c4  6c4:	0f 01 ca             	clac
06c7  6c7:	0f 01 cb             	stac
06ca  6ca:	0f 01 ca             	clac
06cd  6cd:	0f 01 cb             	stac
06d0  6d0:	0f ae e8             	lfence
06d3  6d3:	0f 01 ca             	clac
06d6  6d6:	0f 01 cb             	stac
06d9  6d9:	0f ae e8             	lfence
06dc  6dc:	0f 01 ca             	clac
06df  6df:	0f ae e8             	lfence
06e2  6e2:	0f 31                	rdtsc
06e4  6e4:	0f 01 f9             	rdtscp
06e7  6e7:	0f ae e8             	lfence
06ea  6ea:	0f 31                	rdtsc
06ec  6ec:	0f 01 f9             	rdtscp
06ef  6ef:	0f ae e8             	lfence
06f2  6f2:	0f 31                	rdtsc
06f4  6f4:	0f 01 f9             	rdtscp
06f7  6f7:	0f ae e8             	lfence
06fa  6fa:	0f 31                	rdtsc
06fc  6fc:	0f 01 f9             	rdtscp
06ff  6ff:	0f 01 cb             	stac
0702  702:	0f 01 ca             	clac
0705  705:	0f 01 cb             	stac
0708  708:	0f 01 ca             	clac
070b  70b:	0f 01 cb             	stac
070e  70e:	0f 01 ca             	clac
0711  711:	0f 01 cb             	stac
0714  714:	0f 01 ca             	clac
0717  717:	0f 01 cb             	stac
071a  71a:	0f ae e8             	lfence
071d  71d:	0f 01 ca             	clac
0720  720:	0f 01 cb             	stac
0723  723:	0f ae e8             	lfence
0726  726:	0f 01 ca             	clac
0729  729:	0f 01 cb             	stac
072c  72c:	0f ae e8             	lfence
072f  72f:	0f 01 ca             	clac
0732  732:	0f 01 cb             	stac
0735  735:	0f ae e8             	lfence
0738  738:	0f 01 ca             	clac
073b  73b:	0f 01 ca             	clac
073e  73e:	e8 00 00 00 00       	call   743 <.altinstr_replacement+0x743>	73f: R_X86_64_PLT32	copy_user_generic_string-0x4
0743  743:	e8 00 00 00 00       	call   748 <.altinstr_replacement+0x748>	744: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0748  748:	e9 00 00 00 00       	jmp    74d <.altinstr_replacement+0x74d>	749: R_X86_64_PC32	.noinstr.text+0x23fc
074d  74d:	e9 00 00 00 00       	jmp    752 <.altinstr_replacement+0x752>	74e: R_X86_64_PC32	.text+0x5538f9
0752  752:	e9 00 00 00 00       	jmp    757 <.altinstr_replacement+0x757>	753: R_X86_64_PC32	.text+0x55394c
0757  757:	0f 01 cb             	stac
075a  75a:	0f 01 ca             	clac
075d  75d:	0f 01 cb             	stac
0760  760:	0f 01 ca             	clac
0763  763:	0f 01 cb             	stac
0766  766:	0f 01 ca             	clac
0769  769:	0f 01 cb             	stac
076c  76c:	0f 01 ca             	clac
076f  76f:	0f 01 ca             	clac
0772  772:	0f ae e8             	lfence
0775  775:	ff e0                	jmp    *%rax
0777  777:	cc                   	int3
0778  778:	ff e0                	jmp    *%rax
077a  77a:	0f ae e8             	lfence
077d  77d:	ff e1                	jmp    *%rcx
077f  77f:	cc                   	int3
0780  780:	ff e1                	jmp    *%rcx
0782  782:	0f ae e8             	lfence
0785  785:	ff e2                	jmp    *%rdx
0787  787:	cc                   	int3
0788  788:	ff e2                	jmp    *%rdx
078a  78a:	0f ae e8             	lfence
078d  78d:	ff e3                	jmp    *%rbx
078f  78f:	cc                   	int3
0790  790:	ff e3                	jmp    *%rbx
0792  792:	0f ae e8             	lfence
0795  795:	ff e4                	jmp    *%rsp
0797  797:	cc                   	int3
0798  798:	ff e4                	jmp    *%rsp
079a  79a:	0f ae e8             	lfence
079d  79d:	ff e5                	jmp    *%rbp
079f  79f:	cc                   	int3
07a0  7a0:	ff e5                	jmp    *%rbp
07a2  7a2:	0f ae e8             	lfence
07a5  7a5:	ff e6                	jmp    *%rsi
07a7  7a7:	cc                   	int3
07a8  7a8:	ff e6                	jmp    *%rsi
07aa  7aa:	0f ae e8             	lfence
07ad  7ad:	ff e7                	jmp    *%rdi
07af  7af:	cc                   	int3
07b0  7b0:	ff e7                	jmp    *%rdi
07b2  7b2:	0f ae e8             	lfence
07b5  7b5:	41 ff e0             	jmp    *%r8
07b8  7b8:	cc                   	int3
07b9  7b9:	41 ff e0             	jmp    *%r8
07bc  7bc:	0f ae e8             	lfence
07bf  7bf:	41 ff e1             	jmp    *%r9
07c2  7c2:	cc                   	int3
07c3  7c3:	41 ff e1             	jmp    *%r9
07c6  7c6:	0f ae e8             	lfence
07c9  7c9:	41 ff e2             	jmp    *%r10
07cc  7cc:	cc                   	int3
07cd  7cd:	41 ff e2             	jmp    *%r10
07d0  7d0:	0f ae e8             	lfence
07d3  7d3:	41 ff e3             	jmp    *%r11
07d6  7d6:	cc                   	int3
07d7  7d7:	41 ff e3             	jmp    *%r11
07da  7da:	0f ae e8             	lfence
07dd  7dd:	41 ff e4             	jmp    *%r12
07e0  7e0:	cc                   	int3
07e1  7e1:	41 ff e4             	jmp    *%r12
07e4  7e4:	0f ae e8             	lfence
07e7  7e7:	41 ff e5             	jmp    *%r13
07ea  7ea:	cc                   	int3
07eb  7eb:	41 ff e5             	jmp    *%r13
07ee  7ee:	0f ae e8             	lfence
07f1  7f1:	41 ff e6             	jmp    *%r14
07f4  7f4:	cc                   	int3
07f5  7f5:	41 ff e6             	jmp    *%r14
07f8  7f8:	0f ae e8             	lfence
07fb  7fb:	41 ff e7             	jmp    *%r15
07fe  7fe:	cc                   	int3
07ff  7ff:	41 ff e7             	jmp    *%r15
0802  802:	e9 00 00 00 00       	jmp    807 <.altinstr_replacement+0x807>	803: R_X86_64_PLT32	srso_untrain_ret-0x4
0807  807:	e9 00 00 00 00       	jmp    80c <.altinstr_replacement+0x80c>	808: R_X86_64_PLT32	srso_alias_untrain_ret-0x4
080c  80c:	e8 00 00 00 00       	call   811 <.altinstr_replacement+0x811>	80d: R_X86_64_PLT32	copy_user_generic_string-0x4
0811  811:	e8 00 00 00 00       	call   816 <.altinstr_replacement+0x816>	812: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0816  816:	0f 01 cb             	stac
0819  819:	0f 01 ca             	clac
081c  81c:	66 0f ae 38          	clflushopt (%rax)
0820  820:	66 0f ae 30          	clwb   (%rax)
0824  824:	e9 00 00 00 00       	jmp    829 <.altinstr_replacement+0x829>	825: R_X86_64_PC32	.text+0x57ffad
0829  829:	e9 00 00 00 00       	jmp    82e <.altinstr_replacement+0x82e>	82a: R_X86_64_PC32	.text+0x580054
082e  82e:	e9 00 00 00 00       	jmp    833 <.altinstr_replacement+0x833>	82f: R_X86_64_PC32	.text+0x58010b
0833  833:	e9 00 00 00 00       	jmp    838 <.altinstr_replacement+0x838>	834: R_X86_64_PC32	.text+0x5a49b7
0838  838:	e9 00 00 00 00       	jmp    83d <.altinstr_replacement+0x83d>	839: R_X86_64_PC32	.cpuidle.text+0x3ab
083d  83d:	e9 00 00 00 00       	jmp    842 <.altinstr_replacement+0x842>	83e: R_X86_64_PC32	.cpuidle.text+0x434
0842  842:	e9 00 00 00 00       	jmp    847 <.altinstr_replacement+0x847>	843: R_X86_64_PC32	.text+0x5bf66b
0847  847:	e9 00 00 00 00       	jmp    84c <.altinstr_replacement+0x84c>	848: R_X86_64_PC32	.text+0x5fccc1
084c  84c:	e9 00 00 00 00       	jmp    851 <.altinstr_replacement+0x851>	84d: R_X86_64_PC32	.text+0x5fcd3a
0851  851:	f3 0f b8 c7          	popcnt %edi,%eax
0855  855:	f3 0f b8 c7          	popcnt %edi,%eax
0859  859:	f3 0f b8 c7          	popcnt %edi,%eax
085d  85d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0862  862:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0867  867:	e8 00 00 00 00       	call   86c <.altinstr_replacement+0x86c>	868: R_X86_64_PLT32	clear_page_rep-0x4
086c  86c:	e8 00 00 00 00       	call   871 <.altinstr_replacement+0x871>	86d: R_X86_64_PLT32	clear_page_erms-0x4
0871  871:	f3 0f b8 c7          	popcnt %edi,%eax
0875  875:	f3 0f b8 c7          	popcnt %edi,%eax
0879  879:	41 0f 0d 08          	prefetchw (%r8)
087d  87d:	f3 0f b8 c7          	popcnt %edi,%eax
0881  881:	f3 0f b8 c7          	popcnt %edi,%eax
0885  885:	f3 0f b8 c7          	popcnt %edi,%eax
0889  889:	f3 0f b8 c7          	popcnt %edi,%eax
088d  88d:	e8 00 00 00 00       	call   892 <.altinstr_replacement+0x892>	88e: R_X86_64_PLT32	clear_page_rep-0x4
0892  892:	e8 00 00 00 00       	call   897 <.altinstr_replacement+0x897>	893: R_X86_64_PLT32	clear_page_erms-0x4
0897  897:	e8 00 00 00 00       	call   89c <.altinstr_replacement+0x89c>	898: R_X86_64_PLT32	clear_page_rep-0x4
089c  89c:	e8 00 00 00 00       	call   8a1 <.altinstr_replacement+0x8a1>	89d: R_X86_64_PLT32	clear_page_erms-0x4
08a1  8a1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08a6  8a6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08ab  8ab:	0f 30                	wrmsr
08ad  8ad:	0f 30                	wrmsr
08af  8af:	0f 30                	wrmsr
08b1  8b1:	0f 30                	wrmsr
08b3  8b3:	0f 30                	wrmsr
08b5  8b5:	0f 30                	wrmsr
08b7  8b7:	0f 30                	wrmsr
08b9  8b9:	0f 30                	wrmsr
08bb  8bb:	0f 30                	wrmsr
08bd  8bd:	0f 30                	wrmsr
08bf  8bf:	0f 30                	wrmsr
08c1  8c1:	0f 30                	wrmsr
08c3  8c3:	0f 30                	wrmsr
08c5  8c5:	0f 30                	wrmsr
08c7  8c7:	0f 30                	wrmsr
08c9  8c9:	0f 30                	wrmsr
08cb  8cb:	0f 30                	wrmsr
08cd  8cd:	0f 30                	wrmsr
08cf  8cf:	0f 30                	wrmsr
08d1  8d1:	0f 30                	wrmsr
08d3  8d3:	0f 30                	wrmsr
08d5  8d5:	0f 30                	wrmsr
08d7  8d7:	0f 30                	wrmsr
08d9  8d9:	0f 30                	wrmsr
08db  8db:	0f 30                	wrmsr
08dd  8dd:	0f 30                	wrmsr
08df  8df:	0f 30                	wrmsr
08e1  8e1:	0f 30                	wrmsr
08e3  8e3:	0f 30                	wrmsr
08e5  8e5:	0f 30                	wrmsr
08e7  8e7:	0f 30                	wrmsr
08e9  8e9:	0f 30                	wrmsr
08eb  8eb:	f3 0f b8 c7          	popcnt %edi,%eax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

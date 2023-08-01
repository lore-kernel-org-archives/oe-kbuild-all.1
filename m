Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB09611B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690880390; x=1722416390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DEf99nedUATrF1wWZuKJql8Pl83S5JjBJ7kPAQoGYdo=;
  b=kpCLQdqnpgshaUF1ZWGqeOg67ZK40ZDzi/oowNd8yNzSOMtsFfCw0/OY
   INg5YnAbsUms8jvY0hMDbLRsR2QCysykgfdJjc3s8HvSNXlIcxRay/sL6
   u1KF/xOw1dUX1mjMXgIUyiMdYF1HOPkY/T9ttNLub8FUj0WBWnVj/yYLs
   95h9BY0eRQmTkLY1xsZY8xO8qe27oQEwNonaIzE1i9ryCJn2uGdQ63Bak
   gZOKfAXIion9XOShxpnYZRBviiOLPUPLqvpIXEc8J8n3S5xBrXxOKykJM
   7EOytC+t0UcMyCPmd9jFtNixzvU6sGUyBCYqM1eE27jLz2jyI0ZCzBfNT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="348838893"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="348838893"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 01:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="705760873"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="705760873"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Aug 2023 01:59:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQlEF-00008N-1J;
	Tue, 01 Aug 2023 08:59:43 +0000
Date: Tue, 1 Aug 2023 16:59:09 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:x86/core 2/3] vmlinux.o: warning: objtool:
 .altinstr_replacement+0x87f: call to zen_untrain_ret() leaves .noinstr.text
 section
Message-ID: <202308011611.n8joflkv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   4480ef6e9dbb381debad483ee11fc8a628f08581
commit: 935eb986af4f3ab2ab126b12347f342bf95fc29e [2/3] x86/retpoline,kprobes: Fix position of thunk sections with CONFIG_LTO_CLANG
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230801/202308011611.n8joflkv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308011611.n8joflkv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308011611.n8joflkv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .altinstr_replacement+0x87f: call to zen_untrain_ret() leaves .noinstr.text section
   vmlinux.o: warning: objtool: .altinstr_replacement+0x8e7: call to zen_untrain_ret() leaves .noinstr.text section


objdump-func vmlinux.o .altinstr_replacement:
0000 0000000000000000 <.altinstr_replacement>:
0000        0:	9c                   	pushf
0001        1:	58                   	pop    %rax
0002        2:	fa                   	cli
0003        3:	9c                   	pushf
0004        4:	58                   	pop    %rax
0005        5:	fb                   	sti
0006        6:	9c                   	pushf
0007        7:	58                   	pop    %rax
0008        8:	fa                   	cli
0009        9:	9c                   	pushf
000a        a:	58                   	pop    %rax
000b        b:	9c                   	pushf
000c        c:	58                   	pop    %rax
000d        d:	fb                   	sti
000e        e:	9c                   	pushf
000f        f:	58                   	pop    %rax
0010       10:	fa                   	cli
0011       11:	9c                   	pushf
0012       12:	58                   	pop    %rax
0013       13:	fb                   	sti
0014       14:	9c                   	pushf
0015       15:	58                   	pop    %rax
0016       16:	48 0f ba ec 3f       	bts    $0x3f,%rsp
001b       1b:	e8 00 00 00 00       	call   20 <.altinstr_replacement+0x20>	1c: R_X86_64_PLT32	zen_untrain_ret-0x4
0020       20:	e8 00 00 00 00       	call   25 <.altinstr_replacement+0x25>	21: R_X86_64_PLT32	entry_ibpb-0x4
0025       25:	31 c0                	xor    %eax,%eax
0027       27:	48 0f ba e8 3f       	bts    $0x3f,%rax
002c       2c:	65 48 89 04 25 00 00 00 00 	mov    %rax,%gs:0x0	31: R_X86_64_32S	pcpu_hot+0x10
0035       35:	e9 00 00 00 00       	jmp    3a <.altinstr_replacement+0x3a>	36: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
003a       3a:	48 c1 e1 07          	shl    $0x7,%rcx
003e       3e:	48 c1 f9 07          	sar    $0x7,%rcx
0042       42:	49 c7 c4 10 00 00 00 	mov    $0x10,%r12
0049       49:	e8 01 00 00 00       	call   4f <.altinstr_replacement+0x4f>
004e       4e:	cc                   	int3
004f       4f:	e8 01 00 00 00       	call   55 <.altinstr_replacement+0x55>
0054       54:	cc                   	int3
0055       55:	48 83 c4 10          	add    $0x10,%rsp
0059       59:	49 ff cc             	dec    %r12
005c       5c:	75 eb                	jne    49 <.altinstr_replacement+0x49>
005e       5e:	0f ae e8             	lfence
0061       61:	65 48 c7 04 25 00 00 00 00 ff ff ff ff 	movq   $0xffffffffffffffff,%gs:0x0	66: R_X86_64_32S	pcpu_hot+0x10
006e       6e:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	73: R_X86_64_32S	__x86_ctxsw_count
0077       77:	90                   	nop
0078       78:	90                   	nop
0079       79:	e8 01 00 00 00       	call   7f <.altinstr_replacement+0x7f>
007e       7e:	cc                   	int3
007f       7f:	48 83 c4 08          	add    $0x8,%rsp
0083       83:	0f ae e8             	lfence
0086       86:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	8b: R_X86_64_32S	pcpu_hot+0x10
0090       90:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	95: R_X86_64_32S	__x86_call_count
0099       99:	e8 00 00 00 00       	call   9e <.altinstr_replacement+0x9e>	9a: R_X86_64_PLT32	zen_untrain_ret-0x4
009e       9e:	e8 00 00 00 00       	call   a3 <.altinstr_replacement+0xa3>	9f: R_X86_64_PLT32	entry_ibpb-0x4
00a3       a3:	b0 fc                	mov    $0xfc,%al
00a5       a5:	48 c1 e0 38          	shl    $0x38,%rax
00a9       a9:	65 48 89 04 25 00 00 00 00 	mov    %rax,%gs:0x0	ae: R_X86_64_32S	pcpu_hot+0x10
00b2       b2:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	b7: R_X86_64_32S	__x86_call_count
00bb       bb:	0f 01 ca             	clac
00be       be:	e8 00 00 00 00       	call   c3 <.altinstr_replacement+0xc3>	bf: R_X86_64_PLT32	xen_error_entry-0x4
00c3       c3:	0f 01 ca             	clac
00c6       c6:	e8 00 00 00 00       	call   cb <.altinstr_replacement+0xcb>	c7: R_X86_64_PLT32	xen_error_entry-0x4
00cb       cb:	0f 01 ca             	clac
00ce       ce:	e8 00 00 00 00       	call   d3 <.altinstr_replacement+0xd3>	cf: R_X86_64_PLT32	xen_error_entry-0x4
00d3       d3:	0f 01 ca             	clac
00d6       d6:	e8 00 00 00 00       	call   db <.altinstr_replacement+0xdb>	d7: R_X86_64_PLT32	xen_error_entry-0x4
00db       db:	0f 01 ca             	clac
00de       de:	e8 00 00 00 00       	call   e3 <.altinstr_replacement+0xe3>	df: R_X86_64_PLT32	xen_error_entry-0x4
00e3       e3:	0f 01 ca             	clac
00e6       e6:	e8 00 00 00 00       	call   eb <.altinstr_replacement+0xeb>	e7: R_X86_64_PLT32	xen_error_entry-0x4
00eb       eb:	0f 01 ca             	clac
00ee       ee:	e8 00 00 00 00       	call   f3 <.altinstr_replacement+0xf3>	ef: R_X86_64_PLT32	xen_error_entry-0x4
00f3       f3:	0f 01 ca             	clac
00f6       f6:	e8 00 00 00 00       	call   fb <.altinstr_replacement+0xfb>	f7: R_X86_64_PLT32	xen_error_entry-0x4
00fb       fb:	0f 01 ca             	clac
00fe       fe:	e8 00 00 00 00       	call   103 <.altinstr_replacement+0x103>	ff: R_X86_64_PLT32	xen_error_entry-0x4
0103      103:	0f 01 ca             	clac
0106      106:	e8 00 00 00 00       	call   10b <.altinstr_replacement+0x10b>	107: R_X86_64_PLT32	xen_error_entry-0x4
010b      10b:	0f 01 ca             	clac
010e      10e:	e8 00 00 00 00       	call   113 <.altinstr_replacement+0x113>	10f: R_X86_64_PLT32	xen_error_entry-0x4
0113      113:	0f 01 ca             	clac
0116      116:	e8 00 00 00 00       	call   11b <.altinstr_replacement+0x11b>	117: R_X86_64_PLT32	xen_error_entry-0x4
011b      11b:	0f 01 ca             	clac
011e      11e:	e8 00 00 00 00       	call   123 <.altinstr_replacement+0x123>	11f: R_X86_64_PLT32	xen_error_entry-0x4
0123      123:	0f 01 ca             	clac
0126      126:	e8 00 00 00 00       	call   12b <.altinstr_replacement+0x12b>	127: R_X86_64_PLT32	xen_error_entry-0x4
012b      12b:	0f 01 ca             	clac
012e      12e:	e8 00 00 00 00       	call   133 <.altinstr_replacement+0x133>	12f: R_X86_64_PLT32	xen_error_entry-0x4
0133      133:	0f 01 ca             	clac
0136      136:	e8 00 00 00 00       	call   13b <.altinstr_replacement+0x13b>	137: R_X86_64_PLT32	xen_error_entry-0x4
013b      13b:	0f 01 ca             	clac
013e      13e:	e8 00 00 00 00       	call   143 <.altinstr_replacement+0x143>	13f: R_X86_64_PLT32	xen_error_entry-0x4
0143      143:	0f 01 ca             	clac
0146      146:	e8 00 00 00 00       	call   14b <.altinstr_replacement+0x14b>	147: R_X86_64_PLT32	xen_error_entry-0x4
014b      14b:	0f 01 ca             	clac
014e      14e:	e8 00 00 00 00       	call   153 <.altinstr_replacement+0x153>	14f: R_X86_64_PLT32	xen_error_entry-0x4
0153      153:	0f 01 ca             	clac
0156      156:	e8 00 00 00 00       	call   15b <.altinstr_replacement+0x15b>	157: R_X86_64_PLT32	xen_error_entry-0x4
015b      15b:	0f 01 ca             	clac
015e      15e:	e8 00 00 00 00       	call   163 <.altinstr_replacement+0x163>	15f: R_X86_64_PLT32	xen_error_entry-0x4
0163      163:	0f 01 ca             	clac
0166      166:	e8 00 00 00 00       	call   16b <.altinstr_replacement+0x16b>	167: R_X86_64_PLT32	xen_error_entry-0x4
016b      16b:	0f 01 ca             	clac
016e      16e:	0f 01 ca             	clac
0171      171:	e8 00 00 00 00       	call   176 <.altinstr_replacement+0x176>	172: R_X86_64_PLT32	xen_error_entry-0x4
0176      176:	0f 01 ca             	clac
0179      179:	e8 00 00 00 00       	call   17e <.altinstr_replacement+0x17e>	17a: R_X86_64_PLT32	xen_error_entry-0x4
017e      17e:	0f 01 ca             	clac
0181      181:	e8 00 00 00 00       	call   186 <.altinstr_replacement+0x186>	182: R_X86_64_PLT32	xen_error_entry-0x4
0186      186:	0f 01 ca             	clac
0189      189:	e8 00 00 00 00       	call   18e <.altinstr_replacement+0x18e>	18a: R_X86_64_PLT32	xen_error_entry-0x4
018e      18e:	0f 01 ca             	clac
0191      191:	e8 00 00 00 00       	call   196 <.altinstr_replacement+0x196>	192: R_X86_64_PLT32	xen_error_entry-0x4
0196      196:	0f 01 ca             	clac
0199      199:	e8 00 00 00 00       	call   19e <.altinstr_replacement+0x19e>	19a: R_X86_64_PLT32	xen_error_entry-0x4
019e      19e:	0f 01 ca             	clac
01a1      1a1:	e8 00 00 00 00       	call   1a6 <.altinstr_replacement+0x1a6>	1a2: R_X86_64_PLT32	xen_error_entry-0x4
01a6      1a6:	0f 01 ca             	clac
01a9      1a9:	e8 00 00 00 00       	call   1ae <.altinstr_replacement+0x1ae>	1aa: R_X86_64_PLT32	xen_error_entry-0x4
01ae      1ae:	0f 01 ca             	clac
01b1      1b1:	e8 00 00 00 00       	call   1b6 <.altinstr_replacement+0x1b6>	1b2: R_X86_64_PLT32	xen_error_entry-0x4
01b6      1b6:	0f 01 ca             	clac
01b9      1b9:	e8 00 00 00 00       	call   1be <.altinstr_replacement+0x1be>	1ba: R_X86_64_PLT32	xen_error_entry-0x4
01be      1be:	0f 01 ca             	clac
01c1      1c1:	e8 00 00 00 00       	call   1c6 <.altinstr_replacement+0x1c6>	1c2: R_X86_64_PLT32	xen_error_entry-0x4
01c6      1c6:	0f 01 ca             	clac
01c9      1c9:	e8 00 00 00 00       	call   1ce <.altinstr_replacement+0x1ce>	1ca: R_X86_64_PLT32	xen_error_entry-0x4
01ce      1ce:	0f 01 ca             	clac
01d1      1d1:	e8 00 00 00 00       	call   1d6 <.altinstr_replacement+0x1d6>	1d2: R_X86_64_PLT32	xen_error_entry-0x4
01d6      1d6:	0f 01 ca             	clac
01d9      1d9:	e8 00 00 00 00       	call   1de <.altinstr_replacement+0x1de>	1da: R_X86_64_PLT32	xen_error_entry-0x4
01de      1de:	0f 01 ca             	clac
01e1      1e1:	e8 00 00 00 00       	call   1e6 <.altinstr_replacement+0x1e6>	1e2: R_X86_64_PLT32	xen_error_entry-0x4
01e6      1e6:	0f 01 ca             	clac
01e9      1e9:	e8 00 00 00 00       	call   1ee <.altinstr_replacement+0x1ee>	1ea: R_X86_64_PLT32	xen_error_entry-0x4
01ee      1ee:	0f 01 ca             	clac
01f1      1f1:	e8 00 00 00 00       	call   1f6 <.altinstr_replacement+0x1f6>	1f2: R_X86_64_PLT32	xen_error_entry-0x4
01f6      1f6:	0f 01 ca             	clac
01f9      1f9:	e8 00 00 00 00       	call   1fe <.altinstr_replacement+0x1fe>	1fa: R_X86_64_PLT32	xen_error_entry-0x4
01fe      1fe:	0f 01 ca             	clac
0201      201:	e8 00 00 00 00       	call   206 <.altinstr_replacement+0x206>	202: R_X86_64_PLT32	xen_error_entry-0x4
0206      206:	0f 01 ca             	clac
0209      209:	e8 00 00 00 00       	call   20e <.altinstr_replacement+0x20e>	20a: R_X86_64_PLT32	xen_error_entry-0x4
020e      20e:	0f 01 ca             	clac
0211      211:	e8 00 00 00 00       	call   216 <.altinstr_replacement+0x216>	212: R_X86_64_PLT32	xen_error_entry-0x4
0216      216:	0f 01 ca             	clac
0219      219:	e8 00 00 00 00       	call   21e <.altinstr_replacement+0x21e>	21a: R_X86_64_PLT32	xen_error_entry-0x4
021e      21e:	0f 01 ca             	clac
0221      221:	e8 00 00 00 00       	call   226 <.altinstr_replacement+0x226>	222: R_X86_64_PLT32	xen_error_entry-0x4
0226      226:	0f 01 ca             	clac
0229      229:	e8 00 00 00 00       	call   22e <.altinstr_replacement+0x22e>	22a: R_X86_64_PLT32	xen_error_entry-0x4
022e      22e:	0f 01 ca             	clac
0231      231:	e8 00 00 00 00       	call   236 <.altinstr_replacement+0x236>	232: R_X86_64_PLT32	xen_error_entry-0x4
0236      236:	0f 01 ca             	clac
0239      239:	e8 00 00 00 00       	call   23e <.altinstr_replacement+0x23e>	23a: R_X86_64_PLT32	xen_error_entry-0x4
023e      23e:	0f 01 ca             	clac
0241      241:	e8 00 00 00 00       	call   246 <.altinstr_replacement+0x246>	242: R_X86_64_PLT32	xen_error_entry-0x4
0246      246:	0f 01 ca             	clac
0249      249:	e8 00 00 00 00       	call   24e <.altinstr_replacement+0x24e>	24a: R_X86_64_PLT32	xen_error_entry-0x4
024e      24e:	0f 01 ca             	clac
0251      251:	e8 00 00 00 00       	call   256 <.altinstr_replacement+0x256>	252: R_X86_64_PLT32	xen_error_entry-0x4
0256      256:	0f 01 ca             	clac
0259      259:	e8 00 00 00 00       	call   25e <.altinstr_replacement+0x25e>	25a: R_X86_64_PLT32	xen_error_entry-0x4
025e      25e:	e9 00 00 00 00       	jmp    263 <.altinstr_replacement+0x263>	25f: R_X86_64_PLT32	xenpv_restore_regs_and_return_to_usermode-0x4
0263      263:	48 0f ba ef 3f       	bts    $0x3f,%rdi
0268      268:	0f ae f0             	mfence
026b      26b:	b8 2b 00 00 00       	mov    $0x2b,%eax
0270      270:	8e e8                	mov    %eax,%gs
0272      272:	48 0f ba e8 3f       	bts    $0x3f,%rax
0277      277:	0f ae e8             	lfence
027a      27a:	e8 00 00 00 00       	call   27f <.altinstr_replacement+0x27f>	27b: R_X86_64_PLT32	zen_untrain_ret-0x4
027f      27f:	e8 00 00 00 00       	call   284 <.altinstr_replacement+0x284>	280: R_X86_64_PLT32	entry_ibpb-0x4
0284      284:	b0 fc                	mov    $0xfc,%al
0286      286:	48 c1 e0 38          	shl    $0x38,%rax
028a      28a:	65 48 89 04 25 00 00 00 00 	mov    %rax,%gs:0x0	28f: R_X86_64_32S	pcpu_hot+0x10
0293      293:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	298: R_X86_64_32S	__x86_call_count
029c      29c:	0f ae e8             	lfence
029f      29f:	48 0f ba e8 3f       	bts    $0x3f,%rax
02a4      2a4:	e8 00 00 00 00       	call   2a9 <.altinstr_replacement+0x2a9>	2a5: R_X86_64_PLT32	zen_untrain_ret-0x4
02a9      2a9:	e8 00 00 00 00       	call   2ae <.altinstr_replacement+0x2ae>	2aa: R_X86_64_PLT32	entry_ibpb-0x4
02ae      2ae:	b0 fc                	mov    $0xfc,%al
02b0      2b0:	48 c1 e0 38          	shl    $0x38,%rax
02b4      2b4:	65 48 89 04 25 00 00 00 00 	mov    %rax,%gs:0x0	2b9: R_X86_64_32S	pcpu_hot+0x10
02bd      2bd:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	2c2: R_X86_64_32S	__x86_call_count
02c6      2c6:	0f ae e8             	lfence
02c9      2c9:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	2ce: R_X86_64_32S	pcpu_hot+0x10
02d3      2d3:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	2d8: R_X86_64_32S	__x86_call_count
02dc      2dc:	0f ae e8             	lfence
02df      2df:	48 0f ba e8 3f       	bts    $0x3f,%rax
02e4      2e4:	e8 00 00 00 00       	call   2e9 <.altinstr_replacement+0x2e9>	2e5: R_X86_64_PLT32	zen_untrain_ret-0x4
02e9      2e9:	e8 00 00 00 00       	call   2ee <.altinstr_replacement+0x2ee>	2ea: R_X86_64_PLT32	entry_ibpb-0x4
02ee      2ee:	b0 fc                	mov    $0xfc,%al
02f0      2f0:	48 c1 e0 38          	shl    $0x38,%rax
02f4      2f4:	65 48 89 04 25 00 00 00 00 	mov    %rax,%gs:0x0	2f9: R_X86_64_32S	pcpu_hot+0x10
02fd      2fd:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	302: R_X86_64_32S	__x86_call_count
0306      306:	9c                   	pushf
0307      307:	58                   	pop    %rax
0308      308:	0f 01 ca             	clac
030b      30b:	0f ae e8             	lfence
030e      30e:	48 0f ba ea 3f       	bts    $0x3f,%rdx
0313      313:	e8 00 00 00 00       	call   318 <.altinstr_replacement+0x318>	314: R_X86_64_PLT32	zen_untrain_ret-0x4
0318      318:	e8 00 00 00 00       	call   31d <.altinstr_replacement+0x31d>	319: R_X86_64_PLT32	entry_ibpb-0x4
031d      31d:	31 c0                	xor    %eax,%eax
031f      31f:	48 0f ba e8 3f       	bts    $0x3f,%rax
0324      324:	65 48 89 04 25 00 00 00 00 	mov    %rax,%gs:0x0	329: R_X86_64_32S	pcpu_hot+0x10
032d      32d:	9c                   	pushf
032e      32e:	58                   	pop    %rax
032f      32f:	fa                   	cli
0330      330:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
033a      33a:	48 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdi
0344      344:	e9 00 00 00 00       	jmp    349 <.altinstr_replacement+0x349>	345: R_X86_64_PC32	.init.text+0xfe53
0349      349:	48 89 f8             	mov    %rdi,%rax
034c      34c:	48 89 f8             	mov    %rdi,%rax
034f      34f:	48 89 f8             	mov    %rdi,%rax
0352      352:	48 89 f8             	mov    %rdi,%rax
0355      355:	e9 00 00 00 00       	jmp    35a <.altinstr_replacement+0x35a>	356: R_X86_64_PC32	.init.text+0x10352
035a      35a:	48 89 f8             	mov    %rdi,%rax
035d      35d:	48 89 f8             	mov    %rdi,%rax
0360      360:	48 89 f8             	mov    %rdi,%rax
0363      363:	48 89 f8             	mov    %rdi,%rax
0366      366:	48 89 f8             	mov    %rdi,%rax
0369      369:	48 89 f8             	mov    %rdi,%rax
036c      36c:	48 89 f8             	mov    %rdi,%rax
036f      36f:	48 89 f8             	mov    %rdi,%rax
0372      372:	48 89 f8             	mov    %rdi,%rax
0375      375:	48 0f ba e8 3f       	bts    $0x3f,%rax
037a      37a:	e8 00 00 00 00       	call   37f <.altinstr_replacement+0x37f>	37b: R_X86_64_PLT32	zen_untrain_ret-0x4
037f      37f:	e8 00 00 00 00       	call   384 <.altinstr_replacement+0x384>	380: R_X86_64_PLT32	entry_ibpb-0x4
0384      384:	31 c0                	xor    %eax,%eax
0386      386:	48 0f ba e8 3f       	bts    $0x3f,%rax
038b      38b:	65 48 89 04 25 00 00 00 00 	mov    %rax,%gs:0x0	390: R_X86_64_32S	pcpu_hot+0x10
0394      394:	e9 00 00 00 00       	jmp    399 <.altinstr_replacement+0x399>	395: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
0399      399:	48 0f ba ec 3f       	bts    $0x3f,%rsp
039e      39e:	e8 00 00 00 00       	call   3a3 <.altinstr_replacement+0x3a3>	39f: R_X86_64_PLT32	zen_untrain_ret-0x4
03a3      3a3:	e8 00 00 00 00       	call   3a8 <.altinstr_replacement+0x3a8>	3a4: R_X86_64_PLT32	entry_ibpb-0x4
03a8      3a8:	31 c0                	xor    %eax,%eax
03aa      3aa:	48 0f ba e8 3f       	bts    $0x3f,%rax
03af      3af:	65 48 89 04 25 00 00 00 00 	mov    %rax,%gs:0x0	3b4: R_X86_64_32S	pcpu_hot+0x10
03b8      3b8:	e9 00 00 00 00       	jmp    3bd <.altinstr_replacement+0x3bd>	3b9: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
03bd      3bd:	0f 01 ca             	clac
03c0      3c0:	48 0f ba e8 3f       	bts    $0x3f,%rax
03c5      3c5:	e9 00 00 00 00       	jmp    3ca <.altinstr_replacement+0x3ca>	3c6: R_X86_64_PC32	.entry.text+0x29fe
03ca      3ca:	e8 00 00 00 00       	call   3cf <.altinstr_replacement+0x3cf>	3cb: R_X86_64_PLT32	zen_untrain_ret-0x4
03cf      3cf:	e8 00 00 00 00       	call   3d4 <.altinstr_replacement+0x3d4>	3d0: R_X86_64_PLT32	entry_ibpb-0x4
03d4      3d4:	31 c0                	xor    %eax,%eax
03d6      3d6:	48 0f ba e8 3f       	bts    $0x3f,%rax
03db      3db:	65 48 89 04 25 00 00 00 00 	mov    %rax,%gs:0x0	3e0: R_X86_64_32S	pcpu_hot+0x10
03e4      3e4:	e9 00 00 00 00       	jmp    3e9 <.altinstr_replacement+0x3e9>	3e5: R_X86_64_PC32	.text+0xb720
03e9      3e9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
03ee      3ee:	9c                   	pushf
03ef      3ef:	58                   	pop    %rax
03f0      3f0:	fa                   	cli
03f1      3f1:	9c                   	pushf
03f2      3f2:	58                   	pop    %rax
03f3      3f3:	fb                   	sti
03f4      3f4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
03f9      3f9:	f3 0f b8 c7          	popcnt %edi,%eax
03fd      3fd:	e9 00 00 00 00       	jmp    402 <.altinstr_replacement+0x402>	3fe: R_X86_64_PC32	.text+0x19082
0402      402:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0407      407:	f3 48 0f b8 c7       	popcnt %rdi,%rax
040c      40c:	e9 00 00 00 00       	jmp    411 <.altinstr_replacement+0x411>	40d: R_X86_64_PC32	.text+0x1edc0
0411      411:	e9 00 00 00 00       	jmp    416 <.altinstr_replacement+0x416>	412: R_X86_64_PC32	.init.text+0x130d3
0416      416:	0f ae e8             	lfence
0419      419:	0f 31                	rdtsc
041b      41b:	0f 01 f9             	rdtscp
041e      41e:	0f ae e8             	lfence
0421      421:	0f 31                	rdtsc
0423      423:	0f 01 f9             	rdtscp
0426      426:	0f ae e8             	lfence
0429      429:	0f 31                	rdtsc
042b      42b:	0f 01 f9             	rdtscp
042e      42e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0433      433:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0438      438:	9c                   	pushf
0439      439:	58                   	pop    %rax
043a      43a:	fb                   	sti
043b      43b:	9c                   	pushf
043c      43c:	58                   	pop    %rax
043d      43d:	fa                   	cli
043e      43e:	9c                   	pushf
043f      43f:	58                   	pop    %rax
0440      440:	fa                   	cli
0441      441:	9c                   	pushf
0442      442:	58                   	pop    %rax
0443      443:	fa                   	cli
0444      444:	9c                   	pushf
0445      445:	58                   	pop    %rax
0446      446:	fb                   	sti
0447      447:	e9 00 00 00 00       	jmp    44c <.altinstr_replacement+0x44c>	448: R_X86_64_PC32	.init.text+0x1b0f0
044c      44c:	e9 00 00 00 00       	jmp    451 <.altinstr_replacement+0x451>	44d: R_X86_64_PC32	.text+0x45ee7
0451      451:	e9 00 00 00 00       	jmp    456 <.altinstr_replacement+0x456>	452: R_X86_64_PC32	.text+0x45ef2
0456      456:	e9 00 00 00 00       	jmp    45b <.altinstr_replacement+0x45b>	457: R_X86_64_PC32	.text+0x45f94
045b      45b:	e9 00 00 00 00       	jmp    460 <.altinstr_replacement+0x460>	45c: R_X86_64_PC32	.text+0x45f9f
0460      460:	e9 00 00 00 00       	jmp    465 <.altinstr_replacement+0x465>	461: R_X86_64_PC32	.text+0x4630c
0465      465:	e9 00 00 00 00       	jmp    46a <.altinstr_replacement+0x46a>	466: R_X86_64_PC32	.text+0x4701d
046a      46a:	e9 00 00 00 00       	jmp    46f <.altinstr_replacement+0x46f>	46b: R_X86_64_PC32	.text+0x47760
046f      46f:	e9 00 00 00 00       	jmp    474 <.altinstr_replacement+0x474>	470: R_X86_64_PC32	.text+0x47658
0474      474:	e9 00 00 00 00       	jmp    479 <.altinstr_replacement+0x479>	475: R_X86_64_PC32	.text+0x477d0
0479      479:	e9 00 00 00 00       	jmp    47e <.altinstr_replacement+0x47e>	47a: R_X86_64_PC32	.text+0x4772e
047e      47e:	e9 00 00 00 00       	jmp    483 <.altinstr_replacement+0x483>	47f: R_X86_64_PC32	.text+0x47ca8
0483      483:	e9 00 00 00 00       	jmp    488 <.altinstr_replacement+0x488>	484: R_X86_64_PC32	.text+0x47e0d
0488      488:	e9 00 00 00 00       	jmp    48d <.altinstr_replacement+0x48d>	489: R_X86_64_PC32	.text+0x47e18
048d      48d:	e9 00 00 00 00       	jmp    492 <.altinstr_replacement+0x492>	48e: R_X86_64_PC32	.text+0x47f0d
0492      492:	e9 00 00 00 00       	jmp    497 <.altinstr_replacement+0x497>	493: R_X86_64_PC32	.text+0x47fd3
0497      497:	e9 00 00 00 00       	jmp    49c <.altinstr_replacement+0x49c>	498: R_X86_64_PC32	.text+0x47fe1
049c      49c:	e9 00 00 00 00       	jmp    4a1 <.altinstr_replacement+0x4a1>	49d: R_X86_64_PC32	.text+0x48084
04a1      4a1:	e9 00 00 00 00       	jmp    4a6 <.altinstr_replacement+0x4a6>	4a2: R_X86_64_PC32	.text+0x48c96
04a6      4a6:	e9 00 00 00 00       	jmp    4ab <.altinstr_replacement+0x4ab>	4a7: R_X86_64_PC32	.text+0x48d36
04ab      4ab:	e9 00 00 00 00       	jmp    4b0 <.altinstr_replacement+0x4b0>	4ac: R_X86_64_PC32	.text+0x48d2b
04b0      4b0:	e9 00 00 00 00       	jmp    4b5 <.altinstr_replacement+0x4b5>	4b1: R_X86_64_PC32	.text+0x48d20
04b5      4b5:	e9 00 00 00 00       	jmp    4ba <.altinstr_replacement+0x4ba>	4b6: R_X86_64_PC32	.text+0x491d7
04ba      4ba:	e9 00 00 00 00       	jmp    4bf <.altinstr_replacement+0x4bf>	4bb: R_X86_64_PC32	.text+0x4935d
04bf      4bf:	e9 00 00 00 00       	jmp    4c4 <.altinstr_replacement+0x4c4>	4c0: R_X86_64_PC32	.text+0x49531
04c4      4c4:	e9 00 00 00 00       	jmp    4c9 <.altinstr_replacement+0x4c9>	4c5: R_X86_64_PC32	.text+0x49855
04c9      4c9:	e9 00 00 00 00       	jmp    4ce <.altinstr_replacement+0x4ce>	4ca: R_X86_64_PC32	.text+0x49bcb
04ce      4ce:	e9 00 00 00 00       	jmp    4d3 <.altinstr_replacement+0x4d3>	4cf: R_X86_64_PC32	.text+0x4ad06
04d3      4d3:	e9 00 00 00 00       	jmp    4d8 <.altinstr_replacement+0x4d8>	4d4: R_X86_64_PC32	.text+0x4aea9
04d8      4d8:	9c                   	pushf
04d9      4d9:	58                   	pop    %rax
04da      4da:	fa                   	cli
04db      4db:	9c                   	pushf
04dc      4dc:	58                   	pop    %rax
04dd      4dd:	fb                   	sti
04de      4de:	9c                   	pushf
04df      4df:	58                   	pop    %rax
04e0      4e0:	fa                   	cli
04e1      4e1:	9c                   	pushf
04e2      4e2:	58                   	pop    %rax
04e3      4e3:	fb                   	sti
04e4      4e4:	f3 0f b8 c7          	popcnt %edi,%eax
04e8      4e8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
04ed      4ed:	e9 00 00 00 00       	jmp    4f2 <.altinstr_replacement+0x4f2>	4ee: R_X86_64_PC32	.text+0x8cd4d
04f2      4f2:	e9 00 00 00 00       	jmp    4f7 <.altinstr_replacement+0x4f7>	4f3: R_X86_64_PC32	.text+0x8cd97
04f7      4f7:	0f 01 cb             	stac
04fa      4fa:	e8 00 00 00 00       	call   4ff <.altinstr_replacement+0x4ff>	4fb: R_X86_64_PLT32	rep_movs_alternative-0x4
04ff      4ff:	0f 01 ca             	clac
0502      502:	0f 01 cb             	stac
0505      505:	e8 00 00 00 00       	call   50a <.altinstr_replacement+0x50a>	506: R_X86_64_PLT32	rep_movs_alternative-0x4
050a      50a:	0f 01 ca             	clac
050d      50d:	48 89 f8             	mov    %rdi,%rax
0510      510:	48 89 f8             	mov    %rdi,%rax
0513      513:	e9 00 00 00 00       	jmp    518 <.altinstr_replacement+0x518>	514: R_X86_64_PC32	.text+0x90b0d
0518      518:	e9 00 00 00 00       	jmp    51d <.altinstr_replacement+0x51d>	519: R_X86_64_PC32	.text+0x90b57
051d      51d:	0f 01 cb             	stac
0520      520:	e8 00 00 00 00       	call   525 <.altinstr_replacement+0x525>	521: R_X86_64_PLT32	rep_movs_alternative-0x4
0525      525:	0f 01 ca             	clac
0528      528:	0f 01 cb             	stac
052b      52b:	e8 00 00 00 00       	call   530 <.altinstr_replacement+0x530>	52c: R_X86_64_PLT32	rep_movs_alternative-0x4
0530      530:	0f 01 ca             	clac
0533      533:	48 89 f8             	mov    %rdi,%rax
0536      536:	65 4c 23 3c 25 00 00 00 00 	and    %gs:0x0,%r15	53b: R_X86_64_32S	tlbstate_untag_mask
053f      53f:	e9 00 00 00 00       	jmp    544 <.altinstr_replacement+0x544>	540: R_X86_64_PC32	.text+0x96f71
0544      544:	e9 00 00 00 00       	jmp    549 <.altinstr_replacement+0x549>	545: R_X86_64_PC32	.text+0x96d90
0549      549:	48 89 f8             	mov    %rdi,%rax
054c      54c:	48 89 f8             	mov    %rdi,%rax
054f      54f:	48 89 f8             	mov    %rdi,%rax
0552      552:	0f 01 cb             	stac
0555      555:	e8 00 00 00 00       	call   55a <.altinstr_replacement+0x55a>	556: R_X86_64_PLT32	rep_movs_alternative-0x4
055a      55a:	0f 01 ca             	clac
055d      55d:	e9 00 00 00 00       	jmp    562 <.altinstr_replacement+0x562>	55e: R_X86_64_PC32	.text+0xa04b4
0562      562:	e9 00 00 00 00       	jmp    567 <.altinstr_replacement+0x567>	563: R_X86_64_PC32	.text+0xa04fe
0567      567:	9c                   	pushf
0568      568:	58                   	pop    %rax
0569      569:	fa                   	cli
056a      56a:	9c                   	pushf
056b      56b:	58                   	pop    %rax
056c      56c:	fb                   	sti
056d      56d:	e9 00 00 00 00       	jmp    572 <.altinstr_replacement+0x572>	56e: R_X86_64_PC32	.text+0xb056a
0572      572:	e9 00 00 00 00       	jmp    577 <.altinstr_replacement+0x577>	573: R_X86_64_PC32	.text+0xb0473
0577      577:	e9 00 00 00 00       	jmp    57c <.altinstr_replacement+0x57c>	578: R_X86_64_PC32	.text+0xb04db
057c      57c:	e9 00 00 00 00       	jmp    581 <.altinstr_replacement+0x581>	57d: R_X86_64_PC32	.text+0xb00a4
0581      581:	e9 00 00 00 00       	jmp    586 <.altinstr_replacement+0x586>	582: R_X86_64_PC32	.text+0xb0ec8
0586      586:	e9 00 00 00 00       	jmp    58b <.altinstr_replacement+0x58b>	587: R_X86_64_PC32	.text+0xb1022
058b      58b:	e9 00 00 00 00       	jmp    590 <.altinstr_replacement+0x590>	58c: R_X86_64_PC32	.text+0xb1622
0590      590:	e9 00 00 00 00       	jmp    595 <.altinstr_replacement+0x595>	591: R_X86_64_PC32	.text+0xb1771
0595      595:	0f 09                	wbinvd
0597      597:	9c                   	pushf
0598      598:	58                   	pop    %rax
0599      599:	fa                   	cli
059a      59a:	9c                   	pushf
059b      59b:	58                   	pop    %rax
059c      59c:	fb                   	sti
059d      59d:	e9 00 00 00 00       	jmp    5a2 <.altinstr_replacement+0x5a2>	59e: R_X86_64_PC32	.text+0xd3002
05a2      5a2:	0f ae e8             	lfence
05a5      5a5:	0f 31                	rdtsc
05a7      5a7:	0f 01 f9             	rdtscp
05aa      5aa:	0f ae e8             	lfence
05ad      5ad:	0f 31                	rdtsc
05af      5af:	0f 01 f9             	rdtscp
05b2      5b2:	e9 00 00 00 00       	jmp    5b7 <.altinstr_replacement+0x5b7>	5b3: R_X86_64_PC32	.text+0xdbd51
05b7      5b7:	0f 09                	wbinvd
05b9      5b9:	e9 00 00 00 00       	jmp    5be <.altinstr_replacement+0x5be>	5ba: R_X86_64_PC32	.text+0xe2f0b
05be      5be:	9c                   	pushf
05bf      5bf:	58                   	pop    %rax
05c0      5c0:	fa                   	cli
05c1      5c1:	9c                   	pushf
05c2      5c2:	58                   	pop    %rax
05c3      5c3:	fb                   	sti
05c4      5c4:	0f 01 cb             	stac
05c7      5c7:	0f ae e8             	lfence
05ca      5ca:	0f 01 ca             	clac
05cd      5cd:	0f 01 cb             	stac
05d0      5d0:	0f ae e8             	lfence
05d3      5d3:	0f 01 ca             	clac
05d6      5d6:	0f 01 cb             	stac
05d9      5d9:	0f ae e8             	lfence
05dc      5dc:	0f 01 ca             	clac
05df      5df:	0f 01 cb             	stac
05e2      5e2:	0f ae e8             	lfence
05e5      5e5:	0f 01 ca             	clac
05e8      5e8:	0f 01 ca             	clac
05eb      5eb:	0f 01 ca             	clac
05ee      5ee:	9c                   	pushf
05ef      5ef:	58                   	pop    %rax
05f0      5f0:	fa                   	cli
05f1      5f1:	9c                   	pushf
05f2      5f2:	58                   	pop    %rax
05f3      5f3:	fb                   	sti
05f4      5f4:	9c                   	pushf
05f5      5f5:	58                   	pop    %rax
05f6      5f6:	fb                   	sti
05f7      5f7:	0f 01 cb             	stac
05fa      5fa:	0f ae e8             	lfence
05fd      5fd:	0f 01 ca             	clac
0600      600:	0f 01 cb             	stac
0603      603:	0f ae e8             	lfence
0606      606:	0f 01 ca             	clac
0609      609:	0f 01 cb             	stac
060c      60c:	0f ae e8             	lfence
060f      60f:	9c                   	pushf
0610      610:	58                   	pop    %rax
0611      611:	fa                   	cli
0612      612:	9c                   	pushf
0613      613:	58                   	pop    %rax
0614      614:	fb                   	sti
0615      615:	e9 00 00 00 00       	jmp    61a <.altinstr_replacement+0x61a>	616: R_X86_64_PC32	.text+0xf9671
061a      61a:	e9 00 00 00 00       	jmp    61f <.altinstr_replacement+0x61f>	61b: R_X86_64_PC32	.text+0xf9689
061f      61f:	e9 00 00 00 00       	jmp    624 <.altinstr_replacement+0x624>	620: R_X86_64_PC32	.text+0xfc69c
0624      624:	e9 00 00 00 00       	jmp    629 <.altinstr_replacement+0x629>	625: R_X86_64_PC32	.text+0xfc69c
0629      629:	e9 00 00 00 00       	jmp    62e <.altinstr_replacement+0x62e>	62a: R_X86_64_PC32	.text+0x10505b
062e      62e:	9c                   	pushf
062f      62f:	58                   	pop    %rax
0630      630:	fa                   	cli
0631      631:	fb                   	sti
0632      632:	fb                   	sti
0633      633:	9c                   	pushf
0634      634:	58                   	pop    %rax
0635      635:	fa                   	cli
0636      636:	fb                   	sti
0637      637:	e8 00 00 00 00       	call   63c <.altinstr_replacement+0x63c>	638: R_X86_64_PLT32	__x86_indirect_thunk_rsi-0x4
063c      63c:	0f ae e8             	lfence
063f      63f:	ff d6                	call   *%rsi
0641      641:	e8 00 00 00 00       	call   646 <.altinstr_replacement+0x646>	642: R_X86_64_PLT32	__x86_indirect_thunk_rbp-0x4
0646      646:	0f ae e8             	lfence
0649      649:	ff d5                	call   *%rbp
064b      64b:	e8 00 00 00 00       	call   650 <.altinstr_replacement+0x650>	64c: R_X86_64_PLT32	__x86_indirect_thunk_rbp-0x4
0650      650:	0f ae e8             	lfence
0653      653:	ff d5                	call   *%rbp
0655      655:	e8 00 00 00 00       	call   65a <.altinstr_replacement+0x65a>	656: R_X86_64_PLT32	__x86_indirect_thunk_rbp-0x4
065a      65a:	0f ae e8             	lfence
065d      65d:	ff d5                	call   *%rbp
065f      65f:	e8 00 00 00 00       	call   664 <.altinstr_replacement+0x664>	660: R_X86_64_PLT32	__x86_indirect_thunk_rbp-0x4
0664      664:	0f ae e8             	lfence
0667      667:	ff d5                	call   *%rbp
0669      669:	e8 00 00 00 00       	call   66e <.altinstr_replacement+0x66e>	66a: R_X86_64_PLT32	__x86_indirect_thunk_rbp-0x4
066e      66e:	0f ae e8             	lfence
0671      671:	ff d5                	call   *%rbp
0673      673:	f3 0f b8 c7          	popcnt %edi,%eax
0677      677:	9c                   	pushf
0678      678:	58                   	pop    %rax
0679      679:	f3 0f b8 c7          	popcnt %edi,%eax
067d      67d:	f3 0f b8 c7          	popcnt %edi,%eax
0681      681:	9c                   	pushf
0682      682:	58                   	pop    %rax
0683      683:	9c                   	pushf
0684      684:	58                   	pop    %rax
0685      685:	fa                   	cli
0686      686:	9c                   	pushf
0687      687:	58                   	pop    %rax
0688      688:	fb                   	sti
0689      689:	9c                   	pushf
068a      68a:	58                   	pop    %rax
068b      68b:	e9 00 00 00 00       	jmp    690 <.altinstr_replacement+0x690>	68c: R_X86_64_PC32	.text+0x155e3a
0690      690:	e9 00 00 00 00       	jmp    695 <.altinstr_replacement+0x695>	691: R_X86_64_PC32	.text+0x155e19
0695      695:	e9 00 00 00 00       	jmp    69a <.altinstr_replacement+0x69a>	696: R_X86_64_PC32	.text+0x158de9
069a      69a:	e9 00 00 00 00       	jmp    69f <.altinstr_replacement+0x69f>	69b: R_X86_64_PC32	.text+0x158ecf
069f      69f:	e9 00 00 00 00       	jmp    6a4 <.altinstr_replacement+0x6a4>	6a0: R_X86_64_PC32	.text+0x158d72
06a4      6a4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06a9      6a9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06ae      6ae:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06b3      6b3:	e9 00 00 00 00       	jmp    6b8 <.altinstr_replacement+0x6b8>	6b4: R_X86_64_PC32	.text+0x174025
06b8      6b8:	48 89 f8             	mov    %rdi,%rax
06bb      6bb:	9c                   	pushf
06bc      6bc:	58                   	pop    %rax
06bd      6bd:	fa                   	cli
06be      6be:	9c                   	pushf
06bf      6bf:	58                   	pop    %rax
06c0      6c0:	fb                   	sti
06c1      6c1:	9c                   	pushf
06c2      6c2:	58                   	pop    %rax
06c3      6c3:	fa                   	cli
06c4      6c4:	48 89 f8             	mov    %rdi,%rax
06c7      6c7:	fb                   	sti
06c8      6c8:	0f 01 cb             	stac
06cb      6cb:	0f ae e8             	lfence
06ce      6ce:	0f 01 ca             	clac
06d1      6d1:	0f 01 ca             	clac
06d4      6d4:	9c                   	pushf
06d5      6d5:	58                   	pop    %rax
06d6      6d6:	fa                   	cli
06d7      6d7:	e9 00 00 00 00       	jmp    6dc <.altinstr_replacement+0x6dc>	6d8: R_X86_64_PC32	.text+0x1868a6
06dc      6dc:	9c                   	pushf
06dd      6dd:	58                   	pop    %rax
06de      6de:	fb                   	sti
06df      6df:	48 89 f8             	mov    %rdi,%rax
06e2      6e2:	48 89 f8             	mov    %rdi,%rax
06e5      6e5:	48 89 f8             	mov    %rdi,%rax
06e8      6e8:	9c                   	pushf
06e9      6e9:	58                   	pop    %rax
06ea      6ea:	fa                   	cli
06eb      6eb:	fb                   	sti
06ec      6ec:	0f 01 cb             	stac
06ef      6ef:	0f ae e8             	lfence
06f2      6f2:	0f 01 ca             	clac
06f5      6f5:	0f 01 ca             	clac
06f8      6f8:	0f 01 ca             	clac
06fb      6fb:	0f 01 cb             	stac
06fe      6fe:	0f ae e8             	lfence
0701      701:	0f 01 ca             	clac
0704      704:	e9 00 00 00 00       	jmp    709 <.altinstr_replacement+0x709>	705: R_X86_64_PC32	.text+0x1a6c11
0709      709:	e9 00 00 00 00       	jmp    70e <.altinstr_replacement+0x70e>	70a: R_X86_64_PC32	.text+0x1a6acc
070e      70e:	9c                   	pushf
070f      70f:	58                   	pop    %rax
0710      710:	fa                   	cli
0711      711:	9c                   	pushf
0712      712:	58                   	pop    %rax
0713      713:	fb                   	sti
0714      714:	48 89 f8             	mov    %rdi,%rax
0717      717:	9c                   	pushf
0718      718:	58                   	pop    %rax
0719      719:	fa                   	cli
071a      71a:	9c                   	pushf
071b      71b:	58                   	pop    %rax
071c      71c:	fb                   	sti
071d      71d:	e9 00 00 00 00       	jmp    722 <.altinstr_replacement+0x722>	71e: R_X86_64_PC32	.noinstr.text+0xe7d
0722      722:	0f 01 cb             	stac
0725      725:	e8 00 00 00 00       	call   72a <.altinstr_replacement+0x72a>	726: R_X86_64_PLT32	rep_movs_alternative-0x4
072a      72a:	0f 01 ca             	clac
072d      72d:	0f 01 cb             	stac
0730      730:	e8 00 00 00 00       	call   735 <.altinstr_replacement+0x735>	731: R_X86_64_PLT32	rep_movs_alternative-0x4
0735      735:	0f 01 ca             	clac
0738      738:	0f 01 cb             	stac
073b      73b:	e8 00 00 00 00       	call   740 <.altinstr_replacement+0x740>	73c: R_X86_64_PLT32	rep_movs_alternative-0x4
0740      740:	0f 01 ca             	clac
0743      743:	0f 01 cb             	stac
0746      746:	e8 00 00 00 00       	call   74b <.altinstr_replacement+0x74b>	747: R_X86_64_PLT32	rep_movs_alternative-0x4
074b      74b:	0f 01 ca             	clac
074e      74e:	9c                   	pushf
074f      74f:	58                   	pop    %rax
0750      750:	fa                   	cli
0751      751:	9c                   	pushf
0752      752:	58                   	pop    %rax
0753      753:	fb                   	sti
0754      754:	9c                   	pushf
0755      755:	58                   	pop    %rax
0756      756:	fa                   	cli
0757      757:	9c                   	pushf
0758      758:	58                   	pop    %rax
0759      759:	fb                   	sti
075a      75a:	9c                   	pushf
075b      75b:	58                   	pop    %rax
075c      75c:	e9 00 00 00 00       	jmp    761 <.altinstr_replacement+0x761>	75d: R_X86_64_PC32	.text+0x1d0dd7
0761      761:	e9 00 00 00 00       	jmp    766 <.altinstr_replacement+0x766>	762: R_X86_64_PC32	.text+0x1d5c34
0766      766:	9c                   	pushf
0767      767:	58                   	pop    %rax
0768      768:	fa                   	cli
0769      769:	fb                   	sti
076a      76a:	0f 30                	wrmsr
076c      76c:	0f 20 d8             	mov    %cr3,%rax
076f      76f:	e9 00 00 00 00       	jmp    774 <.altinstr_replacement+0x774>	770: R_X86_64_PC32	.noinstr.text+0x1580
0774      774:	e9 00 00 00 00       	jmp    779 <.altinstr_replacement+0x779>	775: R_X86_64_PC32	.noinstr.text+0x1592
0779      779:	0f ae e8             	lfence
077c      77c:	48 c7 c1 10 00 00 00 	mov    $0x10,%rcx
0783      783:	e8 01 00 00 00       	call   789 <.altinstr_replacement+0x789>
0788      788:	cc                   	int3
0789      789:	e8 01 00 00 00       	call   78f <.altinstr_replacement+0x78f>
078e      78e:	cc                   	int3
078f      78f:	48 83 c4 10          	add    $0x10,%rsp
0793      793:	48 ff c9             	dec    %rcx
0796      796:	75 eb                	jne    783 <.altinstr_replacement+0x783>
0798      798:	0f ae e8             	lfence
079b      79b:	65 48 c7 04 25 00 00 00 00 ff ff ff ff 	movq   $0xffffffffffffffff,%gs:0x0	7a0: R_X86_64_32S	pcpu_hot+0x10
07a8      7a8:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	7ad: R_X86_64_32S	__x86_ctxsw_count
07b1      7b1:	90                   	nop
07b2      7b2:	90                   	nop
07b3      7b3:	e8 01 00 00 00       	call   7b9 <.altinstr_replacement+0x7b9>
07b8      7b8:	cc                   	int3
07b9      7b9:	48 83 c4 08          	add    $0x8,%rsp
07bd      7bd:	0f ae e8             	lfence
07c0      7c0:	9c                   	pushf
07c1      7c1:	58                   	pop    %rax
07c2      7c2:	fa                   	cli
07c3      7c3:	fb                   	sti
07c4      7c4:	fb                   	sti
07c5      7c5:	fb                   	sti
07c6      7c6:	0f 30                	wrmsr
07c8      7c8:	9c                   	pushf
07c9      7c9:	58                   	pop    %rax
07ca      7ca:	fa                   	cli
07cb      7cb:	9c                   	pushf
07cc      7cc:	58                   	pop    %rax
07cd      7cd:	fb                   	sti
07ce      7ce:	9c                   	pushf
07cf      7cf:	58                   	pop    %rax
07d0      7d0:	fa                   	cli
07d1      7d1:	9c                   	pushf
07d2      7d2:	58                   	pop    %rax
07d3      7d3:	fb                   	sti
07d4      7d4:	0f 01 cb             	stac
07d7      7d7:	e8 00 00 00 00       	call   7dc <.altinstr_replacement+0x7dc>	7d8: R_X86_64_PLT32	rep_movs_alternative-0x4
07dc      7dc:	0f 01 ca             	clac
07df      7df:	e9 00 00 00 00       	jmp    7e4 <.altinstr_replacement+0x7e4>	7e0: R_X86_64_PC32	.text+0x24ff2f
07e4      7e4:	e9 00 00 00 00       	jmp    7e9 <.altinstr_replacement+0x7e9>	7e5: R_X86_64_PC32	.text+0x250c50
07e9      7e9:	e9 00 00 00 00       	jmp    7ee <.altinstr_replacement+0x7ee>	7ea: R_X86_64_PC32	.text+0x252831
07ee      7ee:	e9 00 00 00 00       	jmp    7f3 <.altinstr_replacement+0x7f3>	7ef: R_X86_64_PC32	.text+0x252a3b
07f3      7f3:	e9 00 00 00 00       	jmp    7f8 <.altinstr_replacement+0x7f8>	7f4: R_X86_64_PC32	.text+0x252cb6
07f8      7f8:	e8 00 00 00 00       	call   7fd <.altinstr_replacement+0x7fd>	7f9: R_X86_64_PLT32	clear_page_rep-0x4
07fd      7fd:	e8 00 00 00 00       	call   802 <.altinstr_replacement+0x802>	7fe: R_X86_64_PLT32	clear_page_erms-0x4
0802      802:	e9 00 00 00 00       	jmp    807 <.altinstr_replacement+0x807>	803: R_X86_64_PC32	.text+0x256902
0807      807:	0f 30                	wrmsr
0809      809:	e9 00 00 00 00       	jmp    80e <.altinstr_replacement+0x80e>	80a: R_X86_64_PC32	.text+0x25b30e
080e      80e:	e9 00 00 00 00       	jmp    813 <.altinstr_replacement+0x813>	80f: R_X86_64_PC32	.text+0x25d810
0813      813:	e9 00 00 00 00       	jmp    818 <.altinstr_replacement+0x818>	814: R_X86_64_PC32	.text+0x25dba5
0818      818:	e9 00 00 00 00       	jmp    81d <.altinstr_replacement+0x81d>	819: R_X86_64_PC32	.text+0x26137d
081d      81d:	e9 00 00 00 00       	jmp    822 <.altinstr_replacement+0x822>	81e: R_X86_64_PC32	.text+0x2638e8
0822      822:	e9 00 00 00 00       	jmp    827 <.altinstr_replacement+0x827>	823: R_X86_64_PC32	.text+0x263997
0827      827:	e9 00 00 00 00       	jmp    82c <.altinstr_replacement+0x82c>	828: R_X86_64_PC32	.text+0x267b8c
082c      82c:	e9 00 00 00 00       	jmp    831 <.altinstr_replacement+0x831>	82d: R_X86_64_PC32	.text+0x267b76
0831      831:	e9 00 00 00 00       	jmp    836 <.altinstr_replacement+0x836>	832: R_X86_64_PC32	.noinstr.text+0x1b08
0836      836:	48 c7 c0 10 00 00 00 	mov    $0x10,%rax
083d      83d:	e8 01 00 00 00       	call   843 <.altinstr_replacement+0x843>
0842      842:	cc                   	int3
0843      843:	e8 01 00 00 00       	call   849 <.altinstr_replacement+0x849>
0848      848:	cc                   	int3
0849      849:	48 83 c4 10          	add    $0x10,%rsp
084d      84d:	48 ff c8             	dec    %rax
0850      850:	75 eb                	jne    83d <.altinstr_replacement+0x83d>
0852      852:	0f ae e8             	lfence
0855      855:	65 48 c7 04 25 00 00 00 00 ff ff ff ff 	movq   $0xffffffffffffffff,%gs:0x0	85a: R_X86_64_32S	pcpu_hot+0x10
0862      862:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	867: R_X86_64_32S	__x86_ctxsw_count
086b      86b:	90                   	nop
086c      86c:	90                   	nop
086d      86d:	e8 01 00 00 00       	call   873 <.altinstr_replacement+0x873>
0872      872:	cc                   	int3
0873      873:	48 83 c4 08          	add    $0x8,%rsp
0877      877:	0f ae e8             	lfence
087a      87a:	e9 00 00 00 00       	jmp    87f <.altinstr_replacement+0x87f>	87b: R_X86_64_PC32	.noinstr.text+0x1b2a
087f      87f:	e8 00 00 00 00       	call   884 <.altinstr_replacement+0x884>	880: R_X86_64_PLT32	zen_untrain_ret-0x4
0884      884:	e8 00 00 00 00       	call   889 <.altinstr_replacement+0x889>	885: R_X86_64_PLT32	entry_ibpb-0x4
0889      889:	31 c0                	xor    %eax,%eax
088b      88b:	48 0f ba e8 3f       	bts    $0x3f,%rax
0890      890:	65 48 89 04 25 00 00 00 00 	mov    %rax,%gs:0x0	895: R_X86_64_32S	pcpu_hot+0x10
0899      899:	e9 00 00 00 00       	jmp    89e <.altinstr_replacement+0x89e>	89a: R_X86_64_PC32	.noinstr.text+0x1c7d
089e      89e:	48 c7 c0 10 00 00 00 	mov    $0x10,%rax
08a5      8a5:	e8 01 00 00 00       	call   8ab <.altinstr_replacement+0x8ab>
08aa      8aa:	cc                   	int3
08ab      8ab:	e8 01 00 00 00       	call   8b1 <.altinstr_replacement+0x8b1>
08b0      8b0:	cc                   	int3
08b1      8b1:	48 83 c4 10          	add    $0x10,%rsp
08b5      8b5:	48 ff c8             	dec    %rax
08b8      8b8:	75 eb                	jne    8a5 <.altinstr_replacement+0x8a5>
08ba      8ba:	0f ae e8             	lfence
08bd      8bd:	65 48 c7 04 25 00 00 00 00 ff ff ff ff 	movq   $0xffffffffffffffff,%gs:0x0	8c2: R_X86_64_32S	pcpu_hot+0x10
08ca      8ca:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	8cf: R_X86_64_32S	__x86_ctxsw_count
08d3      8d3:	90                   	nop
08d4      8d4:	90                   	nop
08d5      8d5:	e8 01 00 00 00       	call   8db <.altinstr_replacement+0x8db>
08da      8da:	cc                   	int3
08db      8db:	48 83 c4 08          	add    $0x8,%rsp
08df      8df:	0f ae e8             	lfence
08e2      8e2:	e9 00 00 00 00       	jmp    8e7 <.altinstr_replacement+0x8e7>	8e3: R_X86_64_PC32	.noinstr.text+0x1c9b
08e7      8e7:	e8 00 00 00 00       	call   8ec <.altinstr_replacement+0x8ec>	8e8: R_X86_64_PLT32	zen_untrain_ret-0x4
08ec      8ec:	e8 00 00 00 00       	call   8f1 <.altinstr_replacement+0x8f1>	8ed: R_X86_64_PLT32	entry_ibpb-0x4
08f1      8f1:	31 c0                	xor    %eax,%eax
08f3      8f3:	48 0f ba e8 3f       	bts    $0x3f,%rax
08f8      8f8:	65 48 89 04 25 00 00 00 00 	mov    %rax,%gs:0x0	8fd: R_X86_64_32S	pcpu_hot+0x10
0901      901:	0f 01 cb             	stac
0904      904:	e8 00 00 00 00       	call   909 <.altinstr_replacement+0x909>	905: R_X86_64_PLT32	rep_stos_alternative-0x4
0909      909:	0f 01 ca             	clac
090c      90c:	e9 00 00 00 00       	jmp    911 <.altinstr_replacement+0x911>	90d: R_X86_64_PC32	.text+0x28a5f4
0911      911:	e8 00 00 00 00       	call   916 <.altinstr_replacement+0x916>	912: R_X86_64_PLT32	clear_page_rep-0x4
0916      916:	e8 00 00 00 00       	call   91b <.altinstr_replacement+0x91b>	917: R_X86_64_PLT32	clear_page_erms-0x4
091b      91b:	48 89 f8             	mov    %rdi,%rax
091e      91e:	e9 00 00 00 00       	jmp    923 <.altinstr_replacement+0x923>	91f: R_X86_64_PC32	.init.text+0x2fab9
0923      923:	e9 00 00 00 00       	jmp    928 <.altinstr_replacement+0x928>	924: R_X86_64_PC32	.init.text+0x33287
0928      928:	e9 00 00 00 00       	jmp    92d <.altinstr_replacement+0x92d>	929: R_X86_64_PC32	.text+0x290517
092d      92d:	e9 00 00 00 00       	jmp    932 <.altinstr_replacement+0x932>	92e: R_X86_64_PC32	.text+0x2906c5
0932      932:	9c                   	pushf
0933      933:	58                   	pop    %rax
0934      934:	48 89 f8             	mov    %rdi,%rax
0937      937:	48 89 f8             	mov    %rdi,%rax
093a      93a:	48 89 f8             	mov    %rdi,%rax
093d      93d:	48 89 f8             	mov    %rdi,%rax
0940      940:	48 89 f8             	mov    %rdi,%rax
0943      943:	48 89 f8             	mov    %rdi,%rax
0946      946:	48 89 f8             	mov    %rdi,%rax
0949      949:	48 89 f8             	mov    %rdi,%rax
094c      94c:	48 89 f8             	mov    %rdi,%rax
094f      94f:	48 89 f8             	mov    %rdi,%rax
0952      952:	48 89 f8             	mov    %rdi,%rax
0955      955:	9c                   	pushf
0956      956:	58                   	pop    %rax
0957      957:	fa                   	cli
0958      958:	9c                   	pushf
0959      959:	58                   	pop    %rax
095a      95a:	fb                   	sti
095b      95b:	9c                   	pushf
095c      95c:	58                   	pop    %rax
095d      95d:	fa                   	cli
095e      95e:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
0968      968:	48 89 f8             	mov    %rdi,%rax
096b      96b:	48 89 f8             	mov    %rdi,%rax
096e      96e:	e9 00 00 00 00       	jmp    973 <.altinstr_replacement+0x973>	96f: R_X86_64_PC32	.text+0x29e278
0973      973:	48 89 f8             	mov    %rdi,%rax
0976      976:	48 89 f8             	mov    %rdi,%rax
0979      979:	48 89 f8             	mov    %rdi,%rax
097c      97c:	e9 00 00 00 00       	jmp    981 <.altinstr_replacement+0x981>	97d: R_X86_64_PC32	.text+0x29ffb7
0981      981:	e9 00 00 00 00       	jmp    986 <.altinstr_replacement+0x986>	982: R_X86_64_PC32	.text+0x2a002a
0986      986:	48 89 f8             	mov    %rdi,%rax
0989      989:	48 89 f8             	mov    %rdi,%rax
098c      98c:	9c                   	pushf
098d      98d:	58                   	pop    %rax
098e      98e:	fb                   	sti
098f      98f:	9c                   	pushf
0990      990:	58                   	pop    %rax
0991      991:	fa                   	cli
0992      992:	9c                   	pushf
0993      993:	58                   	pop    %rax
0994      994:	9c                   	pushf
0995      995:	58                   	pop    %rax
0996      996:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
09a0      9a0:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
09aa      9aa:	48 89 f8             	mov    %rdi,%rax
09ad      9ad:	0f 20 d8             	mov    %cr3,%rax
09b0      9b0:	e9 00 00 00 00       	jmp    9b5 <.altinstr_replacement+0x9b5>	9b1: R_X86_64_PC32	.init.text+0x3a498
09b5      9b5:	48 89 f8             	mov    %rdi,%rax
09b8      9b8:	48 89 f8             	mov    %rdi,%rax
09bb      9bb:	48 89 f8             	mov    %rdi,%rax
09be      9be:	48 89 f8             	mov    %rdi,%rax
09c1      9c1:	48 89 f8             	mov    %rdi,%rax
09c4      9c4:	0f 20 d8             	mov    %cr3,%rax
09c7      9c7:	e8 00 00 00 00       	call   9cc <.altinstr_replacement+0x9cc>	9c8: R_X86_64_PLT32	clear_page_rep-0x4
09cc      9cc:	e8 00 00 00 00       	call   9d1 <.altinstr_replacement+0x9d1>	9cd: R_X86_64_PLT32	clear_page_erms-0x4
09d1      9d1:	e8 00 00 00 00       	call   9d6 <.altinstr_replacement+0x9d6>	9d2: R_X86_64_PLT32	clear_page_rep-0x4
09d6      9d6:	e8 00 00 00 00       	call   9db <.altinstr_replacement+0x9db>	9d7: R_X86_64_PLT32	clear_page_erms-0x4
09db      9db:	e8 00 00 00 00       	call   9e0 <.altinstr_replacement+0x9e0>	9dc: R_X86_64_PLT32	clear_page_rep-0x4
09e0      9e0:	e8 00 00 00 00       	call   9e5 <.altinstr_replacement+0x9e5>	9e1: R_X86_64_PLT32	clear_page_erms-0x4
09e5      9e5:	48 89 f8             	mov    %rdi,%rax
09e8      9e8:	48 89 f8             	mov    %rdi,%rax
09eb      9eb:	e9 00 00 00 00       	jmp    9f0 <.altinstr_replacement+0x9f0>	9ec: R_X86_64_PC32	.init.text+0x3b819
09f0      9f0:	48 89 f8             	mov    %rdi,%rax
09f3      9f3:	48 89 f8             	mov    %rdi,%rax
09f6      9f6:	e9 00 00 00 00       	jmp    9fb <.altinstr_replacement+0x9fb>	9f7: R_X86_64_PC32	.init.text+0x3ba5a
09fb      9fb:	48 89 f8             	mov    %rdi,%rax
09fe      9fe:	48 89 f8             	mov    %rdi,%rax
0a01      a01:	48 89 f8             	mov    %rdi,%rax
0a04      a04:	48 89 f8             	mov    %rdi,%rax
0a07      a07:	48 89 f8             	mov    %rdi,%rax
0a0a      a0a:	48 89 f8             	mov    %rdi,%rax
0a0d      a0d:	48 89 f8             	mov    %rdi,%rax
0a10      a10:	48 89 f8             	mov    %rdi,%rax
0a13      a13:	48 89 f8             	mov    %rdi,%rax
0a16      a16:	48 89 f8             	mov    %rdi,%rax
0a19      a19:	48 89 f8             	mov    %rdi,%rax
0a1c      a1c:	48 89 f8             	mov    %rdi,%rax
0a1f      a1f:	48 89 f8             	mov    %rdi,%rax
0a22      a22:	e8 00 00 00 00       	call   a27 <.altinstr_replacement+0xa27>	a23: R_X86_64_PLT32	clear_page_rep-0x4
0a27      a27:	e8 00 00 00 00       	call   a2c <.altinstr_replacement+0xa2c>	a28: R_X86_64_PLT32	clear_page_erms-0x4
0a2c      a2c:	e8 00 00 00 00       	call   a31 <.altinstr_replacement+0xa31>	a2d: R_X86_64_PLT32	clear_page_rep-0x4
0a31      a31:	e8 00 00 00 00       	call   a36 <.altinstr_replacement+0xa36>	a32: R_X86_64_PLT32	clear_page_erms-0x4
0a36      a36:	9c                   	pushf
0a37      a37:	58                   	pop    %rax
0a38      a38:	9c                   	pushf
0a39      a39:	58                   	pop    %rax
0a3a      a3a:	fa                   	cli
0a3b      a3b:	e8 00 00 00 00       	call   a40 <.altinstr_replacement+0xa40>	a3c: R_X86_64_PLT32	__x86_indirect_thunk_rax-0x4
0a40      a40:	0f ae e8             	lfence
0a43      a43:	ff d0                	call   *%rax
0a45      a45:	9c                   	pushf
0a46      a46:	58                   	pop    %rax
0a47      a47:	fb                   	sti
0a48      a48:	9c                   	pushf
0a49      a49:	58                   	pop    %rax
0a4a      a4a:	9c                   	pushf
0a4b      a4b:	58                   	pop    %rax
0a4c      a4c:	9c                   	pushf
0a4d      a4d:	58                   	pop    %rax
0a4e      a4e:	48 89 f8             	mov    %rdi,%rax
0a51      a51:	48 89 f8             	mov    %rdi,%rax
0a54      a54:	48 89 f8             	mov    %rdi,%rax
0a57      a57:	48 89 f8             	mov    %rdi,%rax
0a5a      a5a:	48 89 f8             	mov    %rdi,%rax
0a5d      a5d:	48 89 f8             	mov    %rdi,%rax
0a60      a60:	48 89 f8             	mov    %rdi,%rax
0a63      a63:	fb                   	sti
0a64      a64:	0f 22 df             	mov    %rdi,%cr3
0a67      a67:	0f 22 df             	mov    %rdi,%cr3
0a6a      a6a:	9c                   	pushf
0a6b      a6b:	58                   	pop    %rax
0a6c      a6c:	fa                   	cli
0a6d      a6d:	e8 00 00 00 00       	call   a72 <.altinstr_replacement+0xa72>	a6e: R_X86_64_PLT32	__x86_indirect_thunk_rbx-0x4
0a72      a72:	0f ae e8             	lfence
0a75      a75:	ff d3                	call   *%rbx
0a77      a77:	9c                   	pushf
0a78      a78:	58                   	pop    %rax
0a79      a79:	fb                   	sti
0a7a      a7a:	e9 00 00 00 00       	jmp    a7f <.altinstr_replacement+0xa7f>	a7b: R_X86_64_PC32	.init.text+0x4281c
0a7f      a7f:	e8 00 00 00 00       	call   a84 <.altinstr_replacement+0xa84>	a80: R_X86_64_PLT32	__x86_indirect_thunk_r15-0x4
0a84      a84:	0f ae e8             	lfence
0a87      a87:	41 ff d7             	call   *%r15
0a8a      a8a:	e8 00 00 00 00       	call   a8f <.altinstr_replacement+0xa8f>	a8b: R_X86_64_PLT32	__x86_indirect_thunk_r12-0x4
0a8f      a8f:	0f ae e8             	lfence
0a92      a92:	41 ff d4             	call   *%r12
0a95      a95:	9c                   	pushf
0a96      a96:	58                   	pop    %rax
0a97      a97:	fa                   	cli
0a98      a98:	e8 00 00 00 00       	call   a9d <.altinstr_replacement+0xa9d>	a99: R_X86_64_PLT32	__x86_indirect_thunk_rbp-0x4
0a9d      a9d:	0f ae e8             	lfence
0aa0      aa0:	ff d5                	call   *%rbp
0aa2      aa2:	e8 00 00 00 00       	call   aa7 <.altinstr_replacement+0xaa7>	aa3: R_X86_64_PLT32	__x86_indirect_thunk_rbp-0x4
0aa7      aa7:	0f ae e8             	lfence
0aaa      aaa:	ff d5                	call   *%rbp
0aac      aac:	9c                   	pushf
0aad      aad:	58                   	pop    %rax
0aae      aae:	fb                   	sti
0aaf      aaf:	9c                   	pushf
0ab0      ab0:	58                   	pop    %rax
0ab1      ab1:	9c                   	pushf
0ab2      ab2:	58                   	pop    %rax
0ab3      ab3:	9c                   	pushf
0ab4      ab4:	58                   	pop    %rax
0ab5      ab5:	fb                   	sti
0ab6      ab6:	fb                   	sti
0ab7      ab7:	9c                   	pushf
0ab8      ab8:	58                   	pop    %rax
0ab9      ab9:	fa                   	cli
0aba      aba:	9c                   	pushf
0abb      abb:	58                   	pop    %rax
0abc      abc:	fb                   	sti
0abd      abd:	e8 00 00 00 00       	call   ac2 <.altinstr_replacement+0xac2>	abe: R_X86_64_PLT32	__x86_indirect_thunk_r12-0x4
0ac2      ac2:	0f ae e8             	lfence
0ac5      ac5:	41 ff d4             	call   *%r12
0ac8      ac8:	9c                   	pushf
0ac9      ac9:	58                   	pop    %rax
0aca      aca:	fb                   	sti
0acb      acb:	9c                   	pushf
0acc      acc:	58                   	pop    %rax
0acd      acd:	9c                   	pushf
0ace      ace:	58                   	pop    %rax
0acf      acf:	fa                   	cli
0ad0      ad0:	e8 00 00 00 00       	call   ad5 <.altinstr_replacement+0xad5>	ad1: R_X86_64_PLT32	__x86_indirect_thunk_r13-0x4
0ad5      ad5:	0f ae e8             	lfence
0ad8      ad8:	41 ff d5             	call   *%r13
0adb      adb:	9c                   	pushf
0adc      adc:	58                   	pop    %rax
0add      add:	fb                   	sti
0ade      ade:	9c                   	pushf
0adf      adf:	58                   	pop    %rax
0ae0      ae0:	fb                   	sti
0ae1      ae1:	9c                   	pushf
0ae2      ae2:	58                   	pop    %rax
0ae3      ae3:	fa                   	cli
0ae4      ae4:	e8 00 00 00 00       	call   ae9 <.altinstr_replacement+0xae9>	ae5: R_X86_64_PLT32	__x86_indirect_thunk_r13-0x4
0ae9      ae9:	0f ae e8             	lfence
0aec      aec:	41 ff d5             	call   *%r13
0aef      aef:	9c                   	pushf
0af0      af0:	58                   	pop    %rax
0af1      af1:	fb                   	sti
0af2      af2:	9c                   	pushf
0af3      af3:	58                   	pop    %rax
0af4      af4:	fa                   	cli
0af5      af5:	9c                   	pushf
0af6      af6:	58                   	pop    %rax
0af7      af7:	fb                   	sti
0af8      af8:	e8 00 00 00 00       	call   afd <.altinstr_replacement+0xafd>	af9: R_X86_64_PLT32	__x86_indirect_thunk_r15-0x4
0afd      afd:	0f ae e8             	lfence
0b00      b00:	41 ff d7             	call   *%r15
0b03      b03:	9c                   	pushf
0b04      b04:	58                   	pop    %rax
0b05      b05:	fb                   	sti
0b06      b06:	9c                   	pushf
0b07      b07:	58                   	pop    %rax
0b08      b08:	fa                   	cli
0b09      b09:	9c                   	pushf
0b0a      b0a:	58                   	pop    %rax
0b0b      b0b:	fb                   	sti
0b0c      b0c:	9c                   	pushf
0b0d      b0d:	58                   	pop    %rax
0b0e      b0e:	9c                   	pushf
0b0f      b0f:	58                   	pop    %rax
0b10      b10:	fa                   	cli
0b11      b11:	9c                   	pushf
0b12      b12:	58                   	pop    %rax
0b13      b13:	fb                   	sti
0b14      b14:	9c                   	pushf
0b15      b15:	58                   	pop    %rax
0b16      b16:	9c                   	pushf
0b17      b17:	58                   	pop    %rax
0b18      b18:	fa                   	cli
0b19      b19:	9c                   	pushf
0b1a      b1a:	58                   	pop    %rax
0b1b      b1b:	fb                   	sti
0b1c      b1c:	9c                   	pushf
0b1d      b1d:	58                   	pop    %rax
0b1e      b1e:	fb                   	sti
0b1f      b1f:	e9 00 00 00 00       	jmp    b24 <.altinstr_replacement+0xb24>	b20: R_X86_64_PC32	.text+0x2c2043
0b24      b24:	9c                   	pushf
0b25      b25:	58                   	pop    %rax
0b26      b26:	fa                   	cli
0b27      b27:	e8 00 00 00 00       	call   b2c <.altinstr_replacement+0xb2c>	b28: R_X86_64_PLT32	__x86_indirect_thunk_r14-0x4
0b2c      b2c:	0f ae e8             	lfence
0b2f      b2f:	41 ff d6             	call   *%r14
0b32      b32:	9c                   	pushf
0b33      b33:	58                   	pop    %rax
0b34      b34:	fb                   	sti
0b35      b35:	9c                   	pushf
0b36      b36:	58                   	pop    %rax
0b37      b37:	fb                   	sti
0b38      b38:	9c                   	pushf
0b39      b39:	58                   	pop    %rax
0b3a      b3a:	fa                   	cli
0b3b      b3b:	e8 00 00 00 00       	call   b40 <.altinstr_replacement+0xb40>	b3c: R_X86_64_PLT32	__x86_indirect_thunk_r13-0x4
0b40      b40:	0f ae e8             	lfence
0b43      b43:	41 ff d5             	call   *%r13
0b46      b46:	9c                   	pushf
0b47      b47:	58                   	pop    %rax
0b48      b48:	fb                   	sti
0b49      b49:	e8 00 00 00 00       	call   b4e <.altinstr_replacement+0xb4e>	b4a: R_X86_64_PLT32	__x86_indirect_thunk_rax-0x4
0b4e      b4e:	0f ae e8             	lfence
0b51      b51:	ff d0                	call   *%rax
0b53      b53:	41 87 b4 24 00 c0 5f ff 	xchg   %esi,-0xa04000(%r12)
0b5b      b5b:	e8 00 00 00 00       	call   b60 <.altinstr_replacement+0xb60>	b5c: R_X86_64_PLT32	__x86_indirect_thunk_rbp-0x4
0b60      b60:	0f ae e8             	lfence
0b63      b63:	ff d5                	call   *%rbp
0b65      b65:	9c                   	pushf
0b66      b66:	58                   	pop    %rax
0b67      b67:	fa                   	cli
0b68      b68:	e8 00 00 00 00       	call   b6d <.altinstr_replacement+0xb6d>	b69: R_X86_64_PLT32	__x86_indirect_thunk_r12-0x4
0b6d      b6d:	0f ae e8             	lfence
0b70      b70:	41 ff d4             	call   *%r12
0b73      b73:	9c                   	pushf
0b74      b74:	58                   	pop    %rax
0b75      b75:	fb                   	sti
0b76      b76:	9c                   	pushf
0b77      b77:	58                   	pop    %rax
0b78      b78:	fa                   	cli
0b79      b79:	e8 00 00 00 00       	call   b7e <.altinstr_replacement+0xb7e>	b7a: R_X86_64_PLT32	__x86_indirect_thunk_r13-0x4
0b7e      b7e:	0f ae e8             	lfence
0b81      b81:	41 ff d5             	call   *%r13
0b84      b84:	9c                   	pushf
0b85      b85:	58                   	pop    %rax
0b86      b86:	fb                   	sti
0b87      b87:	9c                   	pushf
0b88      b88:	58                   	pop    %rax
0b89      b89:	fa                   	cli
0b8a      b8a:	e8 00 00 00 00       	call   b8f <.altinstr_replacement+0xb8f>	b8b: R_X86_64_PLT32	__x86_indirect_thunk_rbx-0x4
0b8f      b8f:	0f ae e8             	lfence
0b92      b92:	ff d3                	call   *%rbx
0b94      b94:	9c                   	pushf
0b95      b95:	58                   	pop    %rax
0b96      b96:	fb                   	sti
0b97      b97:	e9 00 00 00 00       	jmp    b9c <.altinstr_replacement+0xb9c>	b98: R_X86_64_PC32	.init.text+0x437ca
0b9c      b9c:	9c                   	pushf
0b9d      b9d:	58                   	pop    %rax
0b9e      b9e:	fa                   	cli
0b9f      b9f:	e8 00 00 00 00       	call   ba4 <.altinstr_replacement+0xba4>	ba0: R_X86_64_PLT32	__x86_indirect_thunk_r15-0x4
0ba4      ba4:	0f ae e8             	lfence
0ba7      ba7:	41 ff d7             	call   *%r15
0baa      baa:	9c                   	pushf
0bab      bab:	58                   	pop    %rax
0bac      bac:	fb                   	sti
0bad      bad:	9c                   	pushf
0bae      bae:	58                   	pop    %rax
0baf      baf:	fa                   	cli
0bb0      bb0:	e8 00 00 00 00       	call   bb5 <.altinstr_replacement+0xbb5>	bb1: R_X86_64_PLT32	__x86_indirect_thunk_r13-0x4
0bb5      bb5:	0f ae e8             	lfence
0bb8      bb8:	41 ff d5             	call   *%r13
0bbb      bbb:	e8 00 00 00 00       	call   bc0 <.altinstr_replacement+0xbc0>	bbc: R_X86_64_PLT32	__x86_indirect_thunk_rbx-0x4
0bc0      bc0:	0f ae e8             	lfence
0bc3      bc3:	ff d3                	call   *%rbx
0bc5      bc5:	9c                   	pushf
0bc6      bc6:	58                   	pop    %rax
0bc7      bc7:	fb                   	sti
0bc8      bc8:	9c                   	pushf
0bc9      bc9:	58                   	pop    %rax
0bca      bca:	fa                   	cli
0bcb      bcb:	9c                   	pushf
0bcc      bcc:	58                   	pop    %rax
0bcd      bcd:	fb                   	sti
0bce      bce:	9c                   	pushf
0bcf      bcf:	58                   	pop    %rax
0bd0      bd0:	fa                   	cli
0bd1      bd1:	9c                   	pushf
0bd2      bd2:	58                   	pop    %rax
0bd3      bd3:	fb                   	sti
0bd4      bd4:	0f 22 df             	mov    %rdi,%cr3
0bd7      bd7:	0f 22 df             	mov    %rdi,%cr3
0bda      bda:	0f 20 d8             	mov    %cr3,%rax
0bdd      bdd:	e8 00 00 00 00       	call   be2 <.altinstr_replacement+0xbe2>	bde: R_X86_64_PLT32	clear_page_rep-0x4
0be2      be2:	e8 00 00 00 00       	call   be7 <.altinstr_replacement+0xbe7>	be3: R_X86_64_PLT32	clear_page_erms-0x4
0be7      be7:	e9 00 00 00 00       	jmp    bec <.altinstr_replacement+0xbec>	be8: R_X86_64_PC32	.noinstr.text+0x4091
0bec      bec:	e9 00 00 00 00       	jmp    bf1 <.altinstr_replacement+0xbf1>	bed: R_X86_64_PC32	.noinstr.text+0x4186
0bf1      bf1:	9c                   	pushf
0bf2      bf2:	58                   	pop    %rax
0bf3      bf3:	fa                   	cli
0bf4      bf4:	e9 00 00 00 00       	jmp    bf9 <.altinstr_replacement+0xbf9>	bf5: R_X86_64_PC32	.text+0x2c7484
0bf9      bf9:	9c                   	pushf
0bfa      bfa:	58                   	pop    %rax
0bfb      bfb:	fb                   	sti
0bfc      bfc:	e9 00 00 00 00       	jmp    c01 <.altinstr_replacement+0xc01>	bfd: R_X86_64_PC32	.text+0x2c75d8
0c01      c01:	e9 00 00 00 00       	jmp    c06 <.altinstr_replacement+0xc06>	c02: R_X86_64_PC32	.text+0x2c7897
0c06      c06:	0f 20 d8             	mov    %cr3,%rax
0c09      c09:	0f 22 df             	mov    %rdi,%cr3
0c0c      c0c:	0f 20 d0             	mov    %cr2,%rax
0c0f      c0f:	0f 20 d8             	mov    %cr3,%rax
0c12      c12:	e9 00 00 00 00       	jmp    c17 <.altinstr_replacement+0xc17>	c13: R_X86_64_PC32	.text+0x2c7dd3
0c17      c17:	e9 00 00 00 00       	jmp    c1c <.altinstr_replacement+0xc1c>	c18: R_X86_64_PC32	.text+0x2c7e95
0c1c      c1c:	9c                   	pushf
0c1d      c1d:	58                   	pop    %rax
0c1e      c1e:	fa                   	cli
0c1f      c1f:	9c                   	pushf
0c20      c20:	58                   	pop    %rax
0c21      c21:	fb                   	sti
0c22      c22:	9c                   	pushf
0c23      c23:	58                   	pop    %rax
0c24      c24:	fa                   	cli
0c25      c25:	9c                   	pushf
0c26      c26:	58                   	pop    %rax
0c27      c27:	fb                   	sti
0c28      c28:	e9 00 00 00 00       	jmp    c2d <.altinstr_replacement+0xc2d>	c29: R_X86_64_PC32	.text+0x2c89ec
0c2d      c2d:	e9 00 00 00 00       	jmp    c32 <.altinstr_replacement+0xc32>	c2e: R_X86_64_PC32	.text+0x2c8a18
0c32      c32:	e9 00 00 00 00       	jmp    c37 <.altinstr_replacement+0xc37>	c33: R_X86_64_PC32	.text+0x2c88cf
0c37      c37:	e9 00 00 00 00       	jmp    c3c <.altinstr_replacement+0xc3c>	c38: R_X86_64_PC32	.text+0x2c8921
0c3c      c3c:	e9 00 00 00 00       	jmp    c41 <.altinstr_replacement+0xc41>	c3d: R_X86_64_PC32	.text+0x2c8956
0c41      c41:	e9 00 00 00 00       	jmp    c46 <.altinstr_replacement+0xc46>	c42: R_X86_64_PC32	.text+0x2c8bf4
0c46      c46:	e9 00 00 00 00       	jmp    c4b <.altinstr_replacement+0xc4b>	c47: R_X86_64_PC32	.text+0x2c8bd0
0c4b      c4b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0c55      c55:	e9 00 00 00 00       	jmp    c5a <.altinstr_replacement+0xc5a>	c56: R_X86_64_PC32	.text+0x2c90c9
0c5a      c5a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0c64      c64:	0f 01 cb             	stac
0c67      c67:	0f ae e8             	lfence
0c6a      c6a:	0f 01 ca             	clac
0c6d      c6d:	0f 01 ca             	clac
0c70      c70:	0f 01 cb             	stac
0c73      c73:	0f ae e8             	lfence
0c76      c76:	0f 01 ca             	clac
0c79      c79:	0f 01 ca             	clac
0c7c      c7c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0c86      c86:	fb                   	sti
0c87      c87:	fa                   	cli
0c88      c88:	9c                   	pushf
0c89      c89:	58                   	pop    %rax
0c8a      c8a:	e9 00 00 00 00       	jmp    c8f <.altinstr_replacement+0xc8f>	c8b: R_X86_64_PC32	.text+0x2cb12a
0c8f      c8f:	e9 00 00 00 00       	jmp    c94 <.altinstr_replacement+0xc94>	c90: R_X86_64_PC32	.text+0x2cb16c
0c94      c94:	9c                   	pushf
0c95      c95:	58                   	pop    %rax
0c96      c96:	fa                   	cli
0c97      c97:	e9 00 00 00 00       	jmp    c9c <.altinstr_replacement+0xc9c>	c98: R_X86_64_PC32	.text+0x2cb41a
0c9c      c9c:	e9 00 00 00 00       	jmp    ca1 <.altinstr_replacement+0xca1>	c9d: R_X86_64_PC32	.text+0x2cb531
0ca1      ca1:	fb                   	sti
0ca2      ca2:	9c                   	pushf
0ca3      ca3:	58                   	pop    %rax
0ca4      ca4:	fa                   	cli
0ca5      ca5:	fb                   	sti
0ca6      ca6:	fb                   	sti
0ca7      ca7:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0cb1      cb1:	e9 00 00 00 00       	jmp    cb6 <.altinstr_replacement+0xcb6>	cb2: R_X86_64_PC32	.noinstr.text+0x4635
0cb6      cb6:	fb                   	sti
0cb7      cb7:	9c                   	pushf
0cb8      cb8:	58                   	pop    %rax
0cb9      cb9:	fa                   	cli
0cba      cba:	0f 20 d0             	mov    %cr2,%rax
0cbd      cbd:	fb                   	sti
0cbe      cbe:	e9 00 00 00 00       	jmp    cc3 <.altinstr_replacement+0xcc3>	cbf: R_X86_64_PC32	.noinstr.text+0x511f
0cc3      cc3:	fb                   	sti
0cc4      cc4:	fb                   	sti
0cc5      cc5:	e9 00 00 00 00       	jmp    cca <.altinstr_replacement+0xcca>	cc6: R_X86_64_PC32	.noinstr.text+0x5704
0cca      cca:	fb                   	sti
0ccb      ccb:	9c                   	pushf
0ccc      ccc:	58                   	pop    %rax
0ccd      ccd:	fa                   	cli
0cce      cce:	fb                   	sti
0ccf      ccf:	e9 00 00 00 00       	jmp    cd4 <.altinstr_replacement+0xcd4>	cd0: R_X86_64_PC32	.init.text+0x469e5
0cd4      cd4:	9c                   	pushf
0cd5      cd5:	58                   	pop    %rax
0cd6      cd6:	fb                   	sti
0cd7      cd7:	c6 07 00             	movb   $0x0,(%rdi)
0cda      cda:	9c                   	pushf
0cdb      cdb:	58                   	pop    %rax
0cdc      cdc:	fa                   	cli
0cdd      cdd:	0f 20 d0             	mov    %cr2,%rax
0ce0      ce0:	e9 00 00 00 00       	jmp    ce5 <.altinstr_replacement+0xce5>	ce1: R_X86_64_PC32	.noinstr.text+0x6b9b
0ce5      ce5:	0f 20 d0             	mov    %cr2,%rax
0ce8      ce8:	e9 00 00 00 00       	jmp    ced <.altinstr_replacement+0xced>	ce9: R_X86_64_PC32	.text+0x2d5c94
0ced      ced:	0f 01 cb             	stac
0cf0      cf0:	e8 00 00 00 00       	call   cf5 <.altinstr_replacement+0xcf5>	cf1: R_X86_64_PLT32	rep_stos_alternative-0x4
0cf5      cf5:	0f 01 ca             	clac
0cf8      cf8:	0f 01 cb             	stac
0cfb      cfb:	e8 00 00 00 00       	call   d00 <.altinstr_replacement+0xd00>	cfc: R_X86_64_PLT32	rep_stos_alternative-0x4
0d00      d00:	0f 01 ca             	clac
0d03      d03:	48 89 f8             	mov    %rdi,%rax
0d06      d06:	e9 00 00 00 00       	jmp    d0b <.altinstr_replacement+0xd0b>	d07: R_X86_64_PC32	.text+0x2d6d94
0d0b      d0b:	9c                   	pushf
0d0c      d0c:	58                   	pop    %rax
0d0d      d0d:	e9 00 00 00 00       	jmp    d12 <.altinstr_replacement+0xd12>	d0e: R_X86_64_PC32	.init.text+0x48465
0d12      d12:	0f 01 cb             	stac
0d15      d15:	0f ae e8             	lfence
0d18      d18:	0f 01 ca             	clac
0d1b      d1b:	0f 01 ca             	clac
0d1e      d1e:	0f 01 cb             	stac
0d21      d21:	0f ae e8             	lfence
0d24      d24:	0f 01 ca             	clac
0d27      d27:	0f 01 ca             	clac
0d2a      d2a:	0f 01 cb             	stac
0d2d      d2d:	0f ae e8             	lfence
0d30      d30:	e9 00 00 00 00       	jmp    d35 <.altinstr_replacement+0xd35>	d31: R_X86_64_PC32	.text+0x2db09c
0d35      d35:	0f 01 ca             	clac
0d38      d38:	0f 01 ca             	clac
0d3b      d3b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0d45      d45:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0d4f      d4f:	e9 00 00 00 00       	jmp    d54 <.altinstr_replacement+0xd54>	d50: R_X86_64_PC32	.text+0x2dbc88
0d54      d54:	48 89 f8             	mov    %rdi,%rax
0d57      d57:	48 89 f8             	mov    %rdi,%rax
0d5a      d5a:	48 89 f8             	mov    %rdi,%rax
0d5d      d5d:	48 89 f8             	mov    %rdi,%rax
0d60      d60:	48 89 f8             	mov    %rdi,%rax
0d63      d63:	48 89 f8             	mov    %rdi,%rax
0d66      d66:	e9 00 00 00 00       	jmp    d6b <.altinstr_replacement+0xd6b>	d67: R_X86_64_PC32	.init.text+0x4a5a2
0d6b      d6b:	48 89 f8             	mov    %rdi,%rax
0d6e      d6e:	e9 00 00 00 00       	jmp    d73 <.altinstr_replacement+0xd73>	d6f: R_X86_64_PC32	.init.text+0x4bb11
0d73      d73:	e9 00 00 00 00       	jmp    d78 <.altinstr_replacement+0xd78>	d74: R_X86_64_PC32	.init.text+0x4fe97
0d78      d78:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # d7f <.altinstr_replacement+0xd7f>	d7b: R_X86_64_PC32	.init.data+0xd158c
0d7f      d7f:	e8 00 00 00 00       	call   d84 <.altinstr_replacement+0xd84>	d80: R_X86_64_PLT32	__alt_reloc_selftest-0x4
0d84      d84:	e9 00 00 00 00       	jmp    d89 <.altinstr_replacement+0xd89>	d85: R_X86_64_PC32	.text+0x2de879
0d89      d89:	e9 00 00 00 00       	jmp    d8e <.altinstr_replacement+0xd8e>	d8a: R_X86_64_PC32	.text+0x2de973
0d8e      d8e:	e9 00 00 00 00       	jmp    d93 <.altinstr_replacement+0xd93>	d8f: R_X86_64_PC32	.text+0x2de8ae
0d93      d93:	e9 00 00 00 00       	jmp    d98 <.altinstr_replacement+0xd98>	d94: R_X86_64_PC32	.text+0x2de8be
0d98      d98:	48 89 f8             	mov    %rdi,%rax
0d9b      d9b:	e9 00 00 00 00       	jmp    da0 <.altinstr_replacement+0xda0>	d9c: R_X86_64_PC32	.text+0x2dfa54
0da0      da0:	9c                   	pushf
0da1      da1:	58                   	pop    %rax
0da2      da2:	fa                   	cli
0da3      da3:	9c                   	pushf
0da4      da4:	58                   	pop    %rax
0da5      da5:	fb                   	sti
0da6      da6:	9c                   	pushf
0da7      da7:	58                   	pop    %rax
0da8      da8:	fa                   	cli
0da9      da9:	9c                   	pushf
0daa      daa:	58                   	pop    %rax
0dab      dab:	fb                   	sti
0dac      dac:	e9 00 00 00 00       	jmp    db1 <.altinstr_replacement+0xdb1>	dad: R_X86_64_PC32	.text+0x2e0436
0db1      db1:	e9 00 00 00 00       	jmp    db6 <.altinstr_replacement+0xdb6>	db2: R_X86_64_PC32	.text+0x2e0e0a
0db6      db6:	e9 00 00 00 00       	jmp    dbb <.altinstr_replacement+0xdbb>	db7: R_X86_64_PC32	.text+0x2e103c
0dbb      dbb:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
0dc5      dc5:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0dcf      dcf:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0dd9      dd9:	0f ae e8             	lfence
0ddc      ddc:	0f 31                	rdtsc
0dde      dde:	0f 01 f9             	rdtscp
0de1      de1:	9c                   	pushf
0de2      de2:	58                   	pop    %rax
0de3      de3:	fa                   	cli
0de4      de4:	9c                   	pushf
0de5      de5:	58                   	pop    %rax
0de6      de6:	fb                   	sti
0de7      de7:	9c                   	pushf
0de8      de8:	58                   	pop    %rax
0de9      de9:	fa                   	cli
0dea      dea:	9c                   	pushf
0deb      deb:	58                   	pop    %rax
0dec      dec:	fb                   	sti
0ded      ded:	9c                   	pushf
0dee      dee:	58                   	pop    %rax
0def      def:	fa                   	cli
0df0      df0:	9c                   	pushf
0df1      df1:	58                   	pop    %rax
0df2      df2:	fb                   	sti
0df3      df3:	9c                   	pushf
0df4      df4:	58                   	pop    %rax
0df5      df5:	fa                   	cli
0df6      df6:	9c                   	pushf
0df7      df7:	58                   	pop    %rax
0df8      df8:	fb                   	sti
0df9      df9:	e9 00 00 00 00       	jmp    dfe <.altinstr_replacement+0xdfe>	dfa: R_X86_64_PC32	.init.text+0x53ff1
0dfe      dfe:	e9 00 00 00 00       	jmp    e03 <.altinstr_replacement+0xe03>	dff: R_X86_64_PC32	.ref.text+0x1985
0e03      e03:	e9 00 00 00 00       	jmp    e08 <.altinstr_replacement+0xe08>	e04: R_X86_64_PC32	.ref.text+0x19a8
0e08      e08:	fa                   	cli
0e09      e09:	fa                   	cli
0e0a      e0a:	9c                   	pushf
0e0b      e0b:	58                   	pop    %rax
0e0c      e0c:	fa                   	cli
0e0d      e0d:	9c                   	pushf
0e0e      e0e:	58                   	pop    %rax
0e0f      e0f:	fb                   	sti
0e10      e10:	9c                   	pushf
0e11      e11:	58                   	pop    %rax
0e12      e12:	fa                   	cli
0e13      e13:	9c                   	pushf
0e14      e14:	58                   	pop    %rax
0e15      e15:	fb                   	sti
0e16      e16:	9c                   	pushf
0e17      e17:	58                   	pop    %rax
0e18      e18:	e9 00 00 00 00       	jmp    e1d <.altinstr_replacement+0xe1d>	e19: R_X86_64_PC32	.text+0x2e753e
0e1d      e1d:	e9 00 00 00 00       	jmp    e22 <.altinstr_replacement+0xe22>	e1e: R_X86_64_PC32	.text+0x2e774f
0e22      e22:	9c                   	pushf
0e23      e23:	58                   	pop    %rax
0e24      e24:	fa                   	cli
0e25      e25:	e9 00 00 00 00       	jmp    e2a <.altinstr_replacement+0xe2a>	e26: R_X86_64_PC32	.text+0x2e7e11
0e2a      e2a:	9c                   	pushf
0e2b      e2b:	58                   	pop    %rax
0e2c      e2c:	fb                   	sti
0e2d      e2d:	e9 00 00 00 00       	jmp    e32 <.altinstr_replacement+0xe32>	e2e: R_X86_64_PC32	.text+0x2e7ea1
0e32      e32:	e9 00 00 00 00       	jmp    e37 <.altinstr_replacement+0xe37>	e33: R_X86_64_PC32	.text+0x2e7ec4
0e37      e37:	e9 00 00 00 00       	jmp    e3c <.altinstr_replacement+0xe3c>	e38: R_X86_64_PC32	.text+0x2e7ebd
0e3c      e3c:	e9 00 00 00 00       	jmp    e41 <.altinstr_replacement+0xe41>	e3d: R_X86_64_PC32	.text+0x2e7d9e
0e41      e41:	e9 00 00 00 00       	jmp    e46 <.altinstr_replacement+0xe46>	e42: R_X86_64_PC32	.text+0x2e8326
0e46      e46:	e9 00 00 00 00       	jmp    e4b <.altinstr_replacement+0xe4b>	e47: R_X86_64_PC32	.text+0x2e848b
0e4b      e4b:	e9 00 00 00 00       	jmp    e50 <.altinstr_replacement+0xe50>	e4c: R_X86_64_PC32	.text+0x2e85e5
0e50      e50:	e9 00 00 00 00       	jmp    e55 <.altinstr_replacement+0xe55>	e51: R_X86_64_PC32	.text+0x2e84d6
0e55      e55:	e9 00 00 00 00       	jmp    e5a <.altinstr_replacement+0xe5a>	e56: R_X86_64_PC32	.text+0x2e82ef
0e5a      e5a:	e9 00 00 00 00       	jmp    e5f <.altinstr_replacement+0xe5f>	e5b: R_X86_64_PC32	.text+0x2e8562
0e5f      e5f:	e9 00 00 00 00       	jmp    e64 <.altinstr_replacement+0xe64>	e60: R_X86_64_PC32	.text+0x2e8632
0e64      e64:	e9 00 00 00 00       	jmp    e69 <.altinstr_replacement+0xe69>	e65: R_X86_64_PC32	.text+0x2e868f
0e69      e69:	e9 00 00 00 00       	jmp    e6e <.altinstr_replacement+0xe6e>	e6a: R_X86_64_PC32	.text+0x2e86c3
0e6e      e6e:	e9 00 00 00 00       	jmp    e73 <.altinstr_replacement+0xe73>	e6f: R_X86_64_PC32	.text+0x2e8545
0e73      e73:	9c                   	pushf
0e74      e74:	58                   	pop    %rax
0e75      e75:	fa                   	cli
0e76      e76:	e9 00 00 00 00       	jmp    e7b <.altinstr_replacement+0xe7b>	e77: R_X86_64_PC32	.text+0x2e8cab
0e7b      e7b:	9c                   	pushf
0e7c      e7c:	58                   	pop    %rax
0e7d      e7d:	fa                   	cli
0e7e      e7e:	fb                   	sti
0e7f      e7f:	9c                   	pushf
0e80      e80:	58                   	pop    %rax
0e81      e81:	fa                   	cli
0e82      e82:	9c                   	pushf
0e83      e83:	58                   	pop    %rax
0e84      e84:	fb                   	sti
0e85      e85:	48 0f ae 37          	xsaveopt64 (%rdi)
0e89      e89:	48 0f c7 27          	xsavec64 (%rdi)
0e8d      e8d:	48 0f c7 2f          	xsaves64 (%rdi)
0e91      e91:	e9 00 00 00 00       	jmp    e96 <.altinstr_replacement+0xe96>	e92: R_X86_64_PC32	.text+0x2ea5c1
0e96      e96:	e9 00 00 00 00       	jmp    e9b <.altinstr_replacement+0xe9b>	e97: R_X86_64_PC32	.text+0x2eacfc
0e9b      e9b:	e9 00 00 00 00       	jmp    ea0 <.altinstr_replacement+0xea0>	e9c: R_X86_64_PC32	.text+0x2eae62
0ea0      ea0:	e9 00 00 00 00       	jmp    ea5 <.altinstr_replacement+0xea5>	ea1: R_X86_64_PC32	.text+0x2ebf68
0ea5      ea5:	e9 00 00 00 00       	jmp    eaa <.altinstr_replacement+0xeaa>	ea6: R_X86_64_PC32	.text+0x2ec274
0eaa      eaa:	e9 00 00 00 00       	jmp    eaf <.altinstr_replacement+0xeaf>	eab: R_X86_64_PC32	.text+0x2ec2cc
0eaf      eaf:	48 0f c7 1f          	xrstors64 (%rdi)
0eb3      eb3:	e9 00 00 00 00       	jmp    eb8 <.altinstr_replacement+0xeb8>	eb4: R_X86_64_PC32	.text+0x2ecd4d
0eb8      eb8:	e9 00 00 00 00       	jmp    ebd <.altinstr_replacement+0xebd>	eb9: R_X86_64_PC32	.text+0x2ed4a4
0ebd      ebd:	e9 00 00 00 00       	jmp    ec2 <.altinstr_replacement+0xec2>	ebe: R_X86_64_PC32	.text+0x2ed29a
0ec2      ec2:	e9 00 00 00 00       	jmp    ec7 <.altinstr_replacement+0xec7>	ec3: R_X86_64_PC32	.text+0x2ede5d
0ec7      ec7:	e9 00 00 00 00       	jmp    ecc <.altinstr_replacement+0xecc>	ec8: R_X86_64_PC32	.text+0x2ee850
0ecc      ecc:	48 0f c7 1f          	xrstors64 (%rdi)
0ed0      ed0:	e9 00 00 00 00       	jmp    ed5 <.altinstr_replacement+0xed5>	ed1: R_X86_64_PC32	.text+0x2ee818
0ed5      ed5:	48 0f c7 1f          	xrstors64 (%rdi)
0ed9      ed9:	e9 00 00 00 00       	jmp    ede <.altinstr_replacement+0xede>	eda: R_X86_64_PC32	.noinstr.text+0x7514
0ede      ede:	0f 01 cb             	stac
0ee1      ee1:	e8 00 00 00 00       	call   ee6 <.altinstr_replacement+0xee6>	ee2: R_X86_64_PLT32	rep_movs_alternative-0x4
0ee6      ee6:	0f 01 ca             	clac
0ee9      ee9:	e9 00 00 00 00       	jmp    eee <.altinstr_replacement+0xeee>	eea: R_X86_64_PC32	.text+0x2ef447
0eee      eee:	e9 00 00 00 00       	jmp    ef3 <.altinstr_replacement+0xef3>	eef: R_X86_64_PC32	.text+0x2ef772
0ef3      ef3:	e9 00 00 00 00       	jmp    ef8 <.altinstr_replacement+0xef8>	ef4: R_X86_64_PC32	.text+0x2ef8c7
0ef8      ef8:	e9 00 00 00 00       	jmp    efd <.altinstr_replacement+0xefd>	ef9: R_X86_64_PC32	.text+0x2efa2b
0efd      efd:	e9 00 00 00 00       	jmp    f02 <.altinstr_replacement+0xf02>	efe: R_X86_64_PC32	.text+0x2eff4c
0f02      f02:	e9 00 00 00 00       	jmp    f07 <.altinstr_replacement+0xf07>	f03: R_X86_64_PC32	.text+0x2f0109
0f07      f07:	48 0f ae 37          	xsaveopt64 (%rdi)
0f0b      f0b:	48 0f c7 27          	xsavec64 (%rdi)
0f0f      f0f:	48 0f c7 2f          	xsaves64 (%rdi)
0f13      f13:	0f 01 cb             	stac
0f16      f16:	e8 00 00 00 00       	call   f1b <.altinstr_replacement+0xf1b>	f17: R_X86_64_PLT32	rep_movs_alternative-0x4
0f1b      f1b:	0f 01 ca             	clac
0f1e      f1e:	e9 00 00 00 00       	jmp    f23 <.altinstr_replacement+0xf23>	f1f: R_X86_64_PC32	.text+0x2f0567
0f23      f23:	0f 01 cb             	stac
0f26      f26:	e8 00 00 00 00       	call   f2b <.altinstr_replacement+0xf2b>	f27: R_X86_64_PLT32	rep_movs_alternative-0x4
0f2b      f2b:	0f 01 ca             	clac
0f2e      f2e:	0f 01 cb             	stac
0f31      f31:	e8 00 00 00 00       	call   f36 <.altinstr_replacement+0xf36>	f32: R_X86_64_PLT32	rep_movs_alternative-0x4
0f36      f36:	0f 01 ca             	clac
0f39      f39:	e9 00 00 00 00       	jmp    f3e <.altinstr_replacement+0xf3e>	f3a: R_X86_64_PC32	.text+0x2f1214
0f3e      f3e:	0f 01 cb             	stac
0f41      f41:	0f 01 ca             	clac
0f44      f44:	0f 01 cb             	stac
0f47      f47:	0f 01 ca             	clac
0f4a      f4a:	48 0f c7 1f          	xrstors64 (%rdi)
0f4e      f4e:	0f 01 cb             	stac
0f51      f51:	0f 01 ca             	clac
0f54      f54:	48 0f c7 1f          	xrstors64 (%rdi)
0f58      f58:	e9 00 00 00 00       	jmp    f5d <.altinstr_replacement+0xf5d>	f59: R_X86_64_PC32	.text+0x2f169a
0f5d      f5d:	0f 01 cb             	stac
0f60      f60:	e8 00 00 00 00       	call   f65 <.altinstr_replacement+0xf65>	f61: R_X86_64_PLT32	rep_movs_alternative-0x4
0f65      f65:	0f 01 ca             	clac
0f68      f68:	e9 00 00 00 00       	jmp    f6d <.altinstr_replacement+0xf6d>	f69: R_X86_64_PC32	.text+0x2f1910
0f6d      f6d:	0f 01 cb             	stac
0f70      f70:	e8 00 00 00 00       	call   f75 <.altinstr_replacement+0xf75>	f71: R_X86_64_PLT32	rep_movs_alternative-0x4
0f75      f75:	0f 01 ca             	clac
0f78      f78:	e9 00 00 00 00       	jmp    f7d <.altinstr_replacement+0xf7d>	f79: R_X86_64_PC32	.text+0x2f1a28
0f7d      f7d:	e9 00 00 00 00       	jmp    f82 <.altinstr_replacement+0xf82>	f7e: R_X86_64_PC32	.text+0x2f1b3b
0f82      f82:	e9 00 00 00 00       	jmp    f87 <.altinstr_replacement+0xf87>	f83: R_X86_64_PC32	.text+0x2f1b9d
0f87      f87:	e9 00 00 00 00       	jmp    f8c <.altinstr_replacement+0xf8c>	f88: R_X86_64_PC32	.text+0x2f1dbf
0f8c      f8c:	0f 01 cb             	stac
0f8f      f8f:	e8 00 00 00 00       	call   f94 <.altinstr_replacement+0xf94>	f90: R_X86_64_PLT32	rep_stos_alternative-0x4
0f94      f94:	0f 01 ca             	clac
0f97      f97:	e9 00 00 00 00       	jmp    f9c <.altinstr_replacement+0xf9c>	f98: R_X86_64_PC32	.text+0x2f1f72
0f9c      f9c:	0f 01 cb             	stac
0f9f      f9f:	0f 01 ca             	clac
0fa2      fa2:	0f 01 cb             	stac
0fa5      fa5:	e8 00 00 00 00       	call   faa <.altinstr_replacement+0xfaa>	fa6: R_X86_64_PLT32	rep_stos_alternative-0x4
0faa      faa:	0f 01 ca             	clac
0fad      fad:	0f 01 cb             	stac
0fb0      fb0:	0f 01 ca             	clac
0fb3      fb3:	e9 00 00 00 00       	jmp    fb8 <.altinstr_replacement+0xfb8>	fb4: R_X86_64_PC32	.text+0x2f20ee
0fb8      fb8:	e9 00 00 00 00       	jmp    fbd <.altinstr_replacement+0xfbd>	fb9: R_X86_64_PC32	.text+0x2f229d
0fbd      fbd:	e9 00 00 00 00       	jmp    fc2 <.altinstr_replacement+0xfc2>	fbe: R_X86_64_PC32	.init.text+0x55610
0fc2      fc2:	9c                   	pushf
0fc3      fc3:	58                   	pop    %rax
0fc4      fc4:	fa                   	cli
0fc5      fc5:	9c                   	pushf
0fc6      fc6:	58                   	pop    %rax
0fc7      fc7:	fb                   	sti
0fc8      fc8:	9c                   	pushf
0fc9      fc9:	58                   	pop    %rax
0fca      fca:	fa                   	cli
0fcb      fcb:	9c                   	pushf
0fcc      fcc:	58                   	pop    %rax
0fcd      fcd:	fb                   	sti
0fce      fce:	e9 00 00 00 00       	jmp    fd3 <.altinstr_replacement+0xfd3>	fcf: R_X86_64_PC32	.init.text+0x55b4c
0fd3      fd3:	e9 00 00 00 00       	jmp    fd8 <.altinstr_replacement+0xfd8>	fd4: R_X86_64_PC32	.init.text+0x55b5e
0fd8      fd8:	e9 00 00 00 00       	jmp    fdd <.altinstr_replacement+0xfdd>	fd9: R_X86_64_PC32	.text+0x2f3034
0fdd      fdd:	e9 00 00 00 00       	jmp    fe2 <.altinstr_replacement+0xfe2>	fde: R_X86_64_PC32	.text+0x2f31b8
0fe2      fe2:	e9 00 00 00 00       	jmp    fe7 <.altinstr_replacement+0xfe7>	fe3: R_X86_64_PC32	.text+0x2f39bc
0fe7      fe7:	e9 00 00 00 00       	jmp    fec <.altinstr_replacement+0xfec>	fe8: R_X86_64_PC32	.text+0x2f3e85
0fec      fec:	e9 00 00 00 00       	jmp    ff1 <.altinstr_replacement+0xff1>	fed: R_X86_64_PC32	.text+0x2f428a
0ff1      ff1:	e9 00 00 00 00       	jmp    ff6 <.altinstr_replacement+0xff6>	ff2: R_X86_64_PC32	.text+0x2f4269
0ff6      ff6:	e9 00 00 00 00       	jmp    ffb <.altinstr_replacement+0xffb>	ff7: R_X86_64_PC32	.text+0x2f43e8
0ffb      ffb:	e9 00 00 00 00       	jmp    1000 <.altinstr_replacement+0x1000>	ffc: R_X86_64_PC32	.text+0x2f4462
1000     1000:	e9 00 00 00 00       	jmp    1005 <.altinstr_replacement+0x1005>	1001: R_X86_64_PC32	.init.text+0x57f10
1005     1005:	e9 00 00 00 00       	jmp    100a <.altinstr_replacement+0x100a>	1006: R_X86_64_PC32	.init.text+0x5808b
100a     100a:	e9 00 00 00 00       	jmp    100f <.altinstr_replacement+0x100f>	100b: R_X86_64_PC32	.init.text+0x5878c
100f     100f:	e9 00 00 00 00       	jmp    1014 <.altinstr_replacement+0x1014>	1010: R_X86_64_PC32	.init.text+0x5896f
1014     1014:	e9 00 00 00 00       	jmp    1019 <.altinstr_replacement+0x1019>	1015: R_X86_64_PC32	.init.text+0x590ab
1019     1019:	e9 00 00 00 00       	jmp    101e <.altinstr_replacement+0x101e>	101a: R_X86_64_PC32	.init.text+0x59580
101e     101e:	e9 00 00 00 00       	jmp    1023 <.altinstr_replacement+0x1023>	101f: R_X86_64_PC32	.init.text+0x59560
1023     1023:	e9 00 00 00 00       	jmp    1028 <.altinstr_replacement+0x1028>	1024: R_X86_64_PC32	.init.text+0x595a1
1028     1028:	e9 00 00 00 00       	jmp    102d <.altinstr_replacement+0x102d>	1029: R_X86_64_PC32	.text+0x2f46fe
102d     102d:	e9 00 00 00 00       	jmp    1032 <.altinstr_replacement+0x1032>	102e: R_X86_64_PC32	.text+0x2f4767
1032     1032:	e9 00 00 00 00       	jmp    1037 <.altinstr_replacement+0x1037>	1033: R_X86_64_PC32	.text+0x2f4733
1037     1037:	e9 00 00 00 00       	jmp    103c <.altinstr_replacement+0x103c>	1038: R_X86_64_PC32	.text+0x2f4c3d
103c     103c:	e9 00 00 00 00       	jmp    1041 <.altinstr_replacement+0x1041>	103d: R_X86_64_PC32	.text+0x2f4b36
1041     1041:	e9 00 00 00 00       	jmp    1046 <.altinstr_replacement+0x1046>	1042: R_X86_64_PC32	.text+0x2f4bc4
1046     1046:	e9 00 00 00 00       	jmp    104b <.altinstr_replacement+0x104b>	1047: R_X86_64_PC32	.text+0x2f4c13
104b     104b:	e9 00 00 00 00       	jmp    1050 <.altinstr_replacement+0x1050>	104c: R_X86_64_PC32	.text+0x2f6335
1050     1050:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
105a     105a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1064     1064:	0f 01 cb             	stac
1067     1067:	e8 00 00 00 00       	call   106c <.altinstr_replacement+0x106c>	1068: R_X86_64_PLT32	rep_movs_alternative-0x4
106c     106c:	0f 01 ca             	clac
106f     106f:	9c                   	pushf
1070     1070:	58                   	pop    %rax
1071     1071:	fa                   	cli
1072     1072:	fb                   	sti
1073     1073:	e9 00 00 00 00       	jmp    1078 <.altinstr_replacement+0x1078>	1074: R_X86_64_PC32	.text+0x2fa209
1078     1078:	48 89 f8             	mov    %rdi,%rax
107b     107b:	e9 00 00 00 00       	jmp    1080 <.altinstr_replacement+0x1080>	107c: R_X86_64_PC32	.text+0x2fa590
1080     1080:	48 89 f8             	mov    %rdi,%rax
1083     1083:	48 89 f8             	mov    %rdi,%rax
1086     1086:	48 89 f8             	mov    %rdi,%rax
1089     1089:	0f 22 df             	mov    %rdi,%cr3
108c     108c:	e9 00 00 00 00       	jmp    1091 <.altinstr_replacement+0x1091>	108d: R_X86_64_PC32	.text+0x2ffadd
1091     1091:	e9 00 00 00 00       	jmp    1096 <.altinstr_replacement+0x1096>	1092: R_X86_64_PC32	.text+0x2ffa8c
1096     1096:	e9 00 00 00 00       	jmp    109b <.altinstr_replacement+0x109b>	1097: R_X86_64_PC32	.text+0x2ffaad
109b     109b:	e9 00 00 00 00       	jmp    10a0 <.altinstr_replacement+0x10a0>	109c: R_X86_64_PC32	.text+0x2ffb08
10a0     10a0:	0f 09                	wbinvd
10a2     10a2:	0f 09                	wbinvd
10a4     10a4:	e9 00 00 00 00       	jmp    10a9 <.altinstr_replacement+0x10a9>	10a5: R_X86_64_PC32	.text+0x2ffbf1
10a9     10a9:	e9 00 00 00 00       	jmp    10ae <.altinstr_replacement+0x10ae>	10aa: R_X86_64_PC32	.text+0x2ffc8d
10ae     10ae:	9c                   	pushf
10af     10af:	58                   	pop    %rax
10b0     10b0:	fa                   	cli
10b1     10b1:	9c                   	pushf
10b2     10b2:	58                   	pop    %rax
10b3     10b3:	fb                   	sti
10b4     10b4:	9c                   	pushf
10b5     10b5:	58                   	pop    %rax
10b6     10b6:	fa                   	cli
10b7     10b7:	9c                   	pushf
10b8     10b8:	58                   	pop    %rax
10b9     10b9:	fb                   	sti
10ba     10ba:	9c                   	pushf
10bb     10bb:	58                   	pop    %rax
10bc     10bc:	fa                   	cli
10bd     10bd:	9c                   	pushf
10be     10be:	58                   	pop    %rax
10bf     10bf:	fb                   	sti
10c0     10c0:	e9 00 00 00 00       	jmp    10c5 <.altinstr_replacement+0x10c5>	10c1: R_X86_64_PC32	.text+0x3022e7
10c5     10c5:	e9 00 00 00 00       	jmp    10ca <.altinstr_replacement+0x10ca>	10c6: R_X86_64_PC32	.text+0x3023c7
10ca     10ca:	e9 00 00 00 00       	jmp    10cf <.altinstr_replacement+0x10cf>	10cb: R_X86_64_PC32	.text+0x30245b
10cf     10cf:	e9 00 00 00 00       	jmp    10d4 <.altinstr_replacement+0x10d4>	10d0: R_X86_64_PC32	.text+0x3035c0
10d4     10d4:	e9 00 00 00 00       	jmp    10d9 <.altinstr_replacement+0x10d9>	10d5: R_X86_64_PC32	.text+0x303631
10d9     10d9:	e9 00 00 00 00       	jmp    10de <.altinstr_replacement+0x10de>	10da: R_X86_64_PC32	.text+0x303631
10de     10de:	e9 00 00 00 00       	jmp    10e3 <.altinstr_replacement+0x10e3>	10df: R_X86_64_PC32	.text+0x303674
10e3     10e3:	e9 00 00 00 00       	jmp    10e8 <.altinstr_replacement+0x10e8>	10e4: R_X86_64_PC32	.text+0x303631
10e8     10e8:	e9 00 00 00 00       	jmp    10ed <.altinstr_replacement+0x10ed>	10e9: R_X86_64_PC32	.init.text+0x5c04b
10ed     10ed:	e9 00 00 00 00       	jmp    10f2 <.altinstr_replacement+0x10f2>	10ee: R_X86_64_PC32	.init.text+0x5c054
10f2     10f2:	e9 00 00 00 00       	jmp    10f7 <.altinstr_replacement+0x10f7>	10f3: R_X86_64_PC32	.text+0x305202
10f7     10f7:	e9 00 00 00 00       	jmp    10fc <.altinstr_replacement+0x10fc>	10f8: R_X86_64_PC32	.text+0x30520e
10fc     10fc:	e9 00 00 00 00       	jmp    1101 <.altinstr_replacement+0x1101>	10fd: R_X86_64_PC32	.text+0x30526b
1101     1101:	0f 30                	wrmsr
1103     1103:	e9 00 00 00 00       	jmp    1108 <.altinstr_replacement+0x1108>	1104: R_X86_64_PC32	.init.text+0x60c69
1108     1108:	e9 00 00 00 00       	jmp    110d <.altinstr_replacement+0x110d>	1109: R_X86_64_PC32	.init.text+0x60d11
110d     110d:	e9 00 00 00 00       	jmp    1112 <.altinstr_replacement+0x1112>	110e: R_X86_64_PC32	.init.text+0x6152a
1112     1112:	e9 00 00 00 00       	jmp    1117 <.altinstr_replacement+0x1117>	1113: R_X86_64_PC32	.text+0x306e2f
1117     1117:	e9 00 00 00 00       	jmp    111c <.altinstr_replacement+0x111c>	1118: R_X86_64_PC32	.init.text+0x62694
111c     111c:	e9 00 00 00 00       	jmp    1121 <.altinstr_replacement+0x1121>	111d: R_X86_64_PC32	.init.text+0x63bb6
1121     1121:	e9 00 00 00 00       	jmp    1126 <.altinstr_replacement+0x1126>	1122: R_X86_64_PC32	.text+0x3094b4
1126     1126:	e9 00 00 00 00       	jmp    112b <.altinstr_replacement+0x112b>	1127: R_X86_64_PC32	.text+0x309778
112b     112b:	e9 00 00 00 00       	jmp    1130 <.altinstr_replacement+0x1130>	112c: R_X86_64_PC32	.text+0x3098be
1130     1130:	9c                   	pushf
1131     1131:	58                   	pop    %rax
1132     1132:	fa                   	cli
1133     1133:	fb                   	sti
1134     1134:	e9 00 00 00 00       	jmp    1139 <.altinstr_replacement+0x1139>	1135: R_X86_64_PC32	.text+0x310805
1139     1139:	e9 00 00 00 00       	jmp    113e <.altinstr_replacement+0x113e>	113a: R_X86_64_PC32	.text+0x310aa1
113e     113e:	e9 00 00 00 00       	jmp    1143 <.altinstr_replacement+0x1143>	113f: R_X86_64_PC32	.text+0x310c1a
1143     1143:	e9 00 00 00 00       	jmp    1148 <.altinstr_replacement+0x1148>	1144: R_X86_64_PC32	.text+0x310c1a
1148     1148:	e9 00 00 00 00       	jmp    114d <.altinstr_replacement+0x114d>	1149: R_X86_64_PC32	.text+0x311ad6
114d     114d:	e9 00 00 00 00       	jmp    1152 <.altinstr_replacement+0x1152>	114e: R_X86_64_PC32	.text+0x314d55
1152     1152:	e9 00 00 00 00       	jmp    1157 <.altinstr_replacement+0x1157>	1153: R_X86_64_PC32	.text+0x315401
1157     1157:	e9 00 00 00 00       	jmp    115c <.altinstr_replacement+0x115c>	1158: R_X86_64_PC32	.text+0x316586
115c     115c:	e9 00 00 00 00       	jmp    1161 <.altinstr_replacement+0x1161>	115d: R_X86_64_PC32	.text+0x318775
1161     1161:	e9 00 00 00 00       	jmp    1166 <.altinstr_replacement+0x1166>	1162: R_X86_64_PC32	.text+0x31883e
1166     1166:	e9 00 00 00 00       	jmp    116b <.altinstr_replacement+0x116b>	1167: R_X86_64_PC32	.text+0x318850
116b     116b:	e9 00 00 00 00       	jmp    1170 <.altinstr_replacement+0x1170>	116c: R_X86_64_PC32	.text+0x31a810
1170     1170:	fb                   	sti
1171     1171:	9c                   	pushf
1172     1172:	58                   	pop    %rax
1173     1173:	fa                   	cli
1174     1174:	9c                   	pushf
1175     1175:	58                   	pop    %rax
1176     1176:	fb                   	sti
1177     1177:	9c                   	pushf
1178     1178:	58                   	pop    %rax
1179     1179:	fa                   	cli
117a     117a:	9c                   	pushf
117b     117b:	58                   	pop    %rax
117c     117c:	fb                   	sti
117d     117d:	e9 00 00 00 00       	jmp    1182 <.altinstr_replacement+0x1182>	117e: R_X86_64_PC32	.text+0x31d80f
1182     1182:	e9 00 00 00 00       	jmp    1187 <.altinstr_replacement+0x1187>	1183: R_X86_64_PC32	.text+0x31da4e
1187     1187:	e9 00 00 00 00       	jmp    118c <.altinstr_replacement+0x118c>	1188: R_X86_64_PC32	.text+0x31da60
118c     118c:	e9 00 00 00 00       	jmp    1191 <.altinstr_replacement+0x1191>	118d: R_X86_64_PC32	.text+0x31def1
1191     1191:	e9 00 00 00 00       	jmp    1196 <.altinstr_replacement+0x1196>	1192: R_X86_64_PC32	.text+0x31e6dc
1196     1196:	e9 00 00 00 00       	jmp    119b <.altinstr_replacement+0x119b>	1197: R_X86_64_PC32	.init.text+0x6643c
119b     119b:	e9 00 00 00 00       	jmp    11a0 <.altinstr_replacement+0x11a0>	119c: R_X86_64_PC32	.noinstr.text+0x813e
11a0     11a0:	e9 00 00 00 00       	jmp    11a5 <.altinstr_replacement+0x11a5>	11a1: R_X86_64_PC32	.noinstr.text+0x804a
11a5     11a5:	e9 00 00 00 00       	jmp    11aa <.altinstr_replacement+0x11aa>	11a6: R_X86_64_PC32	.text+0x31f69e
11aa     11aa:	e9 00 00 00 00       	jmp    11af <.altinstr_replacement+0x11af>	11ab: R_X86_64_PC32	.text+0x31f6ab
11af     11af:	e9 00 00 00 00       	jmp    11b4 <.altinstr_replacement+0x11b4>	11b0: R_X86_64_PC32	.text+0x31f6b8
11b4     11b4:	e9 00 00 00 00       	jmp    11b9 <.altinstr_replacement+0x11b9>	11b5: R_X86_64_PC32	.noinstr.text+0x894b
11b9     11b9:	e9 00 00 00 00       	jmp    11be <.altinstr_replacement+0x11be>	11ba: R_X86_64_PC32	.noinstr.text+0x898e
11be     11be:	e9 00 00 00 00       	jmp    11c3 <.altinstr_replacement+0x11c3>	11bf: R_X86_64_PC32	.noinstr.text+0x899b
11c3     11c3:	e9 00 00 00 00       	jmp    11c8 <.altinstr_replacement+0x11c8>	11c4: R_X86_64_PC32	.noinstr.text+0x8d28
11c8     11c8:	e9 00 00 00 00       	jmp    11cd <.altinstr_replacement+0x11cd>	11c9: R_X86_64_PC32	.noinstr.text+0x8e68
11cd     11cd:	9c                   	pushf
11ce     11ce:	58                   	pop    %rax
11cf     11cf:	fa                   	cli
11d0     11d0:	9c                   	pushf
11d1     11d1:	58                   	pop    %rax
11d2     11d2:	fb                   	sti
11d3     11d3:	e9 00 00 00 00       	jmp    11d8 <.altinstr_replacement+0x11d8>	11d4: R_X86_64_PC32	.text+0x325231
11d8     11d8:	e9 00 00 00 00       	jmp    11dd <.altinstr_replacement+0x11dd>	11d9: R_X86_64_PC32	.text+0x327257
11dd     11dd:	e9 00 00 00 00       	jmp    11e2 <.altinstr_replacement+0x11e2>	11de: R_X86_64_PC32	.text+0x327c37
11e2     11e2:	e9 00 00 00 00       	jmp    11e7 <.altinstr_replacement+0x11e7>	11e3: R_X86_64_PC32	.text+0x327c49
11e7     11e7:	e9 00 00 00 00       	jmp    11ec <.altinstr_replacement+0x11ec>	11e8: R_X86_64_PC32	.text+0x32a51c
11ec     11ec:	9c                   	pushf
11ed     11ed:	58                   	pop    %rax
11ee     11ee:	fa                   	cli
11ef     11ef:	9c                   	pushf
11f0     11f0:	58                   	pop    %rax
11f1     11f1:	fb                   	sti
11f2     11f2:	9c                   	pushf
11f3     11f3:	58                   	pop    %rax
11f4     11f4:	fa                   	cli
11f5     11f5:	9c                   	pushf
11f6     11f6:	58                   	pop    %rax
11f7     11f7:	fb                   	sti
11f8     11f8:	0f ae e8             	lfence
11fb     11fb:	0f 31                	rdtsc
11fd     11fd:	0f 01 f9             	rdtscp
1200     1200:	e9 00 00 00 00       	jmp    1205 <.altinstr_replacement+0x1205>	1201: R_X86_64_PC32	.text+0x32c980
1205     1205:	e9 00 00 00 00       	jmp    120a <.altinstr_replacement+0x120a>	1206: R_X86_64_PC32	.text+0x32cd24
120a     120a:	e9 00 00 00 00       	jmp    120f <.altinstr_replacement+0x120f>	120b: R_X86_64_PC32	.text+0x32cd96
120f     120f:	e9 00 00 00 00       	jmp    1214 <.altinstr_replacement+0x1214>	1210: R_X86_64_PC32	.text+0x32ce50
1214     1214:	e9 00 00 00 00       	jmp    1219 <.altinstr_replacement+0x1219>	1215: R_X86_64_PC32	.init.text+0x67525
1219     1219:	e9 00 00 00 00       	jmp    121e <.altinstr_replacement+0x121e>	121a: R_X86_64_PC32	.text+0x335151
121e     121e:	e9 00 00 00 00       	jmp    1223 <.altinstr_replacement+0x1223>	121f: R_X86_64_PC32	.text+0x3351a5
1223     1223:	e9 00 00 00 00       	jmp    1228 <.altinstr_replacement+0x1228>	1224: R_X86_64_PC32	.text+0x335151
1228     1228:	9c                   	pushf
1229     1229:	58                   	pop    %rax
122a     122a:	fa                   	cli
122b     122b:	9c                   	pushf
122c     122c:	58                   	pop    %rax
122d     122d:	fb                   	sti
122e     122e:	e9 00 00 00 00       	jmp    1233 <.altinstr_replacement+0x1233>	122f: R_X86_64_PC32	.init.text+0x6e14a
1233     1233:	e9 00 00 00 00       	jmp    1238 <.altinstr_replacement+0x1238>	1234: R_X86_64_PC32	.init.text+0x6f717
1238     1238:	9c                   	pushf
1239     1239:	58                   	pop    %rax
123a     123a:	fa                   	cli
123b     123b:	fb                   	sti
123c     123c:	9c                   	pushf
123d     123d:	58                   	pop    %rax
123e     123e:	fa                   	cli
123f     123f:	0f ae e8             	lfence
1242     1242:	0f 31                	rdtsc
1244     1244:	0f 01 f9             	rdtscp
1247     1247:	0f ae e8             	lfence
124a     124a:	0f 31                	rdtsc
124c     124c:	0f 01 f9             	rdtscp
124f     124f:	0f ae e8             	lfence
1252     1252:	0f 31                	rdtsc
1254     1254:	0f 01 f9             	rdtscp
1257     1257:	fb                   	sti
1258     1258:	9c                   	pushf
1259     1259:	58                   	pop    %rax
125a     125a:	fa                   	cli
125b     125b:	fb                   	sti
125c     125c:	fb                   	sti
125d     125d:	e9 00 00 00 00       	jmp    1262 <.altinstr_replacement+0x1262>	125e: R_X86_64_PC32	.init.text+0x753fb
1262     1262:	e9 00 00 00 00       	jmp    1267 <.altinstr_replacement+0x1267>	1263: R_X86_64_PC32	.init.text+0x75422
1267     1267:	e9 00 00 00 00       	jmp    126c <.altinstr_replacement+0x126c>	1268: R_X86_64_PC32	.text+0x35e005
126c     126c:	e9 00 00 00 00       	jmp    1271 <.altinstr_replacement+0x1271>	126d: R_X86_64_PC32	.text+0x35eaf2
1271     1271:	e9 00 00 00 00       	jmp    1276 <.altinstr_replacement+0x1276>	1272: R_X86_64_PC32	.init.text+0x76146
1276     1276:	9c                   	pushf
1277     1277:	58                   	pop    %rax
1278     1278:	0f 01 cb             	stac
127b     127b:	0f 01 ca             	clac
127e     127e:	0f 01 cb             	stac
1281     1281:	0f 01 ca             	clac
1284     1284:	e9 00 00 00 00       	jmp    1289 <.altinstr_replacement+0x1289>	1285: R_X86_64_PC32	.text+0x366890
1289     1289:	e9 00 00 00 00       	jmp    128e <.altinstr_replacement+0x128e>	128a: R_X86_64_PC32	.init.text+0x764d0
128e     128e:	0f 01 c1             	vmcall
1291     1291:	0f 01 d9             	vmmcall
1294     1294:	9c                   	pushf
1295     1295:	58                   	pop    %rax
1296     1296:	fa                   	cli
1297     1297:	fb                   	sti
1298     1298:	9c                   	pushf
1299     1299:	58                   	pop    %rax
129a     129a:	fa                   	cli
129b     129b:	fb                   	sti
129c     129c:	e9 00 00 00 00       	jmp    12a1 <.altinstr_replacement+0x12a1>	129d: R_X86_64_PC32	.text+0x36d183
12a1     12a1:	e9 00 00 00 00       	jmp    12a6 <.altinstr_replacement+0x12a6>	12a2: R_X86_64_PC32	.cpuidle.text+0x4c8
12a6     12a6:	e9 00 00 00 00       	jmp    12ab <.altinstr_replacement+0x12ab>	12a7: R_X86_64_PC32	.cpuidle.text+0x465
12ab     12ab:	9c                   	pushf
12ac     12ac:	58                   	pop    %rax
12ad     12ad:	fa                   	cli
12ae     12ae:	9c                   	pushf
12af     12af:	58                   	pop    %rax
12b0     12b0:	fa                   	cli
12b1     12b1:	9c                   	pushf
12b2     12b2:	58                   	pop    %rax
12b3     12b3:	fa                   	cli
12b4     12b4:	9c                   	pushf
12b5     12b5:	58                   	pop    %rax
12b6     12b6:	fb                   	sti
12b7     12b7:	9c                   	pushf
12b8     12b8:	58                   	pop    %rax
12b9     12b9:	fa                   	cli
12ba     12ba:	9c                   	pushf
12bb     12bb:	58                   	pop    %rax
12bc     12bc:	fa                   	cli
12bd     12bd:	9c                   	pushf
12be     12be:	58                   	pop    %rax
12bf     12bf:	fa                   	cli
12c0     12c0:	9c                   	pushf
12c1     12c1:	58                   	pop    %rax
12c2     12c2:	fa                   	cli
12c3     12c3:	9c                   	pushf
12c4     12c4:	58                   	pop    %rax
12c5     12c5:	fb                   	sti
12c6     12c6:	0f 09                	wbinvd
12c8     12c8:	e9 00 00 00 00       	jmp    12cd <.altinstr_replacement+0x12cd>	12c9: R_X86_64_PC32	.init.text+0x84a4d
12cd     12cd:	fb                   	sti
12ce     12ce:	9c                   	pushf
12cf     12cf:	58                   	pop    %rax
12d0     12d0:	fa                   	cli
12d1     12d1:	0f 09                	wbinvd
12d3     12d3:	e9 00 00 00 00       	jmp    12d8 <.altinstr_replacement+0x12d8>	12d4: R_X86_64_PC32	.init.text+0x85fc6
12d8     12d8:	0f ae e8             	lfence
12db     12db:	0f 31                	rdtsc
12dd     12dd:	0f 01 f9             	rdtscp
12e0     12e0:	0f ae e8             	lfence
12e3     12e3:	0f 31                	rdtsc
12e5     12e5:	0f 01 f9             	rdtscp
12e8     12e8:	c6 07 00             	movb   $0x0,(%rdi)
12eb     12eb:	c6 07 00             	movb   $0x0,(%rdi)
12ee     12ee:	9c                   	pushf
12ef     12ef:	58                   	pop    %rax
12f0     12f0:	fa                   	cli
12f1     12f1:	fb                   	sti
12f2     12f2:	9c                   	pushf
12f3     12f3:	58                   	pop    %rax
12f4     12f4:	fa                   	cli
12f5     12f5:	fb                   	sti
12f6     12f6:	9c                   	pushf
12f7     12f7:	58                   	pop    %rax
12f8     12f8:	fa                   	cli
12f9     12f9:	fb                   	sti
12fa     12fa:	9c                   	pushf
12fb     12fb:	58                   	pop    %rax
12fc     12fc:	fa                   	cli
12fd     12fd:	fb                   	sti
12fe     12fe:	fb                   	sti
12ff     12ff:	9c                   	pushf
1300     1300:	58                   	pop    %rax
1301     1301:	fa                   	cli
1302     1302:	9c                   	pushf
1303     1303:	58                   	pop    %rax
1304     1304:	fb                   	sti
1305     1305:	9c                   	pushf
1306     1306:	58                   	pop    %rax
1307     1307:	fa                   	cli
1308     1308:	9c                   	pushf
1309     1309:	58                   	pop    %rax
130a     130a:	fb                   	sti
130b     130b:	9c                   	pushf
130c     130c:	58                   	pop    %rax
130d     130d:	fa                   	cli
130e     130e:	9c                   	pushf
130f     130f:	58                   	pop    %rax
1310     1310:	fb                   	sti
1311     1311:	9c                   	pushf
1312     1312:	58                   	pop    %rax
1313     1313:	fa                   	cli
1314     1314:	9c                   	pushf
1315     1315:	58                   	pop    %rax
1316     1316:	fb                   	sti
1317     1317:	9c                   	pushf
1318     1318:	58                   	pop    %rax
1319     1319:	fa                   	cli
131a     131a:	9c                   	pushf
131b     131b:	58                   	pop    %rax
131c     131c:	fb                   	sti
131d     131d:	87 34 25 00 c3 5f ff 	xchg   %esi,0xffffffffff5fc300
1324     1324:	87 1c 25 10 c3 5f ff 	xchg   %ebx,0xffffffffff5fc310
132b     132b:	87 04 25 00 c3 5f ff 	xchg   %eax,0xffffffffff5fc300
1332     1332:	87 1c 25 10 c3 5f ff 	xchg   %ebx,0xffffffffff5fc310
1339     1339:	9c                   	pushf
133a     133a:	58                   	pop    %rax
133b     133b:	fa                   	cli
133c     133c:	9c                   	pushf
133d     133d:	58                   	pop    %rax
133e     133e:	fb                   	sti
133f     133f:	9c                   	pushf
1340     1340:	58                   	pop    %rax
1341     1341:	fa                   	cli
1342     1342:	9c                   	pushf
1343     1343:	58                   	pop    %rax
1344     1344:	fb                   	sti
1345     1345:	9c                   	pushf
1346     1346:	58                   	pop    %rax
1347     1347:	fa                   	cli
1348     1348:	9c                   	pushf
1349     1349:	58                   	pop    %rax
134a     134a:	fb                   	sti
134b     134b:	87 3c 25 00 c3 5f ff 	xchg   %edi,0xffffffffff5fc300
1352     1352:	87 3c 25 00 c3 5f ff 	xchg   %edi,0xffffffffff5fc300
1359     1359:	87 3c 25 00 c3 5f ff 	xchg   %edi,0xffffffffff5fc300
1360     1360:	fb                   	sti
1361     1361:	9c                   	pushf
1362     1362:	58                   	pop    %rax
1363     1363:	fa                   	cli
1364     1364:	9c                   	pushf
1365     1365:	58                   	pop    %rax
1366     1366:	fa                   	cli
1367     1367:	fb                   	sti
1368     1368:	9c                   	pushf
1369     1369:	58                   	pop    %rax
136a     136a:	fa                   	cli
136b     136b:	9c                   	pushf
136c     136c:	58                   	pop    %rax
136d     136d:	fb                   	sti
136e     136e:	87 b7 00 c0 5f ff    	xchg   %esi,-0xa04000(%rdi)
1374     1374:	e9 00 00 00 00       	jmp    1379 <.altinstr_replacement+0x1379>	1375: R_X86_64_PC32	.text+0x38a746
1379     1379:	9c                   	pushf
137a     137a:	58                   	pop    %rax
137b     137b:	fa                   	cli
137c     137c:	9c                   	pushf
137d     137d:	58                   	pop    %rax
137e     137e:	fb                   	sti
137f     137f:	9c                   	pushf
1380     1380:	58                   	pop    %rax
1381     1381:	fa                   	cli
1382     1382:	9c                   	pushf
1383     1383:	58                   	pop    %rax
1384     1384:	fb                   	sti
1385     1385:	9c                   	pushf
1386     1386:	58                   	pop    %rax
1387     1387:	fa                   	cli
1388     1388:	9c                   	pushf
1389     1389:	58                   	pop    %rax
138a     138a:	fb                   	sti
138b     138b:	87 b7 00 c0 5f ff    	xchg   %esi,-0xa04000(%rdi)
1391     1391:	9c                   	pushf
1392     1392:	58                   	pop    %rax
1393     1393:	fa                   	cli
1394     1394:	9c                   	pushf
1395     1395:	58                   	pop    %rax
1396     1396:	fb                   	sti
1397     1397:	e9 00 00 00 00       	jmp    139c <.altinstr_replacement+0x139c>	1398: R_X86_64_PC32	.text+0x390e32
139c     139c:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	13a1: R_X86_64_32S	pcpu_hot+0x10
13a6     13a6:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	13ab: R_X86_64_32S	__x86_call_count
13af     13af:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	13b4: R_X86_64_32S	pcpu_hot+0x10
13b9     13b9:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	13be: R_X86_64_32S	__x86_call_count
13c2     13c2:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	13c7: R_X86_64_32S	pcpu_hot+0x10
13cc     13cc:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	13d1: R_X86_64_32S	__x86_call_count
13d5     13d5:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	13da: R_X86_64_32S	pcpu_hot+0x10
13df     13df:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	13e4: R_X86_64_32S	__x86_call_count
13e8     13e8:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	13ed: R_X86_64_32S	pcpu_hot+0x10
13f2     13f2:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	13f7: R_X86_64_32S	__x86_call_count
13fb     13fb:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	1400: R_X86_64_32S	pcpu_hot+0x10
1405     1405:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	140a: R_X86_64_32S	__x86_call_count
140e     140e:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	1413: R_X86_64_32S	pcpu_hot+0x10
1418     1418:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	141d: R_X86_64_32S	__x86_call_count
1421     1421:	c3                   	ret
1422     1422:	cc                   	int3
1423     1423:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	1428: R_X86_64_32S	pcpu_hot+0x10
142d     142d:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	1432: R_X86_64_32S	__x86_call_count
1436     1436:	c3                   	ret
1437     1437:	cc                   	int3
1438     1438:	0f ae e8             	lfence
143b     143b:	0f 31                	rdtsc
143d     143d:	0f 01 f9             	rdtscp
1440     1440:	e9 00 00 00 00       	jmp    1445 <.altinstr_replacement+0x1445>	1441: R_X86_64_PC32	.text+0x392ecb
1445     1445:	e8 00 00 00 00       	call   144a <.altinstr_replacement+0x144a>	1446: R_X86_64_PLT32	clear_page_rep-0x4
144a     144a:	e8 00 00 00 00       	call   144f <.altinstr_replacement+0x144f>	144b: R_X86_64_PLT32	clear_page_erms-0x4
144f     144f:	e9 00 00 00 00       	jmp    1454 <.altinstr_replacement+0x1454>	1450: R_X86_64_PC32	.text+0x3931c9
1454     1454:	48 89 f8             	mov    %rdi,%rax
1457     1457:	48 89 f8             	mov    %rdi,%rax
145a     145a:	e9 00 00 00 00       	jmp    145f <.altinstr_replacement+0x145f>	145b: R_X86_64_PC32	.text+0x3935e3
145f     145f:	e9 00 00 00 00       	jmp    1464 <.altinstr_replacement+0x1464>	1460: R_X86_64_PC32	.text+0x3938c7
1464     1464:	48 89 f8             	mov    %rdi,%rax
1467     1467:	48 89 f8             	mov    %rdi,%rax
146a     146a:	48 89 f8             	mov    %rdi,%rax
146d     146d:	48 89 f8             	mov    %rdi,%rax
1470     1470:	48 89 f8             	mov    %rdi,%rax
1473     1473:	48 89 f8             	mov    %rdi,%rax
1476     1476:	48 89 f8             	mov    %rdi,%rax
1479     1479:	48 89 f8             	mov    %rdi,%rax
147c     147c:	e8 00 00 00 00       	call   1481 <.altinstr_replacement+0x1481>	147d: R_X86_64_PLT32	clear_page_rep-0x4
1481     1481:	e8 00 00 00 00       	call   1486 <.altinstr_replacement+0x1486>	1482: R_X86_64_PLT32	clear_page_erms-0x4
1486     1486:	9c                   	pushf
1487     1487:	58                   	pop    %rax
1488     1488:	fa                   	cli
1489     1489:	9c                   	pushf
148a     148a:	58                   	pop    %rax
148b     148b:	fa                   	cli
148c     148c:	e9 00 00 00 00       	jmp    1491 <.altinstr_replacement+0x1491>	148d: R_X86_64_PC32	.text+0x3965a1
1491     1491:	9c                   	pushf
1492     1492:	58                   	pop    %rax
1493     1493:	fa                   	cli
1494     1494:	9c                   	pushf
1495     1495:	58                   	pop    %rax
1496     1496:	fb                   	sti
1497     1497:	9c                   	pushf
1498     1498:	58                   	pop    %rax
1499     1499:	fa                   	cli
149a     149a:	c6 07 00             	movb   $0x0,(%rdi)
149d     149d:	9c                   	pushf
149e     149e:	58                   	pop    %rax
149f     149f:	fb                   	sti
14a0     14a0:	9c                   	pushf
14a1     14a1:	58                   	pop    %rax
14a2     14a2:	fb                   	sti
14a3     14a3:	e9 00 00 00 00       	jmp    14a8 <.altinstr_replacement+0x14a8>	14a4: R_X86_64_PC32	.init.text+0xa8400
14a8     14a8:	9c                   	pushf
14a9     14a9:	58                   	pop    %rax
14aa     14aa:	fa                   	cli
14ab     14ab:	9c                   	pushf
14ac     14ac:	58                   	pop    %rax
14ad     14ad:	fb                   	sti
14ae     14ae:	9c                   	pushf
14af     14af:	58                   	pop    %rax
14b0     14b0:	9c                   	pushf
14b1     14b1:	58                   	pop    %rax
14b2     14b2:	fa                   	cli
14b3     14b3:	fb                   	sti
14b4     14b4:	fb                   	sti
14b5     14b5:	9c                   	pushf
14b6     14b6:	58                   	pop    %rax
14b7     14b7:	fa                   	cli
14b8     14b8:	e9 00 00 00 00       	jmp    14bd <.altinstr_replacement+0x14bd>	14b9: R_X86_64_PC32	.text+0x3a3d7e
14bd     14bd:	0f 01 d9             	vmmcall
14c0     14c0:	48 31 c0             	xor    %rax,%rax
14c3     14c3:	e9 00 00 00 00       	jmp    14c8 <.altinstr_replacement+0x14c8>	14c4: R_X86_64_PC32	.text+0x3a42cf
14c8     14c8:	0f 01 d9             	vmmcall
14cb     14cb:	9c                   	pushf
14cc     14cc:	58                   	pop    %rax
14cd     14cd:	fa                   	cli
14ce     14ce:	e9 00 00 00 00       	jmp    14d3 <.altinstr_replacement+0x14d3>	14cf: R_X86_64_PC32	.text+0x3a4a88
14d3     14d3:	9c                   	pushf
14d4     14d4:	58                   	pop    %rax
14d5     14d5:	fb                   	sti
14d6     14d6:	0f 01 d9             	vmmcall
14d9     14d9:	e9 00 00 00 00       	jmp    14de <.altinstr_replacement+0x14de>	14da: R_X86_64_PC32	.text+0x3a4b77
14de     14de:	0f 01 d9             	vmmcall
14e1     14e1:	9c                   	pushf
14e2     14e2:	58                   	pop    %rax
14e3     14e3:	fa                   	cli
14e4     14e4:	9c                   	pushf
14e5     14e5:	58                   	pop    %rax
14e6     14e6:	fb                   	sti
14e7     14e7:	9c                   	pushf
14e8     14e8:	58                   	pop    %rax
14e9     14e9:	fa                   	cli
14ea     14ea:	9c                   	pushf
14eb     14eb:	58                   	pop    %rax
14ec     14ec:	fb                   	sti
14ed     14ed:	e9 00 00 00 00       	jmp    14f2 <.altinstr_replacement+0x14f2>	14ee: R_X86_64_PC32	.text+0x3a6c98
14f2     14f2:	e9 00 00 00 00       	jmp    14f7 <.altinstr_replacement+0x14f7>	14f3: R_X86_64_PC32	.text+0x3a6ca5
14f7     14f7:	e9 00 00 00 00       	jmp    14fc <.altinstr_replacement+0x14fc>	14f8: R_X86_64_PC32	.text+0x3a71de
14fc     14fc:	9c                   	pushf
14fd     14fd:	58                   	pop    %rax
14fe     14fe:	fa                   	cli
14ff     14ff:	9c                   	pushf
1500     1500:	58                   	pop    %rax
1501     1501:	fb                   	sti
1502     1502:	e9 00 00 00 00       	jmp    1507 <.altinstr_replacement+0x1507>	1503: R_X86_64_PC32	.text+0x3a7791
1507     1507:	9c                   	pushf
1508     1508:	58                   	pop    %rax
1509     1509:	9c                   	pushf
150a     150a:	58                   	pop    %rax
150b     150b:	0f ae e8             	lfence
150e     150e:	0f 31                	rdtsc
1510     1510:	0f 01 f9             	rdtscp
1513     1513:	0f ae e8             	lfence
1516     1516:	0f 31                	rdtsc
1518     1518:	0f 01 f9             	rdtscp
151b     151b:	9c                   	pushf
151c     151c:	58                   	pop    %rax
151d     151d:	9c                   	pushf
151e     151e:	58                   	pop    %rax
151f     151f:	9c                   	pushf
1520     1520:	58                   	pop    %rax
1521     1521:	fa                   	cli
1522     1522:	9c                   	pushf
1523     1523:	58                   	pop    %rax
1524     1524:	fb                   	sti
1525     1525:	9c                   	pushf
1526     1526:	58                   	pop    %rax
1527     1527:	fa                   	cli
1528     1528:	9c                   	pushf
1529     1529:	58                   	pop    %rax
152a     152a:	fb                   	sti
152b     152b:	9c                   	pushf
152c     152c:	58                   	pop    %rax
152d     152d:	fa                   	cli
152e     152e:	9c                   	pushf
152f     152f:	58                   	pop    %rax
1530     1530:	fb                   	sti
1531     1531:	9c                   	pushf
1532     1532:	58                   	pop    %rax
1533     1533:	fa                   	cli
1534     1534:	9c                   	pushf
1535     1535:	58                   	pop    %rax
1536     1536:	fb                   	sti
1537     1537:	0f 20 d8             	mov    %cr3,%rax
153a     153a:	48 89 f8             	mov    %rdi,%rax
153d     153d:	48 89 f8             	mov    %rdi,%rax
1540     1540:	e9 00 00 00 00       	jmp    1545 <.altinstr_replacement+0x1545>	1541: R_X86_64_PC32	.init.text+0xb11c4
1545     1545:	0f 09                	wbinvd
1547     1547:	f3 0f b8 c7          	popcnt %edi,%eax
154b     154b:	9c                   	pushf
154c     154c:	58                   	pop    %rax
154d     154d:	fa                   	cli
154e     154e:	9c                   	pushf
154f     154f:	58                   	pop    %rax
1550     1550:	fb                   	sti
1551     1551:	e9 00 00 00 00       	jmp    1556 <.altinstr_replacement+0x1556>	1552: R_X86_64_PC32	.init.text+0xb460f
1556     1556:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
1560     1560:	e8 00 00 00 00       	call   1565 <.altinstr_replacement+0x1565>	1561: R_X86_64_PLT32	clear_page_rep-0x4
1565     1565:	e8 00 00 00 00       	call   156a <.altinstr_replacement+0x156a>	1566: R_X86_64_PLT32	clear_page_erms-0x4
156a     156a:	0f 22 df             	mov    %rdi,%cr3
156d     156d:	e9 00 00 00 00       	jmp    1572 <.altinstr_replacement+0x1572>	156e: R_X86_64_PC32	.text+0x3b4841
1572     1572:	48 89 f8             	mov    %rdi,%rax
1575     1575:	48 89 f8             	mov    %rdi,%rax
1578     1578:	e9 00 00 00 00       	jmp    157d <.altinstr_replacement+0x157d>	1579: R_X86_64_PC32	.init.text+0xb63a6
157d     157d:	48 89 f8             	mov    %rdi,%rax
1580     1580:	e9 00 00 00 00       	jmp    1585 <.altinstr_replacement+0x1585>	1581: R_X86_64_PC32	.init.text+0xb63b8
1585     1585:	e9 00 00 00 00       	jmp    158a <.altinstr_replacement+0x158a>	1586: R_X86_64_PC32	.init.text+0xb6381
158a     158a:	e9 00 00 00 00       	jmp    158f <.altinstr_replacement+0x158f>	158b: R_X86_64_PC32	.init.text+0xb639d
158f     158f:	48 89 f8             	mov    %rdi,%rax
1592     1592:	48 89 f8             	mov    %rdi,%rax
1595     1595:	e9 00 00 00 00       	jmp    159a <.altinstr_replacement+0x159a>	1596: R_X86_64_PC32	.text+0x3b4f18
159a     159a:	e9 00 00 00 00       	jmp    159f <.altinstr_replacement+0x159f>	159b: R_X86_64_PC32	.text+0x3b4f9f
159f     159f:	e9 00 00 00 00       	jmp    15a4 <.altinstr_replacement+0x15a4>	15a0: R_X86_64_PC32	.text+0x3b5106
15a4     15a4:	e9 00 00 00 00       	jmp    15a9 <.altinstr_replacement+0x15a9>	15a5: R_X86_64_PC32	.text+0x3b5047
15a9     15a9:	e9 00 00 00 00       	jmp    15ae <.altinstr_replacement+0x15ae>	15aa: R_X86_64_PC32	.text+0x3b506d
15ae     15ae:	48 89 f8             	mov    %rdi,%rax
15b1     15b1:	48 89 f8             	mov    %rdi,%rax
15b4     15b4:	e9 00 00 00 00       	jmp    15b9 <.altinstr_replacement+0x15b9>	15b5: R_X86_64_PC32	.text+0x3b5220
15b9     15b9:	48 89 f8             	mov    %rdi,%rax
15bc     15bc:	e9 00 00 00 00       	jmp    15c1 <.altinstr_replacement+0x15c1>	15bd: R_X86_64_PC32	.text+0x3b534c
15c1     15c1:	e9 00 00 00 00       	jmp    15c6 <.altinstr_replacement+0x15c6>	15c2: R_X86_64_PC32	.text+0x3b5542
15c6     15c6:	48 89 f8             	mov    %rdi,%rax
15c9     15c9:	48 89 f8             	mov    %rdi,%rax
15cc     15cc:	48 89 f8             	mov    %rdi,%rax
15cf     15cf:	e9 00 00 00 00       	jmp    15d4 <.altinstr_replacement+0x15d4>	15d0: R_X86_64_PC32	.text+0x3b56ea
15d4     15d4:	48 89 f8             	mov    %rdi,%rax
15d7     15d7:	48 89 f8             	mov    %rdi,%rax
15da     15da:	48 89 f8             	mov    %rdi,%rax
15dd     15dd:	48 89 f8             	mov    %rdi,%rax
15e0     15e0:	48 89 f8             	mov    %rdi,%rax
15e3     15e3:	48 89 f8             	mov    %rdi,%rax
15e6     15e6:	48 89 f8             	mov    %rdi,%rax
15e9     15e9:	48 89 f8             	mov    %rdi,%rax
15ec     15ec:	48 89 f8             	mov    %rdi,%rax
15ef     15ef:	48 89 f8             	mov    %rdi,%rax
15f2     15f2:	48 89 f8             	mov    %rdi,%rax
15f5     15f5:	48 89 f8             	mov    %rdi,%rax
15f8     15f8:	48 89 f8             	mov    %rdi,%rax
15fb     15fb:	48 89 f8             	mov    %rdi,%rax
15fe     15fe:	48 89 f8             	mov    %rdi,%rax
1601     1601:	e9 00 00 00 00       	jmp    1606 <.altinstr_replacement+0x1606>	1602: R_X86_64_PC32	.meminit.text+0x2a0e
1606     1606:	48 89 f8             	mov    %rdi,%rax
1609     1609:	e9 00 00 00 00       	jmp    160e <.altinstr_replacement+0x160e>	160a: R_X86_64_PC32	.meminit.text+0x2dbb
160e     160e:	e9 00 00 00 00       	jmp    1613 <.altinstr_replacement+0x1613>	160f: R_X86_64_PC32	.meminit.text+0x2e53
1613     1613:	48 89 f8             	mov    %rdi,%rax
1616     1616:	48 89 f8             	mov    %rdi,%rax
1619     1619:	48 89 f8             	mov    %rdi,%rax
161c     161c:	48 89 f8             	mov    %rdi,%rax
161f     161f:	48 89 f8             	mov    %rdi,%rax
1622     1622:	48 89 f8             	mov    %rdi,%rax
1625     1625:	48 89 f8             	mov    %rdi,%rax
1628     1628:	48 89 f8             	mov    %rdi,%rax
162b     162b:	e9 00 00 00 00       	jmp    1630 <.altinstr_replacement+0x1630>	162c: R_X86_64_PC32	.init.text+0xb6804
1630     1630:	e9 00 00 00 00       	jmp    1635 <.altinstr_replacement+0x1635>	1631: R_X86_64_PC32	.init.text+0xb6b83
1635     1635:	48 89 f8             	mov    %rdi,%rax
1638     1638:	48 89 f8             	mov    %rdi,%rax
163b     163b:	48 89 f8             	mov    %rdi,%rax
163e     163e:	48 89 f8             	mov    %rdi,%rax
1641     1641:	48 89 f8             	mov    %rdi,%rax
1644     1644:	48 89 f8             	mov    %rdi,%rax
1647     1647:	48 89 f8             	mov    %rdi,%rax
164a     164a:	48 89 f8             	mov    %rdi,%rax
164d     164d:	48 89 f8             	mov    %rdi,%rax
1650     1650:	48 89 f8             	mov    %rdi,%rax
1653     1653:	48 89 f8             	mov    %rdi,%rax
1656     1656:	e9 00 00 00 00       	jmp    165b <.altinstr_replacement+0x165b>	1657: R_X86_64_PC32	.text+0x3b6665
165b     165b:	e9 00 00 00 00       	jmp    1660 <.altinstr_replacement+0x1660>	165c: R_X86_64_PC32	.text+0x3b666e
1660     1660:	48 89 f8             	mov    %rdi,%rax
1663     1663:	48 89 f8             	mov    %rdi,%rax
1666     1666:	e9 00 00 00 00       	jmp    166b <.altinstr_replacement+0x166b>	1667: R_X86_64_PC32	.text+0x3b680f
166b     166b:	e9 00 00 00 00       	jmp    1670 <.altinstr_replacement+0x1670>	166c: R_X86_64_PC32	.text+0x3b688a
1670     1670:	e9 00 00 00 00       	jmp    1675 <.altinstr_replacement+0x1675>	1671: R_X86_64_PC32	.text+0x3b681c
1675     1675:	48 89 f8             	mov    %rdi,%rax
1678     1678:	48 89 f8             	mov    %rdi,%rax
167b     167b:	48 89 f8             	mov    %rdi,%rax
167e     167e:	48 89 f8             	mov    %rdi,%rax
1681     1681:	48 89 f8             	mov    %rdi,%rax
1684     1684:	48 89 f8             	mov    %rdi,%rax
1687     1687:	48 89 f8             	mov    %rdi,%rax
168a     168a:	48 89 f8             	mov    %rdi,%rax
168d     168d:	48 89 f8             	mov    %rdi,%rax
1690     1690:	48 89 f8             	mov    %rdi,%rax
1693     1693:	48 89 f8             	mov    %rdi,%rax
1696     1696:	48 89 f8             	mov    %rdi,%rax
1699     1699:	48 89 f8             	mov    %rdi,%rax
169c     169c:	48 89 f8             	mov    %rdi,%rax
169f     169f:	48 89 f8             	mov    %rdi,%rax
16a2     16a2:	48 89 f8             	mov    %rdi,%rax
16a5     16a5:	48 89 f8             	mov    %rdi,%rax
16a8     16a8:	48 89 f8             	mov    %rdi,%rax
16ab     16ab:	48 89 f8             	mov    %rdi,%rax
16ae     16ae:	48 89 f8             	mov    %rdi,%rax
16b1     16b1:	48 89 f8             	mov    %rdi,%rax
16b4     16b4:	48 89 f8             	mov    %rdi,%rax
16b7     16b7:	48 89 f8             	mov    %rdi,%rax
16ba     16ba:	48 89 f8             	mov    %rdi,%rax
16bd     16bd:	48 89 f8             	mov    %rdi,%rax
16c0     16c0:	48 89 f8             	mov    %rdi,%rax
16c3     16c3:	48 89 f8             	mov    %rdi,%rax
16c6     16c6:	48 89 f8             	mov    %rdi,%rax
16c9     16c9:	48 89 f8             	mov    %rdi,%rax
16cc     16cc:	48 89 f8             	mov    %rdi,%rax
16cf     16cf:	e9 00 00 00 00       	jmp    16d4 <.altinstr_replacement+0x16d4>	16d0: R_X86_64_PC32	.meminit.text+0x50d3
16d4     16d4:	48 89 f8             	mov    %rdi,%rax
16d7     16d7:	48 89 f8             	mov    %rdi,%rax
16da     16da:	48 89 f8             	mov    %rdi,%rax
16dd     16dd:	48 89 f8             	mov    %rdi,%rax
16e0     16e0:	48 89 f8             	mov    %rdi,%rax
16e3     16e3:	48 89 f8             	mov    %rdi,%rax
16e6     16e6:	48 89 f8             	mov    %rdi,%rax
16e9     16e9:	48 89 f8             	mov    %rdi,%rax
16ec     16ec:	48 89 f8             	mov    %rdi,%rax
16ef     16ef:	48 89 f8             	mov    %rdi,%rax
16f2     16f2:	e9 00 00 00 00       	jmp    16f7 <.altinstr_replacement+0x16f7>	16f3: R_X86_64_PC32	.meminit.text+0x5922
16f7     16f7:	48 89 f8             	mov    %rdi,%rax
16fa     16fa:	48 89 f8             	mov    %rdi,%rax
16fd     16fd:	48 89 f8             	mov    %rdi,%rax
1700     1700:	48 89 f8             	mov    %rdi,%rax
1703     1703:	48 89 f8             	mov    %rdi,%rax
1706     1706:	48 89 f8             	mov    %rdi,%rax
1709     1709:	e9 00 00 00 00       	jmp    170e <.altinstr_replacement+0x170e>	170a: R_X86_64_PC32	.text+0x3b6b91
170e     170e:	e9 00 00 00 00       	jmp    1713 <.altinstr_replacement+0x1713>	170f: R_X86_64_PC32	.text+0x3b6bee
1713     1713:	e9 00 00 00 00       	jmp    1718 <.altinstr_replacement+0x1718>	1714: R_X86_64_PC32	.text+0x3b6c77
1718     1718:	48 89 f8             	mov    %rdi,%rax
171b     171b:	48 89 f8             	mov    %rdi,%rax
171e     171e:	e9 00 00 00 00       	jmp    1723 <.altinstr_replacement+0x1723>	171f: R_X86_64_PC32	.text+0x3b6cce
1723     1723:	48 89 f8             	mov    %rdi,%rax
1726     1726:	48 89 f8             	mov    %rdi,%rax
1729     1729:	48 89 f8             	mov    %rdi,%rax
172c     172c:	e9 00 00 00 00       	jmp    1731 <.altinstr_replacement+0x1731>	172d: R_X86_64_PC32	.text+0x3b7016
1731     1731:	e9 00 00 00 00       	jmp    1736 <.altinstr_replacement+0x1736>	1732: R_X86_64_PC32	.init.text+0xb6f0e
1736     1736:	48 89 f8             	mov    %rdi,%rax
1739     1739:	48 89 f8             	mov    %rdi,%rax
173c     173c:	48 89 f8             	mov    %rdi,%rax
173f     173f:	48 89 f8             	mov    %rdi,%rax
1742     1742:	e9 00 00 00 00       	jmp    1747 <.altinstr_replacement+0x1747>	1743: R_X86_64_PC32	.text+0x3b7694
1747     1747:	48 89 f8             	mov    %rdi,%rax
174a     174a:	48 89 f8             	mov    %rdi,%rax
174d     174d:	48 89 f8             	mov    %rdi,%rax
1750     1750:	48 89 f8             	mov    %rdi,%rax
1753     1753:	48 89 f8             	mov    %rdi,%rax
1756     1756:	48 89 f8             	mov    %rdi,%rax
1759     1759:	48 89 f8             	mov    %rdi,%rax
175c     175c:	48 89 f8             	mov    %rdi,%rax
175f     175f:	48 89 f8             	mov    %rdi,%rax
1762     1762:	48 89 f8             	mov    %rdi,%rax
1765     1765:	e9 00 00 00 00       	jmp    176a <.altinstr_replacement+0x176a>	1766: R_X86_64_PC32	.text+0x3b8d5e
176a     176a:	e9 00 00 00 00       	jmp    176f <.altinstr_replacement+0x176f>	176b: R_X86_64_PC32	.text+0x3b92a0
176f     176f:	48 89 f8             	mov    %rdi,%rax
1772     1772:	e9 00 00 00 00       	jmp    1777 <.altinstr_replacement+0x1777>	1773: R_X86_64_PC32	.text+0x3b9413
1777     1777:	48 89 f8             	mov    %rdi,%rax
177a     177a:	48 89 f8             	mov    %rdi,%rax
177d     177d:	48 89 f8             	mov    %rdi,%rax
1780     1780:	48 89 f8             	mov    %rdi,%rax
1783     1783:	0f 20 d8             	mov    %cr3,%rax
1786     1786:	48 89 f8             	mov    %rdi,%rax
1789     1789:	e9 00 00 00 00       	jmp    178e <.altinstr_replacement+0x178e>	178a: R_X86_64_PC32	.text+0x3b99a8
178e     178e:	48 89 f8             	mov    %rdi,%rax
1791     1791:	48 89 f8             	mov    %rdi,%rax
1794     1794:	48 89 f8             	mov    %rdi,%rax
1797     1797:	48 89 f8             	mov    %rdi,%rax
179a     179a:	48 89 f8             	mov    %rdi,%rax
179d     179d:	48 89 f8             	mov    %rdi,%rax
17a0     17a0:	48 89 f8             	mov    %rdi,%rax
17a3     17a3:	48 89 f8             	mov    %rdi,%rax
17a6     17a6:	0f 20 d8             	mov    %cr3,%rax
17a9     17a9:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
17b3     17b3:	fb                   	sti
17b4     17b4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
17be     17be:	9c                   	pushf
17bf     17bf:	58                   	pop    %rax
17c0     17c0:	fa                   	cli
17c1     17c1:	9c                   	pushf
17c2     17c2:	58                   	pop    %rax
17c3     17c3:	e9 00 00 00 00       	jmp    17c8 <.altinstr_replacement+0x17c8>	17c4: R_X86_64_PC32	.text+0x3bb248
17c8     17c8:	e9 00 00 00 00       	jmp    17cd <.altinstr_replacement+0x17cd>	17c9: R_X86_64_PC32	.text+0x3bb248
17cd     17cd:	9c                   	pushf
17ce     17ce:	58                   	pop    %rax
17cf     17cf:	e9 00 00 00 00       	jmp    17d4 <.altinstr_replacement+0x17d4>	17d0: R_X86_64_PC32	.text+0x3bb61c
17d4     17d4:	fb                   	sti
17d5     17d5:	fb                   	sti
17d6     17d6:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
17e0     17e0:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
17ea     17ea:	0f 20 d0             	mov    %cr2,%rax
17ed     17ed:	0f 0d 48 70          	prefetchw 0x70(%rax)
17f1     17f1:	9c                   	pushf
17f2     17f2:	58                   	pop    %rax
17f3     17f3:	fa                   	cli
17f4     17f4:	e9 00 00 00 00       	jmp    17f9 <.altinstr_replacement+0x17f9>	17f5: R_X86_64_PC32	.text+0x3bc856
17f9     17f9:	48 89 f8             	mov    %rdi,%rax
17fc     17fc:	0f 20 d8             	mov    %cr3,%rax
17ff     17ff:	48 89 f8             	mov    %rdi,%rax
1802     1802:	48 89 f8             	mov    %rdi,%rax
1805     1805:	e9 00 00 00 00       	jmp    180a <.altinstr_replacement+0x180a>	1806: R_X86_64_PC32	.text+0x3bd7e8
180a     180a:	e9 00 00 00 00       	jmp    180f <.altinstr_replacement+0x180f>	180b: R_X86_64_PC32	.text+0x3bd7f3
180f     180f:	48 89 f8             	mov    %rdi,%rax
1812     1812:	48 89 f8             	mov    %rdi,%rax
1815     1815:	e9 00 00 00 00       	jmp    181a <.altinstr_replacement+0x181a>	1816: R_X86_64_PC32	.text+0x3becb7
181a     181a:	0f 20 d0             	mov    %cr2,%rax
181d     181d:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
1827     1827:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
1831     1831:	e9 00 00 00 00       	jmp    1836 <.altinstr_replacement+0x1836>	1832: R_X86_64_PC32	.text+0x3bfb2f
1836     1836:	e9 00 00 00 00       	jmp    183b <.altinstr_replacement+0x183b>	1837: R_X86_64_PC32	.text+0x3bfc36
183b     183b:	e9 00 00 00 00       	jmp    1840 <.altinstr_replacement+0x1840>	183c: R_X86_64_PC32	.text+0x3bfd8b
1840     1840:	9c                   	pushf
1841     1841:	58                   	pop    %rax
1842     1842:	fa                   	cli
1843     1843:	9c                   	pushf
1844     1844:	58                   	pop    %rax
1845     1845:	fb                   	sti
1846     1846:	48 89 f8             	mov    %rdi,%rax
1849     1849:	48 89 f8             	mov    %rdi,%rax
184c     184c:	48 89 f8             	mov    %rdi,%rax
184f     184f:	48 89 f8             	mov    %rdi,%rax
1852     1852:	48 89 f8             	mov    %rdi,%rax
1855     1855:	48 89 f8             	mov    %rdi,%rax
1858     1858:	48 89 f8             	mov    %rdi,%rax
185b     185b:	48 89 f8             	mov    %rdi,%rax
185e     185e:	48 89 f8             	mov    %rdi,%rax
1861     1861:	48 89 f8             	mov    %rdi,%rax
1864     1864:	48 89 f8             	mov    %rdi,%rax
1867     1867:	48 89 f8             	mov    %rdi,%rax
186a     186a:	48 89 f8             	mov    %rdi,%rax
186d     186d:	e9 00 00 00 00       	jmp    1872 <.altinstr_replacement+0x1872>	186e: R_X86_64_PC32	.text+0x3c278a
1872     1872:	e9 00 00 00 00       	jmp    1877 <.altinstr_replacement+0x1877>	1873: R_X86_64_PC32	.text+0x3c28be
1877     1877:	e9 00 00 00 00       	jmp    187c <.altinstr_replacement+0x187c>	1878: R_X86_64_PC32	.text+0x3c2abc
187c     187c:	e9 00 00 00 00       	jmp    1881 <.altinstr_replacement+0x1881>	187d: R_X86_64_PC32	.text+0x3c2abc
1881     1881:	e9 00 00 00 00       	jmp    1886 <.altinstr_replacement+0x1886>	1882: R_X86_64_PC32	.text+0x3c313a
1886     1886:	0f 22 df             	mov    %rdi,%cr3
1889     1889:	9c                   	pushf
188a     188a:	58                   	pop    %rax
188b     188b:	e9 00 00 00 00       	jmp    1890 <.altinstr_replacement+0x1890>	188c: R_X86_64_PC32	.text+0x3c331c
1890     1890:	0f 20 d8             	mov    %cr3,%rax
1893     1893:	9c                   	pushf
1894     1894:	58                   	pop    %rax
1895     1895:	9c                   	pushf
1896     1896:	58                   	pop    %rax
1897     1897:	0f 20 d8             	mov    %cr3,%rax
189a     189a:	0f 30                	wrmsr
189c     189c:	e9 00 00 00 00       	jmp    18a1 <.altinstr_replacement+0x18a1>	189d: R_X86_64_PC32	.text+0x3c37b6
18a1     18a1:	0f 30                	wrmsr
18a3     18a3:	e9 00 00 00 00       	jmp    18a8 <.altinstr_replacement+0x18a8>	18a4: R_X86_64_PC32	.text+0x3c3acd
18a8     18a8:	9c                   	pushf
18a9     18a9:	58                   	pop    %rax
18aa     18aa:	fa                   	cli
18ab     18ab:	9c                   	pushf
18ac     18ac:	58                   	pop    %rax
18ad     18ad:	fb                   	sti
18ae     18ae:	9c                   	pushf
18af     18af:	58                   	pop    %rax
18b0     18b0:	0f 20 d8             	mov    %cr3,%rax
18b3     18b3:	0f 22 df             	mov    %rdi,%cr3
18b6     18b6:	9c                   	pushf
18b7     18b7:	58                   	pop    %rax
18b8     18b8:	fa                   	cli
18b9     18b9:	fb                   	sti
18ba     18ba:	e9 00 00 00 00       	jmp    18bf <.altinstr_replacement+0x18bf>	18bb: R_X86_64_PC32	.text+0x3c4a6a
18bf     18bf:	e9 00 00 00 00       	jmp    18c4 <.altinstr_replacement+0x18c4>	18c0: R_X86_64_PC32	.text+0x3c4bf9
18c4     18c4:	e9 00 00 00 00       	jmp    18c9 <.altinstr_replacement+0x18c9>	18c5: R_X86_64_PC32	.text+0x3c4d70
18c9     18c9:	9c                   	pushf
18ca     18ca:	58                   	pop    %rax
18cb     18cb:	fa                   	cli
18cc     18cc:	9c                   	pushf
18cd     18cd:	58                   	pop    %rax
18ce     18ce:	fb                   	sti
18cf     18cf:	9c                   	pushf
18d0     18d0:	58                   	pop    %rax
18d1     18d1:	9c                   	pushf
18d2     18d2:	58                   	pop    %rax
18d3     18d3:	fa                   	cli
18d4     18d4:	fb                   	sti
18d5     18d5:	0f 20 d8             	mov    %cr3,%rax
18d8     18d8:	48 89 f8             	mov    %rdi,%rax
18db     18db:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
18e5     18e5:	e9 00 00 00 00       	jmp    18ea <.altinstr_replacement+0x18ea>	18e6: R_X86_64_PC32	.text+0x3c58b0
18ea     18ea:	0f 09                	wbinvd
18ec     18ec:	e9 00 00 00 00       	jmp    18f1 <.altinstr_replacement+0x18f1>	18ed: R_X86_64_PC32	.text+0x3c5ae5
18f1     18f1:	48 89 f8             	mov    %rdi,%rax
18f4     18f4:	48 89 f8             	mov    %rdi,%rax
18f7     18f7:	9c                   	pushf
18f8     18f8:	58                   	pop    %rax
18f9     18f9:	66 0f ae 3b          	clflushopt (%rbx)
18fd     18fd:	48 89 f8             	mov    %rdi,%rax
1900     1900:	48 89 f8             	mov    %rdi,%rax
1903     1903:	48 89 f8             	mov    %rdi,%rax
1906     1906:	48 89 f8             	mov    %rdi,%rax
1909     1909:	48 89 f8             	mov    %rdi,%rax
190c     190c:	48 89 f8             	mov    %rdi,%rax
190f     190f:	48 89 f8             	mov    %rdi,%rax
1912     1912:	48 89 f8             	mov    %rdi,%rax
1915     1915:	48 89 f8             	mov    %rdi,%rax
1918     1918:	48 89 f8             	mov    %rdi,%rax
191b     191b:	48 89 f8             	mov    %rdi,%rax
191e     191e:	48 89 f8             	mov    %rdi,%rax
1921     1921:	48 89 f8             	mov    %rdi,%rax
1924     1924:	48 89 f8             	mov    %rdi,%rax
1927     1927:	48 89 f8             	mov    %rdi,%rax
192a     192a:	48 89 f8             	mov    %rdi,%rax
192d     192d:	48 89 f8             	mov    %rdi,%rax
1930     1930:	48 89 f8             	mov    %rdi,%rax
1933     1933:	48 89 f8             	mov    %rdi,%rax
1936     1936:	e9 00 00 00 00       	jmp    193b <.altinstr_replacement+0x193b>	1937: R_X86_64_PC32	.text+0x3c8655
193b     193b:	e9 00 00 00 00       	jmp    1940 <.altinstr_replacement+0x1940>	193c: R_X86_64_PC32	.text+0x3c87ba
1940     1940:	48 89 f8             	mov    %rdi,%rax
1943     1943:	48 89 f8             	mov    %rdi,%rax
1946     1946:	48 89 f8             	mov    %rdi,%rax
1949     1949:	48 89 f8             	mov    %rdi,%rax
194c     194c:	48 89 f8             	mov    %rdi,%rax
194f     194f:	e9 00 00 00 00       	jmp    1954 <.altinstr_replacement+0x1954>	1950: R_X86_64_PC32	.text+0x3c9000
1954     1954:	48 89 f8             	mov    %rdi,%rax
1957     1957:	48 89 f8             	mov    %rdi,%rax
195a     195a:	48 89 f8             	mov    %rdi,%rax
195d     195d:	48 89 f8             	mov    %rdi,%rax
1960     1960:	48 89 f8             	mov    %rdi,%rax
1963     1963:	48 89 f8             	mov    %rdi,%rax
1966     1966:	48 89 f8             	mov    %rdi,%rax
1969     1969:	48 89 f8             	mov    %rdi,%rax
196c     196c:	9c                   	pushf
196d     196d:	58                   	pop    %rax
196e     196e:	48 89 f8             	mov    %rdi,%rax
1971     1971:	66 41 0f ae 3f       	clflushopt (%r15)
1976     1976:	e9 00 00 00 00       	jmp    197b <.altinstr_replacement+0x197b>	1977: R_X86_64_PC32	.text+0x3c9fdb
197b     197b:	48 89 f8             	mov    %rdi,%rax
197e     197e:	48 89 f8             	mov    %rdi,%rax
1981     1981:	48 89 f8             	mov    %rdi,%rax
1984     1984:	48 89 f8             	mov    %rdi,%rax
1987     1987:	48 89 f8             	mov    %rdi,%rax
198a     198a:	48 89 f8             	mov    %rdi,%rax
198d     198d:	48 89 f8             	mov    %rdi,%rax
1990     1990:	48 89 f8             	mov    %rdi,%rax
1993     1993:	48 89 f8             	mov    %rdi,%rax
1996     1996:	48 89 f8             	mov    %rdi,%rax
1999     1999:	48 89 f8             	mov    %rdi,%rax
199c     199c:	48 89 f8             	mov    %rdi,%rax
199f     199f:	48 89 f8             	mov    %rdi,%rax
19a2     19a2:	48 89 f8             	mov    %rdi,%rax
19a5     19a5:	48 89 f8             	mov    %rdi,%rax
19a8     19a8:	e9 00 00 00 00       	jmp    19ad <.altinstr_replacement+0x19ad>	19a9: R_X86_64_PC32	.text+0x3cf938
19ad     19ad:	48 89 f8             	mov    %rdi,%rax
19b0     19b0:	48 89 f8             	mov    %rdi,%rax
19b3     19b3:	48 89 f8             	mov    %rdi,%rax
19b6     19b6:	48 89 f8             	mov    %rdi,%rax
19b9     19b9:	e9 00 00 00 00       	jmp    19be <.altinstr_replacement+0x19be>	19ba: R_X86_64_PC32	.init.text+0xbab3f
19be     19be:	e9 00 00 00 00       	jmp    19c3 <.altinstr_replacement+0x19c3>	19bf: R_X86_64_PC32	.init.text+0xbac3f
19c3     19c3:	e9 00 00 00 00       	jmp    19c8 <.altinstr_replacement+0x19c8>	19c4: R_X86_64_PC32	.init.text+0xbacfb
19c8     19c8:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
19d2     19d2:	48 89 f8             	mov    %rdi,%rax
19d5     19d5:	48 89 f8             	mov    %rdi,%rax
19d8     19d8:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
19e2     19e2:	48 89 f8             	mov    %rdi,%rax
19e5     19e5:	48 89 f8             	mov    %rdi,%rax
19e8     19e8:	48 89 f8             	mov    %rdi,%rax
19eb     19eb:	48 89 f8             	mov    %rdi,%rax
19ee     19ee:	48 89 f8             	mov    %rdi,%rax
19f1     19f1:	48 89 f8             	mov    %rdi,%rax
19f4     19f4:	9c                   	pushf
19f5     19f5:	58                   	pop    %rax
19f6     19f6:	fa                   	cli
19f7     19f7:	c6 07 00             	movb   $0x0,(%rdi)
19fa     19fa:	9c                   	pushf
19fb     19fb:	58                   	pop    %rax
19fc     19fc:	fb                   	sti
19fd     19fd:	c6 07 00             	movb   $0x0,(%rdi)
1a00     1a00:	9c                   	pushf
1a01     1a01:	58                   	pop    %rax
1a02     1a02:	fa                   	cli
1a03     1a03:	c6 07 00             	movb   $0x0,(%rdi)
1a06     1a06:	9c                   	pushf
1a07     1a07:	58                   	pop    %rax
1a08     1a08:	fb                   	sti
1a09     1a09:	9c                   	pushf
1a0a     1a0a:	58                   	pop    %rax
1a0b     1a0b:	fa                   	cli
1a0c     1a0c:	c6 07 00             	movb   $0x0,(%rdi)
1a0f     1a0f:	9c                   	pushf
1a10     1a10:	58                   	pop    %rax
1a11     1a11:	fb                   	sti
1a12     1a12:	48 89 f8             	mov    %rdi,%rax
1a15     1a15:	e9 00 00 00 00       	jmp    1a1a <.altinstr_replacement+0x1a1a>	1a16: R_X86_64_PC32	.init.text+0xc378f
1a1a     1a1a:	e9 00 00 00 00       	jmp    1a1f <.altinstr_replacement+0x1a1f>	1a1b: R_X86_64_PC32	.text+0x3de520
1a1f     1a1f:	e9 00 00 00 00       	jmp    1a24 <.altinstr_replacement+0x1a24>	1a20: R_X86_64_PC32	.text+0x3de596
1a24     1a24:	e9 00 00 00 00       	jmp    1a29 <.altinstr_replacement+0x1a29>	1a25: R_X86_64_PC32	.text+0x3de7fb
1a29     1a29:	e9 00 00 00 00       	jmp    1a2e <.altinstr_replacement+0x1a2e>	1a2a: R_X86_64_PC32	.text+0x3de8e0
1a2e     1a2e:	48 89 f8             	mov    %rdi,%rax
1a31     1a31:	e9 00 00 00 00       	jmp    1a36 <.altinstr_replacement+0x1a36>	1a32: R_X86_64_PC32	.init.text+0xc3a5e
1a36     1a36:	e9 00 00 00 00       	jmp    1a3b <.altinstr_replacement+0x1a3b>	1a37: R_X86_64_PC32	.init.text+0xc3a71
1a3b     1a3b:	e9 00 00 00 00       	jmp    1a40 <.altinstr_replacement+0x1a40>	1a3c: R_X86_64_PC32	.init.text+0xc3d00
1a40     1a40:	48 89 f8             	mov    %rdi,%rax
1a43     1a43:	e9 00 00 00 00       	jmp    1a48 <.altinstr_replacement+0x1a48>	1a44: R_X86_64_PC32	.meminit.text+0x6fa3
1a48     1a48:	48 89 f8             	mov    %rdi,%rax
1a4b     1a4b:	48 89 f8             	mov    %rdi,%rax
1a4e     1a4e:	e9 00 00 00 00       	jmp    1a53 <.altinstr_replacement+0x1a53>	1a4f: R_X86_64_PC32	.text+0x3de9e0
1a53     1a53:	48 89 f8             	mov    %rdi,%rax
1a56     1a56:	e9 00 00 00 00       	jmp    1a5b <.altinstr_replacement+0x1a5b>	1a57: R_X86_64_PC32	.text+0x3deb9a
1a5b     1a5b:	e9 00 00 00 00       	jmp    1a60 <.altinstr_replacement+0x1a60>	1a5c: R_X86_64_PC32	.text+0x3dec0e
1a60     1a60:	48 89 f8             	mov    %rdi,%rax
1a63     1a63:	48 89 f8             	mov    %rdi,%rax
1a66     1a66:	48 89 f8             	mov    %rdi,%rax
1a69     1a69:	48 89 f8             	mov    %rdi,%rax
1a6c     1a6c:	48 89 f8             	mov    %rdi,%rax
1a6f     1a6f:	48 89 f8             	mov    %rdi,%rax
1a72     1a72:	48 89 f8             	mov    %rdi,%rax
1a75     1a75:	48 89 f8             	mov    %rdi,%rax
1a78     1a78:	48 89 f8             	mov    %rdi,%rax
1a7b     1a7b:	48 89 f8             	mov    %rdi,%rax
1a7e     1a7e:	e9 00 00 00 00       	jmp    1a83 <.altinstr_replacement+0x1a83>	1a7f: R_X86_64_PC32	.text+0x3df40f
1a83     1a83:	48 89 f8             	mov    %rdi,%rax
1a86     1a86:	48 89 f8             	mov    %rdi,%rax
1a89     1a89:	e9 00 00 00 00       	jmp    1a8e <.altinstr_replacement+0x1a8e>	1a8a: R_X86_64_PC32	.text+0x3df899
1a8e     1a8e:	e9 00 00 00 00       	jmp    1a93 <.altinstr_replacement+0x1a93>	1a8f: R_X86_64_PC32	.text+0x3df959
1a93     1a93:	e9 00 00 00 00       	jmp    1a98 <.altinstr_replacement+0x1a98>	1a94: R_X86_64_PC32	.text+0x3dfc0c
1a98     1a98:	48 89 f8             	mov    %rdi,%rax
1a9b     1a9b:	48 89 f8             	mov    %rdi,%rax
1a9e     1a9e:	48 89 f8             	mov    %rdi,%rax
1aa1     1aa1:	0f 09                	wbinvd
1aa3     1aa3:	48 89 f8             	mov    %rdi,%rax
1aa6     1aa6:	e9 00 00 00 00       	jmp    1aab <.altinstr_replacement+0x1aab>	1aa7: R_X86_64_PC32	.init.text+0xc6cff
1aab     1aab:	e9 00 00 00 00       	jmp    1ab0 <.altinstr_replacement+0x1ab0>	1aac: R_X86_64_PC32	.init.text+0xc6d28
1ab0     1ab0:	0f 30                	wrmsr
1ab2     1ab2:	e9 00 00 00 00       	jmp    1ab7 <.altinstr_replacement+0x1ab7>	1ab3: R_X86_64_PC32	.text+0x4e4765
1ab7     1ab7:	48 89 f8             	mov    %rdi,%rax
1aba     1aba:	e9 00 00 00 00       	jmp    1abf <.altinstr_replacement+0x1abf>	1abb: R_X86_64_PC32	.init.text+0xd40d5
1abf     1abf:	48 89 f8             	mov    %rdi,%rax
1ac2     1ac2:	e9 00 00 00 00       	jmp    1ac7 <.altinstr_replacement+0x1ac7>	1ac3: R_X86_64_PC32	.init.text+0xd438a
1ac7     1ac7:	e9 00 00 00 00       	jmp    1acc <.altinstr_replacement+0x1acc>	1ac8: R_X86_64_PC32	.init.text+0xd4531
1acc     1acc:	48 89 f8             	mov    %rdi,%rax
1acf     1acf:	48 89 f8             	mov    %rdi,%rax
1ad2     1ad2:	48 89 f8             	mov    %rdi,%rax
1ad5     1ad5:	48 89 f8             	mov    %rdi,%rax
1ad8     1ad8:	48 89 f8             	mov    %rdi,%rax
1adb     1adb:	9c                   	pushf
1adc     1adc:	58                   	pop    %rax
1add     1add:	fa                   	cli
1ade     1ade:	9c                   	pushf
1adf     1adf:	58                   	pop    %rax
1ae0     1ae0:	fb                   	sti
1ae1     1ae1:	0f 30                	wrmsr
1ae3     1ae3:	0f 30                	wrmsr
1ae5     1ae5:	0f 30                	wrmsr
1ae7     1ae7:	0f 30                	wrmsr
1ae9     1ae9:	0f 30                	wrmsr
1aeb     1aeb:	0f 30                	wrmsr
1aed     1aed:	0f 30                	wrmsr
1aef     1aef:	0f 30                	wrmsr
1af1     1af1:	0f 30                	wrmsr
1af3     1af3:	9c                   	pushf
1af4     1af4:	58                   	pop    %rax
1af5     1af5:	fa                   	cli
1af6     1af6:	9c                   	pushf
1af7     1af7:	58                   	pop    %rax
1af8     1af8:	fb                   	sti
1af9     1af9:	0f 30                	wrmsr
1afb     1afb:	0f 30                	wrmsr
1afd     1afd:	0f 30                	wrmsr
1aff     1aff:	0f 30                	wrmsr
1b01     1b01:	0f 30                	wrmsr
1b03     1b03:	0f 30                	wrmsr
1b05     1b05:	0f 30                	wrmsr
1b07     1b07:	0f 30                	wrmsr
1b09     1b09:	0f 30                	wrmsr
1b0b     1b0b:	0f 30                	wrmsr
1b0d     1b0d:	0f 30                	wrmsr
1b0f     1b0f:	0f 30                	wrmsr
1b11     1b11:	9c                   	pushf
1b12     1b12:	58                   	pop    %rax
1b13     1b13:	fa                   	cli
1b14     1b14:	9c                   	pushf
1b15     1b15:	58                   	pop    %rax
1b16     1b16:	fb                   	sti
1b17     1b17:	9c                   	pushf
1b18     1b18:	58                   	pop    %rax
1b19     1b19:	fa                   	cli
1b1a     1b1a:	9c                   	pushf
1b1b     1b1b:	58                   	pop    %rax
1b1c     1b1c:	fb                   	sti
1b1d     1b1d:	0f 30                	wrmsr
1b1f     1b1f:	0f 30                	wrmsr
1b21     1b21:	0f 30                	wrmsr
1b23     1b23:	9c                   	pushf
1b24     1b24:	58                   	pop    %rax
1b25     1b25:	fa                   	cli
1b26     1b26:	9c                   	pushf
1b27     1b27:	58                   	pop    %rax
1b28     1b28:	fb                   	sti
1b29     1b29:	9c                   	pushf
1b2a     1b2a:	58                   	pop    %rax
1b2b     1b2b:	fa                   	cli
1b2c     1b2c:	9c                   	pushf
1b2d     1b2d:	58                   	pop    %rax
1b2e     1b2e:	fb                   	sti
1b2f     1b2f:	9c                   	pushf
1b30     1b30:	58                   	pop    %rax
1b31     1b31:	fb                   	sti
1b32     1b32:	e9 00 00 00 00       	jmp    1b37 <.altinstr_replacement+0x1b37>	1b33: R_X86_64_PC32	.text+0x4f3f08
1b37     1b37:	e9 00 00 00 00       	jmp    1b3c <.altinstr_replacement+0x1b3c>	1b38: R_X86_64_PC32	.text+0x4f4b8e
1b3c     1b3c:	e9 00 00 00 00       	jmp    1b41 <.altinstr_replacement+0x1b41>	1b3d: R_X86_64_PC32	.text+0x4f4bb7
1b41     1b41:	e9 00 00 00 00       	jmp    1b46 <.altinstr_replacement+0x1b46>	1b42: R_X86_64_PC32	.text+0x4f4bec
1b46     1b46:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1b50     1b50:	9c                   	pushf
1b51     1b51:	58                   	pop    %rax
1b52     1b52:	fa                   	cli
1b53     1b53:	9c                   	pushf
1b54     1b54:	58                   	pop    %rax
1b55     1b55:	fb                   	sti
1b56     1b56:	e9 00 00 00 00       	jmp    1b5b <.altinstr_replacement+0x1b5b>	1b57: R_X86_64_PC32	.text+0x5008fa
1b5b     1b5b:	e9 00 00 00 00       	jmp    1b60 <.altinstr_replacement+0x1b60>	1b5c: R_X86_64_PC32	.text+0x5023ab
1b60     1b60:	e9 00 00 00 00       	jmp    1b65 <.altinstr_replacement+0x1b65>	1b61: R_X86_64_PC32	.text+0x506be5
1b65     1b65:	9c                   	pushf
1b66     1b66:	58                   	pop    %rax
1b67     1b67:	fa                   	cli
1b68     1b68:	fb                   	sti
1b69     1b69:	9c                   	pushf
1b6a     1b6a:	58                   	pop    %rax
1b6b     1b6b:	fa                   	cli
1b6c     1b6c:	fb                   	sti
1b6d     1b6d:	0f 01 cb             	stac
1b70     1b70:	0f ae e8             	lfence
1b73     1b73:	0f 01 ca             	clac
1b76     1b76:	0f 01 ca             	clac
1b79     1b79:	0f 01 cb             	stac
1b7c     1b7c:	0f ae e8             	lfence
1b7f     1b7f:	0f 01 ca             	clac
1b82     1b82:	0f 01 ca             	clac
1b85     1b85:	9c                   	pushf
1b86     1b86:	58                   	pop    %rax
1b87     1b87:	fa                   	cli
1b88     1b88:	fb                   	sti
1b89     1b89:	9c                   	pushf
1b8a     1b8a:	58                   	pop    %rax
1b8b     1b8b:	9c                   	pushf
1b8c     1b8c:	58                   	pop    %rax
1b8d     1b8d:	fb                   	sti
1b8e     1b8e:	9c                   	pushf
1b8f     1b8f:	58                   	pop    %rax
1b90     1b90:	fa                   	cli
1b91     1b91:	9c                   	pushf
1b92     1b92:	58                   	pop    %rax
1b93     1b93:	fb                   	sti
1b94     1b94:	9c                   	pushf
1b95     1b95:	58                   	pop    %rax
1b96     1b96:	fa                   	cli
1b97     1b97:	fb                   	sti
1b98     1b98:	9c                   	pushf
1b99     1b99:	58                   	pop    %rax
1b9a     1b9a:	fa                   	cli
1b9b     1b9b:	9c                   	pushf
1b9c     1b9c:	58                   	pop    %rax
1b9d     1b9d:	fa                   	cli
1b9e     1b9e:	fb                   	sti
1b9f     1b9f:	fb                   	sti
1ba0     1ba0:	9c                   	pushf
1ba1     1ba1:	58                   	pop    %rax
1ba2     1ba2:	fa                   	cli
1ba3     1ba3:	9c                   	pushf
1ba4     1ba4:	58                   	pop    %rax
1ba5     1ba5:	fb                   	sti
1ba6     1ba6:	9c                   	pushf
1ba7     1ba7:	58                   	pop    %rax
1ba8     1ba8:	fa                   	cli
1ba9     1ba9:	fb                   	sti
1baa     1baa:	9c                   	pushf
1bab     1bab:	58                   	pop    %rax
1bac     1bac:	fa                   	cli
1bad     1bad:	fb                   	sti
1bae     1bae:	9c                   	pushf
1baf     1baf:	58                   	pop    %rax
1bb0     1bb0:	fa                   	cli
1bb1     1bb1:	9c                   	pushf
1bb2     1bb2:	58                   	pop    %rax
1bb3     1bb3:	fa                   	cli
1bb4     1bb4:	9c                   	pushf
1bb5     1bb5:	58                   	pop    %rax
1bb6     1bb6:	fb                   	sti
1bb7     1bb7:	9c                   	pushf
1bb8     1bb8:	58                   	pop    %rax
1bb9     1bb9:	fa                   	cli
1bba     1bba:	9c                   	pushf
1bbb     1bbb:	58                   	pop    %rax
1bbc     1bbc:	fb                   	sti
1bbd     1bbd:	9c                   	pushf
1bbe     1bbe:	58                   	pop    %rax
1bbf     1bbf:	fa                   	cli
1bc0     1bc0:	fb                   	sti
1bc1     1bc1:	e9 00 00 00 00       	jmp    1bc6 <.altinstr_replacement+0x1bc6>	1bc2: R_X86_64_PC32	.text+0x52fcc6
1bc6     1bc6:	e9 00 00 00 00       	jmp    1bcb <.altinstr_replacement+0x1bcb>	1bc7: R_X86_64_PC32	.text+0x52fceb
1bcb     1bcb:	0f 01 cb             	stac
1bce     1bce:	e8 00 00 00 00       	call   1bd3 <.altinstr_replacement+0x1bd3>	1bcf: R_X86_64_PLT32	rep_stos_alternative-0x4
1bd3     1bd3:	0f 01 ca             	clac
1bd6     1bd6:	49 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r14
1be0     1be0:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
1bea     1bea:	9c                   	pushf
1beb     1beb:	58                   	pop    %rax
1bec     1bec:	fa                   	cli
1bed     1bed:	9c                   	pushf
1bee     1bee:	58                   	pop    %rax
1bef     1bef:	fb                   	sti
1bf0     1bf0:	9c                   	pushf
1bf1     1bf1:	58                   	pop    %rax
1bf2     1bf2:	fa                   	cli
1bf3     1bf3:	9c                   	pushf
1bf4     1bf4:	58                   	pop    %rax
1bf5     1bf5:	fb                   	sti
1bf6     1bf6:	9c                   	pushf
1bf7     1bf7:	58                   	pop    %rax
1bf8     1bf8:	fa                   	cli
1bf9     1bf9:	fb                   	sti
1bfa     1bfa:	9c                   	pushf
1bfb     1bfb:	58                   	pop    %rax
1bfc     1bfc:	fa                   	cli
1bfd     1bfd:	9c                   	pushf
1bfe     1bfe:	58                   	pop    %rax
1bff     1bff:	fb                   	sti
1c00     1c00:	9c                   	pushf
1c01     1c01:	58                   	pop    %rax
1c02     1c02:	fa                   	cli
1c03     1c03:	9c                   	pushf
1c04     1c04:	58                   	pop    %rax
1c05     1c05:	fb                   	sti
1c06     1c06:	9c                   	pushf
1c07     1c07:	58                   	pop    %rax
1c08     1c08:	fb                   	sti
1c09     1c09:	9c                   	pushf
1c0a     1c0a:	58                   	pop    %rax
1c0b     1c0b:	fb                   	sti
1c0c     1c0c:	9c                   	pushf
1c0d     1c0d:	58                   	pop    %rax
1c0e     1c0e:	fa                   	cli
1c0f     1c0f:	fb                   	sti
1c10     1c10:	9c                   	pushf
1c11     1c11:	58                   	pop    %rax
1c12     1c12:	fb                   	sti
1c13     1c13:	9c                   	pushf
1c14     1c14:	58                   	pop    %rax
1c15     1c15:	9c                   	pushf
1c16     1c16:	58                   	pop    %rax
1c17     1c17:	9c                   	pushf
1c18     1c18:	58                   	pop    %rax
1c19     1c19:	fa                   	cli
1c1a     1c1a:	fb                   	sti
1c1b     1c1b:	9c                   	pushf
1c1c     1c1c:	58                   	pop    %rax
1c1d     1c1d:	fa                   	cli
1c1e     1c1e:	9c                   	pushf
1c1f     1c1f:	58                   	pop    %rax
1c20     1c20:	fb                   	sti
1c21     1c21:	9c                   	pushf
1c22     1c22:	58                   	pop    %rax
1c23     1c23:	fa                   	cli
1c24     1c24:	fb                   	sti
1c25     1c25:	e9 00 00 00 00       	jmp    1c2a <.altinstr_replacement+0x1c2a>	1c26: R_X86_64_PC32	.text+0x5bf888
1c2a     1c2a:	e9 00 00 00 00       	jmp    1c2f <.altinstr_replacement+0x1c2f>	1c2b: R_X86_64_PC32	.text+0x5bf897
1c2f     1c2f:	9c                   	pushf
1c30     1c30:	58                   	pop    %rax
1c31     1c31:	9c                   	pushf
1c32     1c32:	58                   	pop    %rax
1c33     1c33:	9c                   	pushf
1c34     1c34:	58                   	pop    %rax
1c35     1c35:	9c                   	pushf
1c36     1c36:	58                   	pop    %rax
1c37     1c37:	9c                   	pushf
1c38     1c38:	58                   	pop    %rax
1c39     1c39:	9c                   	pushf
1c3a     1c3a:	58                   	pop    %rax
1c3b     1c3b:	9c                   	pushf
1c3c     1c3c:	58                   	pop    %rax
1c3d     1c3d:	9c                   	pushf
1c3e     1c3e:	58                   	pop    %rax
1c3f     1c3f:	9c                   	pushf
1c40     1c40:	58                   	pop    %rax
1c41     1c41:	fb                   	sti
1c42     1c42:	9c                   	pushf
1c43     1c43:	58                   	pop    %rax
1c44     1c44:	fa                   	cli
1c45     1c45:	9c                   	pushf
1c46     1c46:	58                   	pop    %rax
1c47     1c47:	fa                   	cli
1c48     1c48:	9c                   	pushf
1c49     1c49:	58                   	pop    %rax
1c4a     1c4a:	fb                   	sti
1c4b     1c4b:	9c                   	pushf
1c4c     1c4c:	58                   	pop    %rax
1c4d     1c4d:	fa                   	cli
1c4e     1c4e:	9c                   	pushf
1c4f     1c4f:	58                   	pop    %rax
1c50     1c50:	fa                   	cli
1c51     1c51:	9c                   	pushf
1c52     1c52:	58                   	pop    %rax
1c53     1c53:	fa                   	cli
1c54     1c54:	9c                   	pushf
1c55     1c55:	58                   	pop    %rax
1c56     1c56:	fb                   	sti
1c57     1c57:	fb                   	sti
1c58     1c58:	9c                   	pushf
1c59     1c59:	58                   	pop    %rax
1c5a     1c5a:	fa                   	cli
1c5b     1c5b:	fb                   	sti
1c5c     1c5c:	fb                   	sti
1c5d     1c5d:	9c                   	pushf
1c5e     1c5e:	58                   	pop    %rax
1c5f     1c5f:	9c                   	pushf
1c60     1c60:	58                   	pop    %rax
1c61     1c61:	9c                   	pushf
1c62     1c62:	58                   	pop    %rax
1c63     1c63:	fa                   	cli
1c64     1c64:	9c                   	pushf
1c65     1c65:	58                   	pop    %rax
1c66     1c66:	fb                   	sti
1c67     1c67:	fb                   	sti
1c68     1c68:	9c                   	pushf
1c69     1c69:	58                   	pop    %rax
1c6a     1c6a:	fb                   	sti
1c6b     1c6b:	9c                   	pushf
1c6c     1c6c:	58                   	pop    %rax
1c6d     1c6d:	fa                   	cli
1c6e     1c6e:	48 31 c0             	xor    %rax,%rax
1c71     1c71:	9c                   	pushf
1c72     1c72:	58                   	pop    %rax
1c73     1c73:	fa                   	cli
1c74     1c74:	9c                   	pushf
1c75     1c75:	58                   	pop    %rax
1c76     1c76:	fa                   	cli
1c77     1c77:	fb                   	sti
1c78     1c78:	fb                   	sti
1c79     1c79:	9c                   	pushf
1c7a     1c7a:	58                   	pop    %rax
1c7b     1c7b:	fa                   	cli
1c7c     1c7c:	9c                   	pushf
1c7d     1c7d:	58                   	pop    %rax
1c7e     1c7e:	fa                   	cli
1c7f     1c7f:	9c                   	pushf
1c80     1c80:	58                   	pop    %rax
1c81     1c81:	fb                   	sti
1c82     1c82:	9c                   	pushf
1c83     1c83:	58                   	pop    %rax
1c84     1c84:	fb                   	sti
1c85     1c85:	9c                   	pushf
1c86     1c86:	58                   	pop    %rax
1c87     1c87:	fa                   	cli
1c88     1c88:	9c                   	pushf
1c89     1c89:	58                   	pop    %rax
1c8a     1c8a:	fb                   	sti
1c8b     1c8b:	9c                   	pushf
1c8c     1c8c:	58                   	pop    %rax
1c8d     1c8d:	fb                   	sti
1c8e     1c8e:	fb                   	sti
1c8f     1c8f:	fb                   	sti
1c90     1c90:	9c                   	pushf
1c91     1c91:	58                   	pop    %rax
1c92     1c92:	fa                   	cli
1c93     1c93:	fb                   	sti
1c94     1c94:	9c                   	pushf
1c95     1c95:	58                   	pop    %rax
1c96     1c96:	fa                   	cli
1c97     1c97:	9c                   	pushf
1c98     1c98:	58                   	pop    %rax
1c99     1c99:	fb                   	sti
1c9a     1c9a:	fb                   	sti
1c9b     1c9b:	fa                   	cli
1c9c     1c9c:	fb                   	sti
1c9d     1c9d:	fb                   	sti
1c9e     1c9e:	9c                   	pushf
1c9f     1c9f:	58                   	pop    %rax
1ca0     1ca0:	fb                   	sti
1ca1     1ca1:	9c                   	pushf
1ca2     1ca2:	58                   	pop    %rax
1ca3     1ca3:	fa                   	cli
1ca4     1ca4:	e9 00 00 00 00       	jmp    1ca9 <.altinstr_replacement+0x1ca9>	1ca5: R_X86_64_PC32	.text+0x618f9c
1ca9     1ca9:	e9 00 00 00 00       	jmp    1cae <.altinstr_replacement+0x1cae>	1caa: R_X86_64_PC32	.text+0x618fab
1cae     1cae:	9c                   	pushf
1caf     1caf:	58                   	pop    %rax
1cb0     1cb0:	fa                   	cli
1cb1     1cb1:	fb                   	sti
1cb2     1cb2:	9c                   	pushf
1cb3     1cb3:	58                   	pop    %rax
1cb4     1cb4:	fa                   	cli
1cb5     1cb5:	9c                   	pushf
1cb6     1cb6:	58                   	pop    %rax
1cb7     1cb7:	fa                   	cli
1cb8     1cb8:	9c                   	pushf
1cb9     1cb9:	58                   	pop    %rax
1cba     1cba:	fb                   	sti
1cbb     1cbb:	9c                   	pushf
1cbc     1cbc:	58                   	pop    %rax
1cbd     1cbd:	fa                   	cli
1cbe     1cbe:	9c                   	pushf
1cbf     1cbf:	58                   	pop    %rax
1cc0     1cc0:	fb                   	sti
1cc1     1cc1:	9c                   	pushf
1cc2     1cc2:	58                   	pop    %rax
1cc3     1cc3:	fa                   	cli
1cc4     1cc4:	9c                   	pushf
1cc5     1cc5:	58                   	pop    %rax
1cc6     1cc6:	fa                   	cli
1cc7     1cc7:	fb                   	sti
1cc8     1cc8:	9c                   	pushf
1cc9     1cc9:	58                   	pop    %rax
1cca     1cca:	fa                   	cli
1ccb     1ccb:	9c                   	pushf
1ccc     1ccc:	58                   	pop    %rax
1ccd     1ccd:	fb                   	sti
1cce     1cce:	9c                   	pushf
1ccf     1ccf:	58                   	pop    %rax
1cd0     1cd0:	fa                   	cli
1cd1     1cd1:	9c                   	pushf
1cd2     1cd2:	58                   	pop    %rax
1cd3     1cd3:	fb                   	sti
1cd4     1cd4:	9c                   	pushf
1cd5     1cd5:	58                   	pop    %rax
1cd6     1cd6:	fa                   	cli
1cd7     1cd7:	fb                   	sti
1cd8     1cd8:	fb                   	sti
1cd9     1cd9:	fb                   	sti
1cda     1cda:	fb                   	sti
1cdb     1cdb:	48 31 c0             	xor    %rax,%rax
1cde     1cde:	48 31 c0             	xor    %rax,%rax
1ce1     1ce1:	48 31 c0             	xor    %rax,%rax
1ce4     1ce4:	48 31 c0             	xor    %rax,%rax
1ce7     1ce7:	9c                   	pushf
1ce8     1ce8:	58                   	pop    %rax
1ce9     1ce9:	9c                   	pushf
1cea     1cea:	58                   	pop    %rax
1ceb     1ceb:	9c                   	pushf
1cec     1cec:	58                   	pop    %rax
1ced     1ced:	9c                   	pushf
1cee     1cee:	58                   	pop    %rax
1cef     1cef:	9c                   	pushf
1cf0     1cf0:	58                   	pop    %rax
1cf1     1cf1:	9c                   	pushf
1cf2     1cf2:	58                   	pop    %rax
1cf3     1cf3:	9c                   	pushf
1cf4     1cf4:	58                   	pop    %rax
1cf5     1cf5:	9c                   	pushf
1cf6     1cf6:	58                   	pop    %rax
1cf7     1cf7:	c6 07 00             	movb   $0x0,(%rdi)
1cfa     1cfa:	9c                   	pushf
1cfb     1cfb:	58                   	pop    %rax
1cfc     1cfc:	9c                   	pushf
1cfd     1cfd:	58                   	pop    %rax
1cfe     1cfe:	fa                   	cli
1cff     1cff:	9c                   	pushf
1d00     1d00:	58                   	pop    %rax
1d01     1d01:	fb                   	sti
1d02     1d02:	9c                   	pushf
1d03     1d03:	58                   	pop    %rax
1d04     1d04:	9c                   	pushf
1d05     1d05:	58                   	pop    %rax
1d06     1d06:	9c                   	pushf
1d07     1d07:	58                   	pop    %rax
1d08     1d08:	9c                   	pushf
1d09     1d09:	58                   	pop    %rax
1d0a     1d0a:	fa                   	cli
1d0b     1d0b:	9c                   	pushf
1d0c     1d0c:	58                   	pop    %rax
1d0d     1d0d:	fb                   	sti
1d0e     1d0e:	9c                   	pushf
1d0f     1d0f:	58                   	pop    %rax
1d10     1d10:	fa                   	cli
1d11     1d11:	9c                   	pushf
1d12     1d12:	58                   	pop    %rax
1d13     1d13:	fb                   	sti
1d14     1d14:	9c                   	pushf
1d15     1d15:	58                   	pop    %rax
1d16     1d16:	fa                   	cli
1d17     1d17:	9c                   	pushf
1d18     1d18:	58                   	pop    %rax
1d19     1d19:	fb                   	sti
1d1a     1d1a:	9c                   	pushf
1d1b     1d1b:	58                   	pop    %rax
1d1c     1d1c:	fa                   	cli
1d1d     1d1d:	9c                   	pushf
1d1e     1d1e:	58                   	pop    %rax
1d1f     1d1f:	fb                   	sti
1d20     1d20:	9c                   	pushf
1d21     1d21:	58                   	pop    %rax
1d22     1d22:	fa                   	cli
1d23     1d23:	9c                   	pushf
1d24     1d24:	58                   	pop    %rax
1d25     1d25:	fb                   	sti
1d26     1d26:	9c                   	pushf
1d27     1d27:	58                   	pop    %rax
1d28     1d28:	fa                   	cli
1d29     1d29:	9c                   	pushf
1d2a     1d2a:	58                   	pop    %rax
1d2b     1d2b:	fb                   	sti
1d2c     1d2c:	9c                   	pushf
1d2d     1d2d:	58                   	pop    %rax
1d2e     1d2e:	fa                   	cli
1d2f     1d2f:	9c                   	pushf
1d30     1d30:	58                   	pop    %rax
1d31     1d31:	fb                   	sti
1d32     1d32:	9c                   	pushf
1d33     1d33:	58                   	pop    %rax
1d34     1d34:	9c                   	pushf
1d35     1d35:	58                   	pop    %rax
1d36     1d36:	fa                   	cli
1d37     1d37:	9c                   	pushf
1d38     1d38:	58                   	pop    %rax
1d39     1d39:	fb                   	sti
1d3a     1d3a:	9c                   	pushf
1d3b     1d3b:	58                   	pop    %rax
1d3c     1d3c:	fa                   	cli
1d3d     1d3d:	9c                   	pushf
1d3e     1d3e:	58                   	pop    %rax
1d3f     1d3f:	fb                   	sti
1d40     1d40:	9c                   	pushf
1d41     1d41:	58                   	pop    %rax
1d42     1d42:	9c                   	pushf
1d43     1d43:	58                   	pop    %rax
1d44     1d44:	9c                   	pushf
1d45     1d45:	58                   	pop    %rax
1d46     1d46:	fa                   	cli
1d47     1d47:	9c                   	pushf
1d48     1d48:	58                   	pop    %rax
1d49     1d49:	fb                   	sti
1d4a     1d4a:	9c                   	pushf
1d4b     1d4b:	58                   	pop    %rax
1d4c     1d4c:	9c                   	pushf
1d4d     1d4d:	58                   	pop    %rax
1d4e     1d4e:	fa                   	cli
1d4f     1d4f:	9c                   	pushf
1d50     1d50:	58                   	pop    %rax
1d51     1d51:	fb                   	sti
1d52     1d52:	9c                   	pushf
1d53     1d53:	58                   	pop    %rax
1d54     1d54:	fa                   	cli
1d55     1d55:	9c                   	pushf
1d56     1d56:	58                   	pop    %rax
1d57     1d57:	fb                   	sti
1d58     1d58:	9c                   	pushf
1d59     1d59:	58                   	pop    %rax
1d5a     1d5a:	9c                   	pushf
1d5b     1d5b:	58                   	pop    %rax
1d5c     1d5c:	9c                   	pushf
1d5d     1d5d:	58                   	pop    %rax
1d5e     1d5e:	fa                   	cli
1d5f     1d5f:	9c                   	pushf
1d60     1d60:	58                   	pop    %rax
1d61     1d61:	fb                   	sti
1d62     1d62:	9c                   	pushf
1d63     1d63:	58                   	pop    %rax
1d64     1d64:	fa                   	cli
1d65     1d65:	9c                   	pushf
1d66     1d66:	58                   	pop    %rax
1d67     1d67:	fb                   	sti
1d68     1d68:	9c                   	pushf
1d69     1d69:	58                   	pop    %rax
1d6a     1d6a:	fa                   	cli
1d6b     1d6b:	9c                   	pushf
1d6c     1d6c:	58                   	pop    %rax
1d6d     1d6d:	fb                   	sti
1d6e     1d6e:	9c                   	pushf
1d6f     1d6f:	58                   	pop    %rax
1d70     1d70:	fa                   	cli
1d71     1d71:	9c                   	pushf
1d72     1d72:	58                   	pop    %rax
1d73     1d73:	fb                   	sti
1d74     1d74:	9c                   	pushf
1d75     1d75:	58                   	pop    %rax
1d76     1d76:	fa                   	cli
1d77     1d77:	9c                   	pushf
1d78     1d78:	58                   	pop    %rax
1d79     1d79:	fb                   	sti
1d7a     1d7a:	9c                   	pushf
1d7b     1d7b:	58                   	pop    %rax
1d7c     1d7c:	fa                   	cli
1d7d     1d7d:	9c                   	pushf
1d7e     1d7e:	58                   	pop    %rax
1d7f     1d7f:	fb                   	sti
1d80     1d80:	9c                   	pushf
1d81     1d81:	58                   	pop    %rax
1d82     1d82:	fa                   	cli
1d83     1d83:	9c                   	pushf
1d84     1d84:	58                   	pop    %rax
1d85     1d85:	fb                   	sti
1d86     1d86:	9c                   	pushf
1d87     1d87:	58                   	pop    %rax
1d88     1d88:	fa                   	cli
1d89     1d89:	9c                   	pushf
1d8a     1d8a:	58                   	pop    %rax
1d8b     1d8b:	fb                   	sti
1d8c     1d8c:	9c                   	pushf
1d8d     1d8d:	58                   	pop    %rax
1d8e     1d8e:	fa                   	cli
1d8f     1d8f:	9c                   	pushf
1d90     1d90:	58                   	pop    %rax
1d91     1d91:	fb                   	sti
1d92     1d92:	9c                   	pushf
1d93     1d93:	58                   	pop    %rax
1d94     1d94:	fa                   	cli
1d95     1d95:	9c                   	pushf
1d96     1d96:	58                   	pop    %rax
1d97     1d97:	fb                   	sti
1d98     1d98:	9c                   	pushf
1d99     1d99:	58                   	pop    %rax
1d9a     1d9a:	9c                   	pushf
1d9b     1d9b:	58                   	pop    %rax
1d9c     1d9c:	9c                   	pushf
1d9d     1d9d:	58                   	pop    %rax
1d9e     1d9e:	9c                   	pushf
1d9f     1d9f:	58                   	pop    %rax
1da0     1da0:	9c                   	pushf
1da1     1da1:	58                   	pop    %rax
1da2     1da2:	9c                   	pushf
1da3     1da3:	58                   	pop    %rax
1da4     1da4:	9c                   	pushf
1da5     1da5:	58                   	pop    %rax
1da6     1da6:	fa                   	cli
1da7     1da7:	9c                   	pushf
1da8     1da8:	58                   	pop    %rax
1da9     1da9:	fb                   	sti
1daa     1daa:	9c                   	pushf
1dab     1dab:	58                   	pop    %rax
1dac     1dac:	fa                   	cli
1dad     1dad:	9c                   	pushf
1dae     1dae:	58                   	pop    %rax
1daf     1daf:	fa                   	cli
1db0     1db0:	9c                   	pushf
1db1     1db1:	58                   	pop    %rax
1db2     1db2:	fa                   	cli
1db3     1db3:	fb                   	sti
1db4     1db4:	9c                   	pushf
1db5     1db5:	58                   	pop    %rax
1db6     1db6:	fb                   	sti
1db7     1db7:	9c                   	pushf
1db8     1db8:	58                   	pop    %rax
1db9     1db9:	fa                   	cli
1dba     1dba:	9c                   	pushf
1dbb     1dbb:	58                   	pop    %rax
1dbc     1dbc:	fa                   	cli
1dbd     1dbd:	9c                   	pushf
1dbe     1dbe:	58                   	pop    %rax
1dbf     1dbf:	fa                   	cli
1dc0     1dc0:	9c                   	pushf
1dc1     1dc1:	58                   	pop    %rax
1dc2     1dc2:	fa                   	cli
1dc3     1dc3:	fb                   	sti
1dc4     1dc4:	9c                   	pushf
1dc5     1dc5:	58                   	pop    %rax
1dc6     1dc6:	fb                   	sti
1dc7     1dc7:	fb                   	sti
1dc8     1dc8:	9c                   	pushf
1dc9     1dc9:	58                   	pop    %rax
1dca     1dca:	fb                   	sti
1dcb     1dcb:	48 31 c0             	xor    %rax,%rax
1dce     1dce:	41 0f 0d 0e          	prefetchw (%r14)
1dd2     1dd2:	41 0f 0d 4d 00       	prefetchw 0x0(%r13)
1dd7     1dd7:	48 31 c0             	xor    %rax,%rax
1dda     1dda:	c6 07 00             	movb   $0x0,(%rdi)
1ddd     1ddd:	c6 07 00             	movb   $0x0,(%rdi)
1de0     1de0:	c6 07 00             	movb   $0x0,(%rdi)
1de3     1de3:	9c                   	pushf
1de4     1de4:	58                   	pop    %rax
1de5     1de5:	fa                   	cli
1de6     1de6:	fb                   	sti
1de7     1de7:	9c                   	pushf
1de8     1de8:	58                   	pop    %rax
1de9     1de9:	9c                   	pushf
1dea     1dea:	58                   	pop    %rax
1deb     1deb:	9c                   	pushf
1dec     1dec:	58                   	pop    %rax
1ded     1ded:	fa                   	cli
1dee     1dee:	fb                   	sti
1def     1def:	9c                   	pushf
1df0     1df0:	58                   	pop    %rax
1df1     1df1:	fa                   	cli
1df2     1df2:	fb                   	sti
1df3     1df3:	9c                   	pushf
1df4     1df4:	58                   	pop    %rax
1df5     1df5:	fa                   	cli
1df6     1df6:	fb                   	sti
1df7     1df7:	e9 00 00 00 00       	jmp    1dfc <.altinstr_replacement+0x1dfc>	1df8: R_X86_64_PC32	.text+0x66f750
1dfc     1dfc:	e9 00 00 00 00       	jmp    1e01 <.altinstr_replacement+0x1e01>	1dfd: R_X86_64_PC32	.text+0x66f75b
1e01     1e01:	e9 00 00 00 00       	jmp    1e06 <.altinstr_replacement+0x1e06>	1e02: R_X86_64_PC32	.text+0x671170
1e06     1e06:	e9 00 00 00 00       	jmp    1e0b <.altinstr_replacement+0x1e0b>	1e07: R_X86_64_PC32	.text+0x67117b
1e0b     1e0b:	e9 00 00 00 00       	jmp    1e10 <.altinstr_replacement+0x1e10>	1e0c: R_X86_64_PC32	.text+0x67152e
1e10     1e10:	e9 00 00 00 00       	jmp    1e15 <.altinstr_replacement+0x1e15>	1e11: R_X86_64_PC32	.text+0x671411
1e15     1e15:	e9 00 00 00 00       	jmp    1e1a <.altinstr_replacement+0x1e1a>	1e16: R_X86_64_PC32	.text+0x6729d8
1e1a     1e1a:	e9 00 00 00 00       	jmp    1e1f <.altinstr_replacement+0x1e1f>	1e1b: R_X86_64_PC32	.text+0x6729fa
1e1f     1e1f:	e8 00 00 00 00       	call   1e24 <.altinstr_replacement+0x1e24>	1e20: R_X86_64_PLT32	clear_page_rep-0x4
1e24     1e24:	e8 00 00 00 00       	call   1e29 <.altinstr_replacement+0x1e29>	1e25: R_X86_64_PLT32	clear_page_erms-0x4
1e29     1e29:	e9 00 00 00 00       	jmp    1e2e <.altinstr_replacement+0x1e2e>	1e2a: R_X86_64_PC32	.text+0x6730d1
1e2e     1e2e:	e9 00 00 00 00       	jmp    1e33 <.altinstr_replacement+0x1e33>	1e2f: R_X86_64_PC32	.text+0x673101
1e33     1e33:	e8 00 00 00 00       	call   1e38 <.altinstr_replacement+0x1e38>	1e34: R_X86_64_PLT32	clear_page_rep-0x4
1e38     1e38:	e8 00 00 00 00       	call   1e3d <.altinstr_replacement+0x1e3d>	1e39: R_X86_64_PLT32	clear_page_erms-0x4
1e3d     1e3d:	e9 00 00 00 00       	jmp    1e42 <.altinstr_replacement+0x1e42>	1e3e: R_X86_64_PC32	.text+0x674f5a
1e42     1e42:	e9 00 00 00 00       	jmp    1e47 <.altinstr_replacement+0x1e47>	1e43: R_X86_64_PC32	.text+0x6753ce
1e47     1e47:	e9 00 00 00 00       	jmp    1e4c <.altinstr_replacement+0x1e4c>	1e48: R_X86_64_PC32	.text+0x6752f7
1e4c     1e4c:	e9 00 00 00 00       	jmp    1e51 <.altinstr_replacement+0x1e51>	1e4d: R_X86_64_PC32	.text+0x6756f5
1e51     1e51:	e8 00 00 00 00       	call   1e56 <.altinstr_replacement+0x1e56>	1e52: R_X86_64_PLT32	clear_page_rep-0x4
1e56     1e56:	e8 00 00 00 00       	call   1e5b <.altinstr_replacement+0x1e5b>	1e57: R_X86_64_PLT32	clear_page_erms-0x4
1e5b     1e5b:	e8 00 00 00 00       	call   1e60 <.altinstr_replacement+0x1e60>	1e5c: R_X86_64_PLT32	clear_page_rep-0x4
1e60     1e60:	e8 00 00 00 00       	call   1e65 <.altinstr_replacement+0x1e65>	1e61: R_X86_64_PLT32	clear_page_erms-0x4
1e65     1e65:	9c                   	pushf
1e66     1e66:	58                   	pop    %rax
1e67     1e67:	fa                   	cli
1e68     1e68:	9c                   	pushf
1e69     1e69:	58                   	pop    %rax
1e6a     1e6a:	fb                   	sti
1e6b     1e6b:	9c                   	pushf
1e6c     1e6c:	58                   	pop    %rax
1e6d     1e6d:	fa                   	cli
1e6e     1e6e:	9c                   	pushf
1e6f     1e6f:	58                   	pop    %rax
1e70     1e70:	fb                   	sti
1e71     1e71:	9c                   	pushf
1e72     1e72:	58                   	pop    %rax
1e73     1e73:	fa                   	cli
1e74     1e74:	9c                   	pushf
1e75     1e75:	58                   	pop    %rax
1e76     1e76:	fb                   	sti
1e77     1e77:	9c                   	pushf
1e78     1e78:	58                   	pop    %rax
1e79     1e79:	fa                   	cli
1e7a     1e7a:	9c                   	pushf
1e7b     1e7b:	58                   	pop    %rax
1e7c     1e7c:	fb                   	sti
1e7d     1e7d:	9c                   	pushf
1e7e     1e7e:	58                   	pop    %rax
1e7f     1e7f:	fb                   	sti
1e80     1e80:	9c                   	pushf
1e81     1e81:	58                   	pop    %rax
1e82     1e82:	fa                   	cli
1e83     1e83:	9c                   	pushf
1e84     1e84:	58                   	pop    %rax
1e85     1e85:	fb                   	sti
1e86     1e86:	9c                   	pushf
1e87     1e87:	58                   	pop    %rax
1e88     1e88:	fa                   	cli
1e89     1e89:	9c                   	pushf
1e8a     1e8a:	58                   	pop    %rax
1e8b     1e8b:	fb                   	sti
1e8c     1e8c:	9c                   	pushf
1e8d     1e8d:	58                   	pop    %rax
1e8e     1e8e:	fb                   	sti
1e8f     1e8f:	9c                   	pushf
1e90     1e90:	58                   	pop    %rax
1e91     1e91:	fb                   	sti
1e92     1e92:	9c                   	pushf
1e93     1e93:	58                   	pop    %rax
1e94     1e94:	fa                   	cli
1e95     1e95:	9c                   	pushf
1e96     1e96:	58                   	pop    %rax
1e97     1e97:	fb                   	sti
1e98     1e98:	9c                   	pushf
1e99     1e99:	58                   	pop    %rax
1e9a     1e9a:	fa                   	cli
1e9b     1e9b:	9c                   	pushf
1e9c     1e9c:	58                   	pop    %rax
1e9d     1e9d:	fb                   	sti
1e9e     1e9e:	9c                   	pushf
1e9f     1e9f:	58                   	pop    %rax
1ea0     1ea0:	fa                   	cli
1ea1     1ea1:	9c                   	pushf
1ea2     1ea2:	58                   	pop    %rax
1ea3     1ea3:	fb                   	sti
1ea4     1ea4:	9c                   	pushf
1ea5     1ea5:	58                   	pop    %rax
1ea6     1ea6:	fa                   	cli
1ea7     1ea7:	9c                   	pushf
1ea8     1ea8:	58                   	pop    %rax
1ea9     1ea9:	fb                   	sti
1eaa     1eaa:	9c                   	pushf
1eab     1eab:	58                   	pop    %rax
1eac     1eac:	9c                   	pushf
1ead     1ead:	58                   	pop    %rax
1eae     1eae:	fa                   	cli
1eaf     1eaf:	9c                   	pushf
1eb0     1eb0:	58                   	pop    %rax
1eb1     1eb1:	fa                   	cli
1eb2     1eb2:	fb                   	sti
1eb3     1eb3:	9c                   	pushf
1eb4     1eb4:	58                   	pop    %rax
1eb5     1eb5:	9c                   	pushf
1eb6     1eb6:	58                   	pop    %rax
1eb7     1eb7:	9c                   	pushf
1eb8     1eb8:	58                   	pop    %rax
1eb9     1eb9:	fa                   	cli
1eba     1eba:	9c                   	pushf
1ebb     1ebb:	58                   	pop    %rax
1ebc     1ebc:	fb                   	sti
1ebd     1ebd:	fb                   	sti
1ebe     1ebe:	9c                   	pushf
1ebf     1ebf:	58                   	pop    %rax
1ec0     1ec0:	fa                   	cli
1ec1     1ec1:	9c                   	pushf
1ec2     1ec2:	58                   	pop    %rax
1ec3     1ec3:	9c                   	pushf
1ec4     1ec4:	58                   	pop    %rax
1ec5     1ec5:	fa                   	cli
1ec6     1ec6:	9c                   	pushf
1ec7     1ec7:	58                   	pop    %rax
1ec8     1ec8:	9c                   	pushf
1ec9     1ec9:	58                   	pop    %rax
1eca     1eca:	9c                   	pushf
1ecb     1ecb:	58                   	pop    %rax
1ecc     1ecc:	fa                   	cli
1ecd     1ecd:	9c                   	pushf
1ece     1ece:	58                   	pop    %rax
1ecf     1ecf:	fa                   	cli
1ed0     1ed0:	9c                   	pushf
1ed1     1ed1:	58                   	pop    %rax
1ed2     1ed2:	fb                   	sti
1ed3     1ed3:	9c                   	pushf
1ed4     1ed4:	58                   	pop    %rax
1ed5     1ed5:	fa                   	cli
1ed6     1ed6:	9c                   	pushf
1ed7     1ed7:	58                   	pop    %rax
1ed8     1ed8:	fb                   	sti
1ed9     1ed9:	9c                   	pushf
1eda     1eda:	58                   	pop    %rax
1edb     1edb:	fa                   	cli
1edc     1edc:	fb                   	sti
1edd     1edd:	9c                   	pushf
1ede     1ede:	58                   	pop    %rax
1edf     1edf:	fa                   	cli
1ee0     1ee0:	fb                   	sti
1ee1     1ee1:	9c                   	pushf
1ee2     1ee2:	58                   	pop    %rax
1ee3     1ee3:	fa                   	cli
1ee4     1ee4:	fb                   	sti
1ee5     1ee5:	9c                   	pushf
1ee6     1ee6:	58                   	pop    %rax
1ee7     1ee7:	fa                   	cli
1ee8     1ee8:	9c                   	pushf
1ee9     1ee9:	58                   	pop    %rax
1eea     1eea:	fb                   	sti
1eeb     1eeb:	9c                   	pushf
1eec     1eec:	58                   	pop    %rax
1eed     1eed:	fa                   	cli
1eee     1eee:	9c                   	pushf
1eef     1eef:	58                   	pop    %rax
1ef0     1ef0:	fb                   	sti
1ef1     1ef1:	9c                   	pushf
1ef2     1ef2:	58                   	pop    %rax
1ef3     1ef3:	fa                   	cli
1ef4     1ef4:	9c                   	pushf
1ef5     1ef5:	58                   	pop    %rax
1ef6     1ef6:	fb                   	sti
1ef7     1ef7:	9c                   	pushf
1ef8     1ef8:	58                   	pop    %rax
1ef9     1ef9:	fa                   	cli
1efa     1efa:	9c                   	pushf
1efb     1efb:	58                   	pop    %rax
1efc     1efc:	fa                   	cli
1efd     1efd:	9c                   	pushf
1efe     1efe:	58                   	pop    %rax
1eff     1eff:	fb                   	sti
1f00     1f00:	9c                   	pushf
1f01     1f01:	58                   	pop    %rax
1f02     1f02:	9c                   	pushf
1f03     1f03:	58                   	pop    %rax
1f04     1f04:	fb                   	sti
1f05     1f05:	9c                   	pushf
1f06     1f06:	58                   	pop    %rax
1f07     1f07:	fa                   	cli
1f08     1f08:	9c                   	pushf
1f09     1f09:	58                   	pop    %rax
1f0a     1f0a:	fa                   	cli
1f0b     1f0b:	9c                   	pushf
1f0c     1f0c:	58                   	pop    %rax
1f0d     1f0d:	9c                   	pushf
1f0e     1f0e:	58                   	pop    %rax
1f0f     1f0f:	fa                   	cli
1f10     1f10:	9c                   	pushf
1f11     1f11:	58                   	pop    %rax
1f12     1f12:	9c                   	pushf
1f13     1f13:	58                   	pop    %rax
1f14     1f14:	fb                   	sti
1f15     1f15:	9c                   	pushf
1f16     1f16:	58                   	pop    %rax
1f17     1f17:	9c                   	pushf
1f18     1f18:	58                   	pop    %rax
1f19     1f19:	fa                   	cli
1f1a     1f1a:	9c                   	pushf
1f1b     1f1b:	58                   	pop    %rax
1f1c     1f1c:	fa                   	cli
1f1d     1f1d:	9c                   	pushf
1f1e     1f1e:	58                   	pop    %rax
1f1f     1f1f:	fb                   	sti
1f20     1f20:	9c                   	pushf
1f21     1f21:	58                   	pop    %rax
1f22     1f22:	fa                   	cli
1f23     1f23:	9c                   	pushf
1f24     1f24:	58                   	pop    %rax
1f25     1f25:	fa                   	cli
1f26     1f26:	9c                   	pushf
1f27     1f27:	58                   	pop    %rax
1f28     1f28:	fb                   	sti
1f29     1f29:	9c                   	pushf
1f2a     1f2a:	58                   	pop    %rax
1f2b     1f2b:	fa                   	cli
1f2c     1f2c:	9c                   	pushf
1f2d     1f2d:	58                   	pop    %rax
1f2e     1f2e:	fa                   	cli
1f2f     1f2f:	9c                   	pushf
1f30     1f30:	58                   	pop    %rax
1f31     1f31:	fa                   	cli
1f32     1f32:	9c                   	pushf
1f33     1f33:	58                   	pop    %rax
1f34     1f34:	fa                   	cli
1f35     1f35:	9c                   	pushf
1f36     1f36:	58                   	pop    %rax
1f37     1f37:	fa                   	cli
1f38     1f38:	9c                   	pushf
1f39     1f39:	58                   	pop    %rax
1f3a     1f3a:	fa                   	cli
1f3b     1f3b:	9c                   	pushf
1f3c     1f3c:	58                   	pop    %rax
1f3d     1f3d:	fb                   	sti
1f3e     1f3e:	9c                   	pushf
1f3f     1f3f:	58                   	pop    %rax
1f40     1f40:	fa                   	cli
1f41     1f41:	9c                   	pushf
1f42     1f42:	58                   	pop    %rax
1f43     1f43:	fb                   	sti
1f44     1f44:	9c                   	pushf
1f45     1f45:	58                   	pop    %rax
1f46     1f46:	fa                   	cli
1f47     1f47:	9c                   	pushf
1f48     1f48:	58                   	pop    %rax
1f49     1f49:	fb                   	sti
1f4a     1f4a:	9c                   	pushf
1f4b     1f4b:	58                   	pop    %rax
1f4c     1f4c:	fa                   	cli
1f4d     1f4d:	c6 07 00             	movb   $0x0,(%rdi)
1f50     1f50:	9c                   	pushf
1f51     1f51:	58                   	pop    %rax
1f52     1f52:	fb                   	sti
1f53     1f53:	c6 07 00             	movb   $0x0,(%rdi)
1f56     1f56:	9c                   	pushf
1f57     1f57:	58                   	pop    %rax
1f58     1f58:	9c                   	pushf
1f59     1f59:	58                   	pop    %rax
1f5a     1f5a:	fa                   	cli
1f5b     1f5b:	9c                   	pushf
1f5c     1f5c:	58                   	pop    %rax
1f5d     1f5d:	fb                   	sti
1f5e     1f5e:	9c                   	pushf
1f5f     1f5f:	58                   	pop    %rax
1f60     1f60:	fa                   	cli
1f61     1f61:	c6 07 00             	movb   $0x0,(%rdi)
1f64     1f64:	9c                   	pushf
1f65     1f65:	58                   	pop    %rax
1f66     1f66:	fa                   	cli
1f67     1f67:	9c                   	pushf
1f68     1f68:	58                   	pop    %rax
1f69     1f69:	fa                   	cli
1f6a     1f6a:	9c                   	pushf
1f6b     1f6b:	58                   	pop    %rax
1f6c     1f6c:	fb                   	sti
1f6d     1f6d:	9c                   	pushf
1f6e     1f6e:	58                   	pop    %rax
1f6f     1f6f:	fa                   	cli
1f70     1f70:	9c                   	pushf
1f71     1f71:	58                   	pop    %rax
1f72     1f72:	fa                   	cli
1f73     1f73:	9c                   	pushf
1f74     1f74:	58                   	pop    %rax
1f75     1f75:	fb                   	sti
1f76     1f76:	9c                   	pushf
1f77     1f77:	58                   	pop    %rax
1f78     1f78:	fa                   	cli
1f79     1f79:	9c                   	pushf
1f7a     1f7a:	58                   	pop    %rax
1f7b     1f7b:	fa                   	cli
1f7c     1f7c:	c6 07 00             	movb   $0x0,(%rdi)
1f7f     1f7f:	9c                   	pushf
1f80     1f80:	58                   	pop    %rax
1f81     1f81:	fb                   	sti
1f82     1f82:	9c                   	pushf
1f83     1f83:	58                   	pop    %rax
1f84     1f84:	fa                   	cli
1f85     1f85:	9c                   	pushf
1f86     1f86:	58                   	pop    %rax
1f87     1f87:	fa                   	cli
1f88     1f88:	fb                   	sti
1f89     1f89:	9c                   	pushf
1f8a     1f8a:	58                   	pop    %rax
1f8b     1f8b:	9c                   	pushf
1f8c     1f8c:	58                   	pop    %rax
1f8d     1f8d:	fa                   	cli
1f8e     1f8e:	9c                   	pushf
1f8f     1f8f:	58                   	pop    %rax
1f90     1f90:	fb                   	sti
1f91     1f91:	e9 00 00 00 00       	jmp    1f96 <.altinstr_replacement+0x1f96>	1f92: R_X86_64_PC32	.noinstr.text+0xcc64
1f96     1f96:	e9 00 00 00 00       	jmp    1f9b <.altinstr_replacement+0x1f9b>	1f97: R_X86_64_PC32	.noinstr.text+0xcc6b
1f9b     1f9b:	e9 00 00 00 00       	jmp    1fa0 <.altinstr_replacement+0x1fa0>	1f9c: R_X86_64_PC32	.noinstr.text+0xcdae
1fa0     1fa0:	fb                   	sti
1fa1     1fa1:	e9 00 00 00 00       	jmp    1fa6 <.altinstr_replacement+0x1fa6>	1fa2: R_X86_64_PC32	.noinstr.text+0xcdb8
1fa6     1fa6:	e9 00 00 00 00       	jmp    1fab <.altinstr_replacement+0x1fab>	1fa7: R_X86_64_PC32	.noinstr.text+0xcf0b
1fab     1fab:	fb                   	sti
1fac     1fac:	e9 00 00 00 00       	jmp    1fb1 <.altinstr_replacement+0x1fb1>	1fad: R_X86_64_PC32	.noinstr.text+0xcf15
1fb1     1fb1:	fb                   	sti
1fb2     1fb2:	e9 00 00 00 00       	jmp    1fb7 <.altinstr_replacement+0x1fb7>	1fb3: R_X86_64_PC32	.noinstr.text+0xd164
1fb7     1fb7:	e9 00 00 00 00       	jmp    1fbc <.altinstr_replacement+0x1fbc>	1fb8: R_X86_64_PC32	.noinstr.text+0xd16b
1fbc     1fbc:	65 48 23 04 25 00 00 00 00 	and    %gs:0x0,%rax	1fc1: R_X86_64_32S	tlbstate_untag_mask
1fc5     1fc5:	e9 00 00 00 00       	jmp    1fca <.altinstr_replacement+0x1fca>	1fc6: R_X86_64_PC32	.text+0x751842
1fca     1fca:	9c                   	pushf
1fcb     1fcb:	58                   	pop    %rax
1fcc     1fcc:	fa                   	cli
1fcd     1fcd:	9c                   	pushf
1fce     1fce:	58                   	pop    %rax
1fcf     1fcf:	fb                   	sti
1fd0     1fd0:	9c                   	pushf
1fd1     1fd1:	58                   	pop    %rax
1fd2     1fd2:	fa                   	cli
1fd3     1fd3:	9c                   	pushf
1fd4     1fd4:	58                   	pop    %rax
1fd5     1fd5:	fb                   	sti
1fd6     1fd6:	9c                   	pushf
1fd7     1fd7:	58                   	pop    %rax
1fd8     1fd8:	fa                   	cli
1fd9     1fd9:	fb                   	sti
1fda     1fda:	9c                   	pushf
1fdb     1fdb:	58                   	pop    %rax
1fdc     1fdc:	fa                   	cli
1fdd     1fdd:	9c                   	pushf
1fde     1fde:	58                   	pop    %rax
1fdf     1fdf:	fb                   	sti
1fe0     1fe0:	9c                   	pushf
1fe1     1fe1:	58                   	pop    %rax
1fe2     1fe2:	fa                   	cli
1fe3     1fe3:	fb                   	sti
1fe4     1fe4:	9c                   	pushf
1fe5     1fe5:	58                   	pop    %rax
1fe6     1fe6:	fa                   	cli
1fe7     1fe7:	9c                   	pushf
1fe8     1fe8:	58                   	pop    %rax
1fe9     1fe9:	fb                   	sti
1fea     1fea:	9c                   	pushf
1feb     1feb:	58                   	pop    %rax
1fec     1fec:	fa                   	cli
1fed     1fed:	9c                   	pushf
1fee     1fee:	58                   	pop    %rax
1fef     1fef:	fb                   	sti
1ff0     1ff0:	9c                   	pushf
1ff1     1ff1:	58                   	pop    %rax
1ff2     1ff2:	fa                   	cli
1ff3     1ff3:	9c                   	pushf
1ff4     1ff4:	58                   	pop    %rax
1ff5     1ff5:	fb                   	sti
1ff6     1ff6:	9c                   	pushf
1ff7     1ff7:	58                   	pop    %rax
1ff8     1ff8:	fa                   	cli
1ff9     1ff9:	9c                   	pushf
1ffa     1ffa:	58                   	pop    %rax
1ffb     1ffb:	fb                   	sti
1ffc     1ffc:	9c                   	pushf
1ffd     1ffd:	58                   	pop    %rax
1ffe     1ffe:	fa                   	cli
1fff     1fff:	9c                   	pushf
2000     2000:	58                   	pop    %rax
2001     2001:	fb                   	sti
2002     2002:	9c                   	pushf
2003     2003:	58                   	pop    %rax
2004     2004:	fa                   	cli
2005     2005:	fb                   	sti
2006     2006:	9c                   	pushf
2007     2007:	58                   	pop    %rax
2008     2008:	fa                   	cli
2009     2009:	fb                   	sti
200a     200a:	0f 01 cb             	stac
200d     200d:	0f ae e8             	lfence
2010     2010:	0f 01 ca             	clac
2013     2013:	0f 01 cb             	stac
2016     2016:	0f ae e8             	lfence
2019     2019:	0f 01 ca             	clac
201c     201c:	0f 01 ca             	clac
201f     201f:	0f 01 ca             	clac
2022     2022:	9c                   	pushf
2023     2023:	58                   	pop    %rax
2024     2024:	fa                   	cli
2025     2025:	9c                   	pushf
2026     2026:	58                   	pop    %rax
2027     2027:	fb                   	sti
2028     2028:	9c                   	pushf
2029     2029:	58                   	pop    %rax
202a     202a:	fa                   	cli
202b     202b:	9c                   	pushf
202c     202c:	58                   	pop    %rax
202d     202d:	fb                   	sti
202e     202e:	9c                   	pushf
202f     202f:	58                   	pop    %rax
2030     2030:	9c                   	pushf
2031     2031:	58                   	pop    %rax
2032     2032:	fa                   	cli
2033     2033:	9c                   	pushf
2034     2034:	58                   	pop    %rax
2035     2035:	fb                   	sti
2036     2036:	e9 00 00 00 00       	jmp    203b <.altinstr_replacement+0x203b>	2037: R_X86_64_PC32	.init.text+0x103051
203b     203b:	e9 00 00 00 00       	jmp    2040 <.altinstr_replacement+0x2040>	203c: R_X86_64_PC32	.init.text+0x103690
2040     2040:	e9 00 00 00 00       	jmp    2045 <.altinstr_replacement+0x2045>	2041: R_X86_64_PC32	.text+0x7db03c
2045     2045:	e9 00 00 00 00       	jmp    204a <.altinstr_replacement+0x204a>	2046: R_X86_64_PC32	.text+0x7dc39a
204a     204a:	e8 00 00 00 00       	call   204f <.altinstr_replacement+0x204f>	204b: R_X86_64_PLT32	clear_page_rep-0x4
204f     204f:	e8 00 00 00 00       	call   2054 <.altinstr_replacement+0x2054>	2050: R_X86_64_PLT32	clear_page_erms-0x4
2054     2054:	e9 00 00 00 00       	jmp    2059 <.altinstr_replacement+0x2059>	2055: R_X86_64_PC32	.text+0x7dd047
2059     2059:	e9 00 00 00 00       	jmp    205e <.altinstr_replacement+0x205e>	205a: R_X86_64_PC32	.text+0x7ddd40
205e     205e:	fb                   	sti
205f     205f:	9c                   	pushf
2060     2060:	58                   	pop    %rax
2061     2061:	fa                   	cli
2062     2062:	0f 01 cb             	stac
2065     2065:	0f ae e8             	lfence
2068     2068:	0f 01 ca             	clac
206b     206b:	0f 01 ca             	clac
206e     206e:	0f 01 cb             	stac
2071     2071:	0f ae e8             	lfence
2074     2074:	0f 01 ca             	clac
2077     2077:	0f 01 ca             	clac
207a     207a:	9c                   	pushf
207b     207b:	58                   	pop    %rax
207c     207c:	fa                   	cli
207d     207d:	fb                   	sti
207e     207e:	9c                   	pushf
207f     207f:	58                   	pop    %rax
2080     2080:	9c                   	pushf
2081     2081:	58                   	pop    %rax
2082     2082:	fa                   	cli
2083     2083:	9c                   	pushf
2084     2084:	58                   	pop    %rax
2085     2085:	fb                   	sti
2086     2086:	9c                   	pushf
2087     2087:	58                   	pop    %rax
2088     2088:	fa                   	cli
2089     2089:	9c                   	pushf
208a     208a:	58                   	pop    %rax
208b     208b:	fb                   	sti
208c     208c:	9c                   	pushf
208d     208d:	58                   	pop    %rax
208e     208e:	fa                   	cli
208f     208f:	9c                   	pushf
2090     2090:	58                   	pop    %rax
2091     2091:	fb                   	sti
2092     2092:	9c                   	pushf
2093     2093:	58                   	pop    %rax
2094     2094:	fa                   	cli
2095     2095:	9c                   	pushf
2096     2096:	58                   	pop    %rax
2097     2097:	9c                   	pushf
2098     2098:	58                   	pop    %rax
2099     2099:	9c                   	pushf
209a     209a:	58                   	pop    %rax
209b     209b:	9c                   	pushf
209c     209c:	58                   	pop    %rax
209d     209d:	9c                   	pushf
209e     209e:	58                   	pop    %rax
209f     209f:	fa                   	cli
20a0     20a0:	9c                   	pushf
20a1     20a1:	58                   	pop    %rax
20a2     20a2:	fb                   	sti
20a3     20a3:	fb                   	sti
20a4     20a4:	9c                   	pushf
20a5     20a5:	58                   	pop    %rax
20a6     20a6:	fa                   	cli
20a7     20a7:	9c                   	pushf
20a8     20a8:	58                   	pop    %rax
20a9     20a9:	fb                   	sti
20aa     20aa:	9c                   	pushf
20ab     20ab:	58                   	pop    %rax
20ac     20ac:	fb                   	sti
20ad     20ad:	9c                   	pushf
20ae     20ae:	58                   	pop    %rax
20af     20af:	9c                   	pushf
20b0     20b0:	58                   	pop    %rax
20b1     20b1:	9c                   	pushf
20b2     20b2:	58                   	pop    %rax
20b3     20b3:	fa                   	cli
20b4     20b4:	9c                   	pushf
20b5     20b5:	58                   	pop    %rax
20b6     20b6:	fb                   	sti
20b7     20b7:	9c                   	pushf
20b8     20b8:	58                   	pop    %rax
20b9     20b9:	fa                   	cli
20ba     20ba:	9c                   	pushf
20bb     20bb:	58                   	pop    %rax
20bc     20bc:	fb                   	sti
20bd     20bd:	9c                   	pushf
20be     20be:	58                   	pop    %rax
20bf     20bf:	fb                   	sti
20c0     20c0:	9c                   	pushf
20c1     20c1:	58                   	pop    %rax
20c2     20c2:	fb                   	sti
20c3     20c3:	9c                   	pushf
20c4     20c4:	58                   	pop    %rax
20c5     20c5:	fa                   	cli
20c6     20c6:	9c                   	pushf
20c7     20c7:	58                   	pop    %rax
20c8     20c8:	fb                   	sti
20c9     20c9:	9c                   	pushf
20ca     20ca:	58                   	pop    %rax
20cb     20cb:	9c                   	pushf
20cc     20cc:	58                   	pop    %rax
20cd     20cd:	9c                   	pushf
20ce     20ce:	58                   	pop    %rax
20cf     20cf:	9c                   	pushf
20d0     20d0:	58                   	pop    %rax
20d1     20d1:	9c                   	pushf
20d2     20d2:	58                   	pop    %rax
20d3     20d3:	9c                   	pushf
20d4     20d4:	58                   	pop    %rax
20d5     20d5:	9c                   	pushf
20d6     20d6:	58                   	pop    %rax
20d7     20d7:	e9 00 00 00 00       	jmp    20dc <.altinstr_replacement+0x20dc>	20d8: R_X86_64_PC32	.text+0x88ff05
20dc     20dc:	e9 00 00 00 00       	jmp    20e1 <.altinstr_replacement+0x20e1>	20dd: R_X86_64_PC32	.text+0x88ff26
20e1     20e1:	9c                   	pushf
20e2     20e2:	58                   	pop    %rax
20e3     20e3:	fa                   	cli
20e4     20e4:	9c                   	pushf
20e5     20e5:	58                   	pop    %rax
20e6     20e6:	fb                   	sti
20e7     20e7:	9c                   	pushf
20e8     20e8:	58                   	pop    %rax
20e9     20e9:	fa                   	cli
20ea     20ea:	9c                   	pushf
20eb     20eb:	58                   	pop    %rax
20ec     20ec:	fb                   	sti
20ed     20ed:	9c                   	pushf
20ee     20ee:	58                   	pop    %rax
20ef     20ef:	fa                   	cli
20f0     20f0:	c6 07 00             	movb   $0x0,(%rdi)
20f3     20f3:	9c                   	pushf
20f4     20f4:	58                   	pop    %rax
20f5     20f5:	fb                   	sti
20f6     20f6:	9c                   	pushf
20f7     20f7:	58                   	pop    %rax
20f8     20f8:	fa                   	cli
20f9     20f9:	9c                   	pushf
20fa     20fa:	58                   	pop    %rax
20fb     20fb:	fb                   	sti
20fc     20fc:	9c                   	pushf
20fd     20fd:	58                   	pop    %rax
20fe     20fe:	fa                   	cli
20ff     20ff:	9c                   	pushf
2100     2100:	58                   	pop    %rax
2101     2101:	fb                   	sti
2102     2102:	9c                   	pushf
2103     2103:	58                   	pop    %rax
2104     2104:	fa                   	cli
2105     2105:	9c                   	pushf
2106     2106:	58                   	pop    %rax
2107     2107:	fb                   	sti
2108     2108:	9c                   	pushf
2109     2109:	58                   	pop    %rax
210a     210a:	9c                   	pushf
210b     210b:	58                   	pop    %rax
210c     210c:	fa                   	cli
210d     210d:	9c                   	pushf
210e     210e:	58                   	pop    %rax
210f     210f:	fb                   	sti
2110     2110:	9c                   	pushf
2111     2111:	58                   	pop    %rax
2112     2112:	fa                   	cli
2113     2113:	9c                   	pushf
2114     2114:	58                   	pop    %rax
2115     2115:	fb                   	sti
2116     2116:	9c                   	pushf
2117     2117:	58                   	pop    %rax
2118     2118:	fa                   	cli
2119     2119:	c6 07 00             	movb   $0x0,(%rdi)
211c     211c:	9c                   	pushf
211d     211d:	58                   	pop    %rax
211e     211e:	fb                   	sti
211f     211f:	9c                   	pushf
2120     2120:	58                   	pop    %rax
2121     2121:	fa                   	cli
2122     2122:	9c                   	pushf
2123     2123:	58                   	pop    %rax
2124     2124:	fb                   	sti
2125     2125:	c6 07 00             	movb   $0x0,(%rdi)
2128     2128:	c6 07 00             	movb   $0x0,(%rdi)
212b     212b:	9c                   	pushf
212c     212c:	58                   	pop    %rax
212d     212d:	fa                   	cli
212e     212e:	c6 07 00             	movb   $0x0,(%rdi)
2131     2131:	9c                   	pushf
2132     2132:	58                   	pop    %rax
2133     2133:	fb                   	sti
2134     2134:	9c                   	pushf
2135     2135:	58                   	pop    %rax
2136     2136:	fa                   	cli
2137     2137:	9c                   	pushf
2138     2138:	58                   	pop    %rax
2139     2139:	fb                   	sti
213a     213a:	9c                   	pushf
213b     213b:	58                   	pop    %rax
213c     213c:	fa                   	cli
213d     213d:	9c                   	pushf
213e     213e:	58                   	pop    %rax
213f     213f:	fb                   	sti
2140     2140:	9c                   	pushf
2141     2141:	58                   	pop    %rax
2142     2142:	fa                   	cli
2143     2143:	c6 07 00             	movb   $0x0,(%rdi)
2146     2146:	9c                   	pushf
2147     2147:	58                   	pop    %rax
2148     2148:	fb                   	sti
2149     2149:	c6 07 00             	movb   $0x0,(%rdi)
214c     214c:	c6 07 00             	movb   $0x0,(%rdi)
214f     214f:	c6 07 00             	movb   $0x0,(%rdi)
2152     2152:	c6 07 00             	movb   $0x0,(%rdi)
2155     2155:	9c                   	pushf
2156     2156:	58                   	pop    %rax
2157     2157:	fa                   	cli
2158     2158:	c6 07 00             	movb   $0x0,(%rdi)
215b     215b:	fb                   	sti
215c     215c:	9c                   	pushf
215d     215d:	58                   	pop    %rax
215e     215e:	fa                   	cli
215f     215f:	c6 07 00             	movb   $0x0,(%rdi)
2162     2162:	fb                   	sti
2163     2163:	9c                   	pushf
2164     2164:	58                   	pop    %rax
2165     2165:	fa                   	cli
2166     2166:	c6 07 00             	movb   $0x0,(%rdi)
2169     2169:	fb                   	sti
216a     216a:	9c                   	pushf
216b     216b:	58                   	pop    %rax
216c     216c:	fa                   	cli
216d     216d:	c6 07 00             	movb   $0x0,(%rdi)
2170     2170:	9c                   	pushf
2171     2171:	58                   	pop    %rax
2172     2172:	fb                   	sti
2173     2173:	c6 07 00             	movb   $0x0,(%rdi)
2176     2176:	c6 07 00             	movb   $0x0,(%rdi)
2179     2179:	c6 07 00             	movb   $0x0,(%rdi)
217c     217c:	9c                   	pushf
217d     217d:	58                   	pop    %rax
217e     217e:	c6 07 00             	movb   $0x0,(%rdi)
2181     2181:	c6 07 00             	movb   $0x0,(%rdi)
2184     2184:	9c                   	pushf
2185     2185:	58                   	pop    %rax
2186     2186:	9c                   	pushf
2187     2187:	58                   	pop    %rax
2188     2188:	9c                   	pushf
2189     2189:	58                   	pop    %rax
218a     218a:	9c                   	pushf
218b     218b:	58                   	pop    %rax
218c     218c:	0f 01 cb             	stac
218f     218f:	e8 00 00 00 00       	call   2194 <.altinstr_replacement+0x2194>	2190: R_X86_64_PLT32	rep_movs_alternative-0x4
2194     2194:	0f 01 ca             	clac
2197     2197:	9c                   	pushf
2198     2198:	58                   	pop    %rax
2199     2199:	0f 01 cb             	stac
219c     219c:	e8 00 00 00 00       	call   21a1 <.altinstr_replacement+0x21a1>	219d: R_X86_64_PLT32	rep_movs_alternative-0x4
21a1     21a1:	0f 01 ca             	clac
21a4     21a4:	9c                   	pushf
21a5     21a5:	58                   	pop    %rax
21a6     21a6:	9c                   	pushf
21a7     21a7:	58                   	pop    %rax
21a8     21a8:	9c                   	pushf
21a9     21a9:	58                   	pop    %rax
21aa     21aa:	fa                   	cli
21ab     21ab:	9c                   	pushf
21ac     21ac:	58                   	pop    %rax
21ad     21ad:	fb                   	sti
21ae     21ae:	9c                   	pushf
21af     21af:	58                   	pop    %rax
21b0     21b0:	c6 07 00             	movb   $0x0,(%rdi)
21b3     21b3:	9c                   	pushf
21b4     21b4:	58                   	pop    %rax
21b5     21b5:	fa                   	cli
21b6     21b6:	c6 07 00             	movb   $0x0,(%rdi)
21b9     21b9:	fb                   	sti
21ba     21ba:	9c                   	pushf
21bb     21bb:	58                   	pop    %rax
21bc     21bc:	fa                   	cli
21bd     21bd:	c6 07 00             	movb   $0x0,(%rdi)
21c0     21c0:	fb                   	sti
21c1     21c1:	9c                   	pushf
21c2     21c2:	58                   	pop    %rax
21c3     21c3:	fa                   	cli
21c4     21c4:	fb                   	sti
21c5     21c5:	9c                   	pushf
21c6     21c6:	58                   	pop    %rax
21c7     21c7:	fa                   	cli
21c8     21c8:	c6 07 00             	movb   $0x0,(%rdi)
21cb     21cb:	fb                   	sti
21cc     21cc:	9c                   	pushf
21cd     21cd:	58                   	pop    %rax
21ce     21ce:	fa                   	cli
21cf     21cf:	fb                   	sti
21d0     21d0:	9c                   	pushf
21d1     21d1:	58                   	pop    %rax
21d2     21d2:	fa                   	cli
21d3     21d3:	fb                   	sti
21d4     21d4:	9c                   	pushf
21d5     21d5:	58                   	pop    %rax
21d6     21d6:	fa                   	cli
21d7     21d7:	fb                   	sti
21d8     21d8:	9c                   	pushf
21d9     21d9:	58                   	pop    %rax
21da     21da:	fa                   	cli
21db     21db:	9c                   	pushf
21dc     21dc:	58                   	pop    %rax
21dd     21dd:	fb                   	sti
21de     21de:	9c                   	pushf
21df     21df:	58                   	pop    %rax
21e0     21e0:	fa                   	cli
21e1     21e1:	9c                   	pushf
21e2     21e2:	58                   	pop    %rax
21e3     21e3:	fb                   	sti
21e4     21e4:	9c                   	pushf
21e5     21e5:	58                   	pop    %rax
21e6     21e6:	9c                   	pushf
21e7     21e7:	58                   	pop    %rax
21e8     21e8:	fa                   	cli
21e9     21e9:	9c                   	pushf
21ea     21ea:	58                   	pop    %rax
21eb     21eb:	fb                   	sti
21ec     21ec:	9c                   	pushf
21ed     21ed:	58                   	pop    %rax
21ee     21ee:	9c                   	pushf
21ef     21ef:	58                   	pop    %rax
21f0     21f0:	9c                   	pushf
21f1     21f1:	58                   	pop    %rax
21f2     21f2:	9c                   	pushf
21f3     21f3:	58                   	pop    %rax
21f4     21f4:	9c                   	pushf
21f5     21f5:	58                   	pop    %rax
21f6     21f6:	9c                   	pushf
21f7     21f7:	58                   	pop    %rax
21f8     21f8:	9c                   	pushf
21f9     21f9:	58                   	pop    %rax
21fa     21fa:	9c                   	pushf
21fb     21fb:	58                   	pop    %rax
21fc     21fc:	9c                   	pushf
21fd     21fd:	58                   	pop    %rax
21fe     21fe:	9c                   	pushf
21ff     21ff:	58                   	pop    %rax
2200     2200:	9c                   	pushf
2201     2201:	58                   	pop    %rax
2202     2202:	9c                   	pushf
2203     2203:	58                   	pop    %rax
2204     2204:	9c                   	pushf
2205     2205:	58                   	pop    %rax
2206     2206:	9c                   	pushf
2207     2207:	58                   	pop    %rax
2208     2208:	9c                   	pushf
2209     2209:	58                   	pop    %rax
220a     220a:	9c                   	pushf
220b     220b:	58                   	pop    %rax
220c     220c:	9c                   	pushf
220d     220d:	58                   	pop    %rax
220e     220e:	9c                   	pushf
220f     220f:	58                   	pop    %rax
2210     2210:	c6 07 00             	movb   $0x0,(%rdi)
2213     2213:	9c                   	pushf
2214     2214:	58                   	pop    %rax
2215     2215:	9c                   	pushf
2216     2216:	58                   	pop    %rax
2217     2217:	fa                   	cli
2218     2218:	9c                   	pushf
2219     2219:	58                   	pop    %rax
221a     221a:	fb                   	sti
221b     221b:	9c                   	pushf
221c     221c:	58                   	pop    %rax
221d     221d:	fa                   	cli
221e     221e:	c6 07 00             	movb   $0x0,(%rdi)
2221     2221:	9c                   	pushf
2222     2222:	58                   	pop    %rax
2223     2223:	fb                   	sti
2224     2224:	9c                   	pushf
2225     2225:	58                   	pop    %rax
2226     2226:	fa                   	cli
2227     2227:	c6 07 00             	movb   $0x0,(%rdi)
222a     222a:	9c                   	pushf
222b     222b:	58                   	pop    %rax
222c     222c:	fb                   	sti
222d     222d:	9c                   	pushf
222e     222e:	58                   	pop    %rax
222f     222f:	9c                   	pushf
2230     2230:	58                   	pop    %rax
2231     2231:	fa                   	cli
2232     2232:	fb                   	sti
2233     2233:	9c                   	pushf
2234     2234:	58                   	pop    %rax
2235     2235:	9c                   	pushf
2236     2236:	58                   	pop    %rax
2237     2237:	9c                   	pushf
2238     2238:	58                   	pop    %rax
2239     2239:	9c                   	pushf
223a     223a:	58                   	pop    %rax
223b     223b:	fa                   	cli
223c     223c:	9c                   	pushf
223d     223d:	58                   	pop    %rax
223e     223e:	fa                   	cli
223f     223f:	fb                   	sti
2240     2240:	fb                   	sti
2241     2241:	9c                   	pushf
2242     2242:	58                   	pop    %rax
2243     2243:	fa                   	cli
2244     2244:	c6 07 00             	movb   $0x0,(%rdi)
2247     2247:	9c                   	pushf
2248     2248:	58                   	pop    %rax
2249     2249:	fb                   	sti
224a     224a:	c6 07 00             	movb   $0x0,(%rdi)
224d     224d:	fb                   	sti
224e     224e:	9c                   	pushf
224f     224f:	58                   	pop    %rax
2250     2250:	fa                   	cli
2251     2251:	9c                   	pushf
2252     2252:	58                   	pop    %rax
2253     2253:	fa                   	cli
2254     2254:	c6 07 00             	movb   $0x0,(%rdi)
2257     2257:	9c                   	pushf
2258     2258:	58                   	pop    %rax
2259     2259:	fb                   	sti
225a     225a:	9c                   	pushf
225b     225b:	58                   	pop    %rax
225c     225c:	9c                   	pushf
225d     225d:	58                   	pop    %rax
225e     225e:	9c                   	pushf
225f     225f:	58                   	pop    %rax
2260     2260:	9c                   	pushf
2261     2261:	58                   	pop    %rax
2262     2262:	fa                   	cli
2263     2263:	9c                   	pushf
2264     2264:	58                   	pop    %rax
2265     2265:	fb                   	sti
2266     2266:	9c                   	pushf
2267     2267:	58                   	pop    %rax
2268     2268:	fa                   	cli
2269     2269:	9c                   	pushf
226a     226a:	58                   	pop    %rax
226b     226b:	fb                   	sti
226c     226c:	9c                   	pushf
226d     226d:	58                   	pop    %rax
226e     226e:	fa                   	cli
226f     226f:	9c                   	pushf
2270     2270:	58                   	pop    %rax
2271     2271:	fb                   	sti
2272     2272:	9c                   	pushf
2273     2273:	58                   	pop    %rax
2274     2274:	fa                   	cli
2275     2275:	9c                   	pushf
2276     2276:	58                   	pop    %rax
2277     2277:	fb                   	sti
2278     2278:	9c                   	pushf
2279     2279:	58                   	pop    %rax
227a     227a:	fa                   	cli
227b     227b:	9c                   	pushf
227c     227c:	58                   	pop    %rax
227d     227d:	fb                   	sti
227e     227e:	9c                   	pushf
227f     227f:	58                   	pop    %rax
2280     2280:	9c                   	pushf
2281     2281:	58                   	pop    %rax
2282     2282:	9c                   	pushf
2283     2283:	58                   	pop    %rax
2284     2284:	9c                   	pushf
2285     2285:	58                   	pop    %rax
2286     2286:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
2290     2290:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
229a     229a:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
22a4     22a4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
22ae     22ae:	49 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r14
22b8     22b8:	49 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r14
22c2     22c2:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
22cc     22cc:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
22d6     22d6:	9c                   	pushf
22d7     22d7:	58                   	pop    %rax
22d8     22d8:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
22e2     22e2:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
22ec     22ec:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
22f6     22f6:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
2300     2300:	9c                   	pushf
2301     2301:	58                   	pop    %rax
2302     2302:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
230c     230c:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
2316     2316:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
2320     2320:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
232a     232a:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
2334     2334:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
233e     233e:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
2348     2348:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
2352     2352:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
235c     235c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
2366     2366:	9c                   	pushf
2367     2367:	58                   	pop    %rax
2368     2368:	fa                   	cli
2369     2369:	fb                   	sti
236a     236a:	9c                   	pushf
236b     236b:	58                   	pop    %rax
236c     236c:	e9 00 00 00 00       	jmp    2371 <.altinstr_replacement+0x2371>	236d: R_X86_64_PC32	.text+0xa024e3
2371     2371:	9c                   	pushf
2372     2372:	58                   	pop    %rax
2373     2373:	9c                   	pushf
2374     2374:	58                   	pop    %rax
2375     2375:	9c                   	pushf
2376     2376:	58                   	pop    %rax
2377     2377:	fa                   	cli
2378     2378:	c6 07 00             	movb   $0x0,(%rdi)
237b     237b:	9c                   	pushf
237c     237c:	58                   	pop    %rax
237d     237d:	fb                   	sti
237e     237e:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
2388     2388:	9c                   	pushf
2389     2389:	58                   	pop    %rax
238a     238a:	9c                   	pushf
238b     238b:	58                   	pop    %rax
238c     238c:	fa                   	cli
238d     238d:	9c                   	pushf
238e     238e:	58                   	pop    %rax
238f     238f:	fb                   	sti
2390     2390:	9c                   	pushf
2391     2391:	58                   	pop    %rax
2392     2392:	fa                   	cli
2393     2393:	9c                   	pushf
2394     2394:	58                   	pop    %rax
2395     2395:	fb                   	sti
2396     2396:	9c                   	pushf
2397     2397:	58                   	pop    %rax
2398     2398:	fa                   	cli
2399     2399:	9c                   	pushf
239a     239a:	58                   	pop    %rax
239b     239b:	fb                   	sti
239c     239c:	9c                   	pushf
239d     239d:	58                   	pop    %rax
239e     239e:	fa                   	cli
239f     239f:	9c                   	pushf
23a0     23a0:	58                   	pop    %rax
23a1     23a1:	fb                   	sti
23a2     23a2:	9c                   	pushf
23a3     23a3:	58                   	pop    %rax
23a4     23a4:	fa                   	cli
23a5     23a5:	9c                   	pushf
23a6     23a6:	58                   	pop    %rax
23a7     23a7:	fb                   	sti
23a8     23a8:	0f 0d 0b             	prefetchw (%rbx)
23ab     23ab:	9c                   	pushf
23ac     23ac:	58                   	pop    %rax
23ad     23ad:	fb                   	sti
23ae     23ae:	9c                   	pushf
23af     23af:	58                   	pop    %rax
23b0     23b0:	fb                   	sti
23b1     23b1:	9c                   	pushf
23b2     23b2:	58                   	pop    %rax
23b3     23b3:	fa                   	cli
23b4     23b4:	9c                   	pushf
23b5     23b5:	58                   	pop    %rax
23b6     23b6:	9c                   	pushf
23b7     23b7:	41 5c                	pop    %r12
23b9     23b9:	0f 01 ca             	clac
23bc     23bc:	41 54                	push   %r12
23be     23be:	9d                   	popf
23bf     23bf:	9c                   	pushf
23c0     23c0:	41 5a                	pop    %r10
23c2     23c2:	0f 01 ca             	clac
23c5     23c5:	9c                   	pushf
23c6     23c6:	58                   	pop    %rax
23c7     23c7:	fa                   	cli
23c8     23c8:	9c                   	pushf
23c9     23c9:	58                   	pop    %rax
23ca     23ca:	fb                   	sti
23cb     23cb:	41 52                	push   %r10
23cd     23cd:	9d                   	popf
23ce     23ce:	c6 07 00             	movb   $0x0,(%rdi)
23d1     23d1:	c6 07 00             	movb   $0x0,(%rdi)
23d4     23d4:	c6 07 00             	movb   $0x0,(%rdi)
23d7     23d7:	9c                   	pushf
23d8     23d8:	58                   	pop    %rax
23d9     23d9:	fa                   	cli
23da     23da:	9c                   	pushf
23db     23db:	58                   	pop    %rax
23dc     23dc:	fb                   	sti
23dd     23dd:	c6 07 00             	movb   $0x0,(%rdi)
23e0     23e0:	c6 07 00             	movb   $0x0,(%rdi)
23e3     23e3:	c6 07 00             	movb   $0x0,(%rdi)
23e6     23e6:	9c                   	pushf
23e7     23e7:	58                   	pop    %rax
23e8     23e8:	fa                   	cli
23e9     23e9:	9c                   	pushf
23ea     23ea:	58                   	pop    %rax
23eb     23eb:	fb                   	sti
23ec     23ec:	e9 00 00 00 00       	jmp    23f1 <.altinstr_replacement+0x23f1>	23ed: R_X86_64_PC32	.text+0xb35025
23f1     23f1:	48 89 f8             	mov    %rdi,%rax
23f4     23f4:	9c                   	pushf
23f5     23f5:	58                   	pop    %rax
23f6     23f6:	fa                   	cli
23f7     23f7:	9c                   	pushf
23f8     23f8:	58                   	pop    %rax
23f9     23f9:	fb                   	sti
23fa     23fa:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
2404     2404:	e9 00 00 00 00       	jmp    2409 <.altinstr_replacement+0x2409>	2405: R_X86_64_PC32	.text+0xb3f613
2409     2409:	e9 00 00 00 00       	jmp    240e <.altinstr_replacement+0x240e>	240a: R_X86_64_PC32	.text+0xb44d36
240e     240e:	48 89 f8             	mov    %rdi,%rax
2411     2411:	48 89 f8             	mov    %rdi,%rax
2414     2414:	48 89 f8             	mov    %rdi,%rax
2417     2417:	9c                   	pushf
2418     2418:	58                   	pop    %rax
2419     2419:	fa                   	cli
241a     241a:	9c                   	pushf
241b     241b:	58                   	pop    %rax
241c     241c:	fb                   	sti
241d     241d:	9c                   	pushf
241e     241e:	58                   	pop    %rax
241f     241f:	fa                   	cli
2420     2420:	9c                   	pushf
2421     2421:	58                   	pop    %rax
2422     2422:	fb                   	sti
2423     2423:	9c                   	pushf
2424     2424:	58                   	pop    %rax
2425     2425:	fb                   	sti
2426     2426:	9c                   	pushf
2427     2427:	58                   	pop    %rax
2428     2428:	fa                   	cli
2429     2429:	9c                   	pushf
242a     242a:	58                   	pop    %rax
242b     242b:	fb                   	sti
242c     242c:	9c                   	pushf
242d     242d:	58                   	pop    %rax
242e     242e:	fa                   	cli
242f     242f:	9c                   	pushf
2430     2430:	58                   	pop    %rax
2431     2431:	fb                   	sti
2432     2432:	f3 48 0f b8 c7       	popcnt %rdi,%rax
2437     2437:	f3 48 0f b8 c7       	popcnt %rdi,%rax
243c     243c:	49 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r15
2446     2446:	49 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r15
2450     2450:	9c                   	pushf
2451     2451:	58                   	pop    %rax
2452     2452:	fb                   	sti
2453     2453:	9c                   	pushf
2454     2454:	58                   	pop    %rax
2455     2455:	fb                   	sti
2456     2456:	9c                   	pushf
2457     2457:	58                   	pop    %rax
2458     2458:	fa                   	cli
2459     2459:	9c                   	pushf
245a     245a:	58                   	pop    %rax
245b     245b:	48 89 f8             	mov    %rdi,%rax
245e     245e:	49 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r14
2468     2468:	48 89 f8             	mov    %rdi,%rax
246b     246b:	9c                   	pushf
246c     246c:	58                   	pop    %rax
246d     246d:	9c                   	pushf
246e     246e:	58                   	pop    %rax
246f     246f:	fa                   	cli
2470     2470:	9c                   	pushf
2471     2471:	58                   	pop    %rax
2472     2472:	fb                   	sti
2473     2473:	9c                   	pushf
2474     2474:	58                   	pop    %rax
2475     2475:	9c                   	pushf
2476     2476:	58                   	pop    %rax
2477     2477:	fa                   	cli
2478     2478:	9c                   	pushf
2479     2479:	58                   	pop    %rax
247a     247a:	fb                   	sti
247b     247b:	9c                   	pushf
247c     247c:	58                   	pop    %rax
247d     247d:	fa                   	cli
247e     247e:	9c                   	pushf
247f     247f:	58                   	pop    %rax
2480     2480:	fb                   	sti
2481     2481:	e9 00 00 00 00       	jmp    2486 <.altinstr_replacement+0x2486>	2482: R_X86_64_PC32	.text+0xb95a7b
2486     2486:	e9 00 00 00 00       	jmp    248b <.altinstr_replacement+0x248b>	2487: R_X86_64_PC32	.text+0xb95a9c
248b     248b:	0f 01 cb             	stac
248e     248e:	0f ae e8             	lfence
2491     2491:	0f 01 ca             	clac
2494     2494:	0f 01 ca             	clac
2497     2497:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
24a1     24a1:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
24ab     24ab:	49 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r15
24b5     24b5:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
24bf     24bf:	e9 00 00 00 00       	jmp    24c4 <.altinstr_replacement+0x24c4>	24c0: R_X86_64_PC32	.text+0xba4717
24c4     24c4:	e9 00 00 00 00       	jmp    24c9 <.altinstr_replacement+0x24c9>	24c5: R_X86_64_PC32	.text+0xba4776
24c9     24c9:	9c                   	pushf
24ca     24ca:	58                   	pop    %rax
24cb     24cb:	fa                   	cli
24cc     24cc:	9c                   	pushf
24cd     24cd:	58                   	pop    %rax
24ce     24ce:	fb                   	sti
24cf     24cf:	9c                   	pushf
24d0     24d0:	58                   	pop    %rax
24d1     24d1:	fa                   	cli
24d2     24d2:	9c                   	pushf
24d3     24d3:	58                   	pop    %rax
24d4     24d4:	fb                   	sti
24d5     24d5:	48 89 f8             	mov    %rdi,%rax
24d8     24d8:	0f 01 cb             	stac
24db     24db:	e8 00 00 00 00       	call   24e0 <.altinstr_replacement+0x24e0>	24dc: R_X86_64_PLT32	rep_movs_alternative-0x4
24e0     24e0:	0f 01 ca             	clac
24e3     24e3:	0f 01 cb             	stac
24e6     24e6:	e8 00 00 00 00       	call   24eb <.altinstr_replacement+0x24eb>	24e7: R_X86_64_PLT32	rep_movs_alternative-0x4
24eb     24eb:	0f 01 ca             	clac
24ee     24ee:	9c                   	pushf
24ef     24ef:	58                   	pop    %rax
24f0     24f0:	fa                   	cli
24f1     24f1:	9c                   	pushf
24f2     24f2:	58                   	pop    %rax
24f3     24f3:	fb                   	sti
24f4     24f4:	9c                   	pushf
24f5     24f5:	58                   	pop    %rax
24f6     24f6:	fa                   	cli
24f7     24f7:	9c                   	pushf
24f8     24f8:	58                   	pop    %rax
24f9     24f9:	fb                   	sti
24fa     24fa:	9c                   	pushf
24fb     24fb:	58                   	pop    %rax
24fc     24fc:	fa                   	cli
24fd     24fd:	9c                   	pushf
24fe     24fe:	58                   	pop    %rax
24ff     24ff:	fb                   	sti
2500     2500:	9c                   	pushf
2501     2501:	58                   	pop    %rax
2502     2502:	fa                   	cli
2503     2503:	9c                   	pushf
2504     2504:	58                   	pop    %rax
2505     2505:	fb                   	sti
2506     2506:	e9 00 00 00 00       	jmp    250b <.altinstr_replacement+0x250b>	2507: R_X86_64_PC32	.text+0xbf45ec
250b     250b:	9c                   	pushf
250c     250c:	58                   	pop    %rax
250d     250d:	fa                   	cli
250e     250e:	9c                   	pushf
250f     250f:	58                   	pop    %rax
2510     2510:	fb                   	sti
2511     2511:	48 89 f8             	mov    %rdi,%rax
2514     2514:	e9 00 00 00 00       	jmp    2519 <.altinstr_replacement+0x2519>	2515: R_X86_64_PC32	.text+0xbfec41
2519     2519:	e9 00 00 00 00       	jmp    251e <.altinstr_replacement+0x251e>	251a: R_X86_64_PC32	.text+0xbfed91
251e     251e:	41 0f 0d 4c 24 f8    	prefetchw -0x8(%r12)
2524     2524:	48 89 f8             	mov    %rdi,%rax
2527     2527:	48 89 f8             	mov    %rdi,%rax
252a     252a:	48 89 f8             	mov    %rdi,%rax
252d     252d:	e9 00 00 00 00       	jmp    2532 <.altinstr_replacement+0x2532>	252e: R_X86_64_PC32	.text+0xc0a95a
2532     2532:	e9 00 00 00 00       	jmp    2537 <.altinstr_replacement+0x2537>	2533: R_X86_64_PC32	.text+0xc0a97a
2537     2537:	48 89 f8             	mov    %rdi,%rax
253a     253a:	48 89 f8             	mov    %rdi,%rax
253d     253d:	48 89 f8             	mov    %rdi,%rax
2540     2540:	48 89 f8             	mov    %rdi,%rax
2543     2543:	48 89 f8             	mov    %rdi,%rax
2546     2546:	48 89 f8             	mov    %rdi,%rax
2549     2549:	48 89 f8             	mov    %rdi,%rax
254c     254c:	48 89 f8             	mov    %rdi,%rax
254f     254f:	48 89 f8             	mov    %rdi,%rax
2552     2552:	48 89 f8             	mov    %rdi,%rax
2555     2555:	9c                   	pushf
2556     2556:	58                   	pop    %rax
2557     2557:	fa                   	cli
2558     2558:	9c                   	pushf
2559     2559:	58                   	pop    %rax
255a     255a:	fb                   	sti
255b     255b:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
2565     2565:	49 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r15
256f     256f:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
2579     2579:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
2583     2583:	e8 00 00 00 00       	call   2588 <.altinstr_replacement+0x2588>	2584: R_X86_64_PLT32	clear_page_rep-0x4
2588     2588:	e8 00 00 00 00       	call   258d <.altinstr_replacement+0x258d>	2589: R_X86_64_PLT32	clear_page_erms-0x4
258d     258d:	e8 00 00 00 00       	call   2592 <.altinstr_replacement+0x2592>	258e: R_X86_64_PLT32	clear_page_rep-0x4
2592     2592:	e8 00 00 00 00       	call   2597 <.altinstr_replacement+0x2597>	2593: R_X86_64_PLT32	clear_page_erms-0x4
2597     2597:	e9 00 00 00 00       	jmp    259c <.altinstr_replacement+0x259c>	2598: R_X86_64_PC32	.text+0xc3e367
259c     259c:	e9 00 00 00 00       	jmp    25a1 <.altinstr_replacement+0x25a1>	259d: R_X86_64_PC32	.init.text+0x1339aa
25a1     25a1:	e9 00 00 00 00       	jmp    25a6 <.altinstr_replacement+0x25a6>	25a2: R_X86_64_PC32	.init.text+0x133add
25a6     25a6:	e9 00 00 00 00       	jmp    25ab <.altinstr_replacement+0x25ab>	25a7: R_X86_64_PC32	.init.text+0x1343f9
25ab     25ab:	e9 00 00 00 00       	jmp    25b0 <.altinstr_replacement+0x25b0>	25ac: R_X86_64_PC32	.init.text+0x134521
25b0     25b0:	e9 00 00 00 00       	jmp    25b5 <.altinstr_replacement+0x25b5>	25b1: R_X86_64_PC32	.init.text+0x13495e
25b5     25b5:	e9 00 00 00 00       	jmp    25ba <.altinstr_replacement+0x25ba>	25b6: R_X86_64_PC32	.init.text+0x134aa1
25ba     25ba:	e9 00 00 00 00       	jmp    25bf <.altinstr_replacement+0x25bf>	25bb: R_X86_64_PC32	.init.text+0x136b8c
25bf     25bf:	e9 00 00 00 00       	jmp    25c4 <.altinstr_replacement+0x25c4>	25c0: R_X86_64_PC32	.meminit.text+0x8172
25c4     25c4:	e9 00 00 00 00       	jmp    25c9 <.altinstr_replacement+0x25c9>	25c5: R_X86_64_PC32	.meminit.text+0x818a
25c9     25c9:	e9 00 00 00 00       	jmp    25ce <.altinstr_replacement+0x25ce>	25ca: R_X86_64_PC32	.text+0xc502e5
25ce     25ce:	48 89 f8             	mov    %rdi,%rax
25d1     25d1:	9c                   	pushf
25d2     25d2:	58                   	pop    %rax
25d3     25d3:	fa                   	cli
25d4     25d4:	9c                   	pushf
25d5     25d5:	58                   	pop    %rax
25d6     25d6:	fb                   	sti
25d7     25d7:	48 89 f8             	mov    %rdi,%rax
25da     25da:	48 89 f8             	mov    %rdi,%rax
25dd     25dd:	48 89 f8             	mov    %rdi,%rax
25e0     25e0:	e9 00 00 00 00       	jmp    25e5 <.altinstr_replacement+0x25e5>	25e1: R_X86_64_PC32	.text+0xc596df
25e5     25e5:	e9 00 00 00 00       	jmp    25ea <.altinstr_replacement+0x25ea>	25e6: R_X86_64_PC32	.text+0xc5970d
25ea     25ea:	48 89 f8             	mov    %rdi,%rax
25ed     25ed:	48 89 f8             	mov    %rdi,%rax
25f0     25f0:	e9 00 00 00 00       	jmp    25f5 <.altinstr_replacement+0x25f5>	25f1: R_X86_64_PC32	.init.text+0x1422dd
25f5     25f5:	e9 00 00 00 00       	jmp    25fa <.altinstr_replacement+0x25fa>	25f6: R_X86_64_PC32	.init.text+0x142320
25fa     25fa:	e9 00 00 00 00       	jmp    25ff <.altinstr_replacement+0x25ff>	25fb: R_X86_64_PC32	.init.text+0x142522
25ff     25ff:	48 89 f8             	mov    %rdi,%rax
2602     2602:	48 89 f8             	mov    %rdi,%rax
2605     2605:	9c                   	pushf
2606     2606:	58                   	pop    %rax
2607     2607:	fa                   	cli
2608     2608:	9c                   	pushf
2609     2609:	58                   	pop    %rax
260a     260a:	fb                   	sti
260b     260b:	9c                   	pushf
260c     260c:	58                   	pop    %rax
260d     260d:	fa                   	cli
260e     260e:	9c                   	pushf
260f     260f:	58                   	pop    %rax
2610     2610:	fb                   	sti
2611     2611:	e9 00 00 00 00       	jmp    2616 <.altinstr_replacement+0x2616>	2612: R_X86_64_PC32	.text+0xc6d2ae
2616     2616:	e9 00 00 00 00       	jmp    261b <.altinstr_replacement+0x261b>	2617: R_X86_64_PC32	.text+0xc6d2cc
261b     261b:	e9 00 00 00 00       	jmp    2620 <.altinstr_replacement+0x2620>	261c: R_X86_64_PC32	.text+0xc71d32
2620     2620:	e9 00 00 00 00       	jmp    2625 <.altinstr_replacement+0x2625>	2621: R_X86_64_PC32	.text+0xc71d27
2625     2625:	9c                   	pushf
2626     2626:	58                   	pop    %rax
2627     2627:	fa                   	cli
2628     2628:	9c                   	pushf
2629     2629:	58                   	pop    %rax
262a     262a:	fb                   	sti
262b     262b:	e9 00 00 00 00       	jmp    2630 <.altinstr_replacement+0x2630>	262c: R_X86_64_PC32	.text+0xc83265
2630     2630:	48 89 f8             	mov    %rdi,%rax
2633     2633:	e9 00 00 00 00       	jmp    2638 <.altinstr_replacement+0x2638>	2634: R_X86_64_PC32	.text+0xc84318
2638     2638:	0f 01 cb             	stac
263b     263b:	0f ae e8             	lfence
263e     263e:	0f 01 ca             	clac
2641     2641:	0f 01 ca             	clac
2644     2644:	0f 01 cb             	stac
2647     2647:	0f ae e8             	lfence
264a     264a:	0f 01 ca             	clac
264d     264d:	0f 01 ca             	clac
2650     2650:	e9 00 00 00 00       	jmp    2655 <.altinstr_replacement+0x2655>	2651: R_X86_64_PC32	.text+0xc8588f
2655     2655:	48 89 f8             	mov    %rdi,%rax
2658     2658:	e9 00 00 00 00       	jmp    265d <.altinstr_replacement+0x265d>	2659: R_X86_64_PC32	.text+0xc89b08
265d     265d:	48 89 f8             	mov    %rdi,%rax
2660     2660:	48 89 f8             	mov    %rdi,%rax
2663     2663:	e9 00 00 00 00       	jmp    2668 <.altinstr_replacement+0x2668>	2664: R_X86_64_PC32	.text+0xc89cb2
2668     2668:	e9 00 00 00 00       	jmp    266d <.altinstr_replacement+0x266d>	2669: R_X86_64_PC32	.text+0xc8a1f4
266d     266d:	48 89 f8             	mov    %rdi,%rax
2670     2670:	48 89 f8             	mov    %rdi,%rax
2673     2673:	48 89 f8             	mov    %rdi,%rax
2676     2676:	48 89 f8             	mov    %rdi,%rax
2679     2679:	48 89 f8             	mov    %rdi,%rax
267c     267c:	48 89 f8             	mov    %rdi,%rax
267f     267f:	48 89 f8             	mov    %rdi,%rax
2682     2682:	48 89 f8             	mov    %rdi,%rax
2685     2685:	48 89 f8             	mov    %rdi,%rax
2688     2688:	48 89 f8             	mov    %rdi,%rax
268b     268b:	48 89 f8             	mov    %rdi,%rax
268e     268e:	48 89 f8             	mov    %rdi,%rax
2691     2691:	48 89 f8             	mov    %rdi,%rax
2694     2694:	48 89 f8             	mov    %rdi,%rax
2697     2697:	48 89 f8             	mov    %rdi,%rax
269a     269a:	48 89 f8             	mov    %rdi,%rax
269d     269d:	48 89 f8             	mov    %rdi,%rax
26a0     26a0:	e9 00 00 00 00       	jmp    26a5 <.altinstr_replacement+0x26a5>	26a1: R_X86_64_PC32	.text+0xc8c771
26a5     26a5:	e9 00 00 00 00       	jmp    26aa <.altinstr_replacement+0x26aa>	26a6: R_X86_64_PC32	.text+0xc8c7df
26aa     26aa:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
26b4     26b4:	e9 00 00 00 00       	jmp    26b9 <.altinstr_replacement+0x26b9>	26b5: R_X86_64_PC32	.text+0xc8c9be
26b9     26b9:	48 89 f8             	mov    %rdi,%rax
26bc     26bc:	48 89 f8             	mov    %rdi,%rax
26bf     26bf:	48 89 f8             	mov    %rdi,%rax
26c2     26c2:	48 89 f8             	mov    %rdi,%rax
26c5     26c5:	48 89 f8             	mov    %rdi,%rax
26c8     26c8:	e9 00 00 00 00       	jmp    26cd <.altinstr_replacement+0x26cd>	26c9: R_X86_64_PC32	.text+0xc907b9
26cd     26cd:	48 89 f8             	mov    %rdi,%rax
26d0     26d0:	48 89 f8             	mov    %rdi,%rax
26d3     26d3:	48 89 f8             	mov    %rdi,%rax
26d6     26d6:	48 89 f8             	mov    %rdi,%rax
26d9     26d9:	48 89 f8             	mov    %rdi,%rax
26dc     26dc:	48 89 f8             	mov    %rdi,%rax
26df     26df:	48 89 f8             	mov    %rdi,%rax
26e2     26e2:	48 89 f8             	mov    %rdi,%rax
26e5     26e5:	e9 00 00 00 00       	jmp    26ea <.altinstr_replacement+0x26ea>	26e6: R_X86_64_PC32	.text+0xc90f39
26ea     26ea:	48 89 f8             	mov    %rdi,%rax
26ed     26ed:	48 89 f8             	mov    %rdi,%rax
26f0     26f0:	48 89 f8             	mov    %rdi,%rax
26f3     26f3:	48 89 f8             	mov    %rdi,%rax
26f6     26f6:	48 89 f8             	mov    %rdi,%rax
26f9     26f9:	48 89 f8             	mov    %rdi,%rax
26fc     26fc:	48 89 f8             	mov    %rdi,%rax
26ff     26ff:	48 89 f8             	mov    %rdi,%rax
2702     2702:	48 89 f8             	mov    %rdi,%rax
2705     2705:	48 89 f8             	mov    %rdi,%rax
2708     2708:	e9 00 00 00 00       	jmp    270d <.altinstr_replacement+0x270d>	2709: R_X86_64_PC32	.text+0xc91b18
270d     270d:	48 89 f8             	mov    %rdi,%rax
2710     2710:	48 89 f8             	mov    %rdi,%rax
2713     2713:	e9 00 00 00 00       	jmp    2718 <.altinstr_replacement+0x2718>	2714: R_X86_64_PC32	.text+0xc92110
2718     2718:	9c                   	pushf
2719     2719:	58                   	pop    %rax
271a     271a:	fa                   	cli
271b     271b:	9c                   	pushf
271c     271c:	58                   	pop    %rax
271d     271d:	fb                   	sti
271e     271e:	65 48 23 1c 25 00 00 00 00 	and    %gs:0x0,%rbx	2723: R_X86_64_32S	tlbstate_untag_mask
2727     2727:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
2731     2731:	e9 00 00 00 00       	jmp    2736 <.altinstr_replacement+0x2736>	2732: R_X86_64_PC32	.text+0xc96ec2
2736     2736:	48 89 f8             	mov    %rdi,%rax
2739     2739:	48 89 f8             	mov    %rdi,%rax
273c     273c:	e9 00 00 00 00       	jmp    2741 <.altinstr_replacement+0x2741>	273d: R_X86_64_PC32	.text+0xc97465
2741     2741:	48 89 f8             	mov    %rdi,%rax
2744     2744:	48 89 f8             	mov    %rdi,%rax
2747     2747:	48 89 f8             	mov    %rdi,%rax
274a     274a:	e9 00 00 00 00       	jmp    274f <.altinstr_replacement+0x274f>	274b: R_X86_64_PC32	.text+0xc97757
274f     274f:	e9 00 00 00 00       	jmp    2754 <.altinstr_replacement+0x2754>	2750: R_X86_64_PC32	.text+0xc977b6
2754     2754:	48 89 f8             	mov    %rdi,%rax
2757     2757:	9c                   	pushf
2758     2758:	58                   	pop    %rax
2759     2759:	fa                   	cli
275a     275a:	9c                   	pushf
275b     275b:	58                   	pop    %rax
275c     275c:	fb                   	sti
275d     275d:	0f 01 cb             	stac
2760     2760:	e8 00 00 00 00       	call   2765 <.altinstr_replacement+0x2765>	2761: R_X86_64_PLT32	rep_movs_alternative-0x4
2765     2765:	0f 01 ca             	clac
2768     2768:	e8 00 00 00 00       	call   276d <.altinstr_replacement+0x276d>	2769: R_X86_64_PLT32	clear_page_rep-0x4
276d     276d:	e8 00 00 00 00       	call   2772 <.altinstr_replacement+0x2772>	276e: R_X86_64_PLT32	clear_page_erms-0x4
2772     2772:	0f 01 cb             	stac
2775     2775:	e8 00 00 00 00       	call   277a <.altinstr_replacement+0x277a>	2776: R_X86_64_PLT32	rep_movs_alternative-0x4
277a     277a:	0f 01 ca             	clac
277d     277d:	9c                   	pushf
277e     277e:	58                   	pop    %rax
277f     277f:	fa                   	cli
2780     2780:	9c                   	pushf
2781     2781:	58                   	pop    %rax
2782     2782:	fb                   	sti
2783     2783:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
278d     278d:	48 89 f8             	mov    %rdi,%rax
2790     2790:	48 89 f8             	mov    %rdi,%rax
2793     2793:	48 89 f8             	mov    %rdi,%rax
2796     2796:	48 89 f8             	mov    %rdi,%rax
2799     2799:	48 89 f8             	mov    %rdi,%rax
279c     279c:	e9 00 00 00 00       	jmp    27a1 <.altinstr_replacement+0x27a1>	279d: R_X86_64_PC32	.text+0xc9bb60
27a1     27a1:	e9 00 00 00 00       	jmp    27a6 <.altinstr_replacement+0x27a6>	27a2: R_X86_64_PC32	.text+0xc9bb90
27a6     27a6:	48 89 f8             	mov    %rdi,%rax
27a9     27a9:	48 89 f8             	mov    %rdi,%rax
27ac     27ac:	48 89 f8             	mov    %rdi,%rax
27af     27af:	48 89 f8             	mov    %rdi,%rax
27b2     27b2:	48 89 f8             	mov    %rdi,%rax
27b5     27b5:	e9 00 00 00 00       	jmp    27ba <.altinstr_replacement+0x27ba>	27b6: R_X86_64_PC32	.text+0xc9ce0d
27ba     27ba:	e9 00 00 00 00       	jmp    27bf <.altinstr_replacement+0x27bf>	27bb: R_X86_64_PC32	.text+0xc9ce91
27bf     27bf:	e9 00 00 00 00       	jmp    27c4 <.altinstr_replacement+0x27c4>	27c0: R_X86_64_PC32	.text+0xc9cd72
27c4     27c4:	48 89 f8             	mov    %rdi,%rax
27c7     27c7:	48 89 f8             	mov    %rdi,%rax
27ca     27ca:	48 89 f8             	mov    %rdi,%rax
27cd     27cd:	48 89 f8             	mov    %rdi,%rax
27d0     27d0:	e9 00 00 00 00       	jmp    27d5 <.altinstr_replacement+0x27d5>	27d1: R_X86_64_PC32	.text+0xc9ffa9
27d5     27d5:	e9 00 00 00 00       	jmp    27da <.altinstr_replacement+0x27da>	27d6: R_X86_64_PC32	.text+0xca0010
27da     27da:	48 89 f8             	mov    %rdi,%rax
27dd     27dd:	48 89 f8             	mov    %rdi,%rax
27e0     27e0:	48 89 f8             	mov    %rdi,%rax
27e3     27e3:	48 89 f8             	mov    %rdi,%rax
27e6     27e6:	e9 00 00 00 00       	jmp    27eb <.altinstr_replacement+0x27eb>	27e7: R_X86_64_PC32	.text+0xca16a2
27eb     27eb:	e9 00 00 00 00       	jmp    27f0 <.altinstr_replacement+0x27f0>	27ec: R_X86_64_PC32	.text+0xca170e
27f0     27f0:	48 89 f8             	mov    %rdi,%rax
27f3     27f3:	48 89 f8             	mov    %rdi,%rax
27f6     27f6:	48 89 f8             	mov    %rdi,%rax
27f9     27f9:	48 89 f8             	mov    %rdi,%rax
27fc     27fc:	48 89 f8             	mov    %rdi,%rax
27ff     27ff:	48 89 f8             	mov    %rdi,%rax
2802     2802:	48 89 f8             	mov    %rdi,%rax
2805     2805:	48 89 f8             	mov    %rdi,%rax
2808     2808:	48 89 f8             	mov    %rdi,%rax
280b     280b:	e9 00 00 00 00       	jmp    2810 <.altinstr_replacement+0x2810>	280c: R_X86_64_PC32	.text+0xca6e39
2810     2810:	e9 00 00 00 00       	jmp    2815 <.altinstr_replacement+0x2815>	2811: R_X86_64_PC32	.text+0xca6e44
2815     2815:	e9 00 00 00 00       	jmp    281a <.altinstr_replacement+0x281a>	2816: R_X86_64_PC32	.text+0xca7169
281a     281a:	e9 00 00 00 00       	jmp    281f <.altinstr_replacement+0x281f>	281b: R_X86_64_PC32	.text+0xca71d0
281f     281f:	48 89 f8             	mov    %rdi,%rax
2822     2822:	48 89 f8             	mov    %rdi,%rax
2825     2825:	48 89 f8             	mov    %rdi,%rax
2828     2828:	e9 00 00 00 00       	jmp    282d <.altinstr_replacement+0x282d>	2829: R_X86_64_PC32	.text+0xcaf400
282d     282d:	e9 00 00 00 00       	jmp    2832 <.altinstr_replacement+0x2832>	282e: R_X86_64_PC32	.text+0xcaf436
2832     2832:	48 89 f8             	mov    %rdi,%rax
2835     2835:	48 89 f8             	mov    %rdi,%rax
2838     2838:	48 89 f8             	mov    %rdi,%rax
283b     283b:	48 89 f8             	mov    %rdi,%rax
283e     283e:	48 89 f8             	mov    %rdi,%rax
2841     2841:	e9 00 00 00 00       	jmp    2846 <.altinstr_replacement+0x2846>	2842: R_X86_64_PC32	.text+0xcb0928
2846     2846:	e9 00 00 00 00       	jmp    284b <.altinstr_replacement+0x284b>	2847: R_X86_64_PC32	.text+0xcb098f
284b     284b:	e9 00 00 00 00       	jmp    2850 <.altinstr_replacement+0x2850>	284c: R_X86_64_PC32	.text+0xcb09d2
2850     2850:	48 89 f8             	mov    %rdi,%rax
2853     2853:	48 89 f8             	mov    %rdi,%rax
2856     2856:	48 89 f8             	mov    %rdi,%rax
2859     2859:	e9 00 00 00 00       	jmp    285e <.altinstr_replacement+0x285e>	285a: R_X86_64_PC32	.text+0xcb1983
285e     285e:	e9 00 00 00 00       	jmp    2863 <.altinstr_replacement+0x2863>	285f: R_X86_64_PC32	.text+0xcb1ea5
2863     2863:	e9 00 00 00 00       	jmp    2868 <.altinstr_replacement+0x2868>	2864: R_X86_64_PC32	.text+0xcb1ec7
2868     2868:	e9 00 00 00 00       	jmp    286d <.altinstr_replacement+0x286d>	2869: R_X86_64_PC32	.text+0xcb1d90
286d     286d:	48 89 f8             	mov    %rdi,%rax
2870     2870:	48 89 f8             	mov    %rdi,%rax
2873     2873:	48 89 f8             	mov    %rdi,%rax
2876     2876:	48 89 f8             	mov    %rdi,%rax
2879     2879:	48 89 f8             	mov    %rdi,%rax
287c     287c:	e9 00 00 00 00       	jmp    2881 <.altinstr_replacement+0x2881>	287d: R_X86_64_PC32	.text+0xcb4573
2881     2881:	e9 00 00 00 00       	jmp    2886 <.altinstr_replacement+0x2886>	2882: R_X86_64_PC32	.text+0xcb4cda
2886     2886:	48 89 f8             	mov    %rdi,%rax
2889     2889:	48 89 f8             	mov    %rdi,%rax
288c     288c:	e9 00 00 00 00       	jmp    2891 <.altinstr_replacement+0x2891>	288d: R_X86_64_PC32	.text+0xcb5eeb
2891     2891:	e9 00 00 00 00       	jmp    2896 <.altinstr_replacement+0x2896>	2892: R_X86_64_PC32	.text+0xcb6033
2896     2896:	48 89 f8             	mov    %rdi,%rax
2899     2899:	e8 00 00 00 00       	call   289e <.altinstr_replacement+0x289e>	289a: R_X86_64_PLT32	clear_page_rep-0x4
289e     289e:	e8 00 00 00 00       	call   28a3 <.altinstr_replacement+0x28a3>	289f: R_X86_64_PLT32	clear_page_erms-0x4
28a3     28a3:	e8 00 00 00 00       	call   28a8 <.altinstr_replacement+0x28a8>	28a4: R_X86_64_PLT32	clear_page_rep-0x4
28a8     28a8:	e8 00 00 00 00       	call   28ad <.altinstr_replacement+0x28ad>	28a9: R_X86_64_PLT32	clear_page_erms-0x4
28ad     28ad:	e8 00 00 00 00       	call   28b2 <.altinstr_replacement+0x28b2>	28ae: R_X86_64_PLT32	clear_page_rep-0x4
28b2     28b2:	e8 00 00 00 00       	call   28b7 <.altinstr_replacement+0x28b7>	28b3: R_X86_64_PLT32	clear_page_erms-0x4
28b7     28b7:	e8 00 00 00 00       	call   28bc <.altinstr_replacement+0x28bc>	28b8: R_X86_64_PLT32	clear_page_rep-0x4
28bc     28bc:	e8 00 00 00 00       	call   28c1 <.altinstr_replacement+0x28c1>	28bd: R_X86_64_PLT32	clear_page_erms-0x4
28c1     28c1:	e8 00 00 00 00       	call   28c6 <.altinstr_replacement+0x28c6>	28c2: R_X86_64_PLT32	clear_page_rep-0x4
28c6     28c6:	e8 00 00 00 00       	call   28cb <.altinstr_replacement+0x28cb>	28c7: R_X86_64_PLT32	clear_page_erms-0x4
28cb     28cb:	65 4c 23 24 25 00 00 00 00 	and    %gs:0x0,%r12	28d0: R_X86_64_32S	tlbstate_untag_mask
28d4     28d4:	48 89 f8             	mov    %rdi,%rax
28d7     28d7:	48 89 f8             	mov    %rdi,%rax
28da     28da:	48 89 f8             	mov    %rdi,%rax
28dd     28dd:	48 89 f8             	mov    %rdi,%rax
28e0     28e0:	48 89 f8             	mov    %rdi,%rax
28e3     28e3:	65 48 23 1c 25 00 00 00 00 	and    %gs:0x0,%rbx	28e8: R_X86_64_32S	tlbstate_untag_mask
28ec     28ec:	65 48 23 04 25 00 00 00 00 	and    %gs:0x0,%rax	28f1: R_X86_64_32S	tlbstate_untag_mask
28f5     28f5:	65 48 23 04 25 00 00 00 00 	and    %gs:0x0,%rax	28fa: R_X86_64_32S	tlbstate_untag_mask
28fe     28fe:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
2908     2908:	48 89 f8             	mov    %rdi,%rax
290b     290b:	48 89 f8             	mov    %rdi,%rax
290e     290e:	48 89 f8             	mov    %rdi,%rax
2911     2911:	48 89 f8             	mov    %rdi,%rax
2914     2914:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
291e     291e:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
2928     2928:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
2932     2932:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
293c     293c:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
2946     2946:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
2950     2950:	65 48 23 3c 25 00 00 00 00 	and    %gs:0x0,%rdi	2955: R_X86_64_32S	tlbstate_untag_mask
2959     2959:	65 48 23 3c 25 00 00 00 00 	and    %gs:0x0,%rdi	295e: R_X86_64_32S	tlbstate_untag_mask
2962     2962:	e9 00 00 00 00       	jmp    2967 <.altinstr_replacement+0x2967>	2963: R_X86_64_PC32	.text+0xcd5728
2967     2967:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
2971     2971:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
297b     297b:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
2985     2985:	e9 00 00 00 00       	jmp    298a <.altinstr_replacement+0x298a>	2986: R_X86_64_PC32	.text+0xcd93a5
298a     298a:	48 89 f8             	mov    %rdi,%rax
298d     298d:	e9 00 00 00 00       	jmp    2992 <.altinstr_replacement+0x2992>	298e: R_X86_64_PC32	.text+0xcd9457
2992     2992:	e9 00 00 00 00       	jmp    2997 <.altinstr_replacement+0x2997>	2993: R_X86_64_PC32	.text+0xcd94b6
2997     2997:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
29a1     29a1:	e9 00 00 00 00       	jmp    29a6 <.altinstr_replacement+0x29a6>	29a2: R_X86_64_PC32	.text+0xcd9af4
29a6     29a6:	e9 00 00 00 00       	jmp    29ab <.altinstr_replacement+0x29ab>	29a7: R_X86_64_PC32	.text+0xcd9d3e
29ab     29ab:	e9 00 00 00 00       	jmp    29b0 <.altinstr_replacement+0x29b0>	29ac: R_X86_64_PC32	.text+0xcda0bc
29b0     29b0:	e9 00 00 00 00       	jmp    29b5 <.altinstr_replacement+0x29b5>	29b1: R_X86_64_PC32	.text+0xcda3fc
29b5     29b5:	48 89 f8             	mov    %rdi,%rax
29b8     29b8:	48 89 f8             	mov    %rdi,%rax
29bb     29bb:	48 89 f8             	mov    %rdi,%rax
29be     29be:	48 89 f8             	mov    %rdi,%rax
29c1     29c1:	48 89 f8             	mov    %rdi,%rax
29c4     29c4:	48 89 f8             	mov    %rdi,%rax
29c7     29c7:	48 89 f8             	mov    %rdi,%rax
29ca     29ca:	48 89 f8             	mov    %rdi,%rax
29cd     29cd:	48 89 f8             	mov    %rdi,%rax
29d0     29d0:	48 89 f8             	mov    %rdi,%rax
29d3     29d3:	48 89 f8             	mov    %rdi,%rax
29d6     29d6:	48 89 f8             	mov    %rdi,%rax
29d9     29d9:	48 89 f8             	mov    %rdi,%rax
29dc     29dc:	48 89 f8             	mov    %rdi,%rax
29df     29df:	48 89 f8             	mov    %rdi,%rax
29e2     29e2:	48 89 f8             	mov    %rdi,%rax
29e5     29e5:	48 89 f8             	mov    %rdi,%rax
29e8     29e8:	e9 00 00 00 00       	jmp    29ed <.altinstr_replacement+0x29ed>	29e9: R_X86_64_PC32	.text+0xcde100
29ed     29ed:	e9 00 00 00 00       	jmp    29f2 <.altinstr_replacement+0x29f2>	29ee: R_X86_64_PC32	.text+0xcde147
29f2     29f2:	e9 00 00 00 00       	jmp    29f7 <.altinstr_replacement+0x29f7>	29f3: R_X86_64_PC32	.text+0xcde1b7
29f7     29f7:	65 4c 23 24 25 00 00 00 00 	and    %gs:0x0,%r12	29fc: R_X86_64_32S	tlbstate_untag_mask
2a00     2a00:	e9 00 00 00 00       	jmp    2a05 <.altinstr_replacement+0x2a05>	2a01: R_X86_64_PC32	.text+0xcdeff3
2a05     2a05:	e9 00 00 00 00       	jmp    2a0a <.altinstr_replacement+0x2a0a>	2a06: R_X86_64_PC32	.text+0xcdf525
2a0a     2a0a:	e9 00 00 00 00       	jmp    2a0f <.altinstr_replacement+0x2a0f>	2a0b: R_X86_64_PC32	.text+0xcdfba5
2a0f     2a0f:	48 89 f8             	mov    %rdi,%rax
2a12     2a12:	e9 00 00 00 00       	jmp    2a17 <.altinstr_replacement+0x2a17>	2a13: R_X86_64_PC32	.text+0xcdfcf7
2a17     2a17:	e9 00 00 00 00       	jmp    2a1c <.altinstr_replacement+0x2a1c>	2a18: R_X86_64_PC32	.text+0xcdfd5e
2a1c     2a1c:	48 89 f8             	mov    %rdi,%rax
2a1f     2a1f:	48 89 f8             	mov    %rdi,%rax
2a22     2a22:	48 89 f8             	mov    %rdi,%rax
2a25     2a25:	e9 00 00 00 00       	jmp    2a2a <.altinstr_replacement+0x2a2a>	2a26: R_X86_64_PC32	.text+0xce0d57
2a2a     2a2a:	48 89 f8             	mov    %rdi,%rax
2a2d     2a2d:	48 89 f8             	mov    %rdi,%rax
2a30     2a30:	48 89 f8             	mov    %rdi,%rax
2a33     2a33:	48 89 f8             	mov    %rdi,%rax
2a36     2a36:	48 89 f8             	mov    %rdi,%rax
2a39     2a39:	48 89 f8             	mov    %rdi,%rax
2a3c     2a3c:	48 89 f8             	mov    %rdi,%rax
2a3f     2a3f:	48 89 f8             	mov    %rdi,%rax
2a42     2a42:	48 89 f8             	mov    %rdi,%rax
2a45     2a45:	48 89 f8             	mov    %rdi,%rax
2a48     2a48:	48 89 f8             	mov    %rdi,%rax
2a4b     2a4b:	48 89 f8             	mov    %rdi,%rax
2a4e     2a4e:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
2a58     2a58:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
2a62     2a62:	65 48 23 2c 25 00 00 00 00 	and    %gs:0x0,%rbp	2a67: R_X86_64_32S	tlbstate_untag_mask
2a6b     2a6b:	65 4c 23 34 25 00 00 00 00 	and    %gs:0x0,%r14	2a70: R_X86_64_32S	tlbstate_untag_mask
2a74     2a74:	e9 00 00 00 00       	jmp    2a79 <.altinstr_replacement+0x2a79>	2a75: R_X86_64_PC32	.text+0xce5925
2a79     2a79:	48 89 f8             	mov    %rdi,%rax
2a7c     2a7c:	e9 00 00 00 00       	jmp    2a81 <.altinstr_replacement+0x2a81>	2a7d: R_X86_64_PC32	.text+0xce59d7
2a81     2a81:	e9 00 00 00 00       	jmp    2a86 <.altinstr_replacement+0x2a86>	2a82: R_X86_64_PC32	.text+0xce5a36
2a86     2a86:	48 89 f8             	mov    %rdi,%rax
2a89     2a89:	48 89 f8             	mov    %rdi,%rax
2a8c     2a8c:	48 89 f8             	mov    %rdi,%rax
2a8f     2a8f:	48 89 f8             	mov    %rdi,%rax
2a92     2a92:	48 89 f8             	mov    %rdi,%rax
2a95     2a95:	e9 00 00 00 00       	jmp    2a9a <.altinstr_replacement+0x2a9a>	2a96: R_X86_64_PC32	.text+0xce6e2f
2a9a     2a9a:	48 89 f8             	mov    %rdi,%rax
2a9d     2a9d:	48 89 f8             	mov    %rdi,%rax
2aa0     2aa0:	48 89 f8             	mov    %rdi,%rax
2aa3     2aa3:	48 89 f8             	mov    %rdi,%rax
2aa6     2aa6:	48 89 f8             	mov    %rdi,%rax
2aa9     2aa9:	48 89 f8             	mov    %rdi,%rax
2aac     2aac:	48 89 f8             	mov    %rdi,%rax
2aaf     2aaf:	48 89 f8             	mov    %rdi,%rax
2ab2     2ab2:	48 89 f8             	mov    %rdi,%rax
2ab5     2ab5:	48 89 f8             	mov    %rdi,%rax
2ab8     2ab8:	48 89 f8             	mov    %rdi,%rax
2abb     2abb:	48 89 f8             	mov    %rdi,%rax
2abe     2abe:	48 89 f8             	mov    %rdi,%rax
2ac1     2ac1:	48 89 f8             	mov    %rdi,%rax
2ac4     2ac4:	48 89 f8             	mov    %rdi,%rax
2ac7     2ac7:	48 89 f8             	mov    %rdi,%rax
2aca     2aca:	e9 00 00 00 00       	jmp    2acf <.altinstr_replacement+0x2acf>	2acb: R_X86_64_PC32	.text+0xce94eb
2acf     2acf:	48 89 f8             	mov    %rdi,%rax
2ad2     2ad2:	e9 00 00 00 00       	jmp    2ad7 <.altinstr_replacement+0x2ad7>	2ad3: R_X86_64_PC32	.text+0xce9913
2ad7     2ad7:	e9 00 00 00 00       	jmp    2adc <.altinstr_replacement+0x2adc>	2ad8: R_X86_64_PC32	.text+0xce9986
2adc     2adc:	48 89 f8             	mov    %rdi,%rax
2adf     2adf:	e9 00 00 00 00       	jmp    2ae4 <.altinstr_replacement+0x2ae4>	2ae0: R_X86_64_PC32	.text+0xceab68
2ae4     2ae4:	e9 00 00 00 00       	jmp    2ae9 <.altinstr_replacement+0x2ae9>	2ae5: R_X86_64_PC32	.text+0xceab8f
2ae9     2ae9:	48 89 f8             	mov    %rdi,%rax
2aec     2aec:	48 89 f8             	mov    %rdi,%rax
2aef     2aef:	48 89 f8             	mov    %rdi,%rax
2af2     2af2:	48 89 f8             	mov    %rdi,%rax
2af5     2af5:	48 89 f8             	mov    %rdi,%rax
2af8     2af8:	48 89 f8             	mov    %rdi,%rax
2afb     2afb:	48 89 f8             	mov    %rdi,%rax
2afe     2afe:	48 89 f8             	mov    %rdi,%rax
2b01     2b01:	48 89 f8             	mov    %rdi,%rax
2b04     2b04:	48 89 f8             	mov    %rdi,%rax
2b07     2b07:	48 89 f8             	mov    %rdi,%rax
2b0a     2b0a:	48 89 f8             	mov    %rdi,%rax
2b0d     2b0d:	48 89 f8             	mov    %rdi,%rax
2b10     2b10:	48 89 f8             	mov    %rdi,%rax
2b13     2b13:	48 89 f8             	mov    %rdi,%rax
2b16     2b16:	48 89 f8             	mov    %rdi,%rax
2b19     2b19:	48 89 f8             	mov    %rdi,%rax
2b1c     2b1c:	48 89 f8             	mov    %rdi,%rax
2b1f     2b1f:	e9 00 00 00 00       	jmp    2b24 <.altinstr_replacement+0x2b24>	2b20: R_X86_64_PC32	.text+0xcef025
2b24     2b24:	48 89 f8             	mov    %rdi,%rax
2b27     2b27:	48 89 f8             	mov    %rdi,%rax
2b2a     2b2a:	48 89 f8             	mov    %rdi,%rax
2b2d     2b2d:	48 89 f8             	mov    %rdi,%rax
2b30     2b30:	e9 00 00 00 00       	jmp    2b35 <.altinstr_replacement+0x2b35>	2b31: R_X86_64_PC32	.text+0xcf4ecb
2b35     2b35:	48 89 f8             	mov    %rdi,%rax
2b38     2b38:	48 89 f8             	mov    %rdi,%rax
2b3b     2b3b:	48 89 f8             	mov    %rdi,%rax
2b3e     2b3e:	48 89 f8             	mov    %rdi,%rax
2b41     2b41:	48 89 f8             	mov    %rdi,%rax
2b44     2b44:	48 89 f8             	mov    %rdi,%rax
2b47     2b47:	48 89 f8             	mov    %rdi,%rax
2b4a     2b4a:	48 89 f8             	mov    %rdi,%rax
2b4d     2b4d:	48 89 f8             	mov    %rdi,%rax
2b50     2b50:	48 89 f8             	mov    %rdi,%rax
2b53     2b53:	48 89 f8             	mov    %rdi,%rax
2b56     2b56:	48 89 f8             	mov    %rdi,%rax
2b59     2b59:	48 89 f8             	mov    %rdi,%rax
2b5c     2b5c:	e9 00 00 00 00       	jmp    2b61 <.altinstr_replacement+0x2b61>	2b5d: R_X86_64_PC32	.text+0xcfc11f
2b61     2b61:	e9 00 00 00 00       	jmp    2b66 <.altinstr_replacement+0x2b66>	2b62: R_X86_64_PC32	.text+0xcfc110
2b66     2b66:	48 89 f8             	mov    %rdi,%rax
2b69     2b69:	48 89 f8             	mov    %rdi,%rax
2b6c     2b6c:	48 89 f8             	mov    %rdi,%rax
2b6f     2b6f:	e9 00 00 00 00       	jmp    2b74 <.altinstr_replacement+0x2b74>	2b70: R_X86_64_PC32	.text+0xd00717
2b74     2b74:	e9 00 00 00 00       	jmp    2b79 <.altinstr_replacement+0x2b79>	2b75: R_X86_64_PC32	.text+0xd00b83
2b79     2b79:	e9 00 00 00 00       	jmp    2b7e <.altinstr_replacement+0x2b7e>	2b7a: R_X86_64_PC32	.text+0xd00ca5
2b7e     2b7e:	48 89 f8             	mov    %rdi,%rax
2b81     2b81:	48 89 f8             	mov    %rdi,%rax
2b84     2b84:	9c                   	pushf
2b85     2b85:	58                   	pop    %rax
2b86     2b86:	fa                   	cli
2b87     2b87:	9c                   	pushf
2b88     2b88:	58                   	pop    %rax
2b89     2b89:	fb                   	sti
2b8a     2b8a:	e9 00 00 00 00       	jmp    2b8f <.altinstr_replacement+0x2b8f>	2b8b: R_X86_64_PC32	.text+0xd03b10
2b8f     2b8f:	e9 00 00 00 00       	jmp    2b94 <.altinstr_replacement+0x2b94>	2b90: R_X86_64_PC32	.text+0xd03949
2b94     2b94:	48 89 f8             	mov    %rdi,%rax
2b97     2b97:	e9 00 00 00 00       	jmp    2b9c <.altinstr_replacement+0x2b9c>	2b98: R_X86_64_PC32	.text+0xd04a17
2b9c     2b9c:	48 89 f8             	mov    %rdi,%rax
2b9f     2b9f:	48 89 f8             	mov    %rdi,%rax
2ba2     2ba2:	48 89 f8             	mov    %rdi,%rax
2ba5     2ba5:	48 89 f8             	mov    %rdi,%rax
2ba8     2ba8:	48 89 f8             	mov    %rdi,%rax
2bab     2bab:	48 89 f8             	mov    %rdi,%rax
2bae     2bae:	e9 00 00 00 00       	jmp    2bb3 <.altinstr_replacement+0x2bb3>	2baf: R_X86_64_PC32	.text+0xd0615a
2bb3     2bb3:	e9 00 00 00 00       	jmp    2bb8 <.altinstr_replacement+0x2bb8>	2bb4: R_X86_64_PC32	.text+0xd06165
2bb8     2bb8:	e9 00 00 00 00       	jmp    2bbd <.altinstr_replacement+0x2bbd>	2bb9: R_X86_64_PC32	.text+0xd0646e
2bbd     2bbd:	e9 00 00 00 00       	jmp    2bc2 <.altinstr_replacement+0x2bc2>	2bbe: R_X86_64_PC32	.text+0xd06490
2bc2     2bc2:	48 89 f8             	mov    %rdi,%rax
2bc5     2bc5:	48 89 f8             	mov    %rdi,%rax
2bc8     2bc8:	e9 00 00 00 00       	jmp    2bcd <.altinstr_replacement+0x2bcd>	2bc9: R_X86_64_PC32	.text+0xd0815e
2bcd     2bcd:	e9 00 00 00 00       	jmp    2bd2 <.altinstr_replacement+0x2bd2>	2bce: R_X86_64_PC32	.text+0xd081c5
2bd2     2bd2:	48 89 f8             	mov    %rdi,%rax
2bd5     2bd5:	48 89 f8             	mov    %rdi,%rax
2bd8     2bd8:	48 89 f8             	mov    %rdi,%rax
2bdb     2bdb:	48 89 f8             	mov    %rdi,%rax
2bde     2bde:	48 89 f8             	mov    %rdi,%rax
2be1     2be1:	48 89 f8             	mov    %rdi,%rax
2be4     2be4:	48 89 f8             	mov    %rdi,%rax
2be7     2be7:	e9 00 00 00 00       	jmp    2bec <.altinstr_replacement+0x2bec>	2be8: R_X86_64_PC32	.text+0xd0d7ee
2bec     2bec:	e9 00 00 00 00       	jmp    2bf1 <.altinstr_replacement+0x2bf1>	2bed: R_X86_64_PC32	.text+0xd0e3ab
2bf1     2bf1:	e9 00 00 00 00       	jmp    2bf6 <.altinstr_replacement+0x2bf6>	2bf2: R_X86_64_PC32	.init.text+0x145833
2bf6     2bf6:	e9 00 00 00 00       	jmp    2bfb <.altinstr_replacement+0x2bfb>	2bf7: R_X86_64_PC32	.text+0xd10d94
2bfb     2bfb:	e9 00 00 00 00       	jmp    2c00 <.altinstr_replacement+0x2c00>	2bfc: R_X86_64_PC32	.text+0xd10e0a
2c00     2c00:	e9 00 00 00 00       	jmp    2c05 <.altinstr_replacement+0x2c05>	2c01: R_X86_64_PC32	.text+0xd10e74
2c05     2c05:	e9 00 00 00 00       	jmp    2c0a <.altinstr_replacement+0x2c0a>	2c06: R_X86_64_PC32	.text+0xd11380
2c0a     2c0a:	e9 00 00 00 00       	jmp    2c0f <.altinstr_replacement+0x2c0f>	2c0b: R_X86_64_PC32	.text+0xd1168e
2c0f     2c0f:	e9 00 00 00 00       	jmp    2c14 <.altinstr_replacement+0x2c14>	2c10: R_X86_64_PC32	.text+0xd11e97
2c14     2c14:	e9 00 00 00 00       	jmp    2c19 <.altinstr_replacement+0x2c19>	2c15: R_X86_64_PC32	.text+0xd11f95
2c19     2c19:	e9 00 00 00 00       	jmp    2c1e <.altinstr_replacement+0x2c1e>	2c1a: R_X86_64_PC32	.text+0xd13613
2c1e     2c1e:	e9 00 00 00 00       	jmp    2c23 <.altinstr_replacement+0x2c23>	2c1f: R_X86_64_PC32	.text+0xd14789
2c23     2c23:	e9 00 00 00 00       	jmp    2c28 <.altinstr_replacement+0x2c28>	2c24: R_X86_64_PC32	.text+0xd148c2
2c28     2c28:	e9 00 00 00 00       	jmp    2c2d <.altinstr_replacement+0x2c2d>	2c29: R_X86_64_PC32	.text+0xd14a02
2c2d     2c2d:	9c                   	pushf
2c2e     2c2e:	58                   	pop    %rax
2c2f     2c2f:	fa                   	cli
2c30     2c30:	9c                   	pushf
2c31     2c31:	58                   	pop    %rax
2c32     2c32:	fb                   	sti
2c33     2c33:	e8 00 00 00 00       	call   2c38 <.altinstr_replacement+0x2c38>	2c34: R_X86_64_PLT32	clear_page_rep-0x4
2c38     2c38:	e8 00 00 00 00       	call   2c3d <.altinstr_replacement+0x2c3d>	2c39: R_X86_64_PLT32	clear_page_erms-0x4
2c3d     2c3d:	e9 00 00 00 00       	jmp    2c42 <.altinstr_replacement+0x2c42>	2c3e: R_X86_64_PC32	.text+0xd19d16
2c42     2c42:	e9 00 00 00 00       	jmp    2c47 <.altinstr_replacement+0x2c47>	2c43: R_X86_64_PC32	.text+0xd1a5d6
2c47     2c47:	e8 00 00 00 00       	call   2c4c <.altinstr_replacement+0x2c4c>	2c48: R_X86_64_PLT32	clear_page_rep-0x4
2c4c     2c4c:	e8 00 00 00 00       	call   2c51 <.altinstr_replacement+0x2c51>	2c4d: R_X86_64_PLT32	clear_page_erms-0x4
2c51     2c51:	e9 00 00 00 00       	jmp    2c56 <.altinstr_replacement+0x2c56>	2c52: R_X86_64_PC32	.text+0xd1ad4d
2c56     2c56:	e9 00 00 00 00       	jmp    2c5b <.altinstr_replacement+0x2c5b>	2c57: R_X86_64_PC32	.text+0xd1af67
2c5b     2c5b:	e9 00 00 00 00       	jmp    2c60 <.altinstr_replacement+0x2c60>	2c5c: R_X86_64_PC32	.text+0xd1ba3d
2c60     2c60:	e9 00 00 00 00       	jmp    2c65 <.altinstr_replacement+0x2c65>	2c61: R_X86_64_PC32	.text+0xd1c29c
2c65     2c65:	e9 00 00 00 00       	jmp    2c6a <.altinstr_replacement+0x2c6a>	2c66: R_X86_64_PC32	.text+0xd1c378
2c6a     2c6a:	e9 00 00 00 00       	jmp    2c6f <.altinstr_replacement+0x2c6f>	2c6b: R_X86_64_PC32	.text+0xd1c57b
2c6f     2c6f:	e9 00 00 00 00       	jmp    2c74 <.altinstr_replacement+0x2c74>	2c70: R_X86_64_PC32	.text+0xd1cb39
2c74     2c74:	41 0f 0d 0e          	prefetchw (%r14)
2c78     2c78:	0f 0d 0b             	prefetchw (%rbx)
2c7b     2c7b:	e9 00 00 00 00       	jmp    2c80 <.altinstr_replacement+0x2c80>	2c7c: R_X86_64_PC32	.text+0xd1d188
2c80     2c80:	e9 00 00 00 00       	jmp    2c85 <.altinstr_replacement+0x2c85>	2c81: R_X86_64_PC32	.text+0xd1d072
2c85     2c85:	e8 00 00 00 00       	call   2c8a <.altinstr_replacement+0x2c8a>	2c86: R_X86_64_PLT32	clear_page_rep-0x4
2c8a     2c8a:	e8 00 00 00 00       	call   2c8f <.altinstr_replacement+0x2c8f>	2c8b: R_X86_64_PLT32	clear_page_erms-0x4
2c8f     2c8f:	e9 00 00 00 00       	jmp    2c94 <.altinstr_replacement+0x2c94>	2c90: R_X86_64_PC32	.text+0xd1d7e3
2c94     2c94:	e9 00 00 00 00       	jmp    2c99 <.altinstr_replacement+0x2c99>	2c95: R_X86_64_PC32	.text+0xd1db7f
2c99     2c99:	e9 00 00 00 00       	jmp    2c9e <.altinstr_replacement+0x2c9e>	2c9a: R_X86_64_PC32	.text+0xd210aa
2c9e     2c9e:	e9 00 00 00 00       	jmp    2ca3 <.altinstr_replacement+0x2ca3>	2c9f: R_X86_64_PC32	.text+0xd2129e
2ca3     2ca3:	e8 00 00 00 00       	call   2ca8 <.altinstr_replacement+0x2ca8>	2ca4: R_X86_64_PLT32	clear_page_rep-0x4
2ca8     2ca8:	e8 00 00 00 00       	call   2cad <.altinstr_replacement+0x2cad>	2ca9: R_X86_64_PLT32	clear_page_erms-0x4
2cad     2cad:	9c                   	pushf
2cae     2cae:	58                   	pop    %rax
2caf     2caf:	fa                   	cli
2cb0     2cb0:	9c                   	pushf
2cb1     2cb1:	58                   	pop    %rax
2cb2     2cb2:	fb                   	sti
2cb3     2cb3:	e9 00 00 00 00       	jmp    2cb8 <.altinstr_replacement+0x2cb8>	2cb4: R_X86_64_PC32	.text+0xd2696a
2cb8     2cb8:	e9 00 00 00 00       	jmp    2cbd <.altinstr_replacement+0x2cbd>	2cb9: R_X86_64_PC32	.text+0xd26b27
2cbd     2cbd:	e9 00 00 00 00       	jmp    2cc2 <.altinstr_replacement+0x2cc2>	2cbe: R_X86_64_PC32	.text+0xd29f81
2cc2     2cc2:	e9 00 00 00 00       	jmp    2cc7 <.altinstr_replacement+0x2cc7>	2cc3: R_X86_64_PC32	.text+0xd29f8c
2cc7     2cc7:	e9 00 00 00 00       	jmp    2ccc <.altinstr_replacement+0x2ccc>	2cc8: R_X86_64_PC32	.text+0xd2aa70
2ccc     2ccc:	e9 00 00 00 00       	jmp    2cd1 <.altinstr_replacement+0x2cd1>	2ccd: R_X86_64_PC32	.text+0xd2abd4
2cd1     2cd1:	e9 00 00 00 00       	jmp    2cd6 <.altinstr_replacement+0x2cd6>	2cd2: R_X86_64_PC32	.text+0xd2b7d9
2cd6     2cd6:	e9 00 00 00 00       	jmp    2cdb <.altinstr_replacement+0x2cdb>	2cd7: R_X86_64_PC32	.text+0xd2b916
2cdb     2cdb:	e9 00 00 00 00       	jmp    2ce0 <.altinstr_replacement+0x2ce0>	2cdc: R_X86_64_PC32	.ref.text+0x5454
2ce0     2ce0:	e9 00 00 00 00       	jmp    2ce5 <.altinstr_replacement+0x2ce5>	2ce1: R_X86_64_PC32	.ref.text+0x545f
2ce5     2ce5:	e9 00 00 00 00       	jmp    2cea <.altinstr_replacement+0x2cea>	2ce6: R_X86_64_PC32	.text+0xd2d0df
2cea     2cea:	e9 00 00 00 00       	jmp    2cef <.altinstr_replacement+0x2cef>	2ceb: R_X86_64_PC32	.text+0xd2d965
2cef     2cef:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
2cf9     2cf9:	48 89 f8             	mov    %rdi,%rax
2cfc     2cfc:	48 89 f8             	mov    %rdi,%rax
2cff     2cff:	48 89 f8             	mov    %rdi,%rax
2d02     2d02:	48 89 f8             	mov    %rdi,%rax
2d05     2d05:	48 89 f8             	mov    %rdi,%rax
2d08     2d08:	48 89 f8             	mov    %rdi,%rax
2d0b     2d0b:	48 89 f8             	mov    %rdi,%rax
2d0e     2d0e:	48 89 f8             	mov    %rdi,%rax
2d11     2d11:	48 89 f8             	mov    %rdi,%rax
2d14     2d14:	48 89 f8             	mov    %rdi,%rax
2d17     2d17:	48 89 f8             	mov    %rdi,%rax
2d1a     2d1a:	48 89 f8             	mov    %rdi,%rax
2d1d     2d1d:	48 89 f8             	mov    %rdi,%rax
2d20     2d20:	48 89 f8             	mov    %rdi,%rax
2d23     2d23:	48 89 f8             	mov    %rdi,%rax
2d26     2d26:	48 89 f8             	mov    %rdi,%rax
2d29     2d29:	e9 00 00 00 00       	jmp    2d2e <.altinstr_replacement+0x2d2e>	2d2a: R_X86_64_PC32	.text+0xd4f204
2d2e     2d2e:	e9 00 00 00 00       	jmp    2d33 <.altinstr_replacement+0x2d33>	2d2f: R_X86_64_PC32	.text+0xd4f26b
2d33     2d33:	e9 00 00 00 00       	jmp    2d38 <.altinstr_replacement+0x2d38>	2d34: R_X86_64_PC32	.text+0xd4f49c
2d38     2d38:	48 89 f8             	mov    %rdi,%rax
2d3b     2d3b:	48 89 f8             	mov    %rdi,%rax
2d3e     2d3e:	48 89 f8             	mov    %rdi,%rax
2d41     2d41:	e9 00 00 00 00       	jmp    2d46 <.altinstr_replacement+0x2d46>	2d42: R_X86_64_PC32	.init.text+0x14981b
2d46     2d46:	9c                   	pushf
2d47     2d47:	58                   	pop    %rax
2d48     2d48:	fa                   	cli
2d49     2d49:	9c                   	pushf
2d4a     2d4a:	58                   	pop    %rax
2d4b     2d4b:	fb                   	sti
2d4c     2d4c:	48 89 f8             	mov    %rdi,%rax
2d4f     2d4f:	48 89 f8             	mov    %rdi,%rax
2d52     2d52:	e9 00 00 00 00       	jmp    2d57 <.altinstr_replacement+0x2d57>	2d53: R_X86_64_PC32	.text+0xd5f417
2d57     2d57:	e9 00 00 00 00       	jmp    2d5c <.altinstr_replacement+0x2d5c>	2d58: R_X86_64_PC32	.text+0xd5f476
2d5c     2d5c:	e9 00 00 00 00       	jmp    2d61 <.altinstr_replacement+0x2d61>	2d5d: R_X86_64_PC32	.text+0xd5f5a5
2d61     2d61:	48 89 f8             	mov    %rdi,%rax
2d64     2d64:	9c                   	pushf
2d65     2d65:	58                   	pop    %rax
2d66     2d66:	fa                   	cli
2d67     2d67:	9c                   	pushf
2d68     2d68:	58                   	pop    %rax
2d69     2d69:	fb                   	sti
2d6a     2d6a:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
2d74     2d74:	48 89 f8             	mov    %rdi,%rax
2d77     2d77:	48 89 f8             	mov    %rdi,%rax
2d7a     2d7a:	48 89 f8             	mov    %rdi,%rax
2d7d     2d7d:	48 89 f8             	mov    %rdi,%rax
2d80     2d80:	48 89 f8             	mov    %rdi,%rax
2d83     2d83:	48 89 f8             	mov    %rdi,%rax
2d86     2d86:	48 89 f8             	mov    %rdi,%rax
2d89     2d89:	48 89 f8             	mov    %rdi,%rax
2d8c     2d8c:	48 89 f8             	mov    %rdi,%rax
2d8f     2d8f:	e9 00 00 00 00       	jmp    2d94 <.altinstr_replacement+0x2d94>	2d90: R_X86_64_PC32	.text+0xd754ce
2d94     2d94:	48 89 f8             	mov    %rdi,%rax
2d97     2d97:	48 89 f8             	mov    %rdi,%rax
2d9a     2d9a:	48 89 f8             	mov    %rdi,%rax
2d9d     2d9d:	48 89 f8             	mov    %rdi,%rax
2da0     2da0:	48 89 f8             	mov    %rdi,%rax
2da3     2da3:	48 89 f8             	mov    %rdi,%rax
2da6     2da6:	e9 00 00 00 00       	jmp    2dab <.altinstr_replacement+0x2dab>	2da7: R_X86_64_PC32	.text+0xd79e69
2dab     2dab:	48 89 f8             	mov    %rdi,%rax
2dae     2dae:	48 89 f8             	mov    %rdi,%rax
2db1     2db1:	48 89 f8             	mov    %rdi,%rax
2db4     2db4:	48 89 f8             	mov    %rdi,%rax
2db7     2db7:	48 89 f8             	mov    %rdi,%rax
2dba     2dba:	48 89 f8             	mov    %rdi,%rax
2dbd     2dbd:	48 89 f8             	mov    %rdi,%rax
2dc0     2dc0:	48 89 f8             	mov    %rdi,%rax
2dc3     2dc3:	48 89 f8             	mov    %rdi,%rax
2dc6     2dc6:	48 89 f8             	mov    %rdi,%rax
2dc9     2dc9:	48 89 f8             	mov    %rdi,%rax
2dcc     2dcc:	48 89 f8             	mov    %rdi,%rax
2dcf     2dcf:	48 89 f8             	mov    %rdi,%rax
2dd2     2dd2:	e9 00 00 00 00       	jmp    2dd7 <.altinstr_replacement+0x2dd7>	2dd3: R_X86_64_PC32	.text+0xd81ea5
2dd7     2dd7:	48 89 f8             	mov    %rdi,%rax
2dda     2dda:	48 89 f8             	mov    %rdi,%rax
2ddd     2ddd:	48 89 f8             	mov    %rdi,%rax
2de0     2de0:	48 89 f8             	mov    %rdi,%rax
2de3     2de3:	48 89 f8             	mov    %rdi,%rax
2de6     2de6:	48 89 f8             	mov    %rdi,%rax
2de9     2de9:	48 89 f8             	mov    %rdi,%rax
2dec     2dec:	48 89 f8             	mov    %rdi,%rax
2def     2def:	48 89 f8             	mov    %rdi,%rax
2df2     2df2:	48 89 f8             	mov    %rdi,%rax
2df5     2df5:	48 89 f8             	mov    %rdi,%rax
2df8     2df8:	48 89 f8             	mov    %rdi,%rax
2dfb     2dfb:	48 89 f8             	mov    %rdi,%rax
2dfe     2dfe:	48 89 f8             	mov    %rdi,%rax
2e01     2e01:	48 89 f8             	mov    %rdi,%rax
2e04     2e04:	48 89 f8             	mov    %rdi,%rax
2e07     2e07:	0f 01 cb             	stac
2e0a     2e0a:	e8 00 00 00 00       	call   2e0f <.altinstr_replacement+0x2e0f>	2e0b: R_X86_64_PLT32	rep_stos_alternative-0x4
2e0f     2e0f:	0f 01 ca             	clac
2e12     2e12:	65 48 23 14 25 00 00 00 00 	and    %gs:0x0,%rdx	2e17: R_X86_64_32S	tlbstate_untag_mask
2e1b     2e1b:	48 89 f8             	mov    %rdi,%rax
2e1e     2e1e:	48 89 f8             	mov    %rdi,%rax
2e21     2e21:	48 89 f8             	mov    %rdi,%rax
2e24     2e24:	48 89 f8             	mov    %rdi,%rax
2e27     2e27:	48 89 f8             	mov    %rdi,%rax
2e2a     2e2a:	65 4c 23 34 25 00 00 00 00 	and    %gs:0x0,%r14	2e2f: R_X86_64_32S	tlbstate_untag_mask
2e33     2e33:	65 48 23 1c 25 00 00 00 00 	and    %gs:0x0,%rbx	2e38: R_X86_64_32S	tlbstate_untag_mask
2e3c     2e3c:	49 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r14
2e46     2e46:	e9 00 00 00 00       	jmp    2e4b <.altinstr_replacement+0x2e4b>	2e47: R_X86_64_PC32	.meminit.text+0x11d2f
2e4b     2e4b:	e9 00 00 00 00       	jmp    2e50 <.altinstr_replacement+0x2e50>	2e4c: R_X86_64_PC32	.init.text+0x150b97
2e50     2e50:	e9 00 00 00 00       	jmp    2e55 <.altinstr_replacement+0x2e55>	2e51: R_X86_64_PC32	.init.text+0x150d4d
2e55     2e55:	e9 00 00 00 00       	jmp    2e5a <.altinstr_replacement+0x2e5a>	2e56: R_X86_64_PC32	.text+0xd93329
2e5a     2e5a:	e9 00 00 00 00       	jmp    2e5f <.altinstr_replacement+0x2e5f>	2e5b: R_X86_64_PC32	.text+0xd9331e
2e5f     2e5f:	e9 00 00 00 00       	jmp    2e64 <.altinstr_replacement+0x2e64>	2e60: R_X86_64_PC32	.init.text+0x1511aa
2e64     2e64:	e9 00 00 00 00       	jmp    2e69 <.altinstr_replacement+0x2e69>	2e65: R_X86_64_PC32	.init.text+0x1511dc
2e69     2e69:	e9 00 00 00 00       	jmp    2e6e <.altinstr_replacement+0x2e6e>	2e6a: R_X86_64_PC32	.init.text+0x1511c4
2e6e     2e6e:	e9 00 00 00 00       	jmp    2e73 <.altinstr_replacement+0x2e73>	2e6f: R_X86_64_PC32	.init.text+0x15195a
2e73     2e73:	e9 00 00 00 00       	jmp    2e78 <.altinstr_replacement+0x2e78>	2e74: R_X86_64_PC32	.init.text+0x15199f
2e78     2e78:	e9 00 00 00 00       	jmp    2e7d <.altinstr_replacement+0x2e7d>	2e79: R_X86_64_PC32	.init.text+0x15194f
2e7d     2e7d:	e9 00 00 00 00       	jmp    2e82 <.altinstr_replacement+0x2e82>	2e7e: R_X86_64_PC32	.init.text+0x152066
2e82     2e82:	e9 00 00 00 00       	jmp    2e87 <.altinstr_replacement+0x2e87>	2e83: R_X86_64_PC32	.init.text+0x15207e
2e87     2e87:	e9 00 00 00 00       	jmp    2e8c <.altinstr_replacement+0x2e8c>	2e88: R_X86_64_PC32	.init.text+0x15202b
2e8c     2e8c:	e9 00 00 00 00       	jmp    2e91 <.altinstr_replacement+0x2e91>	2e8d: R_X86_64_PC32	.init.text+0x15261b
2e91     2e91:	e9 00 00 00 00       	jmp    2e96 <.altinstr_replacement+0x2e96>	2e92: R_X86_64_PC32	.init.text+0x152f9a
2e96     2e96:	e9 00 00 00 00       	jmp    2e9b <.altinstr_replacement+0x2e9b>	2e97: R_X86_64_PC32	.init.text+0x153117
2e9b     2e9b:	e9 00 00 00 00       	jmp    2ea0 <.altinstr_replacement+0x2ea0>	2e9c: R_X86_64_PC32	.init.text+0x152f82
2ea0     2ea0:	e9 00 00 00 00       	jmp    2ea5 <.altinstr_replacement+0x2ea5>	2ea1: R_X86_64_PC32	.init.text+0x152fa9
2ea5     2ea5:	e9 00 00 00 00       	jmp    2eaa <.altinstr_replacement+0x2eaa>	2ea6: R_X86_64_PC32	.init.text+0x152f3e
2eaa     2eaa:	e9 00 00 00 00       	jmp    2eaf <.altinstr_replacement+0x2eaf>	2eab: R_X86_64_PC32	.text+0xd93805
2eaf     2eaf:	e9 00 00 00 00       	jmp    2eb4 <.altinstr_replacement+0x2eb4>	2eb0: R_X86_64_PC32	.text+0xd9380f
2eb4     2eb4:	e9 00 00 00 00       	jmp    2eb9 <.altinstr_replacement+0x2eb9>	2eb5: R_X86_64_PC32	.text+0xd93a05
2eb9     2eb9:	e9 00 00 00 00       	jmp    2ebe <.altinstr_replacement+0x2ebe>	2eba: R_X86_64_PC32	.text+0xd93a0f
2ebe     2ebe:	e9 00 00 00 00       	jmp    2ec3 <.altinstr_replacement+0x2ec3>	2ebf: R_X86_64_PC32	.meminit.text+0x12203
2ec3     2ec3:	e9 00 00 00 00       	jmp    2ec8 <.altinstr_replacement+0x2ec8>	2ec4: R_X86_64_PC32	.meminit.text+0x127d6
2ec8     2ec8:	e9 00 00 00 00       	jmp    2ecd <.altinstr_replacement+0x2ecd>	2ec9: R_X86_64_PC32	.meminit.text+0x1285b
2ecd     2ecd:	e9 00 00 00 00       	jmp    2ed2 <.altinstr_replacement+0x2ed2>	2ece: R_X86_64_PC32	.text+0xd93be7
2ed2     2ed2:	e9 00 00 00 00       	jmp    2ed7 <.altinstr_replacement+0x2ed7>	2ed3: R_X86_64_PC32	.text+0xd93ce5
2ed7     2ed7:	48 89 f8             	mov    %rdi,%rax
2eda     2eda:	48 89 f8             	mov    %rdi,%rax
2edd     2edd:	48 89 f8             	mov    %rdi,%rax
2ee0     2ee0:	48 89 f8             	mov    %rdi,%rax
2ee3     2ee3:	48 89 f8             	mov    %rdi,%rax
2ee6     2ee6:	48 89 f8             	mov    %rdi,%rax
2ee9     2ee9:	48 89 f8             	mov    %rdi,%rax
2eec     2eec:	e9 00 00 00 00       	jmp    2ef1 <.altinstr_replacement+0x2ef1>	2eed: R_X86_64_PC32	.text+0xd944df
2ef1     2ef1:	e9 00 00 00 00       	jmp    2ef6 <.altinstr_replacement+0x2ef6>	2ef2: R_X86_64_PC32	.text+0xd9450d
2ef6     2ef6:	48 89 f8             	mov    %rdi,%rax
2ef9     2ef9:	48 89 f8             	mov    %rdi,%rax
2efc     2efc:	48 89 f8             	mov    %rdi,%rax
2eff     2eff:	48 89 f8             	mov    %rdi,%rax
2f02     2f02:	48 89 f8             	mov    %rdi,%rax
2f05     2f05:	48 89 f8             	mov    %rdi,%rax
2f08     2f08:	48 89 f8             	mov    %rdi,%rax
2f0b     2f0b:	e9 00 00 00 00       	jmp    2f10 <.altinstr_replacement+0x2f10>	2f0c: R_X86_64_PC32	.meminit.text+0x14bd7
2f10     2f10:	48 89 f8             	mov    %rdi,%rax
2f13     2f13:	48 89 f8             	mov    %rdi,%rax
2f16     2f16:	48 89 f8             	mov    %rdi,%rax
2f19     2f19:	e9 00 00 00 00       	jmp    2f1e <.altinstr_replacement+0x2f1e>	2f1a: R_X86_64_PC32	.text+0xd9be57
2f1e     2f1e:	e9 00 00 00 00       	jmp    2f23 <.altinstr_replacement+0x2f23>	2f1f: R_X86_64_PC32	.text+0xd9beb6
2f23     2f23:	48 89 f8             	mov    %rdi,%rax
2f26     2f26:	48 89 f8             	mov    %rdi,%rax
2f29     2f29:	48 89 f8             	mov    %rdi,%rax
2f2c     2f2c:	48 89 f8             	mov    %rdi,%rax
2f2f     2f2f:	48 89 f8             	mov    %rdi,%rax
2f32     2f32:	48 89 f8             	mov    %rdi,%rax
2f35     2f35:	9c                   	pushf
2f36     2f36:	58                   	pop    %rax
2f37     2f37:	fa                   	cli
2f38     2f38:	9c                   	pushf
2f39     2f39:	58                   	pop    %rax
2f3a     2f3a:	fb                   	sti
2f3b     2f3b:	9c                   	pushf
2f3c     2f3c:	58                   	pop    %rax
2f3d     2f3d:	48 89 f8             	mov    %rdi,%rax
2f40     2f40:	48 89 f8             	mov    %rdi,%rax
2f43     2f43:	48 89 f8             	mov    %rdi,%rax
2f46     2f46:	48 89 f8             	mov    %rdi,%rax
2f49     2f49:	9c                   	pushf
2f4a     2f4a:	58                   	pop    %rax
2f4b     2f4b:	fa                   	cli
2f4c     2f4c:	9c                   	pushf
2f4d     2f4d:	58                   	pop    %rax
2f4e     2f4e:	fb                   	sti
2f4f     2f4f:	48 89 f8             	mov    %rdi,%rax
2f52     2f52:	48 89 f8             	mov    %rdi,%rax
2f55     2f55:	48 89 f8             	mov    %rdi,%rax
2f58     2f58:	48 89 f8             	mov    %rdi,%rax
2f5b     2f5b:	e9 00 00 00 00       	jmp    2f60 <.altinstr_replacement+0x2f60>	2f5c: R_X86_64_PC32	.text+0xdc45b7
2f60     2f60:	48 89 f8             	mov    %rdi,%rax
2f63     2f63:	e9 00 00 00 00       	jmp    2f68 <.altinstr_replacement+0x2f68>	2f64: R_X86_64_PC32	.text+0xdc4728
2f68     2f68:	fb                   	sti
2f69     2f69:	48 89 f8             	mov    %rdi,%rax
2f6c     2f6c:	48 89 f8             	mov    %rdi,%rax
2f6f     2f6f:	e9 00 00 00 00       	jmp    2f74 <.altinstr_replacement+0x2f74>	2f70: R_X86_64_PC32	.text+0xdd3d97
2f74     2f74:	e9 00 00 00 00       	jmp    2f79 <.altinstr_replacement+0x2f79>	2f75: R_X86_64_PC32	.text+0xdd3df6
2f79     2f79:	e9 00 00 00 00       	jmp    2f7e <.altinstr_replacement+0x2f7e>	2f7a: R_X86_64_PC32	.text+0xdd3ec2
2f7e     2f7e:	e9 00 00 00 00       	jmp    2f83 <.altinstr_replacement+0x2f83>	2f7f: R_X86_64_PC32	.text+0xdd3f5a
2f83     2f83:	48 89 f8             	mov    %rdi,%rax
2f86     2f86:	48 89 f8             	mov    %rdi,%rax
2f89     2f89:	48 89 f8             	mov    %rdi,%rax
2f8c     2f8c:	48 89 f8             	mov    %rdi,%rax
2f8f     2f8f:	48 89 f8             	mov    %rdi,%rax
2f92     2f92:	48 89 f8             	mov    %rdi,%rax
2f95     2f95:	48 89 f8             	mov    %rdi,%rax
2f98     2f98:	48 89 f8             	mov    %rdi,%rax
2f9b     2f9b:	48 89 f8             	mov    %rdi,%rax
2f9e     2f9e:	48 89 f8             	mov    %rdi,%rax
2fa1     2fa1:	e9 00 00 00 00       	jmp    2fa6 <.altinstr_replacement+0x2fa6>	2fa2: R_X86_64_PC32	.text+0xdd9923
2fa6     2fa6:	e9 00 00 00 00       	jmp    2fab <.altinstr_replacement+0x2fab>	2fa7: R_X86_64_PC32	.text+0xdd9950
2fab     2fab:	48 89 f8             	mov    %rdi,%rax
2fae     2fae:	48 89 f8             	mov    %rdi,%rax
2fb1     2fb1:	48 89 f8             	mov    %rdi,%rax
2fb4     2fb4:	48 89 f8             	mov    %rdi,%rax
2fb7     2fb7:	48 89 f8             	mov    %rdi,%rax
2fba     2fba:	48 89 f8             	mov    %rdi,%rax
2fbd     2fbd:	48 89 f8             	mov    %rdi,%rax
2fc0     2fc0:	48 89 f8             	mov    %rdi,%rax
2fc3     2fc3:	48 89 f8             	mov    %rdi,%rax
2fc6     2fc6:	48 89 f8             	mov    %rdi,%rax
2fc9     2fc9:	48 89 f8             	mov    %rdi,%rax
2fcc     2fcc:	e9 00 00 00 00       	jmp    2fd1 <.altinstr_replacement+0x2fd1>	2fcd: R_X86_64_PC32	.text+0xdddcd7
2fd1     2fd1:	e9 00 00 00 00       	jmp    2fd6 <.altinstr_replacement+0x2fd6>	2fd2: R_X86_64_PC32	.text+0xdddd36
2fd6     2fd6:	9c                   	pushf
2fd7     2fd7:	58                   	pop    %rax
2fd8     2fd8:	fa                   	cli
2fd9     2fd9:	9c                   	pushf
2fda     2fda:	58                   	pop    %rax
2fdb     2fdb:	fb                   	sti
2fdc     2fdc:	9c                   	pushf
2fdd     2fdd:	58                   	pop    %rax
2fde     2fde:	fa                   	cli
2fdf     2fdf:	9c                   	pushf
2fe0     2fe0:	58                   	pop    %rax
2fe1     2fe1:	fb                   	sti
2fe2     2fe2:	e9 00 00 00 00       	jmp    2fe7 <.altinstr_replacement+0x2fe7>	2fe3: R_X86_64_PC32	.text+0xddffba
2fe7     2fe7:	e9 00 00 00 00       	jmp    2fec <.altinstr_replacement+0x2fec>	2fe8: R_X86_64_PC32	.text+0xde00ba
2fec     2fec:	48 89 f8             	mov    %rdi,%rax
2fef     2fef:	48 89 f8             	mov    %rdi,%rax
2ff2     2ff2:	48 89 f8             	mov    %rdi,%rax
2ff5     2ff5:	48 89 f8             	mov    %rdi,%rax
2ff8     2ff8:	48 89 f8             	mov    %rdi,%rax
2ffb     2ffb:	48 89 f8             	mov    %rdi,%rax
2ffe     2ffe:	48 89 f8             	mov    %rdi,%rax
3001     3001:	48 89 f8             	mov    %rdi,%rax
3004     3004:	48 89 f8             	mov    %rdi,%rax
3007     3007:	48 89 f8             	mov    %rdi,%rax
300a     300a:	48 89 f8             	mov    %rdi,%rax
300d     300d:	fb                   	sti
300e     300e:	48 89 f8             	mov    %rdi,%rax
3011     3011:	48 89 f8             	mov    %rdi,%rax
3014     3014:	e9 00 00 00 00       	jmp    3019 <.altinstr_replacement+0x3019>	3015: R_X86_64_PC32	.text+0xde8f8d
3019     3019:	e9 00 00 00 00       	jmp    301e <.altinstr_replacement+0x301e>	301a: R_X86_64_PC32	.text+0xde8f9c
301e     301e:	48 89 f8             	mov    %rdi,%rax
3021     3021:	48 89 f8             	mov    %rdi,%rax
3024     3024:	48 89 f8             	mov    %rdi,%rax
3027     3027:	48 89 f8             	mov    %rdi,%rax
302a     302a:	48 89 f8             	mov    %rdi,%rax
302d     302d:	48 89 f8             	mov    %rdi,%rax
3030     3030:	48 89 f8             	mov    %rdi,%rax
3033     3033:	48 89 f8             	mov    %rdi,%rax
3036     3036:	48 89 f8             	mov    %rdi,%rax
3039     3039:	48 89 f8             	mov    %rdi,%rax
303c     303c:	48 89 f8             	mov    %rdi,%rax
303f     303f:	48 89 f8             	mov    %rdi,%rax
3042     3042:	48 89 f8             	mov    %rdi,%rax
3045     3045:	48 89 f8             	mov    %rdi,%rax
3048     3048:	48 89 f8             	mov    %rdi,%rax
304b     304b:	48 89 f8             	mov    %rdi,%rax
304e     304e:	48 89 f8             	mov    %rdi,%rax
3051     3051:	48 89 f8             	mov    %rdi,%rax
3054     3054:	9c                   	pushf
3055     3055:	58                   	pop    %rax
3056     3056:	fa                   	cli
3057     3057:	fb                   	sti
3058     3058:	e9 00 00 00 00       	jmp    305d <.altinstr_replacement+0x305d>	3059: R_X86_64_PC32	.text+0xdf6d98
305d     305d:	e9 00 00 00 00       	jmp    3062 <.altinstr_replacement+0x3062>	305e: R_X86_64_PC32	.text+0xdf6d8c
3062     3062:	e9 00 00 00 00       	jmp    3067 <.altinstr_replacement+0x3067>	3063: R_X86_64_PC32	.text+0xdf7700
3067     3067:	e9 00 00 00 00       	jmp    306c <.altinstr_replacement+0x306c>	3068: R_X86_64_PC32	.text+0xdf7881
306c     306c:	9c                   	pushf
306d     306d:	58                   	pop    %rax
306e     306e:	fa                   	cli
306f     306f:	9c                   	pushf
3070     3070:	58                   	pop    %rax
3071     3071:	fb                   	sti
3072     3072:	9c                   	pushf
3073     3073:	58                   	pop    %rax
3074     3074:	fa                   	cli
3075     3075:	9c                   	pushf
3076     3076:	58                   	pop    %rax
3077     3077:	fb                   	sti
3078     3078:	48 89 f8             	mov    %rdi,%rax
307b     307b:	48 89 f8             	mov    %rdi,%rax
307e     307e:	48 89 f8             	mov    %rdi,%rax
3081     3081:	48 89 f8             	mov    %rdi,%rax
3084     3084:	48 89 f8             	mov    %rdi,%rax
3087     3087:	48 89 f8             	mov    %rdi,%rax
308a     308a:	48 89 f8             	mov    %rdi,%rax
308d     308d:	48 89 f8             	mov    %rdi,%rax
3090     3090:	48 89 f8             	mov    %rdi,%rax
3093     3093:	48 89 f8             	mov    %rdi,%rax
3096     3096:	e8 00 00 00 00       	call   309b <.altinstr_replacement+0x309b>	3097: R_X86_64_PLT32	clear_page_rep-0x4
309b     309b:	e8 00 00 00 00       	call   30a0 <.altinstr_replacement+0x30a0>	309c: R_X86_64_PLT32	clear_page_erms-0x4
30a0     30a0:	48 89 f8             	mov    %rdi,%rax
30a3     30a3:	48 89 f8             	mov    %rdi,%rax
30a6     30a6:	48 89 f8             	mov    %rdi,%rax
30a9     30a9:	48 89 f8             	mov    %rdi,%rax
30ac     30ac:	48 89 f8             	mov    %rdi,%rax
30af     30af:	48 89 f8             	mov    %rdi,%rax
30b2     30b2:	48 89 f8             	mov    %rdi,%rax
30b5     30b5:	48 89 f8             	mov    %rdi,%rax
30b8     30b8:	e8 00 00 00 00       	call   30bd <.altinstr_replacement+0x30bd>	30b9: R_X86_64_PLT32	clear_page_rep-0x4
30bd     30bd:	e8 00 00 00 00       	call   30c2 <.altinstr_replacement+0x30c2>	30be: R_X86_64_PLT32	clear_page_erms-0x4
30c2     30c2:	e8 00 00 00 00       	call   30c7 <.altinstr_replacement+0x30c7>	30c3: R_X86_64_PLT32	clear_page_rep-0x4
30c7     30c7:	e8 00 00 00 00       	call   30cc <.altinstr_replacement+0x30cc>	30c8: R_X86_64_PLT32	clear_page_erms-0x4
30cc     30cc:	9c                   	pushf
30cd     30cd:	58                   	pop    %rax
30ce     30ce:	48 89 f8             	mov    %rdi,%rax
30d1     30d1:	e9 00 00 00 00       	jmp    30d6 <.altinstr_replacement+0x30d6>	30d2: R_X86_64_PC32	.text+0xe11710
30d6     30d6:	e9 00 00 00 00       	jmp    30db <.altinstr_replacement+0x30db>	30d7: R_X86_64_PC32	.text+0xe11752
30db     30db:	9c                   	pushf
30dc     30dc:	58                   	pop    %rax
30dd     30dd:	fa                   	cli
30de     30de:	9c                   	pushf
30df     30df:	58                   	pop    %rax
30e0     30e0:	fb                   	sti
30e1     30e1:	48 89 f8             	mov    %rdi,%rax
30e4     30e4:	48 89 f8             	mov    %rdi,%rax
30e7     30e7:	48 89 f8             	mov    %rdi,%rax
30ea     30ea:	48 89 f8             	mov    %rdi,%rax
30ed     30ed:	48 89 f8             	mov    %rdi,%rax
30f0     30f0:	9c                   	pushf
30f1     30f1:	58                   	pop    %rax
30f2     30f2:	fa                   	cli
30f3     30f3:	9c                   	pushf
30f4     30f4:	58                   	pop    %rax
30f5     30f5:	fb                   	sti
30f6     30f6:	9c                   	pushf
30f7     30f7:	58                   	pop    %rax
30f8     30f8:	fa                   	cli
30f9     30f9:	9c                   	pushf
30fa     30fa:	58                   	pop    %rax
30fb     30fb:	fb                   	sti
30fc     30fc:	9c                   	pushf
30fd     30fd:	58                   	pop    %rax
30fe     30fe:	fa                   	cli
30ff     30ff:	9c                   	pushf
3100     3100:	58                   	pop    %rax
3101     3101:	fb                   	sti
3102     3102:	9c                   	pushf
3103     3103:	58                   	pop    %rax
3104     3104:	9c                   	pushf
3105     3105:	58                   	pop    %rax
3106     3106:	fa                   	cli
3107     3107:	9c                   	pushf
3108     3108:	58                   	pop    %rax
3109     3109:	fb                   	sti
310a     310a:	9c                   	pushf
310b     310b:	58                   	pop    %rax
310c     310c:	fa                   	cli
310d     310d:	9c                   	pushf
310e     310e:	58                   	pop    %rax
310f     310f:	fb                   	sti
3110     3110:	9c                   	pushf
3111     3111:	58                   	pop    %rax
3112     3112:	fa                   	cli
3113     3113:	9c                   	pushf
3114     3114:	58                   	pop    %rax
3115     3115:	fb                   	sti
3116     3116:	9c                   	pushf
3117     3117:	58                   	pop    %rax
3118     3118:	fa                   	cli
3119     3119:	9c                   	pushf
311a     311a:	58                   	pop    %rax
311b     311b:	fb                   	sti
311c     311c:	9c                   	pushf
311d     311d:	58                   	pop    %rax
311e     311e:	fa                   	cli
311f     311f:	9c                   	pushf
3120     3120:	58                   	pop    %rax
3121     3121:	fb                   	sti
3122     3122:	9c                   	pushf
3123     3123:	58                   	pop    %rax
3124     3124:	fa                   	cli
3125     3125:	fb                   	sti
3126     3126:	48 89 f8             	mov    %rdi,%rax
3129     3129:	48 89 f8             	mov    %rdi,%rax
312c     312c:	9c                   	pushf
312d     312d:	58                   	pop    %rax
312e     312e:	fa                   	cli
312f     312f:	fb                   	sti
3130     3130:	9c                   	pushf
3131     3131:	58                   	pop    %rax
3132     3132:	fa                   	cli
3133     3133:	9c                   	pushf
3134     3134:	58                   	pop    %rax
3135     3135:	fb                   	sti
3136     3136:	9c                   	pushf
3137     3137:	58                   	pop    %rax
3138     3138:	fa                   	cli
3139     3139:	9c                   	pushf
313a     313a:	58                   	pop    %rax
313b     313b:	fb                   	sti
313c     313c:	e9 00 00 00 00       	jmp    3141 <.altinstr_replacement+0x3141>	313d: R_X86_64_PC32	.text+0xe365e5
3141     3141:	48 89 f8             	mov    %rdi,%rax
3144     3144:	e9 00 00 00 00       	jmp    3149 <.altinstr_replacement+0x3149>	3145: R_X86_64_PC32	.text+0xe36697
3149     3149:	e9 00 00 00 00       	jmp    314e <.altinstr_replacement+0x314e>	314a: R_X86_64_PC32	.text+0xe366f6
314e     314e:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
3158     3158:	48 89 f8             	mov    %rdi,%rax
315b     315b:	48 89 f8             	mov    %rdi,%rax
315e     315e:	e9 00 00 00 00       	jmp    3163 <.altinstr_replacement+0x3163>	315f: R_X86_64_PC32	.text+0xe3933c
3163     3163:	48 89 f8             	mov    %rdi,%rax
3166     3166:	48 89 f8             	mov    %rdi,%rax
3169     3169:	48 89 f8             	mov    %rdi,%rax
316c     316c:	48 89 f8             	mov    %rdi,%rax
316f     316f:	48 89 f8             	mov    %rdi,%rax
3172     3172:	48 89 f8             	mov    %rdi,%rax
3175     3175:	48 89 f8             	mov    %rdi,%rax
3178     3178:	e9 00 00 00 00       	jmp    317d <.altinstr_replacement+0x317d>	3179: R_X86_64_PC32	.text+0xe3e583
317d     317d:	e9 00 00 00 00       	jmp    3182 <.altinstr_replacement+0x3182>	317e: R_X86_64_PC32	.text+0xe3e458
3182     3182:	e9 00 00 00 00       	jmp    3187 <.altinstr_replacement+0x3187>	3183: R_X86_64_PC32	.text+0xe45120
3187     3187:	e9 00 00 00 00       	jmp    318c <.altinstr_replacement+0x318c>	3188: R_X86_64_PC32	.text+0xe45540
318c     318c:	e9 00 00 00 00       	jmp    3191 <.altinstr_replacement+0x3191>	318d: R_X86_64_PC32	.text+0xe46396
3191     3191:	e9 00 00 00 00       	jmp    3196 <.altinstr_replacement+0x3196>	3192: R_X86_64_PC32	.text+0xe46257
3196     3196:	e9 00 00 00 00       	jmp    319b <.altinstr_replacement+0x319b>	3197: R_X86_64_PC32	.text+0xe46d60
319b     319b:	e9 00 00 00 00       	jmp    31a0 <.altinstr_replacement+0x31a0>	319c: R_X86_64_PC32	.text+0xe46c3a
31a0     31a0:	9c                   	pushf
31a1     31a1:	58                   	pop    %rax
31a2     31a2:	fa                   	cli
31a3     31a3:	9c                   	pushf
31a4     31a4:	58                   	pop    %rax
31a5     31a5:	fb                   	sti
31a6     31a6:	e9 00 00 00 00       	jmp    31ab <.altinstr_replacement+0x31ab>	31a7: R_X86_64_PC32	.init.text+0x1586fd
31ab     31ab:	e9 00 00 00 00       	jmp    31b0 <.altinstr_replacement+0x31b0>	31ac: R_X86_64_PC32	.init.text+0x15874f
31b0     31b0:	e9 00 00 00 00       	jmp    31b5 <.altinstr_replacement+0x31b5>	31b1: R_X86_64_PC32	.init.text+0x159214
31b5     31b5:	48 89 f8             	mov    %rdi,%rax
31b8     31b8:	48 89 f8             	mov    %rdi,%rax
31bb     31bb:	48 89 f8             	mov    %rdi,%rax
31be     31be:	48 89 f8             	mov    %rdi,%rax
31c1     31c1:	48 89 f8             	mov    %rdi,%rax
31c4     31c4:	48 89 f8             	mov    %rdi,%rax
31c7     31c7:	48 89 f8             	mov    %rdi,%rax
31ca     31ca:	e9 00 00 00 00       	jmp    31cf <.altinstr_replacement+0x31cf>	31cb: R_X86_64_PC32	.init.text+0x15c901
31cf     31cf:	48 89 f8             	mov    %rdi,%rax
31d2     31d2:	48 89 f8             	mov    %rdi,%rax
31d5     31d5:	e9 00 00 00 00       	jmp    31da <.altinstr_replacement+0x31da>	31d6: R_X86_64_PC32	.init.text+0x15c97b
31da     31da:	e9 00 00 00 00       	jmp    31df <.altinstr_replacement+0x31df>	31db: R_X86_64_PC32	.init.text+0x15ca17
31df     31df:	e9 00 00 00 00       	jmp    31e4 <.altinstr_replacement+0x31e4>	31e0: R_X86_64_PC32	.init.text+0x15c9fb
31e4     31e4:	48 89 f8             	mov    %rdi,%rax
31e7     31e7:	48 89 f8             	mov    %rdi,%rax
31ea     31ea:	e9 00 00 00 00       	jmp    31ef <.altinstr_replacement+0x31ef>	31eb: R_X86_64_PC32	.text+0xe4b7a0
31ef     31ef:	e9 00 00 00 00       	jmp    31f4 <.altinstr_replacement+0x31f4>	31f0: R_X86_64_PC32	.text+0xe4b7d0
31f4     31f4:	48 89 f8             	mov    %rdi,%rax
31f7     31f7:	48 89 f8             	mov    %rdi,%rax
31fa     31fa:	48 89 f8             	mov    %rdi,%rax
31fd     31fd:	48 89 f8             	mov    %rdi,%rax
3200     3200:	48 89 f8             	mov    %rdi,%rax
3203     3203:	48 89 f8             	mov    %rdi,%rax
3206     3206:	48 89 f8             	mov    %rdi,%rax
3209     3209:	48 89 f8             	mov    %rdi,%rax
320c     320c:	48 89 f8             	mov    %rdi,%rax
320f     320f:	e9 00 00 00 00       	jmp    3214 <.altinstr_replacement+0x3214>	3210: R_X86_64_PC32	.init.text+0x15de1b
3214     3214:	e9 00 00 00 00       	jmp    3219 <.altinstr_replacement+0x3219>	3215: R_X86_64_PC32	.init.text+0x15de99
3219     3219:	e9 00 00 00 00       	jmp    321e <.altinstr_replacement+0x321e>	321a: R_X86_64_PC32	.init.text+0x15df9e
321e     321e:	e9 00 00 00 00       	jmp    3223 <.altinstr_replacement+0x3223>	321f: R_X86_64_PC32	.init.text+0x15df75
3223     3223:	48 89 f8             	mov    %rdi,%rax
3226     3226:	48 89 f8             	mov    %rdi,%rax
3229     3229:	48 89 f8             	mov    %rdi,%rax
322c     322c:	48 89 f8             	mov    %rdi,%rax
322f     322f:	48 89 f8             	mov    %rdi,%rax
3232     3232:	48 89 f8             	mov    %rdi,%rax
3235     3235:	48 89 f8             	mov    %rdi,%rax
3238     3238:	48 89 f8             	mov    %rdi,%rax
323b     323b:	e9 00 00 00 00       	jmp    3240 <.altinstr_replacement+0x3240>	323c: R_X86_64_PC32	.init.text+0x15fae3
3240     3240:	e9 00 00 00 00       	jmp    3245 <.altinstr_replacement+0x3245>	3241: R_X86_64_PC32	.init.text+0x15faf9
3245     3245:	48 89 f8             	mov    %rdi,%rax
3248     3248:	e9 00 00 00 00       	jmp    324d <.altinstr_replacement+0x324d>	3249: R_X86_64_PC32	.init.text+0x15fb0b
324d     324d:	48 89 f8             	mov    %rdi,%rax
3250     3250:	48 89 f8             	mov    %rdi,%rax
3253     3253:	48 89 f8             	mov    %rdi,%rax
3256     3256:	48 89 f8             	mov    %rdi,%rax
3259     3259:	48 89 f8             	mov    %rdi,%rax
325c     325c:	48 89 f8             	mov    %rdi,%rax
325f     325f:	49 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r14
3269     3269:	48 89 f8             	mov    %rdi,%rax
326c     326c:	48 89 f8             	mov    %rdi,%rax
326f     326f:	48 89 f8             	mov    %rdi,%rax
3272     3272:	48 89 f8             	mov    %rdi,%rax
3275     3275:	48 89 f8             	mov    %rdi,%rax
3278     3278:	48 89 f8             	mov    %rdi,%rax
327b     327b:	48 89 f8             	mov    %rdi,%rax
327e     327e:	48 89 f8             	mov    %rdi,%rax
3281     3281:	48 89 f8             	mov    %rdi,%rax
3284     3284:	48 89 f8             	mov    %rdi,%rax
3287     3287:	48 89 f8             	mov    %rdi,%rax
328a     328a:	48 89 f8             	mov    %rdi,%rax
328d     328d:	48 89 f8             	mov    %rdi,%rax
3290     3290:	48 89 f8             	mov    %rdi,%rax
3293     3293:	48 89 f8             	mov    %rdi,%rax
3296     3296:	48 89 f8             	mov    %rdi,%rax
3299     3299:	48 89 f8             	mov    %rdi,%rax
329c     329c:	48 89 f8             	mov    %rdi,%rax
329f     329f:	48 89 f8             	mov    %rdi,%rax
32a2     32a2:	48 89 f8             	mov    %rdi,%rax
32a5     32a5:	e9 00 00 00 00       	jmp    32aa <.altinstr_replacement+0x32aa>	32a6: R_X86_64_PC32	.text+0xe4cf31
32aa     32aa:	e9 00 00 00 00       	jmp    32af <.altinstr_replacement+0x32af>	32ab: R_X86_64_PC32	.text+0xe4cda6
32af     32af:	e9 00 00 00 00       	jmp    32b4 <.altinstr_replacement+0x32b4>	32b0: R_X86_64_PC32	.text+0xe4d8f7
32b4     32b4:	e9 00 00 00 00       	jmp    32b9 <.altinstr_replacement+0x32b9>	32b5: R_X86_64_PC32	.text+0xe4d90d
32b9     32b9:	e9 00 00 00 00       	jmp    32be <.altinstr_replacement+0x32be>	32ba: R_X86_64_PC32	.text+0xe4d902
32be     32be:	e9 00 00 00 00       	jmp    32c3 <.altinstr_replacement+0x32c3>	32bf: R_X86_64_PC32	.text+0xe4d91f
32c3     32c3:	e9 00 00 00 00       	jmp    32c8 <.altinstr_replacement+0x32c8>	32c4: R_X86_64_PC32	.init.text+0x165348
32c8     32c8:	e9 00 00 00 00       	jmp    32cd <.altinstr_replacement+0x32cd>	32c9: R_X86_64_PC32	.init.text+0x164fdd
32cd     32cd:	e9 00 00 00 00       	jmp    32d2 <.altinstr_replacement+0x32d2>	32ce: R_X86_64_PC32	.init.text+0x1650fb
32d2     32d2:	e9 00 00 00 00       	jmp    32d7 <.altinstr_replacement+0x32d7>	32d3: R_X86_64_PC32	.init.text+0x1653f4
32d7     32d7:	e9 00 00 00 00       	jmp    32dc <.altinstr_replacement+0x32dc>	32d8: R_X86_64_PC32	.meminit.text+0x165dd
32dc     32dc:	e9 00 00 00 00       	jmp    32e1 <.altinstr_replacement+0x32e1>	32dd: R_X86_64_PC32	.text+0xe6a32a
32e1     32e1:	e9 00 00 00 00       	jmp    32e6 <.altinstr_replacement+0x32e6>	32e2: R_X86_64_PC32	.meminit.text+0x16ce0
32e6     32e6:	e9 00 00 00 00       	jmp    32eb <.altinstr_replacement+0x32eb>	32e7: R_X86_64_PC32	.text+0xe6a612
32eb     32eb:	e9 00 00 00 00       	jmp    32f0 <.altinstr_replacement+0x32f0>	32ec: R_X86_64_PC32	.init.text+0x167048
32f0     32f0:	e9 00 00 00 00       	jmp    32f5 <.altinstr_replacement+0x32f5>	32f1: R_X86_64_PC32	.init.text+0x16719f
32f5     32f5:	e9 00 00 00 00       	jmp    32fa <.altinstr_replacement+0x32fa>	32f6: R_X86_64_PC32	.text+0xe6ab83
32fa     32fa:	e9 00 00 00 00       	jmp    32ff <.altinstr_replacement+0x32ff>	32fb: R_X86_64_PC32	.text+0xe6aa5b
32ff     32ff:	e9 00 00 00 00       	jmp    3304 <.altinstr_replacement+0x3304>	3300: R_X86_64_PC32	.text+0xe6b3ff
3304     3304:	e9 00 00 00 00       	jmp    3309 <.altinstr_replacement+0x3309>	3305: R_X86_64_PC32	.text+0xe6b2d7
3309     3309:	48 89 f8             	mov    %rdi,%rax
330c     330c:	48 89 f8             	mov    %rdi,%rax
330f     330f:	48 89 f8             	mov    %rdi,%rax
3312     3312:	48 89 f8             	mov    %rdi,%rax
3315     3315:	48 89 f8             	mov    %rdi,%rax
3318     3318:	48 89 f8             	mov    %rdi,%rax
331b     331b:	48 89 f8             	mov    %rdi,%rax
331e     331e:	48 89 f8             	mov    %rdi,%rax
3321     3321:	48 89 f8             	mov    %rdi,%rax
3324     3324:	48 89 f8             	mov    %rdi,%rax
3327     3327:	48 89 f8             	mov    %rdi,%rax
332a     332a:	48 89 f8             	mov    %rdi,%rax
332d     332d:	48 89 f8             	mov    %rdi,%rax
3330     3330:	48 89 f8             	mov    %rdi,%rax
3333     3333:	48 89 f8             	mov    %rdi,%rax
3336     3336:	48 89 f8             	mov    %rdi,%rax
3339     3339:	48 89 f8             	mov    %rdi,%rax
333c     333c:	48 89 f8             	mov    %rdi,%rax
333f     333f:	48 89 f8             	mov    %rdi,%rax
3342     3342:	48 89 f8             	mov    %rdi,%rax
3345     3345:	48 89 f8             	mov    %rdi,%rax
3348     3348:	48 89 f8             	mov    %rdi,%rax
334b     334b:	48 89 f8             	mov    %rdi,%rax
334e     334e:	e9 00 00 00 00       	jmp    3353 <.altinstr_replacement+0x3353>	334f: R_X86_64_PC32	.text+0xe6fbd7
3353     3353:	e9 00 00 00 00       	jmp    3358 <.altinstr_replacement+0x3358>	3354: R_X86_64_PC32	.text+0xe6fc6f
3358     3358:	48 89 f8             	mov    %rdi,%rax
335b     335b:	48 89 f8             	mov    %rdi,%rax
335e     335e:	48 89 f8             	mov    %rdi,%rax
3361     3361:	48 89 f8             	mov    %rdi,%rax
3364     3364:	48 89 f8             	mov    %rdi,%rax
3367     3367:	48 89 f8             	mov    %rdi,%rax
336a     336a:	48 89 f8             	mov    %rdi,%rax
336d     336d:	48 89 f8             	mov    %rdi,%rax
3370     3370:	48 89 f8             	mov    %rdi,%rax
3373     3373:	48 89 f8             	mov    %rdi,%rax
3376     3376:	48 89 f8             	mov    %rdi,%rax
3379     3379:	48 89 f8             	mov    %rdi,%rax
337c     337c:	48 89 f8             	mov    %rdi,%rax
337f     337f:	48 89 f8             	mov    %rdi,%rax
3382     3382:	48 89 f8             	mov    %rdi,%rax
3385     3385:	48 89 f8             	mov    %rdi,%rax
3388     3388:	48 89 f8             	mov    %rdi,%rax
338b     338b:	48 89 f8             	mov    %rdi,%rax
338e     338e:	48 89 f8             	mov    %rdi,%rax
3391     3391:	48 89 f8             	mov    %rdi,%rax
3394     3394:	48 89 f8             	mov    %rdi,%rax
3397     3397:	48 89 f8             	mov    %rdi,%rax
339a     339a:	48 89 f8             	mov    %rdi,%rax
339d     339d:	48 89 f8             	mov    %rdi,%rax
33a0     33a0:	48 89 f8             	mov    %rdi,%rax
33a3     33a3:	e9 00 00 00 00       	jmp    33a8 <.altinstr_replacement+0x33a8>	33a4: R_X86_64_PC32	.text+0xea4797
33a8     33a8:	e9 00 00 00 00       	jmp    33ad <.altinstr_replacement+0x33ad>	33a9: R_X86_64_PC32	.text+0xea47f6
33ad     33ad:	48 89 f8             	mov    %rdi,%rax
33b0     33b0:	48 89 f8             	mov    %rdi,%rax
33b3     33b3:	48 89 f8             	mov    %rdi,%rax
33b6     33b6:	48 89 f8             	mov    %rdi,%rax
33b9     33b9:	48 89 f8             	mov    %rdi,%rax
33bc     33bc:	48 89 f8             	mov    %rdi,%rax
33bf     33bf:	48 89 f8             	mov    %rdi,%rax
33c2     33c2:	48 89 f8             	mov    %rdi,%rax
33c5     33c5:	48 89 f8             	mov    %rdi,%rax
33c8     33c8:	48 89 f8             	mov    %rdi,%rax
33cb     33cb:	48 89 f8             	mov    %rdi,%rax
33ce     33ce:	48 89 f8             	mov    %rdi,%rax
33d1     33d1:	48 89 f8             	mov    %rdi,%rax
33d4     33d4:	48 89 f8             	mov    %rdi,%rax
33d7     33d7:	48 89 f8             	mov    %rdi,%rax
33da     33da:	48 89 f8             	mov    %rdi,%rax
33dd     33dd:	48 89 f8             	mov    %rdi,%rax
33e0     33e0:	48 89 f8             	mov    %rdi,%rax
33e3     33e3:	48 89 f8             	mov    %rdi,%rax
33e6     33e6:	48 89 f8             	mov    %rdi,%rax
33e9     33e9:	48 89 f8             	mov    %rdi,%rax
33ec     33ec:	48 89 f8             	mov    %rdi,%rax
33ef     33ef:	48 89 f8             	mov    %rdi,%rax
33f2     33f2:	48 89 f8             	mov    %rdi,%rax
33f5     33f5:	48 89 f8             	mov    %rdi,%rax
33f8     33f8:	48 89 f8             	mov    %rdi,%rax
33fb     33fb:	48 89 f8             	mov    %rdi,%rax
33fe     33fe:	48 89 f8             	mov    %rdi,%rax
3401     3401:	e9 00 00 00 00       	jmp    3406 <.altinstr_replacement+0x3406>	3402: R_X86_64_PC32	.init.text+0x169d8d
3406     3406:	e9 00 00 00 00       	jmp    340b <.altinstr_replacement+0x340b>	3407: R_X86_64_PC32	.init.text+0x169eb2
340b     340b:	e9 00 00 00 00       	jmp    3410 <.altinstr_replacement+0x3410>	340c: R_X86_64_PC32	.init.text+0x16a172
3410     3410:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
341a     341a:	9c                   	pushf
341b     341b:	58                   	pop    %rax
341c     341c:	fa                   	cli
341d     341d:	fb                   	sti
341e     341e:	49 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r14
3428     3428:	9c                   	pushf
3429     3429:	58                   	pop    %rax
342a     342a:	fa                   	cli
342b     342b:	9c                   	pushf
342c     342c:	58                   	pop    %rax
342d     342d:	fb                   	sti
342e     342e:	0f 01 cb             	stac
3431     3431:	0f ae e8             	lfence
3434     3434:	0f 01 ca             	clac
3437     3437:	0f 01 ca             	clac
343a     343a:	0f 01 cb             	stac
343d     343d:	0f ae e8             	lfence
3440     3440:	0f 01 ca             	clac
3443     3443:	0f 01 ca             	clac
3446     3446:	0f 01 cb             	stac
3449     3449:	0f ae e8             	lfence
344c     344c:	0f 01 ca             	clac
344f     344f:	0f 01 ca             	clac
3452     3452:	0f 01 cb             	stac
3455     3455:	0f ae e8             	lfence
3458     3458:	0f 01 ca             	clac
345b     345b:	0f 01 ca             	clac
345e     345e:	0f 01 cb             	stac
3461     3461:	0f ae e8             	lfence
3464     3464:	0f 01 ca             	clac
3467     3467:	0f 01 ca             	clac
346a     346a:	0f 01 cb             	stac
346d     346d:	0f ae e8             	lfence
3470     3470:	0f 01 ca             	clac
3473     3473:	0f 01 ca             	clac
3476     3476:	0f 01 cb             	stac
3479     3479:	0f ae e8             	lfence
347c     347c:	0f 01 ca             	clac
347f     347f:	0f 01 ca             	clac
3482     3482:	0f 01 cb             	stac
3485     3485:	0f ae e8             	lfence
3488     3488:	0f 01 ca             	clac
348b     348b:	0f 01 ca             	clac
348e     348e:	0f 01 cb             	stac
3491     3491:	0f ae e8             	lfence
3494     3494:	0f 01 ca             	clac
3497     3497:	0f 01 ca             	clac
349a     349a:	0f 01 cb             	stac
349d     349d:	0f ae e8             	lfence
34a0     34a0:	0f 01 ca             	clac
34a3     34a3:	0f 01 ca             	clac
34a6     34a6:	0f 01 cb             	stac
34a9     34a9:	e8 00 00 00 00       	call   34ae <.altinstr_replacement+0x34ae>	34aa: R_X86_64_PLT32	rep_movs_alternative-0x4
34ae     34ae:	0f 01 ca             	clac
34b1     34b1:	0f 01 cb             	stac
34b4     34b4:	e8 00 00 00 00       	call   34b9 <.altinstr_replacement+0x34b9>	34b5: R_X86_64_PLT32	rep_movs_alternative-0x4
34b9     34b9:	0f 01 ca             	clac
34bc     34bc:	0f 01 cb             	stac
34bf     34bf:	e8 00 00 00 00       	call   34c4 <.altinstr_replacement+0x34c4>	34c0: R_X86_64_PLT32	rep_movs_alternative-0x4
34c4     34c4:	0f 01 ca             	clac
34c7     34c7:	0f 01 cb             	stac
34ca     34ca:	0f ae e8             	lfence
34cd     34cd:	0f 01 ca             	clac
34d0     34d0:	0f 01 ca             	clac
34d3     34d3:	0f 01 cb             	stac
34d6     34d6:	0f ae e8             	lfence
34d9     34d9:	0f 01 ca             	clac
34dc     34dc:	0f 01 ca             	clac
34df     34df:	9c                   	pushf
34e0     34e0:	58                   	pop    %rax
34e1     34e1:	fa                   	cli
34e2     34e2:	9c                   	pushf
34e3     34e3:	58                   	pop    %rax
34e4     34e4:	fb                   	sti
34e5     34e5:	0f 0d 4b 40          	prefetchw 0x40(%rbx)
34e9     34e9:	9c                   	pushf
34ea     34ea:	58                   	pop    %rax
34eb     34eb:	fa                   	cli
34ec     34ec:	9c                   	pushf
34ed     34ed:	58                   	pop    %rax
34ee     34ee:	fb                   	sti
34ef     34ef:	f3 0f b8 c7          	popcnt %edi,%eax
34f3     34f3:	f3 0f b8 c7          	popcnt %edi,%eax
34f7     34f7:	9c                   	pushf
34f8     34f8:	58                   	pop    %rax
34f9     34f9:	fa                   	cli
34fa     34fa:	9c                   	pushf
34fb     34fb:	58                   	pop    %rax
34fc     34fc:	fb                   	sti
34fd     34fd:	9c                   	pushf
34fe     34fe:	58                   	pop    %rax
34ff     34ff:	9c                   	pushf
3500     3500:	58                   	pop    %rax
3501     3501:	fa                   	cli
3502     3502:	fb                   	sti
3503     3503:	9c                   	pushf
3504     3504:	58                   	pop    %rax
3505     3505:	9c                   	pushf
3506     3506:	58                   	pop    %rax
3507     3507:	fa                   	cli
3508     3508:	fb                   	sti
3509     3509:	fb                   	sti
350a     350a:	9c                   	pushf
350b     350b:	58                   	pop    %rax
350c     350c:	fa                   	cli
350d     350d:	fb                   	sti
350e     350e:	0f 0d 0b             	prefetchw (%rbx)
3511     3511:	0f 01 cb             	stac
3514     3514:	e8 00 00 00 00       	call   3519 <.altinstr_replacement+0x3519>	3515: R_X86_64_PLT32	rep_stos_alternative-0x4
3519     3519:	0f 01 ca             	clac
351c     351c:	0f 01 cb             	stac
351f     351f:	e8 00 00 00 00       	call   3524 <.altinstr_replacement+0x3524>	3520: R_X86_64_PLT32	rep_stos_alternative-0x4
3524     3524:	0f 01 ca             	clac
3527     3527:	e9 00 00 00 00       	jmp    352c <.altinstr_replacement+0x352c>	3528: R_X86_64_PC32	.text+0xfe7925
352c     352c:	48 89 f8             	mov    %rdi,%rax
352f     352f:	9c                   	pushf
3530     3530:	58                   	pop    %rax
3531     3531:	fa                   	cli
3532     3532:	9c                   	pushf
3533     3533:	58                   	pop    %rax
3534     3534:	fb                   	sti
3535     3535:	48 89 f8             	mov    %rdi,%rax
3538     3538:	48 89 f8             	mov    %rdi,%rax
353b     353b:	e9 00 00 00 00       	jmp    3540 <.altinstr_replacement+0x3540>	353c: R_X86_64_PC32	.text+0xfea778
3540     3540:	48 89 f8             	mov    %rdi,%rax
3543     3543:	48 89 f8             	mov    %rdi,%rax
3546     3546:	48 89 f8             	mov    %rdi,%rax
3549     3549:	48 89 f8             	mov    %rdi,%rax
354c     354c:	9c                   	pushf
354d     354d:	58                   	pop    %rax
354e     354e:	fa                   	cli
354f     354f:	9c                   	pushf
3550     3550:	58                   	pop    %rax
3551     3551:	fb                   	sti
3552     3552:	9c                   	pushf
3553     3553:	58                   	pop    %rax
3554     3554:	fa                   	cli
3555     3555:	9c                   	pushf
3556     3556:	58                   	pop    %rax
3557     3557:	fb                   	sti
3558     3558:	9c                   	pushf
3559     3559:	58                   	pop    %rax
355a     355a:	fa                   	cli
355b     355b:	9c                   	pushf
355c     355c:	58                   	pop    %rax
355d     355d:	fb                   	sti
355e     355e:	9c                   	pushf
355f     355f:	58                   	pop    %rax
3560     3560:	fa                   	cli
3561     3561:	9c                   	pushf
3562     3562:	58                   	pop    %rax
3563     3563:	fb                   	sti
3564     3564:	e8 00 00 00 00       	call   3569 <.altinstr_replacement+0x3569>	3565: R_X86_64_PLT32	clear_page_rep-0x4
3569     3569:	e8 00 00 00 00       	call   356e <.altinstr_replacement+0x356e>	356a: R_X86_64_PLT32	clear_page_erms-0x4
356e     356e:	48 89 f8             	mov    %rdi,%rax
3571     3571:	48 89 f8             	mov    %rdi,%rax
3574     3574:	48 89 f8             	mov    %rdi,%rax
3577     3577:	48 89 f8             	mov    %rdi,%rax
357a     357a:	48 89 f8             	mov    %rdi,%rax
357d     357d:	48 89 f8             	mov    %rdi,%rax
3580     3580:	48 89 f8             	mov    %rdi,%rax
3583     3583:	0f 01 cb             	stac
3586     3586:	e8 00 00 00 00       	call   358b <.altinstr_replacement+0x358b>	3587: R_X86_64_PLT32	rep_stos_alternative-0x4
358b     358b:	0f 01 ca             	clac
358e     358e:	49 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r15
3598     3598:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
35a2     35a2:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
35ac     35ac:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
35b6     35b6:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
35c0     35c0:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
35ca     35ca:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
35d4     35d4:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
35de     35de:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
35e8     35e8:	0f 01 cb             	stac
35eb     35eb:	e8 00 00 00 00       	call   35f0 <.altinstr_replacement+0x35f0>	35ec: R_X86_64_PLT32	rep_stos_alternative-0x4
35f0     35f0:	0f 01 ca             	clac
35f3     35f3:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
35fd     35fd:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
3607     3607:	0f 01 cb             	stac
360a     360a:	e8 00 00 00 00       	call   360f <.altinstr_replacement+0x360f>	360b: R_X86_64_PLT32	rep_stos_alternative-0x4
360f     360f:	0f 01 ca             	clac
3612     3612:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
361c     361c:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
3626     3626:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
3630     3630:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
363a     363a:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
3644     3644:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
364e     364e:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
3658     3658:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
3662     3662:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
366c     366c:	0f 01 cb             	stac
366f     366f:	e8 00 00 00 00       	call   3674 <.altinstr_replacement+0x3674>	3670: R_X86_64_PLT32	rep_stos_alternative-0x4
3674     3674:	0f 01 ca             	clac
3677     3677:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
3681     3681:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
368b     368b:	e9 00 00 00 00       	jmp    3690 <.altinstr_replacement+0x3690>	368c: R_X86_64_PC32	.text+0x10905a3
3690     3690:	48 89 f8             	mov    %rdi,%rax
3693     3693:	e9 00 00 00 00       	jmp    3698 <.altinstr_replacement+0x3698>	3694: R_X86_64_PC32	.text+0x1094157
3698     3698:	e9 00 00 00 00       	jmp    369d <.altinstr_replacement+0x369d>	3699: R_X86_64_PC32	.text+0x10941b6
369d     369d:	48 89 f8             	mov    %rdi,%rax
36a0     36a0:	48 89 f8             	mov    %rdi,%rax
36a3     36a3:	48 89 f8             	mov    %rdi,%rax
36a6     36a6:	48 89 f8             	mov    %rdi,%rax
36a9     36a9:	e9 00 00 00 00       	jmp    36ae <.altinstr_replacement+0x36ae>	36aa: R_X86_64_PC32	.text+0x1095d1b
36ae     36ae:	e9 00 00 00 00       	jmp    36b3 <.altinstr_replacement+0x36b3>	36af: R_X86_64_PC32	.text+0x1095d7c
36b3     36b3:	48 89 f8             	mov    %rdi,%rax
36b6     36b6:	e9 00 00 00 00       	jmp    36bb <.altinstr_replacement+0x36bb>	36b7: R_X86_64_PC32	.text+0x10962c5
36bb     36bb:	48 89 f8             	mov    %rdi,%rax
36be     36be:	48 89 f8             	mov    %rdi,%rax
36c1     36c1:	48 89 f8             	mov    %rdi,%rax
36c4     36c4:	48 89 f8             	mov    %rdi,%rax
36c7     36c7:	e9 00 00 00 00       	jmp    36cc <.altinstr_replacement+0x36cc>	36c8: R_X86_64_PC32	.text+0x10989ba
36cc     36cc:	48 89 f8             	mov    %rdi,%rax
36cf     36cf:	e9 00 00 00 00       	jmp    36d4 <.altinstr_replacement+0x36d4>	36d0: R_X86_64_PC32	.text+0x1098bd1
36d4     36d4:	48 89 f8             	mov    %rdi,%rax
36d7     36d7:	48 89 f8             	mov    %rdi,%rax
36da     36da:	e9 00 00 00 00       	jmp    36df <.altinstr_replacement+0x36df>	36db: R_X86_64_PC32	.text+0x10998d5
36df     36df:	48 89 f8             	mov    %rdi,%rax
36e2     36e2:	48 89 f8             	mov    %rdi,%rax
36e5     36e5:	48 89 f8             	mov    %rdi,%rax
36e8     36e8:	48 89 f8             	mov    %rdi,%rax
36eb     36eb:	48 89 f8             	mov    %rdi,%rax
36ee     36ee:	48 89 f8             	mov    %rdi,%rax
36f1     36f1:	e9 00 00 00 00       	jmp    36f6 <.altinstr_replacement+0x36f6>	36f2: R_X86_64_PC32	.text+0x109c42e
36f6     36f6:	48 89 f8             	mov    %rdi,%rax
36f9     36f9:	48 89 f8             	mov    %rdi,%rax
36fc     36fc:	e9 00 00 00 00       	jmp    3701 <.altinstr_replacement+0x3701>	36fd: R_X86_64_PC32	.text+0x10c3061
3701     3701:	e9 00 00 00 00       	jmp    3706 <.altinstr_replacement+0x3706>	3702: R_X86_64_PC32	.text+0x10cec11
3706     3706:	e9 00 00 00 00       	jmp    370b <.altinstr_replacement+0x370b>	3707: R_X86_64_PC32	.init.text+0x1732cd
370b     370b:	e9 00 00 00 00       	jmp    3710 <.altinstr_replacement+0x3710>	370c: R_X86_64_PC32	.init.text+0x173509
3710     3710:	e9 00 00 00 00       	jmp    3715 <.altinstr_replacement+0x3715>	3711: R_X86_64_PC32	.text+0x10cf857
3715     3715:	e9 00 00 00 00       	jmp    371a <.altinstr_replacement+0x371a>	3716: R_X86_64_PC32	.text+0x10cf8c9
371a     371a:	e9 00 00 00 00       	jmp    371f <.altinstr_replacement+0x371f>	371b: R_X86_64_PC32	.text+0x10d012b
371f     371f:	e9 00 00 00 00       	jmp    3724 <.altinstr_replacement+0x3724>	3720: R_X86_64_PC32	.text+0x10d0a60
3724     3724:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3729     3729:	0f 0d 08             	prefetchw (%rax)
372c     372c:	48 89 f8             	mov    %rdi,%rax
372f     372f:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
3739     3739:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
3743     3743:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
374d     374d:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
3757     3757:	f3 0f b8 c7          	popcnt %edi,%eax
375b     375b:	9c                   	pushf
375c     375c:	58                   	pop    %rax
375d     375d:	fa                   	cli
375e     375e:	9c                   	pushf
375f     375f:	58                   	pop    %rax
3760     3760:	fb                   	sti
3761     3761:	9c                   	pushf
3762     3762:	58                   	pop    %rax
3763     3763:	fa                   	cli
3764     3764:	9c                   	pushf
3765     3765:	58                   	pop    %rax
3766     3766:	fb                   	sti
3767     3767:	9c                   	pushf
3768     3768:	58                   	pop    %rax
3769     3769:	fa                   	cli
376a     376a:	9c                   	pushf
376b     376b:	58                   	pop    %rax
376c     376c:	fb                   	sti
376d     376d:	9c                   	pushf
376e     376e:	58                   	pop    %rax
376f     376f:	fa                   	cli
3770     3770:	9c                   	pushf
3771     3771:	58                   	pop    %rax
3772     3772:	fb                   	sti
3773     3773:	9c                   	pushf
3774     3774:	58                   	pop    %rax
3775     3775:	fb                   	sti
3776     3776:	9c                   	pushf
3777     3777:	58                   	pop    %rax
3778     3778:	fa                   	cli
3779     3779:	9c                   	pushf
377a     377a:	58                   	pop    %rax
377b     377b:	fb                   	sti
377c     377c:	f3 0f b8 c7          	popcnt %edi,%eax
3780     3780:	f3 0f b8 c7          	popcnt %edi,%eax
3784     3784:	f3 0f b8 c7          	popcnt %edi,%eax
3788     3788:	f3 48 0f b8 c7       	popcnt %rdi,%rax
378d     378d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3792     3792:	9c                   	pushf
3793     3793:	58                   	pop    %rax
3794     3794:	fb                   	sti
3795     3795:	9c                   	pushf
3796     3796:	58                   	pop    %rax
3797     3797:	fb                   	sti
3798     3798:	9c                   	pushf
3799     3799:	58                   	pop    %rax
379a     379a:	fa                   	cli
379b     379b:	e8 00 00 00 00       	call   37a0 <.altinstr_replacement+0x37a0>	379c: R_X86_64_PLT32	clear_page_rep-0x4
37a0     37a0:	e8 00 00 00 00       	call   37a5 <.altinstr_replacement+0x37a5>	37a1: R_X86_64_PLT32	clear_page_erms-0x4
37a5     37a5:	e8 00 00 00 00       	call   37aa <.altinstr_replacement+0x37aa>	37a6: R_X86_64_PLT32	clear_page_rep-0x4
37aa     37aa:	e8 00 00 00 00       	call   37af <.altinstr_replacement+0x37af>	37ab: R_X86_64_PLT32	clear_page_erms-0x4
37af     37af:	f3 48 0f b8 c7       	popcnt %rdi,%rax
37b4     37b4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
37b9     37b9:	9c                   	pushf
37ba     37ba:	58                   	pop    %rax
37bb     37bb:	fa                   	cli
37bc     37bc:	9c                   	pushf
37bd     37bd:	58                   	pop    %rax
37be     37be:	fb                   	sti
37bf     37bf:	e8 00 00 00 00       	call   37c4 <.altinstr_replacement+0x37c4>	37c0: R_X86_64_PLT32	clear_page_rep-0x4
37c4     37c4:	e8 00 00 00 00       	call   37c9 <.altinstr_replacement+0x37c9>	37c5: R_X86_64_PLT32	clear_page_erms-0x4
37c9     37c9:	e8 00 00 00 00       	call   37ce <.altinstr_replacement+0x37ce>	37ca: R_X86_64_PLT32	clear_page_rep-0x4
37ce     37ce:	e8 00 00 00 00       	call   37d3 <.altinstr_replacement+0x37d3>	37cf: R_X86_64_PLT32	clear_page_erms-0x4
37d3     37d3:	f3 0f b8 c7          	popcnt %edi,%eax
37d7     37d7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
37dc     37dc:	9c                   	pushf
37dd     37dd:	58                   	pop    %rax
37de     37de:	fb                   	sti
37df     37df:	9c                   	pushf
37e0     37e0:	58                   	pop    %rax
37e1     37e1:	fb                   	sti
37e2     37e2:	9c                   	pushf
37e3     37e3:	58                   	pop    %rax
37e4     37e4:	fa                   	cli
37e5     37e5:	f3 0f b8 c7          	popcnt %edi,%eax
37e9     37e9:	f3 0f b8 c7          	popcnt %edi,%eax
37ed     37ed:	f3 0f b8 c7          	popcnt %edi,%eax
37f1     37f1:	f3 0f b8 c7          	popcnt %edi,%eax
37f5     37f5:	9c                   	pushf
37f6     37f6:	58                   	pop    %rax
37f7     37f7:	fa                   	cli
37f8     37f8:	9c                   	pushf
37f9     37f9:	58                   	pop    %rax
37fa     37fa:	fb                   	sti
37fb     37fb:	9c                   	pushf
37fc     37fc:	58                   	pop    %rax
37fd     37fd:	fa                   	cli
37fe     37fe:	9c                   	pushf
37ff     37ff:	58                   	pop    %rax
3800     3800:	fb                   	sti
3801     3801:	9c                   	pushf
3802     3802:	58                   	pop    %rax
3803     3803:	fa                   	cli
3804     3804:	9c                   	pushf
3805     3805:	58                   	pop    %rax
3806     3806:	fb                   	sti
3807     3807:	f3 0f b8 c7          	popcnt %edi,%eax
380b     380b:	f3 0f b8 c7          	popcnt %edi,%eax
380f     380f:	f3 0f b8 c7          	popcnt %edi,%eax
3813     3813:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3818     3818:	f3 48 0f b8 c7       	popcnt %rdi,%rax
381d     381d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3822     3822:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3827     3827:	f3 48 0f b8 c7       	popcnt %rdi,%rax
382c     382c:	f3 0f b8 c7          	popcnt %edi,%eax
3830     3830:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3835     3835:	e8 00 00 00 00       	call   383a <.altinstr_replacement+0x383a>	3836: R_X86_64_PLT32	clear_page_rep-0x4
383a     383a:	e8 00 00 00 00       	call   383f <.altinstr_replacement+0x383f>	383b: R_X86_64_PLT32	clear_page_erms-0x4
383f     383f:	9c                   	pushf
3840     3840:	58                   	pop    %rax
3841     3841:	fa                   	cli
3842     3842:	9c                   	pushf
3843     3843:	58                   	pop    %rax
3844     3844:	fb                   	sti
3845     3845:	e8 00 00 00 00       	call   384a <.altinstr_replacement+0x384a>	3846: R_X86_64_PLT32	clear_page_rep-0x4
384a     384a:	e8 00 00 00 00       	call   384f <.altinstr_replacement+0x384f>	384b: R_X86_64_PLT32	clear_page_erms-0x4
384f     384f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3854     3854:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3859     3859:	9c                   	pushf
385a     385a:	58                   	pop    %rax
385b     385b:	fa                   	cli
385c     385c:	9c                   	pushf
385d     385d:	58                   	pop    %rax
385e     385e:	fb                   	sti
385f     385f:	9c                   	pushf
3860     3860:	58                   	pop    %rax
3861     3861:	fb                   	sti
3862     3862:	9c                   	pushf
3863     3863:	58                   	pop    %rax
3864     3864:	fa                   	cli
3865     3865:	9c                   	pushf
3866     3866:	58                   	pop    %rax
3867     3867:	fb                   	sti
3868     3868:	e8 00 00 00 00       	call   386d <.altinstr_replacement+0x386d>	3869: R_X86_64_PLT32	clear_page_rep-0x4
386d     386d:	e8 00 00 00 00       	call   3872 <.altinstr_replacement+0x3872>	386e: R_X86_64_PLT32	clear_page_erms-0x4
3872     3872:	e8 00 00 00 00       	call   3877 <.altinstr_replacement+0x3877>	3873: R_X86_64_PLT32	clear_page_rep-0x4
3877     3877:	e8 00 00 00 00       	call   387c <.altinstr_replacement+0x387c>	3878: R_X86_64_PLT32	clear_page_erms-0x4
387c     387c:	e8 00 00 00 00       	call   3881 <.altinstr_replacement+0x3881>	387d: R_X86_64_PLT32	clear_page_rep-0x4
3881     3881:	e8 00 00 00 00       	call   3886 <.altinstr_replacement+0x3886>	3882: R_X86_64_PLT32	clear_page_erms-0x4
3886     3886:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
388a     388a:	9c                   	pushf
388b     388b:	58                   	pop    %rax
388c     388c:	fa                   	cli
388d     388d:	9c                   	pushf
388e     388e:	58                   	pop    %rax
388f     388f:	fb                   	sti
3890     3890:	9c                   	pushf
3891     3891:	58                   	pop    %rax
3892     3892:	fa                   	cli
3893     3893:	9c                   	pushf
3894     3894:	58                   	pop    %rax
3895     3895:	fb                   	sti
3896     3896:	9c                   	pushf
3897     3897:	58                   	pop    %rax
3898     3898:	fa                   	cli
3899     3899:	9c                   	pushf
389a     389a:	58                   	pop    %rax
389b     389b:	fb                   	sti
389c     389c:	e9 00 00 00 00       	jmp    38a1 <.altinstr_replacement+0x38a1>	389d: R_X86_64_PC32	.text+0x2719eb8
38a1     38a1:	e9 00 00 00 00       	jmp    38a6 <.altinstr_replacement+0x38a6>	38a2: R_X86_64_PC32	.text+0x271a10d
38a6     38a6:	e9 00 00 00 00       	jmp    38ab <.altinstr_replacement+0x38ab>	38a7: R_X86_64_PC32	.text+0x271a357
38ab     38ab:	e9 00 00 00 00       	jmp    38b0 <.altinstr_replacement+0x38b0>	38ac: R_X86_64_PC32	.text+0x271a3a8
38b0     38b0:	9c                   	pushf
38b1     38b1:	58                   	pop    %rax
38b2     38b2:	9c                   	pushf
38b3     38b3:	58                   	pop    %rax
38b4     38b4:	9c                   	pushf
38b5     38b5:	58                   	pop    %rax
38b6     38b6:	fb                   	sti
38b7     38b7:	9c                   	pushf
38b8     38b8:	58                   	pop    %rax
38b9     38b9:	fb                   	sti
38ba     38ba:	9c                   	pushf
38bb     38bb:	58                   	pop    %rax
38bc     38bc:	fa                   	cli
38bd     38bd:	0f 01 cb             	stac
38c0     38c0:	e8 00 00 00 00       	call   38c5 <.altinstr_replacement+0x38c5>	38c1: R_X86_64_PLT32	rep_stos_alternative-0x4
38c5     38c5:	0f 01 ca             	clac
38c8     38c8:	0f 01 cb             	stac
38cb     38cb:	e8 00 00 00 00       	call   38d0 <.altinstr_replacement+0x38d0>	38cc: R_X86_64_PLT32	rep_stos_alternative-0x4
38d0     38d0:	0f 01 ca             	clac
38d3     38d3:	9c                   	pushf
38d4     38d4:	58                   	pop    %rax
38d5     38d5:	fa                   	cli
38d6     38d6:	9c                   	pushf
38d7     38d7:	58                   	pop    %rax
38d8     38d8:	fb                   	sti
38d9     38d9:	f3 0f b8 c7          	popcnt %edi,%eax
38dd     38dd:	9c                   	pushf
38de     38de:	58                   	pop    %rax
38df     38df:	fb                   	sti
38e0     38e0:	9c                   	pushf
38e1     38e1:	58                   	pop    %rax
38e2     38e2:	fb                   	sti
38e3     38e3:	9c                   	pushf
38e4     38e4:	58                   	pop    %rax
38e5     38e5:	fa                   	cli
38e6     38e6:	9c                   	pushf
38e7     38e7:	58                   	pop    %rax
38e8     38e8:	fa                   	cli
38e9     38e9:	9c                   	pushf
38ea     38ea:	58                   	pop    %rax
38eb     38eb:	fb                   	sti
38ec     38ec:	9c                   	pushf
38ed     38ed:	58                   	pop    %rax
38ee     38ee:	fa                   	cli
38ef     38ef:	9c                   	pushf
38f0     38f0:	58                   	pop    %rax
38f1     38f1:	fb                   	sti
38f2     38f2:	9c                   	pushf
38f3     38f3:	58                   	pop    %rax
38f4     38f4:	fa                   	cli
38f5     38f5:	9c                   	pushf
38f6     38f6:	58                   	pop    %rax
38f7     38f7:	fb                   	sti
38f8     38f8:	9c                   	pushf
38f9     38f9:	58                   	pop    %rax
38fa     38fa:	fa                   	cli
38fb     38fb:	9c                   	pushf
38fc     38fc:	58                   	pop    %rax
38fd     38fd:	fb                   	sti
38fe     38fe:	9c                   	pushf
38ff     38ff:	58                   	pop    %rax
3900     3900:	9c                   	pushf
3901     3901:	58                   	pop    %rax
3902     3902:	9c                   	pushf
3903     3903:	58                   	pop    %rax
3904     3904:	fa                   	cli
3905     3905:	9c                   	pushf
3906     3906:	58                   	pop    %rax
3907     3907:	fb                   	sti
3908     3908:	9c                   	pushf
3909     3909:	58                   	pop    %rax
390a     390a:	fa                   	cli
390b     390b:	9c                   	pushf
390c     390c:	58                   	pop    %rax
390d     390d:	fb                   	sti
390e     390e:	f3 0f b8 c7          	popcnt %edi,%eax
3912     3912:	f3 0f b8 c7          	popcnt %edi,%eax
3916     3916:	f3 0f b8 c7          	popcnt %edi,%eax
391a     391a:	f3 0f b8 c7          	popcnt %edi,%eax
391e     391e:	f3 0f b8 c7          	popcnt %edi,%eax
3922     3922:	f3 0f b8 c7          	popcnt %edi,%eax
3926     3926:	f3 0f b8 c7          	popcnt %edi,%eax
392a     392a:	f3 0f b8 c7          	popcnt %edi,%eax
392e     392e:	f3 0f b8 c7          	popcnt %edi,%eax
3932     3932:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3937     3937:	f3 48 0f b8 c7       	popcnt %rdi,%rax
393c     393c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3941     3941:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3946     3946:	0f 01 cb             	stac
3949     3949:	0f ae e8             	lfence
394c     394c:	0f 01 ca             	clac
394f     394f:	0f 01 cb             	stac
3952     3952:	0f ae e8             	lfence
3955     3955:	0f 01 ca             	clac
3958     3958:	0f 01 cb             	stac
395b     395b:	e8 00 00 00 00       	call   3960 <.altinstr_replacement+0x3960>	395c: R_X86_64_PLT32	rep_movs_alternative-0x4
3960     3960:	0f 01 ca             	clac
3963     3963:	0f 01 cb             	stac
3966     3966:	e8 00 00 00 00       	call   396b <.altinstr_replacement+0x396b>	3967: R_X86_64_PLT32	rep_movs_alternative-0x4
396b     396b:	0f 01 ca             	clac
396e     396e:	0f 01 cb             	stac
3971     3971:	0f 01 ca             	clac
3974     3974:	0f 01 cb             	stac
3977     3977:	0f 01 ca             	clac
397a     397a:	0f 01 cb             	stac
397d     397d:	e8 00 00 00 00       	call   3982 <.altinstr_replacement+0x3982>	397e: R_X86_64_PLT32	rep_stos_alternative-0x4
3982     3982:	0f 01 ca             	clac
3985     3985:	0f 01 cb             	stac
3988     3988:	e8 00 00 00 00       	call   398d <.altinstr_replacement+0x398d>	3989: R_X86_64_PLT32	rep_stos_alternative-0x4
398d     398d:	0f 01 ca             	clac
3990     3990:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3995     3995:	f3 48 0f b8 c7       	popcnt %rdi,%rax
399a     399a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
399f     399f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
39a4     39a4:	f3 0f b8 c7          	popcnt %edi,%eax
39a8     39a8:	f3 0f b8 c7          	popcnt %edi,%eax
39ac     39ac:	9c                   	pushf
39ad     39ad:	58                   	pop    %rax
39ae     39ae:	fb                   	sti
39af     39af:	9c                   	pushf
39b0     39b0:	58                   	pop    %rax
39b1     39b1:	fb                   	sti
39b2     39b2:	9c                   	pushf
39b3     39b3:	58                   	pop    %rax
39b4     39b4:	fa                   	cli
39b5     39b5:	9c                   	pushf
39b6     39b6:	58                   	pop    %rax
39b7     39b7:	fa                   	cli
39b8     39b8:	0f ae e8             	lfence
39bb     39bb:	0f 01 cb             	stac
39be     39be:	e8 00 00 00 00       	call   39c3 <.altinstr_replacement+0x39c3>	39bf: R_X86_64_PLT32	rep_movs_alternative-0x4
39c3     39c3:	0f 01 ca             	clac
39c6     39c6:	0f 01 cb             	stac
39c9     39c9:	0f ae e8             	lfence
39cc     39cc:	0f 01 ca             	clac
39cf     39cf:	0f 01 ca             	clac
39d2     39d2:	0f 01 cb             	stac
39d5     39d5:	e8 00 00 00 00       	call   39da <.altinstr_replacement+0x39da>	39d6: R_X86_64_PLT32	rep_movs_alternative-0x4
39da     39da:	0f 01 ca             	clac
39dd     39dd:	9c                   	pushf
39de     39de:	58                   	pop    %rax
39df     39df:	fb                   	sti
39e0     39e0:	9c                   	pushf
39e1     39e1:	58                   	pop    %rax
39e2     39e2:	fb                   	sti
39e3     39e3:	9c                   	pushf
39e4     39e4:	58                   	pop    %rax
39e5     39e5:	fa                   	cli
39e6     39e6:	f3 0f b8 c7          	popcnt %edi,%eax
39ea     39ea:	f3 0f b8 c7          	popcnt %edi,%eax
39ee     39ee:	e8 00 00 00 00       	call   39f3 <.altinstr_replacement+0x39f3>	39ef: R_X86_64_PLT32	clear_page_rep-0x4
39f3     39f3:	e8 00 00 00 00       	call   39f8 <.altinstr_replacement+0x39f8>	39f4: R_X86_64_PLT32	clear_page_erms-0x4
39f8     39f8:	9c                   	pushf
39f9     39f9:	58                   	pop    %rax
39fa     39fa:	9c                   	pushf
39fb     39fb:	58                   	pop    %rax
39fc     39fc:	9c                   	pushf
39fd     39fd:	58                   	pop    %rax
39fe     39fe:	9c                   	pushf
39ff     39ff:	58                   	pop    %rax
3a00     3a00:	9c                   	pushf
3a01     3a01:	58                   	pop    %rax
3a02     3a02:	9c                   	pushf
3a03     3a03:	58                   	pop    %rax
3a04     3a04:	9c                   	pushf
3a05     3a05:	58                   	pop    %rax
3a06     3a06:	9c                   	pushf
3a07     3a07:	58                   	pop    %rax
3a08     3a08:	9c                   	pushf
3a09     3a09:	58                   	pop    %rax
3a0a     3a0a:	9c                   	pushf
3a0b     3a0b:	58                   	pop    %rax
3a0c     3a0c:	9c                   	pushf
3a0d     3a0d:	58                   	pop    %rax
3a0e     3a0e:	fa                   	cli
3a0f     3a0f:	fb                   	sti
3a10     3a10:	9c                   	pushf
3a11     3a11:	58                   	pop    %rax
3a12     3a12:	fa                   	cli
3a13     3a13:	fb                   	sti
3a14     3a14:	9c                   	pushf
3a15     3a15:	58                   	pop    %rax
3a16     3a16:	fa                   	cli
3a17     3a17:	fb                   	sti
3a18     3a18:	9c                   	pushf
3a19     3a19:	58                   	pop    %rax
3a1a     3a1a:	fa                   	cli
3a1b     3a1b:	fb                   	sti
3a1c     3a1c:	9c                   	pushf
3a1d     3a1d:	58                   	pop    %rax
3a1e     3a1e:	fa                   	cli
3a1f     3a1f:	fb                   	sti
3a20     3a20:	9c                   	pushf
3a21     3a21:	58                   	pop    %rax
3a22     3a22:	fa                   	cli
3a23     3a23:	fb                   	sti
3a24     3a24:	9c                   	pushf
3a25     3a25:	58                   	pop    %rax
3a26     3a26:	fa                   	cli
3a27     3a27:	fb                   	sti
3a28     3a28:	9c                   	pushf
3a29     3a29:	58                   	pop    %rax
3a2a     3a2a:	fa                   	cli
3a2b     3a2b:	fb                   	sti
3a2c     3a2c:	9c                   	pushf
3a2d     3a2d:	58                   	pop    %rax
3a2e     3a2e:	fa                   	cli
3a2f     3a2f:	fb                   	sti
3a30     3a30:	9c                   	pushf
3a31     3a31:	58                   	pop    %rax
3a32     3a32:	fa                   	cli
3a33     3a33:	fb                   	sti
3a34     3a34:	9c                   	pushf
3a35     3a35:	58                   	pop    %rax
3a36     3a36:	fa                   	cli
3a37     3a37:	fb                   	sti
3a38     3a38:	9c                   	pushf
3a39     3a39:	58                   	pop    %rax
3a3a     3a3a:	fa                   	cli
3a3b     3a3b:	fb                   	sti
3a3c     3a3c:	9c                   	pushf
3a3d     3a3d:	58                   	pop    %rax
3a3e     3a3e:	fa                   	cli
3a3f     3a3f:	fb                   	sti
3a40     3a40:	9c                   	pushf
3a41     3a41:	58                   	pop    %rax
3a42     3a42:	fa                   	cli
3a43     3a43:	fb                   	sti
3a44     3a44:	9c                   	pushf
3a45     3a45:	58                   	pop    %rax
3a46     3a46:	fa                   	cli
3a47     3a47:	fb                   	sti
3a48     3a48:	9c                   	pushf
3a49     3a49:	58                   	pop    %rax
3a4a     3a4a:	fa                   	cli
3a4b     3a4b:	fb                   	sti
3a4c     3a4c:	9c                   	pushf
3a4d     3a4d:	58                   	pop    %rax
3a4e     3a4e:	fa                   	cli
3a4f     3a4f:	fb                   	sti
3a50     3a50:	9c                   	pushf
3a51     3a51:	58                   	pop    %rax
3a52     3a52:	fa                   	cli
3a53     3a53:	fb                   	sti
3a54     3a54:	9c                   	pushf
3a55     3a55:	58                   	pop    %rax
3a56     3a56:	fa                   	cli
3a57     3a57:	fb                   	sti
3a58     3a58:	9c                   	pushf
3a59     3a59:	58                   	pop    %rax
3a5a     3a5a:	fa                   	cli
3a5b     3a5b:	fb                   	sti
3a5c     3a5c:	9c                   	pushf
3a5d     3a5d:	58                   	pop    %rax
3a5e     3a5e:	fa                   	cli
3a5f     3a5f:	fb                   	sti
3a60     3a60:	9c                   	pushf
3a61     3a61:	58                   	pop    %rax
3a62     3a62:	fa                   	cli
3a63     3a63:	fb                   	sti
3a64     3a64:	9c                   	pushf
3a65     3a65:	58                   	pop    %rax
3a66     3a66:	fa                   	cli
3a67     3a67:	fb                   	sti
3a68     3a68:	9c                   	pushf
3a69     3a69:	58                   	pop    %rax
3a6a     3a6a:	fa                   	cli
3a6b     3a6b:	fb                   	sti
3a6c     3a6c:	9c                   	pushf
3a6d     3a6d:	58                   	pop    %rax
3a6e     3a6e:	fa                   	cli
3a6f     3a6f:	fb                   	sti
3a70     3a70:	9c                   	pushf
3a71     3a71:	58                   	pop    %rax
3a72     3a72:	fa                   	cli
3a73     3a73:	fb                   	sti
3a74     3a74:	9c                   	pushf
3a75     3a75:	58                   	pop    %rax
3a76     3a76:	fa                   	cli
3a77     3a77:	fb                   	sti
3a78     3a78:	9c                   	pushf
3a79     3a79:	58                   	pop    %rax
3a7a     3a7a:	fa                   	cli
3a7b     3a7b:	fb                   	sti
3a7c     3a7c:	9c                   	pushf
3a7d     3a7d:	58                   	pop    %rax
3a7e     3a7e:	fa                   	cli
3a7f     3a7f:	fb                   	sti
3a80     3a80:	9c                   	pushf
3a81     3a81:	58                   	pop    %rax
3a82     3a82:	fa                   	cli
3a83     3a83:	fb                   	sti
3a84     3a84:	9c                   	pushf
3a85     3a85:	58                   	pop    %rax
3a86     3a86:	fa                   	cli
3a87     3a87:	fb                   	sti
3a88     3a88:	9c                   	pushf
3a89     3a89:	58                   	pop    %rax
3a8a     3a8a:	fa                   	cli
3a8b     3a8b:	fb                   	sti
3a8c     3a8c:	9c                   	pushf
3a8d     3a8d:	58                   	pop    %rax
3a8e     3a8e:	fa                   	cli
3a8f     3a8f:	fb                   	sti
3a90     3a90:	9c                   	pushf
3a91     3a91:	58                   	pop    %rax
3a92     3a92:	fa                   	cli
3a93     3a93:	fb                   	sti
3a94     3a94:	9c                   	pushf
3a95     3a95:	58                   	pop    %rax
3a96     3a96:	fa                   	cli
3a97     3a97:	fb                   	sti
3a98     3a98:	9c                   	pushf
3a99     3a99:	58                   	pop    %rax
3a9a     3a9a:	fa                   	cli
3a9b     3a9b:	fb                   	sti
3a9c     3a9c:	9c                   	pushf
3a9d     3a9d:	58                   	pop    %rax
3a9e     3a9e:	fa                   	cli
3a9f     3a9f:	fb                   	sti
3aa0     3aa0:	9c                   	pushf
3aa1     3aa1:	58                   	pop    %rax
3aa2     3aa2:	fa                   	cli
3aa3     3aa3:	fb                   	sti
3aa4     3aa4:	9c                   	pushf
3aa5     3aa5:	58                   	pop    %rax
3aa6     3aa6:	fa                   	cli
3aa7     3aa7:	fb                   	sti
3aa8     3aa8:	9c                   	pushf
3aa9     3aa9:	58                   	pop    %rax
3aaa     3aaa:	fa                   	cli
3aab     3aab:	fb                   	sti
3aac     3aac:	9c                   	pushf
3aad     3aad:	58                   	pop    %rax
3aae     3aae:	fa                   	cli
3aaf     3aaf:	fb                   	sti
3ab0     3ab0:	9c                   	pushf
3ab1     3ab1:	58                   	pop    %rax
3ab2     3ab2:	fa                   	cli
3ab3     3ab3:	fb                   	sti
3ab4     3ab4:	9c                   	pushf
3ab5     3ab5:	58                   	pop    %rax
3ab6     3ab6:	fa                   	cli
3ab7     3ab7:	fb                   	sti
3ab8     3ab8:	9c                   	pushf
3ab9     3ab9:	58                   	pop    %rax
3aba     3aba:	fa                   	cli
3abb     3abb:	fb                   	sti
3abc     3abc:	9c                   	pushf
3abd     3abd:	58                   	pop    %rax
3abe     3abe:	fa                   	cli
3abf     3abf:	fb                   	sti
3ac0     3ac0:	9c                   	pushf
3ac1     3ac1:	58                   	pop    %rax
3ac2     3ac2:	fa                   	cli
3ac3     3ac3:	fb                   	sti
3ac4     3ac4:	9c                   	pushf
3ac5     3ac5:	58                   	pop    %rax
3ac6     3ac6:	fa                   	cli
3ac7     3ac7:	fb                   	sti
3ac8     3ac8:	9c                   	pushf
3ac9     3ac9:	58                   	pop    %rax
3aca     3aca:	fa                   	cli
3acb     3acb:	fb                   	sti
3acc     3acc:	9c                   	pushf
3acd     3acd:	58                   	pop    %rax
3ace     3ace:	fa                   	cli
3acf     3acf:	fb                   	sti
3ad0     3ad0:	9c                   	pushf
3ad1     3ad1:	58                   	pop    %rax
3ad2     3ad2:	fa                   	cli
3ad3     3ad3:	fb                   	sti
3ad4     3ad4:	9c                   	pushf
3ad5     3ad5:	58                   	pop    %rax
3ad6     3ad6:	fa                   	cli
3ad7     3ad7:	fb                   	sti
3ad8     3ad8:	9c                   	pushf
3ad9     3ad9:	58                   	pop    %rax
3ada     3ada:	fa                   	cli
3adb     3adb:	fb                   	sti
3adc     3adc:	9c                   	pushf
3add     3add:	58                   	pop    %rax
3ade     3ade:	fa                   	cli
3adf     3adf:	fb                   	sti
3ae0     3ae0:	9c                   	pushf
3ae1     3ae1:	58                   	pop    %rax
3ae2     3ae2:	fa                   	cli
3ae3     3ae3:	fb                   	sti
3ae4     3ae4:	9c                   	pushf
3ae5     3ae5:	58                   	pop    %rax
3ae6     3ae6:	fa                   	cli
3ae7     3ae7:	fb                   	sti
3ae8     3ae8:	9c                   	pushf
3ae9     3ae9:	58                   	pop    %rax
3aea     3aea:	fa                   	cli
3aeb     3aeb:	fb                   	sti
3aec     3aec:	9c                   	pushf
3aed     3aed:	58                   	pop    %rax
3aee     3aee:	fa                   	cli
3aef     3aef:	fb                   	sti
3af0     3af0:	9c                   	pushf
3af1     3af1:	58                   	pop    %rax
3af2     3af2:	fa                   	cli
3af3     3af3:	fb                   	sti
3af4     3af4:	9c                   	pushf
3af5     3af5:	58                   	pop    %rax
3af6     3af6:	fa                   	cli
3af7     3af7:	fb                   	sti
3af8     3af8:	9c                   	pushf
3af9     3af9:	58                   	pop    %rax
3afa     3afa:	fa                   	cli
3afb     3afb:	fb                   	sti
3afc     3afc:	9c                   	pushf
3afd     3afd:	58                   	pop    %rax
3afe     3afe:	fa                   	cli
3aff     3aff:	fb                   	sti
3b00     3b00:	9c                   	pushf
3b01     3b01:	58                   	pop    %rax
3b02     3b02:	fa                   	cli
3b03     3b03:	fb                   	sti
3b04     3b04:	9c                   	pushf
3b05     3b05:	58                   	pop    %rax
3b06     3b06:	fa                   	cli
3b07     3b07:	fb                   	sti
3b08     3b08:	9c                   	pushf
3b09     3b09:	58                   	pop    %rax
3b0a     3b0a:	fa                   	cli
3b0b     3b0b:	fb                   	sti
3b0c     3b0c:	9c                   	pushf
3b0d     3b0d:	58                   	pop    %rax
3b0e     3b0e:	fa                   	cli
3b0f     3b0f:	fb                   	sti
3b10     3b10:	9c                   	pushf
3b11     3b11:	58                   	pop    %rax
3b12     3b12:	fa                   	cli
3b13     3b13:	fb                   	sti
3b14     3b14:	9c                   	pushf
3b15     3b15:	58                   	pop    %rax
3b16     3b16:	fa                   	cli
3b17     3b17:	fb                   	sti
3b18     3b18:	9c                   	pushf
3b19     3b19:	58                   	pop    %rax
3b1a     3b1a:	fa                   	cli
3b1b     3b1b:	fb                   	sti
3b1c     3b1c:	9c                   	pushf
3b1d     3b1d:	58                   	pop    %rax
3b1e     3b1e:	fa                   	cli
3b1f     3b1f:	fb                   	sti
3b20     3b20:	9c                   	pushf
3b21     3b21:	58                   	pop    %rax
3b22     3b22:	fa                   	cli
3b23     3b23:	fb                   	sti
3b24     3b24:	9c                   	pushf
3b25     3b25:	58                   	pop    %rax
3b26     3b26:	fa                   	cli
3b27     3b27:	fb                   	sti
3b28     3b28:	9c                   	pushf
3b29     3b29:	58                   	pop    %rax
3b2a     3b2a:	fa                   	cli
3b2b     3b2b:	fb                   	sti
3b2c     3b2c:	9c                   	pushf
3b2d     3b2d:	58                   	pop    %rax
3b2e     3b2e:	fa                   	cli
3b2f     3b2f:	fb                   	sti
3b30     3b30:	9c                   	pushf
3b31     3b31:	58                   	pop    %rax
3b32     3b32:	fa                   	cli
3b33     3b33:	fb                   	sti
3b34     3b34:	9c                   	pushf
3b35     3b35:	58                   	pop    %rax
3b36     3b36:	fa                   	cli
3b37     3b37:	fb                   	sti
3b38     3b38:	9c                   	pushf
3b39     3b39:	58                   	pop    %rax
3b3a     3b3a:	fa                   	cli
3b3b     3b3b:	fb                   	sti
3b3c     3b3c:	9c                   	pushf
3b3d     3b3d:	58                   	pop    %rax
3b3e     3b3e:	fa                   	cli
3b3f     3b3f:	fb                   	sti
3b40     3b40:	9c                   	pushf
3b41     3b41:	58                   	pop    %rax
3b42     3b42:	fa                   	cli
3b43     3b43:	fb                   	sti
3b44     3b44:	9c                   	pushf
3b45     3b45:	58                   	pop    %rax
3b46     3b46:	fa                   	cli
3b47     3b47:	fb                   	sti
3b48     3b48:	9c                   	pushf
3b49     3b49:	58                   	pop    %rax
3b4a     3b4a:	fa                   	cli
3b4b     3b4b:	fb                   	sti
3b4c     3b4c:	9c                   	pushf
3b4d     3b4d:	58                   	pop    %rax
3b4e     3b4e:	fa                   	cli
3b4f     3b4f:	fb                   	sti
3b50     3b50:	9c                   	pushf
3b51     3b51:	58                   	pop    %rax
3b52     3b52:	fa                   	cli
3b53     3b53:	fb                   	sti
3b54     3b54:	9c                   	pushf
3b55     3b55:	58                   	pop    %rax
3b56     3b56:	fa                   	cli
3b57     3b57:	fb                   	sti
3b58     3b58:	9c                   	pushf
3b59     3b59:	58                   	pop    %rax
3b5a     3b5a:	fa                   	cli
3b5b     3b5b:	fb                   	sti
3b5c     3b5c:	9c                   	pushf
3b5d     3b5d:	58                   	pop    %rax
3b5e     3b5e:	fa                   	cli
3b5f     3b5f:	fb                   	sti
3b60     3b60:	9c                   	pushf
3b61     3b61:	58                   	pop    %rax
3b62     3b62:	fa                   	cli
3b63     3b63:	fb                   	sti
3b64     3b64:	9c                   	pushf
3b65     3b65:	58                   	pop    %rax
3b66     3b66:	fa                   	cli
3b67     3b67:	fb                   	sti
3b68     3b68:	9c                   	pushf
3b69     3b69:	58                   	pop    %rax
3b6a     3b6a:	fa                   	cli
3b6b     3b6b:	fb                   	sti
3b6c     3b6c:	9c                   	pushf
3b6d     3b6d:	58                   	pop    %rax
3b6e     3b6e:	fa                   	cli
3b6f     3b6f:	fb                   	sti
3b70     3b70:	9c                   	pushf
3b71     3b71:	58                   	pop    %rax
3b72     3b72:	fa                   	cli
3b73     3b73:	fb                   	sti
3b74     3b74:	9c                   	pushf
3b75     3b75:	58                   	pop    %rax
3b76     3b76:	fa                   	cli
3b77     3b77:	fb                   	sti
3b78     3b78:	9c                   	pushf
3b79     3b79:	58                   	pop    %rax
3b7a     3b7a:	fa                   	cli
3b7b     3b7b:	fb                   	sti
3b7c     3b7c:	9c                   	pushf
3b7d     3b7d:	58                   	pop    %rax
3b7e     3b7e:	fa                   	cli
3b7f     3b7f:	fb                   	sti
3b80     3b80:	9c                   	pushf
3b81     3b81:	58                   	pop    %rax
3b82     3b82:	fa                   	cli
3b83     3b83:	fb                   	sti
3b84     3b84:	9c                   	pushf
3b85     3b85:	58                   	pop    %rax
3b86     3b86:	fa                   	cli
3b87     3b87:	fb                   	sti
3b88     3b88:	9c                   	pushf
3b89     3b89:	58                   	pop    %rax
3b8a     3b8a:	fa                   	cli
3b8b     3b8b:	fb                   	sti
3b8c     3b8c:	9c                   	pushf
3b8d     3b8d:	58                   	pop    %rax
3b8e     3b8e:	fa                   	cli
3b8f     3b8f:	fb                   	sti
3b90     3b90:	9c                   	pushf
3b91     3b91:	58                   	pop    %rax
3b92     3b92:	fa                   	cli
3b93     3b93:	fb                   	sti
3b94     3b94:	9c                   	pushf
3b95     3b95:	58                   	pop    %rax
3b96     3b96:	fa                   	cli
3b97     3b97:	fb                   	sti
3b98     3b98:	9c                   	pushf
3b99     3b99:	58                   	pop    %rax
3b9a     3b9a:	fa                   	cli
3b9b     3b9b:	fb                   	sti
3b9c     3b9c:	9c                   	pushf
3b9d     3b9d:	58                   	pop    %rax
3b9e     3b9e:	fa                   	cli
3b9f     3b9f:	fb                   	sti
3ba0     3ba0:	9c                   	pushf
3ba1     3ba1:	58                   	pop    %rax
3ba2     3ba2:	fa                   	cli
3ba3     3ba3:	fb                   	sti
3ba4     3ba4:	9c                   	pushf
3ba5     3ba5:	58                   	pop    %rax
3ba6     3ba6:	fa                   	cli
3ba7     3ba7:	fb                   	sti
3ba8     3ba8:	9c                   	pushf
3ba9     3ba9:	58                   	pop    %rax
3baa     3baa:	fa                   	cli
3bab     3bab:	fb                   	sti
3bac     3bac:	9c                   	pushf
3bad     3bad:	58                   	pop    %rax
3bae     3bae:	fa                   	cli
3baf     3baf:	fb                   	sti
3bb0     3bb0:	9c                   	pushf
3bb1     3bb1:	58                   	pop    %rax
3bb2     3bb2:	fa                   	cli
3bb3     3bb3:	fb                   	sti
3bb4     3bb4:	9c                   	pushf
3bb5     3bb5:	58                   	pop    %rax
3bb6     3bb6:	fa                   	cli
3bb7     3bb7:	fb                   	sti
3bb8     3bb8:	9c                   	pushf
3bb9     3bb9:	58                   	pop    %rax
3bba     3bba:	fa                   	cli
3bbb     3bbb:	fb                   	sti
3bbc     3bbc:	9c                   	pushf
3bbd     3bbd:	58                   	pop    %rax
3bbe     3bbe:	fa                   	cli
3bbf     3bbf:	fb                   	sti
3bc0     3bc0:	9c                   	pushf
3bc1     3bc1:	58                   	pop    %rax
3bc2     3bc2:	fa                   	cli
3bc3     3bc3:	fb                   	sti
3bc4     3bc4:	9c                   	pushf
3bc5     3bc5:	58                   	pop    %rax
3bc6     3bc6:	fa                   	cli
3bc7     3bc7:	fb                   	sti
3bc8     3bc8:	9c                   	pushf
3bc9     3bc9:	58                   	pop    %rax
3bca     3bca:	fa                   	cli
3bcb     3bcb:	fb                   	sti
3bcc     3bcc:	9c                   	pushf
3bcd     3bcd:	58                   	pop    %rax
3bce     3bce:	fa                   	cli
3bcf     3bcf:	fb                   	sti
3bd0     3bd0:	9c                   	pushf
3bd1     3bd1:	58                   	pop    %rax
3bd2     3bd2:	fa                   	cli
3bd3     3bd3:	fb                   	sti
3bd4     3bd4:	9c                   	pushf
3bd5     3bd5:	58                   	pop    %rax
3bd6     3bd6:	fa                   	cli
3bd7     3bd7:	fb                   	sti
3bd8     3bd8:	9c                   	pushf
3bd9     3bd9:	58                   	pop    %rax
3bda     3bda:	fa                   	cli
3bdb     3bdb:	fb                   	sti
3bdc     3bdc:	9c                   	pushf
3bdd     3bdd:	58                   	pop    %rax
3bde     3bde:	fa                   	cli
3bdf     3bdf:	fb                   	sti
3be0     3be0:	9c                   	pushf
3be1     3be1:	58                   	pop    %rax
3be2     3be2:	fa                   	cli
3be3     3be3:	fb                   	sti
3be4     3be4:	9c                   	pushf
3be5     3be5:	58                   	pop    %rax
3be6     3be6:	fa                   	cli
3be7     3be7:	fb                   	sti
3be8     3be8:	9c                   	pushf
3be9     3be9:	58                   	pop    %rax
3bea     3bea:	fa                   	cli
3beb     3beb:	fb                   	sti
3bec     3bec:	9c                   	pushf
3bed     3bed:	58                   	pop    %rax
3bee     3bee:	fa                   	cli
3bef     3bef:	fb                   	sti
3bf0     3bf0:	9c                   	pushf
3bf1     3bf1:	58                   	pop    %rax
3bf2     3bf2:	fa                   	cli
3bf3     3bf3:	fb                   	sti
3bf4     3bf4:	9c                   	pushf
3bf5     3bf5:	58                   	pop    %rax
3bf6     3bf6:	fa                   	cli
3bf7     3bf7:	fb                   	sti
3bf8     3bf8:	9c                   	pushf
3bf9     3bf9:	58                   	pop    %rax
3bfa     3bfa:	fa                   	cli
3bfb     3bfb:	fb                   	sti
3bfc     3bfc:	9c                   	pushf
3bfd     3bfd:	58                   	pop    %rax
3bfe     3bfe:	fa                   	cli
3bff     3bff:	fb                   	sti
3c00     3c00:	9c                   	pushf
3c01     3c01:	58                   	pop    %rax
3c02     3c02:	fa                   	cli
3c03     3c03:	fb                   	sti
3c04     3c04:	9c                   	pushf
3c05     3c05:	58                   	pop    %rax
3c06     3c06:	fa                   	cli
3c07     3c07:	fb                   	sti
3c08     3c08:	9c                   	pushf
3c09     3c09:	58                   	pop    %rax
3c0a     3c0a:	fa                   	cli
3c0b     3c0b:	fb                   	sti
3c0c     3c0c:	9c                   	pushf
3c0d     3c0d:	58                   	pop    %rax
3c0e     3c0e:	fa                   	cli
3c0f     3c0f:	fb                   	sti
3c10     3c10:	9c                   	pushf
3c11     3c11:	58                   	pop    %rax
3c12     3c12:	fa                   	cli
3c13     3c13:	fb                   	sti
3c14     3c14:	9c                   	pushf
3c15     3c15:	58                   	pop    %rax
3c16     3c16:	fa                   	cli
3c17     3c17:	fb                   	sti
3c18     3c18:	9c                   	pushf
3c19     3c19:	58                   	pop    %rax
3c1a     3c1a:	fa                   	cli
3c1b     3c1b:	fb                   	sti
3c1c     3c1c:	9c                   	pushf
3c1d     3c1d:	58                   	pop    %rax
3c1e     3c1e:	fa                   	cli
3c1f     3c1f:	fb                   	sti
3c20     3c20:	9c                   	pushf
3c21     3c21:	58                   	pop    %rax
3c22     3c22:	fa                   	cli
3c23     3c23:	fb                   	sti
3c24     3c24:	9c                   	pushf
3c25     3c25:	58                   	pop    %rax
3c26     3c26:	fa                   	cli
3c27     3c27:	fb                   	sti
3c28     3c28:	9c                   	pushf
3c29     3c29:	58                   	pop    %rax
3c2a     3c2a:	fa                   	cli
3c2b     3c2b:	fb                   	sti
3c2c     3c2c:	9c                   	pushf
3c2d     3c2d:	58                   	pop    %rax
3c2e     3c2e:	fa                   	cli
3c2f     3c2f:	fb                   	sti
3c30     3c30:	9c                   	pushf
3c31     3c31:	58                   	pop    %rax
3c32     3c32:	fa                   	cli
3c33     3c33:	fb                   	sti
3c34     3c34:	9c                   	pushf
3c35     3c35:	58                   	pop    %rax
3c36     3c36:	fa                   	cli
3c37     3c37:	fb                   	sti
3c38     3c38:	9c                   	pushf
3c39     3c39:	58                   	pop    %rax
3c3a     3c3a:	fa                   	cli
3c3b     3c3b:	fb                   	sti
3c3c     3c3c:	9c                   	pushf
3c3d     3c3d:	58                   	pop    %rax
3c3e     3c3e:	fa                   	cli
3c3f     3c3f:	fb                   	sti
3c40     3c40:	9c                   	pushf
3c41     3c41:	58                   	pop    %rax
3c42     3c42:	fa                   	cli
3c43     3c43:	fb                   	sti
3c44     3c44:	9c                   	pushf
3c45     3c45:	58                   	pop    %rax
3c46     3c46:	fa                   	cli
3c47     3c47:	fb                   	sti
3c48     3c48:	9c                   	pushf
3c49     3c49:	58                   	pop    %rax
3c4a     3c4a:	fa                   	cli
3c4b     3c4b:	fb                   	sti
3c4c     3c4c:	9c                   	pushf
3c4d     3c4d:	58                   	pop    %rax
3c4e     3c4e:	fa                   	cli
3c4f     3c4f:	fb                   	sti
3c50     3c50:	9c                   	pushf
3c51     3c51:	58                   	pop    %rax
3c52     3c52:	fa                   	cli
3c53     3c53:	fb                   	sti
3c54     3c54:	9c                   	pushf
3c55     3c55:	58                   	pop    %rax
3c56     3c56:	fa                   	cli
3c57     3c57:	fb                   	sti
3c58     3c58:	9c                   	pushf
3c59     3c59:	58                   	pop    %rax
3c5a     3c5a:	fa                   	cli
3c5b     3c5b:	fb                   	sti
3c5c     3c5c:	9c                   	pushf
3c5d     3c5d:	58                   	pop    %rax
3c5e     3c5e:	fa                   	cli
3c5f     3c5f:	fb                   	sti
3c60     3c60:	9c                   	pushf
3c61     3c61:	58                   	pop    %rax
3c62     3c62:	fa                   	cli
3c63     3c63:	fb                   	sti
3c64     3c64:	9c                   	pushf
3c65     3c65:	58                   	pop    %rax
3c66     3c66:	fa                   	cli
3c67     3c67:	fb                   	sti
3c68     3c68:	9c                   	pushf
3c69     3c69:	58                   	pop    %rax
3c6a     3c6a:	fa                   	cli
3c6b     3c6b:	fb                   	sti
3c6c     3c6c:	9c                   	pushf
3c6d     3c6d:	58                   	pop    %rax
3c6e     3c6e:	fa                   	cli
3c6f     3c6f:	fb                   	sti
3c70     3c70:	9c                   	pushf
3c71     3c71:	58                   	pop    %rax
3c72     3c72:	fa                   	cli
3c73     3c73:	fb                   	sti
3c74     3c74:	9c                   	pushf
3c75     3c75:	58                   	pop    %rax
3c76     3c76:	fa                   	cli
3c77     3c77:	fb                   	sti
3c78     3c78:	9c                   	pushf
3c79     3c79:	58                   	pop    %rax
3c7a     3c7a:	fa                   	cli
3c7b     3c7b:	fb                   	sti
3c7c     3c7c:	9c                   	pushf
3c7d     3c7d:	58                   	pop    %rax
3c7e     3c7e:	fa                   	cli
3c7f     3c7f:	fb                   	sti
3c80     3c80:	9c                   	pushf
3c81     3c81:	58                   	pop    %rax
3c82     3c82:	fa                   	cli
3c83     3c83:	fb                   	sti
3c84     3c84:	9c                   	pushf
3c85     3c85:	58                   	pop    %rax
3c86     3c86:	fa                   	cli
3c87     3c87:	fb                   	sti
3c88     3c88:	9c                   	pushf
3c89     3c89:	58                   	pop    %rax
3c8a     3c8a:	fa                   	cli
3c8b     3c8b:	fb                   	sti
3c8c     3c8c:	9c                   	pushf
3c8d     3c8d:	58                   	pop    %rax
3c8e     3c8e:	fa                   	cli
3c8f     3c8f:	fb                   	sti
3c90     3c90:	9c                   	pushf
3c91     3c91:	58                   	pop    %rax
3c92     3c92:	fa                   	cli
3c93     3c93:	fb                   	sti
3c94     3c94:	9c                   	pushf
3c95     3c95:	58                   	pop    %rax
3c96     3c96:	fa                   	cli
3c97     3c97:	fb                   	sti
3c98     3c98:	9c                   	pushf
3c99     3c99:	58                   	pop    %rax
3c9a     3c9a:	fa                   	cli
3c9b     3c9b:	fb                   	sti
3c9c     3c9c:	9c                   	pushf
3c9d     3c9d:	58                   	pop    %rax
3c9e     3c9e:	fa                   	cli
3c9f     3c9f:	fb                   	sti
3ca0     3ca0:	9c                   	pushf
3ca1     3ca1:	58                   	pop    %rax
3ca2     3ca2:	fa                   	cli
3ca3     3ca3:	fb                   	sti
3ca4     3ca4:	9c                   	pushf
3ca5     3ca5:	58                   	pop    %rax
3ca6     3ca6:	fa                   	cli
3ca7     3ca7:	fb                   	sti
3ca8     3ca8:	9c                   	pushf
3ca9     3ca9:	58                   	pop    %rax
3caa     3caa:	fa                   	cli
3cab     3cab:	fb                   	sti
3cac     3cac:	9c                   	pushf
3cad     3cad:	58                   	pop    %rax
3cae     3cae:	fa                   	cli
3caf     3caf:	fb                   	sti
3cb0     3cb0:	9c                   	pushf
3cb1     3cb1:	58                   	pop    %rax
3cb2     3cb2:	fa                   	cli
3cb3     3cb3:	fb                   	sti
3cb4     3cb4:	9c                   	pushf
3cb5     3cb5:	58                   	pop    %rax
3cb6     3cb6:	fa                   	cli
3cb7     3cb7:	fb                   	sti
3cb8     3cb8:	9c                   	pushf
3cb9     3cb9:	58                   	pop    %rax
3cba     3cba:	fa                   	cli
3cbb     3cbb:	fb                   	sti
3cbc     3cbc:	9c                   	pushf
3cbd     3cbd:	58                   	pop    %rax
3cbe     3cbe:	fa                   	cli
3cbf     3cbf:	fb                   	sti
3cc0     3cc0:	9c                   	pushf
3cc1     3cc1:	58                   	pop    %rax
3cc2     3cc2:	fa                   	cli
3cc3     3cc3:	fb                   	sti
3cc4     3cc4:	9c                   	pushf
3cc5     3cc5:	58                   	pop    %rax
3cc6     3cc6:	fa                   	cli
3cc7     3cc7:	fb                   	sti
3cc8     3cc8:	9c                   	pushf
3cc9     3cc9:	58                   	pop    %rax
3cca     3cca:	fa                   	cli
3ccb     3ccb:	fb                   	sti
3ccc     3ccc:	9c                   	pushf
3ccd     3ccd:	58                   	pop    %rax
3cce     3cce:	fa                   	cli
3ccf     3ccf:	fb                   	sti
3cd0     3cd0:	9c                   	pushf
3cd1     3cd1:	58                   	pop    %rax
3cd2     3cd2:	fa                   	cli
3cd3     3cd3:	fb                   	sti
3cd4     3cd4:	9c                   	pushf
3cd5     3cd5:	58                   	pop    %rax
3cd6     3cd6:	fa                   	cli
3cd7     3cd7:	fb                   	sti
3cd8     3cd8:	9c                   	pushf
3cd9     3cd9:	58                   	pop    %rax
3cda     3cda:	fa                   	cli
3cdb     3cdb:	fb                   	sti
3cdc     3cdc:	9c                   	pushf
3cdd     3cdd:	58                   	pop    %rax
3cde     3cde:	fa                   	cli
3cdf     3cdf:	fb                   	sti
3ce0     3ce0:	9c                   	pushf
3ce1     3ce1:	58                   	pop    %rax
3ce2     3ce2:	fa                   	cli
3ce3     3ce3:	fb                   	sti
3ce4     3ce4:	9c                   	pushf
3ce5     3ce5:	58                   	pop    %rax
3ce6     3ce6:	fa                   	cli
3ce7     3ce7:	fb                   	sti
3ce8     3ce8:	9c                   	pushf
3ce9     3ce9:	58                   	pop    %rax
3cea     3cea:	fa                   	cli
3ceb     3ceb:	fb                   	sti
3cec     3cec:	9c                   	pushf
3ced     3ced:	58                   	pop    %rax
3cee     3cee:	fa                   	cli
3cef     3cef:	fb                   	sti
3cf0     3cf0:	9c                   	pushf
3cf1     3cf1:	58                   	pop    %rax
3cf2     3cf2:	fa                   	cli
3cf3     3cf3:	fb                   	sti
3cf4     3cf4:	9c                   	pushf
3cf5     3cf5:	58                   	pop    %rax
3cf6     3cf6:	fa                   	cli
3cf7     3cf7:	fb                   	sti
3cf8     3cf8:	9c                   	pushf
3cf9     3cf9:	58                   	pop    %rax
3cfa     3cfa:	fa                   	cli
3cfb     3cfb:	fb                   	sti
3cfc     3cfc:	9c                   	pushf
3cfd     3cfd:	58                   	pop    %rax
3cfe     3cfe:	fa                   	cli
3cff     3cff:	fb                   	sti
3d00     3d00:	9c                   	pushf
3d01     3d01:	58                   	pop    %rax
3d02     3d02:	fa                   	cli
3d03     3d03:	fb                   	sti
3d04     3d04:	9c                   	pushf
3d05     3d05:	58                   	pop    %rax
3d06     3d06:	fa                   	cli
3d07     3d07:	fb                   	sti
3d08     3d08:	9c                   	pushf
3d09     3d09:	58                   	pop    %rax
3d0a     3d0a:	fa                   	cli
3d0b     3d0b:	fb                   	sti
3d0c     3d0c:	9c                   	pushf
3d0d     3d0d:	58                   	pop    %rax
3d0e     3d0e:	fa                   	cli
3d0f     3d0f:	fb                   	sti
3d10     3d10:	9c                   	pushf
3d11     3d11:	58                   	pop    %rax
3d12     3d12:	fa                   	cli
3d13     3d13:	fb                   	sti
3d14     3d14:	9c                   	pushf
3d15     3d15:	58                   	pop    %rax
3d16     3d16:	fa                   	cli
3d17     3d17:	fb                   	sti
3d18     3d18:	9c                   	pushf
3d19     3d19:	58                   	pop    %rax
3d1a     3d1a:	fa                   	cli
3d1b     3d1b:	fb                   	sti
3d1c     3d1c:	9c                   	pushf
3d1d     3d1d:	58                   	pop    %rax
3d1e     3d1e:	fa                   	cli
3d1f     3d1f:	fb                   	sti
3d20     3d20:	9c                   	pushf
3d21     3d21:	58                   	pop    %rax
3d22     3d22:	fa                   	cli
3d23     3d23:	fb                   	sti
3d24     3d24:	9c                   	pushf
3d25     3d25:	58                   	pop    %rax
3d26     3d26:	fa                   	cli
3d27     3d27:	fb                   	sti
3d28     3d28:	9c                   	pushf
3d29     3d29:	58                   	pop    %rax
3d2a     3d2a:	fa                   	cli
3d2b     3d2b:	fb                   	sti
3d2c     3d2c:	9c                   	pushf
3d2d     3d2d:	58                   	pop    %rax
3d2e     3d2e:	fa                   	cli
3d2f     3d2f:	fb                   	sti
3d30     3d30:	9c                   	pushf
3d31     3d31:	58                   	pop    %rax
3d32     3d32:	fa                   	cli
3d33     3d33:	fb                   	sti
3d34     3d34:	9c                   	pushf
3d35     3d35:	58                   	pop    %rax
3d36     3d36:	fa                   	cli
3d37     3d37:	fb                   	sti
3d38     3d38:	9c                   	pushf
3d39     3d39:	58                   	pop    %rax
3d3a     3d3a:	fa                   	cli
3d3b     3d3b:	fb                   	sti
3d3c     3d3c:	9c                   	pushf
3d3d     3d3d:	58                   	pop    %rax
3d3e     3d3e:	fa                   	cli
3d3f     3d3f:	fb                   	sti
3d40     3d40:	9c                   	pushf
3d41     3d41:	58                   	pop    %rax
3d42     3d42:	fa                   	cli
3d43     3d43:	fb                   	sti
3d44     3d44:	9c                   	pushf
3d45     3d45:	58                   	pop    %rax
3d46     3d46:	fa                   	cli
3d47     3d47:	fb                   	sti
3d48     3d48:	9c                   	pushf
3d49     3d49:	58                   	pop    %rax
3d4a     3d4a:	fa                   	cli
3d4b     3d4b:	fb                   	sti
3d4c     3d4c:	9c                   	pushf
3d4d     3d4d:	58                   	pop    %rax
3d4e     3d4e:	fa                   	cli
3d4f     3d4f:	fb                   	sti
3d50     3d50:	9c                   	pushf
3d51     3d51:	58                   	pop    %rax
3d52     3d52:	fa                   	cli
3d53     3d53:	fb                   	sti
3d54     3d54:	9c                   	pushf
3d55     3d55:	58                   	pop    %rax
3d56     3d56:	fa                   	cli
3d57     3d57:	fb                   	sti
3d58     3d58:	9c                   	pushf
3d59     3d59:	58                   	pop    %rax
3d5a     3d5a:	fa                   	cli
3d5b     3d5b:	fb                   	sti
3d5c     3d5c:	9c                   	pushf
3d5d     3d5d:	58                   	pop    %rax
3d5e     3d5e:	fa                   	cli
3d5f     3d5f:	fb                   	sti
3d60     3d60:	9c                   	pushf
3d61     3d61:	58                   	pop    %rax
3d62     3d62:	fa                   	cli
3d63     3d63:	fb                   	sti
3d64     3d64:	9c                   	pushf
3d65     3d65:	58                   	pop    %rax
3d66     3d66:	fa                   	cli
3d67     3d67:	fb                   	sti
3d68     3d68:	9c                   	pushf
3d69     3d69:	58                   	pop    %rax
3d6a     3d6a:	fa                   	cli
3d6b     3d6b:	fb                   	sti
3d6c     3d6c:	9c                   	pushf
3d6d     3d6d:	58                   	pop    %rax
3d6e     3d6e:	fa                   	cli
3d6f     3d6f:	fb                   	sti
3d70     3d70:	9c                   	pushf
3d71     3d71:	58                   	pop    %rax
3d72     3d72:	fa                   	cli
3d73     3d73:	fb                   	sti
3d74     3d74:	9c                   	pushf
3d75     3d75:	58                   	pop    %rax
3d76     3d76:	fa                   	cli
3d77     3d77:	fb                   	sti
3d78     3d78:	9c                   	pushf
3d79     3d79:	58                   	pop    %rax
3d7a     3d7a:	fa                   	cli
3d7b     3d7b:	fb                   	sti
3d7c     3d7c:	9c                   	pushf
3d7d     3d7d:	58                   	pop    %rax
3d7e     3d7e:	fa                   	cli
3d7f     3d7f:	fb                   	sti
3d80     3d80:	9c                   	pushf
3d81     3d81:	58                   	pop    %rax
3d82     3d82:	fa                   	cli
3d83     3d83:	fb                   	sti
3d84     3d84:	9c                   	pushf
3d85     3d85:	58                   	pop    %rax
3d86     3d86:	fa                   	cli
3d87     3d87:	fb                   	sti
3d88     3d88:	9c                   	pushf
3d89     3d89:	58                   	pop    %rax
3d8a     3d8a:	fa                   	cli
3d8b     3d8b:	fb                   	sti
3d8c     3d8c:	9c                   	pushf
3d8d     3d8d:	58                   	pop    %rax
3d8e     3d8e:	fa                   	cli
3d8f     3d8f:	fb                   	sti
3d90     3d90:	9c                   	pushf
3d91     3d91:	58                   	pop    %rax
3d92     3d92:	fa                   	cli
3d93     3d93:	fb                   	sti
3d94     3d94:	9c                   	pushf
3d95     3d95:	58                   	pop    %rax
3d96     3d96:	fa                   	cli
3d97     3d97:	fb                   	sti
3d98     3d98:	9c                   	pushf
3d99     3d99:	58                   	pop    %rax
3d9a     3d9a:	fa                   	cli
3d9b     3d9b:	fb                   	sti
3d9c     3d9c:	9c                   	pushf
3d9d     3d9d:	58                   	pop    %rax
3d9e     3d9e:	fa                   	cli
3d9f     3d9f:	fb                   	sti
3da0     3da0:	9c                   	pushf
3da1     3da1:	58                   	pop    %rax
3da2     3da2:	fa                   	cli
3da3     3da3:	fb                   	sti
3da4     3da4:	9c                   	pushf
3da5     3da5:	58                   	pop    %rax
3da6     3da6:	fa                   	cli
3da7     3da7:	fb                   	sti
3da8     3da8:	9c                   	pushf
3da9     3da9:	58                   	pop    %rax
3daa     3daa:	fa                   	cli
3dab     3dab:	fb                   	sti
3dac     3dac:	9c                   	pushf
3dad     3dad:	58                   	pop    %rax
3dae     3dae:	fa                   	cli
3daf     3daf:	fb                   	sti
3db0     3db0:	9c                   	pushf
3db1     3db1:	58                   	pop    %rax
3db2     3db2:	fa                   	cli
3db3     3db3:	fb                   	sti
3db4     3db4:	9c                   	pushf
3db5     3db5:	58                   	pop    %rax
3db6     3db6:	fa                   	cli
3db7     3db7:	fb                   	sti
3db8     3db8:	9c                   	pushf
3db9     3db9:	58                   	pop    %rax
3dba     3dba:	fa                   	cli
3dbb     3dbb:	fb                   	sti
3dbc     3dbc:	9c                   	pushf
3dbd     3dbd:	58                   	pop    %rax
3dbe     3dbe:	fa                   	cli
3dbf     3dbf:	fb                   	sti
3dc0     3dc0:	9c                   	pushf
3dc1     3dc1:	58                   	pop    %rax
3dc2     3dc2:	fa                   	cli
3dc3     3dc3:	fb                   	sti
3dc4     3dc4:	9c                   	pushf
3dc5     3dc5:	58                   	pop    %rax
3dc6     3dc6:	fa                   	cli
3dc7     3dc7:	fb                   	sti
3dc8     3dc8:	9c                   	pushf
3dc9     3dc9:	58                   	pop    %rax
3dca     3dca:	fa                   	cli
3dcb     3dcb:	fb                   	sti
3dcc     3dcc:	9c                   	pushf
3dcd     3dcd:	58                   	pop    %rax
3dce     3dce:	fa                   	cli
3dcf     3dcf:	fb                   	sti
3dd0     3dd0:	9c                   	pushf
3dd1     3dd1:	58                   	pop    %rax
3dd2     3dd2:	fa                   	cli
3dd3     3dd3:	fb                   	sti
3dd4     3dd4:	9c                   	pushf
3dd5     3dd5:	58                   	pop    %rax
3dd6     3dd6:	fa                   	cli
3dd7     3dd7:	fb                   	sti
3dd8     3dd8:	9c                   	pushf
3dd9     3dd9:	58                   	pop    %rax
3dda     3dda:	fa                   	cli
3ddb     3ddb:	fb                   	sti
3ddc     3ddc:	9c                   	pushf
3ddd     3ddd:	58                   	pop    %rax
3dde     3dde:	fa                   	cli
3ddf     3ddf:	fb                   	sti
3de0     3de0:	9c                   	pushf
3de1     3de1:	58                   	pop    %rax
3de2     3de2:	fa                   	cli
3de3     3de3:	fb                   	sti
3de4     3de4:	9c                   	pushf
3de5     3de5:	58                   	pop    %rax
3de6     3de6:	fa                   	cli
3de7     3de7:	fb                   	sti
3de8     3de8:	9c                   	pushf
3de9     3de9:	58                   	pop    %rax
3dea     3dea:	fa                   	cli
3deb     3deb:	fb                   	sti
3dec     3dec:	9c                   	pushf
3ded     3ded:	58                   	pop    %rax
3dee     3dee:	fa                   	cli
3def     3def:	fb                   	sti
3df0     3df0:	9c                   	pushf
3df1     3df1:	58                   	pop    %rax
3df2     3df2:	fa                   	cli
3df3     3df3:	fb                   	sti
3df4     3df4:	9c                   	pushf
3df5     3df5:	58                   	pop    %rax
3df6     3df6:	fa                   	cli
3df7     3df7:	fb                   	sti
3df8     3df8:	9c                   	pushf
3df9     3df9:	58                   	pop    %rax
3dfa     3dfa:	fa                   	cli
3dfb     3dfb:	fb                   	sti
3dfc     3dfc:	9c                   	pushf
3dfd     3dfd:	58                   	pop    %rax
3dfe     3dfe:	fa                   	cli
3dff     3dff:	fb                   	sti
3e00     3e00:	9c                   	pushf
3e01     3e01:	58                   	pop    %rax
3e02     3e02:	fa                   	cli
3e03     3e03:	fb                   	sti
3e04     3e04:	9c                   	pushf
3e05     3e05:	58                   	pop    %rax
3e06     3e06:	fa                   	cli
3e07     3e07:	fb                   	sti
3e08     3e08:	9c                   	pushf
3e09     3e09:	58                   	pop    %rax
3e0a     3e0a:	fa                   	cli
3e0b     3e0b:	fb                   	sti
3e0c     3e0c:	9c                   	pushf
3e0d     3e0d:	58                   	pop    %rax
3e0e     3e0e:	fa                   	cli
3e0f     3e0f:	fb                   	sti
3e10     3e10:	9c                   	pushf
3e11     3e11:	58                   	pop    %rax
3e12     3e12:	fa                   	cli
3e13     3e13:	fb                   	sti
3e14     3e14:	9c                   	pushf
3e15     3e15:	58                   	pop    %rax
3e16     3e16:	fa                   	cli
3e17     3e17:	fb                   	sti
3e18     3e18:	9c                   	pushf
3e19     3e19:	58                   	pop    %rax
3e1a     3e1a:	fa                   	cli
3e1b     3e1b:	fb                   	sti
3e1c     3e1c:	9c                   	pushf
3e1d     3e1d:	58                   	pop    %rax
3e1e     3e1e:	fa                   	cli
3e1f     3e1f:	fb                   	sti
3e20     3e20:	9c                   	pushf
3e21     3e21:	58                   	pop    %rax
3e22     3e22:	fa                   	cli
3e23     3e23:	fb                   	sti
3e24     3e24:	9c                   	pushf
3e25     3e25:	58                   	pop    %rax
3e26     3e26:	fa                   	cli
3e27     3e27:	fb                   	sti
3e28     3e28:	9c                   	pushf
3e29     3e29:	58                   	pop    %rax
3e2a     3e2a:	fa                   	cli
3e2b     3e2b:	fb                   	sti
3e2c     3e2c:	9c                   	pushf
3e2d     3e2d:	58                   	pop    %rax
3e2e     3e2e:	fa                   	cli
3e2f     3e2f:	fb                   	sti
3e30     3e30:	9c                   	pushf
3e31     3e31:	58                   	pop    %rax
3e32     3e32:	fa                   	cli
3e33     3e33:	fb                   	sti
3e34     3e34:	9c                   	pushf
3e35     3e35:	58                   	pop    %rax
3e36     3e36:	fa                   	cli
3e37     3e37:	fb                   	sti
3e38     3e38:	9c                   	pushf
3e39     3e39:	58                   	pop    %rax
3e3a     3e3a:	fa                   	cli
3e3b     3e3b:	fb                   	sti
3e3c     3e3c:	9c                   	pushf
3e3d     3e3d:	58                   	pop    %rax
3e3e     3e3e:	fa                   	cli
3e3f     3e3f:	fb                   	sti
3e40     3e40:	9c                   	pushf
3e41     3e41:	58                   	pop    %rax
3e42     3e42:	fa                   	cli
3e43     3e43:	fb                   	sti
3e44     3e44:	9c                   	pushf
3e45     3e45:	58                   	pop    %rax
3e46     3e46:	fa                   	cli
3e47     3e47:	fb                   	sti
3e48     3e48:	9c                   	pushf
3e49     3e49:	58                   	pop    %rax
3e4a     3e4a:	fa                   	cli
3e4b     3e4b:	fb                   	sti
3e4c     3e4c:	9c                   	pushf
3e4d     3e4d:	58                   	pop    %rax
3e4e     3e4e:	fa                   	cli
3e4f     3e4f:	fb                   	sti
3e50     3e50:	9c                   	pushf
3e51     3e51:	58                   	pop    %rax
3e52     3e52:	fa                   	cli
3e53     3e53:	fb                   	sti
3e54     3e54:	9c                   	pushf
3e55     3e55:	58                   	pop    %rax
3e56     3e56:	fa                   	cli
3e57     3e57:	fb                   	sti
3e58     3e58:	9c                   	pushf
3e59     3e59:	58                   	pop    %rax
3e5a     3e5a:	fa                   	cli
3e5b     3e5b:	fb                   	sti
3e5c     3e5c:	9c                   	pushf
3e5d     3e5d:	58                   	pop    %rax
3e5e     3e5e:	fa                   	cli
3e5f     3e5f:	fb                   	sti
3e60     3e60:	9c                   	pushf
3e61     3e61:	58                   	pop    %rax
3e62     3e62:	fa                   	cli
3e63     3e63:	fb                   	sti
3e64     3e64:	9c                   	pushf
3e65     3e65:	58                   	pop    %rax
3e66     3e66:	fa                   	cli
3e67     3e67:	fb                   	sti
3e68     3e68:	9c                   	pushf
3e69     3e69:	58                   	pop    %rax
3e6a     3e6a:	fa                   	cli
3e6b     3e6b:	fb                   	sti
3e6c     3e6c:	9c                   	pushf
3e6d     3e6d:	58                   	pop    %rax
3e6e     3e6e:	fa                   	cli
3e6f     3e6f:	fb                   	sti
3e70     3e70:	9c                   	pushf
3e71     3e71:	58                   	pop    %rax
3e72     3e72:	fa                   	cli
3e73     3e73:	fb                   	sti
3e74     3e74:	9c                   	pushf
3e75     3e75:	58                   	pop    %rax
3e76     3e76:	fa                   	cli
3e77     3e77:	fb                   	sti
3e78     3e78:	9c                   	pushf
3e79     3e79:	58                   	pop    %rax
3e7a     3e7a:	fa                   	cli
3e7b     3e7b:	fb                   	sti
3e7c     3e7c:	9c                   	pushf
3e7d     3e7d:	58                   	pop    %rax
3e7e     3e7e:	fa                   	cli
3e7f     3e7f:	fb                   	sti
3e80     3e80:	9c                   	pushf
3e81     3e81:	58                   	pop    %rax
3e82     3e82:	fa                   	cli
3e83     3e83:	fb                   	sti
3e84     3e84:	9c                   	pushf
3e85     3e85:	58                   	pop    %rax
3e86     3e86:	fa                   	cli
3e87     3e87:	fb                   	sti
3e88     3e88:	9c                   	pushf
3e89     3e89:	58                   	pop    %rax
3e8a     3e8a:	fa                   	cli
3e8b     3e8b:	fb                   	sti
3e8c     3e8c:	9c                   	pushf
3e8d     3e8d:	58                   	pop    %rax
3e8e     3e8e:	fa                   	cli
3e8f     3e8f:	fb                   	sti
3e90     3e90:	9c                   	pushf
3e91     3e91:	58                   	pop    %rax
3e92     3e92:	fa                   	cli
3e93     3e93:	fb                   	sti
3e94     3e94:	9c                   	pushf
3e95     3e95:	58                   	pop    %rax
3e96     3e96:	fa                   	cli
3e97     3e97:	fb                   	sti
3e98     3e98:	9c                   	pushf
3e99     3e99:	58                   	pop    %rax
3e9a     3e9a:	fa                   	cli
3e9b     3e9b:	fb                   	sti
3e9c     3e9c:	9c                   	pushf
3e9d     3e9d:	58                   	pop    %rax
3e9e     3e9e:	fa                   	cli
3e9f     3e9f:	fb                   	sti
3ea0     3ea0:	9c                   	pushf
3ea1     3ea1:	58                   	pop    %rax
3ea2     3ea2:	fa                   	cli
3ea3     3ea3:	fb                   	sti
3ea4     3ea4:	9c                   	pushf
3ea5     3ea5:	58                   	pop    %rax
3ea6     3ea6:	fa                   	cli
3ea7     3ea7:	fb                   	sti
3ea8     3ea8:	9c                   	pushf
3ea9     3ea9:	58                   	pop    %rax
3eaa     3eaa:	fa                   	cli
3eab     3eab:	fb                   	sti
3eac     3eac:	9c                   	pushf
3ead     3ead:	58                   	pop    %rax
3eae     3eae:	fa                   	cli
3eaf     3eaf:	fb                   	sti
3eb0     3eb0:	9c                   	pushf
3eb1     3eb1:	58                   	pop    %rax
3eb2     3eb2:	fa                   	cli
3eb3     3eb3:	fb                   	sti
3eb4     3eb4:	9c                   	pushf
3eb5     3eb5:	58                   	pop    %rax
3eb6     3eb6:	fa                   	cli
3eb7     3eb7:	fb                   	sti
3eb8     3eb8:	9c                   	pushf
3eb9     3eb9:	58                   	pop    %rax
3eba     3eba:	fa                   	cli
3ebb     3ebb:	fb                   	sti
3ebc     3ebc:	9c                   	pushf
3ebd     3ebd:	58                   	pop    %rax
3ebe     3ebe:	fa                   	cli
3ebf     3ebf:	fb                   	sti
3ec0     3ec0:	9c                   	pushf
3ec1     3ec1:	58                   	pop    %rax
3ec2     3ec2:	fa                   	cli
3ec3     3ec3:	fb                   	sti
3ec4     3ec4:	9c                   	pushf
3ec5     3ec5:	58                   	pop    %rax
3ec6     3ec6:	fa                   	cli
3ec7     3ec7:	fb                   	sti
3ec8     3ec8:	9c                   	pushf
3ec9     3ec9:	58                   	pop    %rax
3eca     3eca:	fa                   	cli
3ecb     3ecb:	fb                   	sti
3ecc     3ecc:	9c                   	pushf
3ecd     3ecd:	58                   	pop    %rax
3ece     3ece:	fa                   	cli
3ecf     3ecf:	fb                   	sti
3ed0     3ed0:	9c                   	pushf
3ed1     3ed1:	58                   	pop    %rax
3ed2     3ed2:	fa                   	cli
3ed3     3ed3:	fb                   	sti
3ed4     3ed4:	9c                   	pushf
3ed5     3ed5:	58                   	pop    %rax
3ed6     3ed6:	fa                   	cli
3ed7     3ed7:	fb                   	sti
3ed8     3ed8:	9c                   	pushf
3ed9     3ed9:	58                   	pop    %rax
3eda     3eda:	fb                   	sti
3edb     3edb:	9c                   	pushf
3edc     3edc:	58                   	pop    %rax
3edd     3edd:	fa                   	cli
3ede     3ede:	9c                   	pushf
3edf     3edf:	58                   	pop    %rax
3ee0     3ee0:	fa                   	cli
3ee1     3ee1:	9c                   	pushf
3ee2     3ee2:	58                   	pop    %rax
3ee3     3ee3:	fa                   	cli
3ee4     3ee4:	fb                   	sti
3ee5     3ee5:	9c                   	pushf
3ee6     3ee6:	58                   	pop    %rax
3ee7     3ee7:	fa                   	cli
3ee8     3ee8:	9c                   	pushf
3ee9     3ee9:	58                   	pop    %rax
3eea     3eea:	fa                   	cli
3eeb     3eeb:	9c                   	pushf
3eec     3eec:	58                   	pop    %rax
3eed     3eed:	fa                   	cli
3eee     3eee:	9c                   	pushf
3eef     3eef:	58                   	pop    %rax
3ef0     3ef0:	fa                   	cli
3ef1     3ef1:	9c                   	pushf
3ef2     3ef2:	58                   	pop    %rax
3ef3     3ef3:	fa                   	cli
3ef4     3ef4:	9c                   	pushf
3ef5     3ef5:	58                   	pop    %rax
3ef6     3ef6:	fa                   	cli
3ef7     3ef7:	9c                   	pushf
3ef8     3ef8:	58                   	pop    %rax
3ef9     3ef9:	fa                   	cli
3efa     3efa:	9c                   	pushf
3efb     3efb:	58                   	pop    %rax
3efc     3efc:	fa                   	cli
3efd     3efd:	9c                   	pushf
3efe     3efe:	58                   	pop    %rax
3eff     3eff:	fa                   	cli
3f00     3f00:	9c                   	pushf
3f01     3f01:	58                   	pop    %rax
3f02     3f02:	fa                   	cli
3f03     3f03:	fb                   	sti
3f04     3f04:	9c                   	pushf
3f05     3f05:	58                   	pop    %rax
3f06     3f06:	fa                   	cli
3f07     3f07:	fb                   	sti
3f08     3f08:	9c                   	pushf
3f09     3f09:	58                   	pop    %rax
3f0a     3f0a:	fa                   	cli
3f0b     3f0b:	9c                   	pushf
3f0c     3f0c:	58                   	pop    %rax
3f0d     3f0d:	fa                   	cli
3f0e     3f0e:	9c                   	pushf
3f0f     3f0f:	58                   	pop    %rax
3f10     3f10:	fa                   	cli
3f11     3f11:	fb                   	sti
3f12     3f12:	9c                   	pushf
3f13     3f13:	58                   	pop    %rax
3f14     3f14:	fa                   	cli
3f15     3f15:	fb                   	sti
3f16     3f16:	9c                   	pushf
3f17     3f17:	58                   	pop    %rax
3f18     3f18:	fa                   	cli
3f19     3f19:	fb                   	sti
3f1a     3f1a:	9c                   	pushf
3f1b     3f1b:	58                   	pop    %rax
3f1c     3f1c:	fa                   	cli
3f1d     3f1d:	fb                   	sti
3f1e     3f1e:	9c                   	pushf
3f1f     3f1f:	58                   	pop    %rax
3f20     3f20:	9c                   	pushf
3f21     3f21:	58                   	pop    %rax
3f22     3f22:	fa                   	cli
3f23     3f23:	9c                   	pushf
3f24     3f24:	58                   	pop    %rax
3f25     3f25:	fb                   	sti
3f26     3f26:	9c                   	pushf
3f27     3f27:	58                   	pop    %rax
3f28     3f28:	fa                   	cli
3f29     3f29:	9c                   	pushf
3f2a     3f2a:	58                   	pop    %rax
3f2b     3f2b:	fb                   	sti
3f2c     3f2c:	9c                   	pushf
3f2d     3f2d:	58                   	pop    %rax
3f2e     3f2e:	9c                   	pushf
3f2f     3f2f:	58                   	pop    %rax
3f30     3f30:	fa                   	cli
3f31     3f31:	9c                   	pushf
3f32     3f32:	58                   	pop    %rax
3f33     3f33:	fb                   	sti
3f34     3f34:	9c                   	pushf
3f35     3f35:	58                   	pop    %rax
3f36     3f36:	fa                   	cli
3f37     3f37:	9c                   	pushf
3f38     3f38:	58                   	pop    %rax
3f39     3f39:	fb                   	sti
3f3a     3f3a:	9c                   	pushf
3f3b     3f3b:	58                   	pop    %rax
3f3c     3f3c:	fa                   	cli
3f3d     3f3d:	9c                   	pushf
3f3e     3f3e:	58                   	pop    %rax
3f3f     3f3f:	fb                   	sti
3f40     3f40:	9c                   	pushf
3f41     3f41:	58                   	pop    %rax
3f42     3f42:	fa                   	cli
3f43     3f43:	9c                   	pushf
3f44     3f44:	58                   	pop    %rax
3f45     3f45:	fb                   	sti
3f46     3f46:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
3f50     3f50:	65 48 23 1c 25 00 00 00 00 	and    %gs:0x0,%rbx	3f55: R_X86_64_32S	tlbstate_untag_mask
3f59     3f59:	0f 01 cb             	stac
3f5c     3f5c:	0f ae e8             	lfence
3f5f     3f5f:	0f 01 ca             	clac
3f62     3f62:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
3f6c     3f6c:	65 4c 23 24 25 00 00 00 00 	and    %gs:0x0,%r12	3f71: R_X86_64_32S	tlbstate_untag_mask
3f75     3f75:	0f 01 cb             	stac
3f78     3f78:	0f ae e8             	lfence
3f7b     3f7b:	0f 01 ca             	clac
3f7e     3f7e:	9c                   	pushf
3f7f     3f7f:	58                   	pop    %rax
3f80     3f80:	fa                   	cli
3f81     3f81:	9c                   	pushf
3f82     3f82:	58                   	pop    %rax
3f83     3f83:	fb                   	sti
3f84     3f84:	9c                   	pushf
3f85     3f85:	58                   	pop    %rax
3f86     3f86:	fa                   	cli
3f87     3f87:	fb                   	sti
3f88     3f88:	9c                   	pushf
3f89     3f89:	58                   	pop    %rax
3f8a     3f8a:	fa                   	cli
3f8b     3f8b:	9c                   	pushf
3f8c     3f8c:	58                   	pop    %rax
3f8d     3f8d:	fb                   	sti
3f8e     3f8e:	9c                   	pushf
3f8f     3f8f:	58                   	pop    %rax
3f90     3f90:	fa                   	cli
3f91     3f91:	fb                   	sti
3f92     3f92:	9c                   	pushf
3f93     3f93:	58                   	pop    %rax
3f94     3f94:	fa                   	cli
3f95     3f95:	fb                   	sti
3f96     3f96:	9c                   	pushf
3f97     3f97:	41 5d                	pop    %r13
3f99     3f99:	0f 01 ca             	clac
3f9c     3f9c:	41 55                	push   %r13
3f9e     3f9e:	9d                   	popf
3f9f     3f9f:	9c                   	pushf
3fa0     3fa0:	8f 44 24 10          	pop    0x10(%rsp)
3fa4     3fa4:	0f 01 ca             	clac
3fa7     3fa7:	ff 74 24 10          	push   0x10(%rsp)
3fab     3fab:	9d                   	popf
3fac     3fac:	9c                   	pushf
3fad     3fad:	41 5d                	pop    %r13
3faf     3faf:	0f 01 ca             	clac
3fb2     3fb2:	41 55                	push   %r13
3fb4     3fb4:	9d                   	popf
3fb5     3fb5:	9c                   	pushf
3fb6     3fb6:	58                   	pop    %rax
3fb7     3fb7:	fb                   	sti
3fb8     3fb8:	9c                   	pushf
3fb9     3fb9:	58                   	pop    %rax
3fba     3fba:	fb                   	sti
3fbb     3fbb:	9c                   	pushf
3fbc     3fbc:	58                   	pop    %rax
3fbd     3fbd:	fa                   	cli
3fbe     3fbe:	0f 09                	wbinvd
3fc0     3fc0:	f3 0f b8 c7          	popcnt %edi,%eax
3fc4     3fc4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3fc9     3fc9:	9c                   	pushf
3fca     3fca:	58                   	pop    %rax
3fcb     3fcb:	fa                   	cli
3fcc     3fcc:	fb                   	sti
3fcd     3fcd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3fd2     3fd2:	f3 0f b8 c7          	popcnt %edi,%eax
3fd6     3fd6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3fdb     3fdb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3fe0     3fe0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3fe5     3fe5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3fea     3fea:	f3 48 0f b8 c7       	popcnt %rdi,%rax
3fef     3fef:	9c                   	pushf
3ff0     3ff0:	58                   	pop    %rax
3ff1     3ff1:	fa                   	cli
3ff2     3ff2:	e8 00 00 00 00       	call   3ff7 <.altinstr_replacement+0x3ff7>	3ff3: R_X86_64_PLT32	__x86_indirect_thunk_r12-0x4
3ff7     3ff7:	0f ae e8             	lfence
3ffa     3ffa:	41 ff d4             	call   *%r12
3ffd     3ffd:	9c                   	pushf
3ffe     3ffe:	58                   	pop    %rax
3fff     3fff:	fb                   	sti
4000     4000:	e8 00 00 00 00       	call   4005 <.altinstr_replacement+0x4005>	4001: R_X86_64_PLT32	__x86_indirect_thunk_rbx-0x4
4005     4005:	0f ae e8             	lfence
4008     4008:	ff d3                	call   *%rbx
400a     400a:	e8 00 00 00 00       	call   400f <.altinstr_replacement+0x400f>	400b: R_X86_64_PLT32	__x86_indirect_thunk_rax-0x4
400f     400f:	0f ae e8             	lfence
4012     4012:	ff d0                	call   *%rax
4014     4014:	9c                   	pushf
4015     4015:	58                   	pop    %rax
4016     4016:	fa                   	cli
4017     4017:	fb                   	sti
4018     4018:	e9 00 00 00 00       	jmp    401d <.altinstr_replacement+0x401d>	4019: R_X86_64_PC32	.cpuidle.text+0x8e6
401d     401d:	e9 00 00 00 00       	jmp    4022 <.altinstr_replacement+0x4022>	401e: R_X86_64_PC32	.cpuidle.text+0x881
4022     4022:	fb                   	sti
4023     4023:	e9 00 00 00 00       	jmp    4028 <.altinstr_replacement+0x4028>	4024: R_X86_64_PC32	.cpuidle.text+0xa4d
4028     4028:	e9 00 00 00 00       	jmp    402d <.altinstr_replacement+0x402d>	4029: R_X86_64_PC32	.cpuidle.text+0x9d6
402d     402d:	fa                   	cli
402e     402e:	e9 00 00 00 00       	jmp    4033 <.altinstr_replacement+0x4033>	402f: R_X86_64_PC32	.cpuidle.text+0xbb6
4033     4033:	e9 00 00 00 00       	jmp    4038 <.altinstr_replacement+0x4038>	4034: R_X86_64_PC32	.cpuidle.text+0xb50
4038     4038:	e9 00 00 00 00       	jmp    403d <.altinstr_replacement+0x403d>	4039: R_X86_64_PC32	.cpuidle.text+0xceb
403d     403d:	e9 00 00 00 00       	jmp    4042 <.altinstr_replacement+0x4042>	403e: R_X86_64_PC32	.cpuidle.text+0xc86
4042     4042:	e9 00 00 00 00       	jmp    4047 <.altinstr_replacement+0x4047>	4043: R_X86_64_PC32	.cpuidle.text+0xe64
4047     4047:	e9 00 00 00 00       	jmp    404c <.altinstr_replacement+0x404c>	4048: R_X86_64_PC32	.cpuidle.text+0xde5
404c     404c:	e9 00 00 00 00       	jmp    4051 <.altinstr_replacement+0x4051>	404d: R_X86_64_PC32	.text+0x3665371
4051     4051:	9c                   	pushf
4052     4052:	58                   	pop    %rax
4053     4053:	9c                   	pushf
4054     4054:	58                   	pop    %rax
4055     4055:	9c                   	pushf
4056     4056:	58                   	pop    %rax
4057     4057:	fa                   	cli
4058     4058:	e9 00 00 00 00       	jmp    405d <.altinstr_replacement+0x405d>	4059: R_X86_64_PC32	.text+0x36bad2e
405d     405d:	9c                   	pushf
405e     405e:	58                   	pop    %rax
405f     405f:	9c                   	pushf
4060     4060:	58                   	pop    %rax
4061     4061:	0f 30                	wrmsr
4063     4063:	0f 30                	wrmsr
4065     4065:	0f 30                	wrmsr
4067     4067:	9c                   	pushf
4068     4068:	58                   	pop    %rax
4069     4069:	9c                   	pushf
406a     406a:	58                   	pop    %rax
406b     406b:	9c                   	pushf
406c     406c:	58                   	pop    %rax
406d     406d:	9c                   	pushf
406e     406e:	58                   	pop    %rax
406f     406f:	9c                   	pushf
4070     4070:	58                   	pop    %rax
4071     4071:	9c                   	pushf
4072     4072:	58                   	pop    %rax
4073     4073:	9c                   	pushf
4074     4074:	58                   	pop    %rax
4075     4075:	9c                   	pushf
4076     4076:	58                   	pop    %rax
4077     4077:	9c                   	pushf
4078     4078:	58                   	pop    %rax
4079     4079:	9c                   	pushf
407a     407a:	58                   	pop    %rax
407b     407b:	9c                   	pushf
407c     407c:	58                   	pop    %rax
407d     407d:	9c                   	pushf
407e     407e:	58                   	pop    %rax
407f     407f:	9c                   	pushf
4080     4080:	58                   	pop    %rax
4081     4081:	9c                   	pushf
4082     4082:	58                   	pop    %rax
4083     4083:	9c                   	pushf
4084     4084:	58                   	pop    %rax
4085     4085:	9c                   	pushf
4086     4086:	58                   	pop    %rax
4087     4087:	9c                   	pushf
4088     4088:	58                   	pop    %rax
4089     4089:	9c                   	pushf
408a     408a:	58                   	pop    %rax
408b     408b:	9c                   	pushf
408c     408c:	58                   	pop    %rax
408d     408d:	9c                   	pushf
408e     408e:	58                   	pop    %rax
408f     408f:	e9 00 00 00 00       	jmp    4094 <.altinstr_replacement+0x4094>	4090: R_X86_64_PC32	.text+0x373af62
4094     4094:	0f 09                	wbinvd
4096     4096:	9c                   	pushf
4097     4097:	58                   	pop    %rax
4098     4098:	9c                   	pushf
4099     4099:	58                   	pop    %rax
409a     409a:	9c                   	pushf
409b     409b:	58                   	pop    %rax
409c     409c:	9c                   	pushf
409d     409d:	58                   	pop    %rax
409e     409e:	9c                   	pushf
409f     409f:	58                   	pop    %rax
40a0     40a0:	9c                   	pushf
40a1     40a1:	58                   	pop    %rax
40a2     40a2:	9c                   	pushf
40a3     40a3:	58                   	pop    %rax
40a4     40a4:	9c                   	pushf
40a5     40a5:	58                   	pop    %rax
40a6     40a6:	9c                   	pushf
40a7     40a7:	58                   	pop    %rax
40a8     40a8:	9c                   	pushf
40a9     40a9:	58                   	pop    %rax
40aa     40aa:	9c                   	pushf
40ab     40ab:	58                   	pop    %rax
40ac     40ac:	9c                   	pushf
40ad     40ad:	58                   	pop    %rax
40ae     40ae:	9c                   	pushf
40af     40af:	58                   	pop    %rax
40b0     40b0:	9c                   	pushf
40b1     40b1:	58                   	pop    %rax
40b2     40b2:	9c                   	pushf
40b3     40b3:	58                   	pop    %rax
40b4     40b4:	9c                   	pushf
40b5     40b5:	58                   	pop    %rax
40b6     40b6:	9c                   	pushf
40b7     40b7:	58                   	pop    %rax
40b8     40b8:	9c                   	pushf
40b9     40b9:	58                   	pop    %rax
40ba     40ba:	9c                   	pushf
40bb     40bb:	58                   	pop    %rax
40bc     40bc:	9c                   	pushf
40bd     40bd:	58                   	pop    %rax
40be     40be:	9c                   	pushf
40bf     40bf:	58                   	pop    %rax
40c0     40c0:	9c                   	pushf
40c1     40c1:	58                   	pop    %rax
40c2     40c2:	9c                   	pushf
40c3     40c3:	58                   	pop    %rax
40c4     40c4:	9c                   	pushf
40c5     40c5:	58                   	pop    %rax
40c6     40c6:	9c                   	pushf
40c7     40c7:	58                   	pop    %rax
40c8     40c8:	9c                   	pushf
40c9     40c9:	58                   	pop    %rax
40ca     40ca:	9c                   	pushf
40cb     40cb:	58                   	pop    %rax
40cc     40cc:	9c                   	pushf
40cd     40cd:	58                   	pop    %rax
40ce     40ce:	9c                   	pushf
40cf     40cf:	58                   	pop    %rax
40d0     40d0:	9c                   	pushf
40d1     40d1:	58                   	pop    %rax
40d2     40d2:	9c                   	pushf
40d3     40d3:	58                   	pop    %rax
40d4     40d4:	9c                   	pushf
40d5     40d5:	58                   	pop    %rax
40d6     40d6:	9c                   	pushf
40d7     40d7:	58                   	pop    %rax
40d8     40d8:	9c                   	pushf
40d9     40d9:	58                   	pop    %rax
40da     40da:	9c                   	pushf
40db     40db:	58                   	pop    %rax
40dc     40dc:	9c                   	pushf
40dd     40dd:	58                   	pop    %rax
40de     40de:	9c                   	pushf
40df     40df:	58                   	pop    %rax
40e0     40e0:	9c                   	pushf
40e1     40e1:	58                   	pop    %rax
40e2     40e2:	9c                   	pushf
40e3     40e3:	58                   	pop    %rax
40e4     40e4:	9c                   	pushf
40e5     40e5:	58                   	pop    %rax
40e6     40e6:	9c                   	pushf
40e7     40e7:	58                   	pop    %rax
40e8     40e8:	9c                   	pushf
40e9     40e9:	58                   	pop    %rax
40ea     40ea:	9c                   	pushf
40eb     40eb:	58                   	pop    %rax
40ec     40ec:	9c                   	pushf
40ed     40ed:	58                   	pop    %rax
40ee     40ee:	9c                   	pushf
40ef     40ef:	58                   	pop    %rax
40f0     40f0:	9c                   	pushf
40f1     40f1:	58                   	pop    %rax
40f2     40f2:	9c                   	pushf
40f3     40f3:	58                   	pop    %rax
40f4     40f4:	9c                   	pushf
40f5     40f5:	58                   	pop    %rax
40f6     40f6:	9c                   	pushf
40f7     40f7:	58                   	pop    %rax
40f8     40f8:	9c                   	pushf
40f9     40f9:	58                   	pop    %rax
40fa     40fa:	9c                   	pushf
40fb     40fb:	58                   	pop    %rax
40fc     40fc:	9c                   	pushf
40fd     40fd:	58                   	pop    %rax
40fe     40fe:	9c                   	pushf
40ff     40ff:	58                   	pop    %rax
4100     4100:	fa                   	cli
4101     4101:	e9 00 00 00 00       	jmp    4106 <.altinstr_replacement+0x4106>	4102: R_X86_64_PC32	.text+0x37a5ede
4106     4106:	0f 09                	wbinvd
4108     4108:	e9 00 00 00 00       	jmp    410d <.altinstr_replacement+0x410d>	4109: R_X86_64_PC32	.cpuidle.text+0x1357
410d     410d:	0f 09                	wbinvd
410f     410f:	e9 00 00 00 00       	jmp    4114 <.altinstr_replacement+0x4114>	4110: R_X86_64_PC32	.cpuidle.text+0x150a
4114     4114:	0f 09                	wbinvd
4116     4116:	9c                   	pushf
4117     4117:	58                   	pop    %rax
4118     4118:	fa                   	cli
4119     4119:	fb                   	sti
411a     411a:	9c                   	pushf
411b     411b:	58                   	pop    %rax
411c     411c:	fa                   	cli
411d     411d:	fb                   	sti
411e     411e:	9c                   	pushf
411f     411f:	58                   	pop    %rax
4120     4120:	9c                   	pushf
4121     4121:	58                   	pop    %rax
4122     4122:	9c                   	pushf
4123     4123:	58                   	pop    %rax
4124     4124:	fa                   	cli
4125     4125:	e9 00 00 00 00       	jmp    412a <.altinstr_replacement+0x412a>	4126: R_X86_64_PC32	.text+0x37e40fe
412a     412a:	e9 00 00 00 00       	jmp    412f <.altinstr_replacement+0x412f>	412b: R_X86_64_PC32	.text+0x37e3faa
412f     412f:	fb                   	sti
4130     4130:	9c                   	pushf
4131     4131:	58                   	pop    %rax
4132     4132:	fa                   	cli
4133     4133:	9c                   	pushf
4134     4134:	58                   	pop    %rax
4135     4135:	9c                   	pushf
4136     4136:	58                   	pop    %rax
4137     4137:	fa                   	cli
4138     4138:	9c                   	pushf
4139     4139:	58                   	pop    %rax
413a     413a:	fb                   	sti
413b     413b:	e9 00 00 00 00       	jmp    4140 <.altinstr_replacement+0x4140>	413c: R_X86_64_PC32	.text+0x37ed732
4140     4140:	e9 00 00 00 00       	jmp    4145 <.altinstr_replacement+0x4145>	4141: R_X86_64_PC32	.text+0x37ed756
4145     4145:	9c                   	pushf
4146     4146:	58                   	pop    %rax
4147     4147:	fa                   	cli
4148     4148:	9c                   	pushf
4149     4149:	58                   	pop    %rax
414a     414a:	fb                   	sti
414b     414b:	f3 0f b8 c7          	popcnt %edi,%eax
414f     414f:	e9 00 00 00 00       	jmp    4154 <.altinstr_replacement+0x4154>	4150: R_X86_64_PC32	.init.text+0x319315
4154     4154:	e9 00 00 00 00       	jmp    4159 <.altinstr_replacement+0x4159>	4155: R_X86_64_PC32	.init.text+0x3191f4
4159     4159:	f3 0f b8 c7          	popcnt %edi,%eax
415d     415d:	9c                   	pushf
415e     415e:	58                   	pop    %rax
415f     415f:	fa                   	cli
4160     4160:	9c                   	pushf
4161     4161:	58                   	pop    %rax
4162     4162:	fb                   	sti
4163     4163:	9c                   	pushf
4164     4164:	58                   	pop    %rax
4165     4165:	fa                   	cli
4166     4166:	9c                   	pushf
4167     4167:	58                   	pop    %rax
4168     4168:	fb                   	sti
4169     4169:	f3 48 0f b8 c7       	popcnt %rdi,%rax
416e     416e:	43 0f 18 04 27       	prefetchnta (%r15,%r12,1)
4173     4173:	0f 18 45 00          	prefetchnta 0x0(%rbp)
4177     4177:	0f 18 45 00          	prefetchnta 0x0(%rbp)
417b     417b:	41 0f 18 04 2f       	prefetchnta (%r15,%rbp,1)
4180     4180:	41 0f 18 04 07       	prefetchnta (%r15,%rax,1)
4185     4185:	41 0f 18 04 07       	prefetchnta (%r15,%rax,1)
418a     418a:	41 0f 18 04 24       	prefetchnta (%r12)
418f     418f:	9c                   	pushf
4190     4190:	58                   	pop    %rax
4191     4191:	e8 00 00 00 00       	call   4196 <.altinstr_replacement+0x4196>	4192: R_X86_64_PLT32	clear_page_rep-0x4
4196     4196:	e8 00 00 00 00       	call   419b <.altinstr_replacement+0x419b>	4197: R_X86_64_PLT32	clear_page_erms-0x4
419b     419b:	9c                   	pushf
419c     419c:	58                   	pop    %rax
419d     419d:	e8 00 00 00 00       	call   41a2 <.altinstr_replacement+0x41a2>	419e: R_X86_64_PLT32	clear_page_rep-0x4
41a2     41a2:	e8 00 00 00 00       	call   41a7 <.altinstr_replacement+0x41a7>	41a3: R_X86_64_PLT32	clear_page_erms-0x4
41a7     41a7:	9c                   	pushf
41a8     41a8:	58                   	pop    %rax
41a9     41a9:	9c                   	pushf
41aa     41aa:	58                   	pop    %rax
41ab     41ab:	9c                   	pushf
41ac     41ac:	58                   	pop    %rax
41ad     41ad:	9c                   	pushf
41ae     41ae:	58                   	pop    %rax
41af     41af:	e8 00 00 00 00       	call   41b4 <.altinstr_replacement+0x41b4>	41b0: R_X86_64_PLT32	clear_page_rep-0x4
41b4     41b4:	e8 00 00 00 00       	call   41b9 <.altinstr_replacement+0x41b9>	41b5: R_X86_64_PLT32	clear_page_erms-0x4
41b9     41b9:	9c                   	pushf
41ba     41ba:	58                   	pop    %rax
41bb     41bb:	e9 00 00 00 00       	jmp    41c0 <.altinstr_replacement+0x41c0>	41bc: R_X86_64_PC32	.text+0x3be042a
41c0     41c0:	e9 00 00 00 00       	jmp    41c5 <.altinstr_replacement+0x41c5>	41c1: R_X86_64_PC32	.text+0x3be0435
41c5     41c5:	e9 00 00 00 00       	jmp    41ca <.altinstr_replacement+0x41ca>	41c6: R_X86_64_PC32	.text+0x3be7dde
41ca     41ca:	e9 00 00 00 00       	jmp    41cf <.altinstr_replacement+0x41cf>	41cb: R_X86_64_PC32	.text+0x3be7f2f
41cf     41cf:	0f 01 cb             	stac
41d2     41d2:	e8 00 00 00 00       	call   41d7 <.altinstr_replacement+0x41d7>	41d3: R_X86_64_PLT32	__x86_indirect_thunk_rax-0x4
41d7     41d7:	0f ae e8             	lfence
41da     41da:	ff d0                	call   *%rax
41dc     41dc:	0f 01 ca             	clac
41df     41df:	0f 01 cb             	stac
41e2     41e2:	e8 00 00 00 00       	call   41e7 <.altinstr_replacement+0x41e7>	41e3: R_X86_64_PLT32	rep_stos_alternative-0x4
41e7     41e7:	0f 01 ca             	clac
41ea     41ea:	0f 01 cb             	stac
41ed     41ed:	0f 01 ca             	clac
41f0     41f0:	48 89 f8             	mov    %rdi,%rax
41f3     41f3:	f3 0f b8 c7          	popcnt %edi,%eax
41f7     41f7:	f3 0f b8 c7          	popcnt %edi,%eax
41fb     41fb:	fb                   	sti
41fc     41fc:	9c                   	pushf
41fd     41fd:	58                   	pop    %rax
41fe     41fe:	fa                   	cli
41ff     41ff:	9c                   	pushf
4200     4200:	58                   	pop    %rax
4201     4201:	fb                   	sti
4202     4202:	9c                   	pushf
4203     4203:	58                   	pop    %rax
4204     4204:	fa                   	cli
4205     4205:	9c                   	pushf
4206     4206:	58                   	pop    %rax
4207     4207:	fb                   	sti
4208     4208:	9c                   	pushf
4209     4209:	58                   	pop    %rax
420a     420a:	fa                   	cli
420b     420b:	9c                   	pushf
420c     420c:	58                   	pop    %rax
420d     420d:	fb                   	sti
420e     420e:	9c                   	pushf
420f     420f:	58                   	pop    %rax
4210     4210:	fa                   	cli
4211     4211:	9c                   	pushf
4212     4212:	58                   	pop    %rax
4213     4213:	fb                   	sti
4214     4214:	9c                   	pushf
4215     4215:	58                   	pop    %rax
4216     4216:	fa                   	cli
4217     4217:	9c                   	pushf
4218     4218:	58                   	pop    %rax
4219     4219:	fb                   	sti
421a     421a:	f3 0f b8 c7          	popcnt %edi,%eax
421e     421e:	9c                   	pushf
421f     421f:	58                   	pop    %rax
4220     4220:	fa                   	cli
4221     4221:	9c                   	pushf
4222     4222:	58                   	pop    %rax
4223     4223:	fb                   	sti
4224     4224:	9c                   	pushf
4225     4225:	58                   	pop    %rax
4226     4226:	fa                   	cli
4227     4227:	9c                   	pushf
4228     4228:	58                   	pop    %rax
4229     4229:	fb                   	sti
422a     422a:	9c                   	pushf
422b     422b:	58                   	pop    %rax
422c     422c:	fa                   	cli
422d     422d:	9c                   	pushf
422e     422e:	58                   	pop    %rax
422f     422f:	fb                   	sti
4230     4230:	9c                   	pushf
4231     4231:	58                   	pop    %rax
4232     4232:	fa                   	cli
4233     4233:	9c                   	pushf
4234     4234:	58                   	pop    %rax
4235     4235:	fb                   	sti
4236     4236:	9c                   	pushf
4237     4237:	58                   	pop    %rax
4238     4238:	fa                   	cli
4239     4239:	9c                   	pushf
423a     423a:	58                   	pop    %rax
423b     423b:	fb                   	sti
423c     423c:	9c                   	pushf
423d     423d:	58                   	pop    %rax
423e     423e:	fa                   	cli
423f     423f:	9c                   	pushf
4240     4240:	58                   	pop    %rax
4241     4241:	fb                   	sti
4242     4242:	9c                   	pushf
4243     4243:	58                   	pop    %rax
4244     4244:	fa                   	cli
4245     4245:	9c                   	pushf
4246     4246:	58                   	pop    %rax
4247     4247:	fb                   	sti
4248     4248:	9c                   	pushf
4249     4249:	58                   	pop    %rax
424a     424a:	fa                   	cli
424b     424b:	9c                   	pushf
424c     424c:	58                   	pop    %rax
424d     424d:	fb                   	sti
424e     424e:	9c                   	pushf
424f     424f:	58                   	pop    %rax
4250     4250:	fa                   	cli
4251     4251:	9c                   	pushf
4252     4252:	58                   	pop    %rax
4253     4253:	fb                   	sti
4254     4254:	9c                   	pushf
4255     4255:	58                   	pop    %rax
4256     4256:	fa                   	cli
4257     4257:	9c                   	pushf
4258     4258:	58                   	pop    %rax
4259     4259:	fb                   	sti
425a     425a:	9c                   	pushf
425b     425b:	58                   	pop    %rax
425c     425c:	fa                   	cli
425d     425d:	9c                   	pushf
425e     425e:	58                   	pop    %rax
425f     425f:	fb                   	sti
4260     4260:	9c                   	pushf
4261     4261:	58                   	pop    %rax
4262     4262:	fa                   	cli
4263     4263:	9c                   	pushf
4264     4264:	58                   	pop    %rax
4265     4265:	fb                   	sti
4266     4266:	9c                   	pushf
4267     4267:	58                   	pop    %rax
4268     4268:	fa                   	cli
4269     4269:	9c                   	pushf
426a     426a:	58                   	pop    %rax
426b     426b:	fb                   	sti
426c     426c:	9c                   	pushf
426d     426d:	58                   	pop    %rax
426e     426e:	fa                   	cli
426f     426f:	9c                   	pushf
4270     4270:	58                   	pop    %rax
4271     4271:	fb                   	sti
4272     4272:	9c                   	pushf
4273     4273:	58                   	pop    %rax
4274     4274:	fa                   	cli
4275     4275:	9c                   	pushf
4276     4276:	58                   	pop    %rax
4277     4277:	fb                   	sti
4278     4278:	9c                   	pushf
4279     4279:	58                   	pop    %rax
427a     427a:	fa                   	cli
427b     427b:	9c                   	pushf
427c     427c:	58                   	pop    %rax
427d     427d:	fb                   	sti
427e     427e:	9c                   	pushf
427f     427f:	58                   	pop    %rax
4280     4280:	fa                   	cli
4281     4281:	9c                   	pushf
4282     4282:	58                   	pop    %rax
4283     4283:	fb                   	sti
4284     4284:	9c                   	pushf
4285     4285:	58                   	pop    %rax
4286     4286:	fa                   	cli
4287     4287:	9c                   	pushf
4288     4288:	58                   	pop    %rax
4289     4289:	fb                   	sti
428a     428a:	9c                   	pushf
428b     428b:	58                   	pop    %rax
428c     428c:	fa                   	cli
428d     428d:	9c                   	pushf
428e     428e:	58                   	pop    %rax
428f     428f:	fb                   	sti
4290     4290:	9c                   	pushf
4291     4291:	58                   	pop    %rax
4292     4292:	fa                   	cli
4293     4293:	9c                   	pushf
4294     4294:	58                   	pop    %rax
4295     4295:	fb                   	sti
4296     4296:	9c                   	pushf
4297     4297:	58                   	pop    %rax
4298     4298:	fa                   	cli
4299     4299:	9c                   	pushf
429a     429a:	58                   	pop    %rax
429b     429b:	fb                   	sti
429c     429c:	9c                   	pushf
429d     429d:	58                   	pop    %rax
429e     429e:	fa                   	cli
429f     429f:	9c                   	pushf
42a0     42a0:	58                   	pop    %rax
42a1     42a1:	fb                   	sti
42a2     42a2:	9c                   	pushf
42a3     42a3:	58                   	pop    %rax
42a4     42a4:	fa                   	cli
42a5     42a5:	9c                   	pushf
42a6     42a6:	58                   	pop    %rax
42a7     42a7:	fb                   	sti
42a8     42a8:	9c                   	pushf
42a9     42a9:	58                   	pop    %rax
42aa     42aa:	fa                   	cli
42ab     42ab:	9c                   	pushf
42ac     42ac:	58                   	pop    %rax
42ad     42ad:	fb                   	sti
42ae     42ae:	0f 01 cb             	stac
42b1     42b1:	e8 00 00 00 00       	call   42b6 <.altinstr_replacement+0x42b6>	42b2: R_X86_64_PLT32	rep_stos_alternative-0x4
42b6     42b6:	0f 01 ca             	clac
42b9     42b9:	0f 01 cb             	stac
42bc     42bc:	e8 00 00 00 00       	call   42c1 <.altinstr_replacement+0x42c1>	42bd: R_X86_64_PLT32	rep_stos_alternative-0x4
42c1     42c1:	0f 01 ca             	clac
42c4     42c4:	e9 00 00 00 00       	jmp    42c9 <.altinstr_replacement+0x42c9>	42c5: R_X86_64_PC32	.text+0x3ef4435
42c9     42c9:	e9 00 00 00 00       	jmp    42ce <.altinstr_replacement+0x42ce>	42ca: R_X86_64_PC32	.text+0x3ef4499
42ce     42ce:	9c                   	pushf
42cf     42cf:	58                   	pop    %rax
42d0     42d0:	fa                   	cli
42d1     42d1:	9c                   	pushf
42d2     42d2:	58                   	pop    %rax
42d3     42d3:	fb                   	sti
42d4     42d4:	9c                   	pushf
42d5     42d5:	58                   	pop    %rax
42d6     42d6:	fa                   	cli
42d7     42d7:	fb                   	sti
42d8     42d8:	fb                   	sti
42d9     42d9:	9c                   	pushf
42da     42da:	58                   	pop    %rax
42db     42db:	fa                   	cli
42dc     42dc:	9c                   	pushf
42dd     42dd:	58                   	pop    %rax
42de     42de:	fb                   	sti
42df     42df:	9c                   	pushf
42e0     42e0:	58                   	pop    %rax
42e1     42e1:	fa                   	cli
42e2     42e2:	9c                   	pushf
42e3     42e3:	58                   	pop    %rax
42e4     42e4:	fb                   	sti
42e5     42e5:	9c                   	pushf
42e6     42e6:	58                   	pop    %rax
42e7     42e7:	fa                   	cli
42e8     42e8:	9c                   	pushf
42e9     42e9:	58                   	pop    %rax
42ea     42ea:	fb                   	sti
42eb     42eb:	9c                   	pushf
42ec     42ec:	58                   	pop    %rax
42ed     42ed:	fa                   	cli
42ee     42ee:	9c                   	pushf
42ef     42ef:	58                   	pop    %rax
42f0     42f0:	fb                   	sti
42f1     42f1:	e9 00 00 00 00       	jmp    42f6 <.altinstr_replacement+0x42f6>	42f2: R_X86_64_PC32	.init.text+0x354040
42f6     42f6:	e9 00 00 00 00       	jmp    42fb <.altinstr_replacement+0x42fb>	42f7: R_X86_64_PC32	.init.text+0x35407f
42fb     42fb:	9c                   	pushf
42fc     42fc:	58                   	pop    %rax
42fd     42fd:	fa                   	cli
42fe     42fe:	9c                   	pushf
42ff     42ff:	58                   	pop    %rax
4300     4300:	fb                   	sti
4301     4301:	9c                   	pushf
4302     4302:	58                   	pop    %rax
4303     4303:	fa                   	cli
4304     4304:	9c                   	pushf
4305     4305:	58                   	pop    %rax
4306     4306:	fb                   	sti
4307     4307:	9c                   	pushf
4308     4308:	58                   	pop    %rax
4309     4309:	fa                   	cli
430a     430a:	0f 09                	wbinvd
430c     430c:	f3 0f b8 c7          	popcnt %edi,%eax
4310     4310:	e9 00 00 00 00       	jmp    4315 <.altinstr_replacement+0x4315>	4311: R_X86_64_PC32	.text+0x3f9b705
4315     4315:	e9 00 00 00 00       	jmp    431a <.altinstr_replacement+0x431a>	4316: R_X86_64_PC32	.init.text+0x368f07
431a     431a:	e9 00 00 00 00       	jmp    431f <.altinstr_replacement+0x431f>	431b: R_X86_64_PC32	.text+0x3fcef7a
431f     431f:	e9 00 00 00 00       	jmp    4324 <.altinstr_replacement+0x4324>	4320: R_X86_64_PC32	.text+0x3fd03c1
4324     4324:	e9 00 00 00 00       	jmp    4329 <.altinstr_replacement+0x4329>	4325: R_X86_64_PC32	.text+0x3fd17fc
4329     4329:	e9 00 00 00 00       	jmp    432e <.altinstr_replacement+0x432e>	432a: R_X86_64_PC32	.text+0x3fd1831
432e     432e:	f3 0f b8 c7          	popcnt %edi,%eax
4332     4332:	f3 0f b8 c7          	popcnt %edi,%eax
4336     4336:	f3 0f b8 c7          	popcnt %edi,%eax
433a     433a:	f3 0f b8 c7          	popcnt %edi,%eax
433e     433e:	f3 0f b8 c7          	popcnt %edi,%eax
4342     4342:	f3 0f b8 c7          	popcnt %edi,%eax
4346     4346:	f3 0f b8 c7          	popcnt %edi,%eax
434a     434a:	f3 0f b8 c7          	popcnt %edi,%eax
434e     434e:	f3 0f b8 c7          	popcnt %edi,%eax
4352     4352:	f3 0f b8 c7          	popcnt %edi,%eax
4356     4356:	f3 0f b8 c7          	popcnt %edi,%eax
435a     435a:	f3 0f b8 c7          	popcnt %edi,%eax
435e     435e:	f3 0f b8 c7          	popcnt %edi,%eax
4362     4362:	f3 0f b8 c7          	popcnt %edi,%eax
4366     4366:	f3 0f b8 c7          	popcnt %edi,%eax
436a     436a:	e9 00 00 00 00       	jmp    436f <.altinstr_replacement+0x436f>	436b: R_X86_64_PC32	.text+0x40a01a0
436f     436f:	66 0f ae 3b          	clflushopt (%rbx)
4373     4373:	66 0f ae 7d ff       	clflushopt -0x1(%rbp)
4378     4378:	66 0f ae 38          	clflushopt (%rax)
437c     437c:	e9 00 00 00 00       	jmp    4381 <.altinstr_replacement+0x4381>	437d: R_X86_64_PC32	.text+0x40a0d5f
4381     4381:	e9 00 00 00 00       	jmp    4386 <.altinstr_replacement+0x4386>	4382: R_X86_64_PC32	.text+0x40a0f21
4386     4386:	e9 00 00 00 00       	jmp    438b <.altinstr_replacement+0x438b>	4387: R_X86_64_PC32	.text+0x40a1046
438b     438b:	f3 0f b8 c7          	popcnt %edi,%eax
438f     438f:	f3 0f b8 c7          	popcnt %edi,%eax
4393     4393:	f3 0f b8 c7          	popcnt %edi,%eax
4397     4397:	f3 48 0f b8 c7       	popcnt %rdi,%rax
439c     439c:	9c                   	pushf
439d     439d:	58                   	pop    %rax
439e     439e:	fa                   	cli
439f     439f:	9c                   	pushf
43a0     43a0:	58                   	pop    %rax
43a1     43a1:	fb                   	sti
43a2     43a2:	0f 01 cb             	stac
43a5     43a5:	e8 00 00 00 00       	call   43aa <.altinstr_replacement+0x43aa>	43a6: R_X86_64_PLT32	rep_stos_alternative-0x4
43aa     43aa:	0f 01 ca             	clac
43ad     43ad:	0f 01 cb             	stac
43b0     43b0:	e8 00 00 00 00       	call   43b5 <.altinstr_replacement+0x43b5>	43b1: R_X86_64_PLT32	rep_stos_alternative-0x4
43b5     43b5:	0f 01 ca             	clac
43b8     43b8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
43bd     43bd:	f3 0f b8 c7          	popcnt %edi,%eax
43c1     43c1:	9c                   	pushf
43c2     43c2:	58                   	pop    %rax
43c3     43c3:	9c                   	pushf
43c4     43c4:	58                   	pop    %rax
43c5     43c5:	9c                   	pushf
43c6     43c6:	58                   	pop    %rax
43c7     43c7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
43cc     43cc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
43d1     43d1:	f3 0f b8 c7          	popcnt %edi,%eax
43d5     43d5:	f3 0f b8 c7          	popcnt %edi,%eax
43d9     43d9:	e8 00 00 00 00       	call   43de <.altinstr_replacement+0x43de>	43da: R_X86_64_PLT32	clear_page_rep-0x4
43de     43de:	e8 00 00 00 00       	call   43e3 <.altinstr_replacement+0x43e3>	43df: R_X86_64_PLT32	clear_page_erms-0x4
43e3     43e3:	9c                   	pushf
43e4     43e4:	58                   	pop    %rax
43e5     43e5:	9c                   	pushf
43e6     43e6:	58                   	pop    %rax
43e7     43e7:	0f 01 cb             	stac
43ea     43ea:	e8 00 00 00 00       	call   43ef <.altinstr_replacement+0x43ef>	43eb: R_X86_64_PLT32	rep_stos_alternative-0x4
43ef     43ef:	0f 01 ca             	clac
43f2     43f2:	9c                   	pushf
43f3     43f3:	58                   	pop    %rax
43f4     43f4:	9c                   	pushf
43f5     43f5:	58                   	pop    %rax
43f6     43f6:	65 4c 23 24 25 00 00 00 00 	and    %gs:0x0,%r12	43fb: R_X86_64_32S	tlbstate_untag_mask
43ff     43ff:	f3 0f b8 c7          	popcnt %edi,%eax
4403     4403:	f3 0f b8 c7          	popcnt %edi,%eax
4407     4407:	f3 0f b8 c7          	popcnt %edi,%eax
440b     440b:	f3 0f b8 c7          	popcnt %edi,%eax
440f     440f:	f3 0f b8 c7          	popcnt %edi,%eax
4413     4413:	f3 0f b8 c7          	popcnt %edi,%eax
4417     4417:	f3 0f b8 c7          	popcnt %edi,%eax
441b     441b:	f3 0f b8 c7          	popcnt %edi,%eax
441f     441f:	f3 0f b8 c7          	popcnt %edi,%eax
4423     4423:	9c                   	pushf
4424     4424:	58                   	pop    %rax
4425     4425:	9c                   	pushf
4426     4426:	58                   	pop    %rax
4427     4427:	e9 00 00 00 00       	jmp    442c <.altinstr_replacement+0x442c>	4428: R_X86_64_PC32	.text+0x44dbbf8
442c     442c:	e9 00 00 00 00       	jmp    4431 <.altinstr_replacement+0x4431>	442d: R_X86_64_PC32	.text+0x44dbc02
4431     4431:	e9 00 00 00 00       	jmp    4436 <.altinstr_replacement+0x4436>	4432: R_X86_64_PC32	.text+0x44dc0f5
4436     4436:	e9 00 00 00 00       	jmp    443b <.altinstr_replacement+0x443b>	4437: R_X86_64_PC32	.text+0x44dc0ff
443b     443b:	65 4c 23 2c 25 00 00 00 00 	and    %gs:0x0,%r13	4440: R_X86_64_32S	tlbstate_untag_mask
4444     4444:	f3 0f b8 c7          	popcnt %edi,%eax
4448     4448:	f3 0f b8 c7          	popcnt %edi,%eax
444c     444c:	f3 0f b8 c7          	popcnt %edi,%eax
4450     4450:	f3 0f b8 c7          	popcnt %edi,%eax
4454     4454:	f3 0f b8 c7          	popcnt %edi,%eax
4458     4458:	f3 0f b8 c7          	popcnt %edi,%eax
445c     445c:	f3 0f b8 c7          	popcnt %edi,%eax
4460     4460:	f3 0f b8 c7          	popcnt %edi,%eax
4464     4464:	f3 0f b8 c7          	popcnt %edi,%eax
4468     4468:	f3 0f b8 c7          	popcnt %edi,%eax
446c     446c:	f3 0f b8 c7          	popcnt %edi,%eax
4470     4470:	f3 0f b8 c7          	popcnt %edi,%eax
4474     4474:	f3 0f b8 c7          	popcnt %edi,%eax
4478     4478:	f3 0f b8 c7          	popcnt %edi,%eax
447c     447c:	f3 0f b8 c7          	popcnt %edi,%eax
4480     4480:	f3 0f b8 c7          	popcnt %edi,%eax
4484     4484:	f3 0f b8 c7          	popcnt %edi,%eax
4488     4488:	f3 0f b8 c7          	popcnt %edi,%eax
448c     448c:	f3 0f b8 c7          	popcnt %edi,%eax
4490     4490:	f3 0f b8 c7          	popcnt %edi,%eax
4494     4494:	f3 0f b8 c7          	popcnt %edi,%eax
4498     4498:	f3 0f b8 c7          	popcnt %edi,%eax
449c     449c:	f3 0f b8 c7          	popcnt %edi,%eax
44a0     44a0:	f3 0f b8 c7          	popcnt %edi,%eax
44a4     44a4:	f3 0f b8 c7          	popcnt %edi,%eax
44a8     44a8:	f3 0f b8 c7          	popcnt %edi,%eax
44ac     44ac:	f3 0f b8 c7          	popcnt %edi,%eax
44b0     44b0:	f3 0f b8 c7          	popcnt %edi,%eax
44b4     44b4:	f3 0f b8 c7          	popcnt %edi,%eax
44b8     44b8:	f3 0f b8 c7          	popcnt %edi,%eax
44bc     44bc:	f3 0f b8 c7          	popcnt %edi,%eax
44c0     44c0:	f3 0f b8 c7          	popcnt %edi,%eax
44c4     44c4:	f3 0f b8 c7          	popcnt %edi,%eax
44c8     44c8:	f3 0f b8 c7          	popcnt %edi,%eax
44cc     44cc:	f3 0f b8 c7          	popcnt %edi,%eax
44d0     44d0:	f3 0f b8 c7          	popcnt %edi,%eax
44d4     44d4:	f3 0f b8 c7          	popcnt %edi,%eax
44d8     44d8:	f3 0f b8 c7          	popcnt %edi,%eax
44dc     44dc:	f3 0f b8 c7          	popcnt %edi,%eax
44e0     44e0:	f3 0f b8 c7          	popcnt %edi,%eax
44e4     44e4:	f3 0f b8 c7          	popcnt %edi,%eax
44e8     44e8:	f3 0f b8 c7          	popcnt %edi,%eax
44ec     44ec:	f3 0f b8 c7          	popcnt %edi,%eax
44f0     44f0:	f3 0f b8 c7          	popcnt %edi,%eax
44f4     44f4:	f3 0f b8 c7          	popcnt %edi,%eax
44f8     44f8:	f3 0f b8 c7          	popcnt %edi,%eax
44fc     44fc:	f3 0f b8 c7          	popcnt %edi,%eax
4500     4500:	f3 0f b8 c7          	popcnt %edi,%eax
4504     4504:	f3 0f b8 c7          	popcnt %edi,%eax
4508     4508:	f3 0f b8 c7          	popcnt %edi,%eax
450c     450c:	f3 0f b8 c7          	popcnt %edi,%eax
4510     4510:	f3 0f b8 c7          	popcnt %edi,%eax
4514     4514:	f3 0f b8 c7          	popcnt %edi,%eax
4518     4518:	f3 0f b8 c7          	popcnt %edi,%eax
451c     451c:	f3 0f b8 c7          	popcnt %edi,%eax
4520     4520:	f3 0f b8 c7          	popcnt %edi,%eax
4524     4524:	f3 0f b8 c7          	popcnt %edi,%eax
4528     4528:	f3 0f b8 c7          	popcnt %edi,%eax
452c     452c:	f3 0f b8 c7          	popcnt %edi,%eax
4530     4530:	f3 0f b8 c7          	popcnt %edi,%eax
4534     4534:	f3 0f b8 c7          	popcnt %edi,%eax
4538     4538:	f3 0f b8 c7          	popcnt %edi,%eax
453c     453c:	f3 0f b8 c7          	popcnt %edi,%eax
4540     4540:	f3 0f b8 c7          	popcnt %edi,%eax
4544     4544:	f3 0f b8 c7          	popcnt %edi,%eax
4548     4548:	f3 0f b8 c7          	popcnt %edi,%eax
454c     454c:	f3 0f b8 c7          	popcnt %edi,%eax
4550     4550:	f3 0f b8 c7          	popcnt %edi,%eax
4554     4554:	f3 0f b8 c7          	popcnt %edi,%eax
4558     4558:	f3 0f b8 c7          	popcnt %edi,%eax
455c     455c:	65 48 23 04 25 00 00 00 00 	and    %gs:0x0,%rax	4561: R_X86_64_32S	tlbstate_untag_mask
4565     4565:	9c                   	pushf
4566     4566:	58                   	pop    %rax
4567     4567:	fa                   	cli
4568     4568:	9c                   	pushf
4569     4569:	58                   	pop    %rax
456a     456a:	fb                   	sti
456b     456b:	9c                   	pushf
456c     456c:	58                   	pop    %rax
456d     456d:	fa                   	cli
456e     456e:	9c                   	pushf
456f     456f:	58                   	pop    %rax
4570     4570:	fb                   	sti
4571     4571:	f3 0f b8 c7          	popcnt %edi,%eax
4575     4575:	f3 0f b8 c7          	popcnt %edi,%eax
4579     4579:	f3 0f b8 c7          	popcnt %edi,%eax
457d     457d:	e9 00 00 00 00       	jmp    4582 <.altinstr_replacement+0x4582>	457e: R_X86_64_PC32	.text+0x51024c6
4582     4582:	48 89 f8             	mov    %rdi,%rax
4585     4585:	f3 0f b8 c7          	popcnt %edi,%eax
4589     4589:	f3 0f b8 c7          	popcnt %edi,%eax
458d     458d:	f3 0f b8 c7          	popcnt %edi,%eax
4591     4591:	f3 0f b8 c7          	popcnt %edi,%eax
4595     4595:	f3 0f b8 c7          	popcnt %edi,%eax
4599     4599:	f3 0f b8 c7          	popcnt %edi,%eax
459d     459d:	9c                   	pushf
459e     459e:	58                   	pop    %rax
459f     459f:	fa                   	cli
45a0     45a0:	fb                   	sti
45a1     45a1:	f3 0f b8 c7          	popcnt %edi,%eax
45a5     45a5:	f3 0f b8 c7          	popcnt %edi,%eax
45a9     45a9:	9c                   	pushf
45aa     45aa:	58                   	pop    %rax
45ab     45ab:	9c                   	pushf
45ac     45ac:	58                   	pop    %rax
45ad     45ad:	fa                   	cli
45ae     45ae:	fb                   	sti
45af     45af:	9c                   	pushf
45b0     45b0:	58                   	pop    %rax
45b1     45b1:	fa                   	cli
45b2     45b2:	9c                   	pushf
45b3     45b3:	58                   	pop    %rax
45b4     45b4:	fb                   	sti
45b5     45b5:	9c                   	pushf
45b6     45b6:	58                   	pop    %rax
45b7     45b7:	fa                   	cli
45b8     45b8:	9c                   	pushf
45b9     45b9:	58                   	pop    %rax
45ba     45ba:	fb                   	sti
45bb     45bb:	9c                   	pushf
45bc     45bc:	58                   	pop    %rax
45bd     45bd:	fa                   	cli
45be     45be:	9c                   	pushf
45bf     45bf:	58                   	pop    %rax
45c0     45c0:	fb                   	sti
45c1     45c1:	9c                   	pushf
45c2     45c2:	58                   	pop    %rax
45c3     45c3:	fa                   	cli
45c4     45c4:	fb                   	sti
45c5     45c5:	9c                   	pushf
45c6     45c6:	58                   	pop    %rax
45c7     45c7:	fa                   	cli
45c8     45c8:	fb                   	sti
45c9     45c9:	9c                   	pushf
45ca     45ca:	58                   	pop    %rax
45cb     45cb:	fa                   	cli
45cc     45cc:	9c                   	pushf
45cd     45cd:	58                   	pop    %rax
45ce     45ce:	fb                   	sti
45cf     45cf:	9c                   	pushf
45d0     45d0:	58                   	pop    %rax
45d1     45d1:	fa                   	cli
45d2     45d2:	fb                   	sti
45d3     45d3:	9c                   	pushf
45d4     45d4:	58                   	pop    %rax
45d5     45d5:	fa                   	cli
45d6     45d6:	fb                   	sti
45d7     45d7:	9c                   	pushf
45d8     45d8:	58                   	pop    %rax
45d9     45d9:	fa                   	cli
45da     45da:	fb                   	sti
45db     45db:	f3 0f b8 c7          	popcnt %edi,%eax
45df     45df:	f3 0f b8 c7          	popcnt %edi,%eax
45e3     45e3:	f3 0f b8 c7          	popcnt %edi,%eax
45e7     45e7:	f3 0f b8 c7          	popcnt %edi,%eax
45eb     45eb:	f3 0f b8 c7          	popcnt %edi,%eax
45ef     45ef:	f3 0f b8 c7          	popcnt %edi,%eax
45f3     45f3:	f3 0f b8 c7          	popcnt %edi,%eax
45f7     45f7:	f3 0f b8 c7          	popcnt %edi,%eax
45fb     45fb:	f3 0f b8 c7          	popcnt %edi,%eax
45ff     45ff:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4604     4604:	f3 0f b8 c7          	popcnt %edi,%eax
4608     4608:	f3 0f b8 c7          	popcnt %edi,%eax
460c     460c:	f3 0f b8 c7          	popcnt %edi,%eax
4610     4610:	f3 0f b8 c7          	popcnt %edi,%eax
4614     4614:	f3 0f b8 c7          	popcnt %edi,%eax
4618     4618:	f3 0f b8 c7          	popcnt %edi,%eax
461c     461c:	f3 0f b8 c7          	popcnt %edi,%eax
4620     4620:	f3 0f b8 c7          	popcnt %edi,%eax
4624     4624:	f3 0f b8 c7          	popcnt %edi,%eax
4628     4628:	f3 0f b8 c7          	popcnt %edi,%eax
462c     462c:	f3 0f b8 c7          	popcnt %edi,%eax
4630     4630:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4635     4635:	f3 48 0f b8 c7       	popcnt %rdi,%rax
463a     463a:	f3 0f b8 c7          	popcnt %edi,%eax
463e     463e:	f3 0f b8 c7          	popcnt %edi,%eax
4642     4642:	f3 0f b8 c7          	popcnt %edi,%eax
4646     4646:	f3 0f b8 c7          	popcnt %edi,%eax
464a     464a:	f3 0f b8 c7          	popcnt %edi,%eax
464e     464e:	f3 0f b8 c7          	popcnt %edi,%eax
4652     4652:	f3 0f b8 c7          	popcnt %edi,%eax
4656     4656:	f3 0f b8 c7          	popcnt %edi,%eax
465a     465a:	f3 0f b8 c7          	popcnt %edi,%eax
465e     465e:	f3 0f b8 c7          	popcnt %edi,%eax
4662     4662:	f3 0f b8 c7          	popcnt %edi,%eax
4666     4666:	f3 0f b8 c7          	popcnt %edi,%eax
466a     466a:	f3 0f b8 c7          	popcnt %edi,%eax
466e     466e:	f3 0f b8 c7          	popcnt %edi,%eax
4672     4672:	e9 00 00 00 00       	jmp    4677 <.altinstr_replacement+0x4677>	4673: R_X86_64_PC32	.text+0x5254844
4677     4677:	e9 00 00 00 00       	jmp    467c <.altinstr_replacement+0x467c>	4678: R_X86_64_PC32	.text+0x5254c61
467c     467c:	0f 01 cb             	stac
467f     467f:	e8 00 00 00 00       	call   4684 <.altinstr_replacement+0x4684>	4680: R_X86_64_PLT32	rep_movs_alternative-0x4
4684     4684:	0f 01 ca             	clac
4687     4687:	0f 01 cb             	stac
468a     468a:	0f ae e8             	lfence
468d     468d:	0f 01 ca             	clac
4690     4690:	0f 01 ca             	clac
4693     4693:	0f 01 cb             	stac
4696     4696:	e8 00 00 00 00       	call   469b <.altinstr_replacement+0x469b>	4697: R_X86_64_PLT32	rep_movs_alternative-0x4
469b     469b:	0f 01 ca             	clac
469e     469e:	0f 01 cb             	stac
46a1     46a1:	e8 00 00 00 00       	call   46a6 <.altinstr_replacement+0x46a6>	46a2: R_X86_64_PLT32	rep_movs_alternative-0x4
46a6     46a6:	0f 01 ca             	clac
46a9     46a9:	0f 01 cb             	stac
46ac     46ac:	e8 00 00 00 00       	call   46b1 <.altinstr_replacement+0x46b1>	46ad: R_X86_64_PLT32	rep_movs_alternative-0x4
46b1     46b1:	0f 01 ca             	clac
46b4     46b4:	0f 01 cb             	stac
46b7     46b7:	0f ae e8             	lfence
46ba     46ba:	0f 01 ca             	clac
46bd     46bd:	0f 01 cb             	stac
46c0     46c0:	e8 00 00 00 00       	call   46c5 <.altinstr_replacement+0x46c5>	46c1: R_X86_64_PLT32	rep_movs_alternative-0x4
46c5     46c5:	0f 01 ca             	clac
46c8     46c8:	0f 01 cb             	stac
46cb     46cb:	e8 00 00 00 00       	call   46d0 <.altinstr_replacement+0x46d0>	46cc: R_X86_64_PLT32	rep_movs_alternative-0x4
46d0     46d0:	0f 01 ca             	clac
46d3     46d3:	0f 01 cb             	stac
46d6     46d6:	e8 00 00 00 00       	call   46db <.altinstr_replacement+0x46db>	46d7: R_X86_64_PLT32	rep_movs_alternative-0x4
46db     46db:	0f 01 ca             	clac
46de     46de:	0f 01 cb             	stac
46e1     46e1:	e8 00 00 00 00       	call   46e6 <.altinstr_replacement+0x46e6>	46e2: R_X86_64_PLT32	rep_movs_alternative-0x4
46e6     46e6:	0f 01 ca             	clac
46e9     46e9:	0f 01 cb             	stac
46ec     46ec:	0f 01 ca             	clac
46ef     46ef:	0f 01 cb             	stac
46f2     46f2:	0f ae e8             	lfence
46f5     46f5:	0f 01 ca             	clac
46f8     46f8:	0f 01 ca             	clac
46fb     46fb:	0f 01 cb             	stac
46fe     46fe:	e8 00 00 00 00       	call   4703 <.altinstr_replacement+0x4703>	46ff: R_X86_64_PLT32	rep_movs_alternative-0x4
4703     4703:	0f 01 ca             	clac
4706     4706:	0f 01 cb             	stac
4709     4709:	e8 00 00 00 00       	call   470e <.altinstr_replacement+0x470e>	470a: R_X86_64_PLT32	rep_movs_alternative-0x4
470e     470e:	0f 01 ca             	clac
4711     4711:	9c                   	pushf
4712     4712:	58                   	pop    %rax
4713     4713:	fa                   	cli
4714     4714:	fb                   	sti
4715     4715:	9c                   	pushf
4716     4716:	58                   	pop    %rax
4717     4717:	f3 0f b8 c7          	popcnt %edi,%eax
471b     471b:	9c                   	pushf
471c     471c:	58                   	pop    %rax
471d     471d:	9c                   	pushf
471e     471e:	58                   	pop    %rax
471f     471f:	9c                   	pushf
4720     4720:	58                   	pop    %rax
4721     4721:	9c                   	pushf
4722     4722:	58                   	pop    %rax
4723     4723:	9c                   	pushf
4724     4724:	58                   	pop    %rax
4725     4725:	9c                   	pushf
4726     4726:	58                   	pop    %rax
4727     4727:	9c                   	pushf
4728     4728:	58                   	pop    %rax
4729     4729:	9c                   	pushf
472a     472a:	58                   	pop    %rax
472b     472b:	9c                   	pushf
472c     472c:	58                   	pop    %rax
472d     472d:	9c                   	pushf
472e     472e:	58                   	pop    %rax
472f     472f:	9c                   	pushf
4730     4730:	58                   	pop    %rax
4731     4731:	f3 0f b8 c7          	popcnt %edi,%eax
4735     4735:	f3 0f b8 c7          	popcnt %edi,%eax
4739     4739:	f3 0f b8 c7          	popcnt %edi,%eax
473d     473d:	f3 0f b8 c7          	popcnt %edi,%eax
4741     4741:	f3 0f b8 c7          	popcnt %edi,%eax
4745     4745:	f3 0f b8 c7          	popcnt %edi,%eax
4749     4749:	f3 0f b8 c7          	popcnt %edi,%eax
474d     474d:	f3 0f b8 c7          	popcnt %edi,%eax
4751     4751:	f3 0f b8 c7          	popcnt %edi,%eax
4755     4755:	f3 0f b8 c7          	popcnt %edi,%eax
4759     4759:	f3 0f b8 c7          	popcnt %edi,%eax
475d     475d:	f3 0f b8 c7          	popcnt %edi,%eax
4761     4761:	f3 0f b8 c7          	popcnt %edi,%eax
4765     4765:	f3 0f b8 c7          	popcnt %edi,%eax
4769     4769:	f3 0f b8 c7          	popcnt %edi,%eax
476d     476d:	f3 0f b8 c7          	popcnt %edi,%eax
4771     4771:	9c                   	pushf
4772     4772:	58                   	pop    %rax
4773     4773:	fa                   	cli
4774     4774:	fb                   	sti
4775     4775:	9c                   	pushf
4776     4776:	58                   	pop    %rax
4777     4777:	fa                   	cli
4778     4778:	9c                   	pushf
4779     4779:	58                   	pop    %rax
477a     477a:	fa                   	cli
477b     477b:	fb                   	sti
477c     477c:	9c                   	pushf
477d     477d:	58                   	pop    %rax
477e     477e:	fa                   	cli
477f     477f:	fb                   	sti
4780     4780:	f3 0f b8 c7          	popcnt %edi,%eax
4784     4784:	f3 0f b8 c7          	popcnt %edi,%eax
4788     4788:	f3 0f b8 c7          	popcnt %edi,%eax
478c     478c:	f3 0f b8 c7          	popcnt %edi,%eax
4790     4790:	f3 0f b8 c7          	popcnt %edi,%eax
4794     4794:	f3 0f b8 c7          	popcnt %edi,%eax
4798     4798:	f3 0f b8 c7          	popcnt %edi,%eax
479c     479c:	f3 0f b8 c7          	popcnt %edi,%eax
47a0     47a0:	f3 0f b8 c7          	popcnt %edi,%eax
47a4     47a4:	f3 0f b8 c7          	popcnt %edi,%eax
47a8     47a8:	f3 0f b8 c7          	popcnt %edi,%eax
47ac     47ac:	f3 0f b8 c7          	popcnt %edi,%eax
47b0     47b0:	f3 0f b8 c7          	popcnt %edi,%eax
47b4     47b4:	f3 0f b8 c7          	popcnt %edi,%eax
47b8     47b8:	f3 0f b8 c7          	popcnt %edi,%eax
47bc     47bc:	f3 0f b8 c7          	popcnt %edi,%eax
47c0     47c0:	f3 0f b8 c7          	popcnt %edi,%eax
47c4     47c4:	f3 0f b8 c7          	popcnt %edi,%eax
47c8     47c8:	f3 0f b8 c7          	popcnt %edi,%eax
47cc     47cc:	f3 0f b8 c7          	popcnt %edi,%eax
47d0     47d0:	f3 0f b8 c7          	popcnt %edi,%eax
47d4     47d4:	f3 0f b8 c7          	popcnt %edi,%eax
47d8     47d8:	f3 0f b8 c7          	popcnt %edi,%eax
47dc     47dc:	f3 0f b8 c7          	popcnt %edi,%eax
47e0     47e0:	f3 0f b8 c7          	popcnt %edi,%eax
47e4     47e4:	f3 0f b8 c7          	popcnt %edi,%eax
47e8     47e8:	f3 0f b8 c7          	popcnt %edi,%eax
47ec     47ec:	f3 0f b8 c7          	popcnt %edi,%eax
47f0     47f0:	f3 0f b8 c7          	popcnt %edi,%eax
47f4     47f4:	f3 0f b8 c7          	popcnt %edi,%eax
47f8     47f8:	f3 0f b8 c7          	popcnt %edi,%eax
47fc     47fc:	f3 0f b8 c7          	popcnt %edi,%eax
4800     4800:	f3 0f b8 c7          	popcnt %edi,%eax
4804     4804:	f3 0f b8 c7          	popcnt %edi,%eax
4808     4808:	f3 0f b8 c7          	popcnt %edi,%eax
480c     480c:	f3 0f b8 c7          	popcnt %edi,%eax
4810     4810:	f3 0f b8 c7          	popcnt %edi,%eax
4814     4814:	f3 0f b8 c7          	popcnt %edi,%eax
4818     4818:	fb                   	sti
4819     4819:	9c                   	pushf
481a     481a:	58                   	pop    %rax
481b     481b:	fa                   	cli
481c     481c:	e8 00 00 00 00       	call   4821 <.altinstr_replacement+0x4821>	481d: R_X86_64_PLT32	clear_page_rep-0x4
4821     4821:	e8 00 00 00 00       	call   4826 <.altinstr_replacement+0x4826>	4822: R_X86_64_PLT32	clear_page_erms-0x4
4826     4826:	f3 0f b8 c7          	popcnt %edi,%eax
482a     482a:	f3 0f b8 c7          	popcnt %edi,%eax
482e     482e:	f3 0f b8 c7          	popcnt %edi,%eax
4832     4832:	f3 0f b8 c7          	popcnt %edi,%eax
4836     4836:	0f 01 c1             	vmcall
4839     4839:	0f 01 d9             	vmmcall
483c     483c:	0f 01 c1             	vmcall
483f     483f:	0f 01 d9             	vmmcall
4842     4842:	0f 01 c1             	vmcall
4845     4845:	0f 01 d9             	vmmcall
4848     4848:	0f 01 c1             	vmcall
484b     484b:	0f 01 d9             	vmmcall
484e     484e:	0f 01 c1             	vmcall
4851     4851:	0f 01 d9             	vmmcall
4854     4854:	0f 01 c1             	vmcall
4857     4857:	0f 01 d9             	vmmcall
485a     485a:	0f 01 c1             	vmcall
485d     485d:	0f 01 d9             	vmmcall
4860     4860:	0f 01 c1             	vmcall
4863     4863:	0f 01 d9             	vmmcall
4866     4866:	0f 01 c1             	vmcall
4869     4869:	0f 01 d9             	vmmcall
486c     486c:	0f 01 c1             	vmcall
486f     486f:	0f 01 d9             	vmmcall
4872     4872:	0f 01 c1             	vmcall
4875     4875:	0f 01 d9             	vmmcall
4878     4878:	0f 01 c1             	vmcall
487b     487b:	0f 01 d9             	vmmcall
487e     487e:	0f 01 c1             	vmcall
4881     4881:	0f 01 d9             	vmmcall
4884     4884:	f3 0f b8 c7          	popcnt %edi,%eax
4888     4888:	f3 0f b8 c7          	popcnt %edi,%eax
488c     488c:	f3 0f b8 c7          	popcnt %edi,%eax
4890     4890:	f3 0f b8 c7          	popcnt %edi,%eax
4894     4894:	f3 0f b8 c7          	popcnt %edi,%eax
4898     4898:	f3 0f b8 c7          	popcnt %edi,%eax
489c     489c:	f3 0f b8 c7          	popcnt %edi,%eax
48a0     48a0:	f3 0f b8 c7          	popcnt %edi,%eax
48a4     48a4:	f3 0f b8 c7          	popcnt %edi,%eax
48a8     48a8:	f3 0f b8 c7          	popcnt %edi,%eax
48ac     48ac:	f3 0f b8 c7          	popcnt %edi,%eax
48b0     48b0:	f3 0f b8 c7          	popcnt %edi,%eax
48b4     48b4:	f3 0f b8 c7          	popcnt %edi,%eax
48b8     48b8:	9c                   	pushf
48b9     48b9:	58                   	pop    %rax
48ba     48ba:	9c                   	pushf
48bb     48bb:	58                   	pop    %rax
48bc     48bc:	9c                   	pushf
48bd     48bd:	58                   	pop    %rax
48be     48be:	9c                   	pushf
48bf     48bf:	58                   	pop    %rax
48c0     48c0:	9c                   	pushf
48c1     48c1:	58                   	pop    %rax
48c2     48c2:	9c                   	pushf
48c3     48c3:	58                   	pop    %rax
48c4     48c4:	9c                   	pushf
48c5     48c5:	58                   	pop    %rax
48c6     48c6:	9c                   	pushf
48c7     48c7:	58                   	pop    %rax
48c8     48c8:	9c                   	pushf
48c9     48c9:	58                   	pop    %rax
48ca     48ca:	e8 00 00 00 00       	call   48cf <.altinstr_replacement+0x48cf>	48cb: R_X86_64_PLT32	clear_page_rep-0x4
48cf     48cf:	e8 00 00 00 00       	call   48d4 <.altinstr_replacement+0x48d4>	48d0: R_X86_64_PLT32	clear_page_erms-0x4
48d4     48d4:	9c                   	pushf
48d5     48d5:	58                   	pop    %rax
48d6     48d6:	9c                   	pushf
48d7     48d7:	58                   	pop    %rax
48d8     48d8:	0f 01 cb             	stac
48db     48db:	0f 01 ca             	clac
48de     48de:	f3 48 0f b8 c7       	popcnt %rdi,%rax
48e3     48e3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
48e8     48e8:	9c                   	pushf
48e9     48e9:	58                   	pop    %rax
48ea     48ea:	9c                   	pushf
48eb     48eb:	58                   	pop    %rax
48ec     48ec:	9c                   	pushf
48ed     48ed:	58                   	pop    %rax
48ee     48ee:	fa                   	cli
48ef     48ef:	9c                   	pushf
48f0     48f0:	58                   	pop    %rax
48f1     48f1:	fb                   	sti
48f2     48f2:	f3 0f b8 c7          	popcnt %edi,%eax
48f6     48f6:	f3 0f b8 c7          	popcnt %edi,%eax
48fa     48fa:	f3 0f b8 c7          	popcnt %edi,%eax
48fe     48fe:	f3 0f b8 c7          	popcnt %edi,%eax
4902     4902:	f3 0f b8 c7          	popcnt %edi,%eax
4906     4906:	f3 48 0f b8 c7       	popcnt %rdi,%rax
490b     490b:	9c                   	pushf
490c     490c:	58                   	pop    %rax
490d     490d:	fa                   	cli
490e     490e:	fb                   	sti
490f     490f:	f3 0f b8 c7          	popcnt %edi,%eax
4913     4913:	f3 0f b8 c7          	popcnt %edi,%eax
4917     4917:	f3 48 0f b8 c7       	popcnt %rdi,%rax
491c     491c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4921     4921:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4926     4926:	f3 48 0f b8 c7       	popcnt %rdi,%rax
492b     492b:	f3 0f b8 c7          	popcnt %edi,%eax
492f     492f:	9c                   	pushf
4930     4930:	58                   	pop    %rax
4931     4931:	9c                   	pushf
4932     4932:	58                   	pop    %rax
4933     4933:	9c                   	pushf
4934     4934:	58                   	pop    %rax
4935     4935:	9c                   	pushf
4936     4936:	58                   	pop    %rax
4937     4937:	9c                   	pushf
4938     4938:	58                   	pop    %rax
4939     4939:	e9 00 00 00 00       	jmp    493e <.altinstr_replacement+0x493e>	493a: R_X86_64_PC32	.text+0x602828e
493e     493e:	e9 00 00 00 00       	jmp    4943 <.altinstr_replacement+0x4943>	493f: R_X86_64_PC32	.text+0x6028286
4943     4943:	e9 00 00 00 00       	jmp    4948 <.altinstr_replacement+0x4948>	4944: R_X86_64_PC32	.init.text+0x390222
4948     4948:	f3 48 0f b8 c7       	popcnt %rdi,%rax
494d     494d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4952     4952:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4957     4957:	f3 48 0f b8 c7       	popcnt %rdi,%rax
495c     495c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4961     4961:	9c                   	pushf
4962     4962:	58                   	pop    %rax
4963     4963:	fa                   	cli
4964     4964:	fb                   	sti
4965     4965:	9c                   	pushf
4966     4966:	58                   	pop    %rax
4967     4967:	fa                   	cli
4968     4968:	9c                   	pushf
4969     4969:	58                   	pop    %rax
496a     496a:	fb                   	sti
496b     496b:	0f 01 cb             	stac
496e     496e:	e8 00 00 00 00       	call   4973 <.altinstr_replacement+0x4973>	496f: R_X86_64_PLT32	rep_stos_alternative-0x4
4973     4973:	0f 01 ca             	clac
4976     4976:	9c                   	pushf
4977     4977:	58                   	pop    %rax
4978     4978:	fa                   	cli
4979     4979:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
4983     4983:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
498d     498d:	49 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r15
4997     4997:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
49a1     49a1:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
49ab     49ab:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
49b5     49b5:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
49bf     49bf:	9c                   	pushf
49c0     49c0:	58                   	pop    %rax
49c1     49c1:	fa                   	cli
49c2     49c2:	9c                   	pushf
49c3     49c3:	58                   	pop    %rax
49c4     49c4:	fb                   	sti
49c5     49c5:	9c                   	pushf
49c6     49c6:	58                   	pop    %rax
49c7     49c7:	fa                   	cli
49c8     49c8:	9c                   	pushf
49c9     49c9:	58                   	pop    %rax
49ca     49ca:	fb                   	sti
49cb     49cb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
49d0     49d0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
49d5     49d5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
49da     49da:	f3 48 0f b8 c7       	popcnt %rdi,%rax
49df     49df:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
49e3     49e3:	0f 0d 0b             	prefetchw (%rbx)
49e6     49e6:	41 0f 0d 0c 14       	prefetchw (%r12,%rdx,1)
49eb     49eb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
49f0     49f0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
49f5     49f5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
49fa     49fa:	f3 48 0f b8 c7       	popcnt %rdi,%rax
49ff     49ff:	e9 00 00 00 00       	jmp    4a04 <.altinstr_replacement+0x4a04>	4a00: R_X86_64_PC32	.text+0x6238825
4a04     4a04:	48 89 f8             	mov    %rdi,%rax
4a07     4a07:	e9 00 00 00 00       	jmp    4a0c <.altinstr_replacement+0x4a0c>	4a08: R_X86_64_PC32	.text+0x6238980
4a0c     4a0c:	48 89 f8             	mov    %rdi,%rax
4a0f     4a0f:	48 89 f8             	mov    %rdi,%rax
4a12     4a12:	48 89 f8             	mov    %rdi,%rax
4a15     4a15:	48 89 f8             	mov    %rdi,%rax
4a18     4a18:	e9 00 00 00 00       	jmp    4a1d <.altinstr_replacement+0x4a1d>	4a19: R_X86_64_PC32	.text+0x623a644
4a1d     4a1d:	0f 0d 8b 00 80 ff ff 	prefetchw -0x8000(%rbx)
4a24     4a24:	0f 0d 08             	prefetchw (%rax)
4a27     4a27:	41 0f 0d 0e          	prefetchw (%r14)
4a2b     4a2b:	41 0f 0d 4d 00       	prefetchw 0x0(%r13)
4a30     4a30:	e9 00 00 00 00       	jmp    4a35 <.altinstr_replacement+0x4a35>	4a31: R_X86_64_PC32	.text+0x623c8bd
4a35     4a35:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4a3a     4a3a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4a3f     4a3f:	e9 00 00 00 00       	jmp    4a44 <.altinstr_replacement+0x4a44>	4a40: R_X86_64_PC32	.text+0x6243781
4a44     4a44:	e9 00 00 00 00       	jmp    4a49 <.altinstr_replacement+0x4a49>	4a45: R_X86_64_PC32	.text+0x624740e
4a49     4a49:	e9 00 00 00 00       	jmp    4a4e <.altinstr_replacement+0x4a4e>	4a4a: R_X86_64_PC32	.text+0x6247751
4a4e     4a4e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4a53     4a53:	f3 0f b8 c7          	popcnt %edi,%eax
4a57     4a57:	9c                   	pushf
4a58     4a58:	58                   	pop    %rax
4a59     4a59:	fa                   	cli
4a5a     4a5a:	fb                   	sti
4a5b     4a5b:	9c                   	pushf
4a5c     4a5c:	58                   	pop    %rax
4a5d     4a5d:	fa                   	cli
4a5e     4a5e:	fb                   	sti
4a5f     4a5f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4a64     4a64:	f3 0f b8 c7          	popcnt %edi,%eax
4a68     4a68:	f3 0f b8 c7          	popcnt %edi,%eax
4a6c     4a6c:	f3 0f b8 c7          	popcnt %edi,%eax
4a70     4a70:	f3 0f b8 c7          	popcnt %edi,%eax
4a74     4a74:	9c                   	pushf
4a75     4a75:	58                   	pop    %rax
4a76     4a76:	fa                   	cli
4a77     4a77:	9c                   	pushf
4a78     4a78:	58                   	pop    %rax
4a79     4a79:	fb                   	sti
4a7a     4a7a:	9c                   	pushf
4a7b     4a7b:	58                   	pop    %rax
4a7c     4a7c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4a81     4a81:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4a86     4a86:	9c                   	pushf
4a87     4a87:	58                   	pop    %rax
4a88     4a88:	fa                   	cli
4a89     4a89:	9c                   	pushf
4a8a     4a8a:	58                   	pop    %rax
4a8b     4a8b:	fb                   	sti
4a8c     4a8c:	f3 0f b8 c7          	popcnt %edi,%eax
4a90     4a90:	9c                   	pushf
4a91     4a91:	58                   	pop    %rax
4a92     4a92:	fa                   	cli
4a93     4a93:	9c                   	pushf
4a94     4a94:	58                   	pop    %rax
4a95     4a95:	fb                   	sti
4a96     4a96:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4a9b     4a9b:	9c                   	pushf
4a9c     4a9c:	58                   	pop    %rax
4a9d     4a9d:	9c                   	pushf
4a9e     4a9e:	58                   	pop    %rax
4a9f     4a9f:	fb                   	sti
4aa0     4aa0:	9c                   	pushf
4aa1     4aa1:	58                   	pop    %rax
4aa2     4aa2:	fa                   	cli
4aa3     4aa3:	9c                   	pushf
4aa4     4aa4:	58                   	pop    %rax
4aa5     4aa5:	fa                   	cli
4aa6     4aa6:	9c                   	pushf
4aa7     4aa7:	58                   	pop    %rax
4aa8     4aa8:	fb                   	sti
4aa9     4aa9:	9c                   	pushf
4aaa     4aaa:	58                   	pop    %rax
4aab     4aab:	fa                   	cli
4aac     4aac:	9c                   	pushf
4aad     4aad:	58                   	pop    %rax
4aae     4aae:	fb                   	sti
4aaf     4aaf:	9c                   	pushf
4ab0     4ab0:	58                   	pop    %rax
4ab1     4ab1:	fa                   	cli
4ab2     4ab2:	9c                   	pushf
4ab3     4ab3:	58                   	pop    %rax
4ab4     4ab4:	fb                   	sti
4ab5     4ab5:	f3 0f b8 c7          	popcnt %edi,%eax
4ab9     4ab9:	f3 0f b8 c7          	popcnt %edi,%eax
4abd     4abd:	9c                   	pushf
4abe     4abe:	58                   	pop    %rax
4abf     4abf:	fa                   	cli
4ac0     4ac0:	9c                   	pushf
4ac1     4ac1:	58                   	pop    %rax
4ac2     4ac2:	fb                   	sti
4ac3     4ac3:	9c                   	pushf
4ac4     4ac4:	58                   	pop    %rax
4ac5     4ac5:	fa                   	cli
4ac6     4ac6:	9c                   	pushf
4ac7     4ac7:	58                   	pop    %rax
4ac8     4ac8:	fb                   	sti
4ac9     4ac9:	9c                   	pushf
4aca     4aca:	58                   	pop    %rax
4acb     4acb:	fa                   	cli
4acc     4acc:	9c                   	pushf
4acd     4acd:	58                   	pop    %rax
4ace     4ace:	fb                   	sti
4acf     4acf:	9c                   	pushf
4ad0     4ad0:	58                   	pop    %rax
4ad1     4ad1:	fb                   	sti
4ad2     4ad2:	9c                   	pushf
4ad3     4ad3:	58                   	pop    %rax
4ad4     4ad4:	9c                   	pushf
4ad5     4ad5:	58                   	pop    %rax
4ad6     4ad6:	fa                   	cli
4ad7     4ad7:	9c                   	pushf
4ad8     4ad8:	58                   	pop    %rax
4ad9     4ad9:	fb                   	sti
4ada     4ada:	9c                   	pushf
4adb     4adb:	58                   	pop    %rax
4adc     4adc:	fa                   	cli
4add     4add:	9c                   	pushf
4ade     4ade:	58                   	pop    %rax
4adf     4adf:	fb                   	sti
4ae0     4ae0:	f3 0f b8 c7          	popcnt %edi,%eax
4ae4     4ae4:	9c                   	pushf
4ae5     4ae5:	58                   	pop    %rax
4ae6     4ae6:	fa                   	cli
4ae7     4ae7:	9c                   	pushf
4ae8     4ae8:	58                   	pop    %rax
4ae9     4ae9:	fb                   	sti
4aea     4aea:	9c                   	pushf
4aeb     4aeb:	58                   	pop    %rax
4aec     4aec:	fa                   	cli
4aed     4aed:	9c                   	pushf
4aee     4aee:	58                   	pop    %rax
4aef     4aef:	fb                   	sti
4af0     4af0:	9c                   	pushf
4af1     4af1:	58                   	pop    %rax
4af2     4af2:	fa                   	cli
4af3     4af3:	9c                   	pushf
4af4     4af4:	58                   	pop    %rax
4af5     4af5:	fb                   	sti
4af6     4af6:	9c                   	pushf
4af7     4af7:	58                   	pop    %rax
4af8     4af8:	fa                   	cli
4af9     4af9:	9c                   	pushf
4afa     4afa:	58                   	pop    %rax
4afb     4afb:	fb                   	sti
4afc     4afc:	e8 00 00 00 00       	call   4b01 <.altinstr_replacement+0x4b01>	4afd: R_X86_64_PLT32	clear_page_rep-0x4
4b01     4b01:	e8 00 00 00 00       	call   4b06 <.altinstr_replacement+0x4b06>	4b02: R_X86_64_PLT32	clear_page_erms-0x4
4b06     4b06:	9c                   	pushf
4b07     4b07:	58                   	pop    %rax
4b08     4b08:	fa                   	cli
4b09     4b09:	9c                   	pushf
4b0a     4b0a:	58                   	pop    %rax
4b0b     4b0b:	fb                   	sti
4b0c     4b0c:	f3 0f b8 c7          	popcnt %edi,%eax
4b10     4b10:	9c                   	pushf
4b11     4b11:	58                   	pop    %rax
4b12     4b12:	fa                   	cli
4b13     4b13:	9c                   	pushf
4b14     4b14:	58                   	pop    %rax
4b15     4b15:	fb                   	sti
4b16     4b16:	9c                   	pushf
4b17     4b17:	58                   	pop    %rax
4b18     4b18:	fa                   	cli
4b19     4b19:	9c                   	pushf
4b1a     4b1a:	58                   	pop    %rax
4b1b     4b1b:	fb                   	sti
4b1c     4b1c:	9c                   	pushf
4b1d     4b1d:	58                   	pop    %rax
4b1e     4b1e:	fa                   	cli
4b1f     4b1f:	9c                   	pushf
4b20     4b20:	58                   	pop    %rax
4b21     4b21:	fb                   	sti
4b22     4b22:	9c                   	pushf
4b23     4b23:	58                   	pop    %rax
4b24     4b24:	fa                   	cli
4b25     4b25:	9c                   	pushf
4b26     4b26:	58                   	pop    %rax
4b27     4b27:	fb                   	sti
4b28     4b28:	9c                   	pushf
4b29     4b29:	58                   	pop    %rax
4b2a     4b2a:	fa                   	cli
4b2b     4b2b:	9c                   	pushf
4b2c     4b2c:	58                   	pop    %rax
4b2d     4b2d:	9c                   	pushf
4b2e     4b2e:	58                   	pop    %rax
4b2f     4b2f:	fb                   	sti
4b30     4b30:	fb                   	sti
4b31     4b31:	f3 0f b8 c7          	popcnt %edi,%eax
4b35     4b35:	f3 0f b8 c7          	popcnt %edi,%eax
4b39     4b39:	f3 0f b8 c7          	popcnt %edi,%eax
4b3d     4b3d:	f3 0f b8 c7          	popcnt %edi,%eax
4b41     4b41:	f3 0f b8 c7          	popcnt %edi,%eax
4b45     4b45:	f3 0f b8 c7          	popcnt %edi,%eax
4b49     4b49:	f3 0f b8 c7          	popcnt %edi,%eax
4b4d     4b4d:	f3 0f b8 c7          	popcnt %edi,%eax
4b51     4b51:	f3 0f b8 c7          	popcnt %edi,%eax
4b55     4b55:	f3 0f b8 c7          	popcnt %edi,%eax
4b59     4b59:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4b5e     4b5e:	f3 0f b8 c7          	popcnt %edi,%eax
4b62     4b62:	f3 0f b8 c7          	popcnt %edi,%eax
4b66     4b66:	f3 0f b8 c7          	popcnt %edi,%eax
4b6a     4b6a:	f3 0f b8 c7          	popcnt %edi,%eax
4b6e     4b6e:	f3 0f b8 c7          	popcnt %edi,%eax
4b72     4b72:	f3 0f b8 c7          	popcnt %edi,%eax
4b76     4b76:	f3 0f b8 c7          	popcnt %edi,%eax
4b7a     4b7a:	f3 0f b8 c7          	popcnt %edi,%eax
4b7e     4b7e:	f3 0f b8 c7          	popcnt %edi,%eax
4b82     4b82:	f3 0f b8 c7          	popcnt %edi,%eax
4b86     4b86:	f3 0f b8 c7          	popcnt %edi,%eax
4b8a     4b8a:	9c                   	pushf
4b8b     4b8b:	58                   	pop    %rax
4b8c     4b8c:	fa                   	cli
4b8d     4b8d:	9c                   	pushf
4b8e     4b8e:	58                   	pop    %rax
4b8f     4b8f:	fb                   	sti
4b90     4b90:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4b95     4b95:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4b9a     4b9a:	f3 0f b8 c7          	popcnt %edi,%eax
4b9e     4b9e:	9c                   	pushf
4b9f     4b9f:	58                   	pop    %rax
4ba0     4ba0:	fa                   	cli
4ba1     4ba1:	9c                   	pushf
4ba2     4ba2:	58                   	pop    %rax
4ba3     4ba3:	fb                   	sti
4ba4     4ba4:	9c                   	pushf
4ba5     4ba5:	58                   	pop    %rax
4ba6     4ba6:	fa                   	cli
4ba7     4ba7:	9c                   	pushf
4ba8     4ba8:	58                   	pop    %rax
4ba9     4ba9:	fb                   	sti
4baa     4baa:	9c                   	pushf
4bab     4bab:	58                   	pop    %rax
4bac     4bac:	fa                   	cli
4bad     4bad:	9c                   	pushf
4bae     4bae:	58                   	pop    %rax
4baf     4baf:	fb                   	sti
4bb0     4bb0:	f3 0f b8 c7          	popcnt %edi,%eax
4bb4     4bb4:	9c                   	pushf
4bb5     4bb5:	58                   	pop    %rax
4bb6     4bb6:	9c                   	pushf
4bb7     4bb7:	58                   	pop    %rax
4bb8     4bb8:	9c                   	pushf
4bb9     4bb9:	58                   	pop    %rax
4bba     4bba:	9c                   	pushf
4bbb     4bbb:	58                   	pop    %rax
4bbc     4bbc:	9c                   	pushf
4bbd     4bbd:	58                   	pop    %rax
4bbe     4bbe:	9c                   	pushf
4bbf     4bbf:	58                   	pop    %rax
4bc0     4bc0:	9c                   	pushf
4bc1     4bc1:	58                   	pop    %rax
4bc2     4bc2:	9c                   	pushf
4bc3     4bc3:	58                   	pop    %rax
4bc4     4bc4:	9c                   	pushf
4bc5     4bc5:	58                   	pop    %rax
4bc6     4bc6:	9c                   	pushf
4bc7     4bc7:	58                   	pop    %rax
4bc8     4bc8:	9c                   	pushf
4bc9     4bc9:	58                   	pop    %rax
4bca     4bca:	fb                   	sti
4bcb     4bcb:	9c                   	pushf
4bcc     4bcc:	58                   	pop    %rax
4bcd     4bcd:	fb                   	sti
4bce     4bce:	9c                   	pushf
4bcf     4bcf:	58                   	pop    %rax
4bd0     4bd0:	fa                   	cli
4bd1     4bd1:	9c                   	pushf
4bd2     4bd2:	58                   	pop    %rax
4bd3     4bd3:	fb                   	sti
4bd4     4bd4:	9c                   	pushf
4bd5     4bd5:	58                   	pop    %rax
4bd6     4bd6:	fb                   	sti
4bd7     4bd7:	9c                   	pushf
4bd8     4bd8:	58                   	pop    %rax
4bd9     4bd9:	fa                   	cli
4bda     4bda:	9c                   	pushf
4bdb     4bdb:	58                   	pop    %rax
4bdc     4bdc:	fa                   	cli
4bdd     4bdd:	9c                   	pushf
4bde     4bde:	58                   	pop    %rax
4bdf     4bdf:	fb                   	sti
4be0     4be0:	9c                   	pushf
4be1     4be1:	58                   	pop    %rax
4be2     4be2:	fa                   	cli
4be3     4be3:	fb                   	sti
4be4     4be4:	fb                   	sti
4be5     4be5:	f3 0f b8 c7          	popcnt %edi,%eax
4be9     4be9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4bee     4bee:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4bf3     4bf3:	9c                   	pushf
4bf4     4bf4:	58                   	pop    %rax
4bf5     4bf5:	fa                   	cli
4bf6     4bf6:	9c                   	pushf
4bf7     4bf7:	58                   	pop    %rax
4bf8     4bf8:	fb                   	sti
4bf9     4bf9:	9c                   	pushf
4bfa     4bfa:	58                   	pop    %rax
4bfb     4bfb:	fa                   	cli
4bfc     4bfc:	9c                   	pushf
4bfd     4bfd:	58                   	pop    %rax
4bfe     4bfe:	fb                   	sti
4bff     4bff:	9c                   	pushf
4c00     4c00:	58                   	pop    %rax
4c01     4c01:	fa                   	cli
4c02     4c02:	9c                   	pushf
4c03     4c03:	58                   	pop    %rax
4c04     4c04:	fa                   	cli
4c05     4c05:	9c                   	pushf
4c06     4c06:	58                   	pop    %rax
4c07     4c07:	fb                   	sti
4c08     4c08:	fb                   	sti
4c09     4c09:	9c                   	pushf
4c0a     4c0a:	58                   	pop    %rax
4c0b     4c0b:	fa                   	cli
4c0c     4c0c:	9c                   	pushf
4c0d     4c0d:	58                   	pop    %rax
4c0e     4c0e:	fa                   	cli
4c0f     4c0f:	9c                   	pushf
4c10     4c10:	58                   	pop    %rax
4c11     4c11:	fb                   	sti
4c12     4c12:	fb                   	sti
4c13     4c13:	9c                   	pushf
4c14     4c14:	58                   	pop    %rax
4c15     4c15:	fa                   	cli
4c16     4c16:	9c                   	pushf
4c17     4c17:	58                   	pop    %rax
4c18     4c18:	fb                   	sti
4c19     4c19:	9c                   	pushf
4c1a     4c1a:	58                   	pop    %rax
4c1b     4c1b:	fb                   	sti
4c1c     4c1c:	9c                   	pushf
4c1d     4c1d:	58                   	pop    %rax
4c1e     4c1e:	fb                   	sti
4c1f     4c1f:	9c                   	pushf
4c20     4c20:	58                   	pop    %rax
4c21     4c21:	fb                   	sti
4c22     4c22:	9c                   	pushf
4c23     4c23:	58                   	pop    %rax
4c24     4c24:	fb                   	sti
4c25     4c25:	0f 0d 0b             	prefetchw (%rbx)
4c28     4c28:	41 0f 0d 0c 24       	prefetchw (%r12)
4c2d     4c2d:	41 0f 0d 8c 24 58 0e 00 00 	prefetchw 0xe58(%r12)
4c36     4c36:	41 0f 0d 8c 24 5c 0e 00 00 	prefetchw 0xe5c(%r12)
4c3f     4c3f:	9c                   	pushf
4c40     4c40:	58                   	pop    %rax
4c41     4c41:	fa                   	cli
4c42     4c42:	9c                   	pushf
4c43     4c43:	58                   	pop    %rax
4c44     4c44:	fb                   	sti
4c45     4c45:	0f 0d 0c 02          	prefetchw (%rdx,%rax,1)
4c49     4c49:	42 0f 0d 0c 22       	prefetchw (%rdx,%r12,1)
4c4e     4c4e:	42 0f 0d 0c 22       	prefetchw (%rdx,%r12,1)
4c53     4c53:	9c                   	pushf
4c54     4c54:	58                   	pop    %rax
4c55     4c55:	fa                   	cli
4c56     4c56:	9c                   	pushf
4c57     4c57:	58                   	pop    %rax
4c58     4c58:	fb                   	sti
4c59     4c59:	0f 0d 08             	prefetchw (%rax)
4c5c     4c5c:	f3 0f b8 c7          	popcnt %edi,%eax
4c60     4c60:	f3 0f b8 c7          	popcnt %edi,%eax
4c64     4c64:	f3 0f b8 c7          	popcnt %edi,%eax
4c68     4c68:	f3 0f b8 c7          	popcnt %edi,%eax
4c6c     4c6c:	f3 0f b8 c7          	popcnt %edi,%eax
4c70     4c70:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4c75     4c75:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4c7a     4c7a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4c7f     4c7f:	f3 0f b8 c7          	popcnt %edi,%eax
4c83     4c83:	9c                   	pushf
4c84     4c84:	58                   	pop    %rax
4c85     4c85:	fa                   	cli
4c86     4c86:	9c                   	pushf
4c87     4c87:	58                   	pop    %rax
4c88     4c88:	fb                   	sti
4c89     4c89:	9c                   	pushf
4c8a     4c8a:	58                   	pop    %rax
4c8b     4c8b:	fa                   	cli
4c8c     4c8c:	9c                   	pushf
4c8d     4c8d:	58                   	pop    %rax
4c8e     4c8e:	fb                   	sti
4c8f     4c8f:	f3 0f b8 c7          	popcnt %edi,%eax
4c93     4c93:	9c                   	pushf
4c94     4c94:	58                   	pop    %rax
4c95     4c95:	fb                   	sti
4c96     4c96:	9c                   	pushf
4c97     4c97:	58                   	pop    %rax
4c98     4c98:	fa                   	cli
4c99     4c99:	9c                   	pushf
4c9a     4c9a:	58                   	pop    %rax
4c9b     4c9b:	fb                   	sti
4c9c     4c9c:	9c                   	pushf
4c9d     4c9d:	58                   	pop    %rax
4c9e     4c9e:	fb                   	sti
4c9f     4c9f:	9c                   	pushf
4ca0     4ca0:	58                   	pop    %rax
4ca1     4ca1:	fa                   	cli
4ca2     4ca2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4ca7     4ca7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4cac     4cac:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4cb1     4cb1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4cb6     4cb6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4cbb     4cbb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4cc0     4cc0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4cc5     4cc5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4cca     4cca:	9c                   	pushf
4ccb     4ccb:	58                   	pop    %rax
4ccc     4ccc:	fa                   	cli
4ccd     4ccd:	9c                   	pushf
4cce     4cce:	58                   	pop    %rax
4ccf     4ccf:	fb                   	sti
4cd0     4cd0:	9c                   	pushf
4cd1     4cd1:	58                   	pop    %rax
4cd2     4cd2:	fa                   	cli
4cd3     4cd3:	fb                   	sti
4cd4     4cd4:	f3 0f b8 c7          	popcnt %edi,%eax
4cd8     4cd8:	9c                   	pushf
4cd9     4cd9:	58                   	pop    %rax
4cda     4cda:	fb                   	sti
4cdb     4cdb:	9c                   	pushf
4cdc     4cdc:	58                   	pop    %rax
4cdd     4cdd:	fb                   	sti
4cde     4cde:	9c                   	pushf
4cdf     4cdf:	58                   	pop    %rax
4ce0     4ce0:	fa                   	cli
4ce1     4ce1:	f3 0f b8 c7          	popcnt %edi,%eax
4ce5     4ce5:	9c                   	pushf
4ce6     4ce6:	58                   	pop    %rax
4ce7     4ce7:	fa                   	cli
4ce8     4ce8:	9c                   	pushf
4ce9     4ce9:	58                   	pop    %rax
4cea     4cea:	fb                   	sti
4ceb     4ceb:	9c                   	pushf
4cec     4cec:	58                   	pop    %rax
4ced     4ced:	fa                   	cli
4cee     4cee:	9c                   	pushf
4cef     4cef:	58                   	pop    %rax
4cf0     4cf0:	fb                   	sti
4cf1     4cf1:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
4cf5     4cf5:	41 0f 0d 0c 24       	prefetchw (%r12)
4cfa     4cfa:	0f 0d 0b             	prefetchw (%rbx)
4cfd     4cfd:	0f 0d 0b             	prefetchw (%rbx)
4d00     4d00:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
4d04     4d04:	0f 0d 08             	prefetchw (%rax)
4d07     4d07:	41 0f 0d 0e          	prefetchw (%r14)
4d0b     4d0b:	0f 0d 08             	prefetchw (%rax)
4d0e     4d0e:	f3 0f b8 c7          	popcnt %edi,%eax
4d12     4d12:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4d17     4d17:	9c                   	pushf
4d18     4d18:	58                   	pop    %rax
4d19     4d19:	fa                   	cli
4d1a     4d1a:	9c                   	pushf
4d1b     4d1b:	58                   	pop    %rax
4d1c     4d1c:	fb                   	sti
4d1d     4d1d:	9c                   	pushf
4d1e     4d1e:	58                   	pop    %rax
4d1f     4d1f:	fa                   	cli
4d20     4d20:	fb                   	sti
4d21     4d21:	9c                   	pushf
4d22     4d22:	58                   	pop    %rax
4d23     4d23:	fa                   	cli
4d24     4d24:	9c                   	pushf
4d25     4d25:	58                   	pop    %rax
4d26     4d26:	fb                   	sti
4d27     4d27:	0f 0d 08             	prefetchw (%rax)
4d2a     4d2a:	0f 0d 08             	prefetchw (%rax)
4d2d     4d2d:	0f 0d 08             	prefetchw (%rax)
4d30     4d30:	0f 0d 08             	prefetchw (%rax)
4d33     4d33:	0f 0d 08             	prefetchw (%rax)
4d36     4d36:	0f 0d 08             	prefetchw (%rax)
4d39     4d39:	41 0f 0d 4d 00       	prefetchw 0x0(%r13)
4d3e     4d3e:	0f 0d 08             	prefetchw (%rax)
4d41     4d41:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4d46     4d46:	0f 0d 08             	prefetchw (%rax)
4d49     4d49:	0f 0d 08             	prefetchw (%rax)
4d4c     4d4c:	41 0f 0d 0c 24       	prefetchw (%r12)
4d51     4d51:	0f 0d 08             	prefetchw (%rax)
4d54     4d54:	f3 0f b8 c7          	popcnt %edi,%eax
4d58     4d58:	f3 0f b8 c7          	popcnt %edi,%eax
4d5c     4d5c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4d61     4d61:	41 0f 0d 8c 05 00 02 00 00 	prefetchw 0x200(%r13,%rax,1)
4d6a     4d6a:	41 0f 0d 8c 07 40 02 00 00 	prefetchw 0x240(%r15,%rax,1)
4d73     4d73:	0f 0d 88 e4 00 00 00 	prefetchw 0xe4(%rax)
4d7a     4d7a:	0f 0d 0b             	prefetchw (%rbx)
4d7d     4d7d:	f3 0f b8 c7          	popcnt %edi,%eax
4d81     4d81:	f3 0f b8 c7          	popcnt %edi,%eax
4d85     4d85:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4d8a     4d8a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4d8f     4d8f:	9c                   	pushf
4d90     4d90:	58                   	pop    %rax
4d91     4d91:	fa                   	cli
4d92     4d92:	9c                   	pushf
4d93     4d93:	58                   	pop    %rax
4d94     4d94:	fb                   	sti
4d95     4d95:	9c                   	pushf
4d96     4d96:	58                   	pop    %rax
4d97     4d97:	fa                   	cli
4d98     4d98:	9c                   	pushf
4d99     4d99:	58                   	pop    %rax
4d9a     4d9a:	fb                   	sti
4d9b     4d9b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4da0     4da0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4da5     4da5:	f3 0f b8 c7          	popcnt %edi,%eax
4da9     4da9:	f3 0f b8 c7          	popcnt %edi,%eax
4dad     4dad:	f3 0f b8 c7          	popcnt %edi,%eax
4db1     4db1:	f3 0f b8 c7          	popcnt %edi,%eax
4db5     4db5:	f3 0f b8 c7          	popcnt %edi,%eax
4db9     4db9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4dbe     4dbe:	9c                   	pushf
4dbf     4dbf:	58                   	pop    %rax
4dc0     4dc0:	fb                   	sti
4dc1     4dc1:	9c                   	pushf
4dc2     4dc2:	58                   	pop    %rax
4dc3     4dc3:	fb                   	sti
4dc4     4dc4:	9c                   	pushf
4dc5     4dc5:	58                   	pop    %rax
4dc6     4dc6:	fa                   	cli
4dc7     4dc7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4dcc     4dcc:	9c                   	pushf
4dcd     4dcd:	58                   	pop    %rax
4dce     4dce:	fb                   	sti
4dcf     4dcf:	9c                   	pushf
4dd0     4dd0:	58                   	pop    %rax
4dd1     4dd1:	fb                   	sti
4dd2     4dd2:	9c                   	pushf
4dd3     4dd3:	58                   	pop    %rax
4dd4     4dd4:	fa                   	cli
4dd5     4dd5:	9c                   	pushf
4dd6     4dd6:	58                   	pop    %rax
4dd7     4dd7:	fb                   	sti
4dd8     4dd8:	9c                   	pushf
4dd9     4dd9:	58                   	pop    %rax
4dda     4dda:	fb                   	sti
4ddb     4ddb:	9c                   	pushf
4ddc     4ddc:	58                   	pop    %rax
4ddd     4ddd:	fa                   	cli
4dde     4dde:	9c                   	pushf
4ddf     4ddf:	58                   	pop    %rax
4de0     4de0:	fb                   	sti
4de1     4de1:	9c                   	pushf
4de2     4de2:	58                   	pop    %rax
4de3     4de3:	fb                   	sti
4de4     4de4:	9c                   	pushf
4de5     4de5:	58                   	pop    %rax
4de6     4de6:	fa                   	cli
4de7     4de7:	9c                   	pushf
4de8     4de8:	58                   	pop    %rax
4de9     4de9:	fb                   	sti
4dea     4dea:	9c                   	pushf
4deb     4deb:	58                   	pop    %rax
4dec     4dec:	fb                   	sti
4ded     4ded:	9c                   	pushf
4dee     4dee:	58                   	pop    %rax
4def     4def:	fa                   	cli
4df0     4df0:	9c                   	pushf
4df1     4df1:	58                   	pop    %rax
4df2     4df2:	fb                   	sti
4df3     4df3:	9c                   	pushf
4df4     4df4:	58                   	pop    %rax
4df5     4df5:	fb                   	sti
4df6     4df6:	9c                   	pushf
4df7     4df7:	58                   	pop    %rax
4df8     4df8:	fa                   	cli
4df9     4df9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4dfe     4dfe:	0f 0d 88 e4 00 00 00 	prefetchw 0xe4(%rax)
4e05     4e05:	0f 0d 88 40 02 00 00 	prefetchw 0x240(%rax)
4e0c     4e0c:	0f 0d 88 00 02 00 00 	prefetchw 0x200(%rax)
4e13     4e13:	0f 0d 08             	prefetchw (%rax)
4e16     4e16:	0f 0d 48 40          	prefetchw 0x40(%rax)
4e1a     4e1a:	9c                   	pushf
4e1b     4e1b:	58                   	pop    %rax
4e1c     4e1c:	fa                   	cli
4e1d     4e1d:	9c                   	pushf
4e1e     4e1e:	58                   	pop    %rax
4e1f     4e1f:	fb                   	sti
4e20     4e20:	9c                   	pushf
4e21     4e21:	58                   	pop    %rax
4e22     4e22:	fb                   	sti
4e23     4e23:	9c                   	pushf
4e24     4e24:	58                   	pop    %rax
4e25     4e25:	fb                   	sti
4e26     4e26:	9c                   	pushf
4e27     4e27:	58                   	pop    %rax
4e28     4e28:	fa                   	cli
4e29     4e29:	9c                   	pushf
4e2a     4e2a:	58                   	pop    %rax
4e2b     4e2b:	fa                   	cli
4e2c     4e2c:	9c                   	pushf
4e2d     4e2d:	58                   	pop    %rax
4e2e     4e2e:	fb                   	sti
4e2f     4e2f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4e34     4e34:	9c                   	pushf
4e35     4e35:	58                   	pop    %rax
4e36     4e36:	fa                   	cli
4e37     4e37:	9c                   	pushf
4e38     4e38:	58                   	pop    %rax
4e39     4e39:	fb                   	sti
4e3a     4e3a:	0f 0d 4d 20          	prefetchw 0x20(%rbp)
4e3e     4e3e:	0f 0d 4d 60          	prefetchw 0x60(%rbp)
4e42     4e42:	9c                   	pushf
4e43     4e43:	58                   	pop    %rax
4e44     4e44:	fa                   	cli
4e45     4e45:	9c                   	pushf
4e46     4e46:	58                   	pop    %rax
4e47     4e47:	fb                   	sti
4e48     4e48:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
4e4c     4e4c:	0f 0d 4d 40          	prefetchw 0x40(%rbp)
4e50     4e50:	41 0f 0d 0e          	prefetchw (%r14)
4e54     4e54:	41 0f 0d 4e 40       	prefetchw 0x40(%r14)
4e59     4e59:	41 0f 0d 0e          	prefetchw (%r14)
4e5d     4e5d:	41 0f 0d 4e 40       	prefetchw 0x40(%r14)
4e62     4e62:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
4e66     4e66:	0f 0d 4d 40          	prefetchw 0x40(%rbp)
4e6a     4e6a:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
4e6e     4e6e:	0f 0d 08             	prefetchw (%rax)
4e71     4e71:	41 0f 0d 4d 00       	prefetchw 0x0(%r13)
4e76     4e76:	41 0f 0d 4d 40       	prefetchw 0x40(%r13)
4e7b     4e7b:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
4e7f     4e7f:	0f 0d 4d 40          	prefetchw 0x40(%rbp)
4e83     4e83:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
4e87     4e87:	0f 0d 4d 40          	prefetchw 0x40(%rbp)
4e8b     4e8b:	0f 0d 08             	prefetchw (%rax)
4e8e     4e8e:	0f 0d 48 40          	prefetchw 0x40(%rax)
4e92     4e92:	9c                   	pushf
4e93     4e93:	58                   	pop    %rax
4e94     4e94:	fa                   	cli
4e95     4e95:	9c                   	pushf
4e96     4e96:	58                   	pop    %rax
4e97     4e97:	fb                   	sti
4e98     4e98:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
4e9c     4e9c:	0f 0d 4d 40          	prefetchw 0x40(%rbp)
4ea0     4ea0:	41 0f 0d 4e 20       	prefetchw 0x20(%r14)
4ea5     4ea5:	41 0f 0d 4e 60       	prefetchw 0x60(%r14)
4eaa     4eaa:	f3 0f b8 c7          	popcnt %edi,%eax
4eae     4eae:	0f 0d 08             	prefetchw (%rax)
4eb1     4eb1:	0f 0d 48 40          	prefetchw 0x40(%rax)
4eb5     4eb5:	9c                   	pushf
4eb6     4eb6:	58                   	pop    %rax
4eb7     4eb7:	fa                   	cli
4eb8     4eb8:	9c                   	pushf
4eb9     4eb9:	58                   	pop    %rax
4eba     4eba:	fb                   	sti
4ebb     4ebb:	9c                   	pushf
4ebc     4ebc:	58                   	pop    %rax
4ebd     4ebd:	fa                   	cli
4ebe     4ebe:	9c                   	pushf
4ebf     4ebf:	58                   	pop    %rax
4ec0     4ec0:	fb                   	sti
4ec1     4ec1:	9c                   	pushf
4ec2     4ec2:	58                   	pop    %rax
4ec3     4ec3:	fa                   	cli
4ec4     4ec4:	9c                   	pushf
4ec5     4ec5:	58                   	pop    %rax
4ec6     4ec6:	fb                   	sti
4ec7     4ec7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4ecc     4ecc:	9c                   	pushf
4ecd     4ecd:	58                   	pop    %rax
4ece     4ece:	fb                   	sti
4ecf     4ecf:	9c                   	pushf
4ed0     4ed0:	58                   	pop    %rax
4ed1     4ed1:	fb                   	sti
4ed2     4ed2:	9c                   	pushf
4ed3     4ed3:	58                   	pop    %rax
4ed4     4ed4:	fa                   	cli
4ed5     4ed5:	9c                   	pushf
4ed6     4ed6:	58                   	pop    %rax
4ed7     4ed7:	fb                   	sti
4ed8     4ed8:	9c                   	pushf
4ed9     4ed9:	58                   	pop    %rax
4eda     4eda:	fb                   	sti
4edb     4edb:	9c                   	pushf
4edc     4edc:	58                   	pop    %rax
4edd     4edd:	fa                   	cli
4ede     4ede:	9c                   	pushf
4edf     4edf:	58                   	pop    %rax
4ee0     4ee0:	fb                   	sti
4ee1     4ee1:	9c                   	pushf
4ee2     4ee2:	58                   	pop    %rax
4ee3     4ee3:	fb                   	sti
4ee4     4ee4:	9c                   	pushf
4ee5     4ee5:	58                   	pop    %rax
4ee6     4ee6:	fa                   	cli
4ee7     4ee7:	9c                   	pushf
4ee8     4ee8:	58                   	pop    %rax
4ee9     4ee9:	fb                   	sti
4eea     4eea:	9c                   	pushf
4eeb     4eeb:	58                   	pop    %rax
4eec     4eec:	fb                   	sti
4eed     4eed:	9c                   	pushf
4eee     4eee:	58                   	pop    %rax
4eef     4eef:	fa                   	cli
4ef0     4ef0:	9c                   	pushf
4ef1     4ef1:	58                   	pop    %rax
4ef2     4ef2:	fb                   	sti
4ef3     4ef3:	9c                   	pushf
4ef4     4ef4:	58                   	pop    %rax
4ef5     4ef5:	fb                   	sti
4ef6     4ef6:	9c                   	pushf
4ef7     4ef7:	58                   	pop    %rax
4ef8     4ef8:	fa                   	cli
4ef9     4ef9:	9c                   	pushf
4efa     4efa:	58                   	pop    %rax
4efb     4efb:	fb                   	sti
4efc     4efc:	9c                   	pushf
4efd     4efd:	58                   	pop    %rax
4efe     4efe:	fb                   	sti
4eff     4eff:	9c                   	pushf
4f00     4f00:	58                   	pop    %rax
4f01     4f01:	fa                   	cli
4f02     4f02:	9c                   	pushf
4f03     4f03:	58                   	pop    %rax
4f04     4f04:	fb                   	sti
4f05     4f05:	9c                   	pushf
4f06     4f06:	58                   	pop    %rax
4f07     4f07:	fb                   	sti
4f08     4f08:	9c                   	pushf
4f09     4f09:	58                   	pop    %rax
4f0a     4f0a:	fa                   	cli
4f0b     4f0b:	9c                   	pushf
4f0c     4f0c:	58                   	pop    %rax
4f0d     4f0d:	fa                   	cli
4f0e     4f0e:	9c                   	pushf
4f0f     4f0f:	58                   	pop    %rax
4f10     4f10:	fb                   	sti
4f11     4f11:	9c                   	pushf
4f12     4f12:	58                   	pop    %rax
4f13     4f13:	fb                   	sti
4f14     4f14:	9c                   	pushf
4f15     4f15:	58                   	pop    %rax
4f16     4f16:	fb                   	sti
4f17     4f17:	9c                   	pushf
4f18     4f18:	58                   	pop    %rax
4f19     4f19:	fa                   	cli
4f1a     4f1a:	9c                   	pushf
4f1b     4f1b:	58                   	pop    %rax
4f1c     4f1c:	fa                   	cli
4f1d     4f1d:	9c                   	pushf
4f1e     4f1e:	58                   	pop    %rax
4f1f     4f1f:	fb                   	sti
4f20     4f20:	9c                   	pushf
4f21     4f21:	58                   	pop    %rax
4f22     4f22:	fb                   	sti
4f23     4f23:	9c                   	pushf
4f24     4f24:	58                   	pop    %rax
4f25     4f25:	fb                   	sti
4f26     4f26:	9c                   	pushf
4f27     4f27:	58                   	pop    %rax
4f28     4f28:	fa                   	cli
4f29     4f29:	9c                   	pushf
4f2a     4f2a:	58                   	pop    %rax
4f2b     4f2b:	fb                   	sti
4f2c     4f2c:	9c                   	pushf
4f2d     4f2d:	58                   	pop    %rax
4f2e     4f2e:	fb                   	sti
4f2f     4f2f:	9c                   	pushf
4f30     4f30:	58                   	pop    %rax
4f31     4f31:	fa                   	cli
4f32     4f32:	9c                   	pushf
4f33     4f33:	58                   	pop    %rax
4f34     4f34:	fb                   	sti
4f35     4f35:	9c                   	pushf
4f36     4f36:	58                   	pop    %rax
4f37     4f37:	fb                   	sti
4f38     4f38:	9c                   	pushf
4f39     4f39:	58                   	pop    %rax
4f3a     4f3a:	fa                   	cli
4f3b     4f3b:	9c                   	pushf
4f3c     4f3c:	58                   	pop    %rax
4f3d     4f3d:	fb                   	sti
4f3e     4f3e:	9c                   	pushf
4f3f     4f3f:	58                   	pop    %rax
4f40     4f40:	fb                   	sti
4f41     4f41:	9c                   	pushf
4f42     4f42:	58                   	pop    %rax
4f43     4f43:	fa                   	cli
4f44     4f44:	9c                   	pushf
4f45     4f45:	58                   	pop    %rax
4f46     4f46:	fb                   	sti
4f47     4f47:	9c                   	pushf
4f48     4f48:	58                   	pop    %rax
4f49     4f49:	fb                   	sti
4f4a     4f4a:	9c                   	pushf
4f4b     4f4b:	58                   	pop    %rax
4f4c     4f4c:	fa                   	cli
4f4d     4f4d:	9c                   	pushf
4f4e     4f4e:	58                   	pop    %rax
4f4f     4f4f:	fb                   	sti
4f50     4f50:	9c                   	pushf
4f51     4f51:	58                   	pop    %rax
4f52     4f52:	fb                   	sti
4f53     4f53:	9c                   	pushf
4f54     4f54:	58                   	pop    %rax
4f55     4f55:	fa                   	cli
4f56     4f56:	9c                   	pushf
4f57     4f57:	58                   	pop    %rax
4f58     4f58:	fb                   	sti
4f59     4f59:	9c                   	pushf
4f5a     4f5a:	58                   	pop    %rax
4f5b     4f5b:	fb                   	sti
4f5c     4f5c:	9c                   	pushf
4f5d     4f5d:	58                   	pop    %rax
4f5e     4f5e:	fa                   	cli
4f5f     4f5f:	9c                   	pushf
4f60     4f60:	58                   	pop    %rax
4f61     4f61:	fb                   	sti
4f62     4f62:	9c                   	pushf
4f63     4f63:	58                   	pop    %rax
4f64     4f64:	fb                   	sti
4f65     4f65:	9c                   	pushf
4f66     4f66:	58                   	pop    %rax
4f67     4f67:	fa                   	cli
4f68     4f68:	9c                   	pushf
4f69     4f69:	58                   	pop    %rax
4f6a     4f6a:	fb                   	sti
4f6b     4f6b:	9c                   	pushf
4f6c     4f6c:	58                   	pop    %rax
4f6d     4f6d:	fb                   	sti
4f6e     4f6e:	9c                   	pushf
4f6f     4f6f:	58                   	pop    %rax
4f70     4f70:	fa                   	cli
4f71     4f71:	9c                   	pushf
4f72     4f72:	58                   	pop    %rax
4f73     4f73:	fb                   	sti
4f74     4f74:	9c                   	pushf
4f75     4f75:	58                   	pop    %rax
4f76     4f76:	fb                   	sti
4f77     4f77:	9c                   	pushf
4f78     4f78:	58                   	pop    %rax
4f79     4f79:	fa                   	cli
4f7a     4f7a:	9c                   	pushf
4f7b     4f7b:	58                   	pop    %rax
4f7c     4f7c:	fb                   	sti
4f7d     4f7d:	9c                   	pushf
4f7e     4f7e:	58                   	pop    %rax
4f7f     4f7f:	fb                   	sti
4f80     4f80:	9c                   	pushf
4f81     4f81:	58                   	pop    %rax
4f82     4f82:	fa                   	cli
4f83     4f83:	9c                   	pushf
4f84     4f84:	58                   	pop    %rax
4f85     4f85:	fa                   	cli
4f86     4f86:	9c                   	pushf
4f87     4f87:	58                   	pop    %rax
4f88     4f88:	fb                   	sti
4f89     4f89:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4f8e     4f8e:	0f 0d 0b             	prefetchw (%rbx)
4f91     4f91:	9c                   	pushf
4f92     4f92:	58                   	pop    %rax
4f93     4f93:	fb                   	sti
4f94     4f94:	9c                   	pushf
4f95     4f95:	58                   	pop    %rax
4f96     4f96:	fb                   	sti
4f97     4f97:	9c                   	pushf
4f98     4f98:	58                   	pop    %rax
4f99     4f99:	fa                   	cli
4f9a     4f9a:	9c                   	pushf
4f9b     4f9b:	58                   	pop    %rax
4f9c     4f9c:	fb                   	sti
4f9d     4f9d:	9c                   	pushf
4f9e     4f9e:	58                   	pop    %rax
4f9f     4f9f:	fb                   	sti
4fa0     4fa0:	9c                   	pushf
4fa1     4fa1:	58                   	pop    %rax
4fa2     4fa2:	fa                   	cli
4fa3     4fa3:	9c                   	pushf
4fa4     4fa4:	58                   	pop    %rax
4fa5     4fa5:	fb                   	sti
4fa6     4fa6:	9c                   	pushf
4fa7     4fa7:	58                   	pop    %rax
4fa8     4fa8:	fa                   	cli
4fa9     4fa9:	9c                   	pushf
4faa     4faa:	58                   	pop    %rax
4fab     4fab:	fb                   	sti
4fac     4fac:	9c                   	pushf
4fad     4fad:	58                   	pop    %rax
4fae     4fae:	fb                   	sti
4faf     4faf:	9c                   	pushf
4fb0     4fb0:	58                   	pop    %rax
4fb1     4fb1:	fa                   	cli
4fb2     4fb2:	9c                   	pushf
4fb3     4fb3:	58                   	pop    %rax
4fb4     4fb4:	fb                   	sti
4fb5     4fb5:	9c                   	pushf
4fb6     4fb6:	58                   	pop    %rax
4fb7     4fb7:	fb                   	sti
4fb8     4fb8:	9c                   	pushf
4fb9     4fb9:	58                   	pop    %rax
4fba     4fba:	fa                   	cli
4fbb     4fbb:	9c                   	pushf
4fbc     4fbc:	58                   	pop    %rax
4fbd     4fbd:	fb                   	sti
4fbe     4fbe:	9c                   	pushf
4fbf     4fbf:	58                   	pop    %rax
4fc0     4fc0:	fb                   	sti
4fc1     4fc1:	9c                   	pushf
4fc2     4fc2:	58                   	pop    %rax
4fc3     4fc3:	fa                   	cli
4fc4     4fc4:	9c                   	pushf
4fc5     4fc5:	58                   	pop    %rax
4fc6     4fc6:	fb                   	sti
4fc7     4fc7:	9c                   	pushf
4fc8     4fc8:	58                   	pop    %rax
4fc9     4fc9:	fb                   	sti
4fca     4fca:	9c                   	pushf
4fcb     4fcb:	58                   	pop    %rax
4fcc     4fcc:	fa                   	cli
4fcd     4fcd:	9c                   	pushf
4fce     4fce:	58                   	pop    %rax
4fcf     4fcf:	fa                   	cli
4fd0     4fd0:	9c                   	pushf
4fd1     4fd1:	58                   	pop    %rax
4fd2     4fd2:	fb                   	sti
4fd3     4fd3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
4fd8     4fd8:	41 0f 0d 0c c4       	prefetchw (%r12,%rax,8)
4fdd     4fdd:	f3 0f b8 c7          	popcnt %edi,%eax
4fe1     4fe1:	f3 0f b8 c7          	popcnt %edi,%eax
4fe5     4fe5:	9c                   	pushf
4fe6     4fe6:	58                   	pop    %rax
4fe7     4fe7:	fb                   	sti
4fe8     4fe8:	9c                   	pushf
4fe9     4fe9:	58                   	pop    %rax
4fea     4fea:	fb                   	sti
4feb     4feb:	9c                   	pushf
4fec     4fec:	58                   	pop    %rax
4fed     4fed:	fa                   	cli
4fee     4fee:	9c                   	pushf
4fef     4fef:	58                   	pop    %rax
4ff0     4ff0:	fb                   	sti
4ff1     4ff1:	9c                   	pushf
4ff2     4ff2:	58                   	pop    %rax
4ff3     4ff3:	fb                   	sti
4ff4     4ff4:	9c                   	pushf
4ff5     4ff5:	58                   	pop    %rax
4ff6     4ff6:	fa                   	cli
4ff7     4ff7:	9c                   	pushf
4ff8     4ff8:	58                   	pop    %rax
4ff9     4ff9:	fb                   	sti
4ffa     4ffa:	9c                   	pushf
4ffb     4ffb:	58                   	pop    %rax
4ffc     4ffc:	fb                   	sti
4ffd     4ffd:	9c                   	pushf
4ffe     4ffe:	58                   	pop    %rax
4fff     4fff:	fa                   	cli
5000     5000:	9c                   	pushf
5001     5001:	58                   	pop    %rax
5002     5002:	fb                   	sti
5003     5003:	9c                   	pushf
5004     5004:	58                   	pop    %rax
5005     5005:	fb                   	sti
5006     5006:	9c                   	pushf
5007     5007:	58                   	pop    %rax
5008     5008:	fa                   	cli
5009     5009:	f3 0f b8 c7          	popcnt %edi,%eax
500d     500d:	41 0f 0d 0c c4       	prefetchw (%r12,%rax,8)
5012     5012:	f3 0f b8 c7          	popcnt %edi,%eax
5016     5016:	f3 0f b8 c7          	popcnt %edi,%eax
501a     501a:	9c                   	pushf
501b     501b:	58                   	pop    %rax
501c     501c:	fa                   	cli
501d     501d:	9c                   	pushf
501e     501e:	58                   	pop    %rax
501f     501f:	fb                   	sti
5020     5020:	9c                   	pushf
5021     5021:	58                   	pop    %rax
5022     5022:	fa                   	cli
5023     5023:	9c                   	pushf
5024     5024:	58                   	pop    %rax
5025     5025:	fb                   	sti
5026     5026:	9c                   	pushf
5027     5027:	58                   	pop    %rax
5028     5028:	fa                   	cli
5029     5029:	9c                   	pushf
502a     502a:	58                   	pop    %rax
502b     502b:	fb                   	sti
502c     502c:	9c                   	pushf
502d     502d:	58                   	pop    %rax
502e     502e:	fa                   	cli
502f     502f:	9c                   	pushf
5030     5030:	58                   	pop    %rax
5031     5031:	fb                   	sti
5032     5032:	9c                   	pushf
5033     5033:	58                   	pop    %rax
5034     5034:	fa                   	cli
5035     5035:	9c                   	pushf
5036     5036:	58                   	pop    %rax
5037     5037:	fb                   	sti
5038     5038:	9c                   	pushf
5039     5039:	58                   	pop    %rax
503a     503a:	fa                   	cli
503b     503b:	9c                   	pushf
503c     503c:	58                   	pop    %rax
503d     503d:	fb                   	sti
503e     503e:	9c                   	pushf
503f     503f:	58                   	pop    %rax
5040     5040:	fa                   	cli
5041     5041:	9c                   	pushf
5042     5042:	58                   	pop    %rax
5043     5043:	fb                   	sti
5044     5044:	9c                   	pushf
5045     5045:	58                   	pop    %rax
5046     5046:	fa                   	cli
5047     5047:	9c                   	pushf
5048     5048:	58                   	pop    %rax
5049     5049:	fb                   	sti
504a     504a:	0f 0d 08             	prefetchw (%rax)
504d     504d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5052     5052:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5057     5057:	9c                   	pushf
5058     5058:	58                   	pop    %rax
5059     5059:	fa                   	cli
505a     505a:	9c                   	pushf
505b     505b:	58                   	pop    %rax
505c     505c:	fa                   	cli
505d     505d:	9c                   	pushf
505e     505e:	58                   	pop    %rax
505f     505f:	fb                   	sti
5060     5060:	0f 0d 08             	prefetchw (%rax)
5063     5063:	0f 0d 08             	prefetchw (%rax)
5066     5066:	0f 0d 08             	prefetchw (%rax)
5069     5069:	fb                   	sti
506a     506a:	9c                   	pushf
506b     506b:	58                   	pop    %rax
506c     506c:	fa                   	cli
506d     506d:	fb                   	sti
506e     506e:	fb                   	sti
506f     506f:	9c                   	pushf
5070     5070:	58                   	pop    %rax
5071     5071:	fa                   	cli
5072     5072:	fb                   	sti
5073     5073:	9c                   	pushf
5074     5074:	58                   	pop    %rax
5075     5075:	fa                   	cli
5076     5076:	fb                   	sti
5077     5077:	f3 48 0f b8 c7       	popcnt %rdi,%rax
507c     507c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5081     5081:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5086     5086:	f3 48 0f b8 c7       	popcnt %rdi,%rax
508b     508b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5090     5090:	f3 0f b8 c7          	popcnt %edi,%eax
5094     5094:	f3 0f b8 c7          	popcnt %edi,%eax
5098     5098:	f3 0f b8 c7          	popcnt %edi,%eax
509c     509c:	f3 0f b8 c7          	popcnt %edi,%eax
50a0     50a0:	f3 0f b8 c7          	popcnt %edi,%eax
50a4     50a4:	f3 0f b8 c7          	popcnt %edi,%eax
50a8     50a8:	f3 0f b8 c7          	popcnt %edi,%eax
50ac     50ac:	9c                   	pushf
50ad     50ad:	58                   	pop    %rax
50ae     50ae:	fa                   	cli
50af     50af:	9c                   	pushf
50b0     50b0:	58                   	pop    %rax
50b1     50b1:	fb                   	sti
50b2     50b2:	9c                   	pushf
50b3     50b3:	58                   	pop    %rax
50b4     50b4:	fa                   	cli
50b5     50b5:	9c                   	pushf
50b6     50b6:	58                   	pop    %rax
50b7     50b7:	fb                   	sti
50b8     50b8:	f3 0f b8 c7          	popcnt %edi,%eax
50bc     50bc:	f3 0f b8 c7          	popcnt %edi,%eax
50c0     50c0:	f3 0f b8 c7          	popcnt %edi,%eax
50c4     50c4:	f3 0f b8 c7          	popcnt %edi,%eax
50c8     50c8:	f3 0f b8 c7          	popcnt %edi,%eax
50cc     50cc:	f3 0f b8 c7          	popcnt %edi,%eax
50d0     50d0:	f3 0f b8 c7          	popcnt %edi,%eax
50d4     50d4:	f3 0f b8 c7          	popcnt %edi,%eax
50d8     50d8:	9c                   	pushf
50d9     50d9:	58                   	pop    %rax
50da     50da:	fa                   	cli
50db     50db:	9c                   	pushf
50dc     50dc:	58                   	pop    %rax
50dd     50dd:	fb                   	sti
50de     50de:	f3 0f b8 c7          	popcnt %edi,%eax
50e2     50e2:	f3 0f b8 c7          	popcnt %edi,%eax
50e6     50e6:	f3 0f b8 c7          	popcnt %edi,%eax
50ea     50ea:	f3 0f b8 c7          	popcnt %edi,%eax
50ee     50ee:	f3 0f b8 c7          	popcnt %edi,%eax
50f2     50f2:	f3 0f b8 c7          	popcnt %edi,%eax
50f6     50f6:	f3 0f b8 c7          	popcnt %edi,%eax
50fa     50fa:	f3 0f b8 c7          	popcnt %edi,%eax
50fe     50fe:	f3 0f b8 c7          	popcnt %edi,%eax
5102     5102:	9c                   	pushf
5103     5103:	58                   	pop    %rax
5104     5104:	fb                   	sti
5105     5105:	9c                   	pushf
5106     5106:	58                   	pop    %rax
5107     5107:	fb                   	sti
5108     5108:	9c                   	pushf
5109     5109:	58                   	pop    %rax
510a     510a:	fa                   	cli
510b     510b:	9c                   	pushf
510c     510c:	58                   	pop    %rax
510d     510d:	fa                   	cli
510e     510e:	9c                   	pushf
510f     510f:	58                   	pop    %rax
5110     5110:	fb                   	sti
5111     5111:	f3 0f b8 c7          	popcnt %edi,%eax
5115     5115:	f3 0f b8 c7          	popcnt %edi,%eax
5119     5119:	f3 0f b8 c7          	popcnt %edi,%eax
511d     511d:	f3 0f b8 c7          	popcnt %edi,%eax
5121     5121:	f3 0f b8 c7          	popcnt %edi,%eax
5125     5125:	f3 0f b8 c7          	popcnt %edi,%eax
5129     5129:	f3 0f b8 c7          	popcnt %edi,%eax
512d     512d:	f3 0f b8 c7          	popcnt %edi,%eax
5131     5131:	f3 0f b8 c7          	popcnt %edi,%eax
5135     5135:	f3 0f b8 c7          	popcnt %edi,%eax
5139     5139:	f3 0f b8 c7          	popcnt %edi,%eax
513d     513d:	f3 0f b8 c7          	popcnt %edi,%eax
5141     5141:	f3 0f b8 c7          	popcnt %edi,%eax
5145     5145:	9c                   	pushf
5146     5146:	58                   	pop    %rax
5147     5147:	9c                   	pushf
5148     5148:	58                   	pop    %rax
5149     5149:	9c                   	pushf
514a     514a:	58                   	pop    %rax
514b     514b:	fa                   	cli
514c     514c:	9c                   	pushf
514d     514d:	58                   	pop    %rax
514e     514e:	fb                   	sti
514f     514f:	9c                   	pushf
5150     5150:	58                   	pop    %rax
5151     5151:	fa                   	cli
5152     5152:	9c                   	pushf
5153     5153:	58                   	pop    %rax
5154     5154:	fb                   	sti
5155     5155:	9c                   	pushf
5156     5156:	58                   	pop    %rax
5157     5157:	f3 0f b8 c7          	popcnt %edi,%eax
515b     515b:	f3 0f b8 c7          	popcnt %edi,%eax
515f     515f:	f3 0f b8 c7          	popcnt %edi,%eax
5163     5163:	f3 0f b8 c7          	popcnt %edi,%eax
5167     5167:	f3 0f b8 c7          	popcnt %edi,%eax
516b     516b:	f3 0f b8 c7          	popcnt %edi,%eax
516f     516f:	f3 0f b8 c7          	popcnt %edi,%eax
5173     5173:	f3 0f b8 c7          	popcnt %edi,%eax
5177     5177:	f3 0f b8 c7          	popcnt %edi,%eax
517b     517b:	f3 0f b8 c7          	popcnt %edi,%eax
517f     517f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5184     5184:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5189     5189:	f3 0f b8 c7          	popcnt %edi,%eax
518d     518d:	f3 0f b8 c7          	popcnt %edi,%eax
5191     5191:	f3 0f b8 c7          	popcnt %edi,%eax
5195     5195:	f3 0f b8 c7          	popcnt %edi,%eax
5199     5199:	f3 0f b8 c7          	popcnt %edi,%eax
519d     519d:	f3 0f b8 c7          	popcnt %edi,%eax
51a1     51a1:	f3 0f b8 c7          	popcnt %edi,%eax
51a5     51a5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
51aa     51aa:	f3 0f b8 c7          	popcnt %edi,%eax
51ae     51ae:	f3 0f b8 c7          	popcnt %edi,%eax
51b2     51b2:	f3 0f b8 c7          	popcnt %edi,%eax
51b6     51b6:	f3 0f b8 c7          	popcnt %edi,%eax
51ba     51ba:	f3 0f b8 c7          	popcnt %edi,%eax
51be     51be:	f3 0f b8 c7          	popcnt %edi,%eax
51c2     51c2:	f3 0f b8 c7          	popcnt %edi,%eax
51c6     51c6:	f3 0f b8 c7          	popcnt %edi,%eax
51ca     51ca:	f3 0f b8 c7          	popcnt %edi,%eax
51ce     51ce:	f3 0f b8 c7          	popcnt %edi,%eax
51d2     51d2:	f3 0f b8 c7          	popcnt %edi,%eax
51d6     51d6:	f3 0f b8 c7          	popcnt %edi,%eax
51da     51da:	f3 0f b8 c7          	popcnt %edi,%eax
51de     51de:	f3 0f b8 c7          	popcnt %edi,%eax
51e2     51e2:	f3 0f b8 c7          	popcnt %edi,%eax
51e6     51e6:	f3 0f b8 c7          	popcnt %edi,%eax
51ea     51ea:	f3 0f b8 c7          	popcnt %edi,%eax
51ee     51ee:	f3 0f b8 c7          	popcnt %edi,%eax
51f2     51f2:	f3 0f b8 c7          	popcnt %edi,%eax
51f6     51f6:	f3 0f b8 c7          	popcnt %edi,%eax
51fa     51fa:	f3 0f b8 c7          	popcnt %edi,%eax
51fe     51fe:	f3 0f b8 c7          	popcnt %edi,%eax
5202     5202:	f3 0f b8 c7          	popcnt %edi,%eax
5206     5206:	f3 0f b8 c7          	popcnt %edi,%eax
520a     520a:	f3 0f b8 c7          	popcnt %edi,%eax
520e     520e:	f3 0f b8 c7          	popcnt %edi,%eax
5212     5212:	f3 0f b8 c7          	popcnt %edi,%eax
5216     5216:	f3 0f b8 c7          	popcnt %edi,%eax
521a     521a:	f3 0f b8 c7          	popcnt %edi,%eax
521e     521e:	f3 0f b8 c7          	popcnt %edi,%eax
5222     5222:	f3 0f b8 c7          	popcnt %edi,%eax
5226     5226:	f3 0f b8 c7          	popcnt %edi,%eax
522a     522a:	f3 0f b8 c7          	popcnt %edi,%eax
522e     522e:	f3 0f b8 c7          	popcnt %edi,%eax
5232     5232:	f3 0f b8 c7          	popcnt %edi,%eax
5236     5236:	f3 0f b8 c7          	popcnt %edi,%eax
523a     523a:	f3 0f b8 c7          	popcnt %edi,%eax
523e     523e:	f3 0f b8 c7          	popcnt %edi,%eax
5242     5242:	f3 0f b8 c7          	popcnt %edi,%eax
5246     5246:	f3 0f b8 c7          	popcnt %edi,%eax
524a     524a:	f3 0f b8 c7          	popcnt %edi,%eax
524e     524e:	f3 0f b8 c7          	popcnt %edi,%eax
5252     5252:	f3 0f b8 c7          	popcnt %edi,%eax
5256     5256:	f3 0f b8 c7          	popcnt %edi,%eax
525a     525a:	f3 0f b8 c7          	popcnt %edi,%eax
525e     525e:	f3 0f b8 c7          	popcnt %edi,%eax
5262     5262:	f3 0f b8 c7          	popcnt %edi,%eax
5266     5266:	f3 0f b8 c7          	popcnt %edi,%eax
526a     526a:	f3 0f b8 c7          	popcnt %edi,%eax
526e     526e:	f3 0f b8 c7          	popcnt %edi,%eax
5272     5272:	f3 0f b8 c7          	popcnt %edi,%eax
5276     5276:	f3 0f b8 c7          	popcnt %edi,%eax
527a     527a:	f3 0f b8 c7          	popcnt %edi,%eax
527e     527e:	f3 0f b8 c7          	popcnt %edi,%eax
5282     5282:	f3 0f b8 c7          	popcnt %edi,%eax
5286     5286:	f3 0f b8 c7          	popcnt %edi,%eax
528a     528a:	f3 0f b8 c7          	popcnt %edi,%eax
528e     528e:	f3 0f b8 c7          	popcnt %edi,%eax
5292     5292:	f3 0f b8 c7          	popcnt %edi,%eax
5296     5296:	f3 0f b8 c7          	popcnt %edi,%eax
529a     529a:	f3 0f b8 c7          	popcnt %edi,%eax
529e     529e:	f3 0f b8 c7          	popcnt %edi,%eax
52a2     52a2:	f3 0f b8 c7          	popcnt %edi,%eax
52a6     52a6:	f3 0f b8 c7          	popcnt %edi,%eax
52aa     52aa:	f3 0f b8 c7          	popcnt %edi,%eax
52ae     52ae:	f3 0f b8 c7          	popcnt %edi,%eax
52b2     52b2:	f3 0f b8 c7          	popcnt %edi,%eax
52b6     52b6:	f3 0f b8 c7          	popcnt %edi,%eax
52ba     52ba:	f3 0f b8 c7          	popcnt %edi,%eax
52be     52be:	f3 0f b8 c7          	popcnt %edi,%eax
52c2     52c2:	f3 0f b8 c7          	popcnt %edi,%eax
52c6     52c6:	f3 0f b8 c7          	popcnt %edi,%eax
52ca     52ca:	f3 0f b8 c7          	popcnt %edi,%eax
52ce     52ce:	f3 0f b8 c7          	popcnt %edi,%eax
52d2     52d2:	f3 0f b8 c7          	popcnt %edi,%eax
52d6     52d6:	f3 0f b8 c7          	popcnt %edi,%eax
52da     52da:	f3 0f b8 c7          	popcnt %edi,%eax
52de     52de:	f3 0f b8 c7          	popcnt %edi,%eax
52e2     52e2:	f3 0f b8 c7          	popcnt %edi,%eax
52e6     52e6:	f3 0f b8 c7          	popcnt %edi,%eax
52ea     52ea:	f3 0f b8 c7          	popcnt %edi,%eax
52ee     52ee:	f3 0f b8 c7          	popcnt %edi,%eax
52f2     52f2:	f3 0f b8 c7          	popcnt %edi,%eax
52f6     52f6:	f3 0f b8 c7          	popcnt %edi,%eax
52fa     52fa:	9c                   	pushf
52fb     52fb:	58                   	pop    %rax
52fc     52fc:	9c                   	pushf
52fd     52fd:	58                   	pop    %rax
52fe     52fe:	9c                   	pushf
52ff     52ff:	58                   	pop    %rax
5300     5300:	fb                   	sti
5301     5301:	9c                   	pushf
5302     5302:	58                   	pop    %rax
5303     5303:	fb                   	sti
5304     5304:	9c                   	pushf
5305     5305:	58                   	pop    %rax
5306     5306:	fb                   	sti
5307     5307:	9c                   	pushf
5308     5308:	58                   	pop    %rax
5309     5309:	fa                   	cli
530a     530a:	9c                   	pushf
530b     530b:	58                   	pop    %rax
530c     530c:	fb                   	sti
530d     530d:	9c                   	pushf
530e     530e:	58                   	pop    %rax
530f     530f:	fb                   	sti
5310     5310:	9c                   	pushf
5311     5311:	58                   	pop    %rax
5312     5312:	fb                   	sti
5313     5313:	9c                   	pushf
5314     5314:	58                   	pop    %rax
5315     5315:	fb                   	sti
5316     5316:	9c                   	pushf
5317     5317:	58                   	pop    %rax
5318     5318:	fb                   	sti
5319     5319:	9c                   	pushf
531a     531a:	58                   	pop    %rax
531b     531b:	fb                   	sti
531c     531c:	9c                   	pushf
531d     531d:	58                   	pop    %rax
531e     531e:	fb                   	sti
531f     531f:	9c                   	pushf
5320     5320:	58                   	pop    %rax
5321     5321:	fb                   	sti
5322     5322:	9c                   	pushf
5323     5323:	58                   	pop    %rax
5324     5324:	fb                   	sti
5325     5325:	f3 0f b8 c7          	popcnt %edi,%eax
5329     5329:	f3 0f b8 c7          	popcnt %edi,%eax
532d     532d:	f3 0f b8 c7          	popcnt %edi,%eax
5331     5331:	f3 0f b8 c7          	popcnt %edi,%eax
5335     5335:	f3 0f b8 c7          	popcnt %edi,%eax
5339     5339:	f3 48 0f b8 c7       	popcnt %rdi,%rax
533e     533e:	f3 0f b8 c7          	popcnt %edi,%eax
5342     5342:	f3 0f b8 c7          	popcnt %edi,%eax
5346     5346:	9c                   	pushf
5347     5347:	58                   	pop    %rax
5348     5348:	fa                   	cli
5349     5349:	9c                   	pushf
534a     534a:	58                   	pop    %rax
534b     534b:	fb                   	sti
534c     534c:	9c                   	pushf
534d     534d:	58                   	pop    %rax
534e     534e:	fa                   	cli
534f     534f:	9c                   	pushf
5350     5350:	58                   	pop    %rax
5351     5351:	fb                   	sti
5352     5352:	9c                   	pushf
5353     5353:	58                   	pop    %rax
5354     5354:	9c                   	pushf
5355     5355:	58                   	pop    %rax
5356     5356:	9c                   	pushf
5357     5357:	58                   	pop    %rax
5358     5358:	9c                   	pushf
5359     5359:	58                   	pop    %rax
535a     535a:	fb                   	sti
535b     535b:	9c                   	pushf
535c     535c:	58                   	pop    %rax
535d     535d:	fb                   	sti
535e     535e:	9c                   	pushf
535f     535f:	58                   	pop    %rax
5360     5360:	fa                   	cli
5361     5361:	f3 0f b8 c7          	popcnt %edi,%eax
5365     5365:	9c                   	pushf
5366     5366:	58                   	pop    %rax
5367     5367:	fa                   	cli
5368     5368:	9c                   	pushf
5369     5369:	58                   	pop    %rax
536a     536a:	fb                   	sti
536b     536b:	9c                   	pushf
536c     536c:	58                   	pop    %rax
536d     536d:	fa                   	cli
536e     536e:	9c                   	pushf
536f     536f:	58                   	pop    %rax
5370     5370:	fb                   	sti
5371     5371:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5376     5376:	9c                   	pushf
5377     5377:	58                   	pop    %rax
5378     5378:	fa                   	cli
5379     5379:	9c                   	pushf
537a     537a:	58                   	pop    %rax
537b     537b:	fb                   	sti
537c     537c:	9c                   	pushf
537d     537d:	58                   	pop    %rax
537e     537e:	9c                   	pushf
537f     537f:	58                   	pop    %rax
5380     5380:	9c                   	pushf
5381     5381:	58                   	pop    %rax
5382     5382:	fa                   	cli
5383     5383:	fb                   	sti
5384     5384:	9c                   	pushf
5385     5385:	58                   	pop    %rax
5386     5386:	fb                   	sti
5387     5387:	9c                   	pushf
5388     5388:	58                   	pop    %rax
5389     5389:	fb                   	sti
538a     538a:	9c                   	pushf
538b     538b:	58                   	pop    %rax
538c     538c:	fa                   	cli
538d     538d:	9c                   	pushf
538e     538e:	58                   	pop    %rax
538f     538f:	fa                   	cli
5390     5390:	9c                   	pushf
5391     5391:	58                   	pop    %rax
5392     5392:	fb                   	sti
5393     5393:	9c                   	pushf
5394     5394:	58                   	pop    %rax
5395     5395:	fa                   	cli
5396     5396:	9c                   	pushf
5397     5397:	58                   	pop    %rax
5398     5398:	fb                   	sti
5399     5399:	9c                   	pushf
539a     539a:	58                   	pop    %rax
539b     539b:	fa                   	cli
539c     539c:	fb                   	sti
539d     539d:	f3 0f b8 c7          	popcnt %edi,%eax
53a1     53a1:	f3 0f b8 c7          	popcnt %edi,%eax
53a5     53a5:	48 89 f8             	mov    %rdi,%rax
53a8     53a8:	e9 00 00 00 00       	jmp    53ad <.altinstr_replacement+0x53ad>	53a9: R_X86_64_PC32	.text+0xae9c2ed
53ad     53ad:	e9 00 00 00 00       	jmp    53b2 <.altinstr_replacement+0x53b2>	53ae: R_X86_64_PC32	.text+0xae9c1cc
53b2     53b2:	e9 00 00 00 00       	jmp    53b7 <.altinstr_replacement+0x53b7>	53b3: R_X86_64_PC32	.text+0xaea430e
53b7     53b7:	e9 00 00 00 00       	jmp    53bc <.altinstr_replacement+0x53bc>	53b8: R_X86_64_PC32	.text+0xaea4318
53bc     53bc:	f3 0f b8 c7          	popcnt %edi,%eax
53c0     53c0:	0f ae e8             	lfence
53c3     53c3:	9c                   	pushf
53c4     53c4:	58                   	pop    %rax
53c5     53c5:	fa                   	cli
53c6     53c6:	fb                   	sti
53c7     53c7:	9c                   	pushf
53c8     53c8:	58                   	pop    %rax
53c9     53c9:	fa                   	cli
53ca     53ca:	fb                   	sti
53cb     53cb:	9c                   	pushf
53cc     53cc:	58                   	pop    %rax
53cd     53cd:	fa                   	cli
53ce     53ce:	9c                   	pushf
53cf     53cf:	58                   	pop    %rax
53d0     53d0:	fb                   	sti
53d1     53d1:	9c                   	pushf
53d2     53d2:	58                   	pop    %rax
53d3     53d3:	fa                   	cli
53d4     53d4:	9c                   	pushf
53d5     53d5:	58                   	pop    %rax
53d6     53d6:	fb                   	sti
53d7     53d7:	9c                   	pushf
53d8     53d8:	58                   	pop    %rax
53d9     53d9:	fa                   	cli
53da     53da:	9c                   	pushf
53db     53db:	58                   	pop    %rax
53dc     53dc:	fb                   	sti
53dd     53dd:	41 0f 0d 0c 24       	prefetchw (%r12)
53e2     53e2:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
53e6     53e6:	9c                   	pushf
53e7     53e7:	58                   	pop    %rax
53e8     53e8:	fa                   	cli
53e9     53e9:	9c                   	pushf
53ea     53ea:	58                   	pop    %rax
53eb     53eb:	fb                   	sti
53ec     53ec:	f3 0f b8 c7          	popcnt %edi,%eax
53f0     53f0:	f3 0f b8 c7          	popcnt %edi,%eax
53f4     53f4:	f3 0f b8 c7          	popcnt %edi,%eax
53f8     53f8:	f3 0f b8 c7          	popcnt %edi,%eax
53fc     53fc:	41 0f 0d 0f          	prefetchw (%r15)
5400     5400:	9c                   	pushf
5401     5401:	58                   	pop    %rax
5402     5402:	fa                   	cli
5403     5403:	9c                   	pushf
5404     5404:	58                   	pop    %rax
5405     5405:	fb                   	sti
5406     5406:	9c                   	pushf
5407     5407:	58                   	pop    %rax
5408     5408:	fa                   	cli
5409     5409:	9c                   	pushf
540a     540a:	58                   	pop    %rax
540b     540b:	fb                   	sti
540c     540c:	9c                   	pushf
540d     540d:	58                   	pop    %rax
540e     540e:	fa                   	cli
540f     540f:	9c                   	pushf
5410     5410:	58                   	pop    %rax
5411     5411:	fb                   	sti
5412     5412:	9c                   	pushf
5413     5413:	58                   	pop    %rax
5414     5414:	fa                   	cli
5415     5415:	9c                   	pushf
5416     5416:	58                   	pop    %rax
5417     5417:	fb                   	sti
5418     5418:	41 0f 0d 0f          	prefetchw (%r15)
541c     541c:	0f 0d 08             	prefetchw (%rax)
541f     541f:	9c                   	pushf
5420     5420:	58                   	pop    %rax
5421     5421:	fa                   	cli
5422     5422:	9c                   	pushf
5423     5423:	58                   	pop    %rax
5424     5424:	fb                   	sti
5425     5425:	0f 0d 0b             	prefetchw (%rbx)
5428     5428:	9c                   	pushf
5429     5429:	58                   	pop    %rax
542a     542a:	fa                   	cli
542b     542b:	9c                   	pushf
542c     542c:	58                   	pop    %rax
542d     542d:	fb                   	sti
542e     542e:	41 0f 0d 0e          	prefetchw (%r14)
5432     5432:	0f 0d 0e             	prefetchw (%rsi)
5435     5435:	41 0f 0d 4d 00       	prefetchw 0x0(%r13)
543a     543a:	41 0f 0d 0c 24       	prefetchw (%r12)
543f     543f:	9c                   	pushf
5440     5440:	58                   	pop    %rax
5441     5441:	fa                   	cli
5442     5442:	fb                   	sti
5443     5443:	9c                   	pushf
5444     5444:	58                   	pop    %rax
5445     5445:	fa                   	cli
5446     5446:	fb                   	sti
5447     5447:	f3 0f b8 c7          	popcnt %edi,%eax
544b     544b:	f3 0f b8 c7          	popcnt %edi,%eax
544f     544f:	f3 0f b8 c7          	popcnt %edi,%eax
5453     5453:	9c                   	pushf
5454     5454:	58                   	pop    %rax
5455     5455:	fa                   	cli
5456     5456:	9c                   	pushf
5457     5457:	58                   	pop    %rax
5458     5458:	fb                   	sti
5459     5459:	9c                   	pushf
545a     545a:	58                   	pop    %rax
545b     545b:	fa                   	cli
545c     545c:	9c                   	pushf
545d     545d:	58                   	pop    %rax
545e     545e:	fb                   	sti
545f     545f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5464     5464:	0f 01 cb             	stac
5467     5467:	e8 00 00 00 00       	call   546c <.altinstr_replacement+0x546c>	5468: R_X86_64_PLT32	rep_stos_alternative-0x4
546c     546c:	0f 01 ca             	clac
546f     546f:	f3 0f b8 c7          	popcnt %edi,%eax
5473     5473:	f3 0f b8 c7          	popcnt %edi,%eax
5477     5477:	f3 0f b8 c7          	popcnt %edi,%eax
547b     547b:	f3 0f b8 c7          	popcnt %edi,%eax
547f     547f:	0f 01 c1             	vmcall
5482     5482:	0f 01 d9             	vmmcall
5485     5485:	0f 01 c1             	vmcall
5488     5488:	0f 01 d9             	vmmcall
548b     548b:	0f 01 c1             	vmcall
548e     548e:	0f 01 d9             	vmmcall
5491     5491:	0f 01 c1             	vmcall
5494     5494:	0f 01 d9             	vmmcall
5497     5497:	0f 01 c1             	vmcall
549a     549a:	0f 01 d9             	vmmcall
549d     549d:	0f 01 c1             	vmcall
54a0     54a0:	0f 01 d9             	vmmcall
54a3     54a3:	0f 01 c1             	vmcall
54a6     54a6:	0f 01 d9             	vmmcall
54a9     54a9:	0f 01 c1             	vmcall
54ac     54ac:	0f 01 d9             	vmmcall
54af     54af:	0f 01 c1             	vmcall
54b2     54b2:	0f 01 d9             	vmmcall
54b5     54b5:	0f 01 c1             	vmcall
54b8     54b8:	0f 01 d9             	vmmcall
54bb     54bb:	9c                   	pushf
54bc     54bc:	58                   	pop    %rax
54bd     54bd:	fa                   	cli
54be     54be:	9c                   	pushf
54bf     54bf:	58                   	pop    %rax
54c0     54c0:	fb                   	sti
54c1     54c1:	9c                   	pushf
54c2     54c2:	58                   	pop    %rax
54c3     54c3:	fa                   	cli
54c4     54c4:	9c                   	pushf
54c5     54c5:	58                   	pop    %rax
54c6     54c6:	fb                   	sti
54c7     54c7:	9c                   	pushf
54c8     54c8:	58                   	pop    %rax
54c9     54c9:	fa                   	cli
54ca     54ca:	9c                   	pushf
54cb     54cb:	58                   	pop    %rax
54cc     54cc:	9c                   	pushf
54cd     54cd:	58                   	pop    %rax
54ce     54ce:	fa                   	cli
54cf     54cf:	9c                   	pushf
54d0     54d0:	58                   	pop    %rax
54d1     54d1:	fb                   	sti
54d2     54d2:	fb                   	sti
54d3     54d3:	9c                   	pushf
54d4     54d4:	58                   	pop    %rax
54d5     54d5:	fa                   	cli
54d6     54d6:	9c                   	pushf
54d7     54d7:	58                   	pop    %rax
54d8     54d8:	fb                   	sti
54d9     54d9:	f3 0f b8 c7          	popcnt %edi,%eax
54dd     54dd:	f3 0f b8 c7          	popcnt %edi,%eax
54e1     54e1:	f3 0f b8 c7          	popcnt %edi,%eax
54e5     54e5:	f3 0f b8 c7          	popcnt %edi,%eax
54e9     54e9:	9c                   	pushf
54ea     54ea:	58                   	pop    %rax
54eb     54eb:	fa                   	cli
54ec     54ec:	9c                   	pushf
54ed     54ed:	58                   	pop    %rax
54ee     54ee:	fb                   	sti
54ef     54ef:	9c                   	pushf
54f0     54f0:	58                   	pop    %rax
54f1     54f1:	fa                   	cli
54f2     54f2:	9c                   	pushf
54f3     54f3:	58                   	pop    %rax
54f4     54f4:	fb                   	sti
54f5     54f5:	9c                   	pushf
54f6     54f6:	58                   	pop    %rax
54f7     54f7:	fa                   	cli
54f8     54f8:	9c                   	pushf
54f9     54f9:	58                   	pop    %rax
54fa     54fa:	fb                   	sti
54fb     54fb:	9c                   	pushf
54fc     54fc:	58                   	pop    %rax
54fd     54fd:	fa                   	cli
54fe     54fe:	9c                   	pushf
54ff     54ff:	58                   	pop    %rax
5500     5500:	fb                   	sti
5501     5501:	9c                   	pushf
5502     5502:	58                   	pop    %rax
5503     5503:	fa                   	cli
5504     5504:	9c                   	pushf
5505     5505:	58                   	pop    %rax
5506     5506:	fb                   	sti
5507     5507:	9c                   	pushf
5508     5508:	58                   	pop    %rax
5509     5509:	fa                   	cli
550a     550a:	9c                   	pushf
550b     550b:	58                   	pop    %rax
550c     550c:	fb                   	sti
550d     550d:	9c                   	pushf
550e     550e:	58                   	pop    %rax
550f     550f:	fa                   	cli
5510     5510:	9c                   	pushf
5511     5511:	58                   	pop    %rax
5512     5512:	fb                   	sti
5513     5513:	9c                   	pushf
5514     5514:	58                   	pop    %rax
5515     5515:	fa                   	cli
5516     5516:	9c                   	pushf
5517     5517:	58                   	pop    %rax
5518     5518:	fb                   	sti
5519     5519:	9c                   	pushf
551a     551a:	58                   	pop    %rax
551b     551b:	fa                   	cli
551c     551c:	9c                   	pushf
551d     551d:	58                   	pop    %rax
551e     551e:	fb                   	sti
551f     551f:	9c                   	pushf
5520     5520:	58                   	pop    %rax
5521     5521:	fa                   	cli
5522     5522:	9c                   	pushf
5523     5523:	58                   	pop    %rax
5524     5524:	fb                   	sti
5525     5525:	9c                   	pushf
5526     5526:	58                   	pop    %rax
5527     5527:	fa                   	cli
5528     5528:	9c                   	pushf
5529     5529:	58                   	pop    %rax
552a     552a:	fb                   	sti
552b     552b:	9c                   	pushf
552c     552c:	58                   	pop    %rax
552d     552d:	fa                   	cli
552e     552e:	9c                   	pushf
552f     552f:	58                   	pop    %rax
5530     5530:	fb                   	sti
5531     5531:	9c                   	pushf
5532     5532:	58                   	pop    %rax
5533     5533:	fa                   	cli
5534     5534:	9c                   	pushf
5535     5535:	58                   	pop    %rax
5536     5536:	fb                   	sti
5537     5537:	9c                   	pushf
5538     5538:	58                   	pop    %rax
5539     5539:	fa                   	cli
553a     553a:	9c                   	pushf
553b     553b:	58                   	pop    %rax
553c     553c:	fb                   	sti
553d     553d:	9c                   	pushf
553e     553e:	58                   	pop    %rax
553f     553f:	fa                   	cli
5540     5540:	9c                   	pushf
5541     5541:	58                   	pop    %rax
5542     5542:	fb                   	sti
5543     5543:	f3 0f b8 c7          	popcnt %edi,%eax
5547     5547:	f3 0f b8 c7          	popcnt %edi,%eax
554b     554b:	f3 0f b8 c7          	popcnt %edi,%eax
554f     554f:	f3 0f b8 c7          	popcnt %edi,%eax
5553     5553:	f3 0f b8 c7          	popcnt %edi,%eax
5557     5557:	9c                   	pushf
5558     5558:	58                   	pop    %rax
5559     5559:	fa                   	cli
555a     555a:	fb                   	sti
555b     555b:	9c                   	pushf
555c     555c:	58                   	pop    %rax
555d     555d:	fa                   	cli
555e     555e:	9c                   	pushf
555f     555f:	58                   	pop    %rax
5560     5560:	fb                   	sti
5561     5561:	9c                   	pushf
5562     5562:	58                   	pop    %rax
5563     5563:	fa                   	cli
5564     5564:	9c                   	pushf
5565     5565:	58                   	pop    %rax
5566     5566:	fb                   	sti
5567     5567:	9c                   	pushf
5568     5568:	58                   	pop    %rax
5569     5569:	fa                   	cli
556a     556a:	fb                   	sti
556b     556b:	9c                   	pushf
556c     556c:	58                   	pop    %rax
556d     556d:	fa                   	cli
556e     556e:	fb                   	sti
556f     556f:	9c                   	pushf
5570     5570:	58                   	pop    %rax
5571     5571:	fa                   	cli
5572     5572:	fb                   	sti
5573     5573:	9c                   	pushf
5574     5574:	58                   	pop    %rax
5575     5575:	fa                   	cli
5576     5576:	fb                   	sti
5577     5577:	9c                   	pushf
5578     5578:	58                   	pop    %rax
5579     5579:	fa                   	cli
557a     557a:	fb                   	sti
557b     557b:	9c                   	pushf
557c     557c:	58                   	pop    %rax
557d     557d:	9c                   	pushf
557e     557e:	58                   	pop    %rax
557f     557f:	9c                   	pushf
5580     5580:	58                   	pop    %rax
5581     5581:	9c                   	pushf
5582     5582:	58                   	pop    %rax
5583     5583:	9c                   	pushf
5584     5584:	58                   	pop    %rax
5585     5585:	fa                   	cli
5586     5586:	9c                   	pushf
5587     5587:	58                   	pop    %rax
5588     5588:	fb                   	sti
5589     5589:	f3 0f b8 c7          	popcnt %edi,%eax
558d     558d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5592     5592:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5597     5597:	f3 0f b8 c7          	popcnt %edi,%eax
559b     559b:	e8 00 00 00 00       	call   55a0 <.altinstr_replacement+0x55a0>	559c: R_X86_64_PLT32	clear_page_rep-0x4
55a0     55a0:	e8 00 00 00 00       	call   55a5 <.altinstr_replacement+0x55a5>	55a1: R_X86_64_PLT32	clear_page_erms-0x4
55a5     55a5:	9c                   	pushf
55a6     55a6:	58                   	pop    %rax
55a7     55a7:	fa                   	cli
55a8     55a8:	9c                   	pushf
55a9     55a9:	58                   	pop    %rax
55aa     55aa:	fa                   	cli
55ab     55ab:	9c                   	pushf
55ac     55ac:	58                   	pop    %rax
55ad     55ad:	fa                   	cli
55ae     55ae:	9c                   	pushf
55af     55af:	58                   	pop    %rax
55b0     55b0:	fb                   	sti
55b1     55b1:	9c                   	pushf
55b2     55b2:	58                   	pop    %rax
55b3     55b3:	fa                   	cli
55b4     55b4:	9c                   	pushf
55b5     55b5:	58                   	pop    %rax
55b6     55b6:	fb                   	sti
55b7     55b7:	65 48 23 3c 25 00 00 00 00 	and    %gs:0x0,%rdi	55bc: R_X86_64_32S	tlbstate_untag_mask
55c0     55c0:	e9 00 00 00 00       	jmp    55c5 <.altinstr_replacement+0x55c5>	55c1: R_X86_64_PC32	.text+0xc078d38
55c5     55c5:	e9 00 00 00 00       	jmp    55ca <.altinstr_replacement+0x55ca>	55c6: R_X86_64_PC32	.text+0xc078d43
55ca     55ca:	f3 0f b8 c7          	popcnt %edi,%eax
55ce     55ce:	f3 0f b8 c7          	popcnt %edi,%eax
55d2     55d2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
55d7     55d7:	f3 0f b8 c7          	popcnt %edi,%eax
55db     55db:	f3 0f b8 c7          	popcnt %edi,%eax
55df     55df:	f3 0f b8 c7          	popcnt %edi,%eax
55e3     55e3:	f3 0f b8 c7          	popcnt %edi,%eax
55e7     55e7:	9c                   	pushf
55e8     55e8:	58                   	pop    %rax
55e9     55e9:	fa                   	cli
55ea     55ea:	9c                   	pushf
55eb     55eb:	58                   	pop    %rax
55ec     55ec:	fb                   	sti
55ed     55ed:	9c                   	pushf
55ee     55ee:	58                   	pop    %rax
55ef     55ef:	fb                   	sti
55f0     55f0:	f3 0f b8 c7          	popcnt %edi,%eax
55f4     55f4:	f3 0f b8 c7          	popcnt %edi,%eax
55f8     55f8:	f3 0f b8 c7          	popcnt %edi,%eax
55fc     55fc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5601     5601:	0f 01 cb             	stac
5604     5604:	e8 00 00 00 00       	call   5609 <.altinstr_replacement+0x5609>	5605: R_X86_64_PLT32	rep_stos_alternative-0x4
5609     5609:	0f 01 ca             	clac
560c     560c:	9c                   	pushf
560d     560d:	58                   	pop    %rax
560e     560e:	fa                   	cli
560f     560f:	9c                   	pushf
5610     5610:	58                   	pop    %rax
5611     5611:	fb                   	sti
5612     5612:	9c                   	pushf
5613     5613:	58                   	pop    %rax
5614     5614:	9c                   	pushf
5615     5615:	58                   	pop    %rax
5616     5616:	9c                   	pushf
5617     5617:	58                   	pop    %rax
5618     5618:	9c                   	pushf
5619     5619:	58                   	pop    %rax
561a     561a:	9c                   	pushf
561b     561b:	58                   	pop    %rax
561c     561c:	9c                   	pushf
561d     561d:	58                   	pop    %rax
561e     561e:	9c                   	pushf
561f     561f:	58                   	pop    %rax
5620     5620:	9c                   	pushf
5621     5621:	58                   	pop    %rax
5622     5622:	9c                   	pushf
5623     5623:	58                   	pop    %rax
5624     5624:	9c                   	pushf
5625     5625:	58                   	pop    %rax
5626     5626:	9c                   	pushf
5627     5627:	58                   	pop    %rax
5628     5628:	fa                   	cli
5629     5629:	9c                   	pushf
562a     562a:	58                   	pop    %rax
562b     562b:	fb                   	sti
562c     562c:	9c                   	pushf
562d     562d:	58                   	pop    %rax
562e     562e:	fb                   	sti
562f     562f:	9c                   	pushf
5630     5630:	58                   	pop    %rax
5631     5631:	fb                   	sti
5632     5632:	e9 00 00 00 00       	jmp    5637 <.altinstr_replacement+0x5637>	5633: R_X86_64_PC32	.text+0xca5f15f
5637     5637:	0f 01 d9             	vmmcall
563a     563a:	e9 00 00 00 00       	jmp    563f <.altinstr_replacement+0x563f>	563b: R_X86_64_PC32	.text+0xca5f412
563f     563f:	0f 01 d9             	vmmcall
5642     5642:	e9 00 00 00 00       	jmp    5647 <.altinstr_replacement+0x5647>	5643: R_X86_64_PC32	.text+0xca5f6f7
5647     5647:	0f 01 d9             	vmmcall
564a     564a:	0f 01 c1             	vmcall
564d     564d:	0f 01 d9             	vmmcall
5650     5650:	f3 0f b8 c7          	popcnt %edi,%eax
5654     5654:	9c                   	pushf
5655     5655:	58                   	pop    %rax
5656     5656:	fa                   	cli
5657     5657:	9c                   	pushf
5658     5658:	58                   	pop    %rax
5659     5659:	fb                   	sti
565a     565a:	9c                   	pushf
565b     565b:	58                   	pop    %rax
565c     565c:	fa                   	cli
565d     565d:	9c                   	pushf
565e     565e:	58                   	pop    %rax
565f     565f:	fb                   	sti
5660     5660:	9c                   	pushf
5661     5661:	58                   	pop    %rax
5662     5662:	fa                   	cli
5663     5663:	9c                   	pushf
5664     5664:	58                   	pop    %rax
5665     5665:	fb                   	sti
5666     5666:	f3 0f b8 c7          	popcnt %edi,%eax
566a     566a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
566f     566f:	9c                   	pushf
5670     5670:	58                   	pop    %rax
5671     5671:	fa                   	cli
5672     5672:	9c                   	pushf
5673     5673:	58                   	pop    %rax
5674     5674:	fb                   	sti
5675     5675:	f3 0f b8 c7          	popcnt %edi,%eax
5679     5679:	f3 0f b8 c7          	popcnt %edi,%eax
567d     567d:	f3 0f b8 c7          	popcnt %edi,%eax
5681     5681:	f3 0f b8 c7          	popcnt %edi,%eax
5685     5685:	f3 0f b8 c7          	popcnt %edi,%eax
5689     5689:	f3 0f b8 c7          	popcnt %edi,%eax
568d     568d:	f3 0f b8 c7          	popcnt %edi,%eax
5691     5691:	f3 0f b8 c7          	popcnt %edi,%eax
5695     5695:	e9 00 00 00 00       	jmp    569a <.altinstr_replacement+0x569a>	5696: R_X86_64_PC32	.text+0xcdcc9f1
569a     569a:	f3 0f b8 c7          	popcnt %edi,%eax
569e     569e:	9c                   	pushf
569f     569f:	58                   	pop    %rax
56a0     56a0:	fa                   	cli
56a1     56a1:	fb                   	sti
56a2     56a2:	fb                   	sti
56a3     56a3:	9c                   	pushf
56a4     56a4:	58                   	pop    %rax
56a5     56a5:	fa                   	cli
56a6     56a6:	fb                   	sti
56a7     56a7:	fb                   	sti
56a8     56a8:	9c                   	pushf
56a9     56a9:	58                   	pop    %rax
56aa     56aa:	fa                   	cli
56ab     56ab:	fb                   	sti
56ac     56ac:	fb                   	sti
56ad     56ad:	9c                   	pushf
56ae     56ae:	58                   	pop    %rax
56af     56af:	fa                   	cli
56b0     56b0:	9c                   	pushf
56b1     56b1:	58                   	pop    %rax
56b2     56b2:	fb                   	sti
56b3     56b3:	9c                   	pushf
56b4     56b4:	58                   	pop    %rax
56b5     56b5:	fa                   	cli
56b6     56b6:	9c                   	pushf
56b7     56b7:	58                   	pop    %rax
56b8     56b8:	fb                   	sti
56b9     56b9:	e8 00 00 00 00       	call   56be <.altinstr_replacement+0x56be>	56ba: R_X86_64_PLT32	clear_page_rep-0x4
56be     56be:	e8 00 00 00 00       	call   56c3 <.altinstr_replacement+0x56c3>	56bf: R_X86_64_PLT32	clear_page_erms-0x4
56c3     56c3:	e8 00 00 00 00       	call   56c8 <.altinstr_replacement+0x56c8>	56c4: R_X86_64_PLT32	clear_page_rep-0x4
56c8     56c8:	e8 00 00 00 00       	call   56cd <.altinstr_replacement+0x56cd>	56c9: R_X86_64_PLT32	clear_page_erms-0x4
56cd     56cd:	e8 00 00 00 00       	call   56d2 <.altinstr_replacement+0x56d2>	56ce: R_X86_64_PLT32	clear_page_rep-0x4
56d2     56d2:	e8 00 00 00 00       	call   56d7 <.altinstr_replacement+0x56d7>	56d3: R_X86_64_PLT32	clear_page_erms-0x4
56d7     56d7:	e8 00 00 00 00       	call   56dc <.altinstr_replacement+0x56dc>	56d8: R_X86_64_PLT32	clear_page_rep-0x4
56dc     56dc:	e8 00 00 00 00       	call   56e1 <.altinstr_replacement+0x56e1>	56dd: R_X86_64_PLT32	clear_page_erms-0x4
56e1     56e1:	9c                   	pushf
56e2     56e2:	58                   	pop    %rax
56e3     56e3:	fa                   	cli
56e4     56e4:	9c                   	pushf
56e5     56e5:	58                   	pop    %rax
56e6     56e6:	fb                   	sti
56e7     56e7:	f3 0f b8 c7          	popcnt %edi,%eax
56eb     56eb:	9c                   	pushf
56ec     56ec:	58                   	pop    %rax
56ed     56ed:	fa                   	cli
56ee     56ee:	9c                   	pushf
56ef     56ef:	58                   	pop    %rax
56f0     56f0:	fb                   	sti
56f1     56f1:	0f 01 cb             	stac
56f4     56f4:	e8 00 00 00 00       	call   56f9 <.altinstr_replacement+0x56f9>	56f5: R_X86_64_PLT32	rep_stos_alternative-0x4
56f9     56f9:	0f 01 ca             	clac
56fc     56fc:	0f 01 cb             	stac
56ff     56ff:	e8 00 00 00 00       	call   5704 <.altinstr_replacement+0x5704>	5700: R_X86_64_PLT32	rep_stos_alternative-0x4
5704     5704:	0f 01 ca             	clac
5707     5707:	e9 00 00 00 00       	jmp    570c <.altinstr_replacement+0x570c>	5708: R_X86_64_PC32	.text+0xcfc5ebc
570c     570c:	9c                   	pushf
570d     570d:	58                   	pop    %rax
570e     570e:	fa                   	cli
570f     570f:	fb                   	sti
5710     5710:	9c                   	pushf
5711     5711:	58                   	pop    %rax
5712     5712:	fa                   	cli
5713     5713:	fb                   	sti
5714     5714:	9c                   	pushf
5715     5715:	58                   	pop    %rax
5716     5716:	fa                   	cli
5717     5717:	fb                   	sti
5718     5718:	e9 00 00 00 00       	jmp    571d <.altinstr_replacement+0x571d>	5719: R_X86_64_PC32	.init.text+0x4f1435
571d     571d:	e9 00 00 00 00       	jmp    5722 <.altinstr_replacement+0x5722>	571e: R_X86_64_PC32	.init.text+0x4f1448
5722     5722:	9c                   	pushf
5723     5723:	58                   	pop    %rax
5724     5724:	f3 0f b8 c7          	popcnt %edi,%eax
5728     5728:	f3 0f b8 c7          	popcnt %edi,%eax
572c     572c:	f3 0f b8 c7          	popcnt %edi,%eax
5730     5730:	e8 00 00 00 00       	call   5735 <.altinstr_replacement+0x5735>	5731: R_X86_64_PLT32	clear_page_rep-0x4
5735     5735:	e8 00 00 00 00       	call   573a <.altinstr_replacement+0x573a>	5736: R_X86_64_PLT32	clear_page_erms-0x4
573a     573a:	e8 00 00 00 00       	call   573f <.altinstr_replacement+0x573f>	573b: R_X86_64_PLT32	clear_page_rep-0x4
573f     573f:	e8 00 00 00 00       	call   5744 <.altinstr_replacement+0x5744>	5740: R_X86_64_PLT32	clear_page_erms-0x4
5744     5744:	e9 00 00 00 00       	jmp    5749 <.altinstr_replacement+0x5749>	5745: R_X86_64_PC32	.text+0xd0d554e
5749     5749:	66 0f ae 3b          	clflushopt (%rbx)
574d     574d:	9c                   	pushf
574e     574e:	58                   	pop    %rax
574f     574f:	fa                   	cli
5750     5750:	9c                   	pushf
5751     5751:	58                   	pop    %rax
5752     5752:	fb                   	sti
5753     5753:	9c                   	pushf
5754     5754:	58                   	pop    %rax
5755     5755:	fa                   	cli
5756     5756:	9c                   	pushf
5757     5757:	58                   	pop    %rax
5758     5758:	fb                   	sti
5759     5759:	9c                   	pushf
575a     575a:	58                   	pop    %rax
575b     575b:	fa                   	cli
575c     575c:	9c                   	pushf
575d     575d:	58                   	pop    %rax
575e     575e:	fb                   	sti
575f     575f:	9c                   	pushf
5760     5760:	58                   	pop    %rax
5761     5761:	fa                   	cli
5762     5762:	9c                   	pushf
5763     5763:	58                   	pop    %rax
5764     5764:	fb                   	sti
5765     5765:	e9 00 00 00 00       	jmp    576a <.altinstr_replacement+0x576a>	5766: R_X86_64_PC32	.text+0xd232078
576a     576a:	e9 00 00 00 00       	jmp    576f <.altinstr_replacement+0x576f>	576b: R_X86_64_PC32	.text+0xd231e44
576f     576f:	9c                   	pushf
5770     5770:	58                   	pop    %rax
5771     5771:	fa                   	cli
5772     5772:	9c                   	pushf
5773     5773:	58                   	pop    %rax
5774     5774:	fb                   	sti
5775     5775:	e9 00 00 00 00       	jmp    577a <.altinstr_replacement+0x577a>	5776: R_X86_64_PC32	.init.text+0x4fa139
577a     577a:	e9 00 00 00 00       	jmp    577f <.altinstr_replacement+0x577f>	577b: R_X86_64_PC32	.init.text+0x4fb05d
577f     577f:	e9 00 00 00 00       	jmp    5784 <.altinstr_replacement+0x5784>	5780: R_X86_64_PC32	.init.text+0x4fb39a
5784     5784:	f3 0f b8 c7          	popcnt %edi,%eax
5788     5788:	f3 48 0f b8 c7       	popcnt %rdi,%rax
578d     578d:	0f 09                	wbinvd
578f     578f:	f3 0f b8 c7          	popcnt %edi,%eax
5793     5793:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5798     5798:	f3 0f b8 c7          	popcnt %edi,%eax
579c     579c:	f3 0f b8 c7          	popcnt %edi,%eax
57a0     57a0:	e9 00 00 00 00       	jmp    57a5 <.altinstr_replacement+0x57a5>	57a1: R_X86_64_PC32	.init.text+0x4fdffc
57a5     57a5:	e9 00 00 00 00       	jmp    57aa <.altinstr_replacement+0x57aa>	57a6: R_X86_64_PC32	.init.text+0x4feb5f
57aa     57aa:	9c                   	pushf
57ab     57ab:	58                   	pop    %rax
57ac     57ac:	9c                   	pushf
57ad     57ad:	58                   	pop    %rax
57ae     57ae:	fa                   	cli
57af     57af:	9c                   	pushf
57b0     57b0:	58                   	pop    %rax
57b1     57b1:	9c                   	pushf
57b2     57b2:	58                   	pop    %rax
57b3     57b3:	fb                   	sti
57b4     57b4:	fb                   	sti
57b5     57b5:	9c                   	pushf
57b6     57b6:	58                   	pop    %rax
57b7     57b7:	fa                   	cli
57b8     57b8:	9c                   	pushf
57b9     57b9:	58                   	pop    %rax
57ba     57ba:	fb                   	sti
57bb     57bb:	9c                   	pushf
57bc     57bc:	58                   	pop    %rax
57bd     57bd:	fa                   	cli
57be     57be:	9c                   	pushf
57bf     57bf:	58                   	pop    %rax
57c0     57c0:	fb                   	sti
57c1     57c1:	9c                   	pushf
57c2     57c2:	58                   	pop    %rax
57c3     57c3:	fb                   	sti
57c4     57c4:	9c                   	pushf
57c5     57c5:	58                   	pop    %rax
57c6     57c6:	fa                   	cli
57c7     57c7:	fb                   	sti
57c8     57c8:	9c                   	pushf
57c9     57c9:	58                   	pop    %rax
57ca     57ca:	fb                   	sti
57cb     57cb:	fa                   	cli
57cc     57cc:	fb                   	sti
57cd     57cd:	fa                   	cli
57ce     57ce:	fb                   	sti
57cf     57cf:	f3 0f b8 c7          	popcnt %edi,%eax
57d3     57d3:	e8 00 00 00 00       	call   57d8 <.altinstr_replacement+0x57d8>	57d4: R_X86_64_PLT32	clear_page_rep-0x4
57d8     57d8:	e8 00 00 00 00       	call   57dd <.altinstr_replacement+0x57dd>	57d9: R_X86_64_PLT32	clear_page_erms-0x4
57dd     57dd:	9c                   	pushf
57de     57de:	58                   	pop    %rax
57df     57df:	fa                   	cli
57e0     57e0:	9c                   	pushf
57e1     57e1:	58                   	pop    %rax
57e2     57e2:	fb                   	sti
57e3     57e3:	9c                   	pushf
57e4     57e4:	58                   	pop    %rax
57e5     57e5:	fa                   	cli
57e6     57e6:	9c                   	pushf
57e7     57e7:	58                   	pop    %rax
57e8     57e8:	fb                   	sti
57e9     57e9:	9c                   	pushf
57ea     57ea:	58                   	pop    %rax
57eb     57eb:	fa                   	cli
57ec     57ec:	9c                   	pushf
57ed     57ed:	58                   	pop    %rax
57ee     57ee:	fb                   	sti
57ef     57ef:	9c                   	pushf
57f0     57f0:	58                   	pop    %rax
57f1     57f1:	fa                   	cli
57f2     57f2:	9c                   	pushf
57f3     57f3:	58                   	pop    %rax
57f4     57f4:	fb                   	sti
57f5     57f5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
57fa     57fa:	9c                   	pushf
57fb     57fb:	58                   	pop    %rax
57fc     57fc:	fa                   	cli
57fd     57fd:	9c                   	pushf
57fe     57fe:	58                   	pop    %rax
57ff     57ff:	fb                   	sti
5800     5800:	0f 01 cb             	stac
5803     5803:	e8 00 00 00 00       	call   5808 <.altinstr_replacement+0x5808>	5804: R_X86_64_PLT32	rep_stos_alternative-0x4
5808     5808:	0f 01 ca             	clac
580b     580b:	0f 01 cb             	stac
580e     580e:	e8 00 00 00 00       	call   5813 <.altinstr_replacement+0x5813>	580f: R_X86_64_PLT32	rep_stos_alternative-0x4
5813     5813:	0f 01 ca             	clac
5816     5816:	0f 01 cb             	stac
5819     5819:	e8 00 00 00 00       	call   581e <.altinstr_replacement+0x581e>	581a: R_X86_64_PLT32	rep_stos_alternative-0x4
581e     581e:	0f 01 ca             	clac
5821     5821:	e8 00 00 00 00       	call   5826 <.altinstr_replacement+0x5826>	5822: R_X86_64_PLT32	clear_page_rep-0x4
5826     5826:	e8 00 00 00 00       	call   582b <.altinstr_replacement+0x582b>	5827: R_X86_64_PLT32	clear_page_erms-0x4
582b     582b:	e8 00 00 00 00       	call   5830 <.altinstr_replacement+0x5830>	582c: R_X86_64_PLT32	clear_page_rep-0x4
5830     5830:	e8 00 00 00 00       	call   5835 <.altinstr_replacement+0x5835>	5831: R_X86_64_PLT32	clear_page_erms-0x4
5835     5835:	65 4c 23 3c 25 00 00 00 00 	and    %gs:0x0,%r15	583a: R_X86_64_32S	tlbstate_untag_mask
583e     583e:	9c                   	pushf
583f     583f:	58                   	pop    %rax
5840     5840:	fa                   	cli
5841     5841:	9c                   	pushf
5842     5842:	58                   	pop    %rax
5843     5843:	fb                   	sti
5844     5844:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
584e     584e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5853     5853:	9c                   	pushf
5854     5854:	58                   	pop    %rax
5855     5855:	fa                   	cli
5856     5856:	9c                   	pushf
5857     5857:	58                   	pop    %rax
5858     5858:	fb                   	sti
5859     5859:	9c                   	pushf
585a     585a:	58                   	pop    %rax
585b     585b:	fa                   	cli
585c     585c:	9c                   	pushf
585d     585d:	58                   	pop    %rax
585e     585e:	fb                   	sti
585f     585f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5864     5864:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5869     5869:	f3 48 0f b8 c7       	popcnt %rdi,%rax
586e     586e:	f3 0f b8 c7          	popcnt %edi,%eax
5872     5872:	f3 0f b8 c7          	popcnt %edi,%eax
5876     5876:	f3 48 0f b8 c7       	popcnt %rdi,%rax
587b     587b:	9c                   	pushf
587c     587c:	58                   	pop    %rax
587d     587d:	fa                   	cli
587e     587e:	9c                   	pushf
587f     587f:	58                   	pop    %rax
5880     5880:	fb                   	sti
5881     5881:	9c                   	pushf
5882     5882:	58                   	pop    %rax
5883     5883:	fa                   	cli
5884     5884:	9c                   	pushf
5885     5885:	58                   	pop    %rax
5886     5886:	fb                   	sti
5887     5887:	9c                   	pushf
5888     5888:	58                   	pop    %rax
5889     5889:	fa                   	cli
588a     588a:	9c                   	pushf
588b     588b:	58                   	pop    %rax
588c     588c:	fb                   	sti
588d     588d:	9c                   	pushf
588e     588e:	58                   	pop    %rax
588f     588f:	fa                   	cli
5890     5890:	9c                   	pushf
5891     5891:	58                   	pop    %rax
5892     5892:	fb                   	sti
5893     5893:	9c                   	pushf
5894     5894:	58                   	pop    %rax
5895     5895:	fb                   	sti
5896     5896:	9c                   	pushf
5897     5897:	58                   	pop    %rax
5898     5898:	fb                   	sti
5899     5899:	9c                   	pushf
589a     589a:	58                   	pop    %rax
589b     589b:	fa                   	cli
589c     589c:	9c                   	pushf
589d     589d:	58                   	pop    %rax
589e     589e:	fa                   	cli
589f     589f:	9c                   	pushf
58a0     58a0:	58                   	pop    %rax
58a1     58a1:	fb                   	sti
58a2     58a2:	9c                   	pushf
58a3     58a3:	58                   	pop    %rax
58a4     58a4:	fa                   	cli
58a5     58a5:	9c                   	pushf
58a6     58a6:	58                   	pop    %rax
58a7     58a7:	fb                   	sti
58a8     58a8:	9c                   	pushf
58a9     58a9:	58                   	pop    %rax
58aa     58aa:	fa                   	cli
58ab     58ab:	9c                   	pushf
58ac     58ac:	58                   	pop    %rax
58ad     58ad:	fb                   	sti
58ae     58ae:	9c                   	pushf
58af     58af:	58                   	pop    %rax
58b0     58b0:	fa                   	cli
58b1     58b1:	9c                   	pushf
58b2     58b2:	58                   	pop    %rax
58b3     58b3:	fb                   	sti
58b4     58b4:	9c                   	pushf
58b5     58b5:	58                   	pop    %rax
58b6     58b6:	9c                   	pushf
58b7     58b7:	58                   	pop    %rax
58b8     58b8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
58bd     58bd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
58c2     58c2:	9c                   	pushf
58c3     58c3:	58                   	pop    %rax
58c4     58c4:	9c                   	pushf
58c5     58c5:	58                   	pop    %rax
58c6     58c6:	fb                   	sti
58c7     58c7:	0f 30                	wrmsr
58c9     58c9:	0f 30                	wrmsr
58cb     58cb:	0f 30                	wrmsr
58cd     58cd:	0f 30                	wrmsr
58cf     58cf:	0f 30                	wrmsr
58d1     58d1:	0f 30                	wrmsr
58d3     58d3:	0f 30                	wrmsr
58d5     58d5:	0f 30                	wrmsr
58d7     58d7:	0f 30                	wrmsr
58d9     58d9:	0f 30                	wrmsr
58db     58db:	0f 30                	wrmsr
58dd     58dd:	0f 30                	wrmsr
58df     58df:	0f 30                	wrmsr
58e1     58e1:	0f 30                	wrmsr
58e3     58e3:	0f 30                	wrmsr
58e5     58e5:	0f 30                	wrmsr
58e7     58e7:	0f 30                	wrmsr
58e9     58e9:	0f 30                	wrmsr
58eb     58eb:	0f 30                	wrmsr
58ed     58ed:	0f 30                	wrmsr
58ef     58ef:	0f 30                	wrmsr
58f1     58f1:	0f 30                	wrmsr
58f3     58f3:	0f 30                	wrmsr
58f5     58f5:	0f 30                	wrmsr
58f7     58f7:	0f 30                	wrmsr
58f9     58f9:	0f 30                	wrmsr
58fb     58fb:	0f 30                	wrmsr
58fd     58fd:	0f 30                	wrmsr
58ff     58ff:	0f 30                	wrmsr
5901     5901:	0f 30                	wrmsr
5903     5903:	0f 30                	wrmsr
5905     5905:	0f 30                	wrmsr
5907     5907:	e9 00 00 00 00       	jmp    590c <.altinstr_replacement+0x590c>	5908: R_X86_64_PC32	.text+0xdce357d
590c     590c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5911     5911:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5916     5916:	f3 48 0f b8 c7       	popcnt %rdi,%rax
591b     591b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5920     5920:	f3 0f b8 c7          	popcnt %edi,%eax
5924     5924:	f3 0f b8 c7          	popcnt %edi,%eax
5928     5928:	f3 0f b8 c7          	popcnt %edi,%eax
592c     592c:	f3 0f b8 c7          	popcnt %edi,%eax
5930     5930:	f3 0f b8 c7          	popcnt %edi,%eax
5934     5934:	f3 0f b8 c7          	popcnt %edi,%eax
5938     5938:	f3 0f b8 c7          	popcnt %edi,%eax
593c     593c:	f3 0f b8 c7          	popcnt %edi,%eax
5940     5940:	f3 0f b8 c7          	popcnt %edi,%eax
5944     5944:	9c                   	pushf
5945     5945:	58                   	pop    %rax
5946     5946:	fa                   	cli
5947     5947:	9c                   	pushf
5948     5948:	58                   	pop    %rax
5949     5949:	fb                   	sti
594a     594a:	9c                   	pushf
594b     594b:	58                   	pop    %rax
594c     594c:	f3 0f b8 c7          	popcnt %edi,%eax
5950     5950:	f3 0f b8 c7          	popcnt %edi,%eax
5954     5954:	f3 0f b8 c7          	popcnt %edi,%eax
5958     5958:	0f ae e8             	lfence
595b     595b:	0f 31                	rdtsc
595d     595d:	0f 01 f9             	rdtscp
5960     5960:	0f ae e8             	lfence
5963     5963:	0f 31                	rdtsc
5965     5965:	0f 01 f9             	rdtscp
5968     5968:	0f ae e8             	lfence
596b     596b:	0f 31                	rdtsc
596d     596d:	0f 01 f9             	rdtscp
5970     5970:	9c                   	pushf
5971     5971:	58                   	pop    %rax
5972     5972:	fa                   	cli
5973     5973:	9c                   	pushf
5974     5974:	58                   	pop    %rax
5975     5975:	fb                   	sti
5976     5976:	9c                   	pushf
5977     5977:	58                   	pop    %rax
5978     5978:	fa                   	cli
5979     5979:	9c                   	pushf
597a     597a:	58                   	pop    %rax
597b     597b:	fb                   	sti
597c     597c:	9c                   	pushf
597d     597d:	58                   	pop    %rax
597e     597e:	fa                   	cli
597f     597f:	9c                   	pushf
5980     5980:	58                   	pop    %rax
5981     5981:	fb                   	sti
5982     5982:	0f 01 cb             	stac
5985     5985:	e8 00 00 00 00       	call   598a <.altinstr_replacement+0x598a>	5986: R_X86_64_PLT32	rep_movs_alternative-0x4
598a     598a:	0f 01 ca             	clac
598d     598d:	0f 01 cb             	stac
5990     5990:	e8 00 00 00 00       	call   5995 <.altinstr_replacement+0x5995>	5991: R_X86_64_PLT32	rep_movs_alternative-0x4
5995     5995:	0f 01 ca             	clac
5998     5998:	0f 01 cb             	stac
599b     599b:	e8 00 00 00 00       	call   59a0 <.altinstr_replacement+0x59a0>	599c: R_X86_64_PLT32	rep_movs_alternative-0x4
59a0     59a0:	0f 01 ca             	clac
59a3     59a3:	0f 01 cb             	stac
59a6     59a6:	0f 01 cb             	stac
59a9     59a9:	e8 00 00 00 00       	call   59ae <.altinstr_replacement+0x59ae>	59aa: R_X86_64_PLT32	rep_movs_alternative-0x4
59ae     59ae:	0f 01 ca             	clac
59b1     59b1:	0f 01 cb             	stac
59b4     59b4:	e8 00 00 00 00       	call   59b9 <.altinstr_replacement+0x59b9>	59b5: R_X86_64_PLT32	rep_movs_alternative-0x4
59b9     59b9:	0f 01 ca             	clac
59bc     59bc:	0f 09                	wbinvd
59be     59be:	0f 09                	wbinvd
59c0     59c0:	0f 09                	wbinvd
59c2     59c2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
59c7     59c7:	f3 0f b8 c7          	popcnt %edi,%eax
59cb     59cb:	f3 0f b8 c7          	popcnt %edi,%eax
59cf     59cf:	e9 00 00 00 00       	jmp    59d4 <.altinstr_replacement+0x59d4>	59d0: R_X86_64_PC32	.init.text+0x5a23ef
59d4     59d4:	e9 00 00 00 00       	jmp    59d9 <.altinstr_replacement+0x59d9>	59d5: R_X86_64_PC32	.init.text+0x5a359c
59d9     59d9:	f3 0f b8 c7          	popcnt %edi,%eax
59dd     59dd:	9c                   	pushf
59de     59de:	58                   	pop    %rax
59df     59df:	fa                   	cli
59e0     59e0:	9c                   	pushf
59e1     59e1:	58                   	pop    %rax
59e2     59e2:	9c                   	pushf
59e3     59e3:	58                   	pop    %rax
59e4     59e4:	fa                   	cli
59e5     59e5:	fb                   	sti
59e6     59e6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
59eb     59eb:	f3 0f b8 c7          	popcnt %edi,%eax
59ef     59ef:	f3 0f b8 c7          	popcnt %edi,%eax
59f3     59f3:	f3 0f b8 c7          	popcnt %edi,%eax
59f7     59f7:	f3 0f b8 c7          	popcnt %edi,%eax
59fb     59fb:	f3 0f b8 c7          	popcnt %edi,%eax
59ff     59ff:	9c                   	pushf
5a00     5a00:	58                   	pop    %rax
5a01     5a01:	fa                   	cli
5a02     5a02:	e8 00 00 00 00       	call   5a07 <.altinstr_replacement+0x5a07>	5a03: R_X86_64_PLT32	__x86_indirect_thunk_rbx-0x4
5a07     5a07:	0f ae e8             	lfence
5a0a     5a0a:	ff d3                	call   *%rbx
5a0c     5a0c:	9c                   	pushf
5a0d     5a0d:	58                   	pop    %rax
5a0e     5a0e:	fb                   	sti
5a0f     5a0f:	e8 00 00 00 00       	call   5a14 <.altinstr_replacement+0x5a14>	5a10: R_X86_64_PLT32	__x86_indirect_thunk_rax-0x4
5a14     5a14:	0f ae e8             	lfence
5a17     5a17:	ff d0                	call   *%rax
5a19     5a19:	9c                   	pushf
5a1a     5a1a:	58                   	pop    %rax
5a1b     5a1b:	fa                   	cli
5a1c     5a1c:	9c                   	pushf
5a1d     5a1d:	58                   	pop    %rax
5a1e     5a1e:	fb                   	sti
5a1f     5a1f:	e8 00 00 00 00       	call   5a24 <.altinstr_replacement+0x5a24>	5a20: R_X86_64_PLT32	__x86_indirect_thunk_r12-0x4
5a24     5a24:	0f ae e8             	lfence
5a27     5a27:	41 ff d4             	call   *%r12
5a2a     5a2a:	9c                   	pushf
5a2b     5a2b:	58                   	pop    %rax
5a2c     5a2c:	fb                   	sti
5a2d     5a2d:	e9 00 00 00 00       	jmp    5a32 <.altinstr_replacement+0x5a32>	5a2e: R_X86_64_PC32	.text+0xe83e8ad
5a32     5a32:	e8 00 00 00 00       	call   5a37 <.altinstr_replacement+0x5a37>	5a33: R_X86_64_PLT32	__x86_indirect_thunk_r12-0x4
5a37     5a37:	0f ae e8             	lfence
5a3a     5a3a:	41 ff d4             	call   *%r12
5a3d     5a3d:	9c                   	pushf
5a3e     5a3e:	58                   	pop    %rax
5a3f     5a3f:	f3 0f b8 c7          	popcnt %edi,%eax
5a43     5a43:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5a48     5a48:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5a4d     5a4d:	9c                   	pushf
5a4e     5a4e:	58                   	pop    %rax
5a4f     5a4f:	fa                   	cli
5a50     5a50:	fb                   	sti
5a51     5a51:	9c                   	pushf
5a52     5a52:	58                   	pop    %rax
5a53     5a53:	fa                   	cli
5a54     5a54:	9c                   	pushf
5a55     5a55:	58                   	pop    %rax
5a56     5a56:	fb                   	sti
5a57     5a57:	f3 0f b8 c7          	popcnt %edi,%eax
5a5b     5a5b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5a60     5a60:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5a65     5a65:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5a6a     5a6a:	f3 0f b8 c7          	popcnt %edi,%eax
5a6e     5a6e:	f3 0f b8 c7          	popcnt %edi,%eax
5a72     5a72:	f3 0f b8 c7          	popcnt %edi,%eax
5a76     5a76:	f3 0f b8 c7          	popcnt %edi,%eax
5a7a     5a7a:	f3 0f b8 c7          	popcnt %edi,%eax
5a7e     5a7e:	f3 0f b8 c7          	popcnt %edi,%eax
5a82     5a82:	f3 0f b8 c7          	popcnt %edi,%eax
5a86     5a86:	f3 0f b8 c7          	popcnt %edi,%eax
5a8a     5a8a:	f3 0f b8 c7          	popcnt %edi,%eax
5a8e     5a8e:	f3 0f b8 c7          	popcnt %edi,%eax
5a92     5a92:	f3 0f b8 c7          	popcnt %edi,%eax
5a96     5a96:	f3 0f b8 c7          	popcnt %edi,%eax
5a9a     5a9a:	f3 0f b8 c7          	popcnt %edi,%eax
5a9e     5a9e:	f3 0f b8 c7          	popcnt %edi,%eax
5aa2     5aa2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5aa7     5aa7:	f3 0f b8 c7          	popcnt %edi,%eax
5aab     5aab:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5ab0     5ab0:	0f 01 cb             	stac
5ab3     5ab3:	0f 01 ca             	clac
5ab6     5ab6:	0f 01 cb             	stac
5ab9     5ab9:	0f 01 ca             	clac
5abc     5abc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5ac1     5ac1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5ac6     5ac6:	9c                   	pushf
5ac7     5ac7:	58                   	pop    %rax
5ac8     5ac8:	fa                   	cli
5ac9     5ac9:	9c                   	pushf
5aca     5aca:	58                   	pop    %rax
5acb     5acb:	fb                   	sti
5acc     5acc:	9c                   	pushf
5acd     5acd:	58                   	pop    %rax
5ace     5ace:	fa                   	cli
5acf     5acf:	9c                   	pushf
5ad0     5ad0:	58                   	pop    %rax
5ad1     5ad1:	fb                   	sti
5ad2     5ad2:	9c                   	pushf
5ad3     5ad3:	58                   	pop    %rax
5ad4     5ad4:	fa                   	cli
5ad5     5ad5:	9c                   	pushf
5ad6     5ad6:	58                   	pop    %rax
5ad7     5ad7:	fb                   	sti
5ad8     5ad8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5add     5add:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5ae2     5ae2:	e9 00 00 00 00       	jmp    5ae7 <.altinstr_replacement+0x5ae7>	5ae3: R_X86_64_PC32	.text+0xec1e68b
5ae7     5ae7:	e9 00 00 00 00       	jmp    5aec <.altinstr_replacement+0x5aec>	5ae8: R_X86_64_PC32	.text+0xec1e6a5
5aec     5aec:	9c                   	pushf
5aed     5aed:	58                   	pop    %rax
5aee     5aee:	fa                   	cli
5aef     5aef:	9c                   	pushf
5af0     5af0:	58                   	pop    %rax
5af1     5af1:	fb                   	sti
5af2     5af2:	9c                   	pushf
5af3     5af3:	58                   	pop    %rax
5af4     5af4:	fa                   	cli
5af5     5af5:	9c                   	pushf
5af6     5af6:	58                   	pop    %rax
5af7     5af7:	fb                   	sti
5af8     5af8:	9c                   	pushf
5af9     5af9:	58                   	pop    %rax
5afa     5afa:	fb                   	sti
5afb     5afb:	9c                   	pushf
5afc     5afc:	58                   	pop    %rax
5afd     5afd:	fa                   	cli
5afe     5afe:	9c                   	pushf
5aff     5aff:	58                   	pop    %rax
5b00     5b00:	fb                   	sti
5b01     5b01:	9c                   	pushf
5b02     5b02:	58                   	pop    %rax
5b03     5b03:	fa                   	cli
5b04     5b04:	9c                   	pushf
5b05     5b05:	58                   	pop    %rax
5b06     5b06:	fb                   	sti
5b07     5b07:	9c                   	pushf
5b08     5b08:	58                   	pop    %rax
5b09     5b09:	fa                   	cli
5b0a     5b0a:	9c                   	pushf
5b0b     5b0b:	58                   	pop    %rax
5b0c     5b0c:	fb                   	sti
5b0d     5b0d:	9c                   	pushf
5b0e     5b0e:	58                   	pop    %rax
5b0f     5b0f:	fa                   	cli
5b10     5b10:	9c                   	pushf
5b11     5b11:	58                   	pop    %rax
5b12     5b12:	fb                   	sti
5b13     5b13:	9c                   	pushf
5b14     5b14:	58                   	pop    %rax
5b15     5b15:	fa                   	cli
5b16     5b16:	9c                   	pushf
5b17     5b17:	58                   	pop    %rax
5b18     5b18:	fb                   	sti
5b19     5b19:	9c                   	pushf
5b1a     5b1a:	58                   	pop    %rax
5b1b     5b1b:	fa                   	cli
5b1c     5b1c:	9c                   	pushf
5b1d     5b1d:	58                   	pop    %rax
5b1e     5b1e:	fb                   	sti
5b1f     5b1f:	9c                   	pushf
5b20     5b20:	58                   	pop    %rax
5b21     5b21:	fa                   	cli
5b22     5b22:	9c                   	pushf
5b23     5b23:	58                   	pop    %rax
5b24     5b24:	fb                   	sti
5b25     5b25:	9c                   	pushf
5b26     5b26:	58                   	pop    %rax
5b27     5b27:	fa                   	cli
5b28     5b28:	9c                   	pushf
5b29     5b29:	58                   	pop    %rax
5b2a     5b2a:	fb                   	sti
5b2b     5b2b:	65 4c 23 3c 25 00 00 00 00 	and    %gs:0x0,%r15	5b30: R_X86_64_32S	tlbstate_untag_mask
5b34     5b34:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5b39     5b39:	f3 0f b8 c7          	popcnt %edi,%eax
5b3d     5b3d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5b42     5b42:	f3 0f b8 c7          	popcnt %edi,%eax
5b46     5b46:	f3 0f b8 c7          	popcnt %edi,%eax
5b4a     5b4a:	0f 01 cb             	stac
5b4d     5b4d:	e8 00 00 00 00       	call   5b52 <.altinstr_replacement+0x5b52>	5b4e: R_X86_64_PLT32	rep_stos_alternative-0x4
5b52     5b52:	0f 01 ca             	clac
5b55     5b55:	e9 00 00 00 00       	jmp    5b5a <.altinstr_replacement+0x5b5a>	5b56: R_X86_64_PC32	.text+0xef5024a
5b5a     5b5a:	e9 00 00 00 00       	jmp    5b5f <.altinstr_replacement+0x5b5f>	5b5b: R_X86_64_PC32	.text+0xef512e3
5b5f     5b5f:	9c                   	pushf
5b60     5b60:	58                   	pop    %rax
5b61     5b61:	fa                   	cli
5b62     5b62:	fb                   	sti
5b63     5b63:	9c                   	pushf
5b64     5b64:	58                   	pop    %rax
5b65     5b65:	9c                   	pushf
5b66     5b66:	58                   	pop    %rax
5b67     5b67:	9c                   	pushf
5b68     5b68:	58                   	pop    %rax
5b69     5b69:	9c                   	pushf
5b6a     5b6a:	58                   	pop    %rax
5b6b     5b6b:	9c                   	pushf
5b6c     5b6c:	58                   	pop    %rax
5b6d     5b6d:	9c                   	pushf
5b6e     5b6e:	58                   	pop    %rax
5b6f     5b6f:	9c                   	pushf
5b70     5b70:	58                   	pop    %rax
5b71     5b71:	9c                   	pushf
5b72     5b72:	58                   	pop    %rax
5b73     5b73:	9c                   	pushf
5b74     5b74:	58                   	pop    %rax
5b75     5b75:	9c                   	pushf
5b76     5b76:	58                   	pop    %rax
5b77     5b77:	9c                   	pushf
5b78     5b78:	58                   	pop    %rax
5b79     5b79:	fb                   	sti
5b7a     5b7a:	f3 0f b8 c7          	popcnt %edi,%eax
5b7e     5b7e:	f3 0f b8 c7          	popcnt %edi,%eax
5b82     5b82:	f3 0f b8 c7          	popcnt %edi,%eax
5b86     5b86:	f3 0f b8 c7          	popcnt %edi,%eax
5b8a     5b8a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5b8f     5b8f:	f3 0f b8 c7          	popcnt %edi,%eax
5b93     5b93:	f3 0f b8 c7          	popcnt %edi,%eax
5b97     5b97:	f3 0f b8 c7          	popcnt %edi,%eax
5b9b     5b9b:	f3 0f b8 c7          	popcnt %edi,%eax
5b9f     5b9f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5ba4     5ba4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5ba9     5ba9:	f3 0f b8 c7          	popcnt %edi,%eax
5bad     5bad:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5bb2     5bb2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5bb7     5bb7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5bbc     5bbc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5bc1     5bc1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5bc6     5bc6:	f3 0f b8 c7          	popcnt %edi,%eax
5bca     5bca:	f3 0f b8 c7          	popcnt %edi,%eax
5bce     5bce:	f3 0f b8 c7          	popcnt %edi,%eax
5bd2     5bd2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5bd7     5bd7:	f3 0f b8 c7          	popcnt %edi,%eax
5bdb     5bdb:	f3 0f b8 c7          	popcnt %edi,%eax
5bdf     5bdf:	f3 0f b8 c7          	popcnt %edi,%eax
5be3     5be3:	f3 0f b8 c7          	popcnt %edi,%eax
5be7     5be7:	f3 0f b8 c7          	popcnt %edi,%eax
5beb     5beb:	f3 0f b8 c7          	popcnt %edi,%eax
5bef     5bef:	f3 0f b8 c7          	popcnt %edi,%eax
5bf3     5bf3:	f3 0f b8 c7          	popcnt %edi,%eax
5bf7     5bf7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5bfc     5bfc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c01     5c01:	f3 0f b8 c7          	popcnt %edi,%eax
5c05     5c05:	f3 0f b8 c7          	popcnt %edi,%eax
5c09     5c09:	f3 0f b8 c7          	popcnt %edi,%eax
5c0d     5c0d:	f3 0f b8 c7          	popcnt %edi,%eax
5c11     5c11:	f3 0f b8 c7          	popcnt %edi,%eax
5c15     5c15:	f3 0f b8 c7          	popcnt %edi,%eax
5c19     5c19:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c1e     5c1e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c23     5c23:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c28     5c28:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c2d     5c2d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c32     5c32:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c37     5c37:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c3c     5c3c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c41     5c41:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c46     5c46:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c4b     5c4b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c50     5c50:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c55     5c55:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c5a     5c5a:	f3 0f b8 c7          	popcnt %edi,%eax
5c5e     5c5e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c63     5c63:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c68     5c68:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c6d     5c6d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c72     5c72:	f3 0f b8 c7          	popcnt %edi,%eax
5c76     5c76:	f3 0f b8 c7          	popcnt %edi,%eax
5c7a     5c7a:	f3 0f b8 c7          	popcnt %edi,%eax
5c7e     5c7e:	f3 0f b8 c7          	popcnt %edi,%eax
5c82     5c82:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c87     5c87:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5c8c     5c8c:	9c                   	pushf
5c8d     5c8d:	58                   	pop    %rax
5c8e     5c8e:	0f 0d 0b             	prefetchw (%rbx)
5c91     5c91:	41 0f 0d 8c 04 c0 fe ff ff 	prefetchw -0x140(%r12,%rax,1)
5c9a     5c9a:	9c                   	pushf
5c9b     5c9b:	58                   	pop    %rax
5c9c     5c9c:	0f 01 cb             	stac
5c9f     5c9f:	0f ae e8             	lfence
5ca2     5ca2:	0f 01 ca             	clac
5ca5     5ca5:	0f 01 ca             	clac
5ca8     5ca8:	9c                   	pushf
5ca9     5ca9:	58                   	pop    %rax
5caa     5caa:	fa                   	cli
5cab     5cab:	9c                   	pushf
5cac     5cac:	58                   	pop    %rax
5cad     5cad:	fb                   	sti
5cae     5cae:	9c                   	pushf
5caf     5caf:	58                   	pop    %rax
5cb0     5cb0:	fa                   	cli
5cb1     5cb1:	9c                   	pushf
5cb2     5cb2:	58                   	pop    %rax
5cb3     5cb3:	fb                   	sti
5cb4     5cb4:	9c                   	pushf
5cb5     5cb5:	58                   	pop    %rax
5cb6     5cb6:	fa                   	cli
5cb7     5cb7:	9c                   	pushf
5cb8     5cb8:	58                   	pop    %rax
5cb9     5cb9:	fb                   	sti
5cba     5cba:	9c                   	pushf
5cbb     5cbb:	58                   	pop    %rax
5cbc     5cbc:	9c                   	pushf
5cbd     5cbd:	58                   	pop    %rax
5cbe     5cbe:	fa                   	cli
5cbf     5cbf:	9c                   	pushf
5cc0     5cc0:	58                   	pop    %rax
5cc1     5cc1:	fb                   	sti
5cc2     5cc2:	fb                   	sti
5cc3     5cc3:	fb                   	sti
5cc4     5cc4:	f3 0f b8 c7          	popcnt %edi,%eax
5cc8     5cc8:	9c                   	pushf
5cc9     5cc9:	58                   	pop    %rax
5cca     5cca:	fa                   	cli
5ccb     5ccb:	fb                   	sti
5ccc     5ccc:	9c                   	pushf
5ccd     5ccd:	58                   	pop    %rax
5cce     5cce:	fa                   	cli
5ccf     5ccf:	fb                   	sti
5cd0     5cd0:	9c                   	pushf
5cd1     5cd1:	58                   	pop    %rax
5cd2     5cd2:	fa                   	cli
5cd3     5cd3:	fb                   	sti
5cd4     5cd4:	9c                   	pushf
5cd5     5cd5:	58                   	pop    %rax
5cd6     5cd6:	fa                   	cli
5cd7     5cd7:	9c                   	pushf
5cd8     5cd8:	58                   	pop    %rax
5cd9     5cd9:	fa                   	cli
5cda     5cda:	9c                   	pushf
5cdb     5cdb:	58                   	pop    %rax
5cdc     5cdc:	fb                   	sti
5cdd     5cdd:	9c                   	pushf
5cde     5cde:	58                   	pop    %rax
5cdf     5cdf:	fa                   	cli
5ce0     5ce0:	fb                   	sti
5ce1     5ce1:	9c                   	pushf
5ce2     5ce2:	58                   	pop    %rax
5ce3     5ce3:	fa                   	cli
5ce4     5ce4:	9c                   	pushf
5ce5     5ce5:	58                   	pop    %rax
5ce6     5ce6:	fa                   	cli
5ce7     5ce7:	9c                   	pushf
5ce8     5ce8:	58                   	pop    %rax
5ce9     5ce9:	9c                   	pushf
5cea     5cea:	58                   	pop    %rax
5ceb     5ceb:	fa                   	cli
5cec     5cec:	9c                   	pushf
5ced     5ced:	58                   	pop    %rax
5cee     5cee:	fb                   	sti
5cef     5cef:	f3 0f b8 c7          	popcnt %edi,%eax
5cf3     5cf3:	9c                   	pushf
5cf4     5cf4:	58                   	pop    %rax
5cf5     5cf5:	fa                   	cli
5cf6     5cf6:	9c                   	pushf
5cf7     5cf7:	58                   	pop    %rax
5cf8     5cf8:	fb                   	sti
5cf9     5cf9:	9c                   	pushf
5cfa     5cfa:	58                   	pop    %rax
5cfb     5cfb:	fb                   	sti
5cfc     5cfc:	9c                   	pushf
5cfd     5cfd:	58                   	pop    %rax
5cfe     5cfe:	fb                   	sti
5cff     5cff:	9c                   	pushf
5d00     5d00:	58                   	pop    %rax
5d01     5d01:	fa                   	cli
5d02     5d02:	41 0f 0d 0c 24       	prefetchw (%r12)
5d07     5d07:	41 0f 0d 0c 24       	prefetchw (%r12)
5d0c     5d0c:	9c                   	pushf
5d0d     5d0d:	58                   	pop    %rax
5d0e     5d0e:	fa                   	cli
5d0f     5d0f:	9c                   	pushf
5d10     5d10:	58                   	pop    %rax
5d11     5d11:	fb                   	sti
5d12     5d12:	9c                   	pushf
5d13     5d13:	58                   	pop    %rax
5d14     5d14:	fa                   	cli
5d15     5d15:	9c                   	pushf
5d16     5d16:	58                   	pop    %rax
5d17     5d17:	fb                   	sti
5d18     5d18:	9c                   	pushf
5d19     5d19:	58                   	pop    %rax
5d1a     5d1a:	fb                   	sti
5d1b     5d1b:	9c                   	pushf
5d1c     5d1c:	58                   	pop    %rax
5d1d     5d1d:	9c                   	pushf
5d1e     5d1e:	58                   	pop    %rax
5d1f     5d1f:	fa                   	cli
5d20     5d20:	9c                   	pushf
5d21     5d21:	58                   	pop    %rax
5d22     5d22:	fb                   	sti
5d23     5d23:	9c                   	pushf
5d24     5d24:	58                   	pop    %rax
5d25     5d25:	9c                   	pushf
5d26     5d26:	58                   	pop    %rax
5d27     5d27:	fa                   	cli
5d28     5d28:	0f 0d 08             	prefetchw (%rax)
5d2b     5d2b:	e9 00 00 00 00       	jmp    5d30 <.altinstr_replacement+0x5d30>	5d2c: R_X86_64_PC32	.init.text+0x612691
5d30     5d30:	9c                   	pushf
5d31     5d31:	58                   	pop    %rax
5d32     5d32:	fb                   	sti
5d33     5d33:	9c                   	pushf
5d34     5d34:	58                   	pop    %rax
5d35     5d35:	fb                   	sti
5d36     5d36:	9c                   	pushf
5d37     5d37:	58                   	pop    %rax
5d38     5d38:	fa                   	cli
5d39     5d39:	9c                   	pushf
5d3a     5d3a:	58                   	pop    %rax
5d3b     5d3b:	fa                   	cli
5d3c     5d3c:	9c                   	pushf
5d3d     5d3d:	58                   	pop    %rax
5d3e     5d3e:	fb                   	sti
5d3f     5d3f:	f3 0f b8 c7          	popcnt %edi,%eax
5d43     5d43:	9c                   	pushf
5d44     5d44:	58                   	pop    %rax
5d45     5d45:	fb                   	sti
5d46     5d46:	9c                   	pushf
5d47     5d47:	58                   	pop    %rax
5d48     5d48:	fb                   	sti
5d49     5d49:	9c                   	pushf
5d4a     5d4a:	58                   	pop    %rax
5d4b     5d4b:	fa                   	cli
5d4c     5d4c:	9c                   	pushf
5d4d     5d4d:	58                   	pop    %rax
5d4e     5d4e:	fb                   	sti
5d4f     5d4f:	9c                   	pushf
5d50     5d50:	58                   	pop    %rax
5d51     5d51:	fb                   	sti
5d52     5d52:	9c                   	pushf
5d53     5d53:	58                   	pop    %rax
5d54     5d54:	fa                   	cli
5d55     5d55:	f3 0f b8 c7          	popcnt %edi,%eax
5d59     5d59:	f3 0f b8 c7          	popcnt %edi,%eax
5d5d     5d5d:	f3 0f b8 c7          	popcnt %edi,%eax
5d61     5d61:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5d66     5d66:	9c                   	pushf
5d67     5d67:	58                   	pop    %rax
5d68     5d68:	fa                   	cli
5d69     5d69:	9c                   	pushf
5d6a     5d6a:	58                   	pop    %rax
5d6b     5d6b:	fb                   	sti
5d6c     5d6c:	9c                   	pushf
5d6d     5d6d:	58                   	pop    %rax
5d6e     5d6e:	fa                   	cli
5d6f     5d6f:	9c                   	pushf
5d70     5d70:	58                   	pop    %rax
5d71     5d71:	fb                   	sti
5d72     5d72:	e9 00 00 00 00       	jmp    5d77 <.altinstr_replacement+0x5d77>	5d73: R_X86_64_PC32	.init.text+0x61b9c8
5d77     5d77:	9c                   	pushf
5d78     5d78:	58                   	pop    %rax
5d79     5d79:	fb                   	sti
5d7a     5d7a:	9c                   	pushf
5d7b     5d7b:	58                   	pop    %rax
5d7c     5d7c:	fb                   	sti
5d7d     5d7d:	9c                   	pushf
5d7e     5d7e:	58                   	pop    %rax
5d7f     5d7f:	fa                   	cli
5d80     5d80:	9c                   	pushf
5d81     5d81:	58                   	pop    %rax
5d82     5d82:	fa                   	cli
5d83     5d83:	9c                   	pushf
5d84     5d84:	58                   	pop    %rax
5d85     5d85:	fb                   	sti
5d86     5d86:	9c                   	pushf
5d87     5d87:	58                   	pop    %rax
5d88     5d88:	fb                   	sti
5d89     5d89:	9c                   	pushf
5d8a     5d8a:	58                   	pop    %rax
5d8b     5d8b:	fb                   	sti
5d8c     5d8c:	9c                   	pushf
5d8d     5d8d:	58                   	pop    %rax
5d8e     5d8e:	fa                   	cli
5d8f     5d8f:	9c                   	pushf
5d90     5d90:	58                   	pop    %rax
5d91     5d91:	fa                   	cli
5d92     5d92:	9c                   	pushf
5d93     5d93:	58                   	pop    %rax
5d94     5d94:	fb                   	sti
5d95     5d95:	9c                   	pushf
5d96     5d96:	58                   	pop    %rax
5d97     5d97:	fb                   	sti
5d98     5d98:	9c                   	pushf
5d99     5d99:	58                   	pop    %rax
5d9a     5d9a:	fb                   	sti
5d9b     5d9b:	9c                   	pushf
5d9c     5d9c:	58                   	pop    %rax
5d9d     5d9d:	fa                   	cli
5d9e     5d9e:	0f 01 cb             	stac
5da1     5da1:	e8 00 00 00 00       	call   5da6 <.altinstr_replacement+0x5da6>	5da2: R_X86_64_PLT32	rep_stos_alternative-0x4
5da6     5da6:	0f 01 ca             	clac
5da9     5da9:	f3 0f b8 c7          	popcnt %edi,%eax
5dad     5dad:	f3 0f b8 c7          	popcnt %edi,%eax
5db1     5db1:	f3 0f b8 c7          	popcnt %edi,%eax
5db5     5db5:	9c                   	pushf
5db6     5db6:	58                   	pop    %rax
5db7     5db7:	fa                   	cli
5db8     5db8:	9c                   	pushf
5db9     5db9:	58                   	pop    %rax
5dba     5dba:	fb                   	sti
5dbb     5dbb:	9c                   	pushf
5dbc     5dbc:	58                   	pop    %rax
5dbd     5dbd:	fa                   	cli
5dbe     5dbe:	9c                   	pushf
5dbf     5dbf:	58                   	pop    %rax
5dc0     5dc0:	fb                   	sti
5dc1     5dc1:	9c                   	pushf
5dc2     5dc2:	58                   	pop    %rax
5dc3     5dc3:	fa                   	cli
5dc4     5dc4:	9c                   	pushf
5dc5     5dc5:	58                   	pop    %rax
5dc6     5dc6:	fb                   	sti
5dc7     5dc7:	0f 0d 08             	prefetchw (%rax)
5dca     5dca:	9c                   	pushf
5dcb     5dcb:	58                   	pop    %rax
5dcc     5dcc:	fa                   	cli
5dcd     5dcd:	9c                   	pushf
5dce     5dce:	58                   	pop    %rax
5dcf     5dcf:	fb                   	sti
5dd0     5dd0:	9c                   	pushf
5dd1     5dd1:	58                   	pop    %rax
5dd2     5dd2:	fa                   	cli
5dd3     5dd3:	9c                   	pushf
5dd4     5dd4:	58                   	pop    %rax
5dd5     5dd5:	fb                   	sti
5dd6     5dd6:	9c                   	pushf
5dd7     5dd7:	58                   	pop    %rax
5dd8     5dd8:	fa                   	cli
5dd9     5dd9:	9c                   	pushf
5dda     5dda:	58                   	pop    %rax
5ddb     5ddb:	fb                   	sti
5ddc     5ddc:	9c                   	pushf
5ddd     5ddd:	58                   	pop    %rax
5dde     5dde:	fa                   	cli
5ddf     5ddf:	9c                   	pushf
5de0     5de0:	58                   	pop    %rax
5de1     5de1:	fb                   	sti
5de2     5de2:	9c                   	pushf
5de3     5de3:	58                   	pop    %rax
5de4     5de4:	fb                   	sti
5de5     5de5:	9c                   	pushf
5de6     5de6:	58                   	pop    %rax
5de7     5de7:	fb                   	sti
5de8     5de8:	9c                   	pushf
5de9     5de9:	58                   	pop    %rax
5dea     5dea:	fa                   	cli
5deb     5deb:	9c                   	pushf
5dec     5dec:	58                   	pop    %rax
5ded     5ded:	fa                   	cli
5dee     5dee:	9c                   	pushf
5def     5def:	58                   	pop    %rax
5df0     5df0:	fb                   	sti
5df1     5df1:	9c                   	pushf
5df2     5df2:	58                   	pop    %rax
5df3     5df3:	fa                   	cli
5df4     5df4:	9c                   	pushf
5df5     5df5:	58                   	pop    %rax
5df6     5df6:	fb                   	sti
5df7     5df7:	9c                   	pushf
5df8     5df8:	58                   	pop    %rax
5df9     5df9:	fb                   	sti
5dfa     5dfa:	9c                   	pushf
5dfb     5dfb:	58                   	pop    %rax
5dfc     5dfc:	fb                   	sti
5dfd     5dfd:	9c                   	pushf
5dfe     5dfe:	58                   	pop    %rax
5dff     5dff:	fa                   	cli
5e00     5e00:	f3 0f b8 c7          	popcnt %edi,%eax
5e04     5e04:	9c                   	pushf
5e05     5e05:	58                   	pop    %rax
5e06     5e06:	fa                   	cli
5e07     5e07:	9c                   	pushf
5e08     5e08:	58                   	pop    %rax
5e09     5e09:	fb                   	sti
5e0a     5e0a:	f3 0f b8 c7          	popcnt %edi,%eax
5e0e     5e0e:	f3 0f b8 c7          	popcnt %edi,%eax
5e12     5e12:	f3 0f b8 c7          	popcnt %edi,%eax
5e16     5e16:	9c                   	pushf
5e17     5e17:	58                   	pop    %rax
5e18     5e18:	fa                   	cli
5e19     5e19:	9c                   	pushf
5e1a     5e1a:	58                   	pop    %rax
5e1b     5e1b:	fb                   	sti
5e1c     5e1c:	f3 0f b8 c7          	popcnt %edi,%eax
5e20     5e20:	f3 0f b8 c7          	popcnt %edi,%eax
5e24     5e24:	9c                   	pushf
5e25     5e25:	58                   	pop    %rax
5e26     5e26:	fb                   	sti
5e27     5e27:	9c                   	pushf
5e28     5e28:	58                   	pop    %rax
5e29     5e29:	fa                   	cli
5e2a     5e2a:	9c                   	pushf
5e2b     5e2b:	58                   	pop    %rax
5e2c     5e2c:	fb                   	sti
5e2d     5e2d:	9c                   	pushf
5e2e     5e2e:	58                   	pop    %rax
5e2f     5e2f:	fb                   	sti
5e30     5e30:	9c                   	pushf
5e31     5e31:	58                   	pop    %rax
5e32     5e32:	fa                   	cli
5e33     5e33:	9c                   	pushf
5e34     5e34:	58                   	pop    %rax
5e35     5e35:	fa                   	cli
5e36     5e36:	9c                   	pushf
5e37     5e37:	58                   	pop    %rax
5e38     5e38:	fb                   	sti
5e39     5e39:	9c                   	pushf
5e3a     5e3a:	58                   	pop    %rax
5e3b     5e3b:	fa                   	cli
5e3c     5e3c:	9c                   	pushf
5e3d     5e3d:	58                   	pop    %rax
5e3e     5e3e:	fb                   	sti
5e3f     5e3f:	9c                   	pushf
5e40     5e40:	58                   	pop    %rax
5e41     5e41:	fa                   	cli
5e42     5e42:	9c                   	pushf
5e43     5e43:	58                   	pop    %rax
5e44     5e44:	fb                   	sti
5e45     5e45:	9c                   	pushf
5e46     5e46:	58                   	pop    %rax
5e47     5e47:	fa                   	cli
5e48     5e48:	9c                   	pushf
5e49     5e49:	58                   	pop    %rax
5e4a     5e4a:	fb                   	sti
5e4b     5e4b:	9c                   	pushf
5e4c     5e4c:	58                   	pop    %rax
5e4d     5e4d:	fa                   	cli
5e4e     5e4e:	9c                   	pushf
5e4f     5e4f:	58                   	pop    %rax
5e50     5e50:	fb                   	sti
5e51     5e51:	9c                   	pushf
5e52     5e52:	58                   	pop    %rax
5e53     5e53:	fb                   	sti
5e54     5e54:	9c                   	pushf
5e55     5e55:	58                   	pop    %rax
5e56     5e56:	fb                   	sti
5e57     5e57:	9c                   	pushf
5e58     5e58:	58                   	pop    %rax
5e59     5e59:	fa                   	cli
5e5a     5e5a:	9c                   	pushf
5e5b     5e5b:	58                   	pop    %rax
5e5c     5e5c:	fb                   	sti
5e5d     5e5d:	9c                   	pushf
5e5e     5e5e:	58                   	pop    %rax
5e5f     5e5f:	fb                   	sti
5e60     5e60:	9c                   	pushf
5e61     5e61:	58                   	pop    %rax
5e62     5e62:	fa                   	cli
5e63     5e63:	9c                   	pushf
5e64     5e64:	58                   	pop    %rax
5e65     5e65:	fb                   	sti
5e66     5e66:	9c                   	pushf
5e67     5e67:	58                   	pop    %rax
5e68     5e68:	fb                   	sti
5e69     5e69:	9c                   	pushf
5e6a     5e6a:	58                   	pop    %rax
5e6b     5e6b:	fa                   	cli
5e6c     5e6c:	f3 0f b8 c7          	popcnt %edi,%eax
5e70     5e70:	f3 0f b8 c7          	popcnt %edi,%eax
5e74     5e74:	9c                   	pushf
5e75     5e75:	58                   	pop    %rax
5e76     5e76:	fb                   	sti
5e77     5e77:	9c                   	pushf
5e78     5e78:	58                   	pop    %rax
5e79     5e79:	fb                   	sti
5e7a     5e7a:	9c                   	pushf
5e7b     5e7b:	58                   	pop    %rax
5e7c     5e7c:	fa                   	cli
5e7d     5e7d:	f3 0f b8 c7          	popcnt %edi,%eax
5e81     5e81:	9c                   	pushf
5e82     5e82:	58                   	pop    %rax
5e83     5e83:	fa                   	cli
5e84     5e84:	9c                   	pushf
5e85     5e85:	58                   	pop    %rax
5e86     5e86:	fb                   	sti
5e87     5e87:	f3 0f b8 c7          	popcnt %edi,%eax
5e8b     5e8b:	f3 0f b8 c7          	popcnt %edi,%eax
5e8f     5e8f:	9c                   	pushf
5e90     5e90:	58                   	pop    %rax
5e91     5e91:	9c                   	pushf
5e92     5e92:	58                   	pop    %rax
5e93     5e93:	fb                   	sti
5e94     5e94:	9c                   	pushf
5e95     5e95:	58                   	pop    %rax
5e96     5e96:	fb                   	sti
5e97     5e97:	9c                   	pushf
5e98     5e98:	58                   	pop    %rax
5e99     5e99:	fa                   	cli
5e9a     5e9a:	9c                   	pushf
5e9b     5e9b:	58                   	pop    %rax
5e9c     5e9c:	9c                   	pushf
5e9d     5e9d:	58                   	pop    %rax
5e9e     5e9e:	fb                   	sti
5e9f     5e9f:	9c                   	pushf
5ea0     5ea0:	58                   	pop    %rax
5ea1     5ea1:	fa                   	cli
5ea2     5ea2:	9c                   	pushf
5ea3     5ea3:	58                   	pop    %rax
5ea4     5ea4:	fb                   	sti
5ea5     5ea5:	9c                   	pushf
5ea6     5ea6:	58                   	pop    %rax
5ea7     5ea7:	fb                   	sti
5ea8     5ea8:	9c                   	pushf
5ea9     5ea9:	58                   	pop    %rax
5eaa     5eaa:	fa                   	cli
5eab     5eab:	9c                   	pushf
5eac     5eac:	58                   	pop    %rax
5ead     5ead:	fb                   	sti
5eae     5eae:	9c                   	pushf
5eaf     5eaf:	58                   	pop    %rax
5eb0     5eb0:	fb                   	sti
5eb1     5eb1:	9c                   	pushf
5eb2     5eb2:	58                   	pop    %rax
5eb3     5eb3:	fa                   	cli
5eb4     5eb4:	9c                   	pushf
5eb5     5eb5:	58                   	pop    %rax
5eb6     5eb6:	fb                   	sti
5eb7     5eb7:	9c                   	pushf
5eb8     5eb8:	58                   	pop    %rax
5eb9     5eb9:	fb                   	sti
5eba     5eba:	9c                   	pushf
5ebb     5ebb:	58                   	pop    %rax
5ebc     5ebc:	fa                   	cli
5ebd     5ebd:	9c                   	pushf
5ebe     5ebe:	58                   	pop    %rax
5ebf     5ebf:	fa                   	cli
5ec0     5ec0:	9c                   	pushf
5ec1     5ec1:	58                   	pop    %rax
5ec2     5ec2:	fb                   	sti
5ec3     5ec3:	f3 0f b8 c7          	popcnt %edi,%eax
5ec7     5ec7:	f3 0f b8 c7          	popcnt %edi,%eax
5ecb     5ecb:	9c                   	pushf
5ecc     5ecc:	58                   	pop    %rax
5ecd     5ecd:	9c                   	pushf
5ece     5ece:	58                   	pop    %rax
5ecf     5ecf:	fa                   	cli
5ed0     5ed0:	9c                   	pushf
5ed1     5ed1:	58                   	pop    %rax
5ed2     5ed2:	fb                   	sti
5ed3     5ed3:	9c                   	pushf
5ed4     5ed4:	58                   	pop    %rax
5ed5     5ed5:	fa                   	cli
5ed6     5ed6:	9c                   	pushf
5ed7     5ed7:	58                   	pop    %rax
5ed8     5ed8:	fb                   	sti
5ed9     5ed9:	9c                   	pushf
5eda     5eda:	58                   	pop    %rax
5edb     5edb:	9c                   	pushf
5edc     5edc:	58                   	pop    %rax
5edd     5edd:	fb                   	sti
5ede     5ede:	9c                   	pushf
5edf     5edf:	58                   	pop    %rax
5ee0     5ee0:	fb                   	sti
5ee1     5ee1:	9c                   	pushf
5ee2     5ee2:	58                   	pop    %rax
5ee3     5ee3:	fa                   	cli
5ee4     5ee4:	9c                   	pushf
5ee5     5ee5:	58                   	pop    %rax
5ee6     5ee6:	fb                   	sti
5ee7     5ee7:	9c                   	pushf
5ee8     5ee8:	58                   	pop    %rax
5ee9     5ee9:	fb                   	sti
5eea     5eea:	9c                   	pushf
5eeb     5eeb:	58                   	pop    %rax
5eec     5eec:	fa                   	cli
5eed     5eed:	9c                   	pushf
5eee     5eee:	58                   	pop    %rax
5eef     5eef:	fa                   	cli
5ef0     5ef0:	9c                   	pushf
5ef1     5ef1:	58                   	pop    %rax
5ef2     5ef2:	fb                   	sti
5ef3     5ef3:	9c                   	pushf
5ef4     5ef4:	58                   	pop    %rax
5ef5     5ef5:	fb                   	sti
5ef6     5ef6:	9c                   	pushf
5ef7     5ef7:	58                   	pop    %rax
5ef8     5ef8:	fa                   	cli
5ef9     5ef9:	9c                   	pushf
5efa     5efa:	58                   	pop    %rax
5efb     5efb:	fa                   	cli
5efc     5efc:	9c                   	pushf
5efd     5efd:	58                   	pop    %rax
5efe     5efe:	fb                   	sti
5eff     5eff:	9c                   	pushf
5f00     5f00:	58                   	pop    %rax
5f01     5f01:	f3 0f b8 c7          	popcnt %edi,%eax
5f05     5f05:	f3 0f b8 c7          	popcnt %edi,%eax
5f09     5f09:	f3 0f b8 c7          	popcnt %edi,%eax
5f0d     5f0d:	f3 0f b8 c7          	popcnt %edi,%eax
5f11     5f11:	f3 0f b8 c7          	popcnt %edi,%eax
5f15     5f15:	f3 0f b8 c7          	popcnt %edi,%eax
5f19     5f19:	f3 0f b8 c7          	popcnt %edi,%eax
5f1d     5f1d:	f3 0f b8 c7          	popcnt %edi,%eax
5f21     5f21:	f3 0f b8 c7          	popcnt %edi,%eax
5f25     5f25:	9c                   	pushf
5f26     5f26:	58                   	pop    %rax
5f27     5f27:	fb                   	sti
5f28     5f28:	9c                   	pushf
5f29     5f29:	58                   	pop    %rax
5f2a     5f2a:	fb                   	sti
5f2b     5f2b:	9c                   	pushf
5f2c     5f2c:	58                   	pop    %rax
5f2d     5f2d:	fa                   	cli
5f2e     5f2e:	f3 0f b8 c7          	popcnt %edi,%eax
5f32     5f32:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5f37     5f37:	f3 0f b8 c7          	popcnt %edi,%eax
5f3b     5f3b:	f3 0f b8 c7          	popcnt %edi,%eax
5f3f     5f3f:	f3 0f b8 c7          	popcnt %edi,%eax
5f43     5f43:	f3 0f b8 c7          	popcnt %edi,%eax
5f47     5f47:	f3 0f b8 c7          	popcnt %edi,%eax
5f4b     5f4b:	f3 0f b8 c7          	popcnt %edi,%eax
5f4f     5f4f:	f3 0f b8 c7          	popcnt %edi,%eax
5f53     5f53:	f3 0f b8 c7          	popcnt %edi,%eax
5f57     5f57:	f3 0f b8 c7          	popcnt %edi,%eax
5f5b     5f5b:	f3 0f b8 c7          	popcnt %edi,%eax
5f5f     5f5f:	f3 0f b8 c7          	popcnt %edi,%eax
5f63     5f63:	f3 0f b8 c7          	popcnt %edi,%eax
5f67     5f67:	f3 0f b8 c7          	popcnt %edi,%eax
5f6b     5f6b:	f3 0f b8 c7          	popcnt %edi,%eax
5f6f     5f6f:	f3 0f b8 c7          	popcnt %edi,%eax
5f73     5f73:	f3 0f b8 c7          	popcnt %edi,%eax
5f77     5f77:	f3 0f b8 c7          	popcnt %edi,%eax
5f7b     5f7b:	f3 0f b8 c7          	popcnt %edi,%eax
5f7f     5f7f:	f3 0f b8 c7          	popcnt %edi,%eax
5f83     5f83:	9c                   	pushf
5f84     5f84:	58                   	pop    %rax
5f85     5f85:	fb                   	sti
5f86     5f86:	9c                   	pushf
5f87     5f87:	58                   	pop    %rax
5f88     5f88:	fb                   	sti
5f89     5f89:	9c                   	pushf
5f8a     5f8a:	58                   	pop    %rax
5f8b     5f8b:	fa                   	cli
5f8c     5f8c:	9c                   	pushf
5f8d     5f8d:	58                   	pop    %rax
5f8e     5f8e:	fb                   	sti
5f8f     5f8f:	9c                   	pushf
5f90     5f90:	58                   	pop    %rax
5f91     5f91:	fb                   	sti
5f92     5f92:	9c                   	pushf
5f93     5f93:	58                   	pop    %rax
5f94     5f94:	fa                   	cli
5f95     5f95:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5f9a     5f9a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5f9f     5f9f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5fa4     5fa4:	f3 0f b8 c7          	popcnt %edi,%eax
5fa8     5fa8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5fad     5fad:	f3 48 0f b8 c7       	popcnt %rdi,%rax
5fb2     5fb2:	9c                   	pushf
5fb3     5fb3:	58                   	pop    %rax
5fb4     5fb4:	fb                   	sti
5fb5     5fb5:	9c                   	pushf
5fb6     5fb6:	58                   	pop    %rax
5fb7     5fb7:	fb                   	sti
5fb8     5fb8:	9c                   	pushf
5fb9     5fb9:	58                   	pop    %rax
5fba     5fba:	fa                   	cli
5fbb     5fbb:	9c                   	pushf
5fbc     5fbc:	58                   	pop    %rax
5fbd     5fbd:	fa                   	cli
5fbe     5fbe:	9c                   	pushf
5fbf     5fbf:	58                   	pop    %rax
5fc0     5fc0:	fb                   	sti
5fc1     5fc1:	9c                   	pushf
5fc2     5fc2:	58                   	pop    %rax
5fc3     5fc3:	fa                   	cli
5fc4     5fc4:	9c                   	pushf
5fc5     5fc5:	58                   	pop    %rax
5fc6     5fc6:	fb                   	sti
5fc7     5fc7:	0f 20 d0             	mov    %cr2,%rax
5fca     5fca:	0f 20 d8             	mov    %cr3,%rax
5fcd     5fcd:	0f 22 df             	mov    %rdi,%cr3
5fd0     5fd0:	e9 00 00 00 00       	jmp    5fd5 <.altinstr_replacement+0x5fd5>	5fd1: R_X86_64_PC32	.text+0x1165f941
5fd5     5fd5:	48 89 f8             	mov    %rdi,%rax
5fd8     5fd8:	48 89 f8             	mov    %rdi,%rax
5fdb     5fdb:	48 89 f8             	mov    %rdi,%rax
5fde     5fde:	48 89 f8             	mov    %rdi,%rax
5fe1     5fe1:	e9 00 00 00 00       	jmp    5fe6 <.altinstr_replacement+0x5fe6>	5fe2: R_X86_64_PC32	.text+0x1165fa10
5fe6     5fe6:	48 89 f8             	mov    %rdi,%rax
5fe9     5fe9:	e9 00 00 00 00       	jmp    5fee <.altinstr_replacement+0x5fee>	5fea: R_X86_64_PC32	.text+0x1165faa3
5fee     5fee:	e9 00 00 00 00       	jmp    5ff3 <.altinstr_replacement+0x5ff3>	5fef: R_X86_64_PC32	.text+0x116603a5
5ff3     5ff3:	48 89 f8             	mov    %rdi,%rax
5ff6     5ff6:	0f 20 d8             	mov    %cr3,%rax
5ff9     5ff9:	48 89 f8             	mov    %rdi,%rax
5ffc     5ffc:	48 89 f8             	mov    %rdi,%rax
5fff     5fff:	48 89 f8             	mov    %rdi,%rax
6002     6002:	48 89 f8             	mov    %rdi,%rax
6005     6005:	48 89 f8             	mov    %rdi,%rax
6008     6008:	48 89 f8             	mov    %rdi,%rax
600b     600b:	48 89 f8             	mov    %rdi,%rax
600e     600e:	48 89 f8             	mov    %rdi,%rax
6011     6011:	48 89 f8             	mov    %rdi,%rax
6014     6014:	48 89 f8             	mov    %rdi,%rax
6017     6017:	9c                   	pushf
6018     6018:	58                   	pop    %rax
6019     6019:	fa                   	cli
601a     601a:	9c                   	pushf
601b     601b:	58                   	pop    %rax
601c     601c:	fb                   	sti
601d     601d:	9c                   	pushf
601e     601e:	58                   	pop    %rax
601f     601f:	fb                   	sti
6020     6020:	9c                   	pushf
6021     6021:	58                   	pop    %rax
6022     6022:	fa                   	cli
6023     6023:	9c                   	pushf
6024     6024:	58                   	pop    %rax
6025     6025:	fb                   	sti
6026     6026:	9c                   	pushf
6027     6027:	58                   	pop    %rax
6028     6028:	fa                   	cli
6029     6029:	9c                   	pushf
602a     602a:	58                   	pop    %rax
602b     602b:	fb                   	sti
602c     602c:	9c                   	pushf
602d     602d:	58                   	pop    %rax
602e     602e:	fb                   	sti
602f     602f:	9c                   	pushf
6030     6030:	58                   	pop    %rax
6031     6031:	fa                   	cli
6032     6032:	9c                   	pushf
6033     6033:	58                   	pop    %rax
6034     6034:	fb                   	sti
6035     6035:	e9 00 00 00 00       	jmp    603a <.altinstr_replacement+0x603a>	6036: R_X86_64_PC32	.text+0x116d35b4
603a     603a:	e9 00 00 00 00       	jmp    603f <.altinstr_replacement+0x603f>	603b: R_X86_64_PC32	.text+0x116d384e
603f     603f:	0f 01 cb             	stac
6042     6042:	0f 01 ca             	clac
6045     6045:	0f 01 cb             	stac
6048     6048:	0f 01 ca             	clac
604b     604b:	0f 01 cb             	stac
604e     604e:	e8 00 00 00 00       	call   6053 <.altinstr_replacement+0x6053>	604f: R_X86_64_PLT32	rep_movs_alternative-0x4
6053     6053:	0f 01 ca             	clac
6056     6056:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
6058     6058:	0f 01 cb             	stac
605b     605b:	0f ae e8             	lfence
605e     605e:	0f 01 ca             	clac
6061     6061:	0f 01 cb             	stac
6064     6064:	0f ae e8             	lfence
6067     6067:	0f 01 ca             	clac
606a     606a:	0f ae e8             	lfence
606d     606d:	0f 31                	rdtsc
606f     606f:	0f 01 f9             	rdtscp
6072     6072:	0f ae e8             	lfence
6075     6075:	0f 31                	rdtsc
6077     6077:	0f 01 f9             	rdtscp
607a     607a:	0f ae e8             	lfence
607d     607d:	0f 31                	rdtsc
607f     607f:	0f 01 f9             	rdtscp
6082     6082:	0f ae e8             	lfence
6085     6085:	0f 31                	rdtsc
6087     6087:	0f 01 f9             	rdtscp
608a     608a:	0f 01 cb             	stac
608d     608d:	0f 01 ca             	clac
6090     6090:	0f 01 cb             	stac
6093     6093:	0f 01 ca             	clac
6096     6096:	0f 01 cb             	stac
6099     6099:	0f 01 ca             	clac
609c     609c:	0f 01 cb             	stac
609f     609f:	0f 01 ca             	clac
60a2     60a2:	0f 01 cb             	stac
60a5     60a5:	0f ae e8             	lfence
60a8     60a8:	0f 01 ca             	clac
60ab     60ab:	0f 01 cb             	stac
60ae     60ae:	0f ae e8             	lfence
60b1     60b1:	0f 01 ca             	clac
60b4     60b4:	0f 01 cb             	stac
60b7     60b7:	0f ae e8             	lfence
60ba     60ba:	0f 01 ca             	clac
60bd     60bd:	0f 01 cb             	stac
60c0     60c0:	0f ae e8             	lfence
60c3     60c3:	0f 01 ca             	clac
60c6     60c6:	0f 01 ca             	clac
60c9     60c9:	0f 01 cb             	stac
60cc     60cc:	e8 00 00 00 00       	call   60d1 <.altinstr_replacement+0x60d1>	60cd: R_X86_64_PLT32	rep_movs_alternative-0x4
60d1     60d1:	0f 01 ca             	clac
60d4     60d4:	48 83 fa 20          	cmp    $0x20,%rdx
60d8     60d8:	0f 82 00 00 00 00    	jb     60de <.altinstr_replacement+0x60de>	60da: R_X86_64_PC32	.noinstr.text+0xf662
60de     60de:	48 89 d1             	mov    %rdx,%rcx
60e1     60e1:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
60e3     60e3:	e9 00 00 00 00       	jmp    60e8 <.altinstr_replacement+0x60e8>	60e4: R_X86_64_PLT32	__x86_return_thunk-0x4
60e8     60e8:	48 89 d1             	mov    %rdx,%rcx
60eb     60eb:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
60ed     60ed:	e9 00 00 00 00       	jmp    60f2 <.altinstr_replacement+0x60f2>	60ee: R_X86_64_PLT32	__x86_return_thunk-0x4
60f2     60f2:	0f 01 cb             	stac
60f5     60f5:	0f 01 ca             	clac
60f8     60f8:	0f 01 cb             	stac
60fb     60fb:	0f 01 ca             	clac
60fe     60fe:	0f 01 cb             	stac
6101     6101:	0f 01 ca             	clac
6104     6104:	0f 01 cb             	stac
6107     6107:	0f 01 ca             	clac
610a     610a:	0f 01 cb             	stac
610d     610d:	0f 01 ca             	clac
6110     6110:	0f 01 cb             	stac
6113     6113:	0f 01 ca             	clac
6116     6116:	0f 01 cb             	stac
6119     6119:	0f 01 ca             	clac
611c     611c:	0f 01 cb             	stac
611f     611f:	0f 01 ca             	clac
6122     6122:	0f 01 ca             	clac
6125     6125:	0f ae e8             	lfence
6128     6128:	ff e0                	jmp    *%rax
612a     612a:	cc                   	int3
612b     612b:	ff e0                	jmp    *%rax
612d     612d:	0f ae e8             	lfence
6130     6130:	ff e1                	jmp    *%rcx
6132     6132:	cc                   	int3
6133     6133:	ff e1                	jmp    *%rcx
6135     6135:	0f ae e8             	lfence
6138     6138:	ff e2                	jmp    *%rdx
613a     613a:	cc                   	int3
613b     613b:	ff e2                	jmp    *%rdx
613d     613d:	0f ae e8             	lfence
6140     6140:	ff e3                	jmp    *%rbx
6142     6142:	cc                   	int3
6143     6143:	ff e3                	jmp    *%rbx
6145     6145:	0f ae e8             	lfence
6148     6148:	ff e4                	jmp    *%rsp
614a     614a:	cc                   	int3
614b     614b:	ff e4                	jmp    *%rsp
614d     614d:	0f ae e8             	lfence
6150     6150:	ff e5                	jmp    *%rbp
6152     6152:	cc                   	int3
6153     6153:	ff e5                	jmp    *%rbp
6155     6155:	0f ae e8             	lfence
6158     6158:	ff e6                	jmp    *%rsi
615a     615a:	cc                   	int3
615b     615b:	ff e6                	jmp    *%rsi
615d     615d:	0f ae e8             	lfence
6160     6160:	ff e7                	jmp    *%rdi
6162     6162:	cc                   	int3
6163     6163:	ff e7                	jmp    *%rdi
6165     6165:	0f ae e8             	lfence
6168     6168:	41 ff e0             	jmp    *%r8
616b     616b:	cc                   	int3
616c     616c:	41 ff e0             	jmp    *%r8
616f     616f:	0f ae e8             	lfence
6172     6172:	41 ff e1             	jmp    *%r9
6175     6175:	cc                   	int3
6176     6176:	41 ff e1             	jmp    *%r9
6179     6179:	0f ae e8             	lfence
617c     617c:	41 ff e2             	jmp    *%r10
617f     617f:	cc                   	int3
6180     6180:	41 ff e2             	jmp    *%r10
6183     6183:	0f ae e8             	lfence
6186     6186:	41 ff e3             	jmp    *%r11
6189     6189:	cc                   	int3
618a     618a:	41 ff e3             	jmp    *%r11
618d     618d:	0f ae e8             	lfence
6190     6190:	41 ff e4             	jmp    *%r12
6193     6193:	cc                   	int3
6194     6194:	41 ff e4             	jmp    *%r12
6197     6197:	0f ae e8             	lfence
619a     619a:	41 ff e5             	jmp    *%r13
619d     619d:	cc                   	int3
619e     619e:	41 ff e5             	jmp    *%r13
61a1     61a1:	0f ae e8             	lfence
61a4     61a4:	41 ff e6             	jmp    *%r14
61a7     61a7:	cc                   	int3
61a8     61a8:	41 ff e6             	jmp    *%r14
61ab     61ab:	0f ae e8             	lfence
61ae     61ae:	41 ff e7             	jmp    *%r15
61b1     61b1:	cc                   	int3
61b2     61b2:	41 ff e7             	jmp    *%r15
61b5     61b5:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	61ba: R_X86_64_32S	pcpu_hot+0x10
61bf     61bf:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	61c4: R_X86_64_32S	__x86_call_count
61c8     61c8:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	61cd: R_X86_64_32S	pcpu_hot+0x10
61d2     61d2:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	61d7: R_X86_64_32S	__x86_call_count
61db     61db:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	61e0: R_X86_64_32S	pcpu_hot+0x10
61e5     61e5:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	61ea: R_X86_64_32S	__x86_call_count
61ee     61ee:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	61f3: R_X86_64_32S	pcpu_hot+0x10
61f8     61f8:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	61fd: R_X86_64_32S	__x86_call_count
6201     6201:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	6206: R_X86_64_32S	pcpu_hot+0x10
620b     620b:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	6210: R_X86_64_32S	__x86_call_count
6214     6214:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	6219: R_X86_64_32S	pcpu_hot+0x10
621e     621e:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	6223: R_X86_64_32S	__x86_call_count
6227     6227:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	622c: R_X86_64_32S	pcpu_hot+0x10
6231     6231:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	6236: R_X86_64_32S	__x86_call_count
623a     623a:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	623f: R_X86_64_32S	pcpu_hot+0x10
6244     6244:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	6249: R_X86_64_32S	__x86_call_count
624d     624d:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	6252: R_X86_64_32S	pcpu_hot+0x10
6257     6257:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	625c: R_X86_64_32S	__x86_call_count
6260     6260:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	6265: R_X86_64_32S	pcpu_hot+0x10
626a     626a:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	626f: R_X86_64_32S	__x86_call_count
6273     6273:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	6278: R_X86_64_32S	pcpu_hot+0x10
627d     627d:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	6282: R_X86_64_32S	__x86_call_count
6286     6286:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	628b: R_X86_64_32S	pcpu_hot+0x10
6290     6290:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	6295: R_X86_64_32S	__x86_call_count
6299     6299:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	629e: R_X86_64_32S	pcpu_hot+0x10
62a3     62a3:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	62a8: R_X86_64_32S	__x86_call_count
62ac     62ac:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	62b1: R_X86_64_32S	pcpu_hot+0x10
62b6     62b6:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	62bb: R_X86_64_32S	__x86_call_count
62bf     62bf:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	62c4: R_X86_64_32S	pcpu_hot+0x10
62c9     62c9:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	62ce: R_X86_64_32S	__x86_call_count
62d2     62d2:	65 48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,%gs:0x0	62d7: R_X86_64_32S	pcpu_hot+0x10
62dc     62dc:	65 48 ff 04 25 00 00 00 00 	incq   %gs:0x0	62e1: R_X86_64_32S	__x86_call_count
62e5     62e5:	0f 01 cb             	stac
62e8     62e8:	e8 00 00 00 00       	call   62ed <.altinstr_replacement+0x62ed>	62e9: R_X86_64_PLT32	rep_movs_alternative-0x4
62ed     62ed:	0f 01 ca             	clac
62f0     62f0:	66 0f ae 38          	clflushopt (%rax)
62f4     62f4:	66 0f ae 30          	clwb   (%rax)
62f8     62f8:	0f 01 cb             	stac
62fb     62fb:	0f 01 ca             	clac

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

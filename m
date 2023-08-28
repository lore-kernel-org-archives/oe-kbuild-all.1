Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F7C643
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 02:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693188465; x=1724724465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jPaNb1aU+CLVdISItOV0rDyEC4P4mIJ3vn/DTI56QBY=;
  b=If3jz+QDGiXHLNvoW/7mo65cVD+8m1pvDo1PkqNVFBxB3Y6P4HE8yuys
   qKmUORVBLuiLWiIeYJD57VmwurKQ9GTHbk7rU4tBA1+VXuLrh7MzYbEju
   0xwvaC4N4inse4ppSLcOs1yutZIRXZxwWtxaKvJK8gJlZDXfmGEz2UsWf
   99Vvs+57Af/bbdAmkPxS+IpaRK/WtBaVRwBG8M2fg9uF3184R4Og1scrj
   7lFs8L+e3TYEBwI+mSvdKjKcLj660Oix29n9gZ53LXZ/o2dYS8hxFRFBR
   jv16G4tr2hRz+KhosdvMvJcuaSe3eAY3+au/uIP5dNel8/ZY0NA3yRxcz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="405983486"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="405983486"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 19:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="773104177"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="773104177"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 27 Aug 2023 19:07:41 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaRf3-0006Pl-1X;
	Mon, 28 Aug 2023 02:07:33 +0000
Date: Mon, 28 Aug 2023 10:06:06 +0800
From: kernel test robot <lkp@intel.com>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 2869/6743] kernel/trace/trace.c:1249: Error:
 unrecognized opcode `csrs sstatus,t5', extension `zicsr' required
Message-ID: <202308280929.7anPf7PB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   4e5e7fa94ee0ff378b268679d51feb1fd2a04756
commit: 8258fb4ef288e0467d1964653c1d1250e0a3ac81 [2869/6743] tracing: Avoid adding tracer option before update_tracer_options
config: riscv-randconfig-r005-20230828 (https://download.01.org/0day-ci/archive/20230828/202308280929.7anPf7PB-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280929.7anPf7PB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280929.7anPf7PB-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c:2474:6: warning: no previous prototype for 'ftrace_exports' [-Wmissing-prototypes]
    2474 | void ftrace_exports(struct ring_buffer_event *event)
         |      ^~~~~~~~~~~~~~
   kernel/trace/trace.c: In function 'ftrace_trace_userstack':
   kernel/trace/trace.c:2760:28: warning: variable 'trace' set but not used [-Wunused-but-set-variable]
    2760 |         struct stack_trace trace;
         |                            ^~~~~
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   kernel/trace/trace.c:1235: Error: unrecognized opcode `csrs sstatus,a7', extension `zicsr' required
   kernel/trace/trace.c:1235: Error: unrecognized opcode `csrc sstatus,a7', extension `zicsr' required
   kernel/trace/trace.c:1274: Error: unrecognized opcode `csrs sstatus,t0', extension `zicsr' required
   kernel/trace/trace.c:1274: Error: unrecognized opcode `csrc sstatus,t0', extension `zicsr' required
>> kernel/trace/trace.c:1249: Error: unrecognized opcode `csrs sstatus,t5', extension `zicsr' required
>> kernel/trace/trace.c:1249: Error: unrecognized opcode `csrc sstatus,t5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr a5,sstatus', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr s6,sstatus', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr s6,sstatus', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr s8,sstatus', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr s8,sstatus', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr s8,sstatus', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr s7,sstatus', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr s9,sstatus', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr a1,sstatus', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr s9,sstatus', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr a5,sstatus', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s5', extension `zicsr' required


vim +1249 kernel/trace/trace.c

b63f39ea50330f jolsa@redhat.com 2009-09-11  1213  
b63f39ea50330f jolsa@redhat.com 2009-09-11  1214  /*
b63f39ea50330f jolsa@redhat.com 2009-09-11  1215   * trace_get_user - reads the user input string separated by  space
b63f39ea50330f jolsa@redhat.com 2009-09-11  1216   * (matched by isspace(ch))
b63f39ea50330f jolsa@redhat.com 2009-09-11  1217   *
b63f39ea50330f jolsa@redhat.com 2009-09-11  1218   * For each string found the 'struct trace_parser' is updated,
b63f39ea50330f jolsa@redhat.com 2009-09-11  1219   * and the function returns.
b63f39ea50330f jolsa@redhat.com 2009-09-11  1220   *
b63f39ea50330f jolsa@redhat.com 2009-09-11  1221   * Returns number of bytes read.
b63f39ea50330f jolsa@redhat.com 2009-09-11  1222   *
b63f39ea50330f jolsa@redhat.com 2009-09-11  1223   * See kernel/trace/trace.h for 'struct trace_parser' details.
b63f39ea50330f jolsa@redhat.com 2009-09-11  1224   */
b63f39ea50330f jolsa@redhat.com 2009-09-11  1225  int trace_get_user(struct trace_parser *parser, const char __user *ubuf,
b63f39ea50330f jolsa@redhat.com 2009-09-11  1226  	size_t cnt, loff_t *ppos)
b63f39ea50330f jolsa@redhat.com 2009-09-11  1227  {
b63f39ea50330f jolsa@redhat.com 2009-09-11  1228  	char ch;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1229  	size_t read = 0;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1230  	ssize_t ret;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1231  
b63f39ea50330f jolsa@redhat.com 2009-09-11  1232  	if (!*ppos)
b63f39ea50330f jolsa@redhat.com 2009-09-11  1233  		trace_parser_clear(parser);
b63f39ea50330f jolsa@redhat.com 2009-09-11  1234  
b63f39ea50330f jolsa@redhat.com 2009-09-11  1235  	ret = get_user(ch, ubuf++);
b63f39ea50330f jolsa@redhat.com 2009-09-11  1236  	if (ret)
b63f39ea50330f jolsa@redhat.com 2009-09-11  1237  		goto out;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1238  
b63f39ea50330f jolsa@redhat.com 2009-09-11  1239  	read++;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1240  	cnt--;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1241  
b63f39ea50330f jolsa@redhat.com 2009-09-11  1242  	/*
b63f39ea50330f jolsa@redhat.com 2009-09-11  1243  	 * The parser is not finished with the last write,
b63f39ea50330f jolsa@redhat.com 2009-09-11  1244  	 * continue reading the user input without skipping spaces.
b63f39ea50330f jolsa@redhat.com 2009-09-11  1245  	 */
b63f39ea50330f jolsa@redhat.com 2009-09-11  1246  	if (!parser->cont) {
b63f39ea50330f jolsa@redhat.com 2009-09-11  1247  		/* skip white space */
b63f39ea50330f jolsa@redhat.com 2009-09-11  1248  		while (cnt && isspace(ch)) {
b63f39ea50330f jolsa@redhat.com 2009-09-11 @1249  			ret = get_user(ch, ubuf++);
b63f39ea50330f jolsa@redhat.com 2009-09-11  1250  			if (ret)
b63f39ea50330f jolsa@redhat.com 2009-09-11  1251  				goto out;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1252  			read++;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1253  			cnt--;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1254  		}
b63f39ea50330f jolsa@redhat.com 2009-09-11  1255  
76638d96502744 Changbin Du      2018-01-16  1256  		parser->idx = 0;
76638d96502744 Changbin Du      2018-01-16  1257  
b63f39ea50330f jolsa@redhat.com 2009-09-11  1258  		/* only spaces were written */
921a7acd85ebba Changbin Du      2018-01-16  1259  		if (isspace(ch) || !ch) {
b63f39ea50330f jolsa@redhat.com 2009-09-11  1260  			*ppos += read;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1261  			ret = read;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1262  			goto out;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1263  		}
b63f39ea50330f jolsa@redhat.com 2009-09-11  1264  	}
b63f39ea50330f jolsa@redhat.com 2009-09-11  1265  
b63f39ea50330f jolsa@redhat.com 2009-09-11  1266  	/* read the non-space input */
921a7acd85ebba Changbin Du      2018-01-16  1267  	while (cnt && !isspace(ch) && ch) {
3c235a337e205d Li Zefan         2009-09-22  1268  		if (parser->idx < parser->size - 1)
b63f39ea50330f jolsa@redhat.com 2009-09-11  1269  			parser->buffer[parser->idx++] = ch;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1270  		else {
b63f39ea50330f jolsa@redhat.com 2009-09-11  1271  			ret = -EINVAL;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1272  			goto out;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1273  		}
b63f39ea50330f jolsa@redhat.com 2009-09-11  1274  		ret = get_user(ch, ubuf++);
b63f39ea50330f jolsa@redhat.com 2009-09-11  1275  		if (ret)
b63f39ea50330f jolsa@redhat.com 2009-09-11  1276  			goto out;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1277  		read++;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1278  		cnt--;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1279  	}
b63f39ea50330f jolsa@redhat.com 2009-09-11  1280  
b63f39ea50330f jolsa@redhat.com 2009-09-11  1281  	/* We either got finished input or we have to wait for another call. */
921a7acd85ebba Changbin Du      2018-01-16  1282  	if (isspace(ch) || !ch) {
b63f39ea50330f jolsa@redhat.com 2009-09-11  1283  		parser->buffer[parser->idx] = 0;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1284  		parser->cont = false;
057db8488b53d5 Steven Rostedt   2013-10-09  1285  	} else if (parser->idx < parser->size - 1) {
b63f39ea50330f jolsa@redhat.com 2009-09-11  1286  		parser->cont = true;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1287  		parser->buffer[parser->idx++] = ch;
f4d0706cde27f2 Changbin Du      2018-01-16  1288  		/* Make sure the parsed string always terminates with '\0'. */
f4d0706cde27f2 Changbin Du      2018-01-16  1289  		parser->buffer[parser->idx] = 0;
057db8488b53d5 Steven Rostedt   2013-10-09  1290  	} else {
057db8488b53d5 Steven Rostedt   2013-10-09  1291  		ret = -EINVAL;
057db8488b53d5 Steven Rostedt   2013-10-09  1292  		goto out;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1293  	}
b63f39ea50330f jolsa@redhat.com 2009-09-11  1294  
b63f39ea50330f jolsa@redhat.com 2009-09-11  1295  	*ppos += read;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1296  	ret = read;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1297  
b63f39ea50330f jolsa@redhat.com 2009-09-11  1298  out:
b63f39ea50330f jolsa@redhat.com 2009-09-11  1299  	return ret;
b63f39ea50330f jolsa@redhat.com 2009-09-11  1300  }
b63f39ea50330f jolsa@redhat.com 2009-09-11  1301  

:::::: The code at line 1249 was first introduced by commit
:::::: b63f39ea50330f836e301ddda21c6a93dcf0d6a3 tracing: create generic trace parser

:::::: TO: jolsa@redhat.com <jolsa@redhat.com>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

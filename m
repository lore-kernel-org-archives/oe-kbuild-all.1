Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9030141C72
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 08:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788181; cv=none; b=gucNtf9ZkIV9Bx9G94ztNmI/j3WLUwyuvNScOp34h56vpdopEiKgZdO29O8mFjqQo8YKL9W0IkwY4YaHpaJBuE68ZRxadVivGMNy8yoNoU2+T8m4rPNmD0Mb1FMs1W1QeqRZqd/QQYGfdHSeKSZXh19GGBjCNzd9vYNsWmUI5gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788181; c=relaxed/simple;
	bh=ZJMzPxRDiJROecpZ+GTUC+p4PUQ0cec2v2iMGgaQkaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nIC432wvx3L6ZrszQ1AS6j6MeCOpJfVtxEAuaVwgeVC1nfOvmpF5sZsc/PUTEA5BMmGIZ7eDCLX+g9kZA3b5ZvnZ+6ICwt55cRxw9axmYvvkIFAo8Um1EwAjN6ZINJwLwL9TExuvc295hijNYMHW4GvNs+mrX3IrwM4SvElfTuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMfrqTlX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMfrqTlX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765788180; x=1797324180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZJMzPxRDiJROecpZ+GTUC+p4PUQ0cec2v2iMGgaQkaQ=;
  b=nMfrqTlXD/mEBcbuWwlXc9v8jXmJk8fweAajNiA/+1b5hGjkIlR46R0/
   d8aASsUNZ4ZG2HhytoYZO0zc130SVt0ll1qYio9NRNcEjRI+cyVdZ2tyi
   clW87TJrcgNVJ48A+c15GJlxqsbpt4YgGjPUfrmJ0f7yvbThWIjsU0l+3
   O6XeJT170+5l5757dLmnmKwh5TXszCMUCUa/As3tX4yRYVMDS5NW4/Fkz
   eJLRmRJkpx53cNq9QOIbcYSHuA5RjIP0bFegMsK7mhEqYc1wMWtPyEeoB
   voIm5IY7lhN23T32jDpNXVbVK9h83Bzfl2DLwW/jurOsPqOojMb4oRd+i
   A==;
X-CSE-ConnectionGUID: kN7rfwN9SCa0eJps/gUNnQ==
X-CSE-MsgGUID: fBTGYHuvRZ2Y/5yPmTdyzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67561440"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67561440"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 00:42:56 -0800
X-CSE-ConnectionGUID: vNh271a/TLGkWIqZ7Sowqg==
X-CSE-MsgGUID: ZlRjGJGUSiqiOd4Vk1XKMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197561763"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Dec 2025 00:42:55 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV4AO-0000000005Z-3ebr;
	Mon, 15 Dec 2025 08:42:52 +0000
Date: Mon, 15 Dec 2025 16:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuntao Liu <liuyuntao12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542] lib/test_hexdump.c:116:3: warning:
 'strncpy' output truncated copying between 0 and 32 bytes from a string of
 length 32
Message-ID: <202512151641.xBwOsIKs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   81b22958142c03b02c766c79cd1554ebfa142be4
commit: f04c0f3eb9b49427c273cd3e4d5a2ff895855b4b [3542/3542] make OPTIMIZE_INLINING config editable
config: arm64-randconfig-004-20251215 (https://download.01.org/0day-ci/archive/20251215/202512151641.xBwOsIKs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151641.xBwOsIKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151641.xBwOsIKs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/test_hexdump.c: In function 'test_hexdump_prepare_test.isra.0':
>> lib/test_hexdump.c:116:3: warning: 'strncpy' output truncated copying between 0 and 32 bytes from a string of length 32 [-Wstringop-truncation]
     116 |   strncpy(p, data_a, l);
         |   ^~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +116 lib/test_hexdump.c

7aaf4c3e1235cc lib/test_hexdump.c Andy Shevchenko  2016-01-20   66  
87977ca6bcd051 lib/test_hexdump.c Andy Shevchenko  2016-01-20   67  static void __init test_hexdump_prepare_test(size_t len, int rowsize,
87977ca6bcd051 lib/test_hexdump.c Andy Shevchenko  2016-01-20   68  					     int groupsize, char *test,
87977ca6bcd051 lib/test_hexdump.c Andy Shevchenko  2016-01-20   69  					     size_t testlen, bool ascii)
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   70  {
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   71  	char *p;
17974c054db303 lib/test-hexdump.c Linus Torvalds   2015-04-19   72  	const char * const *result;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   73  	size_t l = len;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   74  	int gs = groupsize, rs = rowsize;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   75  	unsigned int i;
de9df3993cfffd lib/test_hexdump.c Christophe Leroy 2018-08-21   76  	const bool is_be = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   77  
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   78  	if (rs != 16 && rs != 32)
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   79  		rs = 16;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   80  
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   81  	if (l > rs)
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   82  		l = rs;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   83  
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   84  	if (!is_power_of_2(gs) || gs > 8 || (len % gs != 0))
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   85  		gs = 1;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   86  
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   87  	if (gs == 8)
de9df3993cfffd lib/test_hexdump.c Christophe Leroy 2018-08-21   88  		result = is_be ? test_data_8_be : test_data_8_le;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   89  	else if (gs == 4)
de9df3993cfffd lib/test_hexdump.c Christophe Leroy 2018-08-21   90  		result = is_be ? test_data_4_be : test_data_4_le;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   91  	else if (gs == 2)
de9df3993cfffd lib/test_hexdump.c Christophe Leroy 2018-08-21   92  		result = is_be ? test_data_2_be : test_data_2_le;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   93  	else
de9df3993cfffd lib/test_hexdump.c Christophe Leroy 2018-08-21   94  		result = test_data_1;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   95  
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   96  	/* hex dump */
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   97  	p = test;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   98  	for (i = 0; i < l / gs; i++) {
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12   99  		const char *q = *result++;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12  100  		size_t amount = strlen(q);
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12  101  
b1286ed7158e9b lib/test_hexdump.c Linus Torvalds   2018-11-30  102  		memcpy(p, q, amount);
3db4a987180acf lib/test_hexdump.c Andy Shevchenko  2016-01-20  103  		p += amount;
3db4a987180acf lib/test_hexdump.c Andy Shevchenko  2016-01-20  104  
3db4a987180acf lib/test_hexdump.c Andy Shevchenko  2016-01-20  105  		*p++ = ' ';
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12  106  	}
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12  107  	if (i)
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12  108  		p--;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12  109  
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12  110  	/* ASCII part */
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12  111  	if (ascii) {
3db4a987180acf lib/test_hexdump.c Andy Shevchenko  2016-01-20  112  		do {
3db4a987180acf lib/test_hexdump.c Andy Shevchenko  2016-01-20  113  			*p++ = ' ';
3db4a987180acf lib/test_hexdump.c Andy Shevchenko  2016-01-20  114  		} while (p < test + rs * 2 + rs / gs + 1);
3db4a987180acf lib/test_hexdump.c Andy Shevchenko  2016-01-20  115  
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12 @116  		strncpy(p, data_a, l);
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12  117  		p += l;
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12  118  	}
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12  119  
64d1d77a44697a lib/test-hexdump.c Andy Shevchenko  2015-02-12  120  	*p = '\0';
87977ca6bcd051 lib/test_hexdump.c Andy Shevchenko  2016-01-20  121  }
87977ca6bcd051 lib/test_hexdump.c Andy Shevchenko  2016-01-20  122  

:::::: The code at line 116 was first introduced by commit
:::::: 64d1d77a44697af8e314939ecef30642c68309cb hexdump: introduce test suite

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F33334D382
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Feb 2026 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771842446; cv=none; b=VX45617Pzz1eeHe7S78SFAgP41livxbDHcAlsgjCgbYBjkTv8ZLaKv/n/2VvLZIX0zfP5eekCq6iAQnGsq4cekTTRZ/KUJqrffBizBTKZ0VPl/P08JbmdnXEf39g4cMHDqTOUZvjpgZtxGUXGvDlEgXgFepF6DvkUIXAGUKhSs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771842446; c=relaxed/simple;
	bh=5A1NjhfmNBtWqzPvhJoWQaNXhptvTO6p+OS4k29xZUg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QTDfOYFiKZo8xkK1QUipc3FEiDoGEvccWKN6i5Udp998E8nJ9q5vBaIT5cTKdZzGf+pZ7CuVvAF6cTSGZZZzepc/PRWkLIgAH0lYxRPW2jK2CU8MV8oBQYRihNTSewpaVnwgigAo7vM25Ey5k8TQfayNw01H5VvG5MOlkl2d/dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWrl0Oai; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWrl0Oai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771842445; x=1803378445;
  h=date:from:to:cc:subject:message-id;
  bh=5A1NjhfmNBtWqzPvhJoWQaNXhptvTO6p+OS4k29xZUg=;
  b=VWrl0OaixkhnCX3G6H573y+dNvi2HteCYdldXXxAmxrmXAjsAhFtbpy5
   lycm1ohRHLV/gq6fQMxFGCDcB8HGduvLV1wUJ+tdUj2Kb92vLdRsqZbLJ
   3CbAyqD7lElfve53e7JwtrtYpCmGVmV4756DLvdj1d322+++vqRDEUGjW
   8BPpWXPSS4W3O7H4Bo7ZQqsM0DBqCuNAg6tHtbUAdLyy0dOnKQ/c0CWN9
   todrhAnh3KX1gNZxxPUIUjlE7BbAqNglq19rHFjCkKkvNey+8d+etNcHx
   wd9bQ5cslQ6anXQ2x9vNnLH7xXTztom7FouVFixOCDhRvfVN40y1VKLQr
   Q==;
X-CSE-ConnectionGUID: Tvqq7LoQS1Cs3GCTX70ybA==
X-CSE-MsgGUID: /2Kb98wlRzGjppAApNE6Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72538634"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72538634"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 02:27:24 -0800
X-CSE-ConnectionGUID: u63xjl8ERfeNQkmkFZKS0w==
X-CSE-MsgGUID: W/m7ngXyREWtB83turL5Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="220520363"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 23 Feb 2026 02:27:23 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuT9t-000000004rR-0nUn;
	Mon, 23 Feb 2026 10:27:21 +0000
Date: Mon, 23 Feb 2026 11:26:50 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1] vec-syscfg.c:24:9:
 warning: "ARRAY_SIZE" redefined
Message-ID: <202602231128.0cedTbH1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   b5e973f489e4928831610623d5e272716600ff94
commit: c9e52db90031b7a89bf667057df5ca9c25cd68ff [1/1] tools: fix ARRAY_SIZE defines in tools and selftests hdrs
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260223/202602231128.0cedTbH1-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602231128.0cedTbH1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602231128.0cedTbH1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vec-syscfg.c:24:9: warning: "ARRAY_SIZE" redefined
      24 | #define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
         |         ^~~~~~~~~~
   In file included from vec-syscfg.c:21:
   ../../kselftest.h:52:9: note: this is the location of the previous definition
      52 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |         ^~~~~~~~~~
   vec-syscfg.c: In function 'get_child_rdvl':
   vec-syscfg.c:112:33: warning: too many arguments for format [-Wformat-extra-args]
     112 |                 fprintf(stderr, "execl(%s) failed: %d\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   vec-syscfg.c: At top level:
   vec-syscfg.c:326:13: warning: 'prctl_set_same' defined but not used [-Wunused-function]
     326 | static void prctl_set_same(struct vec_data *data)
         |             ^~~~~~~~~~~~~~
   vec-syscfg.c: In function 'file_write_integer':
   vec-syscfg.c:195:12: warning: 'ret' may be used uninitialized [-Wmaybe-uninitialized]
     195 |         if (ret < 0) {
         |            ^
   vec-syscfg.c:183:13: note: 'ret' was declared here
     183 |         int ret;
         |             ^~~
--
>> vec-syscfg.c:24:9: warning: "ARRAY_SIZE" redefined
      24 | #define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
         |         ^~~~~~~~~~
   In file included from vec-syscfg.c:21:
   ../../kselftest.h:52:9: note: this is the location of the previous definition
      52 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |         ^~~~~~~~~~
   vec-syscfg.c: In function 'get_child_rdvl':
   vec-syscfg.c:112:33: warning: too many arguments for format [-Wformat-extra-args]
     112 |                 fprintf(stderr, "execl(%s) failed: %d\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   vec-syscfg.c: At top level:
   vec-syscfg.c:326:13: warning: 'prctl_set_same' defined but not used [-Wunused-function]
     326 | static void prctl_set_same(struct vec_data *data)
         |             ^~~~~~~~~~~~~~
   vec-syscfg.c: In function 'file_write_integer':
   vec-syscfg.c:195:12: warning: 'ret' may be used uninitialized [-Wmaybe-uninitialized]
     195 |         if (ret < 0) {
         |            ^
   vec-syscfg.c:183:13: note: 'ret' was declared here
     183 |         int ret;
         |             ^~~
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: /tmp/ccTT54Vu.o:(.data.rel+0x20): undefined reference to `rdvl_sve'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC8618035
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707131369; cv=none; b=FvNBU+T+gjBBL7O7Yw6n42Xs3eAr4jrVJCNaVwpBo/ON7D4ba9ukio92yH5B2+X0ezONMRiWQDCDiWuabitaeV2jlH5cYb+bXGzNdCgStU3d3cUdmFpYm11FdOM+9nVopL5Hr0Fhod/2wi2AV1wcLvfGsSVexsvef8NrN9kVif4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707131369; c=relaxed/simple;
	bh=0TH6ia/d9W3AQmsZ875R4KJQlqeU3mRGYibBHrNGHhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hXagH7uLMIk25sJTNkmofJ8R4YhahkbOMbPEldo2GlfzvEtuw6U7QLEK6wHHZBnD4kuQ2HoNRCJSVNEb+JTuZh9fo+55VWQdcjOlL94L5FYPDIoP+QTl63NeUqNkj4/asd4Fo5K0GZn/GMlxtXZ8nLpy5PBkk3uORoIXRvWUoWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z604vDaB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z604vDaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707131368; x=1738667368;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0TH6ia/d9W3AQmsZ875R4KJQlqeU3mRGYibBHrNGHhU=;
  b=Z604vDaBvbaazWgJUPAndfi5vmn2jveNrLYI098IXgiUbn4KWi7B/AQO
   wdNoq1Vu3M5wmM7zDXBm7fYhLLiCP9llSgwRISRy3ifkQkU1JtS6MUeb1
   q9hQ0UDfG1b03/NdrabLqgJ1wDNBrY14rzVbbFqrYWw3Aikgp1c6/MAD9
   Pze25eFFQjeuWky7FN4MxsnvfnsD8wuuRykEXM3ce/ELB2LS/FqWxB+9M
   NxmZGdgcKRIJgBbHrwzTeHW66cJnEkvL6slQlgq3J4qYoUlU/9FUOiEb3
   OSX58SpXUG/O9bAbBQfm9vr52uWNuZS5DusM29/5E77FvB6oWlHAW4oy2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="655552"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="655552"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 03:09:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="691099"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Feb 2024 03:09:24 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWwqn-0000Q9-2H;
	Mon, 05 Feb 2024 11:09:21 +0000
Date: Mon, 5 Feb 2024 19:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: =?utf-8?Q?=5Bjcmvbkbc-xtensa=3Axtensa-6=2E?=
 =?utf-8?Q?8-rc2-esp32_44=2F52=5D_tools=2Fperf=2Futil=2Fevlist=2Ec=3A1525?=
 =?utf-8?B?OjIyOiBlcnJvcjogdW51c2VkIHZhcmlhYmxlIOKAmGJm4oCZ?=
Message-ID: <202402051840.PaZ4H2ni-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.8-rc2-esp32
head:   b25ff15921c2ce0b8abd0f2797f4942a28866d9e
commit: af2c0b346e49361fee95cbd8a73eb6430b4c5f80 [44/52] WIP: tools/perf: make work on noMMU
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051840.PaZ4H2ni-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051840.PaZ4H2ni-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:1158: libpfm4 not found, disables libpfm4 support. Please install libpfm4-dev
     PERF_VERSION = 6.8.rc2.gaf2c0b346e49
   tools/perf/util/evlist.c: In function ‘evlist__start_workload’:
>> tools/perf/util/evlist.c:1525:22: error: unused variable ‘bf’ [-Werror=unused-variable]
    1525 |                 char bf = 0;
         |                      ^~
   cc1: all warnings being treated as errors
>> error: command '/usr/bin/gcc-12' failed with exit code 1
>> cp: cannot stat 'tools/perf/python_ext_build/lib/perf*.so': No such file or directory
   make[5]: *** [Makefile.perf:668: tools/perf/python/perf.cpython-311-x86_64-linux-gnu.so] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:251: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +1525 tools/perf/util/evlist.c

35b9d88ecd8c5f Arnaldo Carvalho de Melo 2011-11-09  1521  
7b392ef04ef570 Arnaldo Carvalho de Melo 2020-11-30  1522  int evlist__start_workload(struct evlist *evlist)
35b9d88ecd8c5f Arnaldo Carvalho de Melo 2011-11-09  1523  {
35b9d88ecd8c5f Arnaldo Carvalho de Melo 2011-11-09  1524  	if (evlist->workload.cork_fd > 0) {
b3824404ebbd48 David Ahern              2013-07-02 @1525  		char bf = 0;
bcf3145fbeb1bd Namhyung Kim             2013-06-26  1526  		int ret;
35b9d88ecd8c5f Arnaldo Carvalho de Melo 2011-11-09  1527  		/*
35b9d88ecd8c5f Arnaldo Carvalho de Melo 2011-11-09  1528  		 * Remove the cork, let it rip!
35b9d88ecd8c5f Arnaldo Carvalho de Melo 2011-11-09  1529  		 */
af2c0b346e4936 Max Filippov             2023-07-26  1530  		ret = 1;//write(evlist->workload.cork_fd, &bf, 1);
bcf3145fbeb1bd Namhyung Kim             2013-06-26  1531  		if (ret < 0)
e978be9ea2990f Soramichi Akiyama        2017-01-10  1532  			perror("unable to write to pipe");
bcf3145fbeb1bd Namhyung Kim             2013-06-26  1533  
bcf3145fbeb1bd Namhyung Kim             2013-06-26  1534  		close(evlist->workload.cork_fd);
bcf3145fbeb1bd Namhyung Kim             2013-06-26  1535  		return ret;
35b9d88ecd8c5f Arnaldo Carvalho de Melo 2011-11-09  1536  	}
35b9d88ecd8c5f Arnaldo Carvalho de Melo 2011-11-09  1537  
35b9d88ecd8c5f Arnaldo Carvalho de Melo 2011-11-09  1538  	return 0;
35b9d88ecd8c5f Arnaldo Carvalho de Melo 2011-11-09  1539  }
cb0b29e0861659 Arnaldo Carvalho de Melo 2012-08-02  1540  

:::::: The code at line 1525 was first introduced by commit
:::::: b3824404ebbd489858f3a7097c715120118fa5cd perf evlist: Fix use of uninitialized variable

:::::: TO: David Ahern <dsahern@gmail.com>
:::::: CC: Arnaldo Carvalho de Melo <acme@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

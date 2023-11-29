Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0581119A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ep2NWDVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701244222; x=1732780222;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+tJ++XYgiVAzlnAb8FuXrRj/7yEGFtv4j6jYxPmLwpI=;
  b=Ep2NWDVReqThK3SMP0duk7cmNwws+HHov+9O1OfHntev0Qu9ybQTqX7U
   xAwipw2RdFxd1AE1HqpMf8TR7XI/YyVON4vEf/2NdADIN4fPrqDkN0Am8
   5pqCoVMwxf57/hfzUITSFMUxm265TKqafpq00gzMm/lsA1or9dNE4odMB
   IRQKstB9F7qJrJeWsCpBYVUyM3q1nn7JSgrB0J48QrGWmOj9ov60tnj4C
   ffQqP9vSEbeN5ajPLOazEm9XEAGttbkOPisqLcjgBT6P0n9fnR+YaVdW6
   ROiSPfC0+eSOUWsldyhvWKgw6hRXPXX8UrfvJUj46ZBtfnp3pkgIugIIr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6385865"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="6385865"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 23:50:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772596901"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="772596901"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Nov 2023 23:50:20 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8FKs-0008kX-1C;
	Wed, 29 Nov 2023 07:50:18 +0000
Date: Wed, 29 Nov 2023 15:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: =?utf-8?Q?=5Bjcmvbkbc-xtensa=3Axtensa-6=2E?=
 =?utf-8?Q?7-rc1-esp32_35=2F47=5D_tools=2Fperf=2Futil=2Fevlist=2Ec=3A1525?=
 =?utf-8?B?OjIyOiBlcnJvcjogdW51c2VkIHZhcmlhYmxlIOKAmGJm4oCZ?=
Message-ID: <202311291253.Rr8kZypr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.7-rc1-esp32
head:   86add88f03bf61935aebc7d112540c5b5759b799
commit: 8bbc8f62f707f9a5774afd2b0cc5fc565568fc4a [35/47] WIP: tools/perf: make work on noMMU
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311291253.Rr8kZypr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311291253.Rr8kZypr-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:1153: libpfm4 not found, disables libpfm4 support. Please install libpfm4-dev
     PERF_VERSION = 6.7.rc1.g8bbc8f62f707
   tools/perf/util/evlist.c: In function ‘evlist__start_workload’:
>> tools/perf/util/evlist.c:1525:22: error: unused variable ‘bf’ [-Werror=unused-variable]
    1525 |                 char bf = 0;
         |                      ^~
   cc1: all warnings being treated as errors
>> error: command '/usr/bin/gcc-12' failed with exit code 1
>> cp: cannot stat 'tools/perf/python_ext_build/lib/perf*.so': No such file or directory
   make[5]: *** [Makefile.perf:653: tools/perf/python/perf.cpython-311-x86_64-linux-gnu.so] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:242: sub-make] Error 2
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
8bbc8f62f707f9 Max Filippov             2023-07-26  1530  		ret = 1;//write(evlist->workload.cork_fd, &bf, 1);
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

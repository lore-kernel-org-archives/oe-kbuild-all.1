Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1385C20180
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 20:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692736193; x=1724272193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K7RORICPfxqNBHQcIZ/qDqJ2svKqxnPmCYZf/nKOmrU=;
  b=EQczg3wGVs6N/zP/33Co7NmKMQuZWM/xjofN4adSyZDSO2iH093X9DND
   a1rp/kCvhUTbLVGMc9zEoA2xeGnFffs77aACoUMPyAOkRvj03q+f579wc
   beEeUyko4t3ew7nDwdtyKlfeUTi5PWiTQ1UoK0Vy61hrjD/hCfyZTT3Mi
   MMxHPA/mbbI9YuHA3i4B0cvbbMSRvvv32nfDic3UEKGXk4fQFHgt+QUyX
   9WvAQHaGvNIu49Vfya5DsGNY+pTqHqZ+twRcDFKJNBJch90qpANc/PlxL
   SpyODDsNlOaLgY+vSBqbGk1jXpeUIGYUjnDtlr1R5UirMdqPATk6gM7X+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="372873814"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="372873814"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 13:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850759130"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="850759130"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2023 13:29:51 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYY0c-0000W6-0o;
	Tue, 22 Aug 2023 20:29:50 +0000
Date: Wed, 23 Aug 2023 04:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 14383/28543] htmldocs:
 ./include/kunit/test.h:174: warning: Function parameter or member 'debugfs'
 not described in 'kunit_suite'
Message-ID: <202308230437.I8d4wE5G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   a14f43f0b97d279d50029fba7442bb4cd393089d
commit: f6651bd242ce4de8287e499e74e9f08e52faf0a8 [14383/28543] UPSTREAM: kunit: add debugfs /sys/kernel/debug/kunit/<suite>/results display
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230437.I8d4wE5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230437.I8d4wE5G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/kunit/test.h:174: warning: Function parameter or member 'debugfs' not described in 'kunit_suite'
>> ./include/kunit/test.h:174: warning: Function parameter or member 'log' not described in 'kunit_suite'

vim +174 ./include/kunit/test.h

ff82dbcb3e2cc5 Brendan Higgins 2019-09-23 @174  

:::::: The code at line 174 was first introduced by commit
:::::: ff82dbcb3e2cc596f464302579fdf331f7422384 UPSTREAM: kunit: test: add KUnit test runner core

:::::: TO: Brendan Higgins <brendanhiggins@google.com>
:::::: CC: Alexander Potapenko <glider@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

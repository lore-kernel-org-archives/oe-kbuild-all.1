Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12557487
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 19:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680550658; x=1712086658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zCXsLB0nXEVZPhILP7zJaRe2mWZvSuIk+g7Wd/PHbWA=;
  b=dTUysIE8LFqk/WfyQ5lV08FjbgKhKdkvhflN7KZGR6yJRhoIudHUZcCE
   RIEAxp9FWybLEFPRwcu25qStYyqqGdR8tI2JHhvC9XrEF7G2DLO2HNZyC
   ln4LJ/fY7AOAtzaU8Ug8QclVqqLQJbWJjwnhJWxMj+QJK/al0M3s0Bzfm
   PVdETFQkVI7qr3lLpA7iMwQeEtf3avyg1nJZIZn+HQ7KQfAIBCj+oQ9Fj
   NOAdZsEEvn+1j88aPDdojdZyRrOe7ly0uJs9Mcn86VQcWNoVri9QTxyG8
   DC7iQaxW9xPUSkAulTunYBnRlTtC5iOfLhPGj8qPucx3+E8w4SXvKHCn8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330573130"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="330573130"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 12:37:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="679602418"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="679602418"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Apr 2023 12:37:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjPzk-000Oj0-0z;
	Mon, 03 Apr 2023 19:37:36 +0000
Date: Tue, 4 Apr 2023 03:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 13502/29445]
 mm/kasan/generic_report.c:124:6: warning: no previous declaration for
 '__asan_report_load1_noabort'
Message-ID: <202304040358.KYNZtxSi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   31b2df53e60414738b9d5b896d321fae7bbf6f9d
commit: 346ed760d42d8df8d8085de4e920060a0def1a50 [13502/29445] UPSTREAM: kasan: split out generic_report.c from report.c
config: x86_64-randconfig-a011-20230403 (https://download.01.org/0day-ci/archive/20230404/202304040358.KYNZtxSi-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.14-stable
        git checkout 346ed760d42d8df8d8085de4e920060a0def1a50
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  mm/kasan/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304040358.KYNZtxSi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/kasan/generic_report.c:124:6: warning: no previous declaration for '__asan_report_load1_noabort' [-Wmissing-declarations]
    void __asan_report_load##size##_noabort(unsigned long addr) \
         ^
   mm/kasan/generic_report.c:137:1: note: in expansion of macro 'DEFINE_ASAN_REPORT_LOAD'
    DEFINE_ASAN_REPORT_LOAD(1);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> mm/kasan/generic_report.c:124:6: warning: no previous declaration for '__asan_report_load2_noabort' [-Wmissing-declarations]
    void __asan_report_load##size##_noabort(unsigned long addr) \
         ^
   mm/kasan/generic_report.c:138:1: note: in expansion of macro 'DEFINE_ASAN_REPORT_LOAD'
    DEFINE_ASAN_REPORT_LOAD(2);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> mm/kasan/generic_report.c:124:6: warning: no previous declaration for '__asan_report_load4_noabort' [-Wmissing-declarations]
    void __asan_report_load##size##_noabort(unsigned long addr) \
         ^
   mm/kasan/generic_report.c:139:1: note: in expansion of macro 'DEFINE_ASAN_REPORT_LOAD'
    DEFINE_ASAN_REPORT_LOAD(4);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> mm/kasan/generic_report.c:124:6: warning: no previous declaration for '__asan_report_load8_noabort' [-Wmissing-declarations]
    void __asan_report_load##size##_noabort(unsigned long addr) \
         ^
   mm/kasan/generic_report.c:140:1: note: in expansion of macro 'DEFINE_ASAN_REPORT_LOAD'
    DEFINE_ASAN_REPORT_LOAD(8);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> mm/kasan/generic_report.c:124:6: warning: no previous declaration for '__asan_report_load16_noabort' [-Wmissing-declarations]
    void __asan_report_load##size##_noabort(unsigned long addr) \
         ^
   mm/kasan/generic_report.c:141:1: note: in expansion of macro 'DEFINE_ASAN_REPORT_LOAD'
    DEFINE_ASAN_REPORT_LOAD(16);
    ^~~~~~~~~~~~~~~~~~~~~~~
>> mm/kasan/generic_report.c:131:6: warning: no previous declaration for '__asan_report_store1_noabort' [-Wmissing-declarations]
    void __asan_report_store##size##_noabort(unsigned long addr) \
         ^
   mm/kasan/generic_report.c:142:1: note: in expansion of macro 'DEFINE_ASAN_REPORT_STORE'
    DEFINE_ASAN_REPORT_STORE(1);
    ^~~~~~~~~~~~~~~~~~~~~~~~
>> mm/kasan/generic_report.c:131:6: warning: no previous declaration for '__asan_report_store2_noabort' [-Wmissing-declarations]
    void __asan_report_store##size##_noabort(unsigned long addr) \
         ^
   mm/kasan/generic_report.c:143:1: note: in expansion of macro 'DEFINE_ASAN_REPORT_STORE'
    DEFINE_ASAN_REPORT_STORE(2);
    ^~~~~~~~~~~~~~~~~~~~~~~~
>> mm/kasan/generic_report.c:131:6: warning: no previous declaration for '__asan_report_store4_noabort' [-Wmissing-declarations]
    void __asan_report_store##size##_noabort(unsigned long addr) \
         ^
   mm/kasan/generic_report.c:144:1: note: in expansion of macro 'DEFINE_ASAN_REPORT_STORE'
    DEFINE_ASAN_REPORT_STORE(4);
    ^~~~~~~~~~~~~~~~~~~~~~~~
>> mm/kasan/generic_report.c:131:6: warning: no previous declaration for '__asan_report_store8_noabort' [-Wmissing-declarations]
    void __asan_report_store##size##_noabort(unsigned long addr) \
         ^
   mm/kasan/generic_report.c:145:1: note: in expansion of macro 'DEFINE_ASAN_REPORT_STORE'
    DEFINE_ASAN_REPORT_STORE(8);
    ^~~~~~~~~~~~~~~~~~~~~~~~
>> mm/kasan/generic_report.c:131:6: warning: no previous declaration for '__asan_report_store16_noabort' [-Wmissing-declarations]
    void __asan_report_store##size##_noabort(unsigned long addr) \
         ^
   mm/kasan/generic_report.c:146:1: note: in expansion of macro 'DEFINE_ASAN_REPORT_STORE'
    DEFINE_ASAN_REPORT_STORE(16);
    ^~~~~~~~~~~~~~~~~~~~~~~~
>> mm/kasan/generic_report.c:148:6: warning: no previous declaration for '__asan_report_load_n_noabort' [-Wmissing-declarations]
    void __asan_report_load_n_noabort(unsigned long addr, size_t size)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/kasan/generic_report.c:154:6: warning: no previous declaration for '__asan_report_store_n_noabort' [-Wmissing-declarations]
    void __asan_report_store_n_noabort(unsigned long addr, size_t size)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__asan_report_load1_noabort +124 mm/kasan/generic_report.c

   122	
   123	#define DEFINE_ASAN_REPORT_LOAD(size)                     \
 > 124	void __asan_report_load##size##_noabort(unsigned long addr) \
   125	{                                                         \
   126		kasan_report(addr, size, false, _RET_IP_);	  \
   127	}                                                         \
   128	EXPORT_SYMBOL(__asan_report_load##size##_noabort)
   129	
   130	#define DEFINE_ASAN_REPORT_STORE(size)                     \
 > 131	void __asan_report_store##size##_noabort(unsigned long addr) \
   132	{                                                          \
   133		kasan_report(addr, size, true, _RET_IP_);	   \
   134	}                                                          \
   135	EXPORT_SYMBOL(__asan_report_store##size##_noabort)
   136	
 > 137	DEFINE_ASAN_REPORT_LOAD(1);
 > 138	DEFINE_ASAN_REPORT_LOAD(2);
 > 139	DEFINE_ASAN_REPORT_LOAD(4);
 > 140	DEFINE_ASAN_REPORT_LOAD(8);
 > 141	DEFINE_ASAN_REPORT_LOAD(16);
 > 142	DEFINE_ASAN_REPORT_STORE(1);
 > 143	DEFINE_ASAN_REPORT_STORE(2);
 > 144	DEFINE_ASAN_REPORT_STORE(4);
 > 145	DEFINE_ASAN_REPORT_STORE(8);
   146	DEFINE_ASAN_REPORT_STORE(16);
   147	
 > 148	void __asan_report_load_n_noabort(unsigned long addr, size_t size)
   149	{
   150		kasan_report(addr, size, false, _RET_IP_);
   151	}
   152	EXPORT_SYMBOL(__asan_report_load_n_noabort);
   153	
 > 154	void __asan_report_store_n_noabort(unsigned long addr, size_t size)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

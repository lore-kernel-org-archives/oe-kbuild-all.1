Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187CD1640D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688138614; x=1719674614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2FGcoLcB0slgrvDoXdrDq4sUuMd1o8M8v5NX+f67ANc=;
  b=T0KHQtOb7lH8du4T63xaVy2rV/YiHToUlgDM7jBRJkj3cCu+TV+rA3Pq
   t78G3BrVLmWFgFZxYtqXvMvY6H4ql0EOIaGc8e7AMbKULuOmuojpFMfMK
   pM0Kfeai04gNQBO/hdrlOMvGWj3QAu7Dj+UkU1Qf7Mds8vqCMTtPBBBqJ
   1jP0B/Zy0o88P48lcZ7PbDUoH+lKIYzMU2/BQK9pY8QDMzpfqd9Y9VpJ7
   2REj70huj2vC1yizRkpnnoj5g3KEFmEXVqFv40hB5awyDbXUi+qXehY/Z
   7LQVY4uA9mXM7rPyLcwmcEZkewRL5yLD3v4IZIBW1j2HZvwJrR6E4tZTR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="342002490"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="342002490"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 08:23:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="711849220"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="711849220"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Jun 2023 08:23:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFFy6-000F4n-2z;
	Fri, 30 Jun 2023 15:23:30 +0000
Date: Fri, 30 Jun 2023 23:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 13502/29940]
 mm/kasan/generic_report.c:124:6: warning: no previous declaration for
 '__asan_report_load1_noabort'
Message-ID: <202306302313.G0lt8Ale-lkp@intel.com>
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
head:   e8c1340cbb0f24693dd9056f8d5a7808e4597b80
commit: 346ed760d42d8df8d8085de4e920060a0def1a50 [13502/29940] UPSTREAM: kasan: split out generic_report.c from report.c
config: x86_64-buildonly-randconfig-r002-20230629 (https://download.01.org/0day-ci/archive/20230630/202306302313.G0lt8Ale-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302313.G0lt8Ale-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302313.G0lt8Ale-lkp@intel.com/

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
   137	DEFINE_ASAN_REPORT_LOAD(1);
   138	DEFINE_ASAN_REPORT_LOAD(2);
   139	DEFINE_ASAN_REPORT_LOAD(4);
   140	DEFINE_ASAN_REPORT_LOAD(8);
   141	DEFINE_ASAN_REPORT_LOAD(16);
   142	DEFINE_ASAN_REPORT_STORE(1);
   143	DEFINE_ASAN_REPORT_STORE(2);
   144	DEFINE_ASAN_REPORT_STORE(4);
   145	DEFINE_ASAN_REPORT_STORE(8);
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
https://github.com/intel/lkp-tests/wiki

Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B85D192
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 20:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674938514; x=1706474514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ux4Q2OqKN32Ds1Z30f0GkUl/VAl2jpTN0mygapSEqQo=;
  b=Sq5Rxg4Gvp7pLaSI4YCO0eE+RSDsvv/Psp12DSTIa2AqHWP93IBtcfAE
   Yq0xEeIWoQ68/a+kSVs3srcO4XuDzEQOnqZQwVEkAXaBz27Gk/vVOLozT
   w6SRSlEYsNBDGJHsqe2zjnHVer1FMinHwJgf2jaGVP+I9sQ79fFzQEu7a
   /pPjddBHKN4FZlU14yFU6ojwEX1vvm/xooC4GWIJoDXHR49q2r7Y2wbk5
   HIGrlHyZyoThA3XFciBprDreQOhXxgFAIOpQoLripyNIHjYLX5m6Ss9Cz
   CJfBYlbwHHQ9bsQJRLudt8lXYDP8FH9LgOO1NehxQZZTXKKZV6DDwdqsZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="389712844"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="389712844"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 12:41:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="727054068"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="727054068"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jan 2023 12:41:52 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLs1H-00015m-0X;
	Sat, 28 Jan 2023 20:41:51 +0000
Date: Sun, 29 Jan 2023 04:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [arm64:for-next/ftrace 3/9] include/acpi/actypes.h:525:42: warning:
 'strncpy' specified bound 4 equals destination size
Message-ID: <202301290447.73zqgHrD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/ftrace
head:   dc4824faa265db1bc93449e8ec386a0245404fa6
commit: 8f9e0a52810dd83406c768972d022c37e7a18f1f [3/9] ACPI: Don't build ACPICA with '-Os'
config: ia64-gensparse_defconfig (https://download.01.org/0day-ci/archive/20230129/202301290447.73zqgHrD-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=8f9e0a52810dd83406c768972d022c37e7a18f1f
        git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
        git fetch --no-tags arm64 for-next/ftrace
        git checkout 8f9e0a52810dd83406c768972d022c37e7a18f1f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/acpi/acpica/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/acpi/acpi.h:24,
                    from drivers/acpi/acpica/tbfind.c:10:
   drivers/acpi/acpica/tbfind.c: In function 'acpi_tb_find_table':
>> include/acpi/actypes.h:525:42: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
     525 | #define ACPI_COPY_NAMESEG(dest,src)     (strncpy (ACPI_CAST_PTR (char, (dest)), ACPI_CAST_PTR (char, (src)), ACPI_NAMESEG_SIZE))
         |                                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/tbfind.c:59:9: note: in expansion of macro 'ACPI_COPY_NAMESEG'
      59 |         ACPI_COPY_NAMESEG(header.signature, signature);
         |         ^~~~~~~~~~~~~~~~~
--
   In file included from include/acpi/acpi.h:24,
                    from drivers/acpi/acpica/utstring.c:8:
   drivers/acpi/acpica/utstring.c: In function 'acpi_ut_repair_name':
>> include/acpi/actypes.h:525:42: warning: 'strncpy' specified bound 4 equals destination size [-Wstringop-truncation]
     525 | #define ACPI_COPY_NAMESEG(dest,src)     (strncpy (ACPI_CAST_PTR (char, (dest)), ACPI_CAST_PTR (char, (src)), ACPI_NAMESEG_SIZE))
         |                                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/utstring.c:148:9: note: in expansion of macro 'ACPI_COPY_NAMESEG'
     148 |         ACPI_COPY_NAMESEG(&original_name, &name[0]);
         |         ^~~~~~~~~~~~~~~~~


vim +/strncpy +525 include/acpi/actypes.h

ff60027174cf94 Bob Moore 2012-10-31  519  
50df4d8b0f6e19 Bob Moore 2008-12-31  520  #ifndef ACPI_MISALIGNMENT_NOT_SUPPORTED
5599fb69355d7a Bob Moore 2019-04-08  521  #define ACPI_COMPARE_NAMESEG(a,b)       (*ACPI_CAST_PTR (u32, (a)) == *ACPI_CAST_PTR (u32, (b)))
a3ce7a8e0dd9ba Bob Moore 2019-04-08  522  #define ACPI_COPY_NAMESEG(dest,src)     (*ACPI_CAST_PTR (u32, (dest)) = *ACPI_CAST_PTR (u32, (src)))
50df4d8b0f6e19 Bob Moore 2008-12-31  523  #else
3278675567dfb9 Bob Moore 2019-04-08  524  #define ACPI_COMPARE_NAMESEG(a,b)       (!strncmp (ACPI_CAST_PTR (char, (a)), ACPI_CAST_PTR (char, (b)), ACPI_NAMESEG_SIZE))
3278675567dfb9 Bob Moore 2019-04-08 @525  #define ACPI_COPY_NAMESEG(dest,src)     (strncpy (ACPI_CAST_PTR (char, (dest)), ACPI_CAST_PTR (char, (src)), ACPI_NAMESEG_SIZE))
50df4d8b0f6e19 Bob Moore 2008-12-31  526  #endif
50df4d8b0f6e19 Bob Moore 2008-12-31  527  

:::::: The code at line 525 was first introduced by commit
:::::: 3278675567dfb901d831d46849c386a4f932905e ACPICA: Rename nameseg length macro/define for clarity

:::::: TO: Bob Moore <robert.moore@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

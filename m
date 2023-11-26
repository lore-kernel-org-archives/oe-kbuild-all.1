Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8F316411
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 23:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGpvng5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701041538; x=1732577538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2pVui+G9I/dffJqDuKsaP1MiEfJpPg3IlDWkIoq+PmI=;
  b=EGpvng5QfitN3nOSC/+4qjJ7kKsuvm09KWWOSQ5POBCDvjAT/KJiVrDX
   NVj6wePwInv63Y+weMSLBTMFgbaUlghgkjwJxqhCrpB/4L7klL4SsGyii
   YuD76ZkjabHJ34GlbyH3m8xD+43iGKtzpqyXp7PgUhJ3KorJX3lrhEyaq
   +9wHSdexiGe4hRM7NyBRPVfgYhIw7AZSxTd0zAE5TNFdMrtLn4SyI7C7V
   D4DON/xsOoqFCuj9TFLtZPM4r2Xme/BmSbs+dphpqWoH5hSguSwWQdhMx
   7LQMEVICKHH9YptTSX0hCEHLiYpQu8nq4l1HTX2Cg0WZKaFvnTwjr5W+b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="372768302"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="372768302"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 15:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="858862269"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="858862269"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Nov 2023 15:32:17 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Obm-0005cw-1B;
	Sun, 26 Nov 2023 23:32:14 +0000
Date: Mon, 27 Nov 2023 07:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_bit 14/34] include/linux/find.h:859:9: warning:
 statement with no effect
Message-ID: <202311270643.5nYR7aHv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_bit
head:   0509c68d320cff2284c7fc39d37051e465c429ec
commit: 82d8aa9f9c50fa8c7049ba295a413770eefb41c1 [14/34] scsi: core: XXXX use atomic find_bit() API where appropriate
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231127/202311270643.5nYR7aHv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311270643.5nYR7aHv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270643.5nYR7aHv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:10,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/mempool.h:8,
                    from include/linux/bio.h:8,
                    from drivers/scsi/scsi_lib.c:12:
   drivers/scsi/scsi_lib.c: In function 'scsi_evt_thread':
>> include/linux/find.h:859:9: warning: statement with no effect [-Wunused-value]
     859 |         for ((bit); \
         |         ^~~
   drivers/scsi/scsi_lib.c:2502:9: note: in expansion of macro 'for_each_test_and_clear_bit_from'
    2502 |         for_each_test_and_clear_bit_from(evt_type, sdev->pending_events, SDEV_EVT_LAST + 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +859 include/linux/find.h

6b8ecb84f8f640 include/asm-generic/bitops/find.h Yury Norov         2021-08-14  828  
bc9d6635c293a2 include/linux/find.h              Yury Norov         2021-08-14  829  #define for_each_set_bit(bit, addr, size) \
fdae96a3fc7f70 include/linux/find.h              Yury Norov         2022-09-19  830  	for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
bc9d6635c293a2 include/linux/find.h              Yury Norov         2021-08-14  831  
33e67710beda78 include/linux/find.h              Yury Norov         2022-09-19  832  #define for_each_and_bit(bit, addr1, addr2, size) \
fdae96a3fc7f70 include/linux/find.h              Yury Norov         2022-09-19  833  	for ((bit) = 0;									\
fdae96a3fc7f70 include/linux/find.h              Yury Norov         2022-09-19  834  	     (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
fdae96a3fc7f70 include/linux/find.h              Yury Norov         2022-09-19  835  	     (bit)++)
33e67710beda78 include/linux/find.h              Yury Norov         2022-09-19  836  
5f75ff295c662c include/linux/find.h              Valentin Schneider 2022-10-03  837  #define for_each_andnot_bit(bit, addr1, addr2, size) \
5f75ff295c662c include/linux/find.h              Valentin Schneider 2022-10-03  838  	for ((bit) = 0;									\
5f75ff295c662c include/linux/find.h              Valentin Schneider 2022-10-03  839  	     (bit) = find_next_andnot_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
5f75ff295c662c include/linux/find.h              Valentin Schneider 2022-10-03  840  	     (bit)++)
5f75ff295c662c include/linux/find.h              Valentin Schneider 2022-10-03  841  
1470afefc3c42d include/linux/find.h              Dave Chinner       2023-03-15  842  #define for_each_or_bit(bit, addr1, addr2, size) \
1470afefc3c42d include/linux/find.h              Dave Chinner       2023-03-15  843  	for ((bit) = 0;									\
1470afefc3c42d include/linux/find.h              Dave Chinner       2023-03-15  844  	     (bit) = find_next_or_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
1470afefc3c42d include/linux/find.h              Dave Chinner       2023-03-15  845  	     (bit)++)
1470afefc3c42d include/linux/find.h              Dave Chinner       2023-03-15  846  
bc9d6635c293a2 include/linux/find.h              Yury Norov         2021-08-14  847  /* same as for_each_set_bit() but use bit as value to start with */
bc9d6635c293a2 include/linux/find.h              Yury Norov         2021-08-14  848  #define for_each_set_bit_from(bit, addr, size) \
fdae96a3fc7f70 include/linux/find.h              Yury Norov         2022-09-19  849  	for (; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
bc9d6635c293a2 include/linux/find.h              Yury Norov         2021-08-14  850  
190bed278d94d3 include/linux/find.h              Yury Norov         2023-11-18  851  /* same as for_each_set_bit() but atomically clears each found bit */
190bed278d94d3 include/linux/find.h              Yury Norov         2023-11-18  852  #define for_each_test_and_clear_bit(bit, addr, size) \
190bed278d94d3 include/linux/find.h              Yury Norov         2023-11-18  853  	for ((bit) = 0; \
190bed278d94d3 include/linux/find.h              Yury Norov         2023-11-18  854  	     (bit) = find_and_clear_next_bit((addr), (size), (bit)), (bit) < (size); \
190bed278d94d3 include/linux/find.h              Yury Norov         2023-11-18  855  	     (bit)++)
190bed278d94d3 include/linux/find.h              Yury Norov         2023-11-18  856  
190bed278d94d3 include/linux/find.h              Yury Norov         2023-11-18  857  /* same as for_each_set_bit_from() but atomically clears each found bit */
190bed278d94d3 include/linux/find.h              Yury Norov         2023-11-18  858  #define for_each_test_and_clear_bit_from(bit, addr, size) \
190bed278d94d3 include/linux/find.h              Yury Norov         2023-11-18 @859  	for ((bit); \
190bed278d94d3 include/linux/find.h              Yury Norov         2023-11-18  860  	     (bit) = find_and_clear_next_bit((addr), (size), (bit)), (bit) < (size); \
190bed278d94d3 include/linux/find.h              Yury Norov         2023-11-18  861  	     (bit)++)
190bed278d94d3 include/linux/find.h              Yury Norov         2023-11-18  862  

:::::: The code at line 859 was first introduced by commit
:::::: 190bed278d94d37755ff6c1a6096536ff0c72e93 lib/find: add atomic find_bit() primitives

:::::: TO: Yury Norov <yury.norov@gmail.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390F765B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 18:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690828573; x=1722364573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NuhIh4kCgSCKPiPqU9qlHC0Afucoxcx5HfP4lJvb6t0=;
  b=GwdNFLUir/39RlC9mPrBUST1XE3iapsAIhdhJ3YIDDt5XMO1xLVo7i5u
   UaE7ZoRCx2ZD00Ll6lDDD/wgj+kRWRohEs0fBqdVGDsf6LU2qKOQ5m3rf
   HCrA2UwYIaO83Nfl7FuzDNFbK8BFa1m2zyMQGz+VKTu4UekIxyew24Y8i
   bSa/MkrW9znQVzCLq19TYwHwMyuboHfvHsEYdCS6O38khUFY/L6II/XrU
   dei0azIXB7chV4EzQV8bOSMZxzwPWmQMpgfCoCkPBhQa4BAlg/qNdrbI/
   +Q6479oGcNmoU2pRfm5lg3i5yZwFvegaFo5djS/S10xBBQOnr/XNlMAv0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="455474764"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="455474764"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 11:36:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="731672633"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="731672633"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 31 Jul 2023 11:36:09 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQXkV-0005IB-2y;
	Mon, 31 Jul 2023 18:36:08 +0000
Date: Tue, 1 Aug 2023 02:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 1/38] include/linux/minmax.h:225:15:
 error: unknown type name 'bool'
Message-ID: <202308010237.sblMsDzc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   ff0989edbd50c98f920d5ab686a71274298fdd76
commit: 6b22a4428744c9c00665e8ff9a903abb020e8330 [1/38] minmax: Add in_range() macro
config: s390-randconfig-r044-20230731 (https://download.01.org/0day-ci/archive/20230801/202308010237.sblMsDzc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010237.sblMsDzc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010237.sblMsDzc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/ipl_vmparm.c:2:
>> include/linux/minmax.h:225:15: error: unknown type name 'bool'
     225 | static inline bool in_range64(u64 val, u64 start, u64 len)
         |               ^
>> include/linux/minmax.h:225:31: error: unknown type name 'u64'
     225 | static inline bool in_range64(u64 val, u64 start, u64 len)
         |                               ^
   include/linux/minmax.h:225:40: error: unknown type name 'u64'
     225 | static inline bool in_range64(u64 val, u64 start, u64 len)
         |                                        ^
   include/linux/minmax.h:225:51: error: unknown type name 'u64'
     225 | static inline bool in_range64(u64 val, u64 start, u64 len)
         |                                                   ^
   include/linux/minmax.h:230:15: error: unknown type name 'bool'
     230 | static inline bool in_range32(u32 val, u32 start, u32 len)
         |               ^
>> include/linux/minmax.h:230:31: error: unknown type name 'u32'
     230 | static inline bool in_range32(u32 val, u32 start, u32 len)
         |                               ^
   include/linux/minmax.h:230:40: error: unknown type name 'u32'
     230 | static inline bool in_range32(u32 val, u32 start, u32 len)
         |                                        ^
   include/linux/minmax.h:230:51: error: unknown type name 'u32'
     230 | static inline bool in_range32(u32 val, u32 start, u32 len)
         |                                                   ^
   8 errors generated.


vim +/bool +225 include/linux/minmax.h

   224	
 > 225	static inline bool in_range64(u64 val, u64 start, u64 len)
   226	{
   227		return (val - start) < len;
   228	}
   229	
 > 230	static inline bool in_range32(u32 val, u32 start, u32 len)
   231	{
   232		return (val - start) < len;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

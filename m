Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0954C19BD5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 19:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690831740; x=1722367740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RLsH1lfSyIcL0d3z+e5kDXdxzGsJtZa4o/78Wdo65So=;
  b=Ag2NN6cc9GTNYkrVH7kws2JGbYyWliEmc/yyvitzpwIQ25JP9Jk0XL6Z
   r+da8HYoIM1IOPpbWyNPSQe1AQvfcqqBaoh1CtYW+mLk5VbA19jjz/mAG
   HHTDfT+UzI1P8JZ5do2+kcudffDxgGAMBqutuGgOh3OoYvaikw3ioZ+NH
   2WjgDAoS61HHNyfhaUrqihmhYo/XQ7n1txbC1aw9IdDsqoxX80kt7r6tu
   4Ad9WfPIacZSgdmLa4jnrHdz7wjh0exvO6GU7KQGP1uezuppDmkZWwU47
   mHLLZYcKQlu9vG80HmzMPeOqGNinzKsgpV65xSX26BI6aH60Q1zqXCDjx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="349407091"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="349407091"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 12:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="852161224"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="852161224"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Jul 2023 12:28:57 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQYZd-0005JL-04;
	Mon, 31 Jul 2023 19:28:57 +0000
Date: Tue, 1 Aug 2023 03:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 1/38] include/linux/minmax.h:225:15:
 error: unknown type name 'bool'
Message-ID: <202308010350.twdXazyI-lkp@intel.com>
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
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230801/202308010350.twdXazyI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010350.twdXazyI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010350.twdXazyI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/ipl_vmparm.c:2:
>> include/linux/minmax.h:225:15: error: unknown type name 'bool'
     225 | static inline bool in_range64(u64 val, u64 start, u64 len)
         |               ^~~~
>> include/linux/minmax.h:225:31: error: unknown type name 'u64'
     225 | static inline bool in_range64(u64 val, u64 start, u64 len)
         |                               ^~~
   include/linux/minmax.h:225:40: error: unknown type name 'u64'
     225 | static inline bool in_range64(u64 val, u64 start, u64 len)
         |                                        ^~~
   include/linux/minmax.h:225:51: error: unknown type name 'u64'
     225 | static inline bool in_range64(u64 val, u64 start, u64 len)
         |                                                   ^~~
   include/linux/minmax.h:230:15: error: unknown type name 'bool'
     230 | static inline bool in_range32(u32 val, u32 start, u32 len)
         |               ^~~~
>> include/linux/minmax.h:230:31: error: unknown type name 'u32'
     230 | static inline bool in_range32(u32 val, u32 start, u32 len)
         |                               ^~~
   include/linux/minmax.h:230:40: error: unknown type name 'u32'
     230 | static inline bool in_range32(u32 val, u32 start, u32 len)
         |                                        ^~~
   include/linux/minmax.h:230:51: error: unknown type name 'u32'
     230 | static inline bool in_range32(u32 val, u32 start, u32 len)
         |                                                   ^~~


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

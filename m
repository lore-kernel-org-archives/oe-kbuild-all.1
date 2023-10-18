Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8521B20303
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1IVM5ZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697633691; x=1729169691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oerk8Mm7Nf2WIenQDUI5iAbciJ904lD1Am0y6AUFDMg=;
  b=C1IVM5ZAH1lNldTIirEVMBQxn4hePTlk13YzvBBhr6GUxO3YGVs0wpDu
   idDJCWXI54m5cvTdyuoerQkc2Zaq3JTnWNBZm4MIog13qB2ylrXBzPdpD
   3lumfM3zIPoHn297y1k2k1MvhADUDFdnWxfC2ck2uYYB0fnO9Vxl7fDjK
   Zrb8RSlCieJON/kL0NeQ/M9MTtaOV6tlxE5edZ3yMbHuwsyRWvrjZkqiM
   IeAZhPsqOWsNLp0ei8HLRPcAb+3gL6BsqkbKOhuqdts8FcXrRYo4Ps6Si
   B9cFWIZMtc1IcjbV0naZMJqU9T7P4+/sN80Vb1jg0tsnrR51D3fJ1f6o0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="385838929"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="385838929"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 05:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="873017549"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="873017549"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2023 05:54:49 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt64V-0000NU-2m;
	Wed, 18 Oct 2023 12:54:47 +0000
Date: Wed, 18 Oct 2023 20:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:unload-bitmap 6/8] include/linux/bitmap.h:613:25: warning:
 array subscript 0 is outside array bounds of 'const long unsigned int[0]'
Message-ID: <202310182030.NH54Diui-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux unload-bitmap
head:   d12b2cd2f2cace0c68638a2c474e4d0a32b533e5
commit: fe8066a1c1d802a28b2a805e80e908daea9a6ffe [6/8] lib/bitmap: add bitmap_{read,write}()
config: i386-randconfig-002-20231018 (https://download.01.org/0day-ci/archive/20231018/202310182030.NH54Diui-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310182030.NH54Diui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310182030.NH54Diui-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/test_bitmap.c:8:
   In function 'bitmap_write',
       inlined from 'test_bitmap_read_write' at lib/test_bitmap.c:1312:2:
   include/linux/bitmap.h:666:12: warning: array subscript 0 is outside array bounds of 'long unsigned int[0]' [-Warray-bounds]
     666 |         map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
         |         ~~~^~~~~~~~~~~
   include/linux/bitmap.h:666:24: warning: array subscript 0 is outside array bounds of 'long unsigned int[0]' [-Warray-bounds]
     666 |         map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
         |                        ^~
   include/linux/bitmap.h:667:12: warning: array subscript 0 is outside array bounds of 'long unsigned int[0]' [-Warray-bounds]
     667 |         map[index + 1] |= (value >> space);
         |         ~~~^~~~~~~~~~~
   In function 'bitmap_read',
       inlined from 'test_bitmap_read_write' at lib/test_bitmap.c:1314:2:
>> include/linux/bitmap.h:613:25: warning: array subscript 0 is outside array bounds of 'const long unsigned int[0]' [-Warray-bounds]
     613 |         value_high = map[index + 1] & BITMAP_LAST_WORD_MASK(start + nbits);
         |                      ~~~^~~~~~~~~~~


vim +613 include/linux/bitmap.h

   589	
   590	/**
   591	 * bitmap_read - read a value of n-bits from the memory region
   592	 * @map: address to the bitmap memory region
   593	 * @start: bit offset of the n-bit value
   594	 * @nbits: size of value in bits, nonzero, up to BITS_PER_LONG
   595	 *
   596	 * Returns: value of nbits located at the @start bit offset within the @map
   597	 * memory region.
   598	 */
   599	static inline unsigned long bitmap_read(const unsigned long *map,
   600						unsigned long start,
   601						unsigned long nbits)
   602	{
   603		size_t index = BIT_WORD(start);
   604		unsigned long offset = start % BITS_PER_LONG;
   605		unsigned long space = BITS_PER_LONG - offset;
   606		unsigned long value_low, value_high;
   607	
   608		if (unlikely(!nbits))
   609			return 0;
   610		if (space >= nbits)
   611			return (map[index] >> offset) & GENMASK(nbits - 1, 0);
   612		value_low = map[index] & BITMAP_FIRST_WORD_MASK(start);
 > 613		value_high = map[index + 1] & BITMAP_LAST_WORD_MASK(start + nbits);
   614		return (value_low >> offset) | (value_high << space);
   615	}
   616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

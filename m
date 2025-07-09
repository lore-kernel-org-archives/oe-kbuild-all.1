Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277B4E55B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 21:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752095843; cv=none; b=qDwaTbJeFnKq3RT3EKcNoJlte9mRmDwt6Yg6AXJQD62iWoApVtkAzvLWoRBrgQxw3HpKSTtrbUjbcZ5Q0nbSetn+F55ZlKx0FlDg6OFGuwLraglkk89rE2GWrsKE62U1ozFfaabEdtBJPTc3iIk/Ic9LQGfiGH0kf2r6TM5dx4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752095843; c=relaxed/simple;
	bh=OfcllI6qD4FosYIYq1Mr0wPjCOJDGXlJWgWfu538IIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W4ddc5u1mlTUX4v8cTaEBvElWinewXIJ6IZ+dY9vnRvC+D9aETmOXhjl2ALTdwQBtMGv2/aY2Cz+Ad3vkCS4FPj6ZQfvFkt+zCs1MdIA1S0/xd9b+PaPnZyhLJ9x1pz5k/oVou6luVm0FhE5vfcNSck85ohjRG2PMzzJwRSvw6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQ+Bv5Ry; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQ+Bv5Ry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752095842; x=1783631842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OfcllI6qD4FosYIYq1Mr0wPjCOJDGXlJWgWfu538IIs=;
  b=fQ+Bv5RyT8B62M7aa1PKRxzAaOWJ+huocSZ6TdzuAjfc+Wkt7pCRSwe0
   xBf+2RGc7jt/oKuujBgIUXI8QyPOhIjKdK+6HtF+vdwoOUn27Tobh8T0n
   3fIyeCNopTC/Go/weVwGhGSHfppuqwPxjhLfXrY+2+DF6g7txDJlup0i0
   +x+Ig4GxITl/HOET8CjVNlbUOwNEXFYF1DVhAVJ0q+f9kllV9PixHzzv5
   OSJAuMRG5FwS4GJX3ZC3qT0ENsentb9QEkNTLozNG41xSFP/rdzvUgEWZ
   WcvuOZt2C8B9t9gfIiYho1lkRvdOjZ2mER+suXq7woXRtBhF9hG4/EdTv
   A==;
X-CSE-ConnectionGUID: 5OHfPNamSTqh4X6GyQrdqQ==
X-CSE-MsgGUID: ArUEmjb4QOeyzzJxjTyXbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54244136"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="54244136"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 14:17:22 -0700
X-CSE-ConnectionGUID: dD4sOuCeRe2Egt8Vl/nI7A==
X-CSE-MsgGUID: dCLJyll8Sauum3ceH84O3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="161439340"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jul 2025 14:17:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZcAI-000455-2G;
	Wed, 09 Jul 2025 21:17:18 +0000
Date: Thu, 10 Jul 2025 05:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:fnb 25/37] lib/bitmap.c:368:9: error: use of undeclared
 identifier 'idx'
Message-ID: <202507100521.AoBNWzpI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux fnb
head:   a635ed151da7cfe3cd34c2d140ec95f0da02aefb
commit: cc6b32828a72d77c81113b9729a9e5c4fdf67464 [25/37] bitmap: add bitmap_weight_from()
config: s390-randconfig-002-20250710 (https://download.01.org/0day-ci/archive/20250710/202507100521.AoBNWzpI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100521.AoBNWzpI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507100521.AoBNWzpI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/bitmap.c:368:9: error: use of undeclared identifier 'idx'
     368 |         return BITMAP_WEIGHT_FROM(bitmap[idx], start, bits);
         |                ^
   lib/bitmap.c:346:2: note: expanded from macro 'BITMAP_WEIGHT_FROM'
     346 |         idx = __start / BITS_PER_LONG;                                          \
         |         ^
   lib/bitmap.c:368:35: error: use of undeclared identifier 'idx'
     368 |         return BITMAP_WEIGHT_FROM(bitmap[idx], start, bits);
         |                                          ^
>> lib/bitmap.c:368:9: error: use of undeclared identifier 'idx'
     368 |         return BITMAP_WEIGHT_FROM(bitmap[idx], start, bits);
         |                ^
   lib/bitmap.c:349:9: note: expanded from macro 'BITMAP_WEIGHT_FROM'
     349 |         for (++idx; idx < __bits / BITS_PER_LONG; idx++)                        \
         |                ^
>> lib/bitmap.c:368:9: error: use of undeclared identifier 'idx'
   lib/bitmap.c:349:14: note: expanded from macro 'BITMAP_WEIGHT_FROM'
     349 |         for (++idx; idx < __bits / BITS_PER_LONG; idx++)                        \
         |                     ^
>> lib/bitmap.c:368:9: error: use of undeclared identifier 'idx'
   lib/bitmap.c:349:44: note: expanded from macro 'BITMAP_WEIGHT_FROM'
     349 |         for (++idx; idx < __bits / BITS_PER_LONG; idx++)                        \
         |                                                   ^
   lib/bitmap.c:368:35: error: use of undeclared identifier 'idx'
     368 |         return BITMAP_WEIGHT_FROM(bitmap[idx], start, bits);
         |                                          ^
   lib/bitmap.c:368:35: error: use of undeclared identifier 'idx'
   7 errors generated.


vim +/idx +368 lib/bitmap.c

   364	
   365	unsigned int __bitmap_weight_from(const unsigned long *bitmap,
   366						unsigned int start, unsigned int bits)
   367	{
 > 368		return BITMAP_WEIGHT_FROM(bitmap[idx], start, bits);
   369	}
   370	EXPORT_SYMBOL(__bitmap_weight_from);
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

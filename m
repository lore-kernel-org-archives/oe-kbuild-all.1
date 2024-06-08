Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1D41862
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717876161; cv=none; b=ugxBfyiSE4CCFPyIX/HgXwinJu4eD7Rzth1xJf5gNaMlL0e2VY+o/iwqzW/djiXmDTSQtT8ekxokNZS65Y3zbbUHQUwvKGDyZ2eLHMLDH5n76V4cQ/3HoC2dwluSXyKnpCqnE7gKF7zRDE812NDgjz8gOquJ3pU5niDQbum/+Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717876161; c=relaxed/simple;
	bh=BjZNtcsxevb20zbaqs83yyboCbNhu31qYt/0angYeBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SeTQiR/6WJRmQnAT9gKIIJ2JR1n5WBcwCKymqLzKkAjoVUBwix/QQXIASBI9i0s49CWe1YL8rU7U4jVWVei3J7qYN8mYKElGOB3YQhwhUnldvhxAxtyHG4s6S7EK9mOq2YQWGH8VSgPGGMyNRx9FOEVIqC+J+cM92QlePNgQHjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mv4X4/+i; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mv4X4/+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717876160; x=1749412160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BjZNtcsxevb20zbaqs83yyboCbNhu31qYt/0angYeBw=;
  b=mv4X4/+igSibnEaH9KnSv8fzy6rtMAvtLzbR6M+8VqwY4e7qgDNS3aNb
   UKWWcCsV4AoC2d/Plq5+JGWPZCFPTO5d+PJugRmJ3Q0JXGbEGPlPcI4Z1
   8gnfD3VNlBOxcn9iV3vsOB+X+tMOg5BrWD4TmFPw7Kh1ZZoePcOu88ADc
   fBB9hcq75IM0dpt4rHy107NQnlcvy2gloN3fiNRo968uvSRzuIQvA29zX
   hrCO6F6zY9vxenNlc+FGFG6Fd4wUW/3xtrfcCo+sW3YKaPmmdz4XjFtlg
   UOd56ZPZnIUVqF+C+aBVdDH0A7MMe3idnegUIAOE03A2tTKmnfbP/YcUs
   Q==;
X-CSE-ConnectionGUID: H7oFYpACSSKQ1yNjV5OoNg==
X-CSE-MsgGUID: nE1BEsT3TPqGZsYWtZ8Yaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14736207"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14736207"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 12:49:20 -0700
X-CSE-ConnectionGUID: bNspFrSWT5aXGpbprvTzwQ==
X-CSE-MsgGUID: 0L5Vg6IPT3i612WkuRYqdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="43583411"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Jun 2024 12:49:18 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG23w-0000OX-1t;
	Sat, 08 Jun 2024 19:49:16 +0000
Date: Sun, 9 Jun 2024 03:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find-and-bit-v6 3/43] include/linux/find.h:6:2: error: #error
 only <linux/bitmap.h> can be included directly
Message-ID: <202406090347.zKSwsWTp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find-and-bit-v6
head:   d9a04b83dde4d5c4da8cca244b425b908e1975ce
commit: 8b9df66c755f6227e2e17560a639e93716ada2cd [3/43] lib/find: add atomic find_bit() primitives
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240609/202406090347.zKSwsWTp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090347.zKSwsWTp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090347.zKSwsWTp-lkp@intel.com/

Note: the norov/find-and-bit-v6 HEAD d9a04b83dde4d5c4da8cca244b425b908e1975ce builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from lib/find_bit.c:16:
>> include/linux/find.h:6:2: error: #error only <linux/bitmap.h> can be included directly
       6 | #error only <linux/bitmap.h> can be included directly
         |  ^~~~~
   lib/find_bit.c: In function '_find_and_set_next_bit':
   lib/find_bit.c:58:22: error: implicit declaration of function 'BITMAP_FIRST_WORD_MASK' [-Werror=implicit-function-declaration]
      58 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   lib/find_bit.c:152:23: note: in expansion of macro 'FIND_NEXT_BIT'
     152 |                 bit = FIND_NEXT_BIT(~addr[idx], /* nop */, nbits, start);
         |                       ^~~~~~~~~~~~~
   lib/find_bit.c: In function '__find_nth_bit':
   lib/find_bit.c:89:33: error: implicit declaration of function 'BITMAP_LAST_WORD_MASK' [-Werror=implicit-function-declaration]
      89 |                 tmp = (FETCH) & BITMAP_LAST_WORD_MASK(sz);                      \
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   lib/find_bit.c:238:16: note: in expansion of macro 'FIND_NTH_BIT'
     238 |         return FIND_NTH_BIT(addr[idx], size, n);
         |                ^~~~~~~~~~~~
   lib/find_bit.c: In function 'find_next_clump8':
   lib/find_bit.c:329:18: error: implicit declaration of function 'bitmap_get_value8' [-Werror=implicit-function-declaration]
     329 |         *clump = bitmap_get_value8(addr, offset);
         |                  ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +6 include/linux/find.h

47d8c15615c0a2 Yury Norov 2021-08-14  4  
47d8c15615c0a2 Yury Norov 2021-08-14  5  #ifndef __LINUX_BITMAP_H
47d8c15615c0a2 Yury Norov 2021-08-14 @6  #error only <linux/bitmap.h> can be included directly
47d8c15615c0a2 Yury Norov 2021-08-14  7  #endif
47d8c15615c0a2 Yury Norov 2021-08-14  8  

:::::: The code at line 6 was first introduced by commit
:::::: 47d8c15615c0a2046d2d90b04cb80b81ddf31fb1 include: move find.h from asm_generic to linux

:::::: TO: Yury Norov <yury.norov@gmail.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

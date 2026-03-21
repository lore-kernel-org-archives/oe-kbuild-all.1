Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10742DDC3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 23:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774136399; cv=none; b=T71oM15+hLhtUt5OHhB2TczOUZcnklsfIFuZ0GwVUhW0pZ8XDQH8E6+s0RO6DT9nY1Xf5MTn6BXWcd1HVsiEoMGsb0q9EiZj6owGBEgIjlURrLkkGKsDLrTR+yV1jYXsWGN49YgHxe/6ktc9k+1j/C/g9/rIlMxOS7Wf+R/7TCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774136399; c=relaxed/simple;
	bh=erWePiyS0cPsDpD+XEVA6rMaqTIZUmN3J2fsg3k2SoA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oWYwIOVdMDlqgB9BCvV7zGpDE/M62T6EFPWfvZz4GJvHLfEvcqTamkI7RAtFvWiF3fUj70aWhIGPKVKGZdZhHCjc79YD/0iAfKBg/AiDMMJIIRLvHbZWEfq6xG0dqK3mdhHvCCTsAnNMCT/2N1HS/h+B72bpexgzqSpc7MH62wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O05AeDvK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O05AeDvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774136398; x=1805672398;
  h=date:from:to:cc:subject:message-id;
  bh=erWePiyS0cPsDpD+XEVA6rMaqTIZUmN3J2fsg3k2SoA=;
  b=O05AeDvK+r8P2EvKL/S4jSs8mNUSSRqPXR6R9GR2muJwSx1onXAJHcI5
   0MYK05HC356QFe88nE7KpxXW9OOIWvcypp7Bjp+ODZ+BW1KVUoCxRHK+a
   vvRDRmYtTIJ49GyGYlVv0yjI01ruL6BHM/7pYbmJGyfzJKUsSVdxlqkxu
   7cRtiC30Ldf5QFETrg4yOXbcBvf7kFJymhps8r2lQrU1hHGEmkLsmhca7
   Qu5/E1FqDGqh0KwSjiJO8FhhhIKbYXyDa7sXxtusOH71Te0NbRFR+kgNZ
   EAe3PYEx6349KdLadvS65Ai2brwZJ25Uj8vkniPBLZXzXm3KWpy67zgvZ
   w==;
X-CSE-ConnectionGUID: 0wFpbE9RQfaDxOeVZ5+G+Q==
X-CSE-MsgGUID: CDsAJLXDTOiqLsesVa8IcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="62743375"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="62743375"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 16:39:57 -0700
X-CSE-ConnectionGUID: 0rLaEhysRxe1eBVee+mGzA==
X-CSE-MsgGUID: xaXRDyY+T/uS8vOASJXoRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="246668611"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Mar 2026 16:39:56 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w45ut-000000001Nw-1E43;
	Sat, 21 Mar 2026 23:39:42 +0000
Date: Sun, 22 Mar 2026 07:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:lib-raid6 37/38] cc1: warning: lib/raid/raid6/um:
 No such file or directory
Message-ID: <202603220749.FRU9A1lr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git lib-raid6
head:   964995e5e2ee5c94df17f056c7f9b2f98af52474
commit: 68755f7e7ef744b4adfc45d6f9e4cd18e7468f51 [37/38] raid6: introduce pq_arch.h
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260322/202603220749.FRU9A1lr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603220749.FRU9A1lr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603220749.FRU9A1lr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: lib/raid/raid6/um: No such file or directory [-Wmissing-include-dirs]
   lib/raid/raid6/algos.c: In function 'raid6_algo_add':
   lib/raid/raid6/algos.c:50:23: error: implicit declaration of function 'krealloc_array' [-Wimplicit-function-declaration]
      50 |         raid6_algos = krealloc_array(raid6_algos, raid6_nr_algos + 1,
         |                       ^~~~~~~~~~~~~~
   lib/raid/raid6/algos.c:50:21: error: assignment to 'const struct raid6_calls **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      50 |         raid6_algos = krealloc_array(raid6_algos, raid6_nr_algos + 1,
         |                     ^
   lib/raid/raid6/algos.c: In function 'raid6_recov_algo_add':
   lib/raid/raid6/algos.c:78:27: error: assignment to 'const struct raid6_recov_calls **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      78 |         raid6_recov_algos = krealloc_array(raid6_recov_algos,
         |                           ^
   lib/raid/raid6/algos.c: At top level:
   lib/raid/raid6/algos.c:248:10: fatal error: pq_arch.h: No such file or directory
     248 | #include "pq_arch.h"
         |          ^~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

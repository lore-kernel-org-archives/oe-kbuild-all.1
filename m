Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE2F179BC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 07:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726991387; cv=none; b=gLUuAPUO+Scf9UEw+dddY3/sgUOingA+EppTrBbdPGcIxfeEru1TeJzO266oDgSUQa9MuLza/o7CWR9OaVWvDElC1Fbw6iJCn0KkGYdvYBZ+kYEg1k2BaqKLg1EDc02VtKiYG2qvK98WEsorgumU6i7I4vhqpllzDr+LmuvY0Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726991387; c=relaxed/simple;
	bh=VL7jgi4rlO00qTeqAXVWECiPrhDIISg6LpBNo3889yE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gJeGL3AC671ZUx7i55ipKN8wjZddTfmyLa2o0DTVaOLl5aW3Zn1wP8Zh5qAj7colElpyHpiXfxUQpImVKtCqu6Ob+GXaojXu1d3xWoUV6Ie114zDa3lZ+Q50dV5V8jJi9JaLLkCUq8X1ToyJGFRL/f0gtVjZSuGwgHNBdzdJfzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+jhP1hn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+jhP1hn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726991384; x=1758527384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VL7jgi4rlO00qTeqAXVWECiPrhDIISg6LpBNo3889yE=;
  b=O+jhP1hnN+nfNHSv0flCeUb6Sw0PoHFaOolJ/i3v83N20DvRqTEa5VJ7
   6o1IO7GFukfaVG87msGG2mD1QqdAq0/P8vNUXshbsS9qcHu0B6ovi/K3R
   Gfe5B/mQSj9X1SUssBBOJiMauRpnWvrwPWIQaxG3KQZzS8BGgowpXTe+1
   BLRVOjErASbXiwUUryaA+3HNwTErhJJ6oceegnYJzmnQqJoltGuLCoJdC
   iiSK4LPIYeGrOZHU3GBSZXj551lkyded4zv++OYcn++IdC3iOhQ92Wurd
   W4iN1IQAPzmi8xGsL/P+zOxN9BjmV+FyUanrYnwMpVfL8UFK32EDEZBtl
   Q==;
X-CSE-ConnectionGUID: vWHAdBGsTSmUm5tc9Sv3tA==
X-CSE-MsgGUID: b1GBWNq5QJOx7w/xHgf+Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37320671"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="37320671"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 00:49:44 -0700
X-CSE-ConnectionGUID: t/sszchBTCWW5ShzdBvykQ==
X-CSE-MsgGUID: 2jnXmzu1TLOZsnCfwJGC6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="70333137"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Sep 2024 00:49:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssHLg-000G80-38;
	Sun, 22 Sep 2024 07:49:40 +0000
Date: Sun, 22 Sep 2024 15:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 2083/28533]
 utils/cryptodev/cryptodev-linux/lib/benchmark.h: sys/time.h is included more
 than once.
Message-ID: <202409221531.oz17I4Cq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   92b88e0e59c946d552fb3d375d60e775a4151ea2
commit: c3b89e4625bb76475e992292ee89d37d48a0e748 [2083/28533] utils: add cryptodev 1.10
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409221531.oz17I4Cq-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> utils/cryptodev/cryptodev-linux/lib/benchmark.h: sys/time.h is included more than once.

vim +1 utils/cryptodev/cryptodev-linux/lib/benchmark.h

   > 1	#include <sys/time.h>
     2	#include <time.h>
   > 3	#include <sys/time.h>
     4	#include <signal.h>
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

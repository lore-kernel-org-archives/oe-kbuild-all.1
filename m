Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D0B2F7F09
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 04:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654434; cv=none; b=obPKbNCpPmcq71y9Z+7IGI/sMWoKPy0nRsTbDFA5wRmlJJYFVYMyrn8uAZGradYxHmzS0dV+iBqspC5dXwzXYBNK6ouCNNk8vglTUSnLyIaLE2e2fjzS6Shg+fEiId5CbtAXCiUhUnZQ2yKNzaLc7dnfoEsNUqCij7v106MpgKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654434; c=relaxed/simple;
	bh=6uYk0rJU3s8FkxzhH31qsMKO1KPBj90AopdhRqABj20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IipCGcFgwXlb2khDYX+XjqBujf/9KIZooRWGuQa0CAnZTaed5FW43tnVyGMKoi6ETiaSe6GVDlemL83R75UEhyW9wd8lGbNhJFYY/hoZS8LRPYl9Bv2IMvjGb/D23C+Y+dDaBsTjAeFkLt4cZc54QGApmtlVFK5uzmDqmXNZCOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHJYhLuA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHJYhLuA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790654431; x=1822190431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uYk0rJU3s8FkxzhH31qsMKO1KPBj90AopdhRqABj20=;
  b=dHJYhLuA7lkey21Ej+ayGrD4stXfMWiVDxOTlPX+o2dgadfUTRgxLMho
   96wKFmvdAzndjAXZ09MAWXhyXvwegw3rJczeV0hCqUp2mDR7rvO9sa65z
   tHeiMXjQn1JAT463mlSV5cY/tVC646r6KorJC0ZGQvIsjEF89QHHb/Bnp
   hL09DTrjFx/hZp3ox6DO+eBQmk3DjizXdSm4orYhwygIxolsX3241HiU/
   xEqCMx4DUM5tD2azqhxd6DQ4lYRjpZJy7iKAMNhCvP/233zonvHqyAnRP
   EOlmZUyvFEz1PmYhargEbwpA0Tuw1eWKRslx7IDY+E3ASY/20UbPsQgOL
   A==;
X-CSE-ConnectionGUID: 8GwydCTjTFOizUQp30UIXg==
X-CSE-MsgGUID: kayp1WpBTSmkCaaMLcNwUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90494629"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90494629"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 21:00:30 -0700
X-CSE-ConnectionGUID: G+rOWAMMQeqgm8DC9es08Q==
X-CSE-MsgGUID: xulKYf1GS3iIT44mhFw79w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="275271268"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2026 21:00:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBP10-00000000Ov3-2eEm;
	Tue, 29 Sep 2026 04:00:26 +0000
Date: Tue, 29 Sep 2026 11:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-bonsai-clean 55/67] arm-linux-gnueabi-ld:
 test_bonsai_tree.c:(.text.test_bench_show+0x180): undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202609291127.KMfQ2dem-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-bonsai-clean
head:   1b386f2c853c6e84025fa93d485e69ba8c1d76f4
commit: 7e315e76b9d7bcca76d4af65993f9f0c90026a45 [55/67] lib/test_bonsai_tree: Separate build and teardown benchmark metrics
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260929/202609291127.KMfQ2dem-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609291127.KMfQ2dem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609291127.KMfQ2dem-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: lib/test_bonsai_tree.o: in function `test_bench_show':
   test_bonsai_tree.c:(.text.test_bench_show+0x128): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: test_bonsai_tree.c:(.text.test_bench_show+0x180): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: lib/test_bonsai_tree.o: in function `test_bench_run_repot_mt_bt.constprop.0':
   test_bonsai_tree.c:(.text.test_bench_run_repot_mt_bt.constprop.0+0x25c): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: test_bonsai_tree.c:(.text.test_bench_run_repot_mt_bt.constprop.0+0x278): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: lib/test_bonsai_tree.o: in function `test_bench_repot_write':
   test_bonsai_tree.c:(.text.test_bench_repot_write+0xbc): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: lib/test_bonsai_tree.o:test_bonsai_tree.c:(.text.test_bench_repot_write+0xd8): more undefined references to `__aeabi_uldivmod' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583CC264614
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 14:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093050; cv=none; b=tq3TN/C54akY+1PKxoqoALcaNzjP5w6It8ALyXDUjLrfRqHvS4xCLJ9lz86Tt8IyHZZ4Qr+8bILKbPtm+hy0mJw8Q9IQSOhnsxfn03/daH1/C2O24R3SYzeHeOu92TfAAT58GNMtdGLylXYu00DC0sSA0MfNT1VEDoZ6O2l0sZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093050; c=relaxed/simple;
	bh=ZRVbP8VF0SfpNF15gkPw87CRoenMXvXIhdADs1+Adjc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XvXblFdes6QN5uuC8xeCsZ4xhZq9IsBbnuu7mhBuTwAjPnv/e1gTD7CzNQiTYmTviPWhIT9Q436LDoL5fT4VGMUvR60Cy5hZ4zPv0S6bIjAtZcxzt7dNpO5Dz8Q5l4/Xio/AE2k4WdymB+18zDQSb8WADbVe0tVB8OtdDTbGQ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDzAiiwg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDzAiiwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769093047; x=1800629047;
  h=date:from:to:cc:subject:message-id;
  bh=ZRVbP8VF0SfpNF15gkPw87CRoenMXvXIhdADs1+Adjc=;
  b=VDzAiiwg6GeFTLWvGyHaYw6L8bn/uSngp7fEWNb9K9gNdzGZ4sfpJn/C
   MI+BSvR6TPjCSi+3jcxNp798Yt+hmq7IY88rbjVgmZLIV6esP7fgVKiZG
   Rn5JvDKV3rhRXvIxIdz61OITuO9ZzysxK2WNEzbF9w9mzjnVlPPsWhUtT
   KJ+H1N3Q3RRDL2bFqgjOuKnjBaatKz4UwyzDhaXU7M5G8q6osS8onooOg
   MQXtVIaJWB+FCbRy+Uo8K1ivXZGQgWKVnJi++c+1bHQgActlDT4pGBCpC
   hdoArmzFKxkO9jkm1J41cWDZWZf9n7NkGeWLfnSiiMUAhtQ82F8ieSjLl
   Q==;
X-CSE-ConnectionGUID: zuIDT+iMR9SRzAZ97WsDkQ==
X-CSE-MsgGUID: Yhm9f5+lT3248nBa4+hEzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70392101"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70392101"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 06:44:07 -0800
X-CSE-ConnectionGUID: pJHTuGUNRDy92Nq0JQIn2Q==
X-CSE-MsgGUID: bVQeI2vWTju6L5wzLvneRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="238004404"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jan 2026 06:44:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vivuk-00000000Svi-3a04;
	Thu, 22 Jan 2026 14:44:02 +0000
Date: Thu, 22 Jan 2026 22:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Nicolas Pitre <npitre@baylibre.com>
Subject: mips64-linux-ld: lib/math/div64.c:undefined reference to
 `__multi3'
Message-ID: <202601222217.uzed54La-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a66191c590b3b58eaff05d2277971f854772bd5b
commit: d10bb374c41e4c4dced04ae7d2fe2d782a5858a0 lib: mul_u64_u64_div_u64(): optimise the divide code
date:   9 weeks ago
config: mips-randconfig-r062-20260122 (https://download.01.org/0day-ci/archive/20260122/202601222217.uzed54La-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601222217.uzed54La-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601222217.uzed54La-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64-linux-ld: mips64-linux-ld: lib/math/div64.o: unable to get decompressed section .debug_info
   lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
   lib/math/div64.c:(.text+0x60): undefined reference to `__multi3'
>> mips64-linux-ld: lib/math/div64.c:(.text+0x188): undefined reference to `__multi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

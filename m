Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D790623875A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 21:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739826691; cv=none; b=QbDM2AtTsaeiU2GFGWeYM/TQG1pwLkgFUF2vwMMO2sf7bnaYFR9P2I7prEvKyPDSINe9AQOrA3VbtsuokbscOZNQUocfhUxqCkm5nkrSFIFpOPjNFzQt323x909LtMw3XmJPE4UwYAgTJMPSZEe4F/Rlug/M0hBOaK8BoFzu4Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739826691; c=relaxed/simple;
	bh=tNSulc/0pWfUuEf99ZNzHivrFZOQWE/jVWKtqcnxLQI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AeJb7jp4ZA+k6F83824s0GryITxw6QIs1erz87t8U7BkFhvjSLEXybi3hqmKf4Z+VB7ggFV5sPW7X/IU1qxTzR9/71qw4KzYDdHOdtr0meQgUVrR5jaamfdcxIIInqouMYCOq4AWX8rW81sEkMpiLgaRk0KXADa/8yKZQJT5SoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJUncq8F; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJUncq8F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739826690; x=1771362690;
  h=date:from:cc:subject:message-id:mime-version;
  bh=tNSulc/0pWfUuEf99ZNzHivrFZOQWE/jVWKtqcnxLQI=;
  b=OJUncq8FMgQ/HvjyX/K1Iu1yayuTgps807uG4t8WWL9L93XZaDc0h3JV
   JvIYa0cp9nLmPzpAddgcZdsDuTjdOTtRwm39T098yk3HW1kY8i/SBpqa+
   M7ok4xPGrew4bgRAxltt2q1yZk9o7uE1Q52qCxtRlmdM7mQHwAtRJPJ1q
   2C4z7AYlDPBjZTDkRgV55TxDhMrEfie2ors5rt1CXGuSV7qyDh8peHLoB
   ejXeXnQt/CuAjZNEi2qBNEGw+MtQXQiHFA6RHVZqKO2tNGbHXAGijdBx/
   zgMnAfezVcjcAK0iC22OakD87yCxPcncOB9ODNNYFalXdal/f4qWMmQX4
   g==;
X-CSE-ConnectionGUID: awbaevveRJarn+1XQonRYg==
X-CSE-MsgGUID: YxDsnFD9R+CYUQqPPStNyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="43345936"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="43345936"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 13:11:29 -0800
X-CSE-ConnectionGUID: KJo7yCjLQG+iExe1sBRk1g==
X-CSE-MsgGUID: 6BGT6BpTQH+BBPfa0fM1TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="119208516"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Feb 2025 13:11:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk8Ok-001DbL-0O
	for oe-kbuild-all@lists.linux.dev;
	Mon, 17 Feb 2025 21:11:26 +0000
Date: Tue, 18 Feb 2025 05:10:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/56 1/1] xtensa-linux-ld: warning:
 arch/xtensa/boot/boot-redboot/zImage.elf has a LOAD segment with RWX
 permissions
Message-ID: <202502180540.dsy7BGFJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Max,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/56
head:   bb98b2d2ae2bd66f1a46663bdeed5d1d70afd128
commit: bd90ac0002d1a4e480d6afb0dd84bf0793913c75 [1/1] xtensa: add __bswap{si,di}2 helpers
config: xtensa-randconfig-002-20250217 (https://download.01.org/0day-ci/archive/20250218/202502180540.dsy7BGFJ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180540.dsy7BGFJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180540.dsy7BGFJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   xtensa-linux-ld: warning: arch/xtensa/lib/memset.o: missing .note.GNU-stack section implies executable stack
   xtensa-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   xtensa-linux-ld: section .start VMA [d1000000,d1000007] overlaps section .image VMA [d0003000,d1d2c4c3]
>> xtensa-linux-ld: warning: arch/xtensa/boot/boot-redboot/zImage.elf has a LOAD segment with RWX permissions

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

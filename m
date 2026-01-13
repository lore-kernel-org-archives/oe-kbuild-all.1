Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440D3393DD1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 17:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768327177; cv=none; b=tzRQSuMK1/ZKz2uTVVWpWBTllmIzVTAtGd6EFpbsJfZ/iI2hfunYDqULt+d4jPvW3lKNFxxV8zj57ffEbPB9+n/5O+TxVczcdU4Jf+5kPEY/mlXuNUKkU+k98Fc3iLOLDPRtGSB6Jmw7hGCEbxd2bsw0Q+Mk4xvX7oUjZtq7bec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768327177; c=relaxed/simple;
	bh=rhIZYEAl+JRIQvDcuAP0PNpNBp/AW54b8oE4VbiUYyE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ei+WjpYq1Q6EN0JTzqb4w1QM+Qi4jBP6LEJT3tT2sCWnyDJts38fyqy/idCXdCI1KUAsqssA7JbGR+KqcJjTflJm3t/MsJ5MVxu4AuhkBeibd3VLq/hrKtq7NXis0K62TuL7R2zhCLcfLXsvqXaWBWFS00GrkBHCcyWwvhiCNqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlbfAJN1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlbfAJN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768327176; x=1799863176;
  h=date:from:to:cc:subject:message-id;
  bh=rhIZYEAl+JRIQvDcuAP0PNpNBp/AW54b8oE4VbiUYyE=;
  b=XlbfAJN1BmkDSjB9iNwC5Q7Sz3e15UWdrVBYE7d0ig5iR36hZTG7Dqkp
   q4tsCBQl7kNN6tp18WL/8W+WDmT/i4Hl9wL7zf1CQDeQGE2dPbo9Qw36h
   HDLaCkhU+lI6F25gLeMTnu/7u3+EpRoTAhvqmup8WHOpWywiOkmbG4Z67
   1T8DMWnk/SA8aBwo9l/AVy5Qw/vI2QDrZDvlraeKA5hnUZl1JVDRtg5R/
   plx1vyLkef0n8H7T1ottAQZcgq6JyZZd8g37SoQffv7B3Xf94JtvosBN9
   uL9CMEhAg/DVkdf/Dl+zLNuNMB+qPQIorBK5M1dm1FsfPGP9bNBlHE8SA
   w==;
X-CSE-ConnectionGUID: XBCyyo6GRn68f/KP6NXZ7w==
X-CSE-MsgGUID: GBBF1833StCKN1aa9Qnn/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69674741"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69674741"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 09:59:36 -0800
X-CSE-ConnectionGUID: RdTw7pP7TaiRWPvyE9g9Ug==
X-CSE-MsgGUID: V0tJ+HjBSzC+MGzaTBRt/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235168979"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2026 09:59:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfifz-00000000FCk-0r3R;
	Tue, 13 Jan 2026 17:59:31 +0000
Date: Wed, 14 Jan 2026 01:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Nicolas Pitre <npitre@baylibre.com>
Subject: mips64-linux-ld: div64.c:undefined reference to `__multi3'
Message-ID: <202601140146.hMLODc6v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: d10bb374c41e4c4dced04ae7d2fe2d782a5858a0 lib: mul_u64_u64_div_u64(): optimise the divide code
date:   8 weeks ago
config: mips-randconfig-r113-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140146.hMLODc6v-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140146.hMLODc6v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140146.hMLODc6v-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64-linux-ld: lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
   div64.c:(.text+0x84): undefined reference to `__multi3'
>> mips64-linux-ld: div64.c:(.text+0x11c): undefined reference to `__multi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

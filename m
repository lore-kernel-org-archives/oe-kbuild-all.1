Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903D82E6D2A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751550810; cv=none; b=c4krKJeoxsRiyGdn8lggOzA94g2Gzj/1wzrMXxKEkzFE2Lhuu04a97HathNOtWwo2bpc2fNOwttf6OB5EYINHapsDgWW+aTnAaIgSKqEHmUG9odG404N6KTZ7Nz1e25H2mQMSPfIZr5knIHHWxRzRRw058idQf74mFTkWS2woxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751550810; c=relaxed/simple;
	bh=753/OoySepvCoYuRvNkH3IL5/zkpea4T6psqlPLjgzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R0UmQXeNFZKLvBJvZFJn2lnUrtoWBHYIP8HWdUhCtZCbR8dBpo1RmywElCDZJf2sOgmm98ebpZQNK60c4+bNoTMsq58z9o3ZZcfc6fUo52xw2kccwfEp94DJD7r960Lo5kPgjpu6HH75ayCc2fSU7s+N2SYmiIig+yXFXwA9QJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDxAYVbR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDxAYVbR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751550808; x=1783086808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=753/OoySepvCoYuRvNkH3IL5/zkpea4T6psqlPLjgzk=;
  b=YDxAYVbRQyQm0ssGCdOhldz+nXiRpMzBVCK7fZ2o9Dqt4cg+fxMTntvC
   cBockcXJXugsc8MMlPBI1FrlyIprSQB5CEnnrFgaKLZg7m/HMwD9GP4jM
   qDY1HYpBavJnw+Cl6Oatwy0Yj/pZ2CZAdRg9Eumvlb4Wt9b207oA3G68j
   YtjmIH6j4iNmnpzpZG8zEgRxd3ewjv7lCmI3VstHMGirb0vv5u1SzLTk+
   kDfMOMFW3X5VK1zbQo1YUTnl/VnKt/xkUNa/g5u8z2iVxCvBNGG7D8Rjs
   OME9i+pQhu6GTvTELMQ75OjPXb0f4qWw/v7URNCnO16N6H+/BQN8S0F0k
   Q==;
X-CSE-ConnectionGUID: FfR6wgURTEaAvGSomZhMXA==
X-CSE-MsgGUID: TGdHR3ImR6WDIJ+fgsfRPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64475581"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="64475581"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:53:27 -0700
X-CSE-ConnectionGUID: es4lEt79SVm3fiGXrU6I/Q==
X-CSE-MsgGUID: OF7+MeK1SUyNnvPVVDweJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="185389741"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 03 Jul 2025 06:53:26 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXKNP-0000U9-2C;
	Thu, 03 Jul 2025 13:53:23 +0000
Date: Thu, 3 Jul 2025 15:52:56 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] lib/prime_numbers.c:8:9:
 warning: 'bitmap_size' macro redefined
Message-ID: <202507031536.p8mTTL5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   26d81348fb134a6bffb49fd1b55d8842cbf6424d
commit: 9e8111c56a2515c7634662d19c29fde636758a02 [1605/1605] bitmap: introduce generic optimized bitmap_size()
config: x86_64-buildonly-randconfig-2004-20250501 (https://download.01.org/0day-ci/archive/20250703/202507031536.p8mTTL5J-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507031536.p8mTTL5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507031536.p8mTTL5J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/prime_numbers.c:8:9: warning: 'bitmap_size' macro redefined [-Wmacro-redefined]
       8 | #define bitmap_size(nbits) (BITS_TO_LONGS(nbits) * sizeof(unsigned long))
         |         ^
   include/linux/bitmap.h:215:9: note: previous definition is here
     215 | #define bitmap_size(nbits)      (ALIGN(nbits, BITS_PER_LONG) / BITS_PER_BYTE)
         |         ^
   1 warning generated.


vim +/bitmap_size +8 lib/prime_numbers.c

cf4a7207b1cb4a Chris Wilson 2016-12-22  7  
cf4a7207b1cb4a Chris Wilson 2016-12-22 @8  #define bitmap_size(nbits) (BITS_TO_LONGS(nbits) * sizeof(unsigned long))
cf4a7207b1cb4a Chris Wilson 2016-12-22  9  

:::::: The code at line 8 was first introduced by commit
:::::: cf4a7207b1cb4a3c3fe3aa11a83c9d673722a7f5 lib: Add a simple prime number generator

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF35039E18F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 22:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778364693; cv=none; b=oMAOdY1sYL9vu+Vom7jIaD1lznU+gV/3FK0eIoCY5gIMA/dXpqClAOmEteoKiZd2S5nUSJUx45Dv4r8S4Hbocv0vRp4ww0tLw31otViydvOISF15ARA64kKFJ+xeK8rmSgfuoZZmo8UH4kkq7EbRENm+FAaj6bzLsLQHovevhVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778364693; c=relaxed/simple;
	bh=yxszzpe2QGwhsE6ort+Gic5bpP3tkUa7xb2H5vrNOTY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UyX99kbMSONP76vgt25UL1wfdxnc0xgmPbOPibjPDE12EuNGBwvFaV9LYORTFaPqf+7eYRbIPgIOoie+Lh4seAW+jHNUA16Ny9zupcUC8vowXnmqyJHxAYu0lN1k3NdnwVemdRZdrkwQn7fj4PLDQva2GwNpbbkTgBS3W95F/ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jN7Ocss/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jN7Ocss/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778364692; x=1809900692;
  h=date:from:to:cc:subject:message-id;
  bh=yxszzpe2QGwhsE6ort+Gic5bpP3tkUa7xb2H5vrNOTY=;
  b=jN7Ocss/9Pcsk7YAgnSYijd8Qkg3EoQLUUETUPz6XKS06nWWyx9EHEtx
   YFhCv1Y6fhqQK7biXT6holWhSIm0up/Yv5vdOelopHGnqta2gdhieUQBr
   KnYVCM7/JvKtHXH/oSCMAZ4kGgWIvkhzW6hf39+uML3MRBj0y+YBIsdQG
   IFLWuIxYQeqlBzAMFfIjcYzMwU0CEZol3gUKSVVrwIeOTsZFd90FBhfMQ
   4tkHqAaOtGCz/yG6IP1D1pnW/ddHm4ET0fBIj95K/+9pDpMfruLqoD+th
   LnOf+7Lgv2cTnK0whAxnc1fjl3ymJbhGnDByi/Il4DQ3rbIQad53/lxTe
   A==;
X-CSE-ConnectionGUID: IEenSpp/Sw2+dq4pZ+LE7A==
X-CSE-MsgGUID: r3Bi+4fCSk6aW34tQ/0piQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79155787"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79155787"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 15:11:31 -0700
X-CSE-ConnectionGUID: AiFyyVjJSD+g73jIJ5mIzw==
X-CSE-MsgGUID: S9mVEYR/RoCmj8ykD/e3PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="242085608"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 May 2026 15:11:30 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLptP-000000001ST-2YLL;
	Sat, 09 May 2026 22:11:27 +0000
Date: Sun, 10 May 2026 06:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:lib-raid6 3/17]
 lib/raid/raid6/powerpc/vpermxor8.c:88:30: error: invalid output constraint
 '=v' in asm
Message-ID: <202605100615.UXloU9P9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git lib-raid6
head:   4904674049bc3b70c509754b53cbe708e49f03ee
commit: 04f46cf399047f3e3a537e26bdfa3e17bf2400e5 [3/17] raid6: move to lib/raid/
config: powerpc64-randconfig-002-20260510 (https://download.01.org/0day-ci/archive/20260510/202605100615.UXloU9P9-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100615.UXloU9P9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100615.UXloU9P9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/raid/raid6/powerpc/vpermxor8.c:88:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq0):"v"(gf_high), "v"(gf_low), "v"(wq0));
                                                     ^
   lib/raid/raid6/powerpc/vpermxor8.c:89:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq1):"v"(gf_high), "v"(gf_low), "v"(wq1));
                                                     ^
   lib/raid/raid6/powerpc/vpermxor8.c:90:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq2):"v"(gf_high), "v"(gf_low), "v"(wq2));
                                                     ^
   lib/raid/raid6/powerpc/vpermxor8.c:91:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq3):"v"(gf_high), "v"(gf_low), "v"(wq3));
                                                     ^
   lib/raid/raid6/powerpc/vpermxor8.c:92:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq4):"v"(gf_high), "v"(gf_low), "v"(wq4));
                                                     ^
   lib/raid/raid6/powerpc/vpermxor8.c:93:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq5):"v"(gf_high), "v"(gf_low), "v"(wq5));
                                                     ^
   lib/raid/raid6/powerpc/vpermxor8.c:94:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq6):"v"(gf_high), "v"(gf_low), "v"(wq6));
                                                     ^
   lib/raid/raid6/powerpc/vpermxor8.c:95:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq7):"v"(gf_high), "v"(gf_low), "v"(wq7));
                                                     ^
   8 errors generated.
--
>> lib/raid/raid6/powerpc/vpermxor2.c:64:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq0):"v"(gf_high), "v"(gf_low), "v"(wq0));
                                                     ^
   lib/raid/raid6/powerpc/vpermxor2.c:65:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq1):"v"(gf_high), "v"(gf_low), "v"(wq1));
                                                     ^
   2 errors generated.
--
>> lib/raid/raid6/powerpc/vpermxor1.c:60:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq0):"v"(gf_high), "v"(gf_low), "v"(wq0));
                                                     ^
   1 error generated.
--
>> lib/raid/raid6/powerpc/vpermxor4.c:72:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq0):"v"(gf_high), "v"(gf_low), "v"(wq0));
                                                     ^
   lib/raid/raid6/powerpc/vpermxor4.c:73:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq1):"v"(gf_high), "v"(gf_low), "v"(wq1));
                                                     ^
   lib/raid/raid6/powerpc/vpermxor4.c:74:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq2):"v"(gf_high), "v"(gf_low), "v"(wq2));
                                                     ^
   lib/raid/raid6/powerpc/vpermxor4.c:75:30: error: invalid output constraint '=v' in asm
                           asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq3):"v"(gf_high), "v"(gf_low), "v"(wq3));
                                                     ^
   4 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

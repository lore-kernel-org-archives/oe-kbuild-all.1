Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984C83264CA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857167; cv=none; b=ggxjzfEzdN+gIZQd/wysOEFg+m0/lH2OpD0SCU1Iv98ZWrrsxHTwhFphkxGJwtRP6z8SgIUuqWc6YQoxSt7GGr2ng/fwKHtuhgblNbZPtD+xn25BbEtMhVOBfLLFXHs/0eXrBQfa//gNE+WfyB7KFg0TMYud561UGd5SUZbMo4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857167; c=relaxed/simple;
	bh=zXB1zNsqjwMeh1a0Mp9NLixidMXNr2SkgxfpAxsrN2k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bkXoPwhHMFWMjQqfRgQ24zMYRLtINF73Tt5PiO3UtSOgR56tZPzSx+lsCk7TPN2KKFWM5oV+JKkVvyNOcjnVNDgfaMMY01wRUsbpvL/7VyqHi2gzi0DyeZblJ3GWJz4qFXaVW/2ULJpU4JTg4GwHsoeFYCvCya0vn/wqUAqW5M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lG0pULD5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lG0pULD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778857165; x=1810393165;
  h=date:from:to:cc:subject:message-id;
  bh=zXB1zNsqjwMeh1a0Mp9NLixidMXNr2SkgxfpAxsrN2k=;
  b=lG0pULD5I19wbiN09OgPgyjakwLH7GUrF1kujd5/UpeO8l2Wx+WmXBry
   +X6Yxkk6SW/If9IXEOPZ1Gj8WHEF2Cd8Gz15b1lJjByA6raw0pv1R+NVz
   Ae5sIbhT0BDRoB8Sx6X/fehQa67CY45aRhm3tFp2kDoktCa63/eqzR/z5
   /FdpfSFIWbb3HtuvlHTHIXRsFt4qcbq2gERW0L2/KTioZ7tm3czP/X+Qa
   4Qu+aOQbOD6gs3tPmnjcbTHA8HD5pZgcUr9R5XPfMtmrebC9LEO/GeVjj
   oCg+FhUd2y1NA6yXTLT8Ce5nr5dhHkOOyLWoivzsVDTnTFLfRdYQpkkfJ
   w==;
X-CSE-ConnectionGUID: ckTJ7TZGSVqdMVJQZMimTg==
X-CSE-MsgGUID: HgrhsLc0TFiI33wTyuGb3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79706987"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79706987"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 07:59:25 -0700
X-CSE-ConnectionGUID: S7A6ypWTQ/CqNhV11vBDZQ==
X-CSE-MsgGUID: WBaptZCgQA6ZLp2Qv9nPxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="242705500"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 May 2026 07:59:23 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNu0X-000000001zQ-136z;
	Fri, 15 May 2026 14:59:21 +0000
Date: Fri, 15 May 2026 22:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 462/799]
 fs/bcachefs/sb/io.c:582:19: sparse: sparse: cast to restricted __le32
Message-ID: <202605152228.u1BQ6eYX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 30f7c327a5b2201012ff856bc95040e2ec3fad6b [462/799] bcachefs: move sb code to subdir
config: sh-randconfig-r123-20260514 (https://download.01.org/0day-ci/archive/20260515/202605152228.u1BQ6eYX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152228.u1BQ6eYX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605152228.u1BQ6eYX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/sb/io.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
   fs/bcachefs/sb/downgrade_format.h:14:52: sparse: sparse: array of flexible structures
>> fs/bcachefs/sb/io.c:582:19: sparse: sparse: cast to restricted __le32
>> fs/bcachefs/sb/io.c:581:19: sparse: sparse: cast to restricted __le64

vim +582 fs/bcachefs/sb/io.c

1c6fdbd8f2465d fs/bcachefs/super-io.c Kent Overstreet 2017-03-16  577  
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  578  static unsigned long le_ulong_to_cpu(unsigned long v)
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  579  {
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  580  	return sizeof(unsigned long) == 8
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29 @581  		? le64_to_cpu(v)
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29 @582  		: le32_to_cpu(v);
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  583  }
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  584  

:::::: The code at line 582 was first introduced by commit
:::::: 8b16413cda7c46d47f8071165b3071f8a9369199 bcachefs: bch_sb.recovery_passes_required

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C4728B7EA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 02:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772851234; cv=none; b=Ab18NTrX/mnKuuaBehmBBDyf0nopn42cWEqc13qznjEYBblmhl9MuS+15/+nqN75La4HTDJ6Clll10HMxtTCw+uXoRfPSXkZiHFCGUSdJyOa8ApQYVoQ0TJRxG2mmjs5NBIk6qGGIG85QUWMMda4gErO/XVAxgSfFvJOSrWKoFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772851234; c=relaxed/simple;
	bh=rETtrpI9MARASFV/121/SQFmHohHHbKsONC90Bi9kdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FQtJaEL9adVRh7kTWpI7fZiigbaBGFtfLe7c9/T6jUheYUTszzbUz4Fmjl/cmN4ErR6bImK8OC7ujrjNUzbCCTxAvQ0KQyd8ZMuvTM/1oTNjF51EaRGQz33zQQKn/TBo8qh2dF01pDy90MxhHztjv9O1JCSuvmVSQlczZhz10is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwKMMF00; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwKMMF00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772851233; x=1804387233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rETtrpI9MARASFV/121/SQFmHohHHbKsONC90Bi9kdg=;
  b=bwKMMF00iZLKAsRDLVwiP9ZAPwqSNff+RdVvb+vn6Ik6DuafSqRABhBU
   IU3XzViYRfk92fAwD1ubVJi9o6HU6fN9583B/fpqVWMt4W/Yzkv9/C07t
   FGRqOEsqq4x37x8jasOx718SF7c4cjLCrOGwypsgEWqWemt6ezhDdNGMJ
   m46fDSe8Hb0F3DLJKmoIvRGwx2l1LNroBep7Mof01dUWgkRbmOtFCG+LW
   7kox9wBd1n8kB9MN5W9nXzpXJKYMEXoyvMBzkBaXkyeWgGsEfU8Eppu9h
   LhEGGAWdT2ntZMRCKj9AGas21xWfBsAh6aYr96b8OxlCmXV8MkSqptgfE
   w==;
X-CSE-ConnectionGUID: YYnOGkX0R5Si7ZSYh7AKbw==
X-CSE-MsgGUID: YXdCUDUXR/6tqvY7phs+LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84597595"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="84597595"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 18:40:32 -0800
X-CSE-ConnectionGUID: 1/YatNAsQjSXu89hW79M4Q==
X-CSE-MsgGUID: U98ZL4EaTc+cDy1Ad/gswA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="215810671"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2026 18:40:30 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyhae-000000001cF-0cbh;
	Sat, 07 Mar 2026 02:40:28 +0000
Date: Sat, 07 Mar 2026 10:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Ville =?utf-8?Q?Syrj=C3=A4l=C3=A4"?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [linux-next:master 1578/4591] i915_initial_plane.c:undefined
 reference to `intel_fbdev_fb_prefer_stolen'
Message-ID: <202603071043.ibZnpeKi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
commit: 94c7d286129268ead0fb76d684fe4363d57da415 [1578/4591] drm/i915/fbdev: Extract intel_fbdev_fb_prefer_stolen()
config: i386-buildonly-randconfig-001-20260307 (https://download.01.org/0day-ci/archive/20260307/202603071043.ibZnpeKi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071043.ibZnpeKi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071043.ibZnpeKi-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/i915_initial_plane.o: in function `initial_plane_vma':
>> i915_initial_plane.c:(.text+0x2df): undefined reference to `intel_fbdev_fb_prefer_stolen'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

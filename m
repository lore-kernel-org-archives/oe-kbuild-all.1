Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03783FF1B8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 11:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089962; cv=none; b=ftxEXy+8Uv3e0yobI8B7HkHFDhfv1I32h+/d8c1/bnL4V/vAssGqE9tDI4YnQ0Som+oS/8X0tqD1kLvBfGwx63ZDsypE6a6OgTGjxn0+7URp3m4ahYmOqPH4Nd7xEkMzUZJZbdKT4im51s30DQ9/B1qkvh8gN0NWL7zpwFZZf0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089962; c=relaxed/simple;
	bh=cmgYCH7bAKow3n+v3GCCkyP/zSVvV5OBIjoYeOEHYJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=e8c50M2gCjqMEItvJmAE6yjPtf60dB7dMLevgEB6vuRc5JGdhcqboed69xTXjyZ0JdTyol3VDAQEgf+qAKnrf0mWuhghCtd7/YX3csN/NXvBto8sncRmo7YGxxXB2iNMSjPKWmhrQPDTOEL81e3WH1Hj4/Tz1ec8zlaSh60f/S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKeE0fCR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKeE0fCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781089959; x=1812625959;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cmgYCH7bAKow3n+v3GCCkyP/zSVvV5OBIjoYeOEHYJ0=;
  b=EKeE0fCRbG6W44RgWYw0CreZTotLrp3ShkGbE3J0YsfNUFSfw/SPo7IO
   wogay5JImcN4TGhHTQ5lVN4Hnrrn2ZHxNGW2KcODnFSaPaWechXNfzsBv
   UfmynRDGpEBoqgo4+1rK5l5Uv+chOCDlovY9eDYrN4DAKwKB0k0TUioeo
   KHV96HAq/Mn+GDyCUmPlgv0fAI7uzKrJEG2/8itZre/v1T3ZWFQ0m7bwJ
   XCsH9JUwKwo6PHLAMuq4OQDQVMCnhqD7VxJNuIP78XR2Qq5p6IHj1B7pO
   e6HEKP+DanWWzOVHSOgfF4KmrGhS73JeSPiK89H6uGLVJ+2AwDE/Vpso1
   g==;
X-CSE-ConnectionGUID: lWbDRlDRThq/yJdurjJiYw==
X-CSE-MsgGUID: f4wb/w2yTAi1JA+sYaf/EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81944482"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81944482"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:12:39 -0700
X-CSE-ConnectionGUID: mRjzvZLJTg668CQ+F5VaaQ==
X-CSE-MsgGUID: dalGLgk7Tduj3Sxr/zDMVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="248012738"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2026 04:12:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXGrL-00000000LKI-0DyM;
	Wed, 10 Jun 2026 11:12:35 +0000
Date: Wed, 10 Jun 2026 19:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Ma=C3=ADra?= Canal" <mcanal@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [drm-misc:drm-misc-next 8/13] Warning:
 drivers/gpu/drm/v3d/v3d_submit.c:85 function parameter 'submit' not described
 in 'v3d_lookup_bos'
Message-ID: <202606101838.EX8oSATj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ma=C3=ADra,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   2df5efb45425b48fbf5a3c1f36a686af26871009
commit: f59d986943afbb97443cf91f45b1dc2c6fb6bebc [8/13] drm/v3d: Convert su=
bmit helpers to operate on struct v3d_submit
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/202606=
10/202606101838.EX8oSATj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260610/202606101838.EX8oSATj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101838.EX8oSATj-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/v3d/v3d_submit.c:85 function parameter 'submit'=
 not described in 'v3d_lookup_bos'
>> Warning: drivers/gpu/drm/v3d/v3d_submit.c:85 function parameter 'submit'=
 not described in 'v3d_lookup_bos'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

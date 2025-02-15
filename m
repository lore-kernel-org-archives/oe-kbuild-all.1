Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67D01519A7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739622585; cv=none; b=jlWxp8H524mRU4USTO1slQQTHpdnimtRLYTRllCyJjZsiyCEyFNdW0CqvgERgtTXEpLceB0EKVopy17Axe7QYSvWCzFMXQBp6+YtL/aIbheOmedP7OW29ZXXIx4yw1ukkh+Wkei9ePhiygD1qbr/8mwyEpagh1soMFUFbeo8U20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739622585; c=relaxed/simple;
	bh=JqKaH9BLxFlgisc+DIYojQFZZZQMO1sRPtt9sC95gRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R6TQ0R2i+Mt8fmQPGbC4yfojsu4CMsgM1+8xECeN2rC24Q5CPLbB+m2J+PITlCu4F/mM73myPT9ISy1Fq/6peEWMXufVmaPGX9l99DpWNpVViu1ud9xj9V5Adkdyi/vdhPyur/4uJah44O4BILOJQJGCw7Zy9DdPWZUabU+4/34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=noOvnttd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="noOvnttd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739622583; x=1771158583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JqKaH9BLxFlgisc+DIYojQFZZZQMO1sRPtt9sC95gRo=;
  b=noOvnttd8o65xmYkl4f3q+ptBARNXFEKEqHjGKZMtVjbN69D/H62Xucc
   tYjQjd5kpxo4y+yZ7Q6PYi3dikkvOQR1I4dm0sWrac6vACF4JquJTxdP1
   FBaQWDfQG9J9Akxd3gja65d1MwNN8jf9DuSoajobUGONOvTdiUikjXii4
   PWziXBnCYmXPNOA/pzwhtn3ZDh+KdmvFf5JM8Lb3CYihXn5m7zLRLFg0V
   RSNvUTylTtMbo92ixPlUEJnarBM99NiglWHI0cvpZCy09k2Z5NZ4VLmkk
   44sefL1BirWh4USYWy1v3yJBqb/2Tq4rs2OylnXTSdvHdx2W1zuoRTwtH
   w==;
X-CSE-ConnectionGUID: p1edNl51SfyCzk+BgEc9nQ==
X-CSE-MsgGUID: zQUkJlx+S6Sq3dl91WPvpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="57890648"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="57890648"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 04:29:42 -0800
X-CSE-ConnectionGUID: wxs7sw4fQcu6rAWr/h06sw==
X-CSE-MsgGUID: 3G4exs/dSSuGwPi+Nr/q9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150859742"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Feb 2025 04:29:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjHIf-001AnL-2f;
	Sat, 15 Feb 2025 12:29:37 +0000
Date: Sat, 15 Feb 2025 20:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: Austin Zheng <Austin.Zheng@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Alvin Lee <alvin.lee2@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: [linux-next:master 3209/4011]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c:18:20:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202502152027.BiZ7JGJK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ae0fa3bf0b44c8611d114a9f69985bf451010c3
commit: 1b30456150e57a79e300b82eb2efac40c25a162e [3209/4011] drm/amd/display: DML21 Reintegration
config: i386-randconfig-061-20250215 (https://download.01.org/0day-ci/archive/20250215/202502152027.BiZ7JGJK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502152027.BiZ7JGJK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502152027.BiZ7JGJK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c:18:20: sparse: sparse: Using plain integer as NULL pointer

vim +18 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c

    13	
    14	bool dml2_mcg_create(enum dml2_project_id project_id, struct dml2_mcg_instance *out)
    15	{
    16		bool result = false;
    17	
  > 18		if (out == 0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

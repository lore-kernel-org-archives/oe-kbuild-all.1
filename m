Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193852144BF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 15:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684344; cv=none; b=DIPMV+qHI2L++X6PFRIblnNTfLrM5c5CEUr1JPZ/KDQhFaEkruRHPzxMDuO9uZ5S/As5XhFLGWvUUtKHZr5euMbIPDPc4pPD5SHOTEUfAi0f23KNrW3hUZDha+BvvRTfPohu096e7ySATyxYmkeXk5aerUo3AymMOtqzhWoMzrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684344; c=relaxed/simple;
	bh=lCqmI1yuzHeG1HLcDbTCepXVlHhUvKAwJvHoEjq8RHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kcH7EOHNka3gDdU0Ui6If3ONqPE9IW4Cf3BTKA/JgAAl1JGFM9ttFRuDSO3FATGNf/rVsVEAaP7xmGB76cnjQoUWlat5ggG7sVkPiPUvdYLrlPHLK/QE02GM2NxlWJjmwPY8QCUrnZ+r0a6CYgPLlN1HmGJNx1p0gbnjBGwTGiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFkXASt6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFkXASt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738684342; x=1770220342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lCqmI1yuzHeG1HLcDbTCepXVlHhUvKAwJvHoEjq8RHs=;
  b=mFkXASt6/B2zxbZjoECTgDkCd2Hfnbj2I14EfjFCJ6Tkmlo1TLW5AISo
   cwhA/VffOZvihwa/NRTj3a+0gD/+nrIk/TBJSOu1l5Fvp6GwWI9eN3uKC
   liZ728sUHzQAZHmJPDonJmRnXAdFy5I6J3Ol35feLTpLWFWTcpem16/sw
   amhGU/TaLV/18qo444izPgFEozDAv8VlG8gjDnw4DkA929s7IgEVd1RHo
   WQ711H1AahkxgvMCrWoHInl5tSF5ybsmitr4xonTVWBcpUkND1KGTypp/
   irnalu+sHFjbRBgkkIN+KflxfJ5sg2IF7hRPqABugCnLVCIxRyNhxb2f6
   A==;
X-CSE-ConnectionGUID: 1No3++jETcW0Xm3Cd3GdAg==
X-CSE-MsgGUID: 47h7C6D+Su6x5vGfnPU9CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50609692"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="50609692"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 07:52:21 -0800
X-CSE-ConnectionGUID: 343cnP69SPSamSYaUdBbwg==
X-CSE-MsgGUID: kq0rQqmxSDKzF9vHQMVRlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="110462328"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2025 07:52:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfLDm-000seH-1W;
	Tue, 04 Feb 2025 15:52:18 +0000
Date: Tue, 4 Feb 2025 23:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/v4 2/13] WARNING: modpost: vmlinux: section mismatch in
 reference: memblock_reserve.isra.0+0xc (section: .text.unlikely) ->
 __memblock_reserve (section: .init.text)
Message-ID: <202502042301.mWj5QcrY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v4
head:   a75b813f58b0bc19b2c4b06bd62afc87f02dcb43
commit: e415f4e35ee852667f3f2c392b73a7d4469b9d1a [2/13] memblock: add MEMBLOCK_RSRV_KERN flag
config: parisc-randconfig-001-20250204 (https://download.01.org/0day-ci/archive/20250204/202502042301.mWj5QcrY-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502042301.mWj5QcrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502042301.mWj5QcrY-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: memblock_reserve.isra.0+0xc (section: .text.unlikely) -> __memblock_reserve (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

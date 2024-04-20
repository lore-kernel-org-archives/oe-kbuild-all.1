Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806DCD518
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Apr 2024 04:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713586347; cv=none; b=NfQz/K/SKmYJqEupnlG/kKYSeDeuQI7OMQHnFpzSvq4Vrm6OhbcY/xfl9NYn1bLs5Gcagn1czWaKdWQiy9cRjwF2jnUKOJSEUnUwj3hEnkA05on/8FgD8hVTirjfSKzREniIDV7Dic1WIN84mdEA9JP1sZR7vmVrDDlBbZCuxk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713586347; c=relaxed/simple;
	bh=yV/wO3F9DTBU2dHeQTWZiG/RlvSq8uMcu0Bk4OxVBfU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j8LO1LBfZEWl5IJzjaM2wDK3MdTZ0F890r4hbJtF9Dv2jf9pOpILafaaD3TDgfbUPXV7K51h8gIwHYjX8IPekEMw0p/e2PQvEuFACes5ruAQigR/bDUa3cQETlGuVOZFlGFcB6FuY7FbQG2M7FXCrcRCNJtOLMt1AJtGedpZEWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7boo3ez; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7boo3ez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713586346; x=1745122346;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yV/wO3F9DTBU2dHeQTWZiG/RlvSq8uMcu0Bk4OxVBfU=;
  b=g7boo3ezRP3vVL3vvNqunaa0Or9am9u4ZC6n5/RRlvDu67lbA+DvZ2Gp
   3nKDz5j+w8JhCiLDGnXtrnh721RTgAAkUdX80OKLfCT9nhSnRvSGW7iHl
   kFUvX5chpNs05DPpPguqNBMLbXRKnuDr54HM1w1LP4z+Sb1Q/aBrYe9xq
   +DnCaSmQY+SXAax+n2h7mhrnuIGuyj39DAuO39eFmdnhkaK0GXGItYpRe
   Swurqv92qfeuORE8dOHIrJtpaFH4HY0eJqI5oZCkSoqocT6yFf17wr/88
   LEdilX/diaG1JbO+1lQjUUl8AIBnzPkn+chLmvqDD/ZwKuGmdvtsdzJ0M
   A==;
X-CSE-ConnectionGUID: u5aJFxP5QV+QMh6ALGa2eA==
X-CSE-MsgGUID: PT/4/2KvR5iSbhGY2UJUEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20600445"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="20600445"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 21:12:25 -0700
X-CSE-ConnectionGUID: Xf5ZrIv7TaKs4+WklDa1+g==
X-CSE-MsgGUID: gNg+IQYmQH+qyE87RQGvoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="54726991"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 Apr 2024 21:12:25 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ry25O-000Aim-2h
	for oe-kbuild-all@lists.linux.dev;
	Sat, 20 Apr 2024 04:12:22 +0000
Date: Sat, 20 Apr 2024 12:12:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 2047/6555]
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c:39 nbio_v7_4_get_rev_id() warn:
 inconsistent indenting
Message-ID: <202404201205.eazJQLR9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 188ae5a64e3bdc5b9fd882e29c4c2b624828bced [2047/6555] UPSTREAM: drm/amdgpu: Add nbio 7.4 support for vega20 (v3)
config: i386-randconfig-141-20240419 (https://download.01.org/0day-ci/archive/20240420/202404201205.eazJQLR9-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404201205.eazJQLR9-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c:39 nbio_v7_4_get_rev_id() warn: inconsistent indenting

vim +39 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c

    34	
    35	static u32 nbio_v7_4_get_rev_id(struct amdgpu_device *adev)
    36	{
    37	    u32 tmp = RREG32_SOC15(NBIO, 0, mmRCC_DEV0_EPF0_STRAP0);
    38	
  > 39		tmp &= RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0_MASK;
    40		tmp >>= RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0__SHIFT;
    41	
    42		return tmp;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

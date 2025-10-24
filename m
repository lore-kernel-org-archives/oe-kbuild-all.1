Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39AD35B130
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 03:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761277482; cv=none; b=YA1Bt5a321o3eU9BaTxqwbVNIVuo6UmEkfqji5t6MKpcoV1neoHLibMelu2wRIneBwJ4swvZdty3qMwkMgD35mUX3NCk1D671ancysarb5hY4pqKu0BaEGRxBm9AgUH7AO4vfb+a+LUGNZjAuIMdr/LtzfRL0gSCjGROpIj+/Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761277482; c=relaxed/simple;
	bh=tZJ7uiaiBScstPSkZXZcxRLE+crO/MJ+s9QGeZq/QrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DXohdFjh3M/T42xUm5kPGOEl4FRewGmHO5+vCBUbqO8d958GwQ+oH3+7UbswjZ5E7cTHOhhOUMUtWOlGty7g+UNhYPK1tePDcMxcyqH69RjGmAW2sarXS7Hp6+VMxNDBuSQ7cNjR/RBWdwnJOHCThHnec6Bt83qI7TVWRJ8H/cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0k7XDyA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0k7XDyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761277481; x=1792813481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tZJ7uiaiBScstPSkZXZcxRLE+crO/MJ+s9QGeZq/QrA=;
  b=P0k7XDyAxdg6ynbDzlDbsMliXeMA9hYJ5gG9F5qgi2UcAPaQZ5FUIZCw
   GNQO9cl1SzJmpQkJBEbvSF+EC/pATmhb7E6Pf7OLkBa+ehemlJbaLoA6d
   yzucQgWS2L4fxxgDJFMuOl3PKdovLChCyjqJIGyiHsh8pHGubKdltVbAz
   GpahvWZcYM2yg0gfsUIq1G436kHVTgynR0+N4Wb5ppjxXvD+Dg1IM/mgs
   nxqyfjd6Di4SdzOeMiJM4xtohIpE3uW5vPwpB/YaTgyeN1nuRoQc/4JV2
   uz/5modyNiIVzuxXsVLyURBkpsgzQsycZAA/3vJSdhfdTLgxBfvIYFZeH
   w==;
X-CSE-ConnectionGUID: FKD5KCz/SWu9dIIG+q+MbA==
X-CSE-MsgGUID: ScQEhhcwTvCcDJt6yexnLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74802986"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="74802986"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 20:44:40 -0700
X-CSE-ConnectionGUID: xg2XidZ3TaqRFittXFOWSQ==
X-CSE-MsgGUID: e+jGhDwgS0eGYRjJwOltsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="183553491"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Oct 2025 20:44:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vC8jD-000E9p-1d;
	Fri, 24 Oct 2025 03:44:36 +0000
Date: Fri, 24 Oct 2025 11:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:ethos-v6 3/3] ld.lld: error: undefined symbol:
 gen_pool_free_owner
Message-ID: <202510241138.xhnEfWZO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v6
head:   d6ee4b64651fba947d99c7567e7f008d323f61f3
commit: d6ee4b64651fba947d99c7567e7f008d323f61f3 [3/3] accel: Add Arm Ethos-U NPU driver
config: mips-randconfig-r062-20251024 (https://download.01.org/0day-ci/archive/20251024/202510241138.xhnEfWZO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510241138.xhnEfWZO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510241138.xhnEfWZO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: gen_pool_free_owner
   >>> referenced by ethosu_drv.c
   >>>               drivers/accel/ethosu/ethosu_drv.o:(ethosu_remove) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

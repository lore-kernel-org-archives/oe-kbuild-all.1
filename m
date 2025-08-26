Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3127DA93
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756204628; cv=none; b=rg+Sdfjl3B7/hyfQ0el+v/mthmdOLc0WYnjrsyukFjZ2CIcbp9Vcw2efyVIXKW9tvkV/WKr30gKv7Pnii5YhDSQDytyafaL7ziqbOOfFJB3siEo+0iYaxpbhqI536Q448l8WwnUk0D/CKI6IG3Qjeyla8lGdeyeCEqePCwFqugA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756204628; c=relaxed/simple;
	bh=I8QUuAMoS3etjFivL133A0Xt77bD8VxHb6GUNq9H0E0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BgppwnuVPJETgUWsE6+iRahpi9w3jxMQUor/8I/DwMrayCt8Q7nlM731bjyOMFifzBmr6lyR6JGQLQchQ5KJWAb+yb+j0PyNt1VOZnGXE5y9XMZdY8eqlXvTMz8PkFwYbNzi7gvXc5PaiSurqckVJB2H7vWsflvTFsQK+Gm7yGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXUE3/VI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXUE3/VI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756204628; x=1787740628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8QUuAMoS3etjFivL133A0Xt77bD8VxHb6GUNq9H0E0=;
  b=QXUE3/VIHJTcJh9C5VYbq7Zo0fbqvrOvtE/6NoXHmhpKfZgg4F1gZtCf
   a5XNhlyNJ9Usrb/AkhSHcrkRI+TN4pB4UJkOoEEpAgGwSPXl3jK+hUdiG
   p4d3CNkzSEZk9eH6IFv/tWH4dn/X3l5dP9rZA/gFHrLe4TNlRo+6nstxv
   JRr59WsB0aGezrTPdNiTYFGOfu5dPf8wU4cz2elQuuhGz6Sw1rd1Xvoq1
   CnSPea+IpjRt6fmuZ92nF1VfTbvtMq4sG6v0mZGKX2hJZhFrRrajdRogq
   6zFZgaOVGfti5BnfOsptTNeZOmb+i5OmtPqjb/B262iLwUVMxzqm2qt8A
   A==;
X-CSE-ConnectionGUID: Nk2ljawoSo6oregZMSibFg==
X-CSE-MsgGUID: fs4ZSL9STEmP0V2URSzbnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58292452"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58292452"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 03:37:07 -0700
X-CSE-ConnectionGUID: g7wdgs8BSt60cgFyNRqvug==
X-CSE-MsgGUID: gjSk1W64SGyOmIyIh/pnUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169044417"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Aug 2025 03:37:05 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqr2K-000OPb-2x;
	Tue, 26 Aug 2025 10:36:32 +0000
Date: Tue, 26 Aug 2025 18:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:iomap-pi 10/23] Warning: block/bio-integrity-auto.c:88
 function parameter 'action' not described in 'bio_integrity_prep'
Message-ID: <202508261840.lk6giSc2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git iomap-pi
head:   d252168f39a5567415f89bd1a12ffbde1a68a853
commit: a802255b182b364357b5ea835a423ec38f12f0b1 [10/23] block: factor out a bio_integrity_action helper
config: csky-randconfig-002-20250826 (https://download.01.org/0day-ci/archive/20250826/202508261840.lk6giSc2-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250826/202508261840.lk6giSc2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508261840.lk6giSc2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: block/bio-integrity-auto.c:88 function parameter 'action' not described in 'bio_integrity_prep'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34622357D13
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 20:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787085341; cv=none; b=m1JHx/tDSCQfzzeHlf8HgozLEXCpifun2pT5zAHsd1xSJAETmQblZKbPmY19gxybOU9FLgYe62sS4vtSEREpuAjAdfmmFqe2Sbz01rfydtgGPmcLuQs4ApnecS2hM4fXpXZGpmeCD6c/JoskPAdy6zS/pz/tsRRtOB9pc6YLCBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787085341; c=relaxed/simple;
	bh=2OUnK0I5efJeU4BU39eXbDxuJ2cvF/SK9a7SUF4VTvk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S6pPpL4cTMJ1LEAZnKDfXvLLjS8Dttz789ZrB40cvpPwTyfSzqIjqwLg/NjB5SvfLNM+nVu+2yX7tzu7lQUa5H3qnABrziz3UP4fK14wmJd5dNnmQXFfxtV4vlruZ9cXNtdyQFeNJ7wvnJ4Iwb6hhRqvDcvdlKDP4jIxzSnbjBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmO4MLuA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmO4MLuA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787085339; x=1818621339;
  h=date:from:to:cc:subject:message-id;
  bh=2OUnK0I5efJeU4BU39eXbDxuJ2cvF/SK9a7SUF4VTvk=;
  b=ZmO4MLuA3WbXRYhTfts83gpGmyeCX4BV7+f8Uch9A8NJm/dUuBpGd3SY
   MtlK4c1e9jpMxFjn7ibrVnTb2PeJN5xU5ZDLayWJ2Izrci4oLdnVKzXi6
   18iL+6QAtYRHu2wyKhfz+9iSHkeJ5E63ILBbmo0qxxJl9oReMxKec0Dog
   HjNYqR7cAIyFGlRr0gMOXCEQxhmbTGW+lGXCyk6Ys1gkDExPQ7OquY/oU
   57blWm69wUYQfUftmSQu1bsvwfPYRHhFOKOL6Zs7yAgp8FYjsnIZoGsYI
   Y2m5jlc2yFJx3V06FtM++QweRETooRSxU2KRhZvUv9wA00TdK09qB1umn
   g==;
X-CSE-ConnectionGUID: dBWpAig4SWqMMjj4q6MV1g==
X-CSE-MsgGUID: OCj2iWtfRCqirtV8PLrnnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="105123342"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="105123342"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 13:35:37 -0700
X-CSE-ConnectionGUID: ewapnlZ+Tfyj8i9YJtaFSw==
X-CSE-MsgGUID: 7HxnKt1zSpOuxVUuMMABpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261118491"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Aug 2026 13:35:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwQWy-00000000eZ8-3498;
	Tue, 18 Aug 2026 20:35:32 +0000
Date: Wed, 19 Aug 2026 04:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 188/217] Warning:
 drivers/memory/emif.c:140 struct member 'ip_rev' not described in
 'emif_platform_data'
Message-ID: <202608190446.ZgG9cXrH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: a2959dbcdfccfdb2802d2371710176d42b3a9b37 [188/217] memory: emif: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260819/202608190446.ZgG9cXrH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190446.ZgG9cXrH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190446.ZgG9cXrH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/memory/emif.c:140 struct member 'ip_rev' not described in 'emif_platform_data'
>> Warning: drivers/memory/emif.c:140 struct member 'phy_type' not described in 'emif_platform_data'
>> Warning: drivers/memory/emif.c:140 struct member 'ip_rev' not described in 'emif_platform_data'
>> Warning: drivers/memory/emif.c:140 struct member 'phy_type' not described in 'emif_platform_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2172D2B2D7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 03:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785988042; cv=none; b=ebvIztNlYYV2ljvZFTNcuiKr9jyKSUJ6NLrCRGjwGLntcekmby1k0oaOA2vFKBer3AJwbZL+qdrcdm3hNdcvxEzpnA9NWXnkcLN+mYSLXRiemL55uefwTA41rT6VfPpyS5o+7B8tP83+QKzQ/YJwL6o01wIk+3M6Jv6OzFKB6xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785988042; c=relaxed/simple;
	bh=YV/LG0mbD33I8t70Ir8HOGAPrSgF/Y6zhb7mCrvgOOY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ftFQk8JJNBbP0YTQbXLfNSQKejzRu2e3uavsTkLAK1WQ4VNXmS3M1AUnAvUc7aHWAW9WfZye5W/u7eAH1P6iwvPzVtvmhxL+UcfzWS7Vk8LaW/hAPqADWQVv2brvJ1Dz1Pzwepjkj9+yFe8eeohvOksrdBc4HUJDZQdM5/Afyak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bamLqDC4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bamLqDC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785988040; x=1817524040;
  h=date:from:to:cc:subject:message-id;
  bh=YV/LG0mbD33I8t70Ir8HOGAPrSgF/Y6zhb7mCrvgOOY=;
  b=bamLqDC43cD+tPaj2aW6s+Gw0/tIbU9Bh7BsiLxUGmXpqGSdEHjzaPGu
   iYCTLGtWIaUv258F+8Qt47asncQkoPg1ELqywPJaB/UugbWkLsW0+f3sa
   /mn1rB7M8mOKCJPHRjWlrzdtY7ZVu2e5XWphIrEFVSWBtVV/gfmYf3IUQ
   4SBz7QY3notMibqHTYqdspGJK9A8DPtuaM5+krcnXHU845JQ5/cjOlJEr
   xlBgTwxuRimHiptKYo/Izvq/bzo0G8hxRW7Sqp6mE+WYhP5M3vXoLTjrP
   qXFq9LzgMCp6jxdszJKFFtRqtKXzEgNbbgUdg6e2ApNN2p07IStSNLldb
   Q==;
X-CSE-ConnectionGUID: aaPU85qhSGi84ZUJ2BOiTg==
X-CSE-MsgGUID: jsnNJxwrSjqdw3BJlTr7hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="74109358"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="74109358"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 20:47:19 -0700
X-CSE-ConnectionGUID: UAqRqN90QjmYBqzwmrBfcA==
X-CSE-MsgGUID: LTNjWVPVRHi5oT5JQ1PzZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="263969354"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Aug 2026 20:47:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrp4b-00000000E3d-2dJe;
	Thu, 06 Aug 2026 03:47:13 +0000
Date: Thu, 06 Aug 2026 11:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/170-atc 2/2] Warning:
 drivers/phy/apple/atc.c:677 struct member 'hw' not described in
 'apple_atcphy'
Message-ID: <202608061148.4HXAM5PQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/170-atc
head:   24065f2feb4d9cd6ac1e2f4c8c229d1370073d9d
commit: 24065f2feb4d9cd6ac1e2f4c8c229d1370073d9d [2/2] phy: apple: atc: Add initial M3 series support
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260806/202608061148.4HXAM5PQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061148.4HXAM5PQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061148.4HXAM5PQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/phy/apple/atc.c:677 struct member 'hw' not described in 'apple_atcphy'
>> Warning: drivers/phy/apple/atc.c:677 struct member 'hw' not described in 'apple_atcphy'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

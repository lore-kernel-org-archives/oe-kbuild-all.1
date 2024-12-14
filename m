Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB9D17BA0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 03:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734148370; cv=none; b=Nfr8MNSYRM0XGhRx1UoxEoqB+yr+6wTyIYspQLpLq9uFQ4Vb4rdFKWEKd0Aa3Zur+KF3LzeV2BCJ3GFmwGi3dNPeJzm3Na/PpCbSp2ivimgoyUGC7qeJiWI5/iW5icu4iFm8GUJmB8N9ML1wfbKPee5n13j/HfqpUkA8RLBcfLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734148370; c=relaxed/simple;
	bh=cFvoIABO3PMM5d1+4DyJ1cxl/9A5HuIWD7p8yIwGmZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=THDXTgdUSZ1eie0HDILnMZjFNpmpCZyaDgd46UsB18U2AIZS+dklN4Qah+Le4xvS8nyP4IAx0H8aSy62pKvDJLt7B/w5bgyilEt5cuuvMhH8WyY60TqPXC1rfEtjR3ki4ARoKeba/3gYREyRAdFouNxoBZXOZO4fF0RWwSgRQ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjOG7nv2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjOG7nv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734148369; x=1765684369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cFvoIABO3PMM5d1+4DyJ1cxl/9A5HuIWD7p8yIwGmZg=;
  b=JjOG7nv2ZU5p1IPgJW7ISm8K/HEjw3WMd4z1s/iveFRxo1oEjzQQpWEd
   Sz3rBIjwNnSKGCuVmcFAXR7LSBGa/aE/RfC2NLmE64mHiNkS51RAl+pKa
   0/2zmDy5LPI21uwAu45UzhuYHGykKYu7AhRMQtuPr5Np9hPtvjag294hS
   IZu2JrtlHtdOUOREru8bQE1Jg8Q4GvQn0rBBe3YvgTwHi+5xVuwFaGXlJ
   ok95DQfb02VxFrr5O0zjINzyHz8ZurE9rpQSb86tNHC65bWgw+JdDw+m7
   SfSf2IMyv11FoSkikZhgQ4QKAOypLcDHdN0Zc46GmFMGyqFFyORU+180J
   A==;
X-CSE-ConnectionGUID: iZQ+rfuGQ9ibxCRdpdzm6Q==
X-CSE-MsgGUID: fsgIzTJpQt+nyhYxnOfPIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38297265"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="38297265"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 19:52:48 -0800
X-CSE-ConnectionGUID: VnLjGCwgTlGVCRLtA0+tTg==
X-CSE-MsgGUID: KQi6TbOAS7qNCWFvZX0VZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127709724"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Dec 2024 19:52:48 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMJCu-000Cgt-1d;
	Sat, 14 Dec 2024 03:52:44 +0000
Date: Sat, 14 Dec 2024 11:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 19/28] ERROR: modpost: "fwctl_unregister"
 [drivers/cxl/cxl_features.ko] undefined!
Message-ID: <202412141107.xrURVkGp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   c3c1ca00092765212f4eb49d2aaffb2003beb33b
commit: bd2d1e68312b337e12299a0e542b846daeccb578 [19/28] cxl: Add FWCTL support to the CXL features driver
config: s390-randconfig-002-20241214 (https://download.01.org/0day-ci/archive/20241214/202412141107.xrURVkGp-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141107.xrURVkGp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141107.xrURVkGp-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fwctl_unregister" [drivers/cxl/cxl_features.ko] undefined!
>> ERROR: modpost: "_fwctl_alloc_device" [drivers/cxl/cxl_features.ko] undefined!
>> ERROR: modpost: "fwctl_register" [drivers/cxl/cxl_features.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

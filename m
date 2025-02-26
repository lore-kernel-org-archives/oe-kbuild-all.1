Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD082745E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 21:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740605470; cv=none; b=AxTK2M39UJRSfpN5bvpJ2BgLPPJTmGv+01VAXWCjlhAdUGhLPOcX48Q6BC6YltVdzlR7k/Gq8Tc1TZd5m/JoYCKE7MbYktc3U7iYzaa6eEj3qUA2SxfhEVXijb2R5nTD92OokT51zCvOpyquC8Ard6TW3IbSYlm4SrRv3TVHSbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740605470; c=relaxed/simple;
	bh=5E9UM2n9xjLUUEPSp1LqiWHJ0NV0/elesTShqcAFa9c=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q5onDF3/H36GNrXBc9/vM/KzWPCqzrqnsG538r8i64fJkwr+LUyJBeZPa0uuOW/gSQ0wIOoCO2u5kVRm6Gnw0zXy7MQgmuuVaFQWgANiq58JeQGtMcKWcXHFwvukX1AtPKTUQCaDX9nWWxYHTDcqZUn9HxgqaGf/MVOYEAvXib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGtluIZ9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGtluIZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740605469; x=1772141469;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5E9UM2n9xjLUUEPSp1LqiWHJ0NV0/elesTShqcAFa9c=;
  b=cGtluIZ9Il9WjQJt1MSzDin1yEQyX2Hd+BLJuWFs681XFkbL6SLseThB
   v7B4575WeMaoO1LmlWi0OEGr1nN/2jGRX+iMkeBLbzqNuWl3497naPlbB
   hZ6dwMEdRoBIS1wYv2wV8HC+bcw8x+jj9j8RBA2hJAqv5PqVo/DofYdVf
   orYlJKvsQ8xrlhs00AZa4wVNOvAObWWZS+neWqkn6Z2PeoE0BtR641Ze6
   1bmuTpIqMhe/zptzPP6JMjHP9TNCJKPTVPQHY0l/TwIkG5RPTdhd/sdAP
   vjWTUpgX6cwD9EZ8wfwTa7kXMF4hm3uElUtIe1dM2ChpK8REAGKUEgqhl
   g==;
X-CSE-ConnectionGUID: WwgW6d/yS8KO7wvQRFMeTg==
X-CSE-MsgGUID: f/9PQd1LRxybmUf5GPtH7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="63943831"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="63943831"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 13:31:08 -0800
X-CSE-ConnectionGUID: rvMMf6tdQlyYDr3MW9n3zA==
X-CSE-MsgGUID: YfQL0kEQT5+aZHNq/ROTdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="116827998"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2025 13:31:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnOzh-000CTu-2a
	for oe-kbuild-all@lists.linux.dev;
	Wed, 26 Feb 2025 21:31:05 +0000
Date: Thu, 27 Feb 2025 05:31:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] drivers/power/supply/ucs1002_power.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202502270500.ovFbrOTv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 9a2688e42638f2e057dbdfce82e221b38bfba0a7 [1/1] power: supply: Add driver for Microchip UCS1002
config: x86_64-buildonly-randconfig-005-20250218 (https://download.01.org/0day-ci/archive/20250227/202502270500.ovFbrOTv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270500.ovFbrOTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270500.ovFbrOTv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/supply/ucs1002_power.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

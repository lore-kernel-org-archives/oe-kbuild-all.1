Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD79D218AAD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 00:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765499159; cv=none; b=XzanKCWlBjaHlEt06MM1NWsRhWVWIx/5w1b0UvBn/YFZ+GInLkyJSGPq7kFLyQ0yHDG9Yc7OFEEM654B3f6VW7HBN2TDM9TPQnsFAGxmTD9JSohkfXeQj3g/HWTbaMpy1PGgGtY85U04qXh0lculG5HDvPiRKOJUcy3OcN2oK5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765499159; c=relaxed/simple;
	bh=D9tb0w0E4gid3Q5tjsLuCaC9r+kz+HwvzpmE81hJTXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYcmdhRQyKkazzxzQFf4LJ2miG0xFLyGyVAuYBdmviO/+L3pBJbZQyCMETCgKQxypq7TmIXEdJNajxRKihjH5MrElHD6mbrkdfpn5xbGIu+S4A95Od46rLKNwTQTUv6wYg2NvlSajD5U7UyjFgKLZeofq2+U+Qj7Z8Rlw1SaqB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jG72cM+x; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jG72cM+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765499158; x=1797035158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D9tb0w0E4gid3Q5tjsLuCaC9r+kz+HwvzpmE81hJTXU=;
  b=jG72cM+x7MB5BfwKNnOGIHoXcLoncLjL3huyZl5dx4h1MltU5X6MJWnt
   qZnBgBg7/CgV8+4gFD9AxGvMcp5Tz8DXBjplNeSciV6XyZ1mqF5zNjftY
   NIFGlXVoFw600Z8NQmqUUOrjZjvZSAzoNXHpLw660o0pk9X2sJAEFQQLN
   T4tFmLVn9IUAVWSCNbQvtyiZHMUKh/bfXIknE3YLoo+Omw8euOTyCdS7/
   f1sUEdJouR1Z7Ba3MHcyACLaadbjeTMcdG+QijnsBLZiWdcLmwjEwyT7N
   47F8LiWcjOiO4kXlTK/XfLJS3Sd3eVjdQfyzUn1uzUEz0i8mm+42Ue9ij
   w==;
X-CSE-ConnectionGUID: Di0u7ljZTeaHJhLqEmf7lg==
X-CSE-MsgGUID: pEFKT+1NSXazw2ABaceYWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78112751"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78112751"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 16:25:57 -0800
X-CSE-ConnectionGUID: dLU8wCmFRvKz160bu4sRcg==
X-CSE-MsgGUID: 5y870AwGTOCDylax9mvqpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197753395"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2025 16:25:56 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTqyo-000000005Ef-0Vdr;
	Fri, 12 Dec 2025 00:25:54 +0000
Date: Fri, 12 Dec 2025 08:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Vecera <ivecera@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH RFC net-next 11/13] dpll: zl3073x:
 Enable reference count tracking
Message-ID: <202512120808.AfU6XgGL-lkp@intel.com>
References: <20251211194756.234043-12-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211194756.234043-12-ivecera@redhat.com>

Hi Ivan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Vecera/dt-bindings-net-ethernet-controller-Add-DPLL-pin-properties/20251212-035305
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251211194756.234043-12-ivecera%40redhat.com
patch subject: [Intel-wired-lan] [PATCH RFC net-next 11/13] dpll: zl3073x: Enable reference count tracking
config: m68k-randconfig-r072-20251212 (https://download.01.org/0day-ci/archive/20251212/202512120808.AfU6XgGL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120808.AfU6XgGL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120808.AfU6XgGL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dpll/zl3073x/dpll.c:58 struct member 'tracker' not described in 'zl3073x_dpll_pin'
>> Warning: drivers/dpll/zl3073x/dpll.c:58 struct member 'tracker' not described in 'zl3073x_dpll_pin'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=m]
   Selected by [m]:
   - CAN [=m] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

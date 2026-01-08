Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DA82D73B5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 20:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767903497; cv=none; b=g8Sr1UJHEDv19ObqrDmW9EgDkXYSsIrut0CAYaV4ZS56088cZ3hCg89Kh8oJQju+C/Tc4e1v/MUXuupp8Hs2LJoQV9eq+FI2frAPgb/uZX+WrUhJLfgFLX06vMtJ8w8R4q01r682HQIvd1c80kIrR5XFbcSkBvaz0LWKo72lkEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767903497; c=relaxed/simple;
	bh=IaKwAwqUjEP/H4Uu8gktFLEcbWUv+03sgJ/aclvvRWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkFQnDoibsZmx86Jq8w0/lWpPEJ8L4r0QtOyo4UZEvA01dUs5IdOPAaqB1siMF+57HJ9Ot20RG5eCTzOPmdZe3Nn2KEJiFIgt9r2VV4ei4wuhELJH3DRO7tlNzz8GcDw6hAK2pr82qUleFA9Li0+MZc0/SzjjQQl5PGfLogghf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsKB4duw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsKB4duw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767903497; x=1799439497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IaKwAwqUjEP/H4Uu8gktFLEcbWUv+03sgJ/aclvvRWs=;
  b=SsKB4duwqJt0YJZe0uVNcUrO0t+PNr2bAG+OY3CWZJ8995RX0pa2KDmn
   9JjQDPqX6gBHHKvtk5XWV25oK3wvaZBB/2Yt3hD/YU2eOzT9z0OYLuaLu
   7/u89599BVm4N6o9cvxKtuhAwWozKr0MOqNqGzTaynLEVug8RqI1/uWl0
   CE3iDqvd4VzApLJ4iWAgWQ0OmrHT1VG2BxVmDkNNOwGpEo2t4A6lLI6Xg
   8Ks9BZvRgarxDPA8xCLJ9gd5mdtU8mYTJJl9luTHI/AwD1/eNpOfS5OCW
   f87ZvukCtcNMNoxuRkJEBop+NwLPR2EJF46VVS8Y6zsx/ifJFiL8MDo+z
   g==;
X-CSE-ConnectionGUID: 2FoF3ApcQhqM+9+KYDVFCw==
X-CSE-MsgGUID: 0lt4LncQQ+G1bcsIizuPmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="71864842"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="71864842"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 12:18:16 -0800
X-CSE-ConnectionGUID: 3/ip24gkROmaKTCQQTshdw==
X-CSE-MsgGUID: DuZ4Hk+7ThaHnBZosYVaaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203354211"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 Jan 2026 12:18:13 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdwSQ-000000001qi-0t5E;
	Thu, 08 Jan 2026 20:18:10 +0000
Date: Thu, 8 Jan 2026 21:17:19 +0100
From: kernel test robot <lkp@intel.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries
 for memory-region
Message-ID: <202601082105.TThX0916-lkp@intel.com>
References: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>

Hi Gregory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-CLEMENT/of-reserved_mem-Fix-placement-of-__free-annotation/20260107-211455
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260107-mtd-memregion-v3-2-f9fc9107b992%40bootlin.com
patch subject: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries for memory-region
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260108/202601082105.TThX0916-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601082105.TThX0916-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601082105.TThX0916-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/of/of_reserved_mem.c:746 function parameter 'rmem' not described in 'of_reserved_mem_array_lookup'
>> Warning: drivers/of/of_reserved_mem.c:902 expecting prototype for of_reserved_mem_region_count(). Prototype was for of_reserved_mem_region_total_count() instead
>> Warning: drivers/of/of_reserved_mem.c:746 function parameter 'rmem' not described in 'of_reserved_mem_array_lookup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

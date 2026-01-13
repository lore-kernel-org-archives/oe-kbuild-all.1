Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576841B0439
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 03:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768273243; cv=none; b=ck/tj/egbYsWUb6njvxVXajIeKFNtiCUqZDMxKfJVnBqNmyy+L5rn/Jc35Sm6kwPM0EStZ4PaQcY7sxrNHMvDDL9kKJRJg3pNuMnJ8FoZGiF9qtMm7qd68KVRVIl5JaKTtFoRHuggFMea1PER8M/+7Z2t0i/wShEgUKyw1AzJi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768273243; c=relaxed/simple;
	bh=FjWx1f6JHEspVaMYRCrMQVGMzin7f6x7Uf6YF1kLDvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FY+oT2dshFKStus9mrRRtyRrMFS+GWb2v/NHpj00m2mYq+FWoED1OpDtG495Khv5PorvSUI3yZ5M63tvUeesUPdi+7P+Z5WNz8G+KslhJiXUj6cCSiKk9/W3hchO+qGvoZvbbGM5WvTbM6wxMPIX6UQTZ0EVN+GJk1PI2KUkpZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSLhMZTK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSLhMZTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768273241; x=1799809241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FjWx1f6JHEspVaMYRCrMQVGMzin7f6x7Uf6YF1kLDvg=;
  b=XSLhMZTKv0KMprwUhLJ58PHsFiYb7wnhPfdtHZcs19zcqHv14v8aGBof
   KI9PxWkBimoW9RTe2709DMapYbIftgxBJITRSMPy/OHOhE32YuKeaZ/4a
   DXWzTLwPGDR4B04mTmiPv7qW+DVOFms3N6he/tw5gw/maGmuL2O/dKJRE
   sak5buPuYYaVu6TrVEqnQNh4zRiEIJippuVurQKM3WNTyUv2YFj24I44M
   hHaou4KJ+IJVkEInalIi3nHVHMho1R5cPhYJVut0czqLGOc2Sov6c64Ry
   UjfUD1uBlauT3aGgzy6mZ4r/HQ+52tGvRBhlJTqSnnAMN+kl6HSH/75xH
   Q==;
X-CSE-ConnectionGUID: jo7N5rMWRsi/wIqow4jhOQ==
X-CSE-MsgGUID: tkvfPhxLR0C2MarWStj9Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80274061"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80274061"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:00:41 -0800
X-CSE-ConnectionGUID: jmBMIh2ARjqRZQEtGPhxUQ==
X-CSE-MsgGUID: 4eXrquReROuJMAv2LquGeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203422626"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jan 2026 19:00:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfUe2-00000000E84-0gDE;
	Tue, 13 Jan 2026 03:00:34 +0000
Date: Tue, 13 Jan 2026 10:59:34 +0800
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
Message-ID: <202601131045.DOJtnS0c-lkp@intel.com>
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
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260113/202601131045.DOJtnS0c-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131045.DOJtnS0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131045.DOJtnS0c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/of/of_reserved_mem.c:746 function parameter 'rmem' not described in 'of_reserved_mem_array_lookup'
>> Warning: drivers/of/of_reserved_mem.c:902 expecting prototype for of_reserved_mem_region_count(). Prototype was for of_reserved_mem_region_total_count() instead
>> Warning: drivers/of/of_reserved_mem.c:746 function parameter 'rmem' not described in 'of_reserved_mem_array_lookup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

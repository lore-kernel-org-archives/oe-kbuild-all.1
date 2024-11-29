Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5491991C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 23:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732923729; cv=none; b=kKRaMDhztbrvztDS1ghTCR7FU4vl9Lw5a8dvFL6gKuZidiwpEXfiv9ZXoO7LX6H9nRpNXGswoJpRdAJlFe3B721mwXSwrN7wQ/8yI8kC2WZDO9eCwmqbD0+uXEgQoTaf+qFS5cQRvBJ/AdOT5ObT76by19ASFkqZnqorKicB6OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732923729; c=relaxed/simple;
	bh=3NXqsWYaoi3TDpDDN6VOV5wUDIyoLfdtAvDhGEWqtLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgZO2ZoPVinjcG5oYnEQnxiDHHMB3yiOQi5sTlipZbz/6UM+60hSLLBexrzTdmbWO6bgsCBvTWOGjXwzF0YRolD/YvtTByxwgeuIxkPfKR8M3RrJtEdT9tlbtbds9pBM7P9cvwjPwmDOuXddse9Vo4Z5YTOJS5drL/KtGn0C5KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1FLTn0q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1FLTn0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732923727; x=1764459727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3NXqsWYaoi3TDpDDN6VOV5wUDIyoLfdtAvDhGEWqtLw=;
  b=h1FLTn0qeAo0BRZ0QzJpCZFO7xNrLDaWFkrXi1q1DUsb3qdyKMmgPOYz
   6GFHEV8jIQmNBSFnGEtJB7RlWFKe4MQSk8ZXuwQu+tyEkFkVNOe+ka/Ib
   P71dqf0r2xsf0gv5dHeVXYWNfvbOk8K2NUFJCHix5pTyDI3h1j+TyTKys
   Gx9GiOUDFkp3p3QxBUjFNoNjvtCJ9JOqU5esi58rUtdH4C9F+m4k2U6x7
   WDuf7n1lJNwfHCBSL0YbQagOlQ5O+zzDitQxkGgFSkLd5QjH6kYQ0A7Yd
   OGaVfDbn4FtMwlXLKMJHStc2RIHCw+cLCgBiALz0EHUttwXajv1MCm43/
   Q==;
X-CSE-ConnectionGUID: ZkUtekB6TVm9cLy/2vxDBA==
X-CSE-MsgGUID: eLLoo5T9QW6Jn/2uvTR91A==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32517522"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="32517522"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 15:42:06 -0800
X-CSE-ConnectionGUID: iIMLD773SpKwMK046TffCg==
X-CSE-MsgGUID: fqC6Ep2ZQhqWUB/CzdcpGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92974358"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Nov 2024 15:42:05 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHAcd-0000ll-0i;
	Fri, 29 Nov 2024 23:42:03 +0000
Date: Sat, 30 Nov 2024 07:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 15/16] net: phylink: add negotiation of
 in-band capabilities
Message-ID: <202411300705.isQ39G36-lkp@intel.com>
References: <E1tFrp6-005xR2-6W@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tFrp6-005xR2-6W@rmk-PC.armlinux.org.uk>

Hi Russell,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-phylink-pass-phylink-and-pcs-into-phylink_pcs_neg_mode/20241128-134818
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1tFrp6-005xR2-6W%40rmk-PC.armlinux.org.uk
patch subject: [PATCH RFC net-next 15/16] net: phylink: add negotiation of in-band capabilities
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241130/202411300705.isQ39G36-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300705.isQ39G36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300705.isQ39G36-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phy_config_inband" [drivers/net/phy/phylink.ko] undefined!
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

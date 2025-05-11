Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4EC288DA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 01:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746925604; cv=none; b=uAL/lvk3qYd7Q+jWVQggj70F+Q12hXrr0ktBEOPEKJqdFwFNbqFe3y87nWBP3m6i0HYr5j7PWl+9cAVmXfUhdtzGK81liCtDcHtJLM7RGcElwRWJviZZyRgXyDk0yv33aegfJJjQ8iJ3Ncbt8ZmLEukGnpiB5InTz1vZesGjJzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746925604; c=relaxed/simple;
	bh=KkrjIifQYMJVrbbtBgUbkWP8G7jEs75JPOag3J7mHSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAWsPQ6jpgxkah6eOB8t4d6wxUSGRUnu1/qShBzQ0pdxkW3k92mmahzquKnXEDeUHjFQtiQnL2dH8kA1Wmzqr3yKO9TKwoMPGbdAO1yejvzney30wM65ZRZu2QpM5nettXDS6bQXXDCYxP2dap07fwWqahtvC+bI1u1IXTCEsR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGNTWChb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGNTWChb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746925602; x=1778461602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KkrjIifQYMJVrbbtBgUbkWP8G7jEs75JPOag3J7mHSM=;
  b=kGNTWChb+aOdjIaNapjQje0LUkjx2lIKJ2zBdWpPgg72G5c6bgnW3Q08
   nez0dGkUyWElC02B1DuuHmdJgQa9GtRyf+wlhkL4ZdIhdwAoam4DZgzjR
   g4BUbZQjPhw6yAeeu2wzsKip05lUkz4XSc4/om8RNnUf6uoUNSZeMDhfM
   IHse2XKSeGpYs+9d09Wu5MvFF647Z2s32nziqie3sNrRjnFDieAJNDbNI
   aOp1suWYf4BzsfVJ7eAwVnmfBObpvW1oOw8tdkRXbFl9hbXVkoHWBoJDo
   yfG3uu0LzdTxpwbKJwRk5hahbw7tMgf8BF2239Lsdh8+PR/l0TcGmYF3z
   Q==;
X-CSE-ConnectionGUID: q+QQXSFDQ4iEdA8sSZ3Wvw==
X-CSE-MsgGUID: eSWc0yYrTHC3640C7CWr/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="74123246"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="74123246"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 18:06:42 -0700
X-CSE-ConnectionGUID: sJ3zigdVRNCzsR4vNAW+dg==
X-CSE-MsgGUID: GZ8Fw8GdS1CNAfV4plF9yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="141967634"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 May 2025 18:06:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDv9K-000DVf-1N;
	Sun, 11 May 2025 01:06:38 +0000
Date: Sun, 11 May 2025 09:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next PATCH v3 09/11] net: pcs: airoha: add PCS driver for
 Airoha SoC
Message-ID: <202505110815.z2zUlNhN-lkp@intel.com>
References: <20250510102348.14134-10-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510102348.14134-10-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phylink-keep-and-use-MAC-supported_interfaces-in-phylink-struct/20250510-182833
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250510102348.14134-10-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v3 09/11] net: pcs: airoha: add PCS driver for Airoha SoC
config: alpha-kismet-CONFIG_FWNODE_PCS-CONFIG_PCS_AIROHA-0-0 (https://download.01.org/0day-ci/archive/20250511/202505110815.z2zUlNhN-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250511/202505110815.z2zUlNhN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110815.z2zUlNhN-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FWNODE_PCS when selected by PCS_AIROHA
   WARNING: unmet direct dependencies detected for FWNODE_PCS
     Depends on [n]: NETDEVICES [=y] && (ACPI || OF [=y]) && PHYLINK [=n]
     Selected by [y]:
     - PCS_AIROHA [=y] && NETDEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27DA1F30DD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777634; cv=none; b=KfoHcJASVD0JUtQ/RZx4PiWD3xnSoETeOMlRr7y6Uk5wMavWeRuP74HADsKg7pv0Kd1pAlHDzIQxWXNHdLgzp/neQs+Ecb8F1IhJ8Rj93iNZ+okO+L4f8N0SVw1Lk+vj7TOobiqemaPhukyRuO07yfbCWUzVJ3fqbELpualp6PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777634; c=relaxed/simple;
	bh=FEZ9z3GCqcx+AHATGBvVY9HpE53DlnqtZyuteQEFbCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fj9JHBUkDnYYk4MqrzYAhDzTTXZISZgsz/VirMXbCR2sVmu/yXogGE0JMfgXLIlwjKaBJiCuKA+9KJ1E8pD2YJSdwuFH5GCdF8NaSyy5XVOMXxfZ8vxgPAKcowSnmSW3V2CbOem5Zk31YdbyvfKaU398QWoqJYtFJP+a/aoszdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoR1RelW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoR1RelW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743777632; x=1775313632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FEZ9z3GCqcx+AHATGBvVY9HpE53DlnqtZyuteQEFbCE=;
  b=hoR1RelWDBIKzcJcZOGe3mORfnuuUJAfcvIkGcAeiJuAScpCcmdn2FfP
   YWVuwm0srnugF+Zm1MVsF9o92vawVEHn8+HFuMZ5XZyB4Anyzgc2jylOh
   QG+nmziOk5ERqgl6a/oOJmZFqq6wdRoggwRnG8dbA9l54MXXSQ9ZLpLW+
   +3YWKEUcpnlVYUOPLXRRNRH/rR8QeKuwipPjrYInUepfAx7U9eZZ8o5ZN
   6Hj8lh6ApkvJapHBhRyFeXvvpInVh/YoZK8neVOIA2UUvNiu6Mo1AI6wE
   aHKrqU2mmxJPu0800Zfk+duqPOH5sKpju+AURSzfo1EBqTBR4Pg4lw57b
   g==;
X-CSE-ConnectionGUID: mgcBjJLsQXST39Kn2rz0dw==
X-CSE-MsgGUID: L/3w92F6SUWuwAEiQs0s4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="56586611"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="56586611"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 07:40:31 -0700
X-CSE-ConnectionGUID: o9LPnHRAQf6Hgxk4G4JBXQ==
X-CSE-MsgGUID: W7PBwpS3SuOVjMtHsEV9ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132184275"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Apr 2025 07:40:30 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0iDb-0001Ip-3C;
	Fri, 04 Apr 2025 14:40:27 +0000
Date: Fri, 4 Apr 2025 22:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next PATCH 08/13] net: axienet: Convert to use PCS
 subsystem
Message-ID: <202504042237.UNd0RLlx-lkp@intel.com>
References: <20250403181907.1947517-9-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403181907.1947517-9-sean.anderson@linux.dev>

Hi Sean,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-net-Add-binding-for-Xilinx-PCS/20250404-023209
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250403181907.1947517-9-sean.anderson%40linux.dev
patch subject: [RFC net-next PATCH 08/13] net: axienet: Convert to use PCS subsystem
config: i386-buildonly-randconfig-001-20250404 (https://download.01.org/0day-ci/archive/20250404/202504042237.UNd0RLlx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504042237.UNd0RLlx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504042237.UNd0RLlx-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pcs_put" [drivers/net/ethernet/xilinx/xilinx_emac.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

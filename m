Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85B428C87C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 21:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757800061; cv=none; b=tY2wmQbWnleUufqFSFCF8sOompKPD4I1OUZ3k/Ug6y6bPNwL9mglUbK0oX1Yj/qdF2PMREIQcdyv/gta0CNMIDQXDaOypFZn6aPS/6A0L1hZ9kTrmqRErVTBTRmy+0uzQzOUo0lumNCITw0ekG3H0J/RAFHmvnCVUam1uUWyzhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757800061; c=relaxed/simple;
	bh=UIhBGziXXCfrD9r0wscDda/2MUxwh1Kn2yXznbGBwCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwRkL6HyMapTzGbhw2FAWlPKsQoX9y3vJxCrNT6ht7Mu7S7b683d1CbXjwDWvyEe1p7tij5Z5tnYPrJL/7wR+0fOLMQmuSIostzGMPZ0PViGcyOgy266EE0wKxd43u8TYTjiqoZ2RlYG3lpokmRiUhDFilXVZwtrTixVBnYSeEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bh9GpVEF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bh9GpVEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757800060; x=1789336060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UIhBGziXXCfrD9r0wscDda/2MUxwh1Kn2yXznbGBwCw=;
  b=Bh9GpVEFbUQnYJGBjCoHgxo/nk+tcuDptYDygTGHh8GvQLGcGRPBTm+b
   NjfepCPfZIE8U4HU93OmkQJ979zRsRry/7FMc0fb9KFwpd8anmEyZXU74
   MWBaFqJC+NpbYoHhYHIYLSBYC1naXH63r8nUtAEZ1LaWRBB/5cv6dE+Hu
   A2OR2o/+0R4Usj+yCsDYj7bIfrYzaLYGHphHnsAoICj3J+4OhY88Nn0di
   wSi/an3MR4Hl9H4q2pC3wppB5GtH2gn5rFP6i7fX9LSPcotfkDLk3DVhF
   7qMnZvlSIx0E7PgQneFwryEKJp+9Xx7+Nm9HWRyFs63Ue3zN7igFGftxw
   Q==;
X-CSE-ConnectionGUID: jNUht4jYRhiUlApeq+UauQ==
X-CSE-MsgGUID: 5v6Np3XsT4uLy4hCD2EbvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="63926197"
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="63926197"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 14:47:39 -0700
X-CSE-ConnectionGUID: HcDpmYbpTBGCn4GBJS23cw==
X-CSE-MsgGUID: zMVwNoTyRvGvsMxgyfICdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="178298705"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 13 Sep 2025 14:47:38 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxY5j-0001t2-0v;
	Sat, 13 Sep 2025 21:47:32 +0000
Date: Sun, 14 Sep 2025 05:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicornxw@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/7] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <202509140558.2l1PajGn-lkp@intel.com>
References: <162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang@outlook.com>

Hi Chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-pci-Add-Sophgo-SG2042-PCIe-host/20250910-101159
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang%40outlook.com
patch subject: [PATCH v2 3/7] PCI: sg2042: Add Sophgo SG2042 PCIe driver
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20250914/202509140558.2l1PajGn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509140558.2l1PajGn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509140558.2l1PajGn-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "cdns_pcie_pm_ops" [drivers/pci/controller/cadence/pcie-sg2042.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

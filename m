Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9729B354E5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 22:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cbHUDF5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696976884; x=1728512884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OVo+v3mfC9EK3rBZgp1oi3KIb69A6tBkouEsPLy3ri4=;
  b=cbHUDF5f3SViJ3OuuQ+hZp2Le86egMVj5GBl2zbcFD+fADYqAgaTDuZ5
   wU3j83bmfJOd98OEnbi3icx9UEktQ0DreFWOGrd6syfxAttDfXbIMnA6W
   kjyK+ZH34jqZs4bPUovnVSXIq0cRbftDS2JfdHvWWsd9yh9FDwOJOMvcb
   YL8GvHgxkNrRHKr5PCFjKkart3Ku4z2yFUkpSiBWZxLYk1Cyi4gtt5H24
   z8QiSdrx0BFR5NTVg3b1PZvO5WhdiB+47RvQSRH+wJmpAkOSeyZ79DS5u
   kziPOZoSN2NEt28GRW/d6josGu08EZwYhP28P5qx1SSV2/m+Ew/5PxTUr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="388388012"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="388388012"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 15:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="788752402"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="788752402"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Oct 2023 15:27:30 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqLCK-0001IS-1m;
	Tue, 10 Oct 2023 22:27:28 +0000
Date: Wed, 11 Oct 2023 06:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Cheatham <Benjamin.Cheatham@amd.com>, rafael@kernel.org,
	dan.j.williams@intel.com, linux-cxl@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 4/5] cxl/port, EINJ: Add CXL EINJ callback functions
Message-ID: <202310110624.1GjFMfus-lkp@intel.com>
References: <20231010200254.764273-5-Benjamin.Cheatham@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010200254.764273-5-Benjamin.Cheatham@amd.com>

Hi Ben,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c66650d29764e228eba40b7a59fdb70fa6567daa]

url:    https://github.com/intel-lab-lkp/linux/commits/Ben-Cheatham/cxl-port-Add-EINJ-debugfs-files-and-callback-support/20231011-040503
base:   c66650d29764e228eba40b7a59fdb70fa6567daa
patch link:    https://lore.kernel.org/r/20231010200254.764273-5-Benjamin.Cheatham%40amd.com
patch subject: [PATCH v6 4/5] cxl/port, EINJ: Add CXL EINJ callback functions
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310110624.1GjFMfus-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110624.1GjFMfus-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#98: FILE: drivers/acpi/apei/einj.c:699:
+	devfn = (PCI_DEVFN(PCI_SLOT(pdev->devfn),PCI_FUNC(pdev->devfn)) << 8);
 	                                        ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

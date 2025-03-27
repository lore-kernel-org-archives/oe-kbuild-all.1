Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0D218C01D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104805; cv=none; b=AT7PX9kjMy9xaZcmsRlF+QiI/pSke4xItSC++JjD4+ZkxCAWx1j2AIoruxdwzNt4TEqm3F5thSEm5T6UMB8yH27rPgGs3dvnwdZoBpdhTyqkW7xNP00omcmsstooiJh7PDlLsT6PYJ49F2xcPYtTWS56u+94NBtsjumSHTHHNKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104805; c=relaxed/simple;
	bh=Y3DAXrhmJS11+/k3WUxtxug3NzcqkCqgUAGcywHAEbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DF5lMuDB/YtNizgge6U3OhY2/QVE3zps0AnBS1vUauLQaE4jC+gc6cPWIPQiVebfIyVVYS8u8B6XR6i0WaI2S9Sj5DE+fnibB9QIem4TPX7sNBECSe7URM8ALr5PMnSIWWagfojGeW72v4gkjfjhSdBpn/upSWXbCczAxsDzi3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrSOP6Ia; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrSOP6Ia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743104804; x=1774640804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y3DAXrhmJS11+/k3WUxtxug3NzcqkCqgUAGcywHAEbc=;
  b=UrSOP6IaT6uFoncKpaeQyVPt30cr+84YAdWuZ20T7Mugv7NTVxlT6hUN
   XnQIbjQraa1Y/qvPbf/KncoY8/lUUT4YRxA6fyzBns2RI4axoGmTxzgGv
   Hfl+3lg0EIpOA7n+flyng9XyUejLtTaG6iHcmWhhYuHf/FhPk5znA8QaW
   HvlBdjjFORgj0OFjbVR7V7EXYzWApMSCkMpZMWCpqUwye1WuMhxIheS5T
   WWvl9+vHvVIj1Z23LTBorRw5L01T9mSXNCHhwKA1bD7Qa+E+U7j1nzpk0
   dYmy/VGR7jO6QdQvnTbrCE7mhafGPSCcePhU6ACM5W/Essq/2TJdq1KOj
   w==;
X-CSE-ConnectionGUID: e0oXbgWfSy69AXsJPuPc/w==
X-CSE-MsgGUID: KJahP/d9SXiT8/FUnhBM6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48332296"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="48332296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 12:46:44 -0700
X-CSE-ConnectionGUID: iqj17n/BTsiKpIQ0ERJWgg==
X-CSE-MsgGUID: Mun+C5s7R3Wvr023f0NxkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="124998469"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Mar 2025 12:46:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txtBU-0006vT-0p;
	Thu, 27 Mar 2025 19:46:36 +0000
Date: Fri, 28 Mar 2025 03:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: Terry Bowman <terry.bowman@amd.com>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	nifan.cxl@gmail.com, dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, dan.j.williams@intel.com,
	bhelgaas@google.com, mahesh@linux.ibm.com, ira.weiny@intel.com,
	oohall@gmail.com, Benjamin.Cheatham@amd.com, rrichter@amd.com,
	nathan.fontenot@amd.com, Smita.KoralahalliChannabasappa@amd.com,
	lukas@wunner.de, ming.li@zohomail.com,
	PradeepVineshReddy.Kodamati@amd.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 13/16] cxl/pci: Assign CXL Endpoint protocol error
 handlers
Message-ID: <202503280346.euKvcovE-lkp@intel.com>
References: <20250327014717.2988633-14-terry.bowman@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327014717.2988633-14-terry.bowman@amd.com>

Hi Terry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on aae0594a7053c60b82621136257c8b648c67b512]

url:    https://github.com/intel-lab-lkp/linux/commits/Terry-Bowman/PCI-CXL-Introduce-PCIe-helper-function-pcie_is_cxl/20250327-095738
base:   aae0594a7053c60b82621136257c8b648c67b512
patch link:    https://lore.kernel.org/r/20250327014717.2988633-14-terry.bowman%40amd.com
patch subject: [PATCH v8 13/16] cxl/pci: Assign CXL Endpoint protocol error handlers
config: csky-randconfig-r122-20250327 (https://download.01.org/0day-ci/archive/20250328/202503280346.euKvcovE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250328/202503280346.euKvcovE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280346.euKvcovE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/port.c:68:33: sparse: sparse: symbol 'cxl_ep_error_handlers' was not declared. Should it be static?

vim +/cxl_ep_error_handlers +68 drivers/cxl/port.c

    67	
  > 68	const struct cxl_error_handlers cxl_ep_error_handlers = {
    69		.error_detected = cxl_error_detected,
    70		.cor_error_detected = cxl_cor_error_detected,
    71	};
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

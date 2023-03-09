Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37D4807
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 06:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678344318; x=1709880318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cs3vNazsszbTUlWEUkC6mluH9xTzAryK1Hv6ySX6Awc=;
  b=GDPwt1eu5X4rO9fLc1lQ+DL1aWBqRVrOleES5y2DByF3cjJQOecu0Amm
   erNn184NLWMq92EVfXPBpYD7ms54xgkZoC9BNejjZaYnr1CAohXtLOVhj
   bnMz4+pxZdox11PLVObuKRRNVCrVi9xzC8MJfI6QHcwebMErTS/GSjl4G
   qffT60D1j7Fk7AJ7AXZ+NWi/EjgMMgJPw9nIqQV/ZW4HYHQ21fRDLxz4x
   0ApqJHtW9NXxFWtxUv21VLMAEAUxbO4WhKlhrvYU+qtKvUhk0UhZS7UZl
   Ofc6JJCmOGrcaxvrNS9IVMAh/O56ZiYH1xBXX/X2rQmdKwraBp+iRXeqs
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316026713"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="316026713"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 22:45:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="741433490"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="741433490"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2023 22:45:13 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paA1Y-0002ij-28;
	Thu, 09 Mar 2023 06:45:12 +0000
Date: Thu, 9 Mar 2023 14:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [intel-tdx:guest-filter-upstream 5/31] htmldocs:
 Documentation/driver-api/device-authorize.rst:30: WARNING: Missing matching
 underline for section title overline.
Message-ID: <202303091408.0yK4MVg7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   6bcd8bef8871c6a80cb55b1cbb2651111da10890
commit: d0c26c6546ae5c1271597dc8fa1633456881afab [5/31] driver core: Add support to parse device authorize firmware
reproduce:
        # https://github.com/intel/tdx/commit/d0c26c6546ae5c1271597dc8fa1633456881afab
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout d0c26c6546ae5c1271597dc8fa1633456881afab
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091408.0yK4MVg7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/device-authorize.rst:30: WARNING: Missing matching underline for section title overline.

vim +30 Documentation/driver-api/device-authorize.rst

    29	
  > 30	----------------------------------------------------
    31	|             struct da_firmware_hdr               |
    32	|                (type=0, count=2)                 |
    33	----------------------------------------------------
    34	|             struct da_bus_hdr                    |
    35	|              (bus="pci", count=2)                |
    36	----------------------------------------------------
    37	|             struct da_pci_devce_id               |
    38	|                                                  |
    39	----------------------------------------------------
    40	|             struct da_pci_device_id              |
    41	|                                                  |
    42	----------------------------------------------------
    43	|             struct da_bus_hdr                    |
    44	|              (bus="platform", count=2)           |
    45	----------------------------------------------------
    46	|             struct da_bus_device_id              |
    47	|                                                  |
    48	----------------------------------------------------
    49	|             struct da_bus_device_id              |
    50	|                                                  |
    51	----------------------------------------------------
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1207A707
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 22:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709505927; cv=none; b=D3EmZ0s/H34UX8SDHfLuFnq3ulQUt7cGQ1jVWcdysVaMGlKXO81Jhd02fJcACOKOjqB3gvzREgJY/lulaan8Bv0q73ievmqKoU72UByvIeqhhPVo70khu1stB6KR4EsbdUsFw8CyvC7YlY9F/1b+zZ8e+weJVFX8B7EnfpxsioM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709505927; c=relaxed/simple;
	bh=YWOBToPtekDqXk7x0SRfSATjLgkJujcxJvY/XQU/Kgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eqpj1q+X0gI0XPoLXwqfSSoAFNCMyXfZdf1k5UqC1UszGr11vpATQZmKo7TMfEO0GuUV99NDLsquBDNd2vImor+SSMWJKri8MvR8ugxqAN9pKFm+PYpXIgjBhhVJbcmNsVzAXievV0IvuNWzPI0hBhwcyJy1lw2iWzJL1xV4SIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxA/E0tS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxA/E0tS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709505925; x=1741041925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YWOBToPtekDqXk7x0SRfSATjLgkJujcxJvY/XQU/Kgc=;
  b=HxA/E0tSxUPMJIrbUTKtz7c7+e9EYoik9mPggD+lSUZGBtONtl8zhV4d
   GW5dPPQ66m2kniZbViov1QXxV1kOFwSY3RvAYCuRCRn94oPD3c9uuw0p8
   0on98q3x03rkyTXA/NXHNIiXhiOBklfJ/isSWUql1SZRI4647oTaPZ4dN
   RnpbrM9+4oUrAWTc5FJMCb0WIVEoCgLT6b8AW8+xkd76y9slcTJC/2hlA
   0yZ+8jwOJPzsmQ/NRUlQEi6D031977cHdpOHIhfeXF8sJJxu44H5uIwcq
   iurkxv/PCyZoZXGQ+kAW2bqgmC1ewzBhMl1VOGNqtqjX71x9b6B07V6nO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4150509"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="4150509"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 14:45:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="9241273"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Mar 2024 14:45:20 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgua5-00029g-1N;
	Sun, 03 Mar 2024 22:45:17 +0000
Date: Mon, 4 Mar 2024 06:45:10 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 503/860]
 drivers/staging/xilinx_hdcp/xlnx_hdcp_rng.c:33:20: error: implicit
 declaration of function 'FIELD_GET'
Message-ID: <202403040640.Hn5LGfcL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   24eec56fe5bd68cae795c37c61276b4dcf218a53
commit: 70ce4da368ab0a329a7efb7c108b3cf889727403 [503/860] drm: xlnx: Add HDCP2X TX support
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240304/202403040640.Hn5LGfcL-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040640.Hn5LGfcL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040640.Hn5LGfcL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/xilinx_hdcp/xlnx_hdcp_rng.c: In function 'xlnx_hdcp2x_rng_cfg_init':
>> drivers/staging/xilinx_hdcp/xlnx_hdcp_rng.c:33:20: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      33 |         reg_read = FIELD_GET(XHDCP2X_RNG_MASK_16, reg_read);
         |                    ^~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/staging/xilinx_hdcp/xlnx_hdcp2x_cipher.c: In function 'xlnx_hdcp2x_cipher_cfg_init':
>> drivers/staging/xilinx_hdcp/xlnx_hdcp2x_cipher.c:54:20: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      54 |         reg_read = FIELD_GET(XHDCP2X_CIPHER_MASK_16, reg_read);
         |                    ^~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c: In function 'xlnx_hdcp2x_downstream_capbility':
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:411:17: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     411 |         return (FIELD_GET(XHDCP2X_TX_RXCAPS_MASK, rxcaps[0]) & HDCP_2_2_RX_CAPS_VERSION_VAL);
         |                 ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +33 drivers/staging/xilinx_hdcp/xlnx_hdcp_rng.c

537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03  26  
537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03  27  int xlnx_hdcp2x_rng_cfg_init(struct xlnx_hdcp2x_rng_hw *rng_cfg)
537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03  28  {
537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03  29  	u32 reg_read;
537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03  30  
537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03  31  	reg_read = xlnx_hdcp2x_rng_read(rng_cfg->rng_coreaddress,
537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03  32  					XHDCP2X_RNG_VER_ID_OFFSET);
537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03 @33  	reg_read = FIELD_GET(XHDCP2X_RNG_MASK_16, reg_read);
537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03  34  	if (reg_read != XHDCP2X_RNG_VER_ID)
537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03  35  		return (-EINVAL);
537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03  36  
537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03  37  	return 0;
537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03  38  }
537b8ed7de8b75 Lakshmi Prasanna Eachuri 2023-02-03  39  

:::::: The code at line 33 was first introduced by commit
:::::: 537b8ed7de8b7592785413c0e892c8c3343477ef staging: xilinx_hdcp: Add HDCP common functionality for Xilinx devices

:::::: TO: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

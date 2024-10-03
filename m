Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9479E2E419
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727973105; cv=none; b=G+GhmJFKYdWhDVxDnrK/FW2eGPw2BLYoMvoIqJPNFK7B5JfMvAwXx6sHnrGQmyUc2kCBe+VguCX8tj3y04pJ0tW/vCTJo/2hqTlmrvdro9Lckk2yz6d6M9VpRm7KLgbjarNPDZ94UyL+2qhj+IQ5avKZaGZ4gups5LaZ394SvOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727973105; c=relaxed/simple;
	bh=4Ih769v/yAEKB16tEOpdCKQlRYBNxVKJaVQwHhiidcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l9A1fTV8JF6ZpBDfGaGwijNeYOyT4wpjBdah6LlpMQOwnWEOOaPagwbDhZDvbEmXU9ekt+nRfpM1zPW4eQXyA1O9tvcZ60ex4AEp8IZ/hHdPbNQKT05PSs+oU3BsB0CVs8wQASik6qLhQIymu/7Fx9CSJeeW2Zp2kuZivyAmRm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1fygFgv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1fygFgv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727973104; x=1759509104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Ih769v/yAEKB16tEOpdCKQlRYBNxVKJaVQwHhiidcU=;
  b=U1fygFgvAYKfnHe7PSY9xzqwYvBPterLe/vONCQfQjgcwqLqTQ873jpa
   gNDAKlQ308/5PPgFWrZojtEpe1nagSiv0jthlXBInWrQ7MLqL1xNyiPTN
   pRmWWwAaxYafALzXbZJj2sAmm3m3yy2+V58daxOeKlgLa9Uyzijyi/OJq
   zFt0O2Cstz66cmkmBC9zw8O42sH4Dv0ie10NezPOf2dM2gY5EPFC5s6ui
   1c/MGuFo9JQPkk4yM3HjLeBC0jNFejsTDPLJmOsDo5DeUSLFLkXNcGryl
   G3A00Qg8baCcCc4XAfqttgw4VCYo33JurtAnOrd68mWle4v53Af/CuxrM
   w==;
X-CSE-ConnectionGUID: IAT9eReZTxWrr5QuT6nwZQ==
X-CSE-MsgGUID: Oz0JGcHPTKmMHyRYJRVgZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="30975858"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="30975858"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 09:31:43 -0700
X-CSE-ConnectionGUID: XQU/tANQSRWEMGuKLMxzog==
X-CSE-MsgGUID: PwqKtkmbQQuqHrCJMeN94Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="111867314"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2024 09:31:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swOjs-0000fg-0o;
	Thu, 03 Oct 2024 16:31:40 +0000
Date: Fri, 4 Oct 2024 00:31:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4762/16788]
 drivers/net/ethernet/freescale/dpaa2/dpsw.c:1674: warning: expecting
 prototype for dpsw_lag_set_cfg(). Prototype was for dpsw_lag_set() instead
Message-ID: <202410040023.1Crn6lBQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 0ac1e556be04191f6912e12a8227926b190532d4 [4762/16788] dpaa2-switch: Add the necessary MC API for HW LAG configuration
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241004/202410040023.1Crn6lBQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040023.1Crn6lBQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040023.1Crn6lBQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/freescale/dpaa2/dpsw.c:1674: warning: expecting prototype for dpsw_lag_set_cfg(). Prototype was for dpsw_lag_set() instead


vim +1674 drivers/net/ethernet/freescale/dpaa2/dpsw.c

  1662	
  1663	/**
  1664	 * dpsw_lag_set_cfg() - Set LAG configuration
  1665	 * @mc_io:   Pointer to MC portal's I/O object
  1666	 * @cmd_flags:      Command flags; one or more of 'MC_CMD_FLAG_'
  1667	 * @token:   Token of DPSW object
  1668	 * @cfg:     pointer to LAG configuration
  1669	 *
  1670	 * Return:   '0' on Success; Error code otherwise.
  1671	 */
  1672	int dpsw_lag_set(struct fsl_mc_io *mc_io, u32 cmd_flags, u16 token,
  1673			 const struct dpsw_lag_cfg *cfg)
> 1674	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

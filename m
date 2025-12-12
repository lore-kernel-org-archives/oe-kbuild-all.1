Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88AFD27E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 01:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765504258; cv=none; b=VQcBL/F7wae8i2BDpFp+/tZtQz4rtai9hMIP8hi/2WeX5RMF1qJhcONdUUjlvdPkxcmZ16c+ZKIb10r0FYr7gbBFgIb0Rjb/dtBYlAXyfIvWG1iKITxWwHT2sxT+0R+xHDNDsJN4bSHPCgzcdXiIUTssrLLboB5QxZ588WNKfeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765504258; c=relaxed/simple;
	bh=GlLiPZNMwSTago5i2R/oJmwZtcrQUT1ifZu9BGg3tEU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dYLPVb6laJJITSelq6vn08z51tDG+W6kxolzCQ/gD+bUICBpoqTKZkR99SadQugEuQuSy2zFfPGCHy1I9hbE2IYRk8O7y+9D+V1eiqrj0vJklslb1x4JLF7AoxrAcNqeQvyCyf6bBtKTcSzxiL8Vh3/QwbXyeFANbsN1FN05Spo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hnkj55Vl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hnkj55Vl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765504257; x=1797040257;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GlLiPZNMwSTago5i2R/oJmwZtcrQUT1ifZu9BGg3tEU=;
  b=Hnkj55Vlzuy13cUkxM6FG0cNAJ6KV0eTuEHu7adlraRlN8AnqqYOYnGu
   VCpUcgT63FEQbMAwt2ePfFOZfmHqSdEkgWOWu5Ye3jnELGQz1nIpi9JdT
   CgjkybsrSwM7Bcu/JBKef4XINxoS7ux7Fljucwda3qbVpiRpjkfFuBTfm
   irr2a21dreGRhy6qrCEHyWGwSgUGMq+RVWAJKbSbfsdaZN+0QICTZGzqc
   TbdbE3beXUvhmTCSLENO1ujQBf2JfNTFv7+8G7ItsyIHxvX1S0+RoV/cQ
   N33RojSz2IuhG8iGq8h6UKcWHzfXOh1khbts0WY+Z8BTro+gnUeAFQCx2
   Q==;
X-CSE-ConnectionGUID: lB6eGtNdRe2pyNBKuBrbjg==
X-CSE-MsgGUID: pLx80DdsTySpWhg+MaeJmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71341738"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71341738"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 17:50:56 -0800
X-CSE-ConnectionGUID: MdWPBmG1Qqi8C+pMb7/ccg==
X-CSE-MsgGUID: K2QusvFwTRmJpm6wzZZOWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196561164"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Dec 2025 17:50:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTsJ3-000000001GU-1i9u
	for oe-kbuild-all@lists.linux.dev;
	Fri, 12 Dec 2025 01:50:53 +0000
Date: Fri, 12 Dec 2025 02:50:26 +0100
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/emt 9/9] drivers/base/core.c:1994: warning: Function
 parameter or struct member 'con_handle' not described in
 '__fw_devlink_relax_cycles'
Message-ID: <202512120256.UybWlFTM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   aac28a88afc1d68448c7e5672fed4da83e10fe8b
commit: d34bf994bb973db1d142376e555e093c3146f730 [9/9] driver core: fw_devlink: Stop trying to optimize cycle detection logic
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512120256.UybWlFTM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120256.UybWlFTM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120256.UybWlFTM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/core.c:1994: warning: Function parameter or struct member 'con_handle' not described in '__fw_devlink_relax_cycles'
   drivers/base/core.c:1994: warning: Excess function parameter 'con' description in '__fw_devlink_relax_cycles'


vim +1994 drivers/base/core.c

411c0d58ca6faa Saravana Kannan 2023-02-06  1971  
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1972  /**
3fb16866b51ded Saravana Kannan 2023-02-06  1973   * __fw_devlink_relax_cycles - Relax and mark dependency cycles.
3fb16866b51ded Saravana Kannan 2023-02-06  1974   * @con: Potential consumer device.
3fb16866b51ded Saravana Kannan 2023-02-06  1975   * @sup_handle: Potential supplier's fwnode.
3fb16866b51ded Saravana Kannan 2023-02-06  1976   *
3fb16866b51ded Saravana Kannan 2023-02-06  1977   * Needs to be called with fwnode_lock and device link lock held.
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1978   *
3fb16866b51ded Saravana Kannan 2023-02-06  1979   * Check if @sup_handle or any of its ancestors or suppliers direct/indirectly
3fb16866b51ded Saravana Kannan 2023-02-06  1980   * depend on @con. This function can detect multiple cyles between @sup_handle
3fb16866b51ded Saravana Kannan 2023-02-06  1981   * and @con. When such dependency cycles are found, convert all device links
3fb16866b51ded Saravana Kannan 2023-02-06  1982   * created solely by fw_devlink into SYNC_STATE_ONLY device links. Also, mark
3fb16866b51ded Saravana Kannan 2023-02-06  1983   * all fwnode links in the cycle with FWLINK_FLAG_CYCLE so that when they are
3fb16866b51ded Saravana Kannan 2023-02-06  1984   * converted into a device link in the future, they are created as
3fb16866b51ded Saravana Kannan 2023-02-06  1985   * SYNC_STATE_ONLY device links. This is the equivalent of doing
3fb16866b51ded Saravana Kannan 2023-02-06  1986   * fw_devlink=permissive just between the devices in the cycle. We need to do
3fb16866b51ded Saravana Kannan 2023-02-06  1987   * this because, at this point, fw_devlink can't tell which of these
3fb16866b51ded Saravana Kannan 2023-02-06  1988   * dependencies is not a real dependency.
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1989   *
3fb16866b51ded Saravana Kannan 2023-02-06  1990   * Return true if one or more cycles were found. Otherwise, return false.
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1991   */
d34bf994bb973d Saravana Kannan 2024-10-30  1992  static bool __fw_devlink_relax_cycles(struct fwnode_handle *con_handle,
3fb16866b51ded Saravana Kannan 2023-02-06  1993  				 struct fwnode_handle *sup_handle)
b0e2fa4f611bb9 Saravana Kannan 2020-12-17 @1994  {
d34bf994bb973d Saravana Kannan 2024-10-30  1995  	struct device *sup_dev = NULL, *par_dev = NULL, *con_dev = NULL;
3fb16866b51ded Saravana Kannan 2023-02-06  1996  	struct fwnode_link *link;
3fb16866b51ded Saravana Kannan 2023-02-06  1997  	struct device_link *dev_link;
3fb16866b51ded Saravana Kannan 2023-02-06  1998  	bool ret = false;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1999  
3fb16866b51ded Saravana Kannan 2023-02-06  2000  	if (!sup_handle)
3fb16866b51ded Saravana Kannan 2023-02-06  2001  		return false;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2002  
3fb16866b51ded Saravana Kannan 2023-02-06  2003  	/*
3fb16866b51ded Saravana Kannan 2023-02-06  2004  	 * We aren't trying to find all cycles. Just a cycle between con and
3fb16866b51ded Saravana Kannan 2023-02-06  2005  	 * sup_handle.
3fb16866b51ded Saravana Kannan 2023-02-06  2006  	 */
3fb16866b51ded Saravana Kannan 2023-02-06  2007  	if (sup_handle->flags & FWNODE_FLAG_VISITED)
3fb16866b51ded Saravana Kannan 2023-02-06  2008  		return false;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2009  
3fb16866b51ded Saravana Kannan 2023-02-06  2010  	sup_handle->flags |= FWNODE_FLAG_VISITED;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2011  
3fb16866b51ded Saravana Kannan 2023-02-06  2012  	/* Termination condition. */
d34bf994bb973d Saravana Kannan 2024-10-30  2013  	if (sup_handle == con_handle) {
6e7ad1aebb4fc9 Saravana Kannan 2024-02-02  2014  		pr_debug("----- cycle: start -----\n");
3fb16866b51ded Saravana Kannan 2023-02-06  2015  		ret = true;
3fb16866b51ded Saravana Kannan 2023-02-06  2016  		goto out;
3fb16866b51ded Saravana Kannan 2023-02-06  2017  	}
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2018  
d34bf994bb973d Saravana Kannan 2024-10-30  2019  	sup_dev = get_dev_from_fwnode(sup_handle);
d34bf994bb973d Saravana Kannan 2024-10-30  2020  	con_dev = get_dev_from_fwnode(con_handle);
3fb16866b51ded Saravana Kannan 2023-02-06  2021  	/*
3fb16866b51ded Saravana Kannan 2023-02-06  2022  	 * If sup_dev is bound to a driver and @con hasn't started binding to a
3fb16866b51ded Saravana Kannan 2023-02-06  2023  	 * driver, sup_dev can't be a consumer of @con. So, no need to check
3fb16866b51ded Saravana Kannan 2023-02-06  2024  	 * further.
3fb16866b51ded Saravana Kannan 2023-02-06  2025  	 */
3fb16866b51ded Saravana Kannan 2023-02-06  2026  	if (sup_dev && sup_dev->links.status ==  DL_DEV_DRIVER_BOUND &&
d34bf994bb973d Saravana Kannan 2024-10-30  2027  	    con_dev && con_dev->links.status == DL_DEV_NO_DRIVER) {
3fb16866b51ded Saravana Kannan 2023-02-06  2028  		ret = false;
3fb16866b51ded Saravana Kannan 2023-02-06  2029  		goto out;
3fb16866b51ded Saravana Kannan 2023-02-06  2030  	}
3fb16866b51ded Saravana Kannan 2023-02-06  2031  
3fb16866b51ded Saravana Kannan 2023-02-06  2032  	list_for_each_entry(link, &sup_handle->suppliers, c_hook) {
b7e1241d8f77ed Saravana Kannan 2024-03-04  2033  		if (link->flags & FWLINK_FLAG_IGNORE)
b7e1241d8f77ed Saravana Kannan 2024-03-04  2034  			continue;
b7e1241d8f77ed Saravana Kannan 2024-03-04  2035  
d34bf994bb973d Saravana Kannan 2024-10-30  2036  		if (__fw_devlink_relax_cycles(con_handle, link->supplier)) {
3fb16866b51ded Saravana Kannan 2023-02-06  2037  			__fwnode_link_cycle(link);
3fb16866b51ded Saravana Kannan 2023-02-06  2038  			ret = true;
3fb16866b51ded Saravana Kannan 2023-02-06  2039  		}
3fb16866b51ded Saravana Kannan 2023-02-06  2040  	}
3fb16866b51ded Saravana Kannan 2023-02-06  2041  
3fb16866b51ded Saravana Kannan 2023-02-06  2042  	/*
3fb16866b51ded Saravana Kannan 2023-02-06  2043  	 * Give priority to device parent over fwnode parent to account for any
3fb16866b51ded Saravana Kannan 2023-02-06  2044  	 * quirks in how fwnodes are converted to devices.
3fb16866b51ded Saravana Kannan 2023-02-06  2045  	 */
3fb16866b51ded Saravana Kannan 2023-02-06  2046  	if (sup_dev)
3fb16866b51ded Saravana Kannan 2023-02-06  2047  		par_dev = get_device(sup_dev->parent);
3fb16866b51ded Saravana Kannan 2023-02-06  2048  	else
3fb16866b51ded Saravana Kannan 2023-02-06  2049  		par_dev = fwnode_get_next_parent_dev(sup_handle);
3fb16866b51ded Saravana Kannan 2023-02-06  2050  
d34bf994bb973d Saravana Kannan 2024-10-30  2051  	if (par_dev && __fw_devlink_relax_cycles(con_handle, par_dev->fwnode)) {
6e7ad1aebb4fc9 Saravana Kannan 2024-02-02  2052  		pr_debug("%pfwf: cycle: child of %pfwf\n", sup_handle,
6e7ad1aebb4fc9 Saravana Kannan 2024-02-02  2053  			 par_dev->fwnode);
3fb16866b51ded Saravana Kannan 2023-02-06  2054  		ret = true;
6e7ad1aebb4fc9 Saravana Kannan 2024-02-02  2055  	}
3fb16866b51ded Saravana Kannan 2023-02-06  2056  
3fb16866b51ded Saravana Kannan 2023-02-06  2057  	if (!sup_dev)
3fb16866b51ded Saravana Kannan 2023-02-06  2058  		goto out;
3fb16866b51ded Saravana Kannan 2023-02-06  2059  
3fb16866b51ded Saravana Kannan 2023-02-06  2060  	list_for_each_entry(dev_link, &sup_dev->links.suppliers, c_node) {
3fb16866b51ded Saravana Kannan 2023-02-06  2061  		/*
3fb16866b51ded Saravana Kannan 2023-02-06  2062  		 * Ignore a SYNC_STATE_ONLY flag only if it wasn't marked as
3fb16866b51ded Saravana Kannan 2023-02-06  2063  		 * such due to a cycle.
3fb16866b51ded Saravana Kannan 2023-02-06  2064  		 */
3fb16866b51ded Saravana Kannan 2023-02-06  2065  		if (device_link_flag_is_sync_state_only(dev_link->flags) &&
3fb16866b51ded Saravana Kannan 2023-02-06  2066  		    !(dev_link->flags & DL_FLAG_CYCLE))
3fb16866b51ded Saravana Kannan 2023-02-06  2067  			continue;
3fb16866b51ded Saravana Kannan 2023-02-06  2068  
d34bf994bb973d Saravana Kannan 2024-10-30  2069  		if (__fw_devlink_relax_cycles(con_handle,
3fb16866b51ded Saravana Kannan 2023-02-06  2070  					      dev_link->supplier->fwnode)) {
6e7ad1aebb4fc9 Saravana Kannan 2024-02-02  2071  			pr_debug("%pfwf: cycle: depends on %pfwf\n", sup_handle,
6e7ad1aebb4fc9 Saravana Kannan 2024-02-02  2072  				 dev_link->supplier->fwnode);
3fb16866b51ded Saravana Kannan 2023-02-06  2073  			fw_devlink_relax_link(dev_link);
3fb16866b51ded Saravana Kannan 2023-02-06  2074  			dev_link->flags |= DL_FLAG_CYCLE;
3fb16866b51ded Saravana Kannan 2023-02-06  2075  			ret = true;
3fb16866b51ded Saravana Kannan 2023-02-06  2076  		}
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2077  	}
3fb16866b51ded Saravana Kannan 2023-02-06  2078  
3fb16866b51ded Saravana Kannan 2023-02-06  2079  out:
3fb16866b51ded Saravana Kannan 2023-02-06  2080  	sup_handle->flags &= ~FWNODE_FLAG_VISITED;
3fb16866b51ded Saravana Kannan 2023-02-06  2081  	put_device(sup_dev);
3fb16866b51ded Saravana Kannan 2023-02-06  2082  	put_device(par_dev);
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2083  	return ret;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2084  }
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2085  

:::::: The code at line 1994 was first introduced by commit
:::::: b0e2fa4f611bb9ab22928605d5b1c7fd44e73955 driver core: Handle cycles in device links created by fw_devlink

:::::: TO: Saravana Kannan <saravanak@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

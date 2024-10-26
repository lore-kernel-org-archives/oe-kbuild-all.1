Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9014182D2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729959796; cv=none; b=DBzUvrBZBPqtTgK05wf9Itip9UJywujMFQ0F3HhvlWFCdsudjkYtcGxCeaZ2tOQMcJsuvvhpqGT+2MVEJYep1238+mbcjMA9kBa119BTM/mywxcnwUI2QOwASfngMs17LH1cn3xHeOofNEEF/iFT2v/yRTL4kuAJRe4UrTGNlZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729959796; c=relaxed/simple;
	bh=2yZvbcdLRAWXQC+jWKfk8hI9gJt3QS8mAg0Cd+Qb1ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+FmngxJ7EG89tyHsb8z7Ic6C8te4NzHmt4vOT/Ye1fiqsNIayhLoxNKIPuA1HT54wiityqNNpPvF3o/ldxcgpAQ7UGvyMfeOH3Bqqr3/MUt1nviVIM4kSsM6frEbgpSJ0fNuUvkFNvmaEVQA8v1pI9RBlvKyMPj8RXXtj+yWc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Se+LtJ5u; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Se+LtJ5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729959794; x=1761495794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2yZvbcdLRAWXQC+jWKfk8hI9gJt3QS8mAg0Cd+Qb1ck=;
  b=Se+LtJ5uHiwzEzXmWGn/SWejAaxdOoAL9R4oMr0oGn30hQ+Vy/I0QqQG
   aWLeIKjDhjnX4tfraJ2xMw59r1wezix+fJj8d0NcZxBuqpxzHTUwyZbzg
   L04SEuxAaKgZbnZvae18OCSqB8gR0KJ8eS/Mr1dQqhD6hA+0kRZTbo+ns
   Q/r4TfRGkaG2LzFcioZ5cl2OGy5EdRRhLHF0InN512+56BNDr0NgoADn0
   lkfP792D24UZWgEHKkqxAiybivJ5BmxBS9FzaM3YCkjdO3EQI35vZgsxn
   6pSdBo1E7bbW/JrkcS2rvjFpQu5OwejC9Cyq3mI9lvuEqh7ka77Hdz1q2
   w==;
X-CSE-ConnectionGUID: fr3giVoPQXG8Q2bOV7zdBw==
X-CSE-MsgGUID: IN1qe4E5Q9uVDZEAZVJurg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40718776"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40718776"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 09:23:13 -0700
X-CSE-ConnectionGUID: wUwo/2YPTEWrx5/gYAhykQ==
X-CSE-MsgGUID: 1eEa3nFBQzWS6P82bGV53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="85165668"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2024 09:23:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4jZG-000Zpw-0B;
	Sat, 26 Oct 2024 16:23:10 +0000
Date: Sun, 27 Oct 2024 00:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: Saravana Kannan <saravanak@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1] driver core: fw_devlink: Detect cycles when the
 supplier never gets a device
Message-ID: <202410270027.JET44wow-lkp@intel.com>
References: <20241025223721.184998-1-saravanak@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025223721.184998-1-saravanak@google.com>

Hi Saravana,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Saravana-Kannan/driver-core-fw_devlink-Detect-cycles-when-the-supplier-never-gets-a-device/20241026-063850
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20241025223721.184998-1-saravanak%40google.com
patch subject: [RFC PATCH v1] driver core: fw_devlink: Detect cycles when the supplier never gets a device
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241027/202410270027.JET44wow-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270027.JET44wow-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270027.JET44wow-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/core.c:1995: warning: Function parameter or struct member 'con_handle' not described in '__fw_devlink_relax_cycles'
>> drivers/base/core.c:1995: warning: Excess function parameter 'con' description in '__fw_devlink_relax_cycles'


vim +1995 drivers/base/core.c

411c0d58ca6faa Saravana Kannan 2023-02-06  1972  
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1973  /**
3fb16866b51ded Saravana Kannan 2023-02-06  1974   * __fw_devlink_relax_cycles - Relax and mark dependency cycles.
3fb16866b51ded Saravana Kannan 2023-02-06  1975   * @con: Potential consumer device.
3fb16866b51ded Saravana Kannan 2023-02-06  1976   * @sup_handle: Potential supplier's fwnode.
3fb16866b51ded Saravana Kannan 2023-02-06  1977   *
3fb16866b51ded Saravana Kannan 2023-02-06  1978   * Needs to be called with fwnode_lock and device link lock held.
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1979   *
3fb16866b51ded Saravana Kannan 2023-02-06  1980   * Check if @sup_handle or any of its ancestors or suppliers direct/indirectly
3fb16866b51ded Saravana Kannan 2023-02-06  1981   * depend on @con. This function can detect multiple cyles between @sup_handle
3fb16866b51ded Saravana Kannan 2023-02-06  1982   * and @con. When such dependency cycles are found, convert all device links
3fb16866b51ded Saravana Kannan 2023-02-06  1983   * created solely by fw_devlink into SYNC_STATE_ONLY device links. Also, mark
3fb16866b51ded Saravana Kannan 2023-02-06  1984   * all fwnode links in the cycle with FWLINK_FLAG_CYCLE so that when they are
3fb16866b51ded Saravana Kannan 2023-02-06  1985   * converted into a device link in the future, they are created as
3fb16866b51ded Saravana Kannan 2023-02-06  1986   * SYNC_STATE_ONLY device links. This is the equivalent of doing
3fb16866b51ded Saravana Kannan 2023-02-06  1987   * fw_devlink=permissive just between the devices in the cycle. We need to do
3fb16866b51ded Saravana Kannan 2023-02-06  1988   * this because, at this point, fw_devlink can't tell which of these
3fb16866b51ded Saravana Kannan 2023-02-06  1989   * dependencies is not a real dependency.
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1990   *
3fb16866b51ded Saravana Kannan 2023-02-06  1991   * Return true if one or more cycles were found. Otherwise, return false.
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1992   */
9b8595e1a045f8 Saravana Kannan 2024-10-25  1993  static bool __fw_devlink_relax_cycles(struct fwnode_handle *con_handle,
3fb16866b51ded Saravana Kannan 2023-02-06  1994  				 struct fwnode_handle *sup_handle)
b0e2fa4f611bb9 Saravana Kannan 2020-12-17 @1995  {
9b8595e1a045f8 Saravana Kannan 2024-10-25  1996  	struct device *sup_dev = NULL, *par_dev = NULL, *con_dev = NULL;
3fb16866b51ded Saravana Kannan 2023-02-06  1997  	struct fwnode_link *link;
3fb16866b51ded Saravana Kannan 2023-02-06  1998  	struct device_link *dev_link;
3fb16866b51ded Saravana Kannan 2023-02-06  1999  	bool ret = false;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2000  
3fb16866b51ded Saravana Kannan 2023-02-06  2001  	if (!sup_handle)
3fb16866b51ded Saravana Kannan 2023-02-06  2002  		return false;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2003  
3fb16866b51ded Saravana Kannan 2023-02-06  2004  	/*
3fb16866b51ded Saravana Kannan 2023-02-06  2005  	 * We aren't trying to find all cycles. Just a cycle between con and
3fb16866b51ded Saravana Kannan 2023-02-06  2006  	 * sup_handle.
3fb16866b51ded Saravana Kannan 2023-02-06  2007  	 */
3fb16866b51ded Saravana Kannan 2023-02-06  2008  	if (sup_handle->flags & FWNODE_FLAG_VISITED)
3fb16866b51ded Saravana Kannan 2023-02-06  2009  		return false;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2010  
3fb16866b51ded Saravana Kannan 2023-02-06  2011  	sup_handle->flags |= FWNODE_FLAG_VISITED;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2012  
3fb16866b51ded Saravana Kannan 2023-02-06  2013  	/* Termination condition. */
9b8595e1a045f8 Saravana Kannan 2024-10-25  2014  	if (sup_handle == con_handle) {
6e7ad1aebb4fc9 Saravana Kannan 2024-02-02  2015  		pr_debug("----- cycle: start -----\n");
3fb16866b51ded Saravana Kannan 2023-02-06  2016  		ret = true;
3fb16866b51ded Saravana Kannan 2023-02-06  2017  		goto out;
3fb16866b51ded Saravana Kannan 2023-02-06  2018  	}
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2019  
9b8595e1a045f8 Saravana Kannan 2024-10-25  2020  	sup_dev = get_dev_from_fwnode(sup_handle);
9b8595e1a045f8 Saravana Kannan 2024-10-25  2021  	con_dev = get_dev_from_fwnode(con_handle);
3fb16866b51ded Saravana Kannan 2023-02-06  2022  	/*
3fb16866b51ded Saravana Kannan 2023-02-06  2023  	 * If sup_dev is bound to a driver and @con hasn't started binding to a
3fb16866b51ded Saravana Kannan 2023-02-06  2024  	 * driver, sup_dev can't be a consumer of @con. So, no need to check
3fb16866b51ded Saravana Kannan 2023-02-06  2025  	 * further.
3fb16866b51ded Saravana Kannan 2023-02-06  2026  	 */
3fb16866b51ded Saravana Kannan 2023-02-06  2027  	if (sup_dev && sup_dev->links.status ==  DL_DEV_DRIVER_BOUND &&
9b8595e1a045f8 Saravana Kannan 2024-10-25  2028  	    con_dev->links.status == DL_DEV_NO_DRIVER) {
3fb16866b51ded Saravana Kannan 2023-02-06  2029  		ret = false;
3fb16866b51ded Saravana Kannan 2023-02-06  2030  		goto out;
3fb16866b51ded Saravana Kannan 2023-02-06  2031  	}
3fb16866b51ded Saravana Kannan 2023-02-06  2032  
3fb16866b51ded Saravana Kannan 2023-02-06  2033  	list_for_each_entry(link, &sup_handle->suppliers, c_hook) {
b7e1241d8f77ed Saravana Kannan 2024-03-04  2034  		if (link->flags & FWLINK_FLAG_IGNORE)
b7e1241d8f77ed Saravana Kannan 2024-03-04  2035  			continue;
b7e1241d8f77ed Saravana Kannan 2024-03-04  2036  
9b8595e1a045f8 Saravana Kannan 2024-10-25  2037  		if (__fw_devlink_relax_cycles(con_handle, link->supplier)) {
3fb16866b51ded Saravana Kannan 2023-02-06  2038  			__fwnode_link_cycle(link);
3fb16866b51ded Saravana Kannan 2023-02-06  2039  			ret = true;
3fb16866b51ded Saravana Kannan 2023-02-06  2040  		}
3fb16866b51ded Saravana Kannan 2023-02-06  2041  	}
3fb16866b51ded Saravana Kannan 2023-02-06  2042  
3fb16866b51ded Saravana Kannan 2023-02-06  2043  	/*
3fb16866b51ded Saravana Kannan 2023-02-06  2044  	 * Give priority to device parent over fwnode parent to account for any
3fb16866b51ded Saravana Kannan 2023-02-06  2045  	 * quirks in how fwnodes are converted to devices.
3fb16866b51ded Saravana Kannan 2023-02-06  2046  	 */
3fb16866b51ded Saravana Kannan 2023-02-06  2047  	if (sup_dev)
3fb16866b51ded Saravana Kannan 2023-02-06  2048  		par_dev = get_device(sup_dev->parent);
3fb16866b51ded Saravana Kannan 2023-02-06  2049  	else
3fb16866b51ded Saravana Kannan 2023-02-06  2050  		par_dev = fwnode_get_next_parent_dev(sup_handle);
3fb16866b51ded Saravana Kannan 2023-02-06  2051  
9b8595e1a045f8 Saravana Kannan 2024-10-25  2052  	if (par_dev && __fw_devlink_relax_cycles(con_handle, par_dev->fwnode)) {
6e7ad1aebb4fc9 Saravana Kannan 2024-02-02  2053  		pr_debug("%pfwf: cycle: child of %pfwf\n", sup_handle,
6e7ad1aebb4fc9 Saravana Kannan 2024-02-02  2054  			 par_dev->fwnode);
3fb16866b51ded Saravana Kannan 2023-02-06  2055  		ret = true;
6e7ad1aebb4fc9 Saravana Kannan 2024-02-02  2056  	}
3fb16866b51ded Saravana Kannan 2023-02-06  2057  
3fb16866b51ded Saravana Kannan 2023-02-06  2058  	if (!sup_dev)
3fb16866b51ded Saravana Kannan 2023-02-06  2059  		goto out;
3fb16866b51ded Saravana Kannan 2023-02-06  2060  
3fb16866b51ded Saravana Kannan 2023-02-06  2061  	list_for_each_entry(dev_link, &sup_dev->links.suppliers, c_node) {
3fb16866b51ded Saravana Kannan 2023-02-06  2062  		/*
3fb16866b51ded Saravana Kannan 2023-02-06  2063  		 * Ignore a SYNC_STATE_ONLY flag only if it wasn't marked as
3fb16866b51ded Saravana Kannan 2023-02-06  2064  		 * such due to a cycle.
3fb16866b51ded Saravana Kannan 2023-02-06  2065  		 */
3fb16866b51ded Saravana Kannan 2023-02-06  2066  		if (device_link_flag_is_sync_state_only(dev_link->flags) &&
3fb16866b51ded Saravana Kannan 2023-02-06  2067  		    !(dev_link->flags & DL_FLAG_CYCLE))
3fb16866b51ded Saravana Kannan 2023-02-06  2068  			continue;
3fb16866b51ded Saravana Kannan 2023-02-06  2069  
9b8595e1a045f8 Saravana Kannan 2024-10-25  2070  		if (__fw_devlink_relax_cycles(con_handle,
3fb16866b51ded Saravana Kannan 2023-02-06  2071  					      dev_link->supplier->fwnode)) {
6e7ad1aebb4fc9 Saravana Kannan 2024-02-02  2072  			pr_debug("%pfwf: cycle: depends on %pfwf\n", sup_handle,
6e7ad1aebb4fc9 Saravana Kannan 2024-02-02  2073  				 dev_link->supplier->fwnode);
3fb16866b51ded Saravana Kannan 2023-02-06  2074  			fw_devlink_relax_link(dev_link);
3fb16866b51ded Saravana Kannan 2023-02-06  2075  			dev_link->flags |= DL_FLAG_CYCLE;
3fb16866b51ded Saravana Kannan 2023-02-06  2076  			ret = true;
3fb16866b51ded Saravana Kannan 2023-02-06  2077  		}
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2078  	}
3fb16866b51ded Saravana Kannan 2023-02-06  2079  
3fb16866b51ded Saravana Kannan 2023-02-06  2080  out:
3fb16866b51ded Saravana Kannan 2023-02-06  2081  	sup_handle->flags &= ~FWNODE_FLAG_VISITED;
3fb16866b51ded Saravana Kannan 2023-02-06  2082  	put_device(sup_dev);
3fb16866b51ded Saravana Kannan 2023-02-06  2083  	put_device(par_dev);
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2084  	return ret;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2085  }
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2086  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

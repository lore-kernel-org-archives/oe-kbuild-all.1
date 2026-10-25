Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897470;
	b=YFhxKQOwx4HJ27iOyscU1DYgw1v9kZv1bf+o0xehQgnS7UXvwUE2mG59mF98F5pSYS85
	 vL4R2awSraxMYK0IJcefH2HaYso/slHaoL33G5NcdzpbPWCFO1UKRuERf5yK7Ursv1fj9
	 3kxk6FLFaas6oO9DtiW0KDkKP8UMNnk8h5uGT/zNZ3kYMGWYXYZeqHdwnnpWbEKaX8AE/
	 RjrtsvztrA0zXeTmkqMjhkbTuqfiQJoKnfcXfK3Bo16fQAj5fIZpAPcPL8JFvwFMuF6GL
	 yShQlRADL0Avq/uDNCRZaNEyRNGCfKelT6OFCSL8d79rseROc47M13Mer5XbMkRYoiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897470;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UnsBp/RFp8C0WAymmcfePUkieD+nlZai0xb8VWuWQSU=;
	b=VGH7g1lUjQTNgrqGA/GPIcvge+4iYhZbPtCRHZcG1PsPOuFa/7LyPFQne65inUWnIdDw
	 ChQSADNW1jX/hPDFJXGoJ33j2WJkdpgWeIOiQjEKvpuq608YBgI1zMLCvt8mHctL4WkRt
	 G9EUsKfUQ6p/eA/I0Cfdy7xPvcmQsiJxahU+ljyyZJVkTm903RzOjlYPrIrP+09q3MtbI
	 fi1j2qPAWwiYp9ocPDEEYzQqE6pN6+ycu66Bh0pqk3gQDVt2BUJ5gN0lKYvwvr58IMA6T
	 wJ/6mahtfK2qZ+4EcPTQxsB/42vAarjhr0JSICWQBMYctl8CA6dS16U0ZxjKhHJsTyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gBTNSB+f;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F2B606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 03:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F2B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gBTNSB+f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792897468; x=1824433468;
  h=date:from:to:cc:subject:message-id;
  bh=+wsriXMs5khdRlcyAr5d8CFrhSASmzGY9DHi4WVUNp8=;
  b=gBTNSB+fdkxhu2SRzrdcxndNg/rshm322eaBdcMXshUFqkU9Txv9qsvR
   zyQNhgPZ2Vly0rjJtPv6FyEA1fvKITZsdrTeUUTH4j3TjiGIvyzatZ78G
   ZFAKtENUHvK1eibR8pc/HP2hBqis7lNqkZqbCQCbMDw3fBVDEeEgeH490
   N/YK65P08mJXk9TK9lgk5GlAKM78uRxwHPc0UR8/EnFYxF3tf6Zt0jQh7
   ZRDjgtNANUzJUrztEUhbSFACLCFqbYU6fqC9HfMq7LTb/QKbUHhHhAvxW
   pnmJhkLNqK1TRWT4GnUP46xUjCoDgA0v9Kwte3F/R6GvYzwTtYSYamC2g
   w==;
X-CSE-ConnectionGUID: stUO0dGbT+eJcOemu4n7Lw==
X-CSE-MsgGUID: CKWQUXxqSkas0StqYhYj8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1613151"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1613151"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 20:04:27 -0700
X-CSE-ConnectionGUID: PqbvLMyGS4Kn3lQlij9YLw==
X-CSE-MsgGUID: Lgz1TcX5SASEGLdVD57d4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="4089145"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2026 20:04:22 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKoWx-00000000UV0-28Oq;
	Sun, 25 Oct 2026 03:04:19 +0000
Date: Sun, 25 Oct 2026 11:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1] drivers/base/core.c:1941:
 warning: Function parameter or member 'con_handle' not described in
 '__fw_devlink_relax_cycles'
Message-ID: <202610251023.v7Vd0Gut-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Saravana,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   745990bb615d19fb450877b6eb7050f085318f42
commit: f3ae93e738dbce362809662da7ac99c7297ee00c [0/1] driver core: fw_devlink: Stop trying to optimize cycle detection logic
config: i386-buildonly-randconfig-1002-20261020 (https://download.01.org/0day-ci/archive/20261025/202610251023.v7Vd0Gut-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251023.v7Vd0Gut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251023.v7Vd0Gut-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/core.c:68: warning: Function parameter or member 'flags' not described in '__fwnode_link_add'
>> drivers/base/core.c:1941: warning: Function parameter or member 'con_handle' not described in '__fw_devlink_relax_cycles'
   drivers/base/core.c:1941: warning: Excess function parameter 'con' description in '__fw_devlink_relax_cycles'


vim +1941 drivers/base/core.c

411c0d58ca6faa Saravana Kannan 2023-02-06  1918  
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1919  /**
3fb16866b51ded Saravana Kannan 2023-02-06  1920   * __fw_devlink_relax_cycles - Relax and mark dependency cycles.
3fb16866b51ded Saravana Kannan 2023-02-06  1921   * @con: Potential consumer device.
3fb16866b51ded Saravana Kannan 2023-02-06  1922   * @sup_handle: Potential supplier's fwnode.
3fb16866b51ded Saravana Kannan 2023-02-06  1923   *
3fb16866b51ded Saravana Kannan 2023-02-06  1924   * Needs to be called with fwnode_lock and device link lock held.
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1925   *
3fb16866b51ded Saravana Kannan 2023-02-06  1926   * Check if @sup_handle or any of its ancestors or suppliers direct/indirectly
3fb16866b51ded Saravana Kannan 2023-02-06  1927   * depend on @con. This function can detect multiple cyles between @sup_handle
3fb16866b51ded Saravana Kannan 2023-02-06  1928   * and @con. When such dependency cycles are found, convert all device links
3fb16866b51ded Saravana Kannan 2023-02-06  1929   * created solely by fw_devlink into SYNC_STATE_ONLY device links. Also, mark
3fb16866b51ded Saravana Kannan 2023-02-06  1930   * all fwnode links in the cycle with FWLINK_FLAG_CYCLE so that when they are
3fb16866b51ded Saravana Kannan 2023-02-06  1931   * converted into a device link in the future, they are created as
3fb16866b51ded Saravana Kannan 2023-02-06  1932   * SYNC_STATE_ONLY device links. This is the equivalent of doing
3fb16866b51ded Saravana Kannan 2023-02-06  1933   * fw_devlink=permissive just between the devices in the cycle. We need to do
3fb16866b51ded Saravana Kannan 2023-02-06  1934   * this because, at this point, fw_devlink can't tell which of these
3fb16866b51ded Saravana Kannan 2023-02-06  1935   * dependencies is not a real dependency.
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1936   *
3fb16866b51ded Saravana Kannan 2023-02-06  1937   * Return true if one or more cycles were found. Otherwise, return false.
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1938   */
f3ae93e738dbce Saravana Kannan 2024-10-30  1939  static bool __fw_devlink_relax_cycles(struct fwnode_handle *con_handle,
3fb16866b51ded Saravana Kannan 2023-02-06  1940  				 struct fwnode_handle *sup_handle)
b0e2fa4f611bb9 Saravana Kannan 2020-12-17 @1941  {
f3ae93e738dbce Saravana Kannan 2024-10-30  1942  	struct device *sup_dev = NULL, *par_dev = NULL, *con_dev = NULL;
3fb16866b51ded Saravana Kannan 2023-02-06  1943  	struct fwnode_link *link;
3fb16866b51ded Saravana Kannan 2023-02-06  1944  	struct device_link *dev_link;
3fb16866b51ded Saravana Kannan 2023-02-06  1945  	bool ret = false;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1946  
3fb16866b51ded Saravana Kannan 2023-02-06  1947  	if (!sup_handle)
3fb16866b51ded Saravana Kannan 2023-02-06  1948  		return false;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1949  
3fb16866b51ded Saravana Kannan 2023-02-06  1950  	/*
3fb16866b51ded Saravana Kannan 2023-02-06  1951  	 * We aren't trying to find all cycles. Just a cycle between con and
3fb16866b51ded Saravana Kannan 2023-02-06  1952  	 * sup_handle.
3fb16866b51ded Saravana Kannan 2023-02-06  1953  	 */
3fb16866b51ded Saravana Kannan 2023-02-06  1954  	if (sup_handle->flags & FWNODE_FLAG_VISITED)
3fb16866b51ded Saravana Kannan 2023-02-06  1955  		return false;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1956  
3fb16866b51ded Saravana Kannan 2023-02-06  1957  	sup_handle->flags |= FWNODE_FLAG_VISITED;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1958  
3fb16866b51ded Saravana Kannan 2023-02-06  1959  	/* Termination condition. */
f3ae93e738dbce Saravana Kannan 2024-10-30  1960  	if (sup_handle == con_handle) {
5c764791fb7b81 Saravana Kannan 2024-02-02  1961  		pr_debug("----- cycle: start -----\n");
3fb16866b51ded Saravana Kannan 2023-02-06  1962  		ret = true;
3fb16866b51ded Saravana Kannan 2023-02-06  1963  		goto out;
3fb16866b51ded Saravana Kannan 2023-02-06  1964  	}
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  1965  
f3ae93e738dbce Saravana Kannan 2024-10-30  1966  	sup_dev = get_dev_from_fwnode(sup_handle);
f3ae93e738dbce Saravana Kannan 2024-10-30  1967  	con_dev = get_dev_from_fwnode(con_handle);
3fb16866b51ded Saravana Kannan 2023-02-06  1968  	/*
3fb16866b51ded Saravana Kannan 2023-02-06  1969  	 * If sup_dev is bound to a driver and @con hasn't started binding to a
3fb16866b51ded Saravana Kannan 2023-02-06  1970  	 * driver, sup_dev can't be a consumer of @con. So, no need to check
3fb16866b51ded Saravana Kannan 2023-02-06  1971  	 * further.
3fb16866b51ded Saravana Kannan 2023-02-06  1972  	 */
3fb16866b51ded Saravana Kannan 2023-02-06  1973  	if (sup_dev && sup_dev->links.status ==  DL_DEV_DRIVER_BOUND &&
f3ae93e738dbce Saravana Kannan 2024-10-30  1974  	    con_dev && con_dev->links.status == DL_DEV_NO_DRIVER) {
3fb16866b51ded Saravana Kannan 2023-02-06  1975  		ret = false;
3fb16866b51ded Saravana Kannan 2023-02-06  1976  		goto out;
3fb16866b51ded Saravana Kannan 2023-02-06  1977  	}
3fb16866b51ded Saravana Kannan 2023-02-06  1978  
3fb16866b51ded Saravana Kannan 2023-02-06  1979  	list_for_each_entry(link, &sup_handle->suppliers, c_hook) {
dce7a5c7bfa36d Saravana Kannan 2024-03-04  1980  		if (link->flags & FWLINK_FLAG_IGNORE)
dce7a5c7bfa36d Saravana Kannan 2024-03-04  1981  			continue;
dce7a5c7bfa36d Saravana Kannan 2024-03-04  1982  
f3ae93e738dbce Saravana Kannan 2024-10-30  1983  		if (__fw_devlink_relax_cycles(con_handle, link->supplier)) {
3fb16866b51ded Saravana Kannan 2023-02-06  1984  			__fwnode_link_cycle(link);
3fb16866b51ded Saravana Kannan 2023-02-06  1985  			ret = true;
3fb16866b51ded Saravana Kannan 2023-02-06  1986  		}
3fb16866b51ded Saravana Kannan 2023-02-06  1987  	}
3fb16866b51ded Saravana Kannan 2023-02-06  1988  
3fb16866b51ded Saravana Kannan 2023-02-06  1989  	/*
3fb16866b51ded Saravana Kannan 2023-02-06  1990  	 * Give priority to device parent over fwnode parent to account for any
3fb16866b51ded Saravana Kannan 2023-02-06  1991  	 * quirks in how fwnodes are converted to devices.
3fb16866b51ded Saravana Kannan 2023-02-06  1992  	 */
3fb16866b51ded Saravana Kannan 2023-02-06  1993  	if (sup_dev)
3fb16866b51ded Saravana Kannan 2023-02-06  1994  		par_dev = get_device(sup_dev->parent);
3fb16866b51ded Saravana Kannan 2023-02-06  1995  	else
3fb16866b51ded Saravana Kannan 2023-02-06  1996  		par_dev = fwnode_get_next_parent_dev(sup_handle);
3fb16866b51ded Saravana Kannan 2023-02-06  1997  
f3ae93e738dbce Saravana Kannan 2024-10-30  1998  	if (par_dev && __fw_devlink_relax_cycles(con_handle, par_dev->fwnode)) {
5c764791fb7b81 Saravana Kannan 2024-02-02  1999  		pr_debug("%pfwf: cycle: child of %pfwf\n", sup_handle,
5c764791fb7b81 Saravana Kannan 2024-02-02  2000  			 par_dev->fwnode);
3fb16866b51ded Saravana Kannan 2023-02-06  2001  		ret = true;
5c764791fb7b81 Saravana Kannan 2024-02-02  2002  	}
3fb16866b51ded Saravana Kannan 2023-02-06  2003  
3fb16866b51ded Saravana Kannan 2023-02-06  2004  	if (!sup_dev)
3fb16866b51ded Saravana Kannan 2023-02-06  2005  		goto out;
3fb16866b51ded Saravana Kannan 2023-02-06  2006  
3fb16866b51ded Saravana Kannan 2023-02-06  2007  	list_for_each_entry(dev_link, &sup_dev->links.suppliers, c_node) {
3fb16866b51ded Saravana Kannan 2023-02-06  2008  		/*
3fb16866b51ded Saravana Kannan 2023-02-06  2009  		 * Ignore a SYNC_STATE_ONLY flag only if it wasn't marked as
3fb16866b51ded Saravana Kannan 2023-02-06  2010  		 * such due to a cycle.
3fb16866b51ded Saravana Kannan 2023-02-06  2011  		 */
3fb16866b51ded Saravana Kannan 2023-02-06  2012  		if (device_link_flag_is_sync_state_only(dev_link->flags) &&
3fb16866b51ded Saravana Kannan 2023-02-06  2013  		    !(dev_link->flags & DL_FLAG_CYCLE))
3fb16866b51ded Saravana Kannan 2023-02-06  2014  			continue;
3fb16866b51ded Saravana Kannan 2023-02-06  2015  
f3ae93e738dbce Saravana Kannan 2024-10-30  2016  		if (__fw_devlink_relax_cycles(con_handle,
3fb16866b51ded Saravana Kannan 2023-02-06  2017  					      dev_link->supplier->fwnode)) {
5c764791fb7b81 Saravana Kannan 2024-02-02  2018  			pr_debug("%pfwf: cycle: depends on %pfwf\n", sup_handle,
5c764791fb7b81 Saravana Kannan 2024-02-02  2019  				 dev_link->supplier->fwnode);
3fb16866b51ded Saravana Kannan 2023-02-06  2020  			fw_devlink_relax_link(dev_link);
3fb16866b51ded Saravana Kannan 2023-02-06  2021  			dev_link->flags |= DL_FLAG_CYCLE;
3fb16866b51ded Saravana Kannan 2023-02-06  2022  			ret = true;
3fb16866b51ded Saravana Kannan 2023-02-06  2023  		}
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2024  	}
3fb16866b51ded Saravana Kannan 2023-02-06  2025  
3fb16866b51ded Saravana Kannan 2023-02-06  2026  out:
3fb16866b51ded Saravana Kannan 2023-02-06  2027  	sup_handle->flags &= ~FWNODE_FLAG_VISITED;
3fb16866b51ded Saravana Kannan 2023-02-06  2028  	put_device(sup_dev);
3fb16866b51ded Saravana Kannan 2023-02-06  2029  	put_device(par_dev);
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2030  	return ret;
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2031  }
b0e2fa4f611bb9 Saravana Kannan 2020-12-17  2032  

:::::: The code at line 1941 was first introduced by commit
:::::: b0e2fa4f611bb9ab22928605d5b1c7fd44e73955 driver core: Handle cycles in device links created by fw_devlink

:::::: TO: Saravana Kannan <saravanak@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

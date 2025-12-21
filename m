Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7961E521A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 04:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766290918; cv=none; b=tkCqNJwpNOa4XfFduNJ4aRQOp6IemrkdmwmlhMxfHqxgssDrPe02L3GJf6yNOn8EcCBzd5Z92UHjdimM7ZumeO2UC+MJ5bVv27Nt84vLUOGpA5tKCuAdFxlqFPx6B1eGizIhj2M2t2nmfHA3L6LJ1jCgEcVeas+lKEZW9GcFflk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766290918; c=relaxed/simple;
	bh=Cfc4np5R/P+qdKbq9Z3lx0CfZK7/7x8vYQSoyQSNf+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RCEpSFVdqvgug/SRNVKjpjzgVf4TzaAytSsfgthEsQJ2TUNtM4lJGMOTzFRtvOlnO9BcTzvNtEUj8QDwrFRuT5tCrisfPHo4OQir9ICCj4PCpt156QuPXHvEUZmZjq9sHxORpWWeRgNtWiWAfbOUK7XLcf6Tb2nVAOkZXZ38H4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgOR9vx1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgOR9vx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766290916; x=1797826916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cfc4np5R/P+qdKbq9Z3lx0CfZK7/7x8vYQSoyQSNf+E=;
  b=cgOR9vx12oP0WYrOTFFOIm/Kv2A7oevLTsqNuNsVmnXz586MyXjjSe9n
   apFiCeij3qPG4BWAfdKsa99VHGNRDCIGHl4UU/3mX6gGL15lixUT+UOBJ
   rMViDrIbf2viyxMEDNzXmnLNquUWW/7QM44uGX7xnUhg1rxva74JuvRVm
   9xlFGzu1ipRrHeC/r7PD3YEFmqdx/aomTLCh5HXGL1X0966iP/LB2Qd4h
   rqB1u3gLU4DlBVVqOQTXk9/w7TjZ7+6mnhD9Vi9L0cOXM8kM4+yq87PLz
   tSxR6V+8fnsW2bmg3PYEEm/4g3ZnE/XxW/EVruLROEo4jDaQcg9VWMQDh
   A==;
X-CSE-ConnectionGUID: Bk+hlvOPRkagMKb90VdNKw==
X-CSE-MsgGUID: LGOlmm9ESEiBF2K5BqTdLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78830020"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78830020"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 20:21:55 -0800
X-CSE-ConnectionGUID: W/R+cKf4RdqeGfaohVWRPg==
X-CSE-MsgGUID: eXrtJTqbSx6x+V+hkLXSFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199740440"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2025 20:21:54 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXAx6-000000004vw-1Dje;
	Sun, 21 Dec 2025 04:21:52 +0000
Date: Sun, 21 Dec 2025 05:21:13 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 458/458] drivers/of/base.c:1934:
 warning: Excess function parameter 'prob' description in
 'of_remove_property'
Message-ID: <202512210538.0lurczUT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   8cc11e1aa30fd981a8d5bd390a4352c37dfe543e
commit: 36ce931a803b7f1066668e1c0ab846c1a4b0c35d [458/458] of: base: Fix some formatting issues and provide missing descriptions
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251221/202512210538.0lurczUT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210538.0lurczUT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210538.0lurczUT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/of/base.c:1860: warning: Function parameter or member 'prop' not described in '__of_add_property'
   drivers/of/base.c:1860: warning: Excess function parameter 'prob' description in '__of_add_property'
   drivers/of/base.c:1883: warning: Function parameter or member 'prop' not described in 'of_add_property'
   drivers/of/base.c:1883: warning: Excess function parameter 'prob' description in 'of_add_property'
   drivers/of/base.c:1934: warning: Function parameter or member 'prop' not described in 'of_remove_property'
>> drivers/of/base.c:1934: warning: Excess function parameter 'prob' description in 'of_remove_property'


vim +1934 drivers/of/base.c

d8c50088417ebf Pantelis Antoniou    2014-07-04  1922  
02af11b03fce3d Grant Likely         2009-11-23  1923  /**
79d1c712958f94 Nathan Fontenot      2012-10-02  1924   * of_remove_property - Remove a property from a node.
36ce931a803b7f Lee Jones            2021-03-18  1925   * @np:		Caller's Device Node
36ce931a803b7f Lee Jones            2021-03-18  1926   * @prob:	Property to remove
02af11b03fce3d Grant Likely         2009-11-23  1927   *
02af11b03fce3d Grant Likely         2009-11-23  1928   * Note that we don't actually remove it, since we have given out
02af11b03fce3d Grant Likely         2009-11-23  1929   * who-knows-how-many pointers to the data using get-property.
02af11b03fce3d Grant Likely         2009-11-23  1930   * Instead we just move the property to the "dead properties"
02af11b03fce3d Grant Likely         2009-11-23  1931   * list, so it won't be found any more.
02af11b03fce3d Grant Likely         2009-11-23  1932   */
79d1c712958f94 Nathan Fontenot      2012-10-02  1933  int of_remove_property(struct device_node *np, struct property *prop)
02af11b03fce3d Grant Likely         2009-11-23 @1934  {
02af11b03fce3d Grant Likely         2009-11-23  1935  	unsigned long flags;
1cf3d8b3d24cd3 Nathan Fontenot      2012-10-02  1936  	int rc;
1cf3d8b3d24cd3 Nathan Fontenot      2012-10-02  1937  
201b3fe586361c Suraj Jitindar Singh 2016-04-28  1938  	if (!prop)
201b3fe586361c Suraj Jitindar Singh 2016-04-28  1939  		return -ENODEV;
201b3fe586361c Suraj Jitindar Singh 2016-04-28  1940  
8a2b22a2595bf8 Grant Likely         2014-07-23  1941  	mutex_lock(&of_mutex);
02af11b03fce3d Grant Likely         2009-11-23  1942  
d6d3c4e656513d Thomas Gleixner      2013-02-06  1943  	raw_spin_lock_irqsave(&devtree_lock, flags);
d8c50088417ebf Pantelis Antoniou    2014-07-04  1944  	rc = __of_remove_property(np, prop);
d6d3c4e656513d Thomas Gleixner      2013-02-06  1945  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
02af11b03fce3d Grant Likely         2009-11-23  1946  
8a2b22a2595bf8 Grant Likely         2014-07-23  1947  	if (!rc)
8a2b22a2595bf8 Grant Likely         2014-07-23  1948  		__of_remove_property_sysfs(np, prop);
02af11b03fce3d Grant Likely         2009-11-23  1949  
8a2b22a2595bf8 Grant Likely         2014-07-23  1950  	mutex_unlock(&of_mutex);
75b57ecf9d1d1e Grant Likely         2014-02-20  1951  
259092a35c7e11 Grant Likely         2014-07-16  1952  	if (!rc)
259092a35c7e11 Grant Likely         2014-07-16  1953  		of_property_notify(OF_RECONFIG_REMOVE_PROPERTY, np, prop, NULL);
02af11b03fce3d Grant Likely         2009-11-23  1954  
8a2b22a2595bf8 Grant Likely         2014-07-23  1955  	return rc;
02af11b03fce3d Grant Likely         2009-11-23  1956  }
02af11b03fce3d Grant Likely         2009-11-23  1957  

:::::: The code at line 1934 was first introduced by commit
:::::: 02af11b03fce3ddb264d7873d7a2e295e697938c of: merge prom_{add,remove,modify}_property

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

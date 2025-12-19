Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B7A2C21FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 05:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766122078; cv=none; b=mWO2B2y3LWaTtLKlCnE81aIW40ri41xg2XG8ddgW1xYBjkyhVzGPv4bnJQS7PwOUW5tcbvNGdi0H93YvtnfTpGb+b3bmiGwRmjlK4hgbbsYIHgq93nPlCHmbdIYi5GErQdf0ZH+oScsIwyDgGfgGzfAO0JBtMczRvlJ7TfPwD4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766122078; c=relaxed/simple;
	bh=5MzfvGAjuea3dcQy5JJhCoWtGa6Tb1bRaVwMRTshCMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oh9ClWWb9yEqvWer9h15E1O2QIBsX51f65+9SqI2Z8f+t8EPQRiescwe1/7M5t+BEkQEGVRg4b7aW6LmD260Ao1H1DoMzMQQtYW8aKymZAHG45un/4gEdh/SZE0o0bNk1GSOTvNw7ZjfjCwiY7wpcbo9P4SpX7qkpZoOKGAlzBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=guopV3Jp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guopV3Jp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766122076; x=1797658076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5MzfvGAjuea3dcQy5JJhCoWtGa6Tb1bRaVwMRTshCMg=;
  b=guopV3JpQifqPT3fraoMWyHBmEohrByqjVRLJ0slABuMGNhWR+64cY3p
   ETucCU9fUXbupdcRc20WSLBsAMMpcwJHDGBGx21ufmutRbRyIsUZHyBL0
   f5krm9RkjuEW2rCya1VawbkkP0Sl03+AGDknTUNTqSUpGZKurEw9c71c0
   ZJ5XTJ9HNkT07eVrbVmO3Acj3LwISSBKppEoV41w/CcrpnpS+nX4Pp/A2
   AG0iO4uDZjnG15VnFl4eyKeF4EjdZsxnC1ZaNzFk5tUFZdieeCJIh1OLS
   9zc6yAP+rA0K3E0BWeSXugaUzcgKnpNKtpMzqlVSPSOHyre7rmLnXn4lb
   g==;
X-CSE-ConnectionGUID: LZV2JlGlTMOkq+EsOlQmZQ==
X-CSE-MsgGUID: +mt/F9WSSmKPTwbsFI9T4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68124096"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68124096"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 21:27:55 -0800
X-CSE-ConnectionGUID: OXzhouoORXy/hq1jkG0rtw==
X-CSE-MsgGUID: 29cFaH7VS9e7xePbj3fuag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="229452168"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Dec 2025 21:27:55 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWT1s-00000000353-0S5y;
	Fri, 19 Dec 2025 05:27:52 +0000
Date: Fri, 19 Dec 2025 13:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4]
 drivers/of/property.c:1326: warning: Excess function parameter 'dev'
 description in 'of_link_property'
Message-ID: <202512191351.MmtFLfVF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: 6427c92e7f02c14472f805097a6d19c70a5f5592 [0/4] UPSTREAM: of: property: Update implementation of add_links() to create fwnode links
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251219/202512191351.MmtFLfVF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191351.MmtFLfVF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191351.MmtFLfVF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/property.c:1326: warning: Excess function parameter 'dev' description in 'of_link_property'


vim +1326 drivers/of/property.c

a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1304  
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1305  /**
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1306   * of_link_property - Create device links to suppliers listed in a property
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1307   * @dev: Consumer device
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1308   * @con_np: The consumer device tree node which contains the property
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1309   * @prop_name: Name of property to be parsed
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1310   *
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1311   * This function checks if the property @prop_name that is present in the
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1312   * @con_np device tree node is one of the known common device tree bindings
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1313   * that list phandles to suppliers. If @prop_name isn't one, this function
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1314   * doesn't do anything.
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1315   *
6427c92e7f02c1 Saravana Kannan 2020-11-20  1316   * If @prop_name is one, this function attempts to create fwnode links from the
6427c92e7f02c1 Saravana Kannan 2020-11-20  1317   * consumer device tree node @con_np to all the suppliers device tree nodes
6427c92e7f02c1 Saravana Kannan 2020-11-20  1318   * listed in @prop_name.
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1319   *
6427c92e7f02c1 Saravana Kannan 2020-11-20  1320   * Any failed attempt to create a fwnode link will NOT result in an immediate
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1321   * return.  of_link_property() must create links to all the available supplier
6427c92e7f02c1 Saravana Kannan 2020-11-20  1322   * device tree nodes even when attempts to create a link to one or more
6427c92e7f02c1 Saravana Kannan 2020-11-20  1323   * suppliers fail.
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1324   */
6427c92e7f02c1 Saravana Kannan 2020-11-20  1325  static int of_link_property(struct device_node *con_np, const char *prop_name)
a3e1d1a7f5fccc Saravana Kannan 2019-09-04 @1326  {
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1327  	struct device_node *phandle;
af1b967af5ffb9 Saravana Kannan 2019-10-11  1328  	const struct supplier_bindings *s = of_supplier_bindings;
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1329  	unsigned int i = 0;
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1330  	bool matched = false;
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1331  	int ret = 0;
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1332  
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1333  	/* Do not stop at first failed link, link all available suppliers. */
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1334  	while (!matched && s->parse_prop) {
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1335  		while ((phandle = s->parse_prop(con_np, prop_name, i))) {
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1336  			matched = true;
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1337  			i++;
6427c92e7f02c1 Saravana Kannan 2020-11-20  1338  			of_link_to_phandle(con_np, phandle);
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1339  			of_node_put(phandle);
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1340  		}
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1341  		s++;
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1342  	}
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1343  	return ret;
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1344  }
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1345  

:::::: The code at line 1326 was first introduced by commit
:::::: a3e1d1a7f5fcccaf1d252278425fea9a4a553100 of: property: Add functional dependency link from DT bindings

:::::: TO: Saravana Kannan <saravanak@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

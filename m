Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D5C12B69
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 17:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wm+KZE5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699120684; x=1730656684;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=45KijrNPATEv0bTVnHZlUbyijH+I0A/q4RBwDi5Pn/o=;
  b=Wm+KZE5YEu5xbgolsSj5U6Sy5219zldOui1aMsT2j8l2R8W4l6lsEpCB
   bM4Coq4GoG/j3VP3F7aKWEmhy20RaSc8nRf5EoXBKZi/9FjeyMVTYj5Vv
   ZunNXfzntrvIoMPtna761u60xn9ctaPLjvt3kRtXjXyAi2lu7ZSZQ112R
   YiEeM/P2UqETUZc/l+6cRDtl590EMz6+YkEqZc99ppYbEdbkmBYdKuVJM
   KnKgJbm/A8s+cOojqOSPpxi83B/eA3dSLHwGzNxB6He6sAsAUxvjXAIhS
   NGJFzRJGM1Y4Puj9TcqH7Xl0zMV72YM+BX9MNowjqWPMzmkBiT4XAguuu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="368436829"
X-IronPort-AV: E=Sophos;i="6.03,277,1694761200"; 
   d="scan'208";a="368436829"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 10:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,277,1694761200"; 
   d="scan'208";a="3045192"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2023 10:57:59 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzKuE-0004c0-1H;
	Sat, 04 Nov 2023 17:57:58 +0000
Date: Sun, 5 Nov 2023 01:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:debugfs_cleanup 6/7]
 drivers/platform/x86/amd/hsmp.c:474:16: error: implicit declaration of
 function 'devm_device_add_groups'; did you mean 'devm_device_add_group'?
Message-ID: <202311050113.QCp9Dss3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git debugfs_cleanup
head:   447e92735758c923913ee53b75c6b92ef756985b
commit: bd0388a53cc216e4d4b367b37565e87c3147d25d [6/7] driver core: remove devm_device_add_groups()
config: x86_64-randconfig-005-20231104 (https://download.01.org/0day-ci/archive/20231105/202311050113.QCp9Dss3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311050113.QCp9Dss3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311050113.QCp9Dss3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/amd/hsmp.c: In function 'hsmp_create_sysfs_interface':
>> drivers/platform/x86/amd/hsmp.c:474:16: error: implicit declaration of function 'devm_device_add_groups'; did you mean 'devm_device_add_group'? [-Werror=implicit-function-declaration]
     474 |         return devm_device_add_groups(plat_dev.dev, hsmp_attr_grps);
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                devm_device_add_group
   cc1: some warnings being treated as errors


vim +474 drivers/platform/x86/amd/hsmp.c

5150542b8ec5fb Suma Hegde 2023-10-10  432  
5150542b8ec5fb Suma Hegde 2023-10-10  433  static int hsmp_create_sysfs_interface(void)
5150542b8ec5fb Suma Hegde 2023-10-10  434  {
5150542b8ec5fb Suma Hegde 2023-10-10  435  	const struct attribute_group **hsmp_attr_grps;
5150542b8ec5fb Suma Hegde 2023-10-10  436  	struct bin_attribute **hsmp_bin_attrs;
5150542b8ec5fb Suma Hegde 2023-10-10  437  	struct attribute_group *attr_grp;
5150542b8ec5fb Suma Hegde 2023-10-10  438  	int ret;
5150542b8ec5fb Suma Hegde 2023-10-10  439  	u16 i;
5150542b8ec5fb Suma Hegde 2023-10-10  440  
5150542b8ec5fb Suma Hegde 2023-10-10  441  	/* String formatting is currently limited to u8 sockets */
5150542b8ec5fb Suma Hegde 2023-10-10  442  	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
5150542b8ec5fb Suma Hegde 2023-10-10  443  		return -ERANGE;
5150542b8ec5fb Suma Hegde 2023-10-10  444  
5150542b8ec5fb Suma Hegde 2023-10-10  445  	hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group *) *
5150542b8ec5fb Suma Hegde 2023-10-10  446  				      (plat_dev.num_sockets + 1), GFP_KERNEL);
5150542b8ec5fb Suma Hegde 2023-10-10  447  	if (!hsmp_attr_grps)
5150542b8ec5fb Suma Hegde 2023-10-10  448  		return -ENOMEM;
5150542b8ec5fb Suma Hegde 2023-10-10  449  
5150542b8ec5fb Suma Hegde 2023-10-10  450  	/* Create a sysfs directory for each socket */
5150542b8ec5fb Suma Hegde 2023-10-10  451  	for (i = 0; i < plat_dev.num_sockets; i++) {
5150542b8ec5fb Suma Hegde 2023-10-10  452  		attr_grp = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group), GFP_KERNEL);
5150542b8ec5fb Suma Hegde 2023-10-10  453  		if (!attr_grp)
5150542b8ec5fb Suma Hegde 2023-10-10  454  			return -ENOMEM;
5150542b8ec5fb Suma Hegde 2023-10-10  455  
5150542b8ec5fb Suma Hegde 2023-10-10  456  		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
5150542b8ec5fb Suma Hegde 2023-10-10  457  		attr_grp->name = plat_dev.sock[i].name;
5150542b8ec5fb Suma Hegde 2023-10-10  458  
5150542b8ec5fb Suma Hegde 2023-10-10  459  		/* Null terminated list of attributes */
5150542b8ec5fb Suma Hegde 2023-10-10  460  		hsmp_bin_attrs = devm_kzalloc(plat_dev.dev, sizeof(struct bin_attribute *) *
5150542b8ec5fb Suma Hegde 2023-10-10  461  					      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
5150542b8ec5fb Suma Hegde 2023-10-10  462  		if (!hsmp_bin_attrs)
5150542b8ec5fb Suma Hegde 2023-10-10  463  			return -ENOMEM;
5150542b8ec5fb Suma Hegde 2023-10-10  464  
5150542b8ec5fb Suma Hegde 2023-10-10  465  		attr_grp->bin_attrs		= hsmp_bin_attrs;
5150542b8ec5fb Suma Hegde 2023-10-10  466  		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
5150542b8ec5fb Suma Hegde 2023-10-10  467  		hsmp_attr_grps[i]		= attr_grp;
5150542b8ec5fb Suma Hegde 2023-10-10  468  
5150542b8ec5fb Suma Hegde 2023-10-10  469  		/* Now create the leaf nodes */
5150542b8ec5fb Suma Hegde 2023-10-10  470  		ret = hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, i);
5150542b8ec5fb Suma Hegde 2023-10-10  471  		if (ret)
5150542b8ec5fb Suma Hegde 2023-10-10  472  			return ret;
5150542b8ec5fb Suma Hegde 2023-10-10  473  	}
5150542b8ec5fb Suma Hegde 2023-10-10 @474  	return devm_device_add_groups(plat_dev.dev, hsmp_attr_grps);
5150542b8ec5fb Suma Hegde 2023-10-10  475  }
5150542b8ec5fb Suma Hegde 2023-10-10  476  

:::::: The code at line 474 was first introduced by commit
:::::: 5150542b8ec5fb561be080ed0ef3bab8598154c3 platform/x86/amd/hsmp: add support for metrics tbl

:::::: TO: Suma Hegde <suma.hegde@amd.com>
:::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

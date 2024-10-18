Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B80C126C10
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 04:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729224307; cv=none; b=X6GHntq4TUHhKPXvfNO80a6ojwmoqBCrQ10jgaZT5LDnUAr7pjIVJs4wRgc9x4whCyMJD6otu/yL1UeS3HLIkiCs/xgQZ3+IgrvKL9qcqbd9Zt6y/Msgt1iaVJUI0g9vZC2OOBadbwAYAAVelEmbZ1r7r693WlCTb3oCt7U/Kf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729224307; c=relaxed/simple;
	bh=Xt6ElpXcXO6CIVg9thuCPkPokUUlYvKuNXX+WNZ+tlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IEDNRJJyVVk1SVR6aoy5EaLxwXq4j7y9fr44fcp/gJ5LJdrKqq7cmZegwYAyGjXWiMPWC4p8ek3kqNitEkG2u11diEKtp1NDLHxldJesh2TIvugu4wVWyAvJsEZ+aOGmcxb5wXC12AGP19j+xZQa016IuCzlBnpgUdB8X0NpM2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOOw9r9O; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOOw9r9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729224305; x=1760760305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xt6ElpXcXO6CIVg9thuCPkPokUUlYvKuNXX+WNZ+tlg=;
  b=fOOw9r9OiTFbYJCvsXCYdC6sIF/lA8krlGX8wQYDqy87tsBTdlO3XRkm
   fdVjnteKNupMpsSFzLCX0eyayE6NPTsBAh89cYtT4b15V29RClRV+sfdO
   uzwXQObViU903ZVTF4d7PbkVGPQII+QYPsaNHgs+0KmoQvo6fTFL948ul
   3HNG1sigoECifumB2rl40XHpqbOWOcNqeP5GJ0fFcCIFtI3F96LwdRS1v
   PC3Vpgqx39TKC3WLEH5V/lowRKiuj1v2gt4+Ed272Tw1HqkQtpi/H0Ovo
   kFS/xkyAzpsDNWy6//6bbPAbZCW7IBkm6j6+1iylRF3Xf2o/F545dXNuw
   Q==;
X-CSE-ConnectionGUID: bqosLNxoRMKBHNo1Cy7zmA==
X-CSE-MsgGUID: ziDL1rsGRi2h6+AdihBJKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32425498"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32425498"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 21:05:04 -0700
X-CSE-ConnectionGUID: BdlZawRSTQWUtXq6mW0VwA==
X-CSE-MsgGUID: Mje8rRTAS1aLC6Wslj1W4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="78357263"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Oct 2024 21:05:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1eEX-000NFj-1H;
	Fri, 18 Oct 2024 04:05:01 +0000
Date: Fri, 18 Oct 2024 12:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Amit Cohen <amcohen@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 28/41]
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:427:33: error: 'dev'
 undeclared; did you mean 'cdev'?
Message-ID: <202410181215.DHuahMqE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   c70959e2f11b805035442d8a222cc9e8a18c2b84
commit: dc3c6de632d0a35d3e4a1b8416d8941f113c156a [28/41] ndo_fdb_add: Shift responsibility for notifying to drivers
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241018/202410181215.DHuahMqE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181215.DHuahMqE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181215.DHuahMqE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c: In function 'qlcnic_fdb_add':
>> drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:427:33: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     427 |                 rtnl_fdb_notify(dev, addr, vid, RTM_NEWNEIGH, ndm->ndm_state);
         |                                 ^~~
         |                                 cdev
   drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:427:33: note: each undeclared identifier is reported only once for each function it appears in


vim +427 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c

   393	
   394	static int qlcnic_fdb_add(struct ndmsg *ndm, struct nlattr *tb[],
   395				struct net_device *netdev,
   396				const unsigned char *addr, u16 vid, u16 flags,
   397				struct netlink_ext_ack *extack)
   398	{
   399		struct qlcnic_adapter *adapter = netdev_priv(netdev);
   400		int err = 0;
   401	
   402		if (!adapter->fdb_mac_learn)
   403			return ndo_dflt_fdb_add(ndm, tb, netdev, addr, vid, flags);
   404	
   405		if (!(adapter->flags & QLCNIC_ESWITCH_ENABLED) &&
   406		    !qlcnic_sriov_check(adapter)) {
   407			pr_info("%s: FDB e-switch is not enabled\n", __func__);
   408			return -EOPNOTSUPP;
   409		}
   410	
   411		if (ether_addr_equal(addr, adapter->mac_addr))
   412			goto out;
   413	
   414		if (is_unicast_ether_addr(addr)) {
   415			if (netdev_uc_count(netdev) < adapter->ahw->max_uc_count)
   416				err = dev_uc_add_excl(netdev, addr);
   417			else
   418				err = -ENOMEM;
   419		} else if (is_multicast_ether_addr(addr)) {
   420			err = dev_mc_add_excl(netdev, addr);
   421		} else {
   422			err = -EINVAL;
   423		}
   424	
   425	out:
   426		if (!err)
 > 427			rtnl_fdb_notify(dev, addr, vid, RTM_NEWNEIGH, ndm->ndm_state);
   428	
   429		return err;
   430	}
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

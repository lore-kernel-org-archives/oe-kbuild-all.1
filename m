Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D723BE65
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751608155; cv=none; b=nzkyVBIBcoTi5NbXNLiw3Mgc34oVYswgOiOAIdspoH4rinBL2yjU/UK1+OlSjVxxR7RrokduME6tqkvovVpAjGAJT/rmvRBR23Pi2lN9jBh/O/ghVMXPCC+WHVeehiXglxVxQlh1Ok9BOoa3ewoyDKRlcw794bT9fiU69PgAiQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751608155; c=relaxed/simple;
	bh=amTRJOr6a0HWEHyzBV9ELTfipO4VzRlS8nYfe8M0dwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m2lf9aJk7a6vrXoj8nZ5SMWF+bcnrPU1nV6SOw2AzAO7+BS/QEjPe0vpTMBLKsRhHz4v1yPKr4fkSVVKiOwRc4Vf7MV7aCq4M93Ug74+JJTBjPb4G/lgXQOVkokhoXzMhoUu5jGSEIXnen7c95sevUh3o/qcF+5f3l8ay0Ltg+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJl5isQh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJl5isQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751608153; x=1783144153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=amTRJOr6a0HWEHyzBV9ELTfipO4VzRlS8nYfe8M0dwM=;
  b=fJl5isQhoRqUmdcIfB17mUaN/4iK6s4Oee4cgmbWJjQ/hrOJfRcelhWv
   Q5v4iyNJrl9RsV8hDnhIYwer47DAYWMFcCyN3k5sf7y21QPBm/iRRSjjz
   VhF1hHG0q/ZwUAuYrYvQxJ8jSqOFsK91Kt5up/MFZVkaJUtnQ2X3ublgd
   NZ70R25WuTzNhyDKvz0HMzO+UUr4mn/bBni6eTAv/V5nh1yqQo3ySSbrr
   FipFzbuijxryETPD60Cl+sSHrt8+OovglNabDyusxJC74Lv2X3xN+kkWI
   N/1UKFlVCnW8LKkk2Opq1ZS9qgZ0sKA3Cg1VqBiGYR/qd5KxQw+qnoMNJ
   w==;
X-CSE-ConnectionGUID: xtqBjIq4SaWE/CT3T7c3aA==
X-CSE-MsgGUID: ZhZFZDUXRfK2ehP60ownvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64993952"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64993952"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 22:49:12 -0700
X-CSE-ConnectionGUID: G6nsXXSeSly5LwFMhNKG2g==
X-CSE-MsgGUID: TUptskEkTGySn64zwFtFaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154313102"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jul 2025 22:49:12 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXZIL-0003Md-0n;
	Fri, 04 Jul 2025 05:49:09 +0000
Date: Fri, 4 Jul 2025 13:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3011/3011]
 drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1958:2: warning: 'strncpy'
 specified bound 100 equals destination size
Message-ID: <202507041337.WpaxtPMv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   d33d9222dd0abdddb305cbcd6dddf6763e0bcd5a
commit: e53494b741272933726616122ea77143d9742631 [3011/3011] drivers: initial support for rnp drivers from Mucse Technology
config: arm64-randconfig-004-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041337.WpaxtPMv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041337.WpaxtPMv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041337.WpaxtPMv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21,
                    from drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:13:
   drivers/net/ethernet/mucse/rnp/rnp_common.h: In function '_rnp_skb_dump':
   drivers/net/ethernet/mucse/rnp/rnp_common.h:336:22: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     336 |       &dev->features);
         |                      ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:16: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |  int headroom, tailroom;
         |                ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:6: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |  int headroom, tailroom;
         |      ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:16: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |  bool has_mac, has_trans;
         |                ^~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:7: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |  bool has_mac, has_trans;
         |       ^~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c: At top level:
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1214:5: warning: no previous prototype for 'rnp_mbx_get_pn_sn' [-Wmissing-prototypes]
    1214 | int rnp_mbx_get_pn_sn(struct rnp_hw *hw, char pn[33], char sn[33])
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c: In function '_switch_loopback':
>> drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1958:2: warning: 'strncpy' specified bound 100 equals destination size [-Wstringop-truncation]
    1958 |  strncpy(name, peer_eth, sizeof(name));
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +1958 drivers/net/ethernet/mucse/rnp/rnp_sysfs.c

  1950	
  1951	static ssize_t _switch_loopback(struct rnp_adapter *adapter,
  1952					const char *peer_eth, int en)
  1953	{
  1954		struct net_device *peer_netdev = NULL;
  1955		struct rnp_adapter *peer_adapter = NULL;
  1956		char name[100];
  1957	
> 1958		strncpy(name, peer_eth, sizeof(name));
  1959		strim(name);
  1960	
  1961		pr_info("%s: nr_lane:%d peer_lane:%s en:%d\n", __func__, 0,
  1962		       peer_eth, en);
  1963	
  1964		peer_netdev = dev_get_by_name(&init_net, name);
  1965		if (!peer_netdev) {
  1966			e_err(drv, "canot' find %s\n", name);
  1967			return -EINVAL;
  1968		}
  1969		peer_adapter = netdev_priv(peer_netdev);
  1970	
  1971		if (PCI_SLOT(peer_adapter->pdev->devfn) !=
  1972		    PCI_SLOT(adapter->pdev->devfn)) {
  1973			e_err(drv, "%s %s not in same slot\n",
  1974			       netdev_name(adapter->netdev),
  1975			       netdev_name(peer_adapter->netdev));
  1976			dev_put(peer_netdev);
  1977			return -EINVAL;
  1978		}
  1979	
  1980	
  1981		do_switch_loopback_set(adapter, en, 0,
  1982				       rnp_is_pf1(&peer_adapter->hw) ? 4 : 0);
  1983		do_switch_loopback_set(peer_adapter, en, 0,
  1984				       rnp_is_pf1(&adapter->hw) ? 4 : 0);
  1985	
  1986		if (peer_netdev)
  1987			dev_put(peer_netdev);
  1988	
  1989		return 0;
  1990	}
  1991	static ssize_t switch_loopback_on_store(struct device *dev,
  1992						struct device_attribute *attr,
  1993						const char *buf, size_t count)
  1994	{
  1995		struct rnp_adapter *adapter = netdev_priv(to_net_device(dev));
  1996	
  1997		return _switch_loopback(adapter, buf, 1) == 0 ? count : -EINVAL;
  1998	}
  1999	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

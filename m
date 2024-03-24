Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0204438C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 00:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711239325; cv=none; b=rxVUKqXzQgd/teeYSTfr402bzXdZEZvZ6zaqdbCoOQkw0EMnZbndWxY6iXNxB1zpqsewu5SmBZboit0WsOKue0etNlzb+NLBpPXhXZEaS4ObiH43Fr5UB6/kXEijMd1rykXWADE6Nz/Hr3EOZaWCkX6N53lmAiYW908Hb9z3eGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711239325; c=relaxed/simple;
	bh=0/eprYfkKUvV8VSIvcgLp4En/9VeKTEiOHAAuB4l4RE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L0a9Kr1l12Nplymn2uTW0dPUF5ubwcq0t7zZN2T+pkWi3P28raD14fMXzHlgpvWwCwIM/nfdw9oN+c0F2Bv1B/NEEme8yHK0x25nxgJ8jFpfPkzxNexVRFpI1h3KKuuaCcn2cky3k2fZZ8H3IcCvJvgWdOTbK15m/nst6/hyA/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FN5/6Pk9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FN5/6Pk9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711239323; x=1742775323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0/eprYfkKUvV8VSIvcgLp4En/9VeKTEiOHAAuB4l4RE=;
  b=FN5/6Pk9swDASUxGdFFyhLi0D48idG4VTDgEa8HeGNGNnufVNHGUD1A6
   XCbOv0yepEU2v+qtF6HZnB/CrDBPKZuuBXIG8eH4+5KV42c6lW7ps1u6x
   rU4zeQvTmyHOzjE+IMLD9a1cZuA5ghoTFic1h9IfnPUU2hMAZ7VFLaDac
   M4Tlct1icrDXVdKFtLlHFh/spRMTvjTkGz7+hIDKfXBoZmDzW8FuXmu3I
   4L1cw7SGY2UaJ0HpHEtBH0HFDA1OCCbPPkS+1LMJGe3Pcnhn76GvlcTbl
   GYFa1YfvAmLA5JQTWRhrjb+0yC3mH1tVlXXSnCRHGQt+dv6XX3C/KaRT/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="17698151"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="17698151"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 17:15:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="15345855"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Mar 2024 17:15:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roBWA-000LYh-37;
	Sun, 24 Mar 2024 00:15:18 +0000
Date: Sun, 24 Mar 2024 08:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27196/30000]
 drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1958:9: warning: 'strncpy'
 specified bound 100 equals destination size
Message-ID: <202403240810.wSTu29eU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b670dd901cbbf97745380d373b1d2607b3235590
commit: e53494b741272933726616122ea77143d9742631 [27196/30000] drivers: initial support for rnp drivers from Mucse Technology
config: x86_64-buildonly-randconfig-005-20240324 (https://download.01.org/0day-ci/archive/20240324/202403240810.wSTu29eU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240810.wSTu29eU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240810.wSTu29eU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mucse/rnp/rnp.h:21,
                    from drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:13:
   drivers/net/ethernet/mucse/rnp/rnp_common.h: In function '_rnp_skb_dump':
   drivers/net/ethernet/mucse/rnp/rnp_common.h:336:36: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     336 |                     &dev->features);
         |                                    ^
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:299:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     299 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_common.h:298:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     298 |         bool has_mac, has_trans;
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c: At top level:
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1214:5: warning: no previous prototype for 'rnp_mbx_get_pn_sn' [-Wmissing-prototypes]
    1214 | int rnp_mbx_get_pn_sn(struct rnp_hw *hw, char pn[33], char sn[33])
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c: In function '_switch_loopback':
>> drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1958:9: warning: 'strncpy' specified bound 100 equals destination size [-Wstringop-truncation]
    1958 |         strncpy(name, peer_eth, sizeof(name));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


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

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1AF2AD1C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 13:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202691; cv=none; b=HF7AMFJfG7RCguPg9lb+ez4g0xo55oS5Glh8xA9IwAIQKvoKRdkjT6rpvri+Mz7DMP3Tb1Z+oPRc4Aq6cCqZQmZQXpX8UiBsIDrQXj9FNVeObnEANgx0++mBLQ6vakQyhYJYp4ewLZBBOkpi179K9tW+sWnBlrLmD6iJEnA0m/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202691; c=relaxed/simple;
	bh=buHBYw2mcTUzdmF5RKej9r21WaRxDepZcsFd5K6hL9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tt32rQh062HHt7yWfHCM30Uw3f2bbIxEcbU2sJBSE05D1SWiQTTjoxSThk36F8wdJELIntZ1SSioDt5K5PgBIP4pX6psW5HNE5m/fxt0aGLLcDnbicrftGmT+0N9Ar+Q78E28jtLVFK15ek+jrkcfojnIPknxPlYOwKJOEEEHlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBr/SPAj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBr/SPAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751202689; x=1782738689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=buHBYw2mcTUzdmF5RKej9r21WaRxDepZcsFd5K6hL9I=;
  b=TBr/SPAjtUS1NV3vbN9AsePgDIJ445dHhzj1mz56ZGGksxLoLLybwHpQ
   i15TZXjRXfZPvEn2LpZyFaGjEjKiPgvWY4HO6tKin/VP9hgA6jzFTuETn
   o03u5MJrOuy42KURqCaygWrk9T9H4sRulXGsA30+mku+ZrjH68pCtL65J
   L/2yKPYu5kx0r5VOE1JOfLfodwab0yL17fVo2iHpxsLdpfzRriIGNn5eE
   2ZcYxMhuRa0GvIKFQwnBUBqRN93BSCa6QoFo1iFoUl1/etgkVYuJ0GQjg
   TkBI7+rMdVQQqSQDVuYvdIR53ZIzAYEaMKGmPsaSoLCKy+xbvmNciZl2E
   Q==;
X-CSE-ConnectionGUID: Jf5JXAOjS/er5jCvv1RV/w==
X-CSE-MsgGUID: 0olncoiNQu2QrbKle8B82Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="56065122"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="56065122"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 06:11:29 -0700
X-CSE-ConnectionGUID: qg/7LDPoSJaqBzD/i2f3XA==
X-CSE-MsgGUID: L715dAW8SpSI7vlvaEvFYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="158951966"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 29 Jun 2025 06:11:27 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVroa-0000uZ-0Q;
	Sun, 29 Jun 2025 13:11:24 +0000
Date: Sun, 29 Jun 2025 15:10:35 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yue Haibing <yuehaibing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2985/2985]
 drivers/net/ipvlan/ipvlan_main.c:431:19: warning: variable 'old_prog' set
 but not used
Message-ID: <202506291521.HeG05IiC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c245365237da527fb423d85e7ec54648113f843d
commit: 373ce97bdbb6378acf984656798aff4bb706a447 [2985/2985] ipvlan: support use xdp native mode
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250629/202506291521.HeG05IiC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506291521.HeG05IiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506291521.HeG05IiC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ipvlan/ipvlan_main.c:431:19: warning: variable 'old_prog' set but not used [-Wunused-but-set-variable]
     431 |         struct bpf_prog *old_prog;
         |                          ^
   1 warning generated.


vim +/old_prog +431 drivers/net/ipvlan/ipvlan_main.c

   426	
   427	static int ipvlan_xdp_set(struct net_device *dev, struct bpf_prog *prog,
   428				  struct netlink_ext_ack *extack)
   429	{
   430		struct ipvl_dev *priv = netdev_priv(dev);
 > 431		struct bpf_prog *old_prog;
   432	
   433		old_prog = rtnl_dereference(priv->xdp_prog);
   434		rcu_assign_pointer(priv->xdp_prog, prog);
   435		return 0;
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

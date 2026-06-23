Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FEA2F12D4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220491; cv=none; b=ama3+ceHYSebieMsXNQYrysaw806jsDqcc9H6Jz/h4z382mny4hM01vQE5MJ/t5Ya0MnAFyEqA+CrC0Ura3JdOL5soImZopAIEkfMjBS0chaMBeQE7VyYAuyBQMeqfouufdN3Sn118dIhlkWC8WTEgE6ORfn4XJ1op68HfEJB+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220491; c=relaxed/simple;
	bh=tM0qWYrppFmxmAdEyO2NbTKOcRp+Idpk3DTKUqW+j84=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OfZSJvQZv5pHSDtANMwVer7ZxuaqG0PAzIxqh8U72mmdEWXeVwrpYj/0iC2PzhycVALfuM8L+8gjC2dcEDSHOviDsLTkecZZrF+DbMBfU8LU1697C/ftabjf1f+JwgNtcvcQyvOFsfWguhuyo3oYR5xcOgmt6mpMBCJsZddMvyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4AyWkwk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4AyWkwk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782220487; x=1813756487;
  h=date:from:to:cc:subject:message-id;
  bh=tM0qWYrppFmxmAdEyO2NbTKOcRp+Idpk3DTKUqW+j84=;
  b=X4AyWkwkn2Ch4QfFN19aMWjLTPhm59+QnFlncB2uqhMm7cES0M/kSTaS
   qG05dDPZmyeYl0ibWIoz/V1DM9+fbTL4aYIGbNmZCYqIpXEZdjcKmcxkL
   YDX2Rvk1rAvdnW/XDrZ98/Tn3SMkj+1fnywO+2u07cFxzdtTJlsk7oIvM
   FroBtNirGWLnhJxm1mopnIKgalpSjvgSrY8sS2gJdsmaOmYqK9Qq5U3k6
   5IcQPjpnA0icwGNBVYaEXdHRWFLCgIOrqxWIU+uJt/I19App/rnem/CER
   4f8fatuNeQo2IDDuo7kRx1UmCK70YFlOzSR8qoJCAP1l1wEzcayOJEBMg
   A==;
X-CSE-ConnectionGUID: yVYL0e7kQWK156qiZ/BnPQ==
X-CSE-MsgGUID: 0rduF09dQ0Wu4kTPjzAM8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="105754419"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="105754419"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 06:14:29 -0700
X-CSE-ConnectionGUID: zIwC7s5fS3OGDz6d/54tMg==
X-CSE-MsgGUID: 2yAYIORpQGuBD9YZHuq8xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="248633967"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Jun 2026 06:14:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc0xM-000000002Xn-1Rtt;
	Tue, 23 Jun 2026 13:14:24 +0000
Date: Tue, 23 Jun 2026 21:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Wang <weibunny@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Daniel Zahka <daniel.zahka@gmail.com>
Subject: net/psp/psp_nl.c:513:13: sparse: sparse: cast removes
 address space '__rcu' of expression
Message-ID: <202606232140.CGI4No0a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   502d801f0ab03e4f32f9a33d203154ce84887921
commit: 06c2dce2d0f69727144443664182052f56d1da35 psp: add new netlink cmd for dev-assoc and dev-disassoc
date:   11 days ago
config: riscv-randconfig-r111-20260623 (https://download.01.org/0day-ci/archive/20260623/202606232140.CGI4No0a-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606232140.CGI4No0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 06c2dce2d0f6 ("psp: add new netlink cmd for dev-assoc and dev-disassoc")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606232140.CGI4No0a-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/psp/psp_nl.c:513:13: sparse: sparse: cast removes address space '__rcu' of expression

vim +/__rcu +513 net/psp/psp_nl.c

   475	
   476	int psp_nl_dev_assoc_doit(struct sk_buff *skb, struct genl_info *info)
   477	{
   478		struct psp_dev *psd = info->user_ptr[0];
   479		struct psp_assoc_dev *psp_assoc_dev;
   480		struct net_device *assoc_dev;
   481		struct sk_buff *rsp;
   482		u32 assoc_ifindex;
   483		struct net *net;
   484		int err;
   485	
   486		if (psd->assoc_dev_cnt >= PSP_ASSOC_DEV_MAX) {
   487			NL_SET_ERR_MSG(info->extack,
   488				       "Maximum number of associated devices reached");
   489			return -ENOSPC;
   490		}
   491	
   492		net = psp_nl_resolve_assoc_dev_ns(psd, info);
   493		if (IS_ERR(net))
   494			return PTR_ERR(net);
   495	
   496		psp_assoc_dev = kzalloc_obj(*psp_assoc_dev);
   497		if (!psp_assoc_dev) {
   498			err = -ENOMEM;
   499			goto err_put_net;
   500		}
   501	
   502		assoc_ifindex = nla_get_u32(info->attrs[PSP_A_DEV_IFINDEX]);
   503		assoc_dev = netdev_get_by_index(net, assoc_ifindex,
   504						&psp_assoc_dev->dev_tracker,
   505						GFP_KERNEL);
   506		if (!assoc_dev) {
   507			NL_SET_BAD_ATTR(info->extack, info->attrs[PSP_A_DEV_IFINDEX]);
   508			err = -ENODEV;
   509			goto err_free_assoc;
   510		}
   511	
   512		/* Check if device is already associated with a PSP device */
 > 513		if (cmpxchg(&assoc_dev->psp_dev, NULL, RCU_INITIALIZER(psd))) {
   514			NL_SET_ERR_MSG(info->extack,
   515				       "Device already associated with a PSP device");
   516			err = -EBUSY;
   517			goto err_put_dev;
   518		}
   519	
   520		psp_assoc_dev->assoc_dev = assoc_dev;
   521		rsp = psp_nl_reply_new(info);
   522		if (!rsp) {
   523			err = -ENOMEM;
   524			goto err_clean_ptr;
   525		}
   526	
   527		list_add_tail(&psp_assoc_dev->dev_list, &psd->assoc_dev_list);
   528		psd->assoc_dev_cnt++;
   529	
   530		put_net(net);
   531	
   532		psp_nl_notify_dev(psd, PSP_CMD_DEV_CHANGE_NTF);
   533	
   534		return psp_nl_reply_send(rsp, info);
   535	
   536	err_clean_ptr:
   537		rcu_assign_pointer(assoc_dev->psp_dev, NULL);
   538	err_put_dev:
   539		netdev_put(assoc_dev, &psp_assoc_dev->dev_tracker);
   540	err_free_assoc:
   541		kfree(psp_assoc_dev);
   542	err_put_net:
   543		put_net(net);
   544	
   545		return err;
   546	}
   547	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

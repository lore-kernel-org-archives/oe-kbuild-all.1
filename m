Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAFF2E7F25
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 01:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786154065; cv=none; b=YnCZST/xDINGtyo5cl5WDar6sVmN7rpPKdxYvtpVr4xfpwywL3jSlJbtousE0xpYkIY7Kk4jsoAGctK95dvfafgXA7ukh+h7xS080J8YCaPZFRddJaf3yRoB9wlkuAZlE7kmz19DmNirwefCJtlAd8Bx/tcpk2ip23SRqKFoWXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786154065; c=relaxed/simple;
	bh=FV92dINpIR0VBUoOFobIklWQQt8dDLXe7nNL27mwM6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RvqdUrljmG+QNNI288foup7Xx3++/xKxlD5+37HpFjT+Uoc90mhc6H8olSryigy9zf617efpLpoqrNTILEHT6spXIuvFa1Ar0bT3Rzuq5R1q5y4LJ4fW4Ox35ero/9auLA0Xj9bu4AXqfQobOLu/G1V9oZytx5ZNAuqOyTIRneE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=St801OS/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="St801OS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786154064; x=1817690064;
  h=date:from:to:cc:subject:message-id;
  bh=FV92dINpIR0VBUoOFobIklWQQt8dDLXe7nNL27mwM6A=;
  b=St801OS/hFrL8/vuzHdAnXeeozUBG8AHqyMjV8lEGtuj4xy/xv3m2DMs
   hPDIkaUrjOOyUgZ3Vu8rK1gSIe50qrvHrvCWLvyvTA28YWhmHqNpVK8Er
   Ql2BcC1KirFlmfbmCz6+9ffE2JgcansU8MwDtL17FASZbnc52yQaI/V+H
   Zy+FzyrQGD3siqusMZnyCnSctqvwtc/5Jh1FASmzdixGwAKrvV4tiDwVu
   CA92fDLOkd9wVLmbAmS4s8DW9RdVgOyfkgrKS74ntcOjMwimsitKU++eC
   7OugLW1GGIUqFkAhf9stHs/utdi/Yq3LbD+57sgz+H2MCRzub/vImsotk
   Q==;
X-CSE-ConnectionGUID: ZQ30CHAXRKSCutlXN0oIBw==
X-CSE-MsgGUID: OFmSftqSQzudUAPKL28a7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="97118239"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="97118239"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 18:54:21 -0700
X-CSE-ConnectionGUID: thCLyFiPRT2fQbjTkkwdlQ==
X-CSE-MsgGUID: BSYcDzSiSH+IbP0I0wY0pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="259233719"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2026 18:54:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsWGO-00000000JcZ-1ayi;
	Sat, 08 Aug 2026 01:54:16 +0000
Date: Sat, 08 Aug 2026 09:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Wang <weibunny@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Daniel Zahka <daniel.zahka@gmail.com>
Subject: net/psp/psp_nl.c:513:13: sparse: sparse: cast removes
 address space '__rcu' of expression
Message-ID: <202608080910.l9KvOH7O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: 06c2dce2d0f69727144443664182052f56d1da35 psp: add new netlink cmd for dev-assoc and dev-disassoc
date:   8 weeks ago
config: riscv-randconfig-r131-20260807 (https://download.01.org/0day-ci/archive/20260808/202608080910.l9KvOH7O-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080910.l9KvOH7O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 06c2dce2d0f6 ("psp: add new netlink cmd for dev-assoc and dev-disassoc")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080910.l9KvOH7O-lkp@intel.com/

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

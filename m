Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20474285068
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 02:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784513936; cv=none; b=UTWtwyM7QXH1bDYqf7FcMvqxMQoETVM0L5i/0263P2Qn4fKd+TUz2Ehrqv4MV4bfbswX0FbrKrVjLOkitnukv+CdLSo59wP3V/yvRDxcg9uicz63fpiANR+TJ42KUG6T3kpAZMWhy7PNhTD85B6Ev6HWx9t5cnfBCoLua3lvCqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784513936; c=relaxed/simple;
	bh=IYdxmSA8McXpCUu/m9nPrOGLNT6f2AStCwMnyfIBC3g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KHzAZR6t0ewRxVdRj9ElHAWm0D+WQPqO/mNUv7xYgQzMDFn5nWD7gsD4xmrYdePjLAButj3m4Fs9/f8ZT6/7nh+kFf0Bk9D9w2DexBlBC4bG2Gw0LKKiuBeOcOziYVTurjCuWfz17/YgNAXup/bURCRo5werc07RVLHfkre54Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gd0lBu9S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gd0lBu9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784513933; x=1816049933;
  h=date:from:to:cc:subject:message-id;
  bh=IYdxmSA8McXpCUu/m9nPrOGLNT6f2AStCwMnyfIBC3g=;
  b=Gd0lBu9Sjp53VGVdPIrDkGnDmqFbbjMn4ZgxAceqQn4+IoDNRITgm9U3
   MEBZynxuMrh/taHu4pDqjxF1LwGKlHzp+PKM1Dwbdha5iIqZqo0hnBBM0
   KeiY0Ka9+7r4XWH6LKvXeEelzxtNxlfcLzed7+vN6dR8/Qj+pyKpWWcmq
   /5sI7zqNvxd355R4HTFGlcIah7cMV/q9r7MgMJ7Vw/x+ZnGZIaU+WxybL
   fe+FF9sLBeZE+/9DgzMeffRESfXud+Gst2X4KG/41S1RZ7fV5h4PXN+oS
   WX11BXK9Cm3KYMnC8Yloo59PXMbAj/hTBD5cFNAYs9fylAV2CX7M6GTHe
   w==;
X-CSE-ConnectionGUID: 9DZNuM3BQHS+QiwWm53HVg==
X-CSE-MsgGUID: YXk4LXVvRkCj3uu8DspM7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="88915926"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="88915926"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 19:18:52 -0700
X-CSE-ConnectionGUID: H0S3k9sKTd6Pb/gCXCdr+A==
X-CSE-MsgGUID: CI/h1+yAS5SMfBlf76N74g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="295529207"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 19 Jul 2026 19:18:51 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wldai-0000000067Z-2aRl;
	Mon, 20 Jul 2026 02:18:48 +0000
Date: Mon, 20 Jul 2026 04:18:44 +0200
From: kernel test robot <lkp@intel.com>
To: Taehee Yoo <ap420073@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/knod/knod_core.c:129:1: warning: control reaches end of
 non-void function
Message-ID: <202607200420.w4KyVXtV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Taehee-Yoo/net-knod-add-uapi-and-core-headers/20260720-021105
head:   d65f8a646efeabb7098a8c9a5b586ad3580fe13e
commit: 326530f9cd40b4a123881f1dcc8832b2691c58e4 net: knod: add offload device core and control plane
date:   8 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260720/202607200420.w4KyVXtV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260720/202607200420.w4KyVXtV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607200420.w4KyVXtV-lkp@intel.com/

All warnings (new ones prefixed by >>):

    1044 |                         base_pool = knodev->accel_ops->alloc_mem(knodev, total,
         |                                           ^~
   net/knod/knod_core.c:1054:31: error: 'struct knod_dev' has no member named 'wpriv'
    1054 |                         knodev->wpriv[0].spsc_pool_priv = pool_priv;
         |                               ^~
   net/knod/knod_core.c:1059:39: error: 'struct knod_dev' has no member named 'wpriv'
    1059 |                                 knodev->wpriv[i].spsc_pool_gaddr =
         |                                       ^~
   net/knod/knod_core.c:1061:58: error: 'struct knod_dev' has no member named 'wpriv'
    1061 |                                 err = __spsc_init(&knodev->wpriv[i].spsc_bds,
         |                                                          ^~
   net/knod/knod_core.c:1073:56: error: 'struct knod_dev' has no member named 'wpriv'
    1073 |                                 err = spsc_init(&knodev->wpriv[i].spsc_bds,
         |                                                        ^~
   net/knod/knod_core.c:1089:37: error: 'struct knod_dev' has no member named 'wpriv'
    1089 |                 spsc_destroy(&knodev->wpriv[i].spsc_bds);
         |                                     ^~
   net/knod/knod_core.c:1090:19: error: 'struct knod_dev' has no member named 'wpriv'
    1090 |         if (knodev->wpriv[0].spsc_pool_priv)
         |                   ^~
   net/knod/knod_core.c:1091:23: error: 'struct knod_dev' has no member named 'accel_ops'
    1091 |                 knodev->accel_ops->free_mem(knodev,
         |                       ^~
   net/knod/knod_core.c:1092:39: error: 'struct knod_dev' has no member named 'wpriv'
    1092 |                                 knodev->wpriv[0].spsc_pool_priv);
         |                                       ^~
   net/knod/knod_core.c:1093:15: error: 'struct knod_dev' has no member named 'accel_ops'
    1093 |         knodev->accel_ops->detach(knodev);
         |               ^~
   net/knod/knod_core.c:1117:19: error: 'struct knod_dev' has no member named 'accel_ops'
    1117 |         if (knodev->accel_ops->xdp_ops && knodev->accel_ops->xdp_ops->init) {
         |                   ^~
   net/knod/knod_core.c:1117:49: error: 'struct knod_dev' has no member named 'accel_ops'
    1117 |         if (knodev->accel_ops->xdp_ops && knodev->accel_ops->xdp_ops->init) {
         |                                                 ^~
   net/knod/knod_core.c:1118:29: error: 'struct knod_dev' has no member named 'accel_ops'
    1118 |                 err = knodev->accel_ops->xdp_ops->init(knodev);
         |                             ^~
   net/knod/knod_core.c:1133:19: error: 'struct knod_dev' has no member named 'accel_ops'
    1133 |         if (knodev->accel_ops->mp_map) {
         |                   ^~
   net/knod/knod_core.c:1134:29: error: 'struct knod_dev' has no member named 'accel_ops'
    1134 |                 err = knodev->accel_ops->mp_map(knodev);
         |                             ^~
   net/knod/knod_core.c:1153:37: error: 'struct knod_dev' has no member named 'wpriv'
    1153 |                 spsc_destroy(&knodev->wpriv[i].spsc_bds);
         |                                     ^~
   net/knod/knod_core.c:1154:19: error: 'struct knod_dev' has no member named 'wpriv'
    1154 |         if (knodev->wpriv[0].spsc_pool_priv)
         |                   ^~
   net/knod/knod_core.c:1155:23: error: 'struct knod_dev' has no member named 'accel_ops'
    1155 |                 knodev->accel_ops->free_mem(knodev,
         |                       ^~
   net/knod/knod_core.c:1156:39: error: 'struct knod_dev' has no member named 'wpriv'
    1156 |                                 knodev->wpriv[0].spsc_pool_priv);
         |                                       ^~
   net/knod/knod_core.c:1157:15: error: 'struct knod_dev' has no member named 'accel_ops'
    1157 |         knodev->accel_ops->detach(knodev);
         |               ^~
   net/knod/knod_core.c:1159:15: error: 'struct knod_dev' has no member named 'nic_ops'
    1159 |         knodev->nic_ops->detach(knodev);
         |               ^~
   net/knod/knod_core.c:1162:21: error: 'struct knod_dev' has no member named 'wpriv'
    1162 |         kfree(knodev->wpriv);
         |                     ^~
   net/knod/knod_core.c:1164:27: error: 'struct knod_dev' has no member named 'stats'
    1164 |         free_percpu(knodev->stats);
         |                           ^~
   net/knod/knod_core.c: In function 'knod_dev_detach':
   net/knod/knod_core.c:1197:19: error: 'struct knod_dev' has no member named 'accel_ops'
    1197 |         if (knodev->accel_ops->pre_detach)
         |                   ^~
   net/knod/knod_core.c:1198:23: error: 'struct knod_dev' has no member named 'accel_ops'
    1198 |                 knodev->accel_ops->pre_detach(knodev);
         |                       ^~
   net/knod/knod_core.c:1203:37: error: 'struct knod_dev' has no member named 'wpriv'
    1203 |                 spsc_destroy(&knodev->wpriv[i].spsc_bds);
         |                                     ^~
   net/knod/knod_core.c:1204:19: error: 'struct knod_dev' has no member named 'wpriv'
    1204 |         if (knodev->wpriv[0].spsc_pool_priv)
         |                   ^~
   net/knod/knod_core.c:1205:23: error: 'struct knod_dev' has no member named 'accel_ops'
    1205 |                 knodev->accel_ops->free_mem(knodev,
         |                       ^~
   net/knod/knod_core.c:1206:39: error: 'struct knod_dev' has no member named 'wpriv'
    1206 |                                 knodev->wpriv[0].spsc_pool_priv);
         |                                       ^~
   net/knod/knod_core.c:1207:15: error: 'struct knod_dev' has no member named 'nic_ops'
    1207 |         knodev->nic_ops->detach(knodev);
         |               ^~
   net/knod/knod_core.c:1208:15: error: 'struct knod_dev' has no member named 'accel_ops'
    1208 |         knodev->accel_ops->detach(knodev);
         |               ^~
   net/knod/knod_core.c:1216:21: error: 'struct knod_dev' has no member named 'wpriv'
    1216 |         kfree(knodev->wpriv);
         |                     ^~
   net/knod/knod_core.c:1217:27: error: 'struct knod_dev' has no member named 'stats'
    1217 |         free_percpu(knodev->stats);
         |                           ^~
   net/knod/knod_core.c: In function 'knod_dev_xdp_install':
>> net/knod/knod_core.c:129:1: warning: control reaches end of non-void function [-Wreturn-type]
     129 | }
         | ^
   net/knod/knod_core.c: In function 'knod_ipsec_xdo_policy_add':
   net/knod/knod_core.c:474:1: warning: control reaches end of non-void function [-Wreturn-type]
     474 | }
         | ^
   net/knod/knod_core.c: In function 'knod_ipsec_xdo_offload_ok':
   net/knod/knod_core.c:433:1: warning: control reaches end of non-void function [-Wreturn-type]
     433 | }
         | ^
   net/knod/knod_core.c: In function 'knod_ipsec_xdo_state_add':
   net/knod/knod_core.c:400:1: warning: control reaches end of non-void function [-Wreturn-type]
     400 | }
         | ^


vim +129 net/knod/knod_core.c

   122	
   123	int knod_dev_xdp_install(struct knod_dev *knodev, struct netdev_bpf *xdp)
   124	{
   125		if (!knodev->accel_ops->xdp_ops ||
   126		    !knodev->accel_ops->xdp_ops->xdp_install)
   127			return -EOPNOTSUPP;
   128		return knodev->accel_ops->xdp_ops->xdp_install(knodev, xdp);
 > 129	}
   130	EXPORT_SYMBOL(knod_dev_xdp_install);
   131	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

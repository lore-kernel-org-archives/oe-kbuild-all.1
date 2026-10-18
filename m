Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC843443C26
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309968; cv=none; b=Vdj78B/bS1TMb8OM5lsktK0XYhQPPP82reqRsESGHUn5I9WhjAAgwTwFuCO+7YkzZ5pa05zcyMXP/ZwblYuYjoIp+nZIJv7j9by0oNHzD+Oxssiqjy5rFddrdGuZPkOWkr0N3zIficMvGBHx9hwHF33x/SFhWAuHUaXEsFyxEPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309968; c=relaxed/simple;
	bh=05HQ0R67uA5HRD9qVcAlCZgYQDllfzqML2NkxxCxSrY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eDfl+fRipK1uYKIGRlhTcXs6O4nPDgYIDVRVj1IjY8+JjQoCIYn7zaSEOqLRqtwqQ5A6AiqWCnGoFU5VYf36/gmBYRBvq2+GZIttc5rGI9URsACv9vQ3baecqGfz39TVTfLg9+Yoj1buPwCWIYFKNgLaQYOwukOKUlC18mWu/CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAV0Ub3V; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAV0Ub3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309968; x=1823845968;
  h=date:from:to:cc:subject:message-id;
  bh=05HQ0R67uA5HRD9qVcAlCZgYQDllfzqML2NkxxCxSrY=;
  b=UAV0Ub3VWVfY8JzoI73wHwpl7DgcaaTaxqKPv9pjK+c7dJ6J62RhcQeB
   n/+tZMRhgCtegsBVWU6c4K3ysA2N1XtGbVaiiQwU+4jwKck1ZY1cyZzKW
   YIaU8i2IGv22j0jB1WkYvKaSYjmCcs2TqyxqhElkNg5myh9KGvtyk+/2A
   L71RBNquBfe6KlNPd2dXu9vctMmrPaHhRHNjeEnWz8iP6GeUUJTaIzNgp
   im+zez3wIo39TNZsuyerLDtdAYVe+x+rZmvPYv+8hvPSKZQMNpKX/2Fox
   2DPOXzEc6BjZs5bPENa+W7+vQcOC/AJ8sWB1LsuyVi9PS4riCTVYTCFaG
   Q==;
X-CSE-ConnectionGUID: nTcOs3d3SSGEntCpqGB83Q==
X-CSE-MsgGUID: gJEzrPH5SnSXOXbJomOdAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916698"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916698"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:40 -0700
X-CSE-ConnectionGUID: TdSNoUXSRGuSoy8+EJVcKw==
X-CSE-MsgGUID: KW+mlgnMSaqXUqbwEdajIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340802"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:34 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh2-000000004x1-3J7h;
	Sun, 18 Oct 2026 07:52:32 +0000
Date: Sun, 18 Oct 2026 09:43:33 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_1 43/62]
 drivers/ctlv/core.c:644:6: warning: 'ctlv_device_priv_aligned' defined but
 not used
Message-ID: <202610162114.Al712poE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_1
head:   e63637d55bc3ae7cbef988e3525c79b9381dba1b
commit: 902704a094b6c6cff853cd9f7279da6199ecf93d [43/62] ctlv: Add KUnit support
config: alpha-randconfig-r2200-20261016 (https://download.01.org/0day-ci/archive/20261016/202610162114.Al712poE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610162114.Al712poE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610162114.Al712poE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ctlv/core.c:644:6: warning: 'ctlv_device_priv_aligned' defined but not used [-Wunused-function]
     644 | bool ctlv_device_priv_aligned(struct ctlv_device *ctlvdev, u32 index)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ctlv/core.c:637:7: warning: 'ctlv_device_priv' defined but not used [-Wunused-function]
     637 | void *ctlv_device_priv(struct ctlv_device *ctlvdev, u32 index)
         |       ^~~~~~~~~~~~~~~~
>> drivers/ctlv/core.c:129:6: warning: 'ctlv_family_claim_remove' defined but not used [-Wunused-function]
     129 | void ctlv_family_claim_remove(u16 family_id, const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/ctlv_device_priv_aligned +644 drivers/ctlv/core.c

   635	
   636	VISIBLE_IF_KUNIT
 > 637	void *ctlv_device_priv(struct ctlv_device *ctlvdev, u32 index)
   638	{
   639		return ctlvdev->privs[index].priv;
   640	}
   641	EXPORT_SYMBOL_IF_KUNIT(ctlv_device_priv);
   642	
   643	VISIBLE_IF_KUNIT
 > 644	bool ctlv_device_priv_aligned(struct ctlv_device *ctlvdev, u32 index)
   645	{
   646		return IS_ALIGNED((unsigned long)ctlvdev->privs[index].priv,
   647				  CTLV_PRIV_ALIGN);
   648	}
   649	EXPORT_SYMBOL_IF_KUNIT(ctlv_device_priv_aligned);
   650	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

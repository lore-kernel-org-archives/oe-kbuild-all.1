Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7272BD036
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575299; cv=none; b=u7/QHDTPl0Ka7QwL76E0rj7RtZVmXevbU6Q+2NdO02y7e2bf1GPqe7We0EhuFNNdrPVDRAbGqgwLNv+WL4xWYkEqJR5vFsiVSZ8AeA9+kc/NpwC1/QB5Ioy2diZm3kKxdlH0iz20ozeQ/+YLmMirsoFhF6oWIxByXWaRpvz68Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575299; c=relaxed/simple;
	bh=gzzYUx/Cc0Np16YiIm1idHyHHRtcrAcV/gc25/5JgXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CLIaj2kDrPekh1u1hjNKu4yACKudAEnVPg4N8tkMICbywqu1/Vr+gJFNFmVTKHfZFRXyVvjXcqpItsNdDKbWjlirDiXQLxFAQ09D7vClGkdMZPyZXJrfd0yC74kG+S1sgU0ZwCNrY/Io9e9A7RXz8A/pwIfee171gl7E3MBSjQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mi2vzKXk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mi2vzKXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751575297; x=1783111297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gzzYUx/Cc0Np16YiIm1idHyHHRtcrAcV/gc25/5JgXM=;
  b=mi2vzKXkzdUbaCbrLlgGOZS6GQZ5yhS3Nm6ByvE4DSkD4xRNpRKo8tto
   88zjcqKA4ukDk6CDhH+6dh86FobjK/xKguMO7cdEL4GYIXSwEHH3ot/Qp
   17TiKmV4Rns1qxLj8w0Svum4hNpYEwhvF36g5ErSJO7n2CY3HELcXtjfZ
   DIuA9/SCGegdCitgW2hXLFM9jfLV2hlTt7ywTY8tgIe/bNyTwFLC1dsGc
   drIs/YtB038LomBsytLlQpjhxROk89ZsA1tC9gcJx8r4pNKsVVtXcOj+b
   quHc+ihHKyb4sFlc7nLFTUMoyBh+H6Wqf2J0MUtEO/pkDd2JunBCf5Z1K
   Q==;
X-CSE-ConnectionGUID: xcyGNPXKTU2TNCngx5M75g==
X-CSE-MsgGUID: 6AMQtFrdRoSqrGacXcm8yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53137828"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="53137828"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 13:41:35 -0700
X-CSE-ConnectionGUID: VgF8Y/dnSEO5bOfbfnGFww==
X-CSE-MsgGUID: W89aaecETx6uS/YWC8/YFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="155032022"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jul 2025 13:41:34 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXQkN-0002zY-10;
	Thu, 03 Jul 2025 20:41:31 +0000
Date: Fri, 4 Jul 2025 04:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, =?utf-8?B?6Zer5rW35rab?= <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2455/2455] fs/nfs/enfs_adapter.c:62:26: warning:
 no previous prototype for 'nfs_multipath_router_get'
Message-ID: <202507040402.hCXev0Wz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9b85bcf0e6357841885264f42859bec05c9073f4
commit: 18e360871c3f648ecb0d8cc9b23fd4268a64c17f [2455/2455] add enfs feature
config: arm64-randconfig-004-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040402.hCXev0Wz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040402.hCXev0Wz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040402.hCXev0Wz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/enfs_adapter.c:62:26: warning: no previous prototype for 'nfs_multipath_router_get' [-Wmissing-prototypes]
      62 | struct enfs_adapter_ops *nfs_multipath_router_get(void)
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/enfs_adapter.c:78:6: warning: no previous prototype for 'nfs_multipath_router_put' [-Wmissing-prototypes]
      78 | void nfs_multipath_router_put(struct enfs_adapter_ops *ops)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/enfs_adapter.c:84:6: warning: no previous prototype for 'is_valid_option' [-Wmissing-prototypes]
      84 | bool is_valid_option(enum nfsmultipathoptions option)
         |      ^~~~~~~~~~~~~~~
--
>> fs/nfs/fs_context.c:374:26: warning: no previous prototype for 'getNfsMultiPathOpt' [-Wmissing-prototypes]
     374 | enum nfsmultipathoptions getNfsMultiPathOpt(int token)
         |                          ^~~~~~~~~~~~~~~~~~
--
>> net/sunrpc/sunrpc_enfs_adapter.c:132:6: warning: no previous prototype for 'rpc_task_release_xprt' [-Wmissing-prototypes]
     132 | void rpc_task_release_xprt(struct rpc_clnt *clnt, struct rpc_xprt *xprt)
         |      ^~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/nfs_multipath_router_get +62 fs/nfs/enfs_adapter.c

    61	
  > 62	struct enfs_adapter_ops *nfs_multipath_router_get(void)
    63	{
    64		struct enfs_adapter_ops *ops;
    65	
    66		rcu_read_lock();
    67		ops = rcu_dereference(enfs_adapter);
    68		if (ops == NULL) {
    69			rcu_read_unlock();
    70			return NULL;
    71		}
    72		if (!try_module_get(ops->owner))
    73			ops = NULL;
    74		rcu_read_unlock();
    75		return ops;
    76	}
    77	
  > 78	void nfs_multipath_router_put(struct enfs_adapter_ops *ops)
    79	{
    80		if (ops)
    81			module_put(ops->owner);
    82	}
    83	
  > 84	bool is_valid_option(enum nfsmultipathoptions option)
    85	{
    86		if (option < REMOTEADDR || option >= INVALID_OPTION) {
    87			pr_warn("ENFS: invalid option %d\n",
    88				option);
    89			return false;
    90		}
    91	
    92		return true;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

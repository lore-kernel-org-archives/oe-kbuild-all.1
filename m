Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B46527CCEE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765548661; cv=none; b=HxKCQFjGPOpBCYWbO4Gf8kLs2SV1FCX6OEY+Xo/590SIlgOi48/FdthBJfsDz2djCXyR4ILcnkBAOG4PnQKBuymxMdx3DOib8l+ABSHHKmt8msXz3JH3AMz0hN/YgW684c+hmvgIvVHJaAZU/pH9G8JlF2/IPKk5Bjna9wQEYyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765548661; c=relaxed/simple;
	bh=D+TzjRg5uBW8grFs2gr1RyYq03LPbRGc0cTyg3o9Klo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AdtBMAwQ33PmlLbG8BzpuRo+2OURWwDNsi+oWnVEs8dm6dALSr7Zl0jnsWugdgCmfxcQJ0EWIdDobSBlfIil+O7RQfAoDwpjzbkZdJB78+PZnl/runyNYhvPeWc8GuWuuvnQ59glHT8l7DXGU+yU0uN8SogNdAZLiU9F345lOYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNNFgEbR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNNFgEbR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765548660; x=1797084660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D+TzjRg5uBW8grFs2gr1RyYq03LPbRGc0cTyg3o9Klo=;
  b=VNNFgEbRJyfWtCudmqU0/1b9QJG7Qlvkp8swLgigyLUq6Qckkv0FtUZL
   7LJQNRB30qu0SRkyjTceHWJ21yxkJxXMCmThbmmOE/w1JuhbaYbo0MN+I
   CD8R0d5PuBJ+KkzXsLOCE5IBUYSiP5u/R9FNHbi675lXTbVmVD5hnTfG8
   yI74NN7yDPokpwqDHTE7nul+41RtVqdQRzDdEd7X4aocs+mgF1Cp5An/u
   adHEIoIvpOIAbgGVFb1HYK02xaZUhEorkBd9/IK1lnUFcBpZffoVTlV9U
   vm8NfKIcJwGJKGKSx5kvgCxegGCeSbwTs0QZR9oGwpGa3kTZWbKYMavAs
   w==;
X-CSE-ConnectionGUID: yFrArj/3S22P4QSEpsuMIQ==
X-CSE-MsgGUID: W7TpR2MMRg6oyWFLTfTiZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78188704"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78188704"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 06:11:00 -0800
X-CSE-ConnectionGUID: mZprIkbkQTKIUKXt6/99vw==
X-CSE-MsgGUID: lt98VVn0QiyMengnQ0cBGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="202017089"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 06:10:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU3rE-0000000068l-2n0f;
	Fri, 12 Dec 2025 14:10:56 +0000
Date: Fri, 12 Dec 2025 22:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 kernel/power/energy_model.c:135:19: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202512122211.wbLfgMHb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   eed7f8d4a5572c294712b683d6b4890a3b5e1267
commit: 4c863dbb80141ba881866c8a8bad6f44105df9b3 [0/1] UPSTREAM: PM: EM: Add functions for memory allocations for new EM tables
config: x86_64-randconfig-121-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122211.wbLfgMHb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512122211.wbLfgMHb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122211.wbLfgMHb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/power/energy_model.c:113:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got struct em_perf_table * @@
   kernel/power/energy_model.c:113:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:113:15: sparse:     got struct em_perf_table *
   kernel/power/energy_model.c:114:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct em_perf_table [noderef] __rcu *table @@
   kernel/power/energy_model.c:114:15: sparse:     expected void const *objp
   kernel/power/energy_model.c:114:15: sparse:     got struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:122:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got struct em_perf_table * @@
   kernel/power/energy_model.c:122:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:122:15: sparse:     got struct em_perf_table *
   kernel/power/energy_model.c:124:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   kernel/power/energy_model.c:124:19: sparse:     expected struct callback_head *head
   kernel/power/energy_model.c:124:19: sparse:     got struct callback_head [noderef] __rcu *
>> kernel/power/energy_model.c:135:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:135:19: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:135:19: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:153:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got void * @@
   kernel/power/energy_model.c:153:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:153:15: sparse:     got void *
   kernel/power/energy_model.c:157:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:157:20: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:157:20: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:223:9: sparse:     expected void const *
   kernel/power/energy_model.c:223:9: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:223:9: sparse:     expected void const *
   kernel/power/energy_model.c:223:9: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:223:9: sparse:     expected void *p
   kernel/power/energy_model.c:223:9: sparse:     got struct em_perf_state [noderef] __rcu *

vim +135 kernel/power/energy_model.c

   108	
   109	static void em_destroy_table_rcu(struct rcu_head *rp)
   110	{
   111		struct em_perf_table __rcu *table;
   112	
   113		table = container_of(rp, struct em_perf_table, rcu);
 > 114		kfree(table);
   115	}
   116	
   117	static void em_release_table_kref(struct kref *kref)
   118	{
   119		struct em_perf_table __rcu *table;
   120	
   121		/* It was the last owner of this table so we can free */
   122		table = container_of(kref, struct em_perf_table, kref);
   123	
   124		call_rcu(&table->rcu, em_destroy_table_rcu);
   125	}
   126	
   127	/**
   128	 * em_table_free() - Handles safe free of the EM table when needed
   129	 * @table : EM table which is going to be freed
   130	 *
   131	 * No return values.
   132	 */
   133	void em_table_free(struct em_perf_table __rcu *table)
   134	{
 > 135		kref_put(&table->kref, em_release_table_kref);
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

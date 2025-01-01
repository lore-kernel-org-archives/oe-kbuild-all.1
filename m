Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1091D2745E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735722205; cv=none; b=Ug/eTqM0FWGHEerZr7NzD2nfkr+PeDUB4LLgCetsYv16yFqdJJdijpnzvSL1Buangyoz69p2GyfZKxrOOi+cVtvIKmZhJN0PDBSBWaPQUeD3/MetnD4OowT3yj2W24OAIuCkMI2fMRlOd8Q6DKoan7XRYmwLCSQMaiDZ7D8CNo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735722205; c=relaxed/simple;
	bh=Md+0FQyziduUaII2NRG1Nn9bkeEYkUJSllyL8quHGCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CmwPhObfqrDAukVDDlmnFzSYibyMFYO2b9b6FJ+DSNZQ26/1xwl7DCMTSBd6AEcXVMoXwIuTJV1YJahMUkFig6wm0Y3bCG9FEtE23NuaRdjRi7k/4e3ewKbRsUM5kfH+AvAp3jLCYPp0KIXvpDwCqtHD0cB3gUzs4AeI5QBkUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yl68ob0Q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yl68ob0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735722204; x=1767258204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Md+0FQyziduUaII2NRG1Nn9bkeEYkUJSllyL8quHGCE=;
  b=Yl68ob0Q91x0BPXocPmUhRh4R5w+2PhPBcC19+Pvove3NGdaFzqFxkXP
   V1P65DBvVrMQ0t7cDAXvG9cO6r7rUwzVO/Q5f8H5G1rxYMVEr2RXEEZIE
   IHc6upZg7vANIp7YSPTHabBhGW/6lwlWDRySRgOo2Dme5fP5j2VERieej
   wwyBg9fXVz7vhyvlFDZKN3sFU5sqqY7WYJRF1ag9w0wmiQpdwwI79Y0Sd
   clHy4xievGcYRV8xZ2xmIZDIfhdc/p7ZAj1XTvi+ArHS6Jdq6hvhGzPuB
   oizWPSrG2x9IOowoipYDX5Y4zY3YKashGeqOhoCzWL4YJa3GmOsMi/OB7
   Q==;
X-CSE-ConnectionGUID: ZbgXArIFTuCmv1GqgcIHaw==
X-CSE-MsgGUID: WFsY1T0BRzmRbdg/54G0LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46972191"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="46972191"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 01:03:23 -0800
X-CSE-ConnectionGUID: ySxezmoXSNWybpt5K4cSHQ==
X-CSE-MsgGUID: 84jMPqYGSNqMnFOZZhdZnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101051675"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jan 2025 01:03:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSudM-0007jd-1D;
	Wed, 01 Jan 2025 09:03:20 +0000
Date: Wed, 1 Jan 2025 17:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1682/1682] arch/x86/kernel/cpu/hygon.c:480:6:
 warning: no previous prototype for 'set_c86_features_para_invalid'
Message-ID: <202501011605.BcpO7rIF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1e531b8351b843cd4a160764c0f67e4c9805234d
commit: 48fb9af1d04848a2583b2dbf3b7091eca38dd482 [1682/1682] mm: Enhanced copy capabilities for Hygon processor
config: x86_64-randconfig-121-20250101 (https://download.01.org/0day-ci/archive/20250101/202501011605.BcpO7rIF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011605.BcpO7rIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011605.BcpO7rIF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/hygon.c:480:6: warning: no previous prototype for 'set_c86_features_para_invalid' [-Wmissing-prototypes]
     480 | void set_c86_features_para_invalid(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/cpu/hygon.c:485:14: warning: no previous prototype for 'get_nt_block_copy_mini_len' [-Wmissing-prototypes]
     485 | unsigned int get_nt_block_copy_mini_len(void)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> arch/x86/kernel/fpu/core.c:466:14: warning: no previous prototype for 'get_fpustate_free_space' [-Wmissing-prototypes]
     466 | unsigned int get_fpustate_free_space(struct fpu *fpu)
         |              ^~~~~~~~~~~~~~~~~~~~~~~

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/hygon.c:480:6: sparse: sparse: symbol 'set_c86_features_para_invalid' was not declared. Should it be static?
>> arch/x86/kernel/cpu/hygon.c:522:30: sparse: sparse: symbol 'hygon_c86_attr_group' was not declared. Should it be static?
--
>> arch/x86/kernel/fpu/core.c:466:14: sparse: sparse: symbol 'get_fpustate_free_space' was not declared. Should it be static?
   arch/x86/kernel/fpu/core.c:656:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/core.c:656:39: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/core.c:656:39: sparse:     got struct spinlock [noderef] __rcu *
   arch/x86/kernel/fpu/core.c:660:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/core.c:660:41: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/core.c:660:41: sparse:     got struct spinlock [noderef] __rcu *

vim +/set_c86_features_para_invalid +480 arch/x86/kernel/cpu/hygon.c

   479	
 > 480	void set_c86_features_para_invalid(void)
   481	{
   482		memset((void *)&hygon_c86_data, 0, sizeof(struct hygon_c86_info));
   483	}
   484	
 > 485	unsigned int get_nt_block_copy_mini_len(void)
   486	{
   487		unsigned int mini_len = hygon_c86_data.nt_cpy_mini_len;
   488	
   489		return mini_len;
   490	}
   491	EXPORT_SYMBOL_GPL(get_nt_block_copy_mini_len);
   492	
   493	static ssize_t show_nt_cpy_mini_len(struct kobject *kobj,
   494					    struct kobj_attribute *attr, char *buf)
   495	{
   496		return snprintf(buf, 40, "%d\n", hygon_c86_data.nt_cpy_mini_len);
   497	}
   498	
   499	static ssize_t store_nt_cpy_mini_len(struct kobject *kobj,
   500					     struct kobj_attribute *attr,
   501					     const char *buf, size_t count)
   502	{
   503		unsigned long val;
   504		ssize_t ret;
   505	
   506		ret = kstrtoul(buf, 0, &val);
   507		if (ret)
   508			return ret;
   509	
   510		hygon_c86_data.nt_cpy_mini_len = val;
   511	
   512		return count;
   513	}
   514	
   515	static struct kobj_attribute nt_cpy_mini_len_attribute = __ATTR(
   516		nt_cpy_mini_len, 0600, show_nt_cpy_mini_len, store_nt_cpy_mini_len);
   517	
   518	static struct attribute *c86_default_attrs[] = {
   519		&nt_cpy_mini_len_attribute.attr, NULL
   520	};
   521	
 > 522	const struct attribute_group hygon_c86_attr_group = {
   523		.attrs = c86_default_attrs,
   524		.name = "hygon_c86",
   525	};
   526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

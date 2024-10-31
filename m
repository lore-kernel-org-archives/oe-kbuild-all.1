Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6567713C677
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 19:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730401371; cv=none; b=WBymajMdN1KsFzLSO9exjOf7cnVP+EGLiGfLxavU5uZV0iPdbiJwQ/U/XAv5PShtBIAayhwS7EBeXlMcQWOFaLbPFlysfeGgRONEJ2RfMU1Naf0BBy8c2PYwIYwTxEwZUWSuEUQRu2KkI2OuJIf7oYVFZAq2c2VryYqopl5qkMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730401371; c=relaxed/simple;
	bh=vYiTcLzvbtmn+5Cup80nGU51QeOBT6Gsb0GtnKlru2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ukSVfD+w7rixJVGxTbWjAzsZKT6Kq1aMhuCyfv9AecrVPH2KbdNCZDY74/DeTfGfFeUhYCXR/bQsx1Q/HezMe4PSGcZgINn/hEtrV2OUmBj1/Y5JRt/H3UZDWSvXgFLyqUbn++eWF8JRsOKYeuwrmMYFz4X083TKU1nEvW26TbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhqcGsO1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhqcGsO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730401368; x=1761937368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vYiTcLzvbtmn+5Cup80nGU51QeOBT6Gsb0GtnKlru2Y=;
  b=IhqcGsO1PfjZc4blEg3Gqr7odnbrr0PqbysJc9grZMlKLC3denfSHeXh
   /i3YVx57VsB+9oGCAd6vP1nrIUIoC/eDno6t/mlZWOALyG1N+a5ihZ9gV
   8mKQym4ZhdSwsj9emLcItvrlM9JIvek4JhIQimwTxjyShTd5V0yTIInNa
   ULipnd9G51pBPTL8ydKBo5sRFbZA9JexqTFZ/yRJ4qoQoUnzuWIZ2JlpC
   H/Ob6KZdkUytmv5rRMQColtQN9VSVuEFz5nzjZcU2TFb5KQAPaucRKGQY
   6fqS+VhbEbtqFcGeODAAYWMaJXcqaUI4bI21DI0qs4PO9L2+i+EppQs6X
   Q==;
X-CSE-ConnectionGUID: 3CLn7Yh7Q0OPQAkd2pf9JQ==
X-CSE-MsgGUID: NUYFZGZvS0ikC61T0JUL9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="33962773"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="33962773"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 12:02:47 -0700
X-CSE-ConnectionGUID: wvWO/+/3QiizEg6nS1EqOA==
X-CSE-MsgGUID: 60fLoktARw6Npx9enZVN9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82844608"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Oct 2024 12:02:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6aRM-000gd6-2E;
	Thu, 31 Oct 2024 19:02:40 +0000
Date: Fri, 1 Nov 2024 03:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 11997/13046] kernel/sysctl.c:1964:5: sparse:
 sparse: symbol 'memory_qos_sysctl_handler' was not declared. Should it be
 static?
Message-ID: <202411010254.NTeMfAlw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: db44c11cddf0fc44d68950c9a428511637445aa4 [11997/13046] rue/mm: add priority reclaim support
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241101/202411010254.NTeMfAlw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010254.NTeMfAlw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010254.NTeMfAlw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sysctl.c:1003:47: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1003:47: sparse:     expected void *buffer
   kernel/sysctl.c:1003:47: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:990:5: sparse: sparse: symbol 'proc_dointvec_max_map_count' was not declared. Should it be static?
   kernel/sysctl.c:1163:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1163:45: sparse:     expected void *buffer
   kernel/sysctl.c:1163:45: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1976:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1976:52: sparse:     expected void *buffer
   kernel/sysctl.c:1976:52: sparse:     got void [noderef] __user *buffer
>> kernel/sysctl.c:1964:5: sparse: sparse: symbol 'memory_qos_sysctl_handler' was not declared. Should it be static?
   kernel/sysctl.c:1997:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1997:52: sparse:     expected void *buffer
   kernel/sysctl.c:1997:52: sparse:     got void [noderef] __user *buffer
>> kernel/sysctl.c:1991:5: sparse: sparse: symbol 'memory_qos_sysctl_highest_reclaim_prio_handler' was not declared. Should it be static?
   kernel/sysctl.c:2015:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:2015:52: sparse:     expected void *buffer
   kernel/sysctl.c:2015:52: sparse:     got void [noderef] __user *buffer
>> kernel/sysctl.c:2007:5: sparse: sparse: symbol 'memory_qos_sysctl_prio_reclaim_ratio_handler' was not declared. Should it be static?
   kernel/sysctl.c:2267:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2267:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2267:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2736:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2736:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2736:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2902:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2902:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2902:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2911:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2911:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2911:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2920:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2920:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2920:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:353:66: sparse: sparse: self-comparison always evaluates to false

vim +/memory_qos_sysctl_handler +1964 kernel/sysctl.c

  1962	
  1963	#ifdef CONFIG_MEMCG
> 1964	int memory_qos_sysctl_handler(struct ctl_table *table, int write,
  1965			void __user *buffer, size_t *lenp, loff_t *ppos)
  1966	{
  1967		int error;
  1968	
  1969		mutex_lock(&rue_mutex);
  1970		if (write && !READ_ONCE(rue_installed)) {
  1971			error = -EBUSY;
  1972			pr_info("RUE: rue kernel module is not enabled or installed.");
  1973			goto out;
  1974		}
  1975	
> 1976		error = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
  1977		if (error)
  1978			goto out;
  1979	
  1980		if (write)
  1981			memory_qos_update();
  1982	
  1983		mutex_unlock(&rue_mutex);
  1984		return 0;
  1985	
  1986	out:
  1987		mutex_unlock(&rue_mutex);
  1988		return error;
  1989	}
  1990	
> 1991	int memory_qos_sysctl_highest_reclaim_prio_handler(struct ctl_table *table,
  1992					int write, void __user *buffer,
  1993					size_t *lenp, loff_t *ppos)
  1994	{
  1995		int error;
  1996	
  1997		error = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
  1998		if (error)
  1999			return error;
  2000	
  2001		if (write)
  2002			memory_qos_update();
  2003	
  2004		return 0;
  2005	}
  2006	
> 2007	int memory_qos_sysctl_prio_reclaim_ratio_handler(struct ctl_table *table,
  2008					int write, void __user *buffer,
  2009					size_t *lenp, loff_t *ppos)
  2010	{
  2011		int error;
  2012		unsigned int old;
  2013	
  2014		old = sysctl_vm_qos_prio_reclaim_ratio;
  2015		error = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
  2016		if (error)
  2017			return error;
  2018	
  2019		if (old == sysctl_vm_qos_prio_reclaim_ratio)
  2020			return 0;
  2021	
  2022		if (write) {
  2023			error = memory_qos_prio_reclaim_ratio_update();
  2024			if (error) {
  2025				sysctl_vm_qos_prio_reclaim_ratio = old;
  2026				return -EINVAL;
  2027			}
  2028		}
  2029	
  2030		return 0;
  2031	}
  2032	#endif
  2033	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

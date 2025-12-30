Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF1A17B50A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 01:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767057970; cv=none; b=FnZfQ0nZh1Z7Ibmm6PMWPnt/dgRPvH7pSE9LHVrQjSTK+G13la/xk61rl3DDr3m+eT5fN5WnYf7Z0SJE4QkuzhOcrNxh3OXs3emRW0AMUJkZC8L1dq8YWm2VtKhQ4nOMkQnsU94uMGAxrZ/+HpJUZgqAfWqs6NGCQlhsAXhxWHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767057970; c=relaxed/simple;
	bh=VAAblPWB0GeAzrG+v4d2RJn6GUK9O2/3o4ITCUt56RY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fxiFMEA1QEDs8S3F6MXyhtOeoou/bPKk9AKbmbroxe6Alf2q3uXNB7StrKwioTc9eEFZAbmru5cw1JtTrMblpxLvHQxrz6fG6KZrn6EeOM2/z0Ir25x4mt73xKXZ7xLy2UM9AfZjWxUjp44bHMaCvUwzrD05SNjYYx6itijU+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h60DSPeD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h60DSPeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767057968; x=1798593968;
  h=date:from:to:cc:subject:message-id;
  bh=VAAblPWB0GeAzrG+v4d2RJn6GUK9O2/3o4ITCUt56RY=;
  b=h60DSPeDF7YKzxtWE85d5NGQy9pLOdDBqbPluho965+L2XBduK2GK6kP
   +qLkgBfYYlV/2kIh3Vr2XKlNrOnIgfdxdktPtzNJ3QlLCB43ZTJmaevPx
   L4pemR5J+cTcExmBg8onhrl6HfEZXxMUwjGctUCYrM0EQCsKfFetRvSNK
   Xdau3p/xgo7aDXv4wknGpU7gQaGSOWSsWCfnNPFd3dHdb9vHZrv71k10G
   ePxib1nFwhsLIisFpuzTrxG/FTz2POedd5BQVqKzHi/Up8WjGl/feerN1
   rxFJCUkjhI2abJtVrBU5GNrgDjmyFWkoZohdaJUvPr8UTg8jrlazyAC3B
   g==;
X-CSE-ConnectionGUID: V/406BRFRFuEerd6T0TQQA==
X-CSE-MsgGUID: TEcyVnGCTFqSd2FHq9jYrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="71241770"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="71241770"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 17:26:07 -0800
X-CSE-ConnectionGUID: oVWjxy+UQhuQSGsaxfMTng==
X-CSE-MsgGUID: iwjUcaiGQXS6P4JV1VvFOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="200207061"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Dec 2025 17:26:06 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaOUp-000000008B7-0rIq;
	Tue, 30 Dec 2025 01:26:01 +0000
Date: Tue, 30 Dec 2025 09:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 0/15] arch/x86/kernel/cpu/hygon.c:480:6:
 sparse: sparse: symbol 'set_c86_features_para_invalid' was not declared.
 Should it be static?
Message-ID: <202512300937.7Rd3gCCO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f148785f0bb856bba8ceca2b699a2f102f22174a
commit: 48fb9af1d04848a2583b2dbf3b7091eca38dd482 [0/15] mm: Enhanced copy capabilities for Hygon processor
config: x86_64-randconfig-123-20251230 (https://download.01.org/0day-ci/archive/20251230/202512300937.7Rd3gCCO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512300937.7Rd3gCCO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512300937.7Rd3gCCO-lkp@intel.com/

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
   485	unsigned int get_nt_block_copy_mini_len(void)
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

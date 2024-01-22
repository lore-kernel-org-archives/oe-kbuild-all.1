Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597C11C2D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 04:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705896226; cv=none; b=XTC7URry7nw4KiJV9fwtMR53EBsLiI16cwvJ35WgPtimpjw4UbJXOTbrGW6R7yiv5+VBHkGMlj9wc2YNQXWZcg0QTIpTiQbOp9H9GPsNBzzhbHClUIPgeenZU87oSxV0Q/SzLdm5boAU+8eaL0ROul49/4GSx/TV6G7+iAQ9sgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705896226; c=relaxed/simple;
	bh=u6E/0A5AeeS8F9mCyHBEtWlh8ALPXOJDIHle18aykxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YKEN4A9sJIJsD1MmP87bf0DL5NCq5EnTjvlYXXG6kywXde3dkm1/ooXekrRgjqTYXNgKtPZLQt+TOIgJu1FXPdE7jNvAdJWvmvba+ALjZpTApuk+usmgealQvJSqS0oU7OqzCub6SZjq7rv8osjxOZjQpV75O2T808WgfuSP83I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LzR+aElU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzR+aElU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705896224; x=1737432224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u6E/0A5AeeS8F9mCyHBEtWlh8ALPXOJDIHle18aykxU=;
  b=LzR+aElUmwX6RMEHCKFz2FOh1TM/wipaDrQF+CHYX3Tg0q3EQoXWrt7p
   s61YJ8wSu0fMUP/LR8p108DoUU7ZaUCwLCLGg5L2dJLsZ6un8IKG1QiZo
   nmLmqvtTnZShYSgALSfavFK1c0JNPeDtAX7wEMeMKZYl9ioaIiJI2A7IE
   HQz2bl0IObBsJusFFtWbFnHHh2N0hJsP2vhZhn3g6yWvlTcQyZF/i8eXb
   tJ01x4W+sMXzzE9f9OJzp8SZx2H/VDcWRNjoZ81GWuP2PD43tcvB7TJPM
   C3lisAX5ZH3TDiyFuxx6cljQWNz7oJcwOL7iKD1sTPxyRiB5R5WRs1xQe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="14446845"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="14446845"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 20:03:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="904721856"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="904721856"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jan 2024 20:03:36 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRlX4-0006Ns-0K;
	Mon, 22 Jan 2024 04:03:34 +0000
Date: Mon, 22 Jan 2024 12:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-6.9-sr-enforcement 19/73]
 arch/arm64/kvm/emulate-nested.c:1935:31: error: implicit declaration of
 function 'sanitised_sys_reg'
Message-ID: <202401221145.KS0wWCNe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-6.9-sr-enforcement
head:   fb04ec45e71f56be255f77ee293e821f6cf9d539
commit: 72649282ff3e4750e8683886d693e3c11f197bd4 [19/73] KVM: arm64: nv: Drop sanitised_sys_reg() helper
config: arm64-randconfig-001-20240121 (https://download.01.org/0day-ci/archive/20240122/202401221145.KS0wWCNe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401221145.KS0wWCNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401221145.KS0wWCNe-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/emulate-nested.c: In function '__check_nv_sr_forward':
>> arch/arm64/kvm/emulate-nested.c:1935:31: error: implicit declaration of function 'sanitised_sys_reg' [-Werror=implicit-function-declaration]
    1935 |                         val = sanitised_sys_reg(vcpu, HFGRTR_EL2);
         |                               ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sanitised_sys_reg +1935 arch/arm64/kvm/emulate-nested.c

15b4d82d69d7b0 Marc Zyngier 2023-08-15  1899  
e58ec47bf68d2b Marc Zyngier 2023-08-15  1900  bool __check_nv_sr_forward(struct kvm_vcpu *vcpu)
e58ec47bf68d2b Marc Zyngier 2023-08-15  1901  {
e58ec47bf68d2b Marc Zyngier 2023-08-15  1902  	union trap_config tc;
e58ec47bf68d2b Marc Zyngier 2023-08-15  1903  	enum trap_behaviour b;
e58ec47bf68d2b Marc Zyngier 2023-08-15  1904  	bool is_read;
e58ec47bf68d2b Marc Zyngier 2023-08-15  1905  	u32 sysreg;
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1906  	u64 esr, val;
e58ec47bf68d2b Marc Zyngier 2023-08-15  1907  
e58ec47bf68d2b Marc Zyngier 2023-08-15  1908  	if (!vcpu_has_nv(vcpu) || is_hyp_ctxt(vcpu))
e58ec47bf68d2b Marc Zyngier 2023-08-15  1909  		return false;
e58ec47bf68d2b Marc Zyngier 2023-08-15  1910  
e58ec47bf68d2b Marc Zyngier 2023-08-15  1911  	esr = kvm_vcpu_get_esr(vcpu);
e58ec47bf68d2b Marc Zyngier 2023-08-15  1912  	sysreg = esr_sys64_to_sysreg(esr);
e58ec47bf68d2b Marc Zyngier 2023-08-15  1913  	is_read = (esr & ESR_ELx_SYS64_ISS_DIR_MASK) == ESR_ELx_SYS64_ISS_DIR_READ;
e58ec47bf68d2b Marc Zyngier 2023-08-15  1914  
e58ec47bf68d2b Marc Zyngier 2023-08-15  1915  	tc = get_trap_config(sysreg);
e58ec47bf68d2b Marc Zyngier 2023-08-15  1916  
e58ec47bf68d2b Marc Zyngier 2023-08-15  1917  	/*
e58ec47bf68d2b Marc Zyngier 2023-08-15  1918  	 * A value of 0 for the whole entry means that we know nothing
e58ec47bf68d2b Marc Zyngier 2023-08-15  1919  	 * for this sysreg, and that it cannot be re-injected into the
e58ec47bf68d2b Marc Zyngier 2023-08-15  1920  	 * nested hypervisor. In this situation, let's cut it short.
e58ec47bf68d2b Marc Zyngier 2023-08-15  1921  	 *
e58ec47bf68d2b Marc Zyngier 2023-08-15  1922  	 * Note that ultimately, we could also make use of the xarray
e58ec47bf68d2b Marc Zyngier 2023-08-15  1923  	 * to store the index of the sysreg in the local descriptor
e58ec47bf68d2b Marc Zyngier 2023-08-15  1924  	 * array, avoiding another search... Hint, hint...
e58ec47bf68d2b Marc Zyngier 2023-08-15  1925  	 */
e58ec47bf68d2b Marc Zyngier 2023-08-15  1926  	if (!tc.val)
e58ec47bf68d2b Marc Zyngier 2023-08-15  1927  		return false;
e58ec47bf68d2b Marc Zyngier 2023-08-15  1928  
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1929  	switch ((enum fgt_group_id)tc.fgt) {
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1930  	case __NO_FGT_GROUP__:
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1931  		break;
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1932  
5a24ea78698572 Marc Zyngier 2023-08-15  1933  	case HFGxTR_GROUP:
5a24ea78698572 Marc Zyngier 2023-08-15  1934  		if (is_read)
5a24ea78698572 Marc Zyngier 2023-08-15 @1935  			val = sanitised_sys_reg(vcpu, HFGRTR_EL2);
5a24ea78698572 Marc Zyngier 2023-08-15  1936  		else
72649282ff3e47 Marc Zyngier 2024-01-18  1937  			val = __vcpu_sys_reg(vcpu, HFGWTR_EL2);
5a24ea78698572 Marc Zyngier 2023-08-15  1938  		break;
5a24ea78698572 Marc Zyngier 2023-08-15  1939  
d0be0b2ede1324 Marc Zyngier 2023-08-15  1940  	case HDFGRTR_GROUP:
d0be0b2ede1324 Marc Zyngier 2023-08-15  1941  	case HDFGWTR_GROUP:
d0be0b2ede1324 Marc Zyngier 2023-08-15  1942  		if (is_read)
72649282ff3e47 Marc Zyngier 2024-01-18  1943  			val = __vcpu_sys_reg(vcpu, HDFGRTR_EL2);
d0be0b2ede1324 Marc Zyngier 2023-08-15  1944  		else
72649282ff3e47 Marc Zyngier 2024-01-18  1945  			val = __vcpu_sys_reg(vcpu, HDFGWTR_EL2);
d0be0b2ede1324 Marc Zyngier 2023-08-15  1946  		break;
d0be0b2ede1324 Marc Zyngier 2023-08-15  1947  
676f482354886c Fuad Tabba   2023-12-14  1948  	case HAFGRTR_GROUP:
72649282ff3e47 Marc Zyngier 2024-01-18  1949  		val = __vcpu_sys_reg(vcpu, HAFGRTR_EL2);
676f482354886c Fuad Tabba   2023-12-14  1950  		break;
676f482354886c Fuad Tabba   2023-12-14  1951  
039f9f12de5fc7 Marc Zyngier 2023-08-15  1952  	case HFGITR_GROUP:
72649282ff3e47 Marc Zyngier 2024-01-18  1953  		val = __vcpu_sys_reg(vcpu, HFGITR_EL2);
03fb54d0aa73cc Marc Zyngier 2023-08-15  1954  		switch (tc.fgf) {
03fb54d0aa73cc Marc Zyngier 2023-08-15  1955  			u64 tmp;
03fb54d0aa73cc Marc Zyngier 2023-08-15  1956  
03fb54d0aa73cc Marc Zyngier 2023-08-15  1957  		case __NO_FGF__:
03fb54d0aa73cc Marc Zyngier 2023-08-15  1958  			break;
03fb54d0aa73cc Marc Zyngier 2023-08-15  1959  
03fb54d0aa73cc Marc Zyngier 2023-08-15  1960  		case HCRX_FGTnXS:
72649282ff3e47 Marc Zyngier 2024-01-18  1961  			tmp = __vcpu_sys_reg(vcpu, HCRX_EL2);
03fb54d0aa73cc Marc Zyngier 2023-08-15  1962  			if (tmp & HCRX_EL2_FGTnXS)
03fb54d0aa73cc Marc Zyngier 2023-08-15  1963  				tc.fgt = __NO_FGT_GROUP__;
03fb54d0aa73cc Marc Zyngier 2023-08-15  1964  		}
039f9f12de5fc7 Marc Zyngier 2023-08-15  1965  		break;
039f9f12de5fc7 Marc Zyngier 2023-08-15  1966  
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1967  	case __NR_FGT_GROUP_IDS__:
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1968  		/* Something is really wrong, bail out */
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1969  		WARN_ONCE(1, "__NR_FGT_GROUP_IDS__");
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1970  		return false;
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1971  	}
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1972  
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1973  	if (tc.fgt != __NO_FGT_GROUP__ && check_fgt_bit(val, tc))
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1974  		goto inject;
15b4d82d69d7b0 Marc Zyngier 2023-08-15  1975  
e58ec47bf68d2b Marc Zyngier 2023-08-15  1976  	b = compute_trap_behaviour(vcpu, tc);
e58ec47bf68d2b Marc Zyngier 2023-08-15  1977  
e58ec47bf68d2b Marc Zyngier 2023-08-15  1978  	if (((b & BEHAVE_FORWARD_READ) && is_read) ||
e58ec47bf68d2b Marc Zyngier 2023-08-15  1979  	    ((b & BEHAVE_FORWARD_WRITE) && !is_read))
e58ec47bf68d2b Marc Zyngier 2023-08-15  1980  		goto inject;
e58ec47bf68d2b Marc Zyngier 2023-08-15  1981  
e58ec47bf68d2b Marc Zyngier 2023-08-15  1982  	return false;
e58ec47bf68d2b Marc Zyngier 2023-08-15  1983  
e58ec47bf68d2b Marc Zyngier 2023-08-15  1984  inject:
e58ec47bf68d2b Marc Zyngier 2023-08-15  1985  	trace_kvm_forward_sysreg_trap(vcpu, sysreg, is_read);
e58ec47bf68d2b Marc Zyngier 2023-08-15  1986  
e58ec47bf68d2b Marc Zyngier 2023-08-15  1987  	kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));
e58ec47bf68d2b Marc Zyngier 2023-08-15  1988  	return true;
e58ec47bf68d2b Marc Zyngier 2023-08-15  1989  }
e58ec47bf68d2b Marc Zyngier 2023-08-15  1990  

:::::: The code at line 1935 was first introduced by commit
:::::: 5a24ea7869857251a83da1512209f76003bc09db KVM: arm64: nv: Add trap forwarding for HFGxTR_EL2

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

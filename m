Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECF8380
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 05:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741498191; cv=none; b=p7toJPkWhK8sBK8pLO5NQGTkHk+gOq+ZY2GMIGgKe+W1SC2QcwQqq5gVClPmnb+t57rncDWtqgW235D2n1/VGgV9b5BWDXJgfnpYDOF7OEbWVehVNC/E0XdbWNBe0BakfBRAgBZaFYeAYzqPXm/pqg7YmXTHkVoMAfbvelqvEPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741498191; c=relaxed/simple;
	bh=D6wYdcxD4UL8zZKwS0YcED8ZO59qEWU+DxCU8V5vL+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAiI/LLHg538kJwnYNCJNSd476aV6X8JVFYhPnbkJVfY5w1qdcSYYM1n4dCEtAUzJg0RnfJoZGZGsv8UawN4qVBsGCC0zb65aTZeinv5lBUzqWlywF2XNJyYdIzuzg4UkCUi419XXockX+O8z5EkG4R9zNKPQ78XjSuNXS4m2xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZt7hkZC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZt7hkZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741498189; x=1773034189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D6wYdcxD4UL8zZKwS0YcED8ZO59qEWU+DxCU8V5vL+s=;
  b=HZt7hkZCqbUu2WT0OFQTB6R6wYC2qkhRonTdamuh6tYOde4gHNyCIhrT
   MV1yCRfqXJ05hhqcyaf3pSsIWmIeTE3V3q1USotCCHI9NSAPW9/unHLNG
   y+k7u7RRxrTnXVF8pGzy2BYdg26YQgV9uVEf02GFKjhOHcDFs6pfFIdCx
   0dgkoMsyG80Z6CYPAQvt5gvqa8x4QbHXBKQz4vJKgIDyOdk3wOvbc/cL3
   vG+0aDppLD0+hZWvl3B2cEFTc2T++zn8/yf2AtmDng4E1hV0RO7cG3+p4
   tH6dm5sL8MwN98uVudqX6/ijdxknltaaP62OI1GiLzHDy7cC1ODpTef13
   Q==;
X-CSE-ConnectionGUID: IwXNISNSRLy+830SPdrBow==
X-CSE-MsgGUID: JWFP/skhRZC73uCxO89VOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42627062"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="42627062"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 21:29:48 -0800
X-CSE-ConnectionGUID: /+DrHOyyQXC2r8u5b2GYCA==
X-CSE-MsgGUID: YpxC2PGjQ8aaPrSepA24Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123881083"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 08 Mar 2025 21:29:48 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr9EP-0002j4-0k;
	Sun, 09 Mar 2025 05:29:45 +0000
Date: Sun, 9 Mar 2025 13:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] fs/resctrl/rdtgroup.c:922:
 warning: Function parameter or member 'of' not described in
 'rdt_bit_usage_show'
Message-ID: <202503091339.mCIaSqVf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   797aae63f086cf8250bfbb8395ab310c525ac4a6
commit: d316700048b00eda1c12c71a3153ce9d4f075862 [1/1] x86/resctrl: Move resctrl to /fs/
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250309/202503091339.mCIaSqVf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091339.mCIaSqVf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091339.mCIaSqVf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/resctrl/rdtgroup.c:922: warning: Function parameter or member 'of' not described in 'rdt_bit_usage_show'
>> fs/resctrl/rdtgroup.c:922: warning: Function parameter or member 'seq' not described in 'rdt_bit_usage_show'
>> fs/resctrl/rdtgroup.c:922: warning: Function parameter or member 'v' not described in 'rdt_bit_usage_show'
>> fs/resctrl/rdtgroup.c:1151: warning: Function parameter or member 'type' not described in '__rdtgroup_cbm_overlaps'
>> fs/resctrl/rdtgroup.c:1231: warning: Function parameter or member 'rdtgrp' not described in 'rdtgroup_mode_test_exclusive'
>> fs/resctrl/rdtgroup.c:1271: warning: Function parameter or member 'of' not described in 'rdtgroup_mode_write'
>> fs/resctrl/rdtgroup.c:1271: warning: Function parameter or member 'buf' not described in 'rdtgroup_mode_write'
>> fs/resctrl/rdtgroup.c:1271: warning: Function parameter or member 'nbytes' not described in 'rdtgroup_mode_write'
>> fs/resctrl/rdtgroup.c:1271: warning: Function parameter or member 'off' not described in 'rdtgroup_mode_write'
>> fs/resctrl/rdtgroup.c:1381: warning: Function parameter or member 'of' not described in 'rdtgroup_size_show'
>> fs/resctrl/rdtgroup.c:1381: warning: Function parameter or member 's' not described in 'rdtgroup_size_show'
>> fs/resctrl/rdtgroup.c:1381: warning: Function parameter or member 'v' not described in 'rdtgroup_size_show'
--
>> fs/resctrl/monitor.c:32: warning: Cannot understand  * @rmid_free_lru    A least recently used list of free RMIDs
    on line 32 - I thought it was a doc line
>> fs/resctrl/monitor.c:39: warning: Cannot understand  * @rmid_limbo_count     count of currently unused but (potentially)
    on line 39 - I thought it was a doc line
>> fs/resctrl/monitor.c:48: warning: Cannot understand  * @rmid_entry - The entry in the limbo and free lists.
    on line 48 - I thought it was a doc line


vim +922 fs/resctrl/rdtgroup.c

   905	
   906	/**
   907	 * rdt_bit_usage_show - Display current usage of resources
   908	 *
   909	 * A domain is a shared resource that can now be allocated differently. Here
   910	 * we display the current regions of the domain as an annotated bitmask.
   911	 * For each domain of this resource its allocation bitmask
   912	 * is annotated as below to indicate the current usage of the corresponding bit:
   913	 *   0 - currently unused
   914	 *   X - currently available for sharing and used by software and hardware
   915	 *   H - currently used by hardware only but available for software use
   916	 *   S - currently used and shareable by software only
   917	 *   E - currently used exclusively by one resource group
   918	 *   P - currently pseudo-locked by one resource group
   919	 */
   920	static int rdt_bit_usage_show(struct kernfs_open_file *of,
   921				      struct seq_file *seq, void *v)
 > 922	{
   923		struct resctrl_schema *s = of->kn->parent->priv;
   924		/*
   925		 * Use unsigned long even though only 32 bits are used to ensure
   926		 * test_bit() is used safely.
   927		 */
   928		unsigned long sw_shareable = 0, hw_shareable = 0;
   929		unsigned long exclusive = 0, pseudo_locked = 0;
   930		struct rdt_resource *r = s->res;
   931		struct rdt_domain *dom;
   932		int i, hwb, swb, excl, psl;
   933		enum rdtgrp_mode mode;
   934		bool sep = false;
   935		u32 ctrl_val;
   936	
   937		mutex_lock(&rdtgroup_mutex);
   938		hw_shareable = r->cache.shareable_bits;
   939		rcu_read_lock();
   940		list_for_each_entry_rcu(dom, &r->domains, list) {
   941			if (sep)
   942				seq_putc(seq, ';');
   943			sw_shareable = 0;
   944			exclusive = 0;
   945			seq_printf(seq, "%d=", dom->id);
   946			for (i = 0; i < closids_supported(); i++) {
   947				if (!closid_allocated(i))
   948					continue;
   949				ctrl_val = resctrl_arch_get_config(r, dom, i,
   950								   s->conf_type);
   951				mode = rdtgroup_mode_by_closid(i);
   952				switch (mode) {
   953				case RDT_MODE_SHAREABLE:
   954					sw_shareable |= ctrl_val;
   955					break;
   956				case RDT_MODE_EXCLUSIVE:
   957					exclusive |= ctrl_val;
   958					break;
   959				case RDT_MODE_PSEUDO_LOCKSETUP:
   960				/*
   961				 * RDT_MODE_PSEUDO_LOCKSETUP is possible
   962				 * here but not included since the CBM
   963				 * associated with this CLOSID in this mode
   964				 * is not initialized and no task or cpu can be
   965				 * assigned this CLOSID.
   966				 */
   967					break;
   968				case RDT_MODE_PSEUDO_LOCKED:
   969				case RDT_NUM_MODES:
   970					WARN(1,
   971					     "invalid mode for closid %d\n", i);
   972					break;
   973				}
   974			}
   975			for (i = r->cache.cbm_len - 1; i >= 0; i--) {
   976				pseudo_locked = dom->plr ? dom->plr->cbm : 0;
   977				hwb = test_bit(i, &hw_shareable);
   978				swb = test_bit(i, &sw_shareable);
   979				excl = test_bit(i, &exclusive);
   980				psl = test_bit(i, &pseudo_locked);
   981				if (hwb && swb)
   982					seq_putc(seq, 'X');
   983				else if (hwb && !swb)
   984					seq_putc(seq, 'H');
   985				else if (!hwb && swb)
   986					seq_putc(seq, 'S');
   987				else if (excl)
   988					seq_putc(seq, 'E');
   989				else if (psl)
   990					seq_putc(seq, 'P');
   991				else /* Unused bits remain */
   992					seq_putc(seq, '0');
   993			}
   994			sep = true;
   995		}
   996		rcu_read_unlock();
   997		seq_putc(seq, '\n');
   998		mutex_unlock(&rdtgroup_mutex);
   999	
  1000		return 0;
  1001	}
  1002	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

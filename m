Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE771465BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 07:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730359024; cv=none; b=KyD/RuUZbBUHsPx9PuWAlwRlOYkzAytTssSVby2z/tWTlzTvoglFfyqTBQoQaGNcNtHqknGB4IOCfqr8SHHkjcEUjpXdEuVlpSaUBYHoUzB3Ykh7CBjQHunF7Qxitz98Wko6nB/QcAZ+DNvpuc5WjSsofejnOyvjqHowNpcNV2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730359024; c=relaxed/simple;
	bh=nAGIJqSmLL4oZRh2aEIZcF9AAYUqw1wR0boJHtZHgNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImrslzwdUZtKmTQ0u8kdJB5za4yvHeN8R69ZmImHPlaFVh1KslT7jPeDq5L5aMN4naUdpWK4Wk1/N55HH5ueKlGGO2SthtKU/CC/imuViPXGenuWXjheZGl/3b1ckTX76aODNXeyNXFjVSQvocDZwAfcBSLynOCINarbL2mVkJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRumm/o5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRumm/o5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730359022; x=1761895022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nAGIJqSmLL4oZRh2aEIZcF9AAYUqw1wR0boJHtZHgNc=;
  b=FRumm/o5MbNW8agTVj8uS1XJqTFHRm/0D8zs0oduKig4bwX06bTNKaGu
   Q6SMU56JQptBWlE6V1jbv1mJta37x1EIwjlURmWtWbNz0FF9Ho1nmUokD
   03JQKzj3RsHHmjI6h+e8mkjfdsgkRAmiahCmY1zRmH9e/hEJdPdtzlTWS
   xas2gPC+PIh21ZzeYY/v859fwDa048t3KV73lzLRCSRdhw9ALt4QoUdfY
   5Hzk9g4ZlPfiR1Kon31ejJWmF3m3DqiRo60BNQr5HElK8PXG5RJmK9xJS
   KjFZ1iq9vkknSzvtFVB2W9R08dM9d69bgv8fO8jikFzwBp01LKNtEC83d
   w==;
X-CSE-ConnectionGUID: w855mzB7Sh+yw1ScrmrFsg==
X-CSE-MsgGUID: BTggD4YPSruUiNiCRz10pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="55481615"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="55481615"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 00:17:01 -0700
X-CSE-ConnectionGUID: 6ehXOQvaTMifiM98fXAgvQ==
X-CSE-MsgGUID: rrVMO9tySqWS7fF9hlMQRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87328551"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Oct 2024 00:17:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6PQP-000fnQ-2D;
	Thu, 31 Oct 2024 07:16:57 +0000
Date: Thu, 31 Oct 2024 15:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: Babu Moger <babu.moger@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 17/26] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
Message-ID: <202410311452.VieQO7W8-lkp@intel.com>
References: <a3c2bdf2153882cc955b80b7d0fcdf7af3d09eb3.1730244116.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3c2bdf2153882cc955b80b7d0fcdf7af3d09eb3.1730244116.git.babu.moger@amd.com>

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241029]
[cannot apply to linus/master tip/x86/core v6.12-rc5 v6.12-rc4 v6.12-rc3 v6.12-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-resctrl-Add-__init-attribute-for-the-functions-called-in-resctrl_late_init/20241030-073059
base:   next-20241029
patch link:    https://lore.kernel.org/r/a3c2bdf2153882cc955b80b7d0fcdf7af3d09eb3.1730244116.git.babu.moger%40amd.com
patch subject: [PATCH v9 17/26] x86/resctrl: Implement resctrl_arch_config_cntr() to assign a counter with ABMC
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241031/202410311452.VieQO7W8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311452.VieQO7W8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311452.VieQO7W8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/resctrl/rdtgroup.c: In function 'resctrl_arch_config_cntr':
>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:1905:32: warning: variable 'arch_mbm' set but not used [-Wunused-but-set-variable]
    1905 |         struct arch_mbm_state *arch_mbm;
         |                                ^~~~~~~~


vim +/arch_mbm +1905 arch/x86/kernel/cpu/resctrl/rdtgroup.c

  1895	
  1896	/*
  1897	 * Send an IPI to the domain to assign the counter to RMID, event pair.
  1898	 */
  1899	int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
  1900				     enum resctrl_event_id evtid, u32 rmid, u32 closid,
  1901				     u32 cntr_id, bool assign)
  1902	{
  1903		struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
  1904		union l3_qos_abmc_cfg abmc_cfg = { 0 };
> 1905		struct arch_mbm_state *arch_mbm;
  1906	
  1907		abmc_cfg.split.cfg_en = 1;
  1908		abmc_cfg.split.cntr_en = assign ? 1 : 0;
  1909		abmc_cfg.split.cntr_id = cntr_id;
  1910		abmc_cfg.split.bw_src = rmid;
  1911	
  1912		/* Update the event configuration from the domain */
  1913		if (evtid == QOS_L3_MBM_TOTAL_EVENT_ID) {
  1914			abmc_cfg.split.bw_type = hw_dom->mbm_total_cfg;
  1915			arch_mbm = &hw_dom->arch_mbm_total[rmid];
  1916		} else {
  1917			abmc_cfg.split.bw_type = hw_dom->mbm_local_cfg;
  1918			arch_mbm = &hw_dom->arch_mbm_local[rmid];
  1919		}
  1920	
  1921		smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd,
  1922				      &abmc_cfg, 1);
  1923	
  1924		return 0;
  1925	}
  1926	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

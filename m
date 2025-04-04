Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D358E19F416
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777034; cv=none; b=B/OMYxeraRew5L7yWJstCnpHS3M1fGzCg+oZ+GqL42z9G8QFCSS/LUFaofw4BNa4VpuruNg/z8ACEFOdlOCB9FsUeqaelI/iNx13SE2zmXxOIOiPX7IlHa/ARHxyg6iElk8WMlIl0nJdoEbW09eRFvL0GiA/HGFRFJ4guV1tl+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777034; c=relaxed/simple;
	bh=nA18enxiOpKOMlfTBmAB61rTM2MzTHVX2PVYZeEFRMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVh2f3Zpks/eq2iswnd85/3wxZ6R+ibWTdi1UbC20o0qudgu9jxPOdoOfnN7EyJEXjAdVsnGJoXbKmOC448YadLTl7D4QKOtIib53qj9qd/I4x10G34esFHaXC9bpR1FVKXgOhJDVz9ciVOg9+TwV4kv/N+lxCaWdlXjE3CD9nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIVMM8rs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIVMM8rs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743777032; x=1775313032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nA18enxiOpKOMlfTBmAB61rTM2MzTHVX2PVYZeEFRMI=;
  b=RIVMM8rsHyfFqGs2ft2OBe4vIKiNK0KwnsRa5TkYIxkZCDS8TQM6cQ2O
   SdXpKcYbHRBz0alcdWSZ1Rb8maEMbe0Wuv2a9nBnhLXPfGrL+2iwdUnKj
   1pr9CWuahBmZxfHMSQl8v7pSCNJ4qpdvAeKcvkoml6G+nZ8sR6nxBR0Q1
   PcswxNF7K+yxcIIAJy5ERvv+GcIlzPP2LtfLtxjxQPkY7te5acXRCaABc
   Li+25FHQjkFqmxcVJ67sPIZ2+eS15n2oIn86VH+DG/nG/igZ0sjGRxJPc
   ND7YxN4I5Lp76jMVSwQsRHfhNRhLQjPTgDfBBb0pv0vZ5gPM0HoKDdfXo
   g==;
X-CSE-ConnectionGUID: 8C2iJpRaQCGncQcaq4X8Xg==
X-CSE-MsgGUID: zfdVBdUNQBCebZR8BJ8Y2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="56584699"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="56584699"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 07:30:30 -0700
X-CSE-ConnectionGUID: pM+UG7G9QX2kEEIG6K+23A==
X-CSE-MsgGUID: qpIy+gfoS/izeTsFIT6pGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127845623"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Apr 2025 07:30:29 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0i3v-0001IF-0N;
	Fri, 04 Apr 2025 14:30:27 +0000
Date: Fri, 4 Apr 2025 22:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next PATCH 03/13] net: pcs: Add subsystem
Message-ID: <202504042242.11oJSS49-lkp@intel.com>
References: <20250403181907.1947517-4-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403181907.1947517-4-sean.anderson@linux.dev>

Hi Sean,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-net-Add-binding-for-Xilinx-PCS/20250404-023209
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250403181907.1947517-4-sean.anderson%40linux.dev
patch subject: [RFC net-next PATCH 03/13] net: pcs: Add subsystem
config: loongarch-randconfig-001-20250404 (https://download.01.org/0day-ci/archive/20250404/202504042242.11oJSS49-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504042242.11oJSS49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504042242.11oJSS49-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/pcs/core.c: In function 'pcs_unregister':
>> drivers/net/pcs/core.c:373:29: warning: variable 'wrapped' set but not used [-Wunused-but-set-variable]
     373 |         struct phylink_pcs *wrapped;
         |                             ^~~~~~~


vim +/wrapped +373 drivers/net/pcs/core.c

   365	
   366	/**
   367	 * pcs_unregister() - unregister a PCS
   368	 * @pcs: a PCS previously registered with pcs_register()
   369	 */
   370	void pcs_unregister(struct phylink_pcs *pcs)
   371	{
   372		struct pcs_wrapper *wrapper;
 > 373		struct phylink_pcs *wrapped;
   374	
   375		mutex_lock(&pcs_mutex);
   376		list_for_each_entry(wrapper, &pcs_wrappers, list) {
   377			if (wrapper->wrapped == pcs)
   378				goto found;
   379		}
   380	
   381		mutex_unlock(&pcs_mutex);
   382		WARN(1, "trying to unregister an already-unregistered PCS\n");
   383		return;
   384	
   385	found:
   386		list_del(&wrapper->list);
   387		wrapped = rcu_replace_pointer(wrapper->wrapped, NULL, true);
   388		mutex_unlock(&pcs_mutex);
   389		synchronize_srcu(&wrapper->ssp);
   390	
   391		if (!wrapper->pcs.poll)
   392			phylink_pcs_change(&wrapper->pcs, false);
   393		if (refcount_dec_and_test(&wrapper->refcnt))
   394			pcs_destroy(wrapper);
   395	}
   396	EXPORT_SYMBOL_GPL(pcs_unregister);
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26BDAD48
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 18:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717264980; cv=none; b=HLg0xn8NfrjwZUMQI1tQcTojy88iU1WLJq8lNMqbgmJxmlrHprUEhmi/o6Jux8CtzTyf4GrYTanGO3ufvi9KkQxvCIRA4wc9UMYrrRzbsmZTlqFoZjuyGd24QjxRyMd0c/9bouETjiEH92DnbIHpxTFUTEQwovE791i6KLLJYYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717264980; c=relaxed/simple;
	bh=fV3WOjQ44pVZRUnh8dPKMA4wUTSUQ3lNZkOUvM9O+H0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wt/jAwP1DpODLeExvsJlaQ13dqzotPpMHMjnSHQj50/bo+eF/o4Xs2qHcz36gHnwoVPvMMbghutl7byAvdP+vMnOnSmn9Aj+g2/j7HD/MaTHYAQgQAZj5u+q3kJ+MRITT9CyrPd5x0uUpY2KWGiVPHtTwctUPmR47kAZNIGrdTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhp4fmOI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhp4fmOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717264977; x=1748800977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fV3WOjQ44pVZRUnh8dPKMA4wUTSUQ3lNZkOUvM9O+H0=;
  b=mhp4fmOItVmgii6kB2x2R5Xn1vxVp6cHrWoqwqjyT2w4JNM+G5fcT9d2
   KuHI0qg50WqNFwshSTnIXa2ANN2OwOxjHuL702uctJqVcYfJ7t6JMBoFL
   xJTOkgQ8r0uU+D+qh+bwwgj1bbZZVXh+YgG/lN9T52/HwEXDSTd6fVj6S
   rjIG+O+jSMo+UddR1zKG/n2QcEgLSLKSbGnrFdipsX1YzcMna1HIGepnF
   vXb95Wzq9ZUahme0+Njy1EwiuPglhMs7mGFMPCHqe++9l0HOwGf/Mm9zn
   lOuyucZ+0K0xxaDYjKWZWLysSSEMkP2k/JAGfg67FBdUKPQDH7c68LPxb
   g==;
X-CSE-ConnectionGUID: Z62LXvDUSMmmO0HNa+E4aw==
X-CSE-MsgGUID: f7YyDELkR8SbTR9wKrjO0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="36329102"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="36329102"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 11:02:57 -0700
X-CSE-ConnectionGUID: B2/yWcJwSC2Gc/QulEzUHw==
X-CSE-MsgGUID: 0B8d4mNnTvePy9GGdgqmDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="41551085"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Jun 2024 11:02:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDT2L-000JCf-2n;
	Sat, 01 Jun 2024 18:01:34 +0000
Date: Sun, 2 Jun 2024 01:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.9.y 74/97] ld.lld: error: undefined
 symbol: servreg_get_domain_list_resp_ei
Message-ID: <202406020140.Q1WMMR6U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.9.y
head:   4ad79d624a0a64db0b59f60b4c2225c8a5b92f96
commit: a8dd7819b94e5810d53b815cf3984d70b4b9ca21 [74/97] soc: qcom: add pd-mapper implementation
config: arm64-randconfig-002-20240601 (https://download.01.org/0day-ci/archive/20240602/202406020140.Q1WMMR6U-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406020140.Q1WMMR6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406020140.Q1WMMR6U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: servreg_get_domain_list_resp_ei
   >>> referenced by qcom_pd_mapper.c
   >>>               drivers/soc/qcom/qcom_pd_mapper.o:(qcom_pdm_get_domain_list) in archive vmlinux.a
   >>> referenced by qcom_pd_mapper.c
   >>>               drivers/soc/qcom/qcom_pd_mapper.o:(qcom_pdm_get_domain_list) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: servreg_loc_pfr_resp_ei
   >>> referenced by qcom_pd_mapper.c
   >>>               drivers/soc/qcom/qcom_pd_mapper.o:(qcom_pdm_pfr) in archive vmlinux.a
   >>> referenced by qcom_pd_mapper.c
   >>>               drivers/soc/qcom/qcom_pd_mapper.o:(qcom_pdm_pfr) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: servreg_get_domain_list_req_ei
   >>> referenced by qcom_pd_mapper.c
   >>>               drivers/soc/qcom/qcom_pd_mapper.o:(qcom_pdm_msg_handlers) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: servreg_loc_pfr_req_ei
   >>> referenced by qcom_pd_mapper.c
   >>>               drivers/soc/qcom/qcom_pd_mapper.o:(qcom_pdm_msg_handlers) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

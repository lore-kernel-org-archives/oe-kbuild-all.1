Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD561537D4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 05:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724824484; cv=none; b=MaPIqgbSH8d7noR1CxCP51i65ixZo/zCqRbCAZnDolwUhHPeS55JTzH9JvKVErH9NF/5BFZUIXfuN7NXB8XzhFiY6wdzKWvdWQOhftRX552gEqcOU6BjnXhoNK7XeQ5wPvtDbmTBEV9VJl4GeLkEV1nmVGzJhf0GNvoN8P822S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724824484; c=relaxed/simple;
	bh=xaNzJoXrB1gmM+sv4uy1FpZU8Jv0U62+RfbDSW0iPiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fmn7bheesTnrb5YQoHG6sICKJLkk9ZnJqcWfTNHsWaS8/tSDXZmX9F26SASg9j4aB2EZFAP9c3MFuoT+m3VW8ZUG72bj0sbdDXkR59I2f+EqdNR24vznzX+uJO8E9mH6CTlwPKj/HTPc4ObI7V0N8wKDKNFJlxDjy2Jr+u11kDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtvyvQgQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtvyvQgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724824483; x=1756360483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xaNzJoXrB1gmM+sv4uy1FpZU8Jv0U62+RfbDSW0iPiU=;
  b=dtvyvQgQPyu7WPqKuRmggvvTUBFzhnQawQchDTj6DtoyTMWDNZ/pdxW8
   5dPyhwrqxxwPO2crOObMdv6ZwEbTI1HgG9gkVCX333OFztx3+kzd353nh
   hWHsS4zwdbLW5VdedtGMfQe6e/imW8z99MErshpU5Eh8F6MTIiFPhiN1O
   qMuOFOVZhDc1fnux9FIG2S+iIBC+3yyswbk9IC4UjNNY01atIUeRV/Vaa
   zjdnEuXYKTGEQZfIMTBOpAKkZ1Qp8Wdae4K7KJ9bA+wKAZO9WoaQYO/qV
   06KTox7TRaViL5ppdVIcVeAEICjCKifzR84UnjiG3t24I/vHPrqnSrWep
   w==;
X-CSE-ConnectionGUID: 66baGzfAQqifCJqHs5WZ4A==
X-CSE-MsgGUID: UAaX70HBS6ufcj7zLOnK0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23514137"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="23514137"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 22:54:41 -0700
X-CSE-ConnectionGUID: EIpuDcwzSPOTS2nvS1E8Gg==
X-CSE-MsgGUID: Mo0TO9X2SkGST42WrROpcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63815362"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Aug 2024 22:54:40 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjBdd-000KWm-32;
	Wed, 28 Aug 2024 05:54:37 +0000
Date: Wed, 28 Aug 2024 13:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7193/13757] mm/page_alloc.c:4110:9: error:
 implicit declaration of function 'dynamic_pool_should_alloc' is invalid in
 C99
Message-ID: <202408281316.tzOrTedV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e59105d1ac962dacde2b6480857e834f97ca108e
commit: fd855715f24e3eeadaa56de5fde21c55a14aeea0 [7193/13757] mm/mem_reliable: Fallback to dpool if reliable memory is not enough
config: arm64-randconfig-003-20240827 (https://download.01.org/0day-ci/archive/20240828/202408281316.tzOrTedV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281316.tzOrTedV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281316.tzOrTedV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:4110:9: error: implicit declaration of function 'dynamic_pool_should_alloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
                  ^
   1 error generated.


vim +/dynamic_pool_should_alloc +4110 mm/page_alloc.c

  4101	
  4102	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4103	{
  4104		if (!reliable_allow_fb_enabled())
  4105			return false;
  4106	
  4107		if (!(gfp_mask & GFP_RELIABLE))
  4108			return false;
  4109	
> 4110		return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
  4111	}
  4112	#else
  4113	static inline struct zone *mem_reliable_fallback_zone(gfp_t gfp_mask,
  4114							      struct alloc_context *ac)
  4115	{
  4116		return NULL;
  4117	}
  4118	static inline void mem_reliable_fallback_slowpath(gfp_t gfp_mask,
  4119							  struct alloc_context *ac) {}
  4120	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4121	{
  4122		return false;
  4123	}
  4124	#endif
  4125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

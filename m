Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E72518E1A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jun 2025 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750584811; cv=none; b=Y0U5i6G3E+goF4BLWsdZaVrjUIhmONT+l3eYg+JpYzXrerhWs5UCfUEUgI718cXvS9d11/wnxW7lmWidzxrJlIClYwP2ysGK8RpICfnVUkee2mIasZ3bgb/DKZ+pEjnzkck3yzeI7ZPfgzfcuGlHHj/h4Ih4ZLvJps7xYmNaW9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750584811; c=relaxed/simple;
	bh=zQfC+fdK7U5XlxnnIJlvIIYeHM463in994PMqfl5Egs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U+KwO4i7p7gKlvDW214ZdU9qk91g4xEAbHvwQcTj6q+A3aGz1CNRHS/KAwi9rFGrNKtNyFnwIaCDe07HkzesckJb8Oz1CV3A5mo4eAa9OhTqoF/O4PCvNljaGHhVzzMrdpPdFXKthVl3a48NvzjKFd8tuX/qWEk9kL0VBzCTRIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpX6FQec; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpX6FQec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750584809; x=1782120809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zQfC+fdK7U5XlxnnIJlvIIYeHM463in994PMqfl5Egs=;
  b=bpX6FQecMewXVc4LruG+cs5UC7kOHhDRnANtAu41nvwAOLAFcUvS7Vd8
   OrBxOTHaa305EdM0rxHNHqq0XelyHPhRhGiQnIC6dPc60PekcHmzBnEK1
   GW6d6Qu+stZf66qorfUZtlE6mPcz+q9U3XdV8Hbxis1YS9GWcyVoX1yxh
   SBm3jXVIu0SpkPm3ah7ppw4Ei5dQBifC/u8FK6VGOS4GxzeCksw3YT0ri
   iW7OPsGDfAbTwoiidM4B3Z2JHcJyP0nxmpOJVwL2py4QZKqF79N9h9W9A
   lVFT+C2266muOSdMo6XKD6ylYQIcSiCBjnvYijhHjYhCxlzOQ+qn44Rq+
   A==;
X-CSE-ConnectionGUID: hANzNKHWSu+vB/7Zy50aAA==
X-CSE-MsgGUID: zunEhUJfRVmNAeUKop05nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52671229"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="52671229"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 02:33:28 -0700
X-CSE-ConnectionGUID: 7QfIFJMGTaqHCqlHgTq5bw==
X-CSE-MsgGUID: k3a7a7fEQr2hhYGjtYhCRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="156810983"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2025 02:33:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTH4n-000NBK-0L;
	Sun, 22 Jun 2025 09:33:25 +0000
Date: Sun, 22 Jun 2025 17:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1]
 net/netfilter/nf_tables_api.c:1678:6: warning: no previous prototype for
 'nf_tables_chain_destroy'
Message-ID: <202506221730.BqBCuqFu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   14b655c6b6487670ee48bc9b760aefb4412b0f78
commit: 791332ecb5f9e90c412e6c37819772b7bb86a97a [1/1] netfilter: nf_tables: pass nft_chain to destroy function, not nft_ctx
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250622/202506221730.BqBCuqFu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221730.BqBCuqFu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506221730.BqBCuqFu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/nf_tables_api.c: In function 'nft_request_module':
   net/netfilter/nf_tables_api.c:621:9: warning: function 'nft_request_module' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     621 |         ret = vsnprintf(module_name, MODULE_NAME_LEN, fmt, args);
         |         ^~~
   net/netfilter/nf_tables_api.c: At top level:
>> net/netfilter/nf_tables_api.c:1678:6: warning: no previous prototype for 'nf_tables_chain_destroy' [-Wmissing-prototypes]
    1678 | void nf_tables_chain_destroy(struct nft_chain *chain)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/nf_tables_chain_destroy +1678 net/netfilter/nf_tables_api.c

  1677	
> 1678	void nf_tables_chain_destroy(struct nft_chain *chain)
  1679	{
  1680		if (WARN_ON(chain->use > 0))
  1681			return;
  1682	
  1683		/* no concurrent access possible anymore */
  1684		nf_tables_chain_free_chain_rules(chain);
  1685	
  1686		if (nft_is_base_chain(chain)) {
  1687			struct nft_base_chain *basechain = nft_base_chain(chain);
  1688	
  1689			module_put(basechain->type->owner);
  1690			if (rcu_access_pointer(basechain->stats)) {
  1691				static_branch_dec(&nft_counters_enabled);
  1692				free_percpu(rcu_dereference_raw(basechain->stats));
  1693			}
  1694			kfree(chain->name);
  1695			kfree(basechain);
  1696		} else {
  1697			kfree(chain->name);
  1698			kfree(chain);
  1699		}
  1700	}
  1701	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

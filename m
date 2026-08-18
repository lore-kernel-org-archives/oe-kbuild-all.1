Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21AD23E35F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 01:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787015378; cv=none; b=RtJPsUbeYpIJKK2smj5rhbivYEoOJS2cEkC4gAiokf32gtkG/mYdXZLro/OnjN6E32zMM5pc+NdrI/MooTkFXMBAzABo+qI6r+ZtErMKNIXXNJLi2YYvpsb9oWbjmFpYHaqQ69WDKaL0JfR56+G3S95i0s9DdnEgqzNi90V2fNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787015378; c=relaxed/simple;
	bh=9GXwisV+kIhO0+aWcGhJaEistPn8N4+cmu8UdEGG5ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g5b6ibup3I7qvBMsmFI76DoEr3TDWWersIQFm2/swXi4SCctXgKfTl+Xg8yhugHGenQS7BpfpdeGeVyf5l/f6G+TEsrPlDXhEaWF8QHMiv1bUW8koul+IYPxfU1PWX4uYNZeGIX9VfNmb6iZ2dZkS+n0PWXTnMKFIa3kcgGHWKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csnWrtOc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csnWrtOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787015376; x=1818551376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9GXwisV+kIhO0+aWcGhJaEistPn8N4+cmu8UdEGG5ng=;
  b=csnWrtOcw6jnNajhrczCf7JUCyuwV4icosyf3/MbxyulabQ9BXzgQqcq
   9frKtQ/+DKwFcRHmwJQmf09Bqrm+JDyDu/K8bwJbCIgHiEw4eiZYZqNH1
   0bzLNmTDwB7tzI7mDN+L4HUIe/dO7quxZqD1ranUy05n/pajByB3Rk9QI
   ALsOCRezA/1RCUIPYW4rlPCsYw+Snq58tpFN9V5+EYgB+kNSBMJXoujPc
   hET0zl+rQGlcVijAXCNETbhH71tXuvVi6nejybXkPxKQ5kswUsA4dyShp
   AkED52M/YgAgsoecLvECvUlBXobAJUaSIvI9xjRtJbuU66ltNaTjCvVVt
   w==;
X-CSE-ConnectionGUID: Rpy4zbZWQdqoijkfcUvPtQ==
X-CSE-MsgGUID: xgLwDuw1S8ei/w1HBocYoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87564620"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87564620"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 18:09:36 -0700
X-CSE-ConnectionGUID: mmAMvk69ROCLNjG7Z1Aeqg==
X-CSE-MsgGUID: 0Pq2n9ZHSlGoMQrsfEWRIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="270290733"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Aug 2026 18:09:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww8KZ-00000000e0E-0Xfp;
	Tue, 18 Aug 2026 01:09:31 +0000
Date: Tue, 18 Aug 2026 09:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 5/21]
 net/netfilter/nf_tables_api.c:12172:35: error: passing argument 3 of
 'folio_scratchpad_init_key' from incompatible pointer type
Message-ID: <202608180716.aq19LiWM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git folio-pool-v2-lockdep
head:   e77ee8289ea0755b0ee299348504d4568f942d71
commit: 73ef69b58c7d39a45a6fdbd29d4767eedda7ff41 [5/21] netfilter/nf_tables: Add folio_scratchpad collector to struct nftables_pernet
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260818/202608180716.aq19LiWM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608180716.aq19LiWM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608180716.aq19LiWM-lkp@intel.com/

Note: the jimc/folio-pool-v2-lockdep HEAD e77ee8289ea0755b0ee299348504d4568f942d71 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   net/netfilter/nf_tables_api.c: In function 'nf_tables_init_net':
>> net/netfilter/nf_tables_api.c:12172:35: error: passing argument 3 of 'folio_scratchpad_init_key' from incompatible pointer type [-Wincompatible-pointer-types]
   12172 |                                   &nft_trans_scratchpad_key);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   struct static_key_true *
   In file included from include/net/netfilter/nf_tables.h:1944,
                    from include/net/netfilter/nf_tables_core.h:5,
                    from net/netfilter/nf_tables_api.c:21:
   include/linux/folio_pool.h:104:51: note: expected 'struct static_key *' but argument is of type 'struct static_key_true *'
     104 |                                struct static_key *key);
         |                                ~~~~~~~~~~~~~~~~~~~^~~


vim +/folio_scratchpad_init_key +12172 net/netfilter/nf_tables_api.c

 12159	
 12160	static int __net_init nf_tables_init_net(struct net *net)
 12161	{
 12162		struct nftables_pernet *nft_net = nft_pernet(net);
 12163	
 12164		INIT_LIST_HEAD(&nft_net->tables);
 12165		INIT_LIST_HEAD(&nft_net->commit_list);
 12166		INIT_LIST_HEAD(&nft_net->destroy_list);
 12167		INIT_LIST_HEAD(&nft_net->commit_set_list);
 12168		INIT_LIST_HEAD(&nft_net->binding_list);
 12169		INIT_LIST_HEAD(&nft_net->module_list);
 12170		INIT_LIST_HEAD(&nft_net->notify_list);
 12171		folio_scratchpad_init_key(&nft_net->trans_scratchpad, get_order(SZ_64K),
 12172					  &nft_trans_scratchpad_key);
 12173		mutex_init(&nft_net->commit_mutex);
 12174		net->nft.base_seq = 1;
 12175		nft_net->gc_seq = 0;
 12176		nft_net->validate_state = NFT_VALIDATE_SKIP;
 12177		INIT_WORK(&nft_net->destroy_work, nf_tables_trans_destroy_work);
 12178	
 12179		return 0;
 12180	}
 12181	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA9D385D73
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 06:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786776122; cv=none; b=F4LgsLtfKwwK+5QW2iuaB5nzhV6077Zjpwhpl5eK5msQYO9vmMxybgpPRb9Je6opmPGC6fD3nJIOvWz4NF75T4Fkf5QxahrFsPgbuPiRlOCGvtDXlLRmOiF0x+AOtyqgntBXGBuFCeiKD0pTh0WGzie6R0wkxr85mzW3SkY6jRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786776122; c=relaxed/simple;
	bh=4ShaXgDDN/3L2AEKbsJQBPm6JlwLH0+3siMLXXiHOXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CXT7hRK1yucI//r9duzKdai971c+ZQeL7HVGirHTP6CdMn5v6tRVWLqVbzM/I3f2Qjxe3n/f56LngdgrmVCAGFba8CEQbcRRRrb6/QQvE6ch0dGgawH6KvaeKb0Ftj59lAwsD9v7nwUKejd0zZJN71G7AKp4Of+uN9lDAokduZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LI3CV06R; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LI3CV06R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786776120; x=1818312120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ShaXgDDN/3L2AEKbsJQBPm6JlwLH0+3siMLXXiHOXY=;
  b=LI3CV06RRq+UySjmfeGacTf7oSaZSKVzWhaIHBFrAc4bR2msdH9HO7ES
   DTgQEQUUL2M+It4VTddx8C85ykDwU8B0ub4b4vtrapRbMJtKmY25W50N/
   HcX1qyABHqLvAAhf2neut8N3ldz/2fmirxAzbo33+7ga+RyHOVlHLcZtW
   6sNHZQgxc8bqvqiKzTLTHcSORJUdTGLs3eeiyabOR+szgZExku1JNTe7V
   Blcw+/B9fA6QnAnLbOGdJzXoXFWU8lYjgNBabc9A6Zr+ywPKks1afaFEL
   SDWVbydC9RPK3lryljZWlkV8NdPliZ7dwGkCHctnhgnchehz6jREhSuHO
   g==;
X-CSE-ConnectionGUID: TnLXkU11SJGTQgKhQ8WzHQ==
X-CSE-MsgGUID: bdvOGvRZSOW8+BXuu2pVzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="91156692"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="91156692"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 23:41:59 -0700
X-CSE-ConnectionGUID: UI+xzYVETlWtg5VPRXV7Zg==
X-CSE-MsgGUID: yMSwCedzT4aKGTOl0B7o2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="258197265"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 14 Aug 2026 23:41:57 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv85b-000000006Nx-3Wt4;
	Sat, 15 Aug 2026 06:41:55 +0000
Date: Sat, 15 Aug 2026 08:41:46 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:m-4 143/145] net/netfilter/nf_tables_api.c:182:48:
 error: 'struct folio_arena' has no member named 'chunk_order'
Message-ID: <202608150840.IVAh8lZW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git m-4
head:   0036927f87d51d733bf100cae4e407fa21a2c3a6
commit: 42d80a3bc4214d8c2da60cf229926307ce4d78a4 [143/145] include/linux/folio_arena.h: Add !CONFIG_DYNAMIC_DEBUG_CORE stubs
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260815/202608150840.IVAh8lZW-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150840.IVAh8lZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150840.IVAh8lZW-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/netfilter/nf_tables_api.c: In function 'nft_trans_alloc':
>> net/netfilter/nf_tables_api.c:182:48: error: 'struct folio_arena' has no member named 'chunk_order'
     182 |         if (size <= 256 && nft_net->trans_arena.chunk_order)
         |                                                ^


vim +182 net/netfilter/nf_tables_api.c

7c95f6d866d861 Pablo Neira Ayuso 2014-04-04  175  
3d95a2e016abab Florian Westphal  2025-08-22  176  static struct nft_trans *nft_trans_alloc(const struct nft_ctx *ctx,
3d95a2e016abab Florian Westphal  2025-08-22  177  					 int msg_type, u32 size)
1081d11b086afb Pablo Neira Ayuso 2014-04-04  178  {
34305410158649 Jim Cromie        2026-08-11  179  	struct nftables_pernet *nft_net = nft_pernet(ctx->net);
1081d11b086afb Pablo Neira Ayuso 2014-04-04  180  	struct nft_trans *trans;
1081d11b086afb Pablo Neira Ayuso 2014-04-04  181  
34305410158649 Jim Cromie        2026-08-11 @182  	if (size <= 256 && nft_net->trans_arena.chunk_order)
34305410158649 Jim Cromie        2026-08-11  183  		trans = folio_arena_alloc(&nft_net->trans_arena, GFP_KERNEL);
34305410158649 Jim Cromie        2026-08-11  184  	else
3d95a2e016abab Florian Westphal  2025-08-22  185  		trans = kzalloc(size, GFP_KERNEL);
34305410158649 Jim Cromie        2026-08-11  186  
1081d11b086afb Pablo Neira Ayuso 2014-04-04  187  	if (trans == NULL)
1081d11b086afb Pablo Neira Ayuso 2014-04-04  188  		return NULL;
1081d11b086afb Pablo Neira Ayuso 2014-04-04  189  
580077855a4074 Florian Westphal  2022-08-09  190  	INIT_LIST_HEAD(&trans->list);
b380e5c733b9f1 Pablo Neira Ayuso 2014-04-04  191  	trans->msg_type = msg_type;
e169285f8c56b8 Florian Westphal  2024-05-13  192  
e169285f8c56b8 Florian Westphal  2024-05-13  193  	trans->net = ctx->net;
e169285f8c56b8 Florian Westphal  2024-05-13  194  	trans->table = ctx->table;
e169285f8c56b8 Florian Westphal  2024-05-13  195  	trans->seq = ctx->seq;
e169285f8c56b8 Florian Westphal  2024-05-13  196  	trans->flags = ctx->flags;
e169285f8c56b8 Florian Westphal  2024-05-13  197  	trans->report = ctx->report;
1081d11b086afb Pablo Neira Ayuso 2014-04-04  198  
1081d11b086afb Pablo Neira Ayuso 2014-04-04  199  	return trans;
1081d11b086afb Pablo Neira Ayuso 2014-04-04  200  }
1081d11b086afb Pablo Neira Ayuso 2014-04-04  201  

:::::: The code at line 182 was first introduced by commit
:::::: 34305410158649e65af1141e9e2d2678bb376807 netfilter/nf_tables: Add folio_arena collector to struct nftables_pernet

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

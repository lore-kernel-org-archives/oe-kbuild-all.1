Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67972E736E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 05:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032007; cv=none; b=Ag3Vk9wl+qlonUZ20M/3LsD0nhvyhegpaLIelbkpu/SImuvXr8y9l3zSysZSfT+ypDTCMQKCAK5CW77UEI8GcxXCAqkBHC/S6Y2OT+walrNuxFpZC9g9RUtcBBxYsZXAcIgPHlXrh8bS9BiO/Jddfaj5+vkZinBosiKb5B7r5l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032007; c=relaxed/simple;
	bh=Ru0pUk8KybU5EFwGf7oXyMKzu0NQzqiWu3K3pBSs1ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AlBdyg2chz7o8bYqAHK+/cBzAp/DRWf0PgPais/PtNad3tVAtJWfMKT4WbK7m57omQyozjHs1wGC9bM/fNvEwOMUR5dTGrtCygsHURhjNJBpIEY4MHYBoj0VdlRqfiW2/x9t1PsYBjyaWPy9D+3Jj5bRjGKiSKjM+eOQK7diY10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BULvrY2T; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BULvrY2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787032006; x=1818568006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ru0pUk8KybU5EFwGf7oXyMKzu0NQzqiWu3K3pBSs1ck=;
  b=BULvrY2TkeEebI/P2himdyGKNespg7JzSJknyF6JI6I+TWoMxv52H7rC
   p1V980xkMaEMc/D5UwgrLeGlMqbkZFkcR0zYwYHoTcrAbQQC+Kv63KQn9
   OP4yycloGAIQ/v4qfm6MT8vnIAJSwJo2ES5K30XXznsmQRkLHYfwvm/W1
   rUh0nGG469X4cmGKSprgEnRbBktyR+cGNYO2tI6MCGDnqKkPIV10zu9hZ
   E/9fmh+Do4n0yzh6gqL7zcMZX6U3WR0E6xyR/5pKz5AbVCnDsgb5jdweb
   YCogJxx2qjaE5Ia1sxduTbO+0YtNRAxuG97qjZeXPmbXFruFT56QrUsR5
   g==;
X-CSE-ConnectionGUID: TiaZPRXFRdCccaRybVId5g==
X-CSE-MsgGUID: yPYO0fzCQRm01OSoOWNblg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87635914"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87635914"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 22:46:45 -0700
X-CSE-ConnectionGUID: 1aAXXICtRdCLtn7mgB/Exg==
X-CSE-MsgGUID: KCHE0wYJR0iXy2yluNj+Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263799455"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Aug 2026 22:46:43 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwCen-00000000e8k-29mD;
	Tue, 18 Aug 2026 05:46:41 +0000
Date: Tue, 18 Aug 2026 13:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 5/21]
 net/netfilter/nf_tables_api.c:12172:7: error: incompatible pointer types
 passing 'struct static_key_true *' to parameter of type 'struct static_key *'
Message-ID: <202608181341.KdUerT0X-lkp@intel.com>
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
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260818/202608181341.KdUerT0X-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181341.KdUerT0X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181341.KdUerT0X-lkp@intel.com/

Note: the jimc/folio-pool-v2-lockdep HEAD e77ee8289ea0755b0ee299348504d4568f942d71 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> net/netfilter/nf_tables_api.c:12172:7: error: incompatible pointer types passing 'struct static_key_true *' to parameter of type 'struct static_key *' [-Wincompatible-pointer-types]
    12172 |                                   &nft_trans_scratchpad_key);
          |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/folio_pool.h:104:30: note: passing argument to parameter 'key' here
     104 |                                struct static_key *key);
         |                                                   ^
   1 error generated.


vim +12172 net/netfilter/nf_tables_api.c

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

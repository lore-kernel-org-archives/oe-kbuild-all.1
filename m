Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2812299A82
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 22:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787179459; cv=none; b=fwgqaJDIx20MLb9r4vif6x82HxV3VKPlhszZiTx5fVkSwBPiQpaxdx60cW02acFgvY+QdLQDRPS6evlQaTNG+TaNbrTGnCtt7D9qAHMe9JGWib4b5PGIZjttBD04nsa9VXTm66OcahQH9z+NWTxUdIEVSNm0ucloPx6wmssECRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787179459; c=relaxed/simple;
	bh=wdQmMrULY+d/HIptFc+u0rpXeAztTd6sXjBz+r1GoWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QJSa9dg8cx2XW0qYWtJUmK4HFEb8Gfg2QRrnl9ALD/zgO/oMUiQZ8+ZnVFWCua3vfCvIzYqtkCTYnfpwD0TyyZS8i6RAh3vMBmmbdWcWLWYYPjTNiVPS7b0ONMRuY1NwmTs21ebTBW5ewD+HQ+owu+E9+x9NhXARB2GGCjSTSbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBnV39LH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBnV39LH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787179458; x=1818715458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wdQmMrULY+d/HIptFc+u0rpXeAztTd6sXjBz+r1GoWk=;
  b=kBnV39LH3wT/dPoqTm5+Nb5ZsFDlV8yeK1k+J7QwtuO4lnR4p+OCp+wK
   z76tv54/waCCvlTWAAVJSmFLm7lLvQgGnDguSY0eVDMbq+bVmXa1n6I2B
   BPjMxsXJQjwkLsb4SnhuH+Aaz4tix9g96E0S8Rp2/VSQKCPt7Lk2TY50J
   1uzhBWyp8ysCQh0N48+kBb5iCRSy+DnVjvPhb8MqyXvR/fGyad6SyDRqj
   NClqMbc55Yby1GVmMvs5ya/wNd3AJwI88jb+S97jFtv8LphzcdQ83pSz2
   3ghUUO0nYS212a3nVKehva4nVICBhN3H3UpX71yptaNNaGSh3YkryOwt4
   g==;
X-CSE-ConnectionGUID: FPEgKEJcTm2nnkBZeQRrUA==
X-CSE-MsgGUID: KH6k31hoRL+auX6VOB9b/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98300672"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="98300672"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 15:44:17 -0700
X-CSE-ConnectionGUID: zfjnjS7GQlWX+1RLYFs3eA==
X-CSE-MsgGUID: 6jUGp5I4TeitKzb/FBU4Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="261477260"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Aug 2026 15:44:15 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwp13-00000000gjN-0ax2;
	Wed, 19 Aug 2026 22:44:13 +0000
Date: Thu, 20 Aug 2026 06:43:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:m-5 13/146] net/netfilter/nf_tables_api.c:176:1:
 sparse: sparse: symbol 'nft_trans_scratchpad_key' was not declared. Should it
 be static?
Message-ID: <202608200848.EtlBCSHj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Jim,

First bad commit (maybe != root cause):

tree:   https://github.com/jimc/linux.git m-5
head:   f4586ca88dc640ffb7dea6725f1b347cd3c51bf9
commit: 1f87b3b4c4b26b883edad107c44f67ef290f0736 [13/146] lib/folio_pool: Add folio_scratchpad_discard and folio_scratchpad_trim primitives
config: x86_64-randconfig-r134-20260819 (https://download.01.org/0day-ci/archive/20260820/202608200848.EtlBCSHj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608200848.EtlBCSHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608200848.EtlBCSHj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/nf_tables_api.c:176:1: sparse: sparse: symbol 'nft_trans_scratchpad_key' was not declared. Should it be static?
   net/netfilter/nf_tables_api.c:2153:25: sparse: sparse: cast between address spaces (__percpu -> __rcu)
   net/netfilter/nf_tables_api.c:2153:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_tables_api.c:2153:25: sparse:    struct nft_stats [noderef] __rcu *
   net/netfilter/nf_tables_api.c:2153:25: sparse:    struct nft_stats [noderef] __percpu *
   net/netfilter/nf_tables_api.c:2356:17: sparse: sparse: cast between address spaces (__percpu -> __rcu)
   net/netfilter/nf_tables_api.c:2356:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_tables_api.c:2356:17: sparse:    struct nft_stats [noderef] __rcu *
   net/netfilter/nf_tables_api.c:2356:17: sparse:    struct nft_stats [noderef] __percpu *
   net/netfilter/nf_tables_api.c:2356:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_tables_api.c:2356:17: sparse:    struct nft_stats [noderef] __rcu *
   net/netfilter/nf_tables_api.c:2356:17: sparse:    struct nft_stats [noderef] __percpu *
   net/netfilter/nf_tables_api.c:2397:21: sparse: sparse: cast between address spaces (__percpu -> __rcu)
   net/netfilter/nf_tables_api.c:2397:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_tables_api.c:2397:21: sparse:    struct nft_stats [noderef] __rcu *
   net/netfilter/nf_tables_api.c:2397:21: sparse:    struct nft_stats [noderef] __percpu *
   net/netfilter/nf_tables_api.c:2806:25: sparse: sparse: cast between address spaces (__percpu -> __rcu)
   net/netfilter/nf_tables_api.c:2806:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_tables_api.c:2806:25: sparse:    struct nft_stats [noderef] __rcu *
   net/netfilter/nf_tables_api.c:2806:25: sparse:    struct nft_stats [noderef] __percpu *

vim +/nft_trans_scratchpad_key +176 net/netfilter/nf_tables_api.c

7c95f6d866d8612 Pablo Neira Ayuso 2014-04-04  175  
8617fdbcbac6d40 Jim Cromie        2026-08-14 @176  DEFINE_FOLIO_POOL_STATIC_KEY_PARAM(nft_trans_scratchpad_key, trans_scratchpad,
8617fdbcbac6d40 Jim Cromie        2026-08-14  177  				   "Toggle nf_tables transaction folio scratchpad allocator");
8617fdbcbac6d40 Jim Cromie        2026-08-14  178  

:::::: The code at line 176 was first introduced by commit
:::::: 8617fdbcbac6d400488b7c147ad71cffeb71d163 netfilter/nf_tables: Add folio_scratchpad collector to struct nftables_pernet

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

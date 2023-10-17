Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E24405F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQpU1ltR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697536216; x=1729072216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gzg9rUEDHrh0VKFSRCceyNAKOB+feljgYedDGoK0V6A=;
  b=GQpU1ltRS51dXbGLr72tcVneVoiNY1hOxCxLgK8L/l4eMDXK2Dpu087b
   X0QWXqo1fIBcl8VkPuLSbUhdMXdESFESXf+WYswSf/3AJXjW2j69xx0j1
   BOLPMIfR5pBSsc/fxNfIFxsOBsTPPEqM3W77et1ys3HRKAVidS226Om0E
   x30I/biK9wLH4xhfLq2Xh6n1FYHZD1Z2eMLlQWqZ93tNPwsinvr5im/WA
   e2xCk1nMK7vjOoBt0Dv0b78F0qLilug4qRkQXxF17GVR01DvHjkBcY/t7
   Afq29EZ7IlPgqqKc0UszwVkTQU0AgJolT6anI2zjb2mLEOn8MjfVfxsCs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452221545"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="452221545"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 02:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="872495229"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="872495229"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Oct 2023 02:50:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsgiJ-0009RH-37;
	Tue, 17 Oct 2023 09:50:11 +0000
Date: Tue, 17 Oct 2023 17:49:37 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH nf-next,RFC] netfilter: nf_tables: shrink memory
 consumption of set elements
Message-ID: <202310171720.CRpftrIM-lkp@intel.com>
References: <20231013160924.119273-1-pablo@netfilter.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013160924.119273-1-pablo@netfilter.org>

Hi Pablo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on netfilter-nf/main]
[also build test WARNING on next-20231017]
[cannot apply to linus/master v6.6-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/netfilter-nf_tables-shrink-memory-consumption-of-set-elements/20231017-123501
base:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20231013160924.119273-1-pablo%40netfilter.org
patch subject: [PATCH nf-next,RFC] netfilter: nf_tables: shrink memory consumption of set elements
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310171720.CRpftrIM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171720.CRpftrIM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171720.CRpftrIM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nft_set_pipapo.c:1740: warning: Function parameter or member 'elem_priv' not described in 'nft_pipapo_activate'
>> net/netfilter/nft_set_pipapo.c:1740: warning: Excess function parameter 'elem' description in 'nft_pipapo_activate'
>> net/netfilter/nft_set_pipapo.c:1946: warning: Function parameter or member 'elem_priv' not described in 'nft_pipapo_remove'
>> net/netfilter/nft_set_pipapo.c:1946: warning: Excess function parameter 'elem' description in 'nft_pipapo_remove'


vim +1740 net/netfilter/nft_set_pipapo.c

212ed75dc5fb9d Pablo Neira Ayuso 2023-06-07  1726  
3c4287f62044a9 Stefano Brivio    2020-01-22  1727  /**
3c4287f62044a9 Stefano Brivio    2020-01-22  1728   * nft_pipapo_activate() - Mark element reference as active given key, commit
3c4287f62044a9 Stefano Brivio    2020-01-22  1729   * @net:	Network namespace
3c4287f62044a9 Stefano Brivio    2020-01-22  1730   * @set:	nftables API set representation
3c4287f62044a9 Stefano Brivio    2020-01-22  1731   * @elem:	nftables API element representation containing key data
3c4287f62044a9 Stefano Brivio    2020-01-22  1732   *
3c4287f62044a9 Stefano Brivio    2020-01-22  1733   * On insertion, elements are added to a copy of the matching data currently
212ed75dc5fb9d Pablo Neira Ayuso 2023-06-07  1734   * in use for lookups, and not directly inserted into current lookup data. Both
3c4287f62044a9 Stefano Brivio    2020-01-22  1735   * nft_pipapo_insert() and nft_pipapo_activate() are called once for each
3c4287f62044a9 Stefano Brivio    2020-01-22  1736   * element, hence we can't purpose either one as a real commit operation.
3c4287f62044a9 Stefano Brivio    2020-01-22  1737   */
3c4287f62044a9 Stefano Brivio    2020-01-22  1738  static void nft_pipapo_activate(const struct net *net,
dfe8f3c1db12ef Pablo Neira Ayuso 2023-10-13  1739  				const struct nft_set *set, void *elem_priv)
3c4287f62044a9 Stefano Brivio    2020-01-22 @1740  {
dfe8f3c1db12ef Pablo Neira Ayuso 2023-10-13  1741  	struct nft_pipapo_elem *e = elem_priv;
3c4287f62044a9 Stefano Brivio    2020-01-22  1742  
3c4287f62044a9 Stefano Brivio    2020-01-22  1743  	nft_set_elem_change_active(net, set, &e->ext);
3c4287f62044a9 Stefano Brivio    2020-01-22  1744  }
3c4287f62044a9 Stefano Brivio    2020-01-22  1745  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

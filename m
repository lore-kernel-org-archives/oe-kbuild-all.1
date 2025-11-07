Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7871F4174
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762531552; cv=none; b=ucmW/+10hs4lzBj1Qy5xrrygyUK84hch3a4/O6D5esKb8pgrYuzoj0bUsKvWNkVnv5ZUqsZN0XlcUn1Gmwh8o0RT2i+M0YBTZfpZbs63LhHg0W0o3g4LcagBr4lOWRXggbAggFcTe829JTGBl6j4fqjaZQDDj/F5RQQ1RDQsCl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762531552; c=relaxed/simple;
	bh=knB9cF61D7uMJa5GIMZtSDYdbf6++NX7dj/4fy0r8mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxlIRCzgGGM6Yz1VUhyhR8V20Mg5f3gqT9zDIO9+5B+IEHJ0V+zPrK3V9RJ01dJ8AMGYl9OMSavYqoQUn7bEvPy0vb+LJIH0eok7Y+BOCfuENLr+NOw0YotFRjVnr218+Oi8Xoeua6FZCORKxiRM7EUlVBlEUUt8iQwcZTI+L6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1s1bRta; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1s1bRta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762531550; x=1794067550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=knB9cF61D7uMJa5GIMZtSDYdbf6++NX7dj/4fy0r8mQ=;
  b=a1s1bRta/V/FAUsapCisnq5wHWnhw88iS9BliCxIoPuiKDQGBwKQ5/D+
   TUKALvMTqQvEqROXIDoWmniI+Z3E/D5sUSGdlQaWx4JKtm8jrqDvHNIK4
   ku01cX3E7/YBVylLJJcpyNkEf2xlQCcBc06ZzMV2BvPteofpvD1SjxDzb
   Y+KTRmuYjhVSZ53cjDLtSao9ay6CsYAqgos/yfhaUxoUbSSki720OV/fS
   lCJPAt4evqOIlSrL8lvA3C1X8VU7t8r8xklSP7kvNJjRO1OdVwrzMamfx
   ZtMLDBOipJz1tzxpH+PK0mwbfvhd4H5j8i3cGM3d7W0P12LJ148T8Ypd5
   g==;
X-CSE-ConnectionGUID: v+oLzGBgSOaxUjVUND5nZA==
X-CSE-MsgGUID: V/g9PRhGQyGtVIvPd/+gCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="52248419"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="52248419"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 08:05:49 -0800
X-CSE-ConnectionGUID: 36x1esWQRxG84333DHdBPw==
X-CSE-MsgGUID: MobY9SzLTdO06WOv4a6axw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="188785066"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Nov 2025 08:05:48 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHOyA-00004J-1E;
	Fri, 07 Nov 2025 16:05:46 +0000
Date: Sat, 8 Nov 2025 00:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC nf-next 08/11] netfilter: conntrack: make nf_conntrack hash
 table pernet
Message-ID: <202511072353.gCeACgfc-lkp@intel.com>
References: <20251105164805.3992-9-fw@strlen.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105164805.3992-9-fw@strlen.de>

Hi Florian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251105]
[cannot apply to nf-next/master netfilter-nf/main linus/master horms-ipvs/master v6.18-rc4 v6.18-rc3 v6.18-rc2 v6.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/netfilter-netns-nf_conntrack-per-netns-net-netfilter-nf_conntrack_max-sysctl/20251106-014030
base:   next-20251105
patch link:    https://lore.kernel.org/r/20251105164805.3992-9-fw%40strlen.de
patch subject: [RFC nf-next 08/11] netfilter: conntrack: make nf_conntrack hash table pernet
config: s390-randconfig-001-20251107 (https://download.01.org/0day-ci/archive/20251107/202511072353.gCeACgfc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511072353.gCeACgfc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511072353.gCeACgfc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/netfilter/nf_conntrack_zones.h:6,
                    from net/openvswitch/flow.c:38:
   include/net/netfilter/nf_conntrack.h: In function 'nf_conntrack_get_ht':
   include/net/netfilter/nf_conntrack.h:363:12: error: 'struct net' has no member named 'ct'
      hsz = net->ct.nf_conntrack_htable_size;
               ^~
   include/net/netfilter/nf_conntrack.h:364:13: error: 'struct net' has no member named 'ct'
      hptr = net->ct.nf_conntrack_hash;
                ^~
   include/net/netfilter/nf_conntrack.h: In function 'nf_conntrack_max':
>> include/net/netfilter/nf_conntrack.h:397:1: warning: no return statement in function returning non-void [-Wreturn-type]
    }
    ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [m]:
   - REGULATOR_RT5133 [=m] && REGULATOR [=y] && I2C [=m] && GPIOLIB [=y] && OF [=y]


vim +397 include/net/netfilter/nf_conntrack.h

9fb9cbb1082d6b Yasuyuki Kozakai  2005-11-09  352  
92e47ba8839bac Liping Zhang      2016-08-13  353  /* must be called with rcu read lock held */
92e47ba8839bac Liping Zhang      2016-08-13  354  static inline void
eca18b74271e4e Florian Westphal  2025-11-05  355  nf_conntrack_get_ht(struct net *net, struct hlist_nulls_head **hash,
eca18b74271e4e Florian Westphal  2025-11-05  356  		    unsigned int *hsize)
92e47ba8839bac Liping Zhang      2016-08-13  357  {
92e47ba8839bac Liping Zhang      2016-08-13  358  	struct hlist_nulls_head *hptr;
92e47ba8839bac Liping Zhang      2016-08-13  359  	unsigned int sequence, hsz;
92e47ba8839bac Liping Zhang      2016-08-13  360  
92e47ba8839bac Liping Zhang      2016-08-13  361  	do {
92e47ba8839bac Liping Zhang      2016-08-13  362  		sequence = read_seqcount_begin(&nf_conntrack_generation);
193325b9852e29 Florian Westphal  2025-11-05 @363  		hsz = net->ct.nf_conntrack_htable_size;
eca18b74271e4e Florian Westphal  2025-11-05  364  		hptr = net->ct.nf_conntrack_hash;
92e47ba8839bac Liping Zhang      2016-08-13  365  	} while (read_seqcount_retry(&nf_conntrack_generation, sequence));
92e47ba8839bac Liping Zhang      2016-08-13  366  
92e47ba8839bac Liping Zhang      2016-08-13  367  	*hash = hptr;
92e47ba8839bac Liping Zhang      2016-08-13  368  	*hsize = hsz;
92e47ba8839bac Liping Zhang      2016-08-13  369  }
92e47ba8839bac Liping Zhang      2016-08-13  370  
308ac9143ee220 Daniel Borkmann   2015-08-08  371  struct nf_conn *nf_ct_tmpl_alloc(struct net *net,
308ac9143ee220 Daniel Borkmann   2015-08-08  372  				 const struct nf_conntrack_zone *zone,
308ac9143ee220 Daniel Borkmann   2015-08-08  373  				 gfp_t flags);
9cf94eab8b309e Daniel Borkmann   2015-08-31  374  void nf_ct_tmpl_free(struct nf_conn *tmpl);
e53376bef2cd97 Pablo Neira Ayuso 2014-02-03  375  
3c79107631db1f Florian Westphal  2019-04-01  376  u32 nf_ct_get_id(const struct nf_conn *ct);
c53bd0e96662c2 Florian Westphal  2021-04-12  377  u32 nf_conntrack_count(const struct net *net);
3c79107631db1f Florian Westphal  2019-04-01  378  
c74454fadd5ea6 Florian Westphal  2017-01-23  379  static inline void
c74454fadd5ea6 Florian Westphal  2017-01-23  380  nf_ct_set(struct sk_buff *skb, struct nf_conn *ct, enum ip_conntrack_info info)
c74454fadd5ea6 Florian Westphal  2017-01-23  381  {
261db6c2fbd64a Jeremy Sowden     2019-09-13  382  	skb_set_nfct(skb, (unsigned long)ct | info);
c74454fadd5ea6 Florian Westphal  2017-01-23  383  }
c74454fadd5ea6 Florian Westphal  2017-01-23  384  
0418b989a46788 Pablo Neira Ayuso 2021-06-02  385  extern unsigned int nf_conntrack_net_id;
0418b989a46788 Pablo Neira Ayuso 2021-06-02  386  
0418b989a46788 Pablo Neira Ayuso 2021-06-02  387  static inline struct nf_conntrack_net *nf_ct_pernet(const struct net *net)
0418b989a46788 Pablo Neira Ayuso 2021-06-02  388  {
0418b989a46788 Pablo Neira Ayuso 2021-06-02  389  	return net_generic(net, nf_conntrack_net_id);
0418b989a46788 Pablo Neira Ayuso 2021-06-02  390  }
0418b989a46788 Pablo Neira Ayuso 2021-06-02  391  
e22987c91161c3 lvxiafei          2025-11-05  392  static inline unsigned int nf_conntrack_max(const struct net *net)
e22987c91161c3 lvxiafei          2025-11-05  393  {
e22987c91161c3 lvxiafei          2025-11-05  394  #if IS_ENABLED(CONFIG_NF_CONNTRACK)
193325b9852e29 Florian Westphal  2025-11-05  395  	return net->ct.nf_conntrack_max;
e22987c91161c3 lvxiafei          2025-11-05  396  #endif
e22987c91161c3 lvxiafei          2025-11-05 @397  }
e22987c91161c3 lvxiafei          2025-11-05  398  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

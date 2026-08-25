Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188713D6473
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659580; cv=none; b=fZUQqQmJOnto1KIy4674OA7mFPnA4LEV4X1NbKiDVblSIwN+On6VVC8jNxg3wrNzgMxLJ8y8RHrPZsWjJ+8cYzij8CETGEP+2Cxm9EpurwtpjPQRopJkvIsCfcVQXzFMCQBEeSQZeypxtbXn7Zr8vY08WYEFW0Av9kskmTZbb2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659580; c=relaxed/simple;
	bh=Voa1mF0kVTf4pZX7hLKCYd2UI9Lc874cSY3FyTMiMwY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZxSa0oVUU70qWHHsDKFZhrL1FDLJ9kDfLMZKPIBuhhaJip9lMMPpcKT6kDXmi1gBjwnJ2BC2GkBmKoKjBYv44B25JNCljerfR+N9V75iPwrLJozobA4WMJYcH2dg3OLVrmcfscmSXyc+Gf7BoI0BDV0YOrcOeqjwq+S9s+BDvRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+LMrBCl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+LMrBCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787659562; x=1819195562;
  h=date:from:to:cc:subject:message-id;
  bh=Voa1mF0kVTf4pZX7hLKCYd2UI9Lc874cSY3FyTMiMwY=;
  b=X+LMrBClLLhDtugM30sO/NeT2fO86Y4NqKt3Atmx+M7Kfi92JCwHMERa
   s0FitHNWiqL8ps0vPPGHSuD898uQW9Er7PSi9iiR8T1/XjskaEHLVfcXU
   +pTtOd4nzn6iq7NRZpab7ul207NbaHPZjXbobUlNEcVjhXdcKXRPHHOCP
   9GJ+lMpKkfEbSjZjvjeajonXBoUO3wEwUB03Knm4dCXQKyyHVXFvS9v2v
   b0qeZryvJuaYCMEo1c/Zu7zSmWO46/LWU2d03CpvcZTsGJJonY6woaJb6
   DnjT1I99V5EpHqremOcezwEEyT1AV/iPkpZ0JgazuDedZJAd7TfrkkkCp
   A==;
X-CSE-ConnectionGUID: 1GV6olpSSdeIB3FFKulLEQ==
X-CSE-MsgGUID: tqtlhpXdQxi3GXzRNjrx8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98459650"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="98459650"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 05:06:01 -0700
X-CSE-ConnectionGUID: FiEP1UNxTjmMQsafJnPD+w==
X-CSE-MsgGUID: eJK/Hv+PQq2/H3423syx5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="271478395"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Aug 2026 05:06:00 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wypuf-000000005pD-0Nu6;
	Tue, 25 Aug 2026 12:05:57 +0000
Date: Tue, 25 Aug 2026 20:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [linux-next:master 15622/16703]
 net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to
 non-scalar
Message-ID: <202608252026.jHuxDJ4t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   903c1cf6dff9964e71eda98a39e2e5d442050472
commit: e80456d79ec83b00a6bd44c377684b1632ccc3c7 [15622/16703] netfilter: ipset: remove need to allocate memory on delete operations
config: alpha-randconfig-r134-20260825 (https://download.01.org/0day-ci/archive/20260825/202608252026.jHuxDJ4t-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608252026.jHuxDJ4t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608252026.jHuxDJ4t-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/netfilter/ipset/ip_set_hash_netport.c: note: in included file:
>> net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
>> net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
>> net/netfilter/ipset/ip_set_hash_netport.c:136:25: sparse: sparse: cast to non-scalar
>> net/netfilter/ipset/ip_set_hash_netport.c:136:25: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_netport.c: note: in included file:
>> net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
>> net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_netport.c:356:25: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_netport.c:356:25: sparse: sparse: cast from non-scalar
--
   net/netfilter/ipset/ip_set_hash_net.c: note: in included file:
>> net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
>> net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
>> net/netfilter/ipset/ip_set_hash_net.c:120:25: sparse: sparse: cast to non-scalar
>> net/netfilter/ipset/ip_set_hash_net.c:120:25: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_net.c: note: in included file:
>> net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
>> net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_net.c:294:25: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_net.c:294:25: sparse: sparse: cast from non-scalar
--
   net/netfilter/ipset/ip_set_hash_ipportnet.c: note: in included file:
>> net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
>> net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
>> net/netfilter/ipset/ip_set_hash_ipportnet.c:141:25: sparse: sparse: cast to non-scalar
>> net/netfilter/ipset/ip_set_hash_ipportnet.c:141:25: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_ipportnet.c: note: in included file:
>> net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
>> net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_ipportnet.c:401:25: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_ipportnet.c:401:25: sparse: sparse: cast from non-scalar

vim +368 net/netfilter/ipset/ip_set_hash_gen.h

   343	
   344	#ifdef IP_SET_HASH_WITH_NETS
   345	/**
   346	 * mtype_add_cidr - Add a CIDR entry to hash table bookkeeping
   347	 * @set: Pointer to the ip_set
   348	 * @h: Pointer to the htype
   349	 * @cidr: The CIDR prefix length
   350	 * @n: The index of the net_prefix array to add @cidr to
   351	 *
   352	 * Performs an update if @cidr is found, otherwise performs COW-style
   353	 * allocation and replacement via RCU.
   354	 *
   355	 * Return: 0 on success, negative error code on failure.
   356	 */
   357	static int
   358	mtype_add_cidr(struct ip_set *set, struct htype *h, u8 cidr, u8 n)
   359	{
   360		int i, j, found, len = 0, ret = 0;
   361		struct net_prefixes *nets, *tmp;
   362		struct net_prefix np;
   363	
   364		spin_lock_bh(&set->lock);
   365		nets = __ipset_dereference(h->rnets[n]);
   366		/* Add in increasing prefix order, so larger cidr first */
   367		for (i = 0, found = -1; i < nets->len; i++) {
 > 368			np = READ_ONCE(nets->nets[i]);
   369			if (np.count)
   370				len++;
   371			if (found != -1) {
   372				continue;
   373			} else if (np.cidr < cidr) {
   374				found = i;
   375			} else if (np.cidr == cidr) {
   376				if (np.count < CIDR_MAX_COUNT) {
   377					np.count++;
   378					WRITE_ONCE(nets->nets[i], np);
   379				} else {
   380					ret = -EOVERFLOW;
   381				}
   382				goto unlock;
   383			}
   384		}
   385		len++;
   386		tmp = kzalloc_flex(*tmp, nets, len, GFP_ATOMIC);
   387		if (!tmp) {
   388			ret = -ENOMEM;
   389			goto unlock;
   390		}
   391	
   392		tmp->len = len;
   393		seqcount_spinlock_init(&tmp->seq, &set->lock);
   394		for (i = 0, j = 0; i < nets->len; i++) {
   395			if (i == found) {
   396				tmp->nets[j].cidr = cidr;
   397				tmp->nets[j++].count = 1;
   398			}
   399			if (!nets->nets[i].count)
   400				continue;
   401			tmp->nets[j].cidr = nets->nets[i].cidr;
   402			tmp->nets[j++].count = nets->nets[i].count;
   403		}
   404		if (found == -1) {
   405			tmp->nets[j].cidr = cidr;
   406			tmp->nets[j].count = 1;
   407		}
   408		rcu_assign_pointer(h->rnets[n], tmp);
   409		kfree_rcu(nets, rcu);
   410	unlock:
   411		spin_unlock_bh(&set->lock);
   412		return ret;
   413	}
   414	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C8629CFB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711704229; cv=none; b=fE4+DmYcX7bg8eT4qP5jJnXrG9HRi/KU8KpU49+WarzE342f/By8F3z42ByT/AdrMMlzmhoM44ZVDKTigjQhAeIze13XDNXqOsZTeuMyXicJdwGJMNr5F2Lh9w/K1ViKapFCOIXqV61AFSIQra6we/POB9PwEqfuaA9Hqkd54k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711704229; c=relaxed/simple;
	bh=nWSnEB8HmdVj4hb/hWqJIcPERdVnFBFZMEa4TjXXPuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3Rk+wZageThHhCk5mekjU6IUeI8hg5wOf4u3xyr1IG/R5gVcfmEp2TlghCy0dFzZYrzH0t3NAsWjpNDV1Ow/eVOgfYeN9kcXUALWiNGA6lBk8YvAZlwVSNBrHodzaYL3caHaeiyAD4XKHdiD5bQKz7S8/CymlFIHa5H0dyfTSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3hU5hG6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3hU5hG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711704227; x=1743240227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nWSnEB8HmdVj4hb/hWqJIcPERdVnFBFZMEa4TjXXPuU=;
  b=m3hU5hG6zlMkmGM6JdhHNOupFq66TdEbD0ayJoIJP/8qDwf4r9BNTYTr
   fsD/f//HZAYOnquTsctnC+dEI0OP16LjgRzxtQxedXWepApd/K1+DgzJL
   g3u+7J5ZvuktVAG0IYjVOvruJDQL2krI5nKr4EfUI4IfLXfbkI/MI6zyl
   WKW1n9POGQ93SH9Pk9BFQ6dOGuVO8TjMzy2mzWLcM0GfEhfeKfYh1zbb0
   hke0OUjsKLCeRcYtRjmut9EKJy/1sbJHWUw0mm9ObGRaVX+XvX6sS1EVX
   CZ3mPByXUwQsKGYuhEbJ5NrWrEmNhp7A26cFX2epN6s2pJZtuhTLWbY8F
   A==;
X-CSE-ConnectionGUID: MooInLbSSUmoJ8oJbWzHIA==
X-CSE-MsgGUID: kKXUG2rfSQOx6TPw8Ordgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="24341761"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="24341761"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 02:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="17328871"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Mar 2024 02:23:43 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq8Sb-00033I-05;
	Fri, 29 Mar 2024 09:23:41 +0000
Date: Fri, 29 Mar 2024 17:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [linux-next:master 2066/2532] lib/rhashtable.c:1025: warning:
 expecting prototype for rhashtable_init_noprof(). Prototype was for
 rhashtable_init() instead
Message-ID: <202403291700.unwmuK65-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: 520333f330189e3a6f518f00d962c7b06c47cd83 [2066/2532] rhashtable: plumb through alloc tag
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240329/202403291700.unwmuK65-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291700.unwmuK65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291700.unwmuK65-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/rhashtable.c:1025: warning: expecting prototype for rhashtable_init_noprof(). Prototype was for rhashtable_init() instead
>> lib/rhashtable.c:1097: warning: expecting prototype for rhltable_init_noprof(). Prototype was for rhltable_init() instead


vim +1025 lib/rhashtable.c

31ccde2dacea83 Herbert Xu       2015-03-24   980  
7e1e77636e3607 Thomas Graf      2014-08-02   981  /**
520333f330189e Kent Overstreet  2024-03-21   982   * rhashtable_init_noprof - initialize a new hash table
7e1e77636e3607 Thomas Graf      2014-08-02   983   * @ht:		hash table to be initialized
7e1e77636e3607 Thomas Graf      2014-08-02   984   * @params:	configuration parameters
7e1e77636e3607 Thomas Graf      2014-08-02   985   *
7e1e77636e3607 Thomas Graf      2014-08-02   986   * Initializes a new hash table based on the provided configuration
7e1e77636e3607 Thomas Graf      2014-08-02   987   * parameters. A table can be configured either with a variable or
7e1e77636e3607 Thomas Graf      2014-08-02   988   * fixed length key:
7e1e77636e3607 Thomas Graf      2014-08-02   989   *
7e1e77636e3607 Thomas Graf      2014-08-02   990   * Configuration Example 1: Fixed length keys
7e1e77636e3607 Thomas Graf      2014-08-02   991   * struct test_obj {
7e1e77636e3607 Thomas Graf      2014-08-02   992   *	int			key;
7e1e77636e3607 Thomas Graf      2014-08-02   993   *	void *			my_member;
7e1e77636e3607 Thomas Graf      2014-08-02   994   *	struct rhash_head	node;
7e1e77636e3607 Thomas Graf      2014-08-02   995   * };
7e1e77636e3607 Thomas Graf      2014-08-02   996   *
7e1e77636e3607 Thomas Graf      2014-08-02   997   * struct rhashtable_params params = {
7e1e77636e3607 Thomas Graf      2014-08-02   998   *	.head_offset = offsetof(struct test_obj, node),
7e1e77636e3607 Thomas Graf      2014-08-02   999   *	.key_offset = offsetof(struct test_obj, key),
7e1e77636e3607 Thomas Graf      2014-08-02  1000   *	.key_len = sizeof(int),
87545899b52f9c Daniel Borkmann  2014-12-10  1001   *	.hashfn = jhash,
7e1e77636e3607 Thomas Graf      2014-08-02  1002   * };
7e1e77636e3607 Thomas Graf      2014-08-02  1003   *
7e1e77636e3607 Thomas Graf      2014-08-02  1004   * Configuration Example 2: Variable length keys
7e1e77636e3607 Thomas Graf      2014-08-02  1005   * struct test_obj {
7e1e77636e3607 Thomas Graf      2014-08-02  1006   *	[...]
7e1e77636e3607 Thomas Graf      2014-08-02  1007   *	struct rhash_head	node;
7e1e77636e3607 Thomas Graf      2014-08-02  1008   * };
7e1e77636e3607 Thomas Graf      2014-08-02  1009   *
49f7b33e63fec9 Patrick McHardy  2015-03-25  1010   * u32 my_hash_fn(const void *data, u32 len, u32 seed)
7e1e77636e3607 Thomas Graf      2014-08-02  1011   * {
7e1e77636e3607 Thomas Graf      2014-08-02  1012   *	struct test_obj *obj = data;
7e1e77636e3607 Thomas Graf      2014-08-02  1013   *
7e1e77636e3607 Thomas Graf      2014-08-02  1014   *	return [... hash ...];
7e1e77636e3607 Thomas Graf      2014-08-02  1015   * }
7e1e77636e3607 Thomas Graf      2014-08-02  1016   *
7e1e77636e3607 Thomas Graf      2014-08-02  1017   * struct rhashtable_params params = {
7e1e77636e3607 Thomas Graf      2014-08-02  1018   *	.head_offset = offsetof(struct test_obj, node),
87545899b52f9c Daniel Borkmann  2014-12-10  1019   *	.hashfn = jhash,
7e1e77636e3607 Thomas Graf      2014-08-02  1020   *	.obj_hashfn = my_hash_fn,
7e1e77636e3607 Thomas Graf      2014-08-02  1021   * };
7e1e77636e3607 Thomas Graf      2014-08-02  1022   */
520333f330189e Kent Overstreet  2024-03-21  1023  int rhashtable_init_noprof(struct rhashtable *ht,
488fb86ee91d3b Herbert Xu       2015-03-20  1024  		    const struct rhashtable_params *params)
7e1e77636e3607 Thomas Graf      2014-08-02 @1025  {
7e1e77636e3607 Thomas Graf      2014-08-02  1026  	struct bucket_table *tbl;
7e1e77636e3607 Thomas Graf      2014-08-02  1027  	size_t size;
7e1e77636e3607 Thomas Graf      2014-08-02  1028  
31ccde2dacea83 Herbert Xu       2015-03-24  1029  	if ((!params->key_len && !params->obj_hashfn) ||
02fd97c3d4a8a1 Herbert Xu       2015-03-20  1030  	    (params->obj_hashfn && !params->obj_cmpfn))
7e1e77636e3607 Thomas Graf      2014-08-02  1031  		return -EINVAL;
7e1e77636e3607 Thomas Graf      2014-08-02  1032  
97defe1ecf868b Thomas Graf      2015-01-02  1033  	memset(ht, 0, sizeof(*ht));
97defe1ecf868b Thomas Graf      2015-01-02  1034  	mutex_init(&ht->mutex);
ba7c95ea3870fe Herbert Xu       2015-03-24  1035  	spin_lock_init(&ht->lock);
97defe1ecf868b Thomas Graf      2015-01-02  1036  	memcpy(&ht->p, params, sizeof(*params));
97defe1ecf868b Thomas Graf      2015-01-02  1037  
520333f330189e Kent Overstreet  2024-03-21  1038  	alloc_tag_record(ht->alloc_tag);
520333f330189e Kent Overstreet  2024-03-21  1039  
a998f712f77ea4 Thomas Graf      2015-03-19  1040  	if (params->min_size)
a998f712f77ea4 Thomas Graf      2015-03-19  1041  		ht->p.min_size = roundup_pow_of_two(params->min_size);
a998f712f77ea4 Thomas Graf      2015-03-19  1042  
6d684e54690cae Herbert Xu       2017-04-27  1043  	/* Cap total entries at 2^31 to avoid nelems overflow. */
6d684e54690cae Herbert Xu       2017-04-27  1044  	ht->max_elems = 1u << 31;
2d2ab658d2debc Herbert Xu       2017-04-28  1045  
2d2ab658d2debc Herbert Xu       2017-04-28  1046  	if (params->max_size) {
2d2ab658d2debc Herbert Xu       2017-04-28  1047  		ht->p.max_size = rounddown_pow_of_two(params->max_size);
6d684e54690cae Herbert Xu       2017-04-27  1048  		if (ht->p.max_size < ht->max_elems / 2)
6d684e54690cae Herbert Xu       2017-04-27  1049  			ht->max_elems = ht->p.max_size * 2;
2d2ab658d2debc Herbert Xu       2017-04-28  1050  	}
6d684e54690cae Herbert Xu       2017-04-27  1051  
48e75b430670eb Florian Westphal 2017-05-01  1052  	ht->p.min_size = max_t(u16, ht->p.min_size, HASH_MIN_SIZE);
a998f712f77ea4 Thomas Graf      2015-03-19  1053  
3a324606bbabfc Herbert Xu       2015-12-16  1054  	size = rounded_hashtable_size(&ht->p);
3a324606bbabfc Herbert Xu       2015-12-16  1055  
31ccde2dacea83 Herbert Xu       2015-03-24  1056  	ht->key_len = ht->p.key_len;
31ccde2dacea83 Herbert Xu       2015-03-24  1057  	if (!params->hashfn) {
31ccde2dacea83 Herbert Xu       2015-03-24  1058  		ht->p.hashfn = jhash;
31ccde2dacea83 Herbert Xu       2015-03-24  1059  
31ccde2dacea83 Herbert Xu       2015-03-24  1060  		if (!(ht->key_len & (sizeof(u32) - 1))) {
31ccde2dacea83 Herbert Xu       2015-03-24  1061  			ht->key_len /= sizeof(u32);
31ccde2dacea83 Herbert Xu       2015-03-24  1062  			ht->p.hashfn = rhashtable_jhash2;
31ccde2dacea83 Herbert Xu       2015-03-24  1063  		}
31ccde2dacea83 Herbert Xu       2015-03-24  1064  	}
31ccde2dacea83 Herbert Xu       2015-03-24  1065  
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1066  	/*
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1067  	 * This is api initialization and thus we need to guarantee the
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1068  	 * initial rhashtable allocation. Upon failure, retry with the
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1069  	 * smallest possible size with __GFP_NOFAIL semantics.
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1070  	 */
b9ecfdaa1090b5 Herbert Xu       2015-03-24  1071  	tbl = bucket_table_alloc(ht, size, GFP_KERNEL);
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1072  	if (unlikely(tbl == NULL)) {
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1073  		size = max_t(u16, ht->p.min_size, HASH_MIN_SIZE);
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1074  		tbl = bucket_table_alloc(ht, size, GFP_KERNEL | __GFP_NOFAIL);
2d22ecf6db1c39 Davidlohr Bueso  2018-08-21  1075  	}
7e1e77636e3607 Thomas Graf      2014-08-02  1076  
545a148e43bed6 Ying Xue         2015-01-07  1077  	atomic_set(&ht->nelems, 0);
a5b6846f9e1a08 Daniel Borkmann  2015-03-12  1078  
7e1e77636e3607 Thomas Graf      2014-08-02  1079  	RCU_INIT_POINTER(ht->tbl, tbl);
7e1e77636e3607 Thomas Graf      2014-08-02  1080  
57699a40b4f269 Ying Xue         2015-01-16  1081  	INIT_WORK(&ht->run_work, rht_deferred_worker);
97defe1ecf868b Thomas Graf      2015-01-02  1082  
7e1e77636e3607 Thomas Graf      2014-08-02  1083  	return 0;
7e1e77636e3607 Thomas Graf      2014-08-02  1084  }
520333f330189e Kent Overstreet  2024-03-21  1085  EXPORT_SYMBOL_GPL(rhashtable_init_noprof);
7e1e77636e3607 Thomas Graf      2014-08-02  1086  
ca26893f05e864 Herbert Xu       2016-09-19  1087  /**
520333f330189e Kent Overstreet  2024-03-21  1088   * rhltable_init_noprof - initialize a new hash list table
ca26893f05e864 Herbert Xu       2016-09-19  1089   * @hlt:	hash list table to be initialized
ca26893f05e864 Herbert Xu       2016-09-19  1090   * @params:	configuration parameters
ca26893f05e864 Herbert Xu       2016-09-19  1091   *
ca26893f05e864 Herbert Xu       2016-09-19  1092   * Initializes a new hash list table.
ca26893f05e864 Herbert Xu       2016-09-19  1093   *
520333f330189e Kent Overstreet  2024-03-21  1094   * See documentation for rhashtable_init_noprof.
ca26893f05e864 Herbert Xu       2016-09-19  1095   */
520333f330189e Kent Overstreet  2024-03-21  1096  int rhltable_init_noprof(struct rhltable *hlt, const struct rhashtable_params *params)
ca26893f05e864 Herbert Xu       2016-09-19 @1097  {
ca26893f05e864 Herbert Xu       2016-09-19  1098  	int err;
ca26893f05e864 Herbert Xu       2016-09-19  1099  
520333f330189e Kent Overstreet  2024-03-21  1100  	err = rhashtable_init_noprof(&hlt->ht, params);
ca26893f05e864 Herbert Xu       2016-09-19  1101  	hlt->ht.rhlist = true;
ca26893f05e864 Herbert Xu       2016-09-19  1102  	return err;
ca26893f05e864 Herbert Xu       2016-09-19  1103  }
520333f330189e Kent Overstreet  2024-03-21  1104  EXPORT_SYMBOL_GPL(rhltable_init_noprof);
ca26893f05e864 Herbert Xu       2016-09-19  1105  

:::::: The code at line 1025 was first introduced by commit
:::::: 7e1e77636e36075ebf118298855268468f1028e8 lib: Resizable, Scalable, Concurrent Hash Table

:::::: TO: Thomas Graf <tgraf@suug.ch>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

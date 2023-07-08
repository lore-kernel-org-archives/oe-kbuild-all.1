Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AA17F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 01:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688779459; x=1720315459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t+4gU7DYG1b4eI6J8nseOUSgX0/07eh/FNpnas+6bOM=;
  b=PQl0lD47mpiN/Jz2ROBu0Nx0qog4QUONWo0g0Pb1tpquNXqmEhHeSelt
   Mmk91lf3TdzjaaRcNku8KpHcD8e2nopx0EkLn9ol5aGmQuEf/nI+26dXy
   /BClTXtCgwn6tjBJX75h1WFlxBt7uTkaaBj5ZdtomqN6/bDXZArdoOw47
   huoVUzIeoH8NhQy0RNdDVxMJoHFPuRnbfaISNwQz+pCCXW/X13U/j4Q23
   4COHPX19TY04vjumkOnUbHQl/tcL8La5/Wb6TA7IRcOhJC2ClNYJMuIBF
   3vuEdnl1JVrt10apf5VLB1rlKeIYWue2Vw6ts3DUyjJRZ3ag+9yoTzQGh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="344344916"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="344344916"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 18:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="894171241"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="894171241"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Jul 2023 18:24:17 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHwgK-0002Sm-1n;
	Sat, 08 Jul 2023 01:24:16 +0000
Date: Sat, 8 Jul 2023 09:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 2/3]
 drivers/net/wireguard/allowedips.c:193:30: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202307080919.AW7d5vKQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   f13140b2a7901129531383f476e9cc7abd8cd2b9
commit: 6e05d3ee824f992627e05acbe7063c496d341360 [2/3] UPSTREAM: wireguard: allowedips: free empty intermediate nodes when removing single node
config: i386-randconfig-i061-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080919.AW7d5vKQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080919.AW7d5vKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080919.AW7d5vKQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireguard/allowedips.c:193:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct allowedips_node **parent @@     got struct allowedips_node [noderef] <asn:4> **trie @@
   drivers/net/wireguard/allowedips.c:193:30: sparse:     expected struct allowedips_node **parent
   drivers/net/wireguard/allowedips.c:193:30: sparse:     got struct allowedips_node [noderef] <asn:4> **trie
>> drivers/net/wireguard/allowedips.c:215:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct allowedips_node **parent @@     got struct allowedips_node [noderef] <asn:4> ** @@
   drivers/net/wireguard/allowedips.c:215:48: sparse:     expected struct allowedips_node **parent
   drivers/net/wireguard/allowedips.c:215:48: sparse:     got struct allowedips_node [noderef] <asn:4> **
   drivers/net/wireguard/allowedips.c:225:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct allowedips_node **parent @@     got struct allowedips_node [noderef] <asn:4> **trie @@
   drivers/net/wireguard/allowedips.c:225:38: sparse:     expected struct allowedips_node **parent
   drivers/net/wireguard/allowedips.c:225:38: sparse:     got struct allowedips_node [noderef] <asn:4> **trie
   drivers/net/wireguard/allowedips.c:243:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct allowedips_node **parent @@     got struct allowedips_node [noderef] <asn:4> **trie @@
   drivers/net/wireguard/allowedips.c:243:30: sparse:     expected struct allowedips_node **parent
   drivers/net/wireguard/allowedips.c:243:30: sparse:     got struct allowedips_node [noderef] <asn:4> **trie
   drivers/net/wireguard/allowedips.c:175:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct allowedips_node **parent @@     got struct allowedips_node [noderef] <asn:4> ** @@
   drivers/net/wireguard/allowedips.c:175:34: sparse:     expected struct allowedips_node **parent
   drivers/net/wireguard/allowedips.c:175:34: sparse:     got struct allowedips_node [noderef] <asn:4> **
   drivers/net/wireguard/allowedips.c:175:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct allowedips_node **parent @@     got struct allowedips_node [noderef] <asn:4> ** @@
   drivers/net/wireguard/allowedips.c:175:34: sparse:     expected struct allowedips_node **parent
   drivers/net/wireguard/allowedips.c:175:34: sparse:     got struct allowedips_node [noderef] <asn:4> **
   drivers/net/wireguard/allowedips.c:175:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct allowedips_node **parent @@     got struct allowedips_node [noderef] <asn:4> ** @@
   drivers/net/wireguard/allowedips.c:175:34: sparse:     expected struct allowedips_node **parent
   drivers/net/wireguard/allowedips.c:175:34: sparse:     got struct allowedips_node [noderef] <asn:4> **
   drivers/net/wireguard/allowedips.c:175:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct allowedips_node **parent @@     got struct allowedips_node [noderef] <asn:4> ** @@
   drivers/net/wireguard/allowedips.c:175:34: sparse:     expected struct allowedips_node **parent
   drivers/net/wireguard/allowedips.c:175:34: sparse:     got struct allowedips_node [noderef] <asn:4> **
   drivers/net/wireguard/allowedips.c:175:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct allowedips_node **parent @@     got struct allowedips_node [noderef] <asn:4> ** @@
   drivers/net/wireguard/allowedips.c:175:34: sparse:     expected struct allowedips_node **parent
   drivers/net/wireguard/allowedips.c:175:34: sparse:     got struct allowedips_node [noderef] <asn:4> **

vim +193 drivers/net/wireguard/allowedips.c

   177	
   178	static int add(struct allowedips_node __rcu **trie, u8 bits, const u8 *key,
   179		       u8 cidr, struct wg_peer *peer, struct mutex *lock)
   180	{
   181		struct allowedips_node *node, *parent, *down, *newnode;
   182	
   183		if (unlikely(cidr > bits || !peer))
   184			return -EINVAL;
   185	
   186		if (!rcu_access_pointer(*trie)) {
   187			node = kmem_cache_zalloc(node_cache, GFP_KERNEL);
   188			if (unlikely(!node))
   189				return -ENOMEM;
   190			RCU_INIT_POINTER(node->peer, peer);
   191			list_add_tail(&node->peer_list, &peer->allowedips_list);
   192			copy_and_assign_cidr(node, key, cidr, bits);
 > 193			connect_node(trie, 2, node);
   194			return 0;
   195		}
   196		if (node_placement(*trie, key, cidr, bits, &node, lock)) {
   197			rcu_assign_pointer(node->peer, peer);
   198			list_move_tail(&node->peer_list, &peer->allowedips_list);
   199			return 0;
   200		}
   201	
   202		newnode = kmem_cache_zalloc(node_cache, GFP_KERNEL);
   203		if (unlikely(!newnode))
   204			return -ENOMEM;
   205		RCU_INIT_POINTER(newnode->peer, peer);
   206		list_add_tail(&newnode->peer_list, &peer->allowedips_list);
   207		copy_and_assign_cidr(newnode, key, cidr, bits);
   208	
   209		if (!node) {
   210			down = rcu_dereference_protected(*trie, lockdep_is_held(lock));
   211		} else {
   212			const u8 bit = choose(node, key);
   213			down = rcu_dereference_protected(node->bit[bit], lockdep_is_held(lock));
   214			if (!down) {
 > 215				connect_node(&node->bit[bit], bit, newnode);
   216				return 0;
   217			}
   218		}
   219		cidr = min(cidr, common_bits(down, key, bits));
   220		parent = node;
   221	
   222		if (newnode->cidr == cidr) {
   223			choose_and_connect_node(newnode, down);
   224			if (!parent)
   225				connect_node(trie, 2, newnode);
   226			else
   227				choose_and_connect_node(parent, newnode);
   228			return 0;
   229		}
   230	
   231		node = kmem_cache_zalloc(node_cache, GFP_KERNEL);
   232		if (unlikely(!node)) {
   233			list_del(&newnode->peer_list);
   234			kmem_cache_free(node_cache, newnode);
   235			return -ENOMEM;
   236		}
   237		INIT_LIST_HEAD(&node->peer_list);
   238		copy_and_assign_cidr(node, newnode->bits, cidr, bits);
   239	
   240		choose_and_connect_node(node, down);
   241		choose_and_connect_node(node, newnode);
   242		if (!parent)
   243			connect_node(trie, 2, node);
   244		else
   245			choose_and_connect_node(parent, node);
   246		return 0;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

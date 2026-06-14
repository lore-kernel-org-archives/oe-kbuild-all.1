Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF533AD9A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 22:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781476077; cv=none; b=DQgCZkDD0n7CS8KAuNEg1mmrehUjviB8qypyhQle1lTBntZ/jIijaerIgh+Qriu8H3BqgcS0mXcwmpjK27G5MhHolgd7ddwiQ7rSMadrn1i4zPltDPZdmL0sj6npAfj406V1c+ijFJqRi0WpHH1HN4nWH6ZX8krSQHUlxGrhVrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781476077; c=relaxed/simple;
	bh=RgnDMwfWdHXuaKpboKYu5eNeOga6vVAyePgTUgHzvOc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mudm5DlQ9rgoc99fKkL3EQUK8JcU5lm4rmc3Xu+f3xVnhW1f1MXLmoHhzeYftfVdK0F8oTJM79yEBhx+dW58SiLyYk7fcDUfR/RsJpYMP9l0He3yokg7mauVH/NPG5wSSsGVcXClEPhGPt7Vk3AGCqxTCaD3xHj58uA+VsG087U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XsFzdodu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XsFzdodu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781476075; x=1813012075;
  h=date:from:to:cc:subject:message-id;
  bh=RgnDMwfWdHXuaKpboKYu5eNeOga6vVAyePgTUgHzvOc=;
  b=XsFzdoduTILvRrgkV8F4N23CshOOa+FFx9J8D/CcXDfjot3sbZJf0ow4
   YBQtl6krLAzjsvLhjkg5t6Z4gioZvwTt/v5yDXbGXnatTvXMpikHMwtDl
   7UevS/YvNQWlvPcWaU8W9n/x8KffomUOLvm4GrAIUQhes8SSu9hIJmNxT
   gexXKwti/sgOtrW4naMT9H5kn/9TpH/p7Lvgt9cNSAkVGqQSt+6bi2M5q
   jZ+gNMnVFlRoudbZ03g9rBhjlAI6UstJ1BKUmSxPmjAlvdlQzG5ZqRA6Q
   scBhg2Ra3s+Ln+xFqAwY/3iaxjxYoQgvo7UrnEYTMCt331CizVQyBKv2W
   A==;
X-CSE-ConnectionGUID: wJ4oXwkxScurEYwnAg1uGA==
X-CSE-MsgGUID: QvRQvKGfR0KeBUeyd+em8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82122217"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82122217"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 15:27:54 -0700
X-CSE-ConnectionGUID: Fn8QaqiFTqqvM8g8WV7oSA==
X-CSE-MsgGUID: 7Ljfh3dHSfqQz3gXBER+pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="240961210"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2026 15:27:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYtJ0-00000000REs-1jl4;
	Sun, 14 Jun 2026 22:27:50 +0000
Date: Mon, 15 Jun 2026 06:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [netfilter-nf-next:for-netdev-nf-next-26-06-14 3/11]
 net/netfilter/nf_conncount.c:502:18: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202606150616.cpmJToWO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git for-netdev-nf-next-26-06-14
head:   2354e975932dabb06fad239f07a3b68fd1809737
commit: 64d7d5abe2160bba369b4a8f06bdf5630573bab0 [3/11] netfilter: nf_conncount: callers must hold rcu read lock
config: x86_64-randconfig-123-20260614 (https://download.01.org/0day-ci/archive/20260615/202606150616.cpmJToWO-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150616.cpmJToWO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150616.cpmJToWO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/nf_conncount.c:502:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_conncount.c:502:18: sparse:    struct rb_node [noderef] __rcu *
   net/netfilter/nf_conncount.c:502:18: sparse:    struct rb_node *
   net/netfilter/nf_conncount.c:510:34: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_conncount.c:510:34: sparse:    struct rb_node [noderef] __rcu *
   net/netfilter/nf_conncount.c:510:34: sparse:    struct rb_node *
   net/netfilter/nf_conncount.c:512:34: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nf_conncount.c:512:34: sparse:    struct rb_node [noderef] __rcu *
   net/netfilter/nf_conncount.c:512:34: sparse:    struct rb_node *
   net/netfilter/nf_conncount.c: note: in included file (through include/linux/mm_types.h, include/linux/uio.h, include/linux/socket.h, include/uapi/linux/in.h, ...):
   include/linux/rbtree.h:107:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:107:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:107:9: sparse:    struct rb_node *

vim +502 net/netfilter/nf_conncount.c

   486	
   487	static unsigned int
   488	count_tree(struct net *net,
   489		   const struct sk_buff *skb,
   490		   u16 l3num,
   491		   struct nf_conncount_data *data,
   492		   const u32 *key)
   493	{
   494		struct rb_root *root;
   495		struct rb_node *parent;
   496		struct nf_conncount_rb *rbconn;
   497		unsigned int hash;
   498	
   499		hash = jhash2(key, data->keylen, data->initval) % CONNCOUNT_SLOTS;
   500		root = &data->root[hash];
   501	
 > 502		parent = rcu_dereference(root->rb_node);
   503		while (parent) {
   504			int diff;
   505	
   506			rbconn = rb_entry(parent, struct nf_conncount_rb, node);
   507	
   508			diff = key_diff(key, rbconn->key, data->keylen);
   509			if (diff < 0) {
   510				parent = rcu_dereference(parent->rb_left);
   511			} else if (diff > 0) {
   512				parent = rcu_dereference(parent->rb_right);
   513			} else {
   514				int ret;
   515	
   516				if (!skb) {
   517					nf_conncount_gc_list(net, &rbconn->list);
   518					return rbconn->list.count;
   519				}
   520	
   521				spin_lock_bh(&rbconn->list.list_lock);
   522				/* Node might be about to be free'd.
   523				 * We need to defer to insert_tree() in this case.
   524				 */
   525				if (rbconn->list.count == 0) {
   526					spin_unlock_bh(&rbconn->list.list_lock);
   527					break;
   528				}
   529	
   530				/* same source network -> be counted! */
   531				ret = __nf_conncount_add(net, skb, l3num, &rbconn->list);
   532				spin_unlock_bh(&rbconn->list.list_lock);
   533				if (ret && ret != -EEXIST) {
   534					return 0; /* hotdrop */
   535				} else {
   536					/* -EEXIST means add was skipped, update the list */
   537					if (ret == -EEXIST)
   538						nf_conncount_gc_list(net, &rbconn->list);
   539					return rbconn->list.count;
   540				}
   541			}
   542		}
   543	
   544		if (!skb)
   545			return 0;
   546	
   547		return insert_tree(net, skb, l3num, data, root, hash, key);
   548	}
   549	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

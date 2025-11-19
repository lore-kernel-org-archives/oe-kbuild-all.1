Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B7B2741C9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 08:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541023; cv=none; b=QoWwkHOhptWe5cpGfkqo6VmRJesmpP01+JBWGDr/roU0nogV6QQkQz9c19SnZ+RSJgiHdEYoKxVaniyYtB/iZ6/zYpMhdETPA4Q9Kd1VYz5fUO2oBqWBca0chfeEZOzRw+KQxrBFYMP6/mi3ggZ0UyfHzPqbr2KBHrjejxYhn4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541023; c=relaxed/simple;
	bh=xkxTCh+QyFSsSgomEE2MI5vN9j4Deo0E9syIENkaSgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4WyTYk+A5pVhh4j4x4Neq1DNs/fB7OzwgD55PQ3cSMpeE/t9hwvqSXxREJmlxP30b/FZXUVoRmdvTfxOTzRNdiJ+h7Uh4SeClvFdC/mWDPqM1zhk5MisbQ8qVSuO+Gr1lDApdZrfFg1CiP4Jo+pOr7jp8Fp2PlUA9/3xK8yUCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lz+Wnqr0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lz+Wnqr0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763541021; x=1795077021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xkxTCh+QyFSsSgomEE2MI5vN9j4Deo0E9syIENkaSgM=;
  b=lz+Wnqr0rJABxm9TralzeT6T3r+aWzKdTqz1+/iFYus3aQa19EDytZpX
   1A75H1go9gzsoYynFJUTWVVvJjzzM92oPstgXuwWqdXgiq6VlWWfaGgfH
   0Z6Da6N8wcKhjqXNUvQO4Fg//jBsaxgQK0CtVWNXfDgBXQR1ck6xVwgcY
   VNXh4c6CiWej4unioVO85Owh4SsMxc1d4A4G8InB0PaYYPOT/H2krKyrL
   KROpPrKNGQRjwiYemOhg3QGjAMN9QbZkEYcCuruIliHcRKZYAztRJcg6P
   z61LXBrD6JmQ5hf0qLqMJ2Lfr+whBE8UYttbFYia2/dYBoVFKgLFbOBeD
   w==;
X-CSE-ConnectionGUID: NFjx2Z/dR5+VJ1hxMm4jYA==
X-CSE-MsgGUID: O40WFhWPS8C1ujggL9Lo4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="69193090"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="69193090"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 00:30:21 -0800
X-CSE-ConnectionGUID: VtBljWXXTI+d+MXY37/CTw==
X-CSE-MsgGUID: DkIll2I9Rsu5/8KBV+yfbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190786697"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Nov 2025 00:30:19 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLdZx-0002cF-0Y;
	Wed, 19 Nov 2025 08:30:17 +0000
Date: Wed, 19 Nov 2025 16:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH nf-next 3/3] netfilter: nft_set_rbtree: do not modifiy
 live tree
Message-ID: <202511191544.ss8W56uH-lkp@intel.com>
References: <20251118111657.12003-4-fw@strlen.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118111657.12003-4-fw@strlen.de>

Hi Florian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on netfilter-nf/main]
[also build test WARNING on linus/master v6.18-rc6 next-20251119]
[cannot apply to nf-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/netfilter-nft_set_rbtree-prepare-for-two-rbtrees/20251118-191851
base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20251118111657.12003-4-fw%40strlen.de
patch subject: [PATCH nf-next 3/3] netfilter: nft_set_rbtree: do not modifiy live tree
config: arm64-randconfig-r122-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191544.ss8W56uH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191544.ss8W56uH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191544.ss8W56uH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/nft_set_rbtree.c:893:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/nft_set_rbtree.c:893:9: sparse:    struct rb_node [noderef] __rcu *
   net/netfilter/nft_set_rbtree.c:893:9: sparse:    struct rb_node *
   net/netfilter/nft_set_rbtree.c: note: in included file (through include/linux/mm_types.h, include/linux/page-flags.h, arch/arm64/include/asm/mte.h, ...):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +893 net/netfilter/nft_set_rbtree.c

   858	
   859	static void nft_rbtree_commit(struct nft_set *set)
   860	{
   861		struct nft_rbtree *priv = nft_set_priv(set);
   862		u8 genbit;
   863	
   864		if (time_after_eq(jiffies, priv->last_gc + nft_set_gc_interval(set)))
   865			nft_rbtree_gc(set);
   866	
   867		priv->cloned = false;
   868	
   869		write_lock_bh(&priv->lock);
   870		write_seqcount_begin(&priv->count);
   871	
   872		genbit = nft_rbtree_genbit_live(priv);
   873		priv->genbit = !genbit;
   874	
   875		/* genbit is now the old generation. priv->cloned as been set to
   876		 * false.  Future call to nft_rbtree_maybe_clone() will create a
   877		 * new on-demand copy of the live version.
   878		 *
   879		 * Elements new in the committed transaction and all unchanged
   880		 * elements are now visible to other CPUs.
   881		 *
   882		 * Removed elements are now only reachable via their
   883		 * DELSETELEM transaction entry, they will be free'd after
   884		 * rcu grace period.
   885		 *
   886		 * A cpu still doing a lookup in the old (genbit) tree will
   887		 * either find a match, or, if it did not find a result, will
   888		 * obseve the altered sequence count.
   889		 *
   890		 * In the latter case, it will spin on priv->lock and then performs
   891		 * a new lookup in the current tree.
   892		 */
 > 893		rcu_assign_pointer(priv->root[genbit].rb_node, NULL);
   894	
   895		write_seqcount_end(&priv->count);
   896		write_unlock_bh(&priv->lock);
   897	}
   898	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

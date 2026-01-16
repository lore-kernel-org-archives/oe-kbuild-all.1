Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913EF357735
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 09:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556219; cv=none; b=bzfKL5q8ju6k9QSCWamNBeCAE/Gbm85sw5WUacVULT/juPfNTFikj2OKiO9kXEVhWmTudOlINylw0N96WuUAkkHHApcOuu0PLzQApaE3/XSUezOzNdiRQpPsylwAdlcjM3VjSOGM3ouuWKzuZ5K+yRbTKTvFMCwZSo//+OrHyiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556219; c=relaxed/simple;
	bh=zSuPh/JA9JXiPYKBtYjX8YWfiVWnSdinWrMb6ddTa4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8yGfUDQvnL8qoee+Ih1zHV0Yy3InC/haqp+8hPwEo3i3dF7v0g7bUYzA0wkPda3B9f6RRoOJngMjnl9nnX/uIdxhvupRtbasZRX0UwGBm/PBTV80g+cRVap8Zczdn+HoVis2+qr5ioOmfBXtGXoEaCkYudZhk+OMm6OErHji4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JW/Q6mnO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JW/Q6mnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768556218; x=1800092218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zSuPh/JA9JXiPYKBtYjX8YWfiVWnSdinWrMb6ddTa4o=;
  b=JW/Q6mnOwrXK2xyAUHGJJw5duYbBp0b+HM87WsaM1471EJpCYcM7Rq99
   iwyc+09wrdAwtkIGppylmmsNrGKsNdoFckqw0ay5hvZ75GnBs92d2HqkJ
   zy60JeB9FEEmjvjI2iq7paz5Ril2KTqlcsFSoNr9XOeIR918Q1fYwJ/j9
   4469HcmtxBjNIAcjfXXg8WysTiNvgUPqxglJeT2odMgV7P7xsVFrkpFX5
   VkdsPtMfyckdXXg+sneQsreIzjLF7fDyjY+9SIsciJ9iHzA1BGX7/sPhq
   o+HAuoHqOiLStN0/1J1Ps89p2LTcPRy4F1ERN5ni/QPc0lzU9IRS981e0
   g==;
X-CSE-ConnectionGUID: So9CdkqhT6utdrZTfZjyOg==
X-CSE-MsgGUID: 5/u9rKVWRDiPTrMcozIBGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80986505"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="80986505"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 01:36:55 -0800
X-CSE-ConnectionGUID: +hPv5xTRQC62VHhPmtBU7A==
X-CSE-MsgGUID: 0yK1QqJYTSufHLThN59EmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="209694946"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Jan 2026 01:36:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vggG8-00000000Kf2-3s13;
	Fri, 16 Jan 2026 09:36:48 +0000
Date: Fri, 16 Jan 2026 17:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	maple-tree@lists.infradead.org, linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Alice Ryhl <aliceryhl@google.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Kujau <lists@nerdbynature.de>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [PATCH 16/28] maple_tree: Start using maple copy node for
 destination
Message-ID: <202601161750.eDtUQiJr-lkp@intel.com>
References: <20260115193647.1695937-17-Liam.Howlett@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115193647.1695937-17-Liam.Howlett@oracle.com>

Hi Liam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20260115]
[cannot apply to akpm-mm/mm-nonmm-unstable soc/for-next linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liam-R-Howlett/maple_tree-Move-mas_spanning_rebalance-loop-to-function/20260116-034135
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260115193647.1695937-17-Liam.Howlett%40oracle.com
patch subject: [PATCH 16/28] maple_tree: Start using maple copy node for destination
config: x86_64-randconfig-121-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161750.eDtUQiJr-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161750.eDtUQiJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161750.eDtUQiJr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/maple_tree.c:3355:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got struct maple_enode * @@
   lib/maple_tree.c:3355:37: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:3355:37: sparse:     got struct maple_enode *
>> lib/maple_tree.c:3358:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct maple_enode const *entry @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:3358:17: sparse:     expected struct maple_enode const *entry
   lib/maple_tree.c:3358:17: sparse:     got void [noderef] __rcu *
>> lib/maple_tree.c:3397:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct maple_enode *node @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:3397:19: sparse:     expected struct maple_enode *node
   lib/maple_tree.c:3397:19: sparse:     got void [noderef] __rcu *
   lib/maple_tree.c:3139:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got struct maple_enode * @@
   lib/maple_tree.c:3139:29: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:3139:29: sparse:     got struct maple_enode *
>> lib/maple_tree.c:2558:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct maple_enode *enode @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:2558:52: sparse:     expected struct maple_enode *enode
   lib/maple_tree.c:2558:52: sparse:     got void [noderef] __rcu *
   lib/maple_tree.c:2803:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got void *content @@
   lib/maple_tree.c:2803:29: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:2803:29: sparse:     got void *content
   lib/maple_tree.c:2806:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got void *entry @@
   lib/maple_tree.c:2806:23: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:2806:23: sparse:     got void *entry
>> lib/maple_tree.c:2558:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct maple_enode *enode @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:2558:52: sparse:     expected struct maple_enode *enode
   lib/maple_tree.c:2558:52: sparse:     got void [noderef] __rcu *
   lib/maple_tree.c:6899:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got struct maple_node * @@
   lib/maple_tree.c:6899:30: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:6899:30: sparse:     got struct maple_node *
   lib/maple_tree.c:6899:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got struct maple_node * @@
   lib/maple_tree.c:6899:30: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:6899:30: sparse:     got struct maple_node *

vim +3355 lib/maple_tree.c

  3317	
  3318	/*
  3319	 * spanning_ascend() - See if a spanning store operation has to keep walking up
  3320	 * the tree
  3321	 * @cp: The maple_copy node
  3322	 * @l_wr_mas: The left maple write state
  3323	 * @r_wr_mas: The right maple write state
  3324	 * @sib: the maple state of the sibling
  3325	 *
  3326	 * Returns: True if another iteration is necessary.
  3327	 */
  3328	static bool spanning_ascend(struct maple_copy *cp, struct ma_state *mas,
  3329				    struct ma_wr_state *l_wr_mas, struct ma_wr_state *r_wr_mas,
  3330				    struct ma_state *sib)
  3331	{
  3332		if (sib->end) {
  3333			if (sib->max < l_wr_mas->mas->min)
  3334				*l_wr_mas->mas = *sib;
  3335			else
  3336				*r_wr_mas->mas = *sib;
  3337		}
  3338	
  3339		cp_dst_to_slots(cp, l_wr_mas->mas->min, r_wr_mas->mas->max, mas);
  3340		if (!cp->min && cp->max == ULONG_MAX) {
  3341			/* New root */
  3342			if (cp->d_count != 1) {
  3343				enum maple_type mt = maple_arange_64;
  3344	
  3345				if (!mt_is_alloc(mas->tree))
  3346					mt = maple_range_64;
  3347	
  3348				cp->data = cp->d_count;
  3349				cp->s_count = 0;
  3350				dst_setup(cp, mas, mt);
  3351				init_cp_src(cp);
  3352				node_copy(mas, cp->src[0].node, 0, cp->data, cp->max, maple_copy,
  3353					  cp->dst[0].node, 0, mt);
  3354				node_finalise(cp->dst[0].node, mt, cp->end + 1);
> 3355				cp->slot[0] = mt_mk_node(cp->dst[0].node, mt);
  3356				cp->height++;
  3357			}
> 3358			WARN_ON_ONCE(cp->dst[0].node != mte_to_node(cp->slot[0]));
  3359			cp->dst[0].node->parent = ma_parent_ptr(mas_tree_parent(mas));
  3360			mas->min = 0;
  3361			mas->max = ULONG_MAX;
  3362			mas->depth = 0;
  3363			mas->node = mas_root_locked(mas);
  3364			return false;
  3365		}
  3366	
  3367		/* Converged and has a single destination */
  3368		if ((cp->d_count == 1) &&
  3369		    (l_wr_mas->mas->node == r_wr_mas->mas->node)) {
  3370			cp->dst[0].node->parent = ma_parent_ptr(mas_mn(mas)->parent);
  3371			return false;
  3372		}
  3373	
  3374		cp->height++;
  3375		wr_mas_ascend(l_wr_mas);
  3376		wr_mas_ascend(r_wr_mas);
  3377		return true;
  3378	}
  3379	
  3380	static noinline void mas_wr_spanning_rebalance(struct ma_state *mas,
  3381			struct ma_wr_state *l_wr_mas, struct ma_wr_state *r_wr_mas)
  3382	{
  3383	
  3384		struct maple_enode *old_enode;
  3385		struct maple_copy cp;
  3386		struct ma_state sib;
  3387	
  3388		cp_leaf_init(&cp, mas, l_wr_mas, r_wr_mas);
  3389		do {
  3390			spanning_data(&cp, l_wr_mas, r_wr_mas, &sib);
  3391			multi_src_setup(&cp, l_wr_mas, r_wr_mas, &sib);
  3392			dst_setup(&cp, mas, l_wr_mas->type);
  3393			cp_data_write(&cp, mas);
  3394		} while (spanning_ascend(&cp, mas, l_wr_mas, r_wr_mas, &sib));
  3395	
  3396		old_enode = mas->node;
> 3397		mas->node = cp.slot[0];
  3398		mas_wmb_replace(mas, old_enode, cp.height);
  3399		mtree_range_walk(mas);
  3400	}
  3401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

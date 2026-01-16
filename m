Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E9927816C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 07:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768549552; cv=none; b=JNSkbsUbhzEw8YJ1UfsynCTUudls5w+FBc7EnWyHYuJulCoCt1J2gh18f+I+fLVIpy0s3nwhxVHByPHnqVlzhayyyfWvGCwQxevdFvcV7BbCOwi4qGfWVGZFzGzeBzGPeFHTCDprRoZJWQRGc0CqQVfAxBPstPFJcmm+yKsk3Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768549552; c=relaxed/simple;
	bh=G0V6S9md6+nld2O30zY+hMSqsUc4Po2MsCahVSA79HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UE0il0MClzOjqjQ9tVJK5oglAq8CJeDNOvMs/AUUMKROj+TyvhrSYslVqOaThlZ6gFP4JeF16q1zoWZr4PGRNQkUVfvl2WxWn7QDyyiut9r7QnKebHxCLz4fnrUnAukHB3jGni+WwY3Lwk2H+R+ZEMYhLOsVB/z4AcxX4ViQjHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3TduJMa; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3TduJMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768549550; x=1800085550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G0V6S9md6+nld2O30zY+hMSqsUc4Po2MsCahVSA79HY=;
  b=D3TduJMapoUDyG7uF3dwd4DfXb4VBPGEmokPEmUSFCCXcQxeHC8NrMrc
   57pr5QdsxZCG1VJapDBDj1HUiPmxbUf3tjIjxmcMWVvFEyqKDE5li/PX1
   Yi6+fkSeTYW1HziDDxGS+5hokWm4qYhti3xqbFFHfJnie0mbZqiJloTOy
   VCfe5v4mQ8SOvR1846Hunm5AqyweX4z0SvOL6849AENqZtucXV67PgmHX
   iOyfLGjEwY52HmiPP5wuijkyQYlvJkPBfcp+mHxu+KkxydREMEG/fww89
   heE5EzSw3gq9GeLthJENHAqYTNvIsCu56BTObtdMV27i4PuMqynMC7Tjs
   Q==;
X-CSE-ConnectionGUID: aSCLPe+qS7uz6sJhjAN3ew==
X-CSE-MsgGUID: qH2GT4eoTTeEyHjsPo4t9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69065594"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="69065594"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 23:45:50 -0800
X-CSE-ConnectionGUID: ONnquVpZT+qEY5I8SvDUjg==
X-CSE-MsgGUID: tDcssknwRjy3qULDu7oUIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="242723017"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jan 2026 23:45:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgeWd-00000000KXw-0hBC;
	Fri, 16 Jan 2026 07:45:43 +0000
Date: Fri, 16 Jan 2026 15:45:19 +0800
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
Subject: Re: [PATCH 10/28] maple_tree: Introduce maple_copy node and use it
 in mas_spanning_rebalance()
Message-ID: <202601161501.NZ3GNDCG-lkp@intel.com>
References: <20260115193647.1695937-11-Liam.Howlett@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115193647.1695937-11-Liam.Howlett@oracle.com>

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
patch link:    https://lore.kernel.org/r/20260115193647.1695937-11-Liam.Howlett%40oracle.com
patch subject: [PATCH 10/28] maple_tree: Introduce maple_copy node and use it in mas_spanning_rebalance()
config: x86_64-randconfig-121-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161501.NZ3GNDCG-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161501.NZ3GNDCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161501.NZ3GNDCG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/maple_tree.c:2621:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got void *content @@
   lib/maple_tree.c:2621:29: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:2621:29: sparse:     got void *content
>> lib/maple_tree.c:2624:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got void *entry @@
   lib/maple_tree.c:2624:23: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:2624:23: sparse:     got void *entry
   lib/maple_tree.c:2680:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu **b_slots @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:2680:17: sparse:     expected void [noderef] __rcu **b_slots
   lib/maple_tree.c:2680:17: sparse:     got void [noderef] __rcu *
   lib/maple_tree.c:6412:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got struct maple_node * @@
   lib/maple_tree.c:6412:30: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:6412:30: sparse:     got struct maple_node *
   lib/maple_tree.c:6412:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got struct maple_node * @@
   lib/maple_tree.c:6412:30: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:6412:30: sparse:     got struct maple_node *

vim +2621 lib/maple_tree.c

  2603	
  2604	/*
  2605	 * cp_leaf_init() - Initialize a maple_copy node for the leaf level of a
  2606	 * spanning store
  2607	 * @cp: The maple copy node
  2608	 * @mas: The maple state
  2609	 * @l_wr_mas: The left write state of the spanning store
  2610	 * @r_wr_mas: The right write state of the spanning store
  2611	 */
  2612	static inline void cp_leaf_init(struct maple_copy *cp,
  2613			struct ma_state *mas, struct ma_wr_state *l_wr_mas,
  2614			struct ma_wr_state *r_wr_mas)
  2615	{
  2616		unsigned char end = 0;
  2617	
  2618		/* Create entries to insert including split entries to left and right */
  2619		if (l_wr_mas->r_min < mas->index) {
  2620			end++;
> 2621			cp->slot[0] = l_wr_mas->content;
  2622			cp->pivot[0] = mas->index - 1;
  2623		}
> 2624		cp->slot[end] = l_wr_mas->entry;
  2625		cp->pivot[end] = mas->last;
  2626	
  2627		if (r_wr_mas->end_piv > mas->last) {
  2628			end++;
  2629			cp->slot[end] = r_wr_mas->slots[r_wr_mas->offset_end];
  2630			cp->pivot[end] = r_wr_mas->end_piv;
  2631		}
  2632	
  2633		cp->min = l_wr_mas->r_min;
  2634		cp->max = cp->pivot[end];
  2635		cp->end = end;
  2636	}
  2637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

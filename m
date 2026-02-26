Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0453A466B51
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 23:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146992; cv=none; b=Ce4gaO7sFoDwXNWoq6mSo5dkg1Ha8tzHSiCB1/dYlcvRoJvw3n+g/CUKTaDteQQf04KdB2S4SY1QQ5TnlTCxNPzL49LOYE7eQSqNI9nB6se9YnVwGt+IOPsQkxDKUpwvVOhMDrBewFB0XUlsxoJ52BcuZdYg9Gd5yJ2p9wLAzks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146992; c=relaxed/simple;
	bh=SreBxnXx9H5+1XCmaSIiW+VRtXmst8sQevpR2PIDGS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDg8GvX0ENIsYjYrsUiMnOQOdaJWiDZ4H1SvqzvrCBq98OT87lGpPARKdDB+zs1xRx1r7OIVPATSwu6aaw1D/JLmSiJpWc7floSrhsTA1pRF9os8nvypTkFaNu3H91UiYC0Wr8y6FCX+KlHlzZB7xMykD4+FjMcNgthvXZ71zN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAhTvGnX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAhTvGnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772146988; x=1803682988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SreBxnXx9H5+1XCmaSIiW+VRtXmst8sQevpR2PIDGS8=;
  b=nAhTvGnXJRlk6IquQuVJCU1VKwrMVEYFimKiAKCjNjgqXyxEV948Dwpq
   saq4E+PhzclxTSiItvP1UWlMOyRAVduLlm29mewxAs+UVp8wdkS/3es3E
   Cj0DxsSE4pH0N9cRHqw93w7IFOG9WdDqVHaGQAeG69dXyEbnoM7aNV/am
   DTGExb2QHtnNz42EHihCikXeyd72r4LuihvP3pVoOgz6UYKsLopSPwkBc
   SqCzqWCz2/vnkf6IJINgmKqOBJjkUvg2KrXMgkxCvkKmjs3wq6MF+WJtk
   DTgeMRl3atSqtpHVnkDVBRX0H0RzmHWzY7cNYk5sLnSye0hFnBsVoLx+0
   g==;
X-CSE-ConnectionGUID: Q94cLOFFRQCaLziKHe6Ywg==
X-CSE-MsgGUID: qf0dqbXUT0qyo8s33bbrCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73133993"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73133993"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 15:03:07 -0800
X-CSE-ConnectionGUID: ZIvjQsmVT0qcB3SKaitltA==
X-CSE-MsgGUID: APSr2F91RjeZTN3y3woKgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="221716270"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Feb 2026 15:03:02 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvkNm-000000009yZ-3u9j;
	Thu, 26 Feb 2026 23:02:58 +0000
Date: Fri, 27 Feb 2026 07:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Nhat Pham <hoangnhat.pham@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <liam.howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 8/8] mm/vmstat, memcontrol: Track ZSWAP_B, ZSWAPPED_B
 per-memcg-lruvec
Message-ID: <202602270614.hOv7KIkV-lkp@intel.com>
References: <20260226192936.3190275-9-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226192936.3190275-9-joshua.hahnjy@gmail.com>

Hi Joshua,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on linus/master v7.0-rc1]
[cannot apply to akpm-mm/mm-everything next-20260226]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-zsmalloc-Rename-zs_object_copy-to-zs_obj_copy/20260227-033239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260226192936.3190275-9-joshua.hahnjy%40gmail.com
patch subject: [PATCH 8/8] mm/vmstat, memcontrol: Track ZSWAP_B, ZSWAPPED_B per-memcg-lruvec
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20260227/202602270614.hOv7KIkV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270614.hOv7KIkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270614.hOv7KIkV-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/zsmalloc.c: In function '__free_zspage':
>> mm/zsmalloc.c:813:24: error: implicit declaration of function 'zpdesc_objcgs'; did you mean 'zpdesc_lock'? [-Wimplicit-function-declaration]
     813 |         bool objcg = !!zpdesc_objcgs(zspage->first_zpdesc);
         |                        ^~~~~~~~~~~~~
         |                        zpdesc_lock


vim +813 mm/zsmalloc.c

   808	
   809	static void __free_zspage(struct zs_pool *pool, struct size_class *class,
   810					struct zspage *zspage)
   811	{
   812		struct zpdesc *zpdesc, *next;
 > 813		bool objcg = !!zpdesc_objcgs(zspage->first_zpdesc);
   814	
   815		assert_spin_locked(&class->lock);
   816	
   817		VM_BUG_ON(get_zspage_inuse(zspage));
   818		VM_BUG_ON(zspage->fullness != ZS_INUSE_RATIO_0);
   819	
   820		next = zpdesc = get_first_zpdesc(zspage);
   821		do {
   822			VM_BUG_ON_PAGE(!zpdesc_is_locked(zpdesc), zpdesc_page(zpdesc));
   823			next = get_next_zpdesc(zpdesc);
   824			reset_zpdesc(zpdesc);
   825			zpdesc_unlock(zpdesc);
   826			zpdesc_dec_zone_page_state(zpdesc);
   827			if (objcg)
   828				dec_node_page_state(zpdesc_page(zpdesc), NR_ZSWAP_B);
   829			zpdesc_put(zpdesc);
   830			zpdesc = next;
   831		} while (zpdesc != NULL);
   832	
   833		cache_free_zspage(zspage);
   834	
   835		class_stat_sub(class, ZS_OBJS_ALLOCATED, class->objs_per_zspage);
   836		atomic_long_sub(class->pages_per_zspage, &pool->pages_allocated);
   837	}
   838	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

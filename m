Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8022598
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 03:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694747256; x=1726283256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WUJoZQKEkRd0v53q+31nPX9JZSrHna/PPeJRCg3Wtxc=;
  b=NCmqPrXUuQxdjqXBbGvgHn0WBywB9d0v12gXWVENYekypH8dZD33e2rV
   UKSiMVXArJWOBidzEuSBHklYWrWDYwNGd7J6YJIee9HdJCW6nVIt9FC99
   z+7/1e6dnVnL9jCnDHYZKYgpaT8bRjQLVAAdlkumCk3Gh9mrH8r8DYQlk
   a+ASmFAVZ8dVeMc933/PePg8soSnkoBSwNcZIjOIixRQuLrlqvUAsP9P5
   6Px8szNMsYgYaGFP5+Ehl0IVohJ8EmmKHDzFORz65x7cMWjkV6tRqJh/8
   Qqfst8jbZWeqGoUs/IycHXNw5bLZh7YNt8S7SDt4C8PbejoWG9wdBLDk/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="443203293"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="443203293"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 20:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="868516765"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="868516765"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Sep 2023 20:07:34 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgzB5-0002MX-2g;
	Fri, 15 Sep 2023 03:07:31 +0000
Date: Fri, 15 Sep 2023 11:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 436/463]
 drivers/net/ethernet/google/gve/gve_rx_dqo.c:495:23: error: 'struct
 gve_rx_ring' has no member named 'ctx'
Message-ID: <202309151141.Be7lzNfv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   fb9b620cd8d946c1fe2713d2103bb17711dd77d8
commit: 45f15f6e1de0334918eec4de6eb28f68ac122778 [436/463] gve: fix frag_list chaining
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20230915/202309151141.Be7lzNfv-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151141.Be7lzNfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309151141.Be7lzNfv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/google/gve/gve_rx_dqo.c: In function 'gve_rx_append_frags':
>> drivers/net/ethernet/google/gve/gve_rx_dqo.c:495:23: error: 'struct gve_rx_ring' has no member named 'ctx'
     495 |                 if (rx->ctx.skb_tail == rx->ctx.skb_head)
         |                       ^~
   drivers/net/ethernet/google/gve/gve_rx_dqo.c:495:43: error: 'struct gve_rx_ring' has no member named 'ctx'
     495 |                 if (rx->ctx.skb_tail == rx->ctx.skb_head)
         |                                           ^~
   In file included from include/net/net_namespace.h:39,
                    from include/linux/netdevice.h:37,
                    from drivers/net/ethernet/google/gve/gve.h:11,
                    from drivers/net/ethernet/google/gve/gve_rx_dqo.c:7:
   drivers/net/ethernet/google/gve/gve_rx_dqo.c:496:38: error: 'struct gve_rx_ring' has no member named 'ctx'
     496 |                         skb_shinfo(rx->ctx.skb_head)->frag_list = skb;
         |                                      ^~
   include/linux/skbuff.h:1510:69: note: in definition of macro 'skb_shinfo'
    1510 | #define skb_shinfo(SKB) ((struct skb_shared_info *)(skb_end_pointer(SKB)))
         |                                                                     ^~~
   drivers/net/ethernet/google/gve/gve_rx_dqo.c:498:27: error: 'struct gve_rx_ring' has no member named 'ctx'
     498 |                         rx->ctx.skb_tail->next = skb;
         |                           ^~


vim +495 drivers/net/ethernet/google/gve/gve_rx_dqo.c

   477	
   478	/* Chains multi skbs for single rx packet.
   479	 * Returns 0 if buffer is appended, -1 otherwise.
   480	 */
   481	static int gve_rx_append_frags(struct napi_struct *napi,
   482				       struct gve_rx_buf_state_dqo *buf_state,
   483				       u16 buf_len, struct gve_rx_ring *rx,
   484				       struct gve_priv *priv)
   485	{
   486		int num_frags = skb_shinfo(rx->skb_tail)->nr_frags;
   487	
   488		if (unlikely(num_frags == MAX_SKB_FRAGS)) {
   489			struct sk_buff *skb;
   490	
   491			skb = napi_alloc_skb(napi, 0);
   492			if (!skb)
   493				return -1;
   494	
 > 495			if (rx->ctx.skb_tail == rx->ctx.skb_head)
   496				skb_shinfo(rx->ctx.skb_head)->frag_list = skb;
   497			else
   498				rx->ctx.skb_tail->next = skb;
   499			rx->skb_tail = skb;
   500			num_frags = 0;
   501		}
   502		if (rx->skb_tail != rx->skb_head) {
   503			rx->skb_head->len += buf_len;
   504			rx->skb_head->data_len += buf_len;
   505			rx->skb_head->truesize += priv->data_buffer_size_dqo;
   506		}
   507	
   508		skb_add_rx_frag(rx->skb_tail, num_frags,
   509				buf_state->page_info.page,
   510				buf_state->page_info.page_offset,
   511				buf_len, priv->data_buffer_size_dqo);
   512		gve_dec_pagecnt_bias(&buf_state->page_info);
   513	
   514		return 0;
   515	}
   516	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

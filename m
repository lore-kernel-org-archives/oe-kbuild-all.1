Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF991C6A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 15:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5qCLimj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699629625; x=1731165625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DJ2L2mmfez88GcUhF+cvl8hAs3hjajSnHedrmk82xBM=;
  b=D5qCLimjzoUaH/HnUwB5OYVmogZRNosUkfyJ0aoCma6oaCxn9Hu1XcZJ
   pPc0y6RlBE/bsliEd635dmDZwl3QlKbUX+mBaeQb8T/lnTQcrCRkMl4P0
   nY8dCgFU4+tL4LYfDTCAsCFZHZDBN3ppxg4oNmX/M/syblFprFvtTGaQG
   EIXDggp9jqhiLCwTxngL1ePA3lAPNC3g7TXxRWzvfCJh3QGvjnyV+xSj7
   DGe639nR2GjTBzV7kiX7sXgqs0MG2uyJg5K4tR7tduIE2W7prtaxchFws
   2JfvmGfZhj7r9bC5IJ2y5SaHPFQLv44TbhF93uusxmdybOXR/SxguMrQW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387360286"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="387360286"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 07:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763779440"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="763779440"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 07:20:22 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1TIy-0009gI-09;
	Fri, 10 Nov 2023 15:20:20 +0000
Date: Fri, 10 Nov 2023 23:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hopps <chopps@chopps.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC ipsec-next 8/8] iptfs: impl: add new iptfs xfrm mode impl
Message-ID: <202311102335.7rTgW6l1-lkp@intel.com>
References: <20231110113719.3055788-9-chopps@chopps.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110113719.3055788-9-chopps@chopps.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on klassert-ipsec-next/master]
[also build test WARNING on klassert-ipsec/master netfilter-nf/main linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Hopps/iptfs-uapi-ip-add-ip_tfs_-_hdr-packet-formats/20231110-203822
base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git master
patch link:    https://lore.kernel.org/r/20231110113719.3055788-9-chopps%40chopps.org
patch subject: [RFC ipsec-next 8/8] iptfs: impl: add new iptfs xfrm mode impl
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231110/202311102335.7rTgW6l1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311102335.7rTgW6l1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311102335.7rTgW6l1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/xfrm/xfrm_iptfs.c:468:17: warning: no previous prototype for 'iptfs_pskb_add_frags' [-Wmissing-prototypes]
     468 | struct sk_buff *iptfs_pskb_add_frags(struct sk_buff *tpl,
         |                 ^~~~~~~~~~~~~~~~~~~~
   net/xfrm/xfrm_iptfs.c: In function '__iptfs_reassem_done':
>> net/xfrm/xfrm_iptfs.c:629:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     629 |         int ret;
         |             ^~~
   net/xfrm/xfrm_iptfs.c: In function '__reorder_drop':
>> net/xfrm/xfrm_iptfs.c:1262:13: warning: variable 'wantseq' set but not used [-Wunused-but-set-variable]
    1262 |         u64 wantseq = xtfs->w_wantseq;
         |             ^~~~~~~
   net/xfrm/xfrm_iptfs.c: In function '__reorder_this':
   net/xfrm/xfrm_iptfs.c:1311:13: warning: variable 'wantseq' set but not used [-Wunused-but-set-variable]
    1311 |         u64 wantseq = xtfs->w_wantseq;
         |             ^~~~~~~
   net/xfrm/xfrm_iptfs.c: In function '__reorder_future_shifts':
>> net/xfrm/xfrm_iptfs.c:1433:13: warning: variable 'last_drop_seq' set but not used [-Wunused-but-set-variable]
    1433 |         u64 last_drop_seq = xtfs->w_wantseq;
         |             ^~~~~~~~~~~~~
   net/xfrm/xfrm_iptfs.c: In function 'iptfs_drop_timer':
>> net/xfrm/xfrm_iptfs.c:1653:20: warning: variable 'fcount' set but not used [-Wunused-but-set-variable]
    1653 |         u32 count, fcount;
         |                    ^~~~~~
   net/xfrm/xfrm_iptfs.c: In function 'iptfs_delay_timer':
>> net/xfrm/xfrm_iptfs.c:2396:16: warning: variable 'osize' set but not used [-Wunused-but-set-variable]
    2396 |         size_t osize;
         |                ^~~~~
   net/xfrm/xfrm_iptfs.c: In function 'iptfs_encap_add_ipv4':
>> net/xfrm/xfrm_iptfs.c:2444:13: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
    2444 |         int flags;
         |             ^~~~~
--
>> net/xfrm/xfrm_iptfs.c:199: warning: Function parameter or member 'skb' not described in 'skb_head_to_frag'
>> net/xfrm/xfrm_iptfs.c:199: warning: Function parameter or member 'frag' not described in 'skb_head_to_frag'
>> net/xfrm/xfrm_iptfs.c:537: warning: Function parameter or member 'xtfs' not described in 'iptfs_input_save_runt'
>> net/xfrm/xfrm_iptfs.c:537: warning: Function parameter or member 'seq' not described in 'iptfs_input_save_runt'
>> net/xfrm/xfrm_iptfs.c:537: warning: Function parameter or member 'buf' not described in 'iptfs_input_save_runt'
>> net/xfrm/xfrm_iptfs.c:537: warning: Function parameter or member 'len' not described in 'iptfs_input_save_runt'
>> net/xfrm/xfrm_iptfs.c:552: warning: Function parameter or member 'data' not described in '__iptfs_iphlen'
>> net/xfrm/xfrm_iptfs.c:570: warning: Function parameter or member 'data' not described in '__iptfs_iplen'
>> net/xfrm/xfrm_iptfs.c:589: warning: Function parameter or member 'x' not described in 'iptfs_complete_inner_skb'
>> net/xfrm/xfrm_iptfs.c:589: warning: Function parameter or member 'skb' not described in 'iptfs_complete_inner_skb'
>> net/xfrm/xfrm_iptfs.c:644: warning: Function parameter or member 'xtfs' not described in 'iptfs_reassem_abort'
>> net/xfrm/xfrm_iptfs.c:644: warning: expecting prototype for iptfs_reassem_done(). Prototype was for iptfs_reassem_abort() instead
>> net/xfrm/xfrm_iptfs.c:652: warning: Function parameter or member 'xtfs' not described in 'iptfs_reassem_done'
>> net/xfrm/xfrm_iptfs.c:665: warning: Function parameter or member 'xtfs' not described in 'iptfs_reassem_cont'
>> net/xfrm/xfrm_iptfs.c:665: warning: Function parameter or member 'seq' not described in 'iptfs_reassem_cont'
>> net/xfrm/xfrm_iptfs.c:665: warning: Function parameter or member 'st' not described in 'iptfs_reassem_cont'
>> net/xfrm/xfrm_iptfs.c:665: warning: Function parameter or member 'skb' not described in 'iptfs_reassem_cont'
>> net/xfrm/xfrm_iptfs.c:665: warning: Function parameter or member 'data' not described in 'iptfs_reassem_cont'
>> net/xfrm/xfrm_iptfs.c:665: warning: Function parameter or member 'blkoff' not described in 'iptfs_reassem_cont'
>> net/xfrm/xfrm_iptfs.c:665: warning: Function parameter or member 'list' not described in 'iptfs_reassem_cont'
   net/xfrm/xfrm_iptfs.c:877: warning: Function parameter or member 'x' not described in 'iptfs_input_ordered'
   net/xfrm/xfrm_iptfs.c:877: warning: Function parameter or member 'skb' not described in 'iptfs_input_ordered'
   net/xfrm/xfrm_iptfs.c:1648: warning: Function parameter or member 'me' not described in 'iptfs_drop_timer'
   net/xfrm/xfrm_iptfs.c:2441: warning: Function parameter or member 'x' not described in 'iptfs_encap_add_ipv4'
   net/xfrm/xfrm_iptfs.c:2441: warning: Function parameter or member 'skb' not described in 'iptfs_encap_add_ipv4'
   net/xfrm/xfrm_iptfs.c:2484: warning: Function parameter or member 'x' not described in 'iptfs_encap_add_ipv6'
   net/xfrm/xfrm_iptfs.c:2484: warning: Function parameter or member 'skb' not described in 'iptfs_encap_add_ipv6'
   net/xfrm/xfrm_iptfs.c:2527: warning: Function parameter or member 'x' not described in 'iptfs_prepare_output'
   net/xfrm/xfrm_iptfs.c:2527: warning: Function parameter or member 'skb' not described in 'iptfs_prepare_output'
   net/xfrm/xfrm_iptfs.c:2550: warning: Function parameter or member 'x' not described in '__iptfs_get_inner_mtu'
   net/xfrm/xfrm_iptfs.c:2550: warning: Function parameter or member 'outer_mtu' not described in '__iptfs_get_inner_mtu'
   net/xfrm/xfrm_iptfs.c:2568: warning: expecting prototype for iptfs_get_mtu(). Prototype was for iptfs_get_inner_mtu() instead
   net/xfrm/xfrm_iptfs.c:2583: warning: Function parameter or member 'net' not described in 'iptfs_user_init'
   net/xfrm/xfrm_iptfs.c:2583: warning: Function parameter or member 'x' not described in 'iptfs_user_init'
   net/xfrm/xfrm_iptfs.c:2583: warning: Function parameter or member 'attrs' not described in 'iptfs_user_init'


vim +/iptfs_pskb_add_frags +468 net/xfrm/xfrm_iptfs.c

   449	
   450	/**
   451	 * iptfs_pskb_add_frags() - Create and add frags into a new sk_buff.
   452	 * @tpl: template to create new skb from.
   453	 * @walk: The source for fragments to add.
   454	 * @off: The offset into @walk to add frags from, also used with @st and
   455	 *       @copy_len.
   456	 * @len: The length of data to add covering frags from @walk into @skb.
   457	 *       This must be <= @skblen.
   458	 * @st: The sequence state to copy from into the new head skb.
   459	 * @copy_len: Copy @copy_len bytes from @st at offset @off into the new skb
   460	 *            linear space.
   461	 *
   462	 * Create a new sk_buff `skb` using the template @tpl. Copy @copy_len bytes from
   463	 * @st into the new skb linear space, and then add shared fragments from the
   464	 * frag walk for the remaining @len of data (i.e., @len - @copy_len bytes).
   465	 *
   466	 * Return: The newly allocated sk_buff `skb` or NULL if an error occurs.
   467	 */
 > 468	struct sk_buff *iptfs_pskb_add_frags(struct sk_buff *tpl,
   469					     struct skb_frag_walk *walk, u32 off,
   470					     u32 len, struct skb_seq_state *st,
   471					     u32 copy_len)
   472	{
   473		struct sk_buff *skb;
   474	
   475		skb = iptfs_alloc_skb(tpl, copy_len, false);
   476		if (!skb)
   477			return NULL;
   478	
   479		/* this should not normally be happening */
   480		if (!skb_can_add_frags(skb, walk, off + copy_len, len - copy_len)) {
   481			kfree_skb(skb);
   482			return NULL;
   483		}
   484	
   485		if (copy_len &&
   486		    skb_copy_bits_seq(st, off, skb_put(skb, copy_len), copy_len)) {
   487			XFRM_INC_STATS(dev_net(st->root_skb->dev),
   488				       LINUX_MIB_XFRMINERROR);
   489			kfree_skb(skb);
   490			return NULL;
   491		}
   492	
   493		skb_add_frags(skb, walk, off + copy_len, len - copy_len);
   494		return skb;
   495	}
   496	
   497	/**
   498	 * iptfs_pskb_extract_seq() - Create and load data into a new sk_buff.
   499	 * @skblen: the total data size for `skb`.
   500	 * @st: The source for the rest of the data to copy into `skb`.
   501	 * @off: The offset into @st to copy data from.
   502	 * @len: The length of data to copy from @st into `skb`. This must be <=
   503	 *       @skblen.
   504	 *
   505	 * Create a new sk_buff `skb` with @skblen of packet data space. If non-zero,
   506	 * copy @rlen bytes of @runt into `skb`. Then using seq functions copy @len
   507	 * bytes from @st into `skb` starting from @off.
   508	 *
   509	 * It is an error for @len to be greater than the amount of data left in @st.
   510	 *
   511	 * Return: The newly allocated sk_buff `skb` or NULL if an error occurs.
   512	 */
   513	static struct sk_buff *
   514	iptfs_pskb_extract_seq(u32 skblen, struct skb_seq_state *st, u32 off, int len)
   515	{
   516		struct sk_buff *skb = iptfs_alloc_skb(st->root_skb, skblen, false);
   517	
   518		if (!skb)
   519			return NULL;
   520		if (skb_copy_bits_seq(st, off, skb_put(skb, len), len)) {
   521			XFRM_INC_STATS(dev_net(st->root_skb->dev),
   522				       LINUX_MIB_XFRMINERROR);
   523			kfree_skb(skb);
   524			return NULL;
   525		}
   526		return skb;
   527	}
   528	
   529	/**
   530	 * iptfs_input_save_runt() - save data in xtfs runt space.
   531	 *
   532	 * Save the small (`len`) start of a fragmented packet in `buf` in the xtfs data
   533	 * runt space.
   534	 */
   535	static inline void iptfs_input_save_runt(struct xfrm_iptfs_data *xtfs, u64 seq,
   536						 u8 *buf, int len)
 > 537	{
   538		BUG_ON(xtfs->ra_newskb); /* we won't have a new SKB yet */
   539	
   540		memcpy(xtfs->ra_runt, buf, len);
   541	
   542		xtfs->ra_runtlen = len;
   543		xtfs->ra_wantseq = seq + 1;
   544	}
   545	
   546	/**
   547	 * __iptfs_iphlen() - return the v4/v6 header length using packet data.
   548	 *
   549	 * The version data is expected to be valid (i.e., either 4 or 6).
   550	 */
   551	static u32 __iptfs_iphlen(u8 *data)
 > 552	{
   553		struct iphdr *iph = (struct iphdr *)data;
   554	
   555		if (iph->version == 0x4)
   556			return sizeof(*iph);
   557		BUG_ON(iph->version != 0x6);
   558		return sizeof(struct ipv6hdr);
   559	}
   560	
   561	/**
   562	 * __iptfs_iplen() - return the v4/v6 length using packet data.
   563	 *
   564	 * Grab the IPv4 or IPv6 length value in the start of the inner packet header
   565	 * pointed to by `data`. Assumes data len is enough for the length field only.
   566	 *
   567	 * The version data is expected to be valid (i.e., either 4 or 6).
   568	 */
   569	static u32 __iptfs_iplen(u8 *data)
 > 570	{
   571		struct iphdr *iph = (struct iphdr *)data;
   572	
   573		if (iph->version == 0x4)
   574			return ntohs(iph->tot_len);
   575		BUG_ON(iph->version != 0x6);
   576		return ntohs(((struct ipv6hdr *)iph)->payload_len) +
   577		       sizeof(struct ipv6hdr);
   578	}
   579	
   580	/**
   581	 * iptfs_complete_inner_skb() - finish preparing the inner packet for gro recv.
   582	 *
   583	 * Finish the standard xfrm processing on the inner packet prior to sending back
   584	 * through gro_cells_receive. We do this separately b/c we are building a list
   585	 * of packets in the hopes that one day a list will be taken by
   586	 * xfrm_input.
   587	 */
   588	static void iptfs_complete_inner_skb(struct xfrm_state *x, struct sk_buff *skb)
 > 589	{
   590		skb_reset_network_header(skb);
   591	
   592		/* The packet is going back through gro_cells_receive no need to
   593		 * set this.
   594		 */
   595		skb_reset_transport_header(skb);
   596	
   597		/* Packet already has checksum value set. */
   598		skb->ip_summed = CHECKSUM_NONE;
   599	
   600		/* Our skb will contain the header data copied when this outer packet
   601		 * which contained the start of this inner packet. This is true
   602		 * when we allocate a new skb as well as when we reuse the existing skb.
   603		 */
   604		if (ip_hdr(skb)->version == 0x4) {
   605			struct iphdr *iph = ip_hdr(skb);
   606	
   607			if (x->props.flags & XFRM_STATE_DECAP_DSCP)
   608				ipv4_copy_dscp(XFRM_MODE_SKB_CB(skb)->tos, iph);
   609			if (!(x->props.flags & XFRM_STATE_NOECN))
   610				if (INET_ECN_is_ce(XFRM_MODE_SKB_CB(skb)->tos))
   611					IP_ECN_set_ce(iph);
   612	
   613			skb->protocol = htons(ETH_P_IP);
   614		} else {
   615			struct ipv6hdr *iph = ipv6_hdr(skb);
   616	
   617			if (x->props.flags & XFRM_STATE_DECAP_DSCP)
   618				ipv6_copy_dscp(XFRM_MODE_SKB_CB(skb)->tos, iph);
   619			if (!(x->props.flags & XFRM_STATE_NOECN))
   620				if (INET_ECN_is_ce(XFRM_MODE_SKB_CB(skb)->tos))
   621					IP6_ECN_set_ce(skb, iph);
   622	
   623			skb->protocol = htons(ETH_P_IPV6);
   624		}
   625	}
   626	
   627	static inline void __iptfs_reassem_done(struct xfrm_iptfs_data *xtfs, bool free)
   628	{
 > 629		int ret;
   630	
   631		assert_spin_locked(&xtfs->drop_lock);
   632	
   633		/* We don't care if it works locking takes care of things */
   634		ret = hrtimer_try_to_cancel(&xtfs->drop_timer);
   635		if (free)
   636			kfree_skb(xtfs->ra_newskb);
   637		xtfs->ra_newskb = NULL;
   638	}
   639	
   640	/**
   641	 * iptfs_reassem_done() - In-progress packet is aborted free the state.
   642	 */
   643	static inline void iptfs_reassem_abort(struct xfrm_iptfs_data *xtfs)
 > 644	{
   645		__iptfs_reassem_done(xtfs, true);
   646	}
   647	
   648	/**
   649	 * iptfs_reassem_done() - In-progress packet is complete, clear the state.
   650	 */
   651	static inline void iptfs_reassem_done(struct xfrm_iptfs_data *xtfs)
 > 652	{
   653		__iptfs_reassem_done(xtfs, false);
   654	}
   655	
   656	/**
   657	 * iptfs_reassem_cont() - Continue the reassembly of an inner packets.
   658	 *
   659	 * Process an IPTFS payload that has a non-zero `blkoff` or when we are
   660	 * expecting the continuation b/c we have a runt or in-progress packet.
   661	 */
   662	static u32 iptfs_reassem_cont(struct xfrm_iptfs_data *xtfs, u64 seq,
   663				      struct skb_seq_state *st, struct sk_buff *skb,
   664				      u32 data, u32 blkoff, struct list_head *list)
 > 665	{
   666		struct skb_frag_walk _fragwalk;
   667		struct skb_frag_walk *fragwalk = NULL;
   668		struct sk_buff *newskb = xtfs->ra_newskb;
   669		u32 remaining = skb->len - data;
   670		u32 runtlen = xtfs->ra_runtlen;
   671		u32 copylen, fraglen, ipremain, iphlen, iphremain, rrem;
   672	
   673		/* Handle packet fragment we aren't expecting */
   674		if (!runtlen && !xtfs->ra_newskb)
   675			return data + min(blkoff, remaining);
   676	
   677		/* Important to remember that input to this function is an ordered
   678		 * packet stream (unless the user disabled the reorder window). Thus if
   679		 * we are waiting for, and expecting the next packet so we can continue
   680		 * assembly, a newer sequence number indicates older ones are not coming
   681		 * (or if they do should be ignored). Technically we can receive older
   682		 * ones when the reorder window is disabled; however, the user should
   683		 * have disabled fragmentation in this case, and regardless we don't
   684		 * deal with it.
   685		 *
   686		 * blkoff could be zero if the stream is messed up (or it's an all pad
   687		 * insertion) be careful to handle that case in each of the below
   688		 */
   689	
   690		/* Too old case: This can happen when the reorder window is disabled so
   691		 * ordering isn't actually guaranteed.
   692		 */
   693		if (seq < xtfs->ra_wantseq)
   694			return data + remaining;
   695	
   696		/* Too new case: We missed what we wanted cleanup. */
   697		if (seq > xtfs->ra_wantseq) {
   698			XFRM_INC_STATS(dev_net(skb->dev),
   699				       LINUX_MIB_XFRMINIPTFSERROR);
   700			goto abandon;
   701		}
   702	
   703		if (blkoff == 0) {
   704			if ((*skb->data & 0xF0) != 0) {
   705				XFRM_INC_STATS(dev_net(skb->dev),
   706					       LINUX_MIB_XFRMINIPTFSERROR);
   707				goto abandon;
   708			}
   709			/* Handle all pad case, advance expected sequence number.
   710			 * (RFC 9347 S2.2.3)
   711			 */
   712			xtfs->ra_wantseq++;
   713			/* will end parsing */
   714			return data + remaining;
   715		}
   716	
   717		if (runtlen) {
   718			BUG_ON(xtfs->ra_newskb);
   719	
   720			/* Regardless of what happens we're done with the runt */
   721			xtfs->ra_runtlen = 0;
   722	
   723			/* The start of this inner packet was at the very end of the last
   724			 * iptfs payload which didn't include enough for the ip header
   725			 * length field. We must have *at least* that now.
   726			 */
   727			rrem = sizeof(xtfs->ra_runt) - runtlen;
   728			if (remaining < rrem || blkoff < rrem) {
   729				XFRM_INC_STATS(dev_net(skb->dev),
   730					       LINUX_MIB_XFRMINIPTFSERROR);
   731				goto abandon;
   732			}
   733	
   734			/* fill in the runt data */
   735			if (skb_copy_bits_seq(st, data, &xtfs->ra_runt[runtlen],
   736					      rrem)) {
   737				XFRM_INC_STATS(dev_net(skb->dev),
   738					       LINUX_MIB_XFRMINBUFFERERROR);
   739				goto abandon;
   740			}
   741	
   742			/* We have enough data to get the ip length value now,
   743			 * allocate an in progress skb
   744			 */
   745			ipremain = __iptfs_iplen(xtfs->ra_runt);
   746			if (ipremain < sizeof(xtfs->ra_runt)) {
   747				/* length has to be at least runtsize large */
   748				XFRM_INC_STATS(dev_net(skb->dev),
   749					       LINUX_MIB_XFRMINIPTFSERROR);
   750				goto abandon;
   751			}
   752	
   753			/* For the runt case we don't attempt sharing currently. NOTE:
   754			 * Currently, this IPTFS implementation will not create runts.
   755			 */
   756	
   757			newskb = iptfs_alloc_skb(skb, ipremain, false);
   758			if (!newskb) {
   759				XFRM_INC_STATS(dev_net(skb->dev),
   760					       LINUX_MIB_XFRMINERROR);
   761				goto abandon;
   762			}
   763			xtfs->ra_newskb = newskb;
   764	
   765			/* Copy the runt data into the buffer, but leave data
   766			 * pointers the same as normal non-runt case. The extra `rrem`
   767			 * recopied bytes are basically cacheline free. Allows using
   768			 * same logic below to complete.
   769			 */
   770			memcpy(skb_put(newskb, runtlen), xtfs->ra_runt,
   771			       sizeof(xtfs->ra_runt));
   772		}
   773	
   774		/* Continue reassembling the packet */
   775		ipremain = __iptfs_iplen(newskb->data);
   776		iphlen = __iptfs_iphlen(newskb->data);
   777	
   778		/* Sanity check, we created the newskb knowing the IP length so the IP
   779		 * length can't now be shorter.
   780		 */
   781		BUG_ON(newskb->len > ipremain);
   782	
   783		ipremain -= newskb->len;
   784		if (blkoff < ipremain) {
   785			/* Corrupt data, we don't have enough to complete the packet */
   786			XFRM_INC_STATS(dev_net(skb->dev), LINUX_MIB_XFRMINIPTFSERROR);
   787			goto abandon;
   788		}
   789	
   790		/* We want the IP header in linear space */
   791		if (newskb->len < iphlen)  {
   792			iphremain = iphlen - newskb->len;
   793			if (blkoff < iphremain) {
   794				XFRM_INC_STATS(dev_net(skb->dev),
   795					       LINUX_MIB_XFRMINIPTFSERROR);
   796				goto abandon;
   797			}
   798			fraglen = min(blkoff, remaining);
   799			copylen = min(fraglen, iphremain);
   800			BUG_ON(skb_tailroom(newskb) < copylen);
   801			if (skb_copy_bits_seq(st, data, skb_put(newskb, copylen), copylen)) {
   802				XFRM_INC_STATS(dev_net(skb->dev),
   803					       LINUX_MIB_XFRMINBUFFERERROR);
   804				goto abandon;
   805			}
   806			/* this is a silly condition that might occur anyway */
   807			if (copylen < iphremain) {
   808				xtfs->ra_wantseq++;
   809				return data + fraglen;
   810			}
   811			/* update data and things derived from it */
   812			data += copylen;
   813			blkoff -= copylen;
   814			remaining -= copylen;
   815			ipremain -= copylen;
   816		}
   817	
   818		fraglen = min(blkoff, remaining);
   819		copylen = min(fraglen, ipremain);
   820	
   821		/* If we may have the opportunity to share prepare a fragwalk. */
   822		if (!skb_has_frag_list(skb) && !skb_has_frag_list(newskb) &&
   823		    (skb->head_frag || skb->len == skb->data_len) &&
   824		    skb->pp_recycle == newskb->pp_recycle) {
   825			fragwalk = &_fragwalk;
   826			skb_prepare_frag_walk(skb, data, fragwalk);
   827		}
   828	
   829		/* Try share then copy. */
   830		if (fragwalk && skb_can_add_frags(newskb, fragwalk, data, copylen)) {
   831			u32 leftover;
   832	
   833			leftover = skb_add_frags(newskb, fragwalk, data, copylen);
   834			BUG_ON(leftover != 0);
   835		} else {
   836			/* We verified this was true in the main receive routine */
   837			BUG_ON(skb_tailroom(newskb) < copylen);
   838	
   839			/* copy fragment data into newskb */
   840			if (skb_copy_bits_seq(st, data, skb_put(newskb, copylen), copylen)) {
   841				XFRM_INC_STATS(dev_net(skb->dev),
   842					       LINUX_MIB_XFRMINBUFFERERROR);
   843				goto abandon;
   844			}
   845		}
   846	
   847		if (copylen < ipremain) {
   848			xtfs->ra_wantseq++;
   849		} else {
   850			/* We are done with packet reassembly! */
   851			BUG_ON(copylen != ipremain);
   852			iptfs_reassem_done(xtfs);
   853			iptfs_complete_inner_skb(xtfs->x, newskb);
   854			list_add_tail(&newskb->list, list);
   855		}
   856	
   857		/* will continue on to new data block or end */
   858		return data + fraglen;
   859	
   860	abandon:
   861		if (xtfs->ra_newskb) {
   862			iptfs_reassem_abort(xtfs);
   863		} else {
   864			xtfs->ra_runtlen = 0;
   865			xtfs->ra_wantseq = 0;
   866		}
   867		/* skip past fragment, maybe to end */
   868		return data + min(blkoff, remaining);
   869	}
   870	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

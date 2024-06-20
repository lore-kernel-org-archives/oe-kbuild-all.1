Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0E01AAE2F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 10:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718880302; cv=none; b=bXPAD3Ho8+rY2+jW85KDN0KURdnq8SF/oeSSMGWUNlyuEraNUFz9UBZUSuB1vkGSjmktX1DDBDdaZ7enVEuykjvBK8zautT0ncTXRgnM+JqBiIsVlcK+PPmm+YFhHopgeg11IfPsIQFLnYKEzfnZGhtP5N6G7m3ypG8S6dyb0C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718880302; c=relaxed/simple;
	bh=XIkXunG//2SaMy9ONqX0qew92F2k3aCU7aI03XWNYv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X7ullYM+fIfgBbKiKFEu/0E1n3WcxVZ9MNlxiV8vyIvBSbtCE4Xs2GcFtXF8uiyz5mALCdosjvvfcTZ2bJ0ckh7PAh6f1Wq7p2WMU592ZjnILwvF7gvM8PoWZCWj/bdlNBSIrwBDoUUcmbwUppB5qhfCzmT46akDOD0+BB/l/pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiictNuu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiictNuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718880300; x=1750416300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XIkXunG//2SaMy9ONqX0qew92F2k3aCU7aI03XWNYv0=;
  b=RiictNuuT++DskD4wcrQMhdVfpd5yX6uQwHzFbRDY1g60p51wpJcTE+q
   l91FO9sklv5gsqbS0mXsYGq9TRycTBEF0FAAbWOvEEhpf+xY46Kd2ADw2
   qj7WYU1iFhJGFXfJv+xWfyk44yfXXmYaD0C4ldpbklUcnVFXocCIYHsHt
   ExW2EfcZqVrnWMJfps0FdYEBLKbIYV8qOTV0DyNoHmcvVIAPbFoup6H71
   wuFfRPe9EDN8X5EkjmCAJc2xK34GpHfVgSU7gjhRHVhj/uClTkwhVyXoE
   uIIAC/jHnikNeS5h3aAxl4INBJ2JOohfZytu6XjyuP8aJNUslsyswu5tS
   A==;
X-CSE-ConnectionGUID: k/+gspkET5+iZRXtOgGoMQ==
X-CSE-MsgGUID: QR9hkj3lRw6SC8SORGOFEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="27254634"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="27254634"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 03:44:57 -0700
X-CSE-ConnectionGUID: wLWBzgNrRVW51AMSVms9aA==
X-CSE-MsgGUID: FvaFWG5eQaeW50P/UI5TFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="42142058"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jun 2024 03:44:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKFHi-0007Xc-06;
	Thu, 20 Jun 2024 10:44:54 +0000
Date: Thu, 20 Jun 2024 18:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 48/61] include/net/libeth/xdp.h:653:57:
 warning: suggest parentheses around '+' in operand of '&'
Message-ID: <202406201840.rK6oI9Kt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   884c4a5ded135f76df131a155c1d6a1e62b04fb2
commit: 1dc0d942437f90d442adc40c77e4ffb6dae0bfee [48/61] libeth: add a couple of XDP helpers (libeth_xdp)
config: x86_64-randconfig-012-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201840.rK6oI9Kt-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201840.rK6oI9Kt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201840.rK6oI9Kt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <command-line>:
   include/net/libeth/xdp.h: In function 'libeth_xdp_tx_fill_buf':
>> include/net/libeth/xdp.h:653:57: warning: suggest parentheses around '+' in operand of '&' [-Wparentheses]
     653 |                                     skb_frag_size(frag) & LIBETH_XDP_TX_FLAGS),
         |                                                         ^
   include/linux/compiler_types.h:467:23: note: in definition of macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:487:9: note: in expansion of macro '_compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   include/net/libeth/xdp.h:405:27: note: in expansion of macro 'FIELD_PREP'
     405 |         .opts = ((flen) | FIELD_PREP(GENMASK_ULL(63, 32), (__VA_ARGS__ + 0)))
         |                           ^~~~~~~~~~
   include/net/libeth/xdp.h:652:17: note: in expansion of macro '__libeth_xdp_tx_len'
     652 |                 __libeth_xdp_tx_len(skb_frag_size(frag) & LIBETH_XDP_TX_LEN,
         |                 ^~~~~~~~~~~~~~~~~~~
>> include/net/libeth/xdp.h:653:57: warning: suggest parentheses around '+' in operand of '&' [-Wparentheses]
     653 |                                     skb_frag_size(frag) & LIBETH_XDP_TX_FLAGS),
         |                                                         ^
   include/linux/compiler_types.h:467:23: note: in definition of macro '__compiletime_assert'
     467 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:487:9: note: in expansion of macro '_compiletime_assert'
     487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   include/net/libeth/xdp.h:405:27: note: in expansion of macro 'FIELD_PREP'
     405 |         .opts = ((flen) | FIELD_PREP(GENMASK_ULL(63, 32), (__VA_ARGS__ + 0)))
         |                           ^~~~~~~~~~
   include/net/libeth/xdp.h:652:17: note: in expansion of macro '__libeth_xdp_tx_len'
     652 |                 __libeth_xdp_tx_len(skb_frag_size(frag) & LIBETH_XDP_TX_LEN,
         |                 ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/fortify-string.h:5,
                    from include/linux/string.h:374,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:13,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/netdevice.h:24,
                    from include/trace/events/xdp.h:8,
                    from include/linux/bpf_trace.h:5,
                    from include/net/libeth/xdp.h:7,
                    from drivers/net/ethernet/intel/libeth/tx.c:4:
>> include/net/libeth/xdp.h:653:57: warning: suggest parentheses around '+' in operand of '&' [-Wparentheses]
     653 |                                     skb_frag_size(frag) & LIBETH_XDP_TX_FLAGS),
         |                                                         ^
   include/linux/bitfield.h:116:34: note: in definition of macro 'FIELD_PREP'
     116 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
         |                                  ^~~~
   include/net/libeth/xdp.h:652:17: note: in expansion of macro '__libeth_xdp_tx_len'
     652 |                 __libeth_xdp_tx_len(skb_frag_size(frag) & LIBETH_XDP_TX_LEN,
         |                 ^~~~~~~~~~~~~~~~~~~


vim +653 include/net/libeth/xdp.h

   593	
   594	#define __libeth_xdp_tx_fill_stats(sqe, desc, sinfo, ue, ud, us) do {	      \
   595		const struct libeth_xdp_tx_desc *ud = (desc);			      \
   596		const struct skb_shared_info *us;				      \
   597		struct libeth_sqe *ue = (sqe);					      \
   598										      \
   599		ue->nr_frags = 1;						      \
   600		ue->bytes = ud->len;						      \
   601										      \
   602		if (ud->flags & LIBETH_XDP_TX_MULTI) {				      \
   603			us = (sinfo);						      \
   604			ue->nr_frags += us->nr_frags;				      \
   605			ue->bytes += us->xdp_frags_size;			      \
   606		}								      \
   607	} while (0)
   608	/**
   609	 * libeth_xdp_tx_fill_stats - fill a &libeth_sqe with ``XDP_TX`` frame stats
   610	 * @sqe: SQ element to fill
   611	 * @desc: libeth_xdp Tx descriptor
   612	 * @sinfo: &skb_shared_info for this frame
   613	 *
   614	 * Internal helper for filling an SQE with the frame stats, do not use in
   615	 * drivers. Fills the number of frags and bytes for this frame.
   616	 */
   617	#define libeth_xdp_tx_fill_stats(sqe, desc, sinfo)			      \
   618		__libeth_xdp_tx_fill_stats(sqe, desc, sinfo, __UNIQUE_ID(sqe_),	      \
   619					   __UNIQUE_ID(desc_), __UNIQUE_ID(sinfo_))
   620	
   621	/**
   622	 * libeth_xdp_tx_fill_buf - internal helper to fill one ``XDP_TX`` &libeth_sqe
   623	 * @frm: XDP Tx frame from the bulk
   624	 * @i: index on the HW queue
   625	 * @sq: XDPSQ abstraction for the queue
   626	 * @priv: private data
   627	 *
   628	 * Return: XDP Tx descriptor with the synced DMA and other info to pass to
   629	 * the driver callback.
   630	 */
   631	static inline struct libeth_xdp_tx_desc
   632	libeth_xdp_tx_fill_buf(struct libeth_xdp_tx_frame frm, u32 i,
   633			       const struct libeth_xdpsq *sq, u64 priv)
   634	{
   635		struct libeth_xdp_tx_desc desc;
   636		struct skb_shared_info *sinfo;
   637		skb_frag_t *frag = &frm.frag;
   638		struct libeth_sqe *sqe;
   639	
   640		if (frm.len_fl & LIBETH_XDP_TX_FIRST) {
   641			sinfo = frm.data + frm.soff;
   642			skb_frag_fill_page_desc(frag, virt_to_page(frm.data),
   643						offset_in_page(frm.data),
   644						frm.len_fl);
   645		} else {
   646			sinfo = NULL;
   647		}
   648	
   649		desc = (typeof(desc)){
   650			.addr	= page_pool_get_dma_addr(skb_frag_page(frag)) +
   651				  skb_frag_off(frag),
   652			__libeth_xdp_tx_len(skb_frag_size(frag) & LIBETH_XDP_TX_LEN,
 > 653					    skb_frag_size(frag) & LIBETH_XDP_TX_FLAGS),
   654		};
   655	
   656		dma_sync_single_for_device(skb_frag_page(frag)->pp->p.dev, desc.addr,
   657					   desc.len, DMA_BIDIRECTIONAL);
   658	
   659		if (!sinfo)
   660			return desc;
   661	
   662		sqe = &sq->sqes[i];
   663		sqe->type = LIBETH_SQE_XDP_TX;
   664		sqe->sinfo = sinfo;
   665		libeth_xdp_tx_fill_stats(sqe, &desc, sinfo);
   666	
   667		return desc;
   668	}
   669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

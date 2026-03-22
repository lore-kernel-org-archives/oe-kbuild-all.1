Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE401E9919
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 05:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774158867; cv=none; b=Q2BFmVZtHzKLPMSNTXO9nihp1nDaAkojTK/Tcmt6naAZgt7sXuu7HxvfvDfRjKZy8GL8ntrJqe6vy6qwVh6VmNWCha8q7sOTomvYqAtPbI1c52FYgDN6KciAMbJ9WZp6fGa63LIJXPYa2aEBGRw1yOGenAXvf3rfuWF7u2Fm8Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774158867; c=relaxed/simple;
	bh=tVUUgGL3hMng6SVGFy+KSiQ0S7OM2xKiMY3Vdd4B0c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOr22ZaC3pDuOBnnzHPYGwz+q5bPoR4RlzFwRXak5ylODaafCO+z5ixYCB//oks5dQXukwfUWT8/4WkiwVUDCpiyvNJ4kfgsqqFKG/0spfiT4sBLOZRNj4Hr/5Zrogpla45fGkDupmQ14EZCl34UoH268Czdnz4GzMmPUoPAMfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmTHKRdJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmTHKRdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774158866; x=1805694866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tVUUgGL3hMng6SVGFy+KSiQ0S7OM2xKiMY3Vdd4B0c4=;
  b=mmTHKRdJDfIzEdldo4onQ9dCXQ5e7EBKm01Gl+7cPoPuSKjDu4y4boP2
   O0WZLB+YgohZtgsxWsSMBz48qM9ABJSVbBv1m2DmPWm6rQPDfk8EYp/Nx
   BdbfnTBXTb6WKr/vCr75yJaV1ZC5xb3Rm5k1cZGsaickUBpKKIZsceU/S
   b5BhpPsBvRgVtXY8VBPSzHlNM3QE+kbaPEX64NLYbS4xfah+QEah+G2xq
   BNQU1+Qh5EpJGYYUKr4qM3hUPakW/0Y97/yo+6k9tcmyWlzCx70bpzDE9
   bICvZEBLAoWd6YvZpVwywVDPtKqjvvoktb3H6W5PzkjeFc6Ckrga2yY3g
   A==;
X-CSE-ConnectionGUID: 2J8VedP7RNCdojfguqVM2A==
X-CSE-MsgGUID: r9OE46r5Tzu7ehBcK4Efqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="86561359"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="86561359"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 22:54:25 -0700
X-CSE-ConnectionGUID: vGZ44kHMT5CSYuUSBv+wXA==
X-CSE-MsgGUID: GKdMfRM/QVC+RbPiWVH+0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="228633018"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Mar 2026 22:54:25 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Bl4-000000001kt-2jG1;
	Sun, 22 Mar 2026 05:54:01 +0000
Date: Sun, 22 Mar 2026 13:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ralf Lici <ralf@mandelbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 05/15] ipxlat: add IPv6 packet validation path
Message-ID: <202603221313.BcXTvkkj-lkp@intel.com>
References: <20260319151230.655687-6-ralf@mandelbit.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319151230.655687-6-ralf@mandelbit.com>

Hi Ralf,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ralf-Lici/drivers-net-add-ipxlat-netdevice-skeleton-and-build-plumbing/20260321-005756
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260319151230.655687-6-ralf%40mandelbit.com
patch subject: [RFC net-next 05/15] ipxlat: add IPv6 packet validation path
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260322/202603221313.BcXTvkkj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221313.BcXTvkkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221313.BcXTvkkj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ipxlat/packet.c: In function 'ipxlat_v6_walk_hdrs':
>> drivers/net/ipxlat/packet.c:452:25: warning: variable 'ip6' set but not used [-Wunused-but-set-variable]
     452 |         struct ipv6hdr *ip6;
         |                         ^~~


vim +/ip6 +452 drivers/net/ipxlat/packet.c

   442	
   443	/* Basic IPv6 header walk: parse only the packet starting at l3_offset.
   444	 * It does not inspect quoted inner packets carried by ICMP errors.
   445	 */
   446	static int ipxlat_v6_walk_hdrs(struct sk_buff *skb, unsigned int l3_offset,
   447				       u8 *l4_proto, unsigned int *fhdr_offset,
   448				       unsigned int *l4_offset, bool *has_l4)
   449	{
   450		unsigned int frag_hdr_off, l4hdr_off;
   451		struct frag_hdr *frag;
 > 452		struct ipv6hdr *ip6;
   453		bool first_frag;
   454		int err;
   455	
   456		/* cannot use default getter because this function is used both for
   457		 * outer and inner packets
   458		 */
   459		ip6 = (struct ipv6hdr *)(skb->data + l3_offset);
   460	
   461		/* if present, locate Fragment Header first because it affects
   462		 * whether transport headers are available
   463		 */
   464		frag_hdr_off = l3_offset;
   465		err = ipv6_find_hdr(skb, &frag_hdr_off, NEXTHDR_FRAGMENT, NULL, NULL);
   466		if (unlikely(err < 0 && err != -ENOENT))
   467			return -EINVAL;
   468	
   469		*has_l4 = true;
   470		*fhdr_offset = 0;
   471		if (unlikely(err == NEXTHDR_FRAGMENT)) {
   472			if (unlikely(!pskb_may_pull(skb, frag_hdr_off + sizeof(*frag))))
   473				return -EINVAL;
   474			frag = (struct frag_hdr *)(skb->data + frag_hdr_off);
   475	
   476			/* remember Fragment Header offset for downstream logic */
   477			*fhdr_offset = frag_hdr_off;
   478			first_frag = ipxlat_is_first_frag6(frag);
   479	
   480			/* ipv6 forbids chaining FHs */
   481			if (unlikely(frag->nexthdr == NEXTHDR_FRAGMENT))
   482				return -EINVAL;
   483	
   484			/* RFC 7915 Section 5.1.1 does not support extension headers
   485			 * after FH (except NEXTHDR_NONE)
   486			 */
   487			if (unlikely(ipv6_ext_hdr(frag->nexthdr) &&
   488				     frag->nexthdr != NEXTHDR_NONE))
   489				return -EPROTONOSUPPORT;
   490	
   491			/* non-first fragments do not carry a full transport header */
   492			if (!first_frag) {
   493				*l4_proto = frag->nexthdr;
   494				/* first byte after FH is fragment payload,
   495				 * not L4 header
   496				 */
   497				*l4_offset = frag_hdr_off + sizeof(struct frag_hdr);
   498				*has_l4 = false;
   499				return 0;
   500			}
   501		}
   502	
   503		/* walk extension headers to terminal protocol and compute offsets used
   504		 * by validation/translation
   505		 */
   506		l4hdr_off = l3_offset;
   507		err = ipv6_find_hdr(skb, &l4hdr_off, -1, NULL, NULL);
   508		if (unlikely(err < 0))
   509			return -EINVAL;
   510	
   511		*l4_proto = err;
   512		*l4_offset = l4hdr_off;
   513		return 0;
   514	}
   515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

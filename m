Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEDE1A6812
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 07:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774163375; cv=none; b=bGOu4Yn0n7f2HhnbW48rj4QmwarLSdjLtS/4K27KbNfgGtqjdLeEBWleACaqrhRS8V7oDTACKD2ovy/NKf7QbClIl+3bLOFRr6KBXZ0II4wKB22Avj1Sf75wZfp1VJMcY4q9O7RZYuVNVQUMty7UfuPcUDJtv9a6snTBzdCN20o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774163375; c=relaxed/simple;
	bh=djpBgf/Sh+86UwmYGqVgUsZ8nKGx3LOxLJKQ3TaALJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJoPOzjP7GfjuASfLTCUWx3cHd/ehMeGn7k89XlhJvAL1CNN4ShS7KNMy48oLKsqsZCqB/69PSIZAkgAj0/gd5RjYXZ2xRmvbadaXAJTsOTD7HZKP67wxapof9/cMws7Ul/oG5YD8TTOuSXHSUWU0t0fsfzARKcHiPhJesT7RHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayX+U41X; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayX+U41X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774163374; x=1805699374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=djpBgf/Sh+86UwmYGqVgUsZ8nKGx3LOxLJKQ3TaALJA=;
  b=ayX+U41Xf1Im7wR6RA7KOHbFpnj9JIk5sqtZIRgDjR89UkLQ/nn4l90a
   5ew6siswgxjREkb60EHbvlifJz7O1rGTgLIACAZx1x1ffAkngPVpavtmk
   XoPMWB93NAPiGzoweuYCYPZ4mtHBz6HmRfK2thtSE5+B48hHYrIbYqa91
   x9gdLehTanTuGXhSogR7bPFze2umcr0BI49Y0B7Zprqb2F6tOTxetCdJq
   +Jzf5NGhy2CZgjjTRqVI5Zdpu+DZIYL3uJbFlA+QrMcdQE/kmQT934PGe
   OZB4HVKY+2DYNrMFKtYEeJH/1H7g7bKLpN11wjczZKtpEaktB75TNNWbw
   g==;
X-CSE-ConnectionGUID: 1arK3NqhTkWhJN5puOxOEQ==
X-CSE-MsgGUID: oIp6lmdqR5OdFDJNmmVrrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75316941"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="75316941"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 00:09:33 -0700
X-CSE-ConnectionGUID: P3zDZvecRRWeFx+cHSqOww==
X-CSE-MsgGUID: rfFFpzBXTieAkNDH1D9CNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="225505814"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Mar 2026 00:09:32 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Cw1-000000001oB-0C7y;
	Sun, 22 Mar 2026 07:09:21 +0000
Date: Sun, 22 Mar 2026 15:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ralf Lici <ralf@mandelbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 12/15] ipxlat: add ICMP error translation and
 quoted-inner handling
Message-ID: <202603221448.FcLwfOye-lkp@intel.com>
References: <20260319151230.655687-13-ralf@mandelbit.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319151230.655687-13-ralf@mandelbit.com>

Hi Ralf,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ralf-Lici/drivers-net-add-ipxlat-netdevice-skeleton-and-build-plumbing/20260321-005756
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260319151230.655687-13-ralf%40mandelbit.com
patch subject: [RFC net-next 12/15] ipxlat: add ICMP error translation and quoted-inner handling
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260322/202603221448.FcLwfOye-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221448.FcLwfOye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221448.FcLwfOye-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ipxlat/icmp_46.c: In function 'ipxlat_46_icmp_inner':
>> drivers/net/ipxlat/icmp_46.c:331:50: warning: variable 'inner_l4_off' set but not used [-Wunused-but-set-variable]
     331 |         unsigned int inner_l3_len, inner_l3_off, inner_l4_off, old_prefix,
         |                                                  ^~~~~~~~~~~~


vim +/inner_l4_off +331 drivers/net/ipxlat/icmp_46.c

   326	
   327	static int ipxlat_46_icmp_inner(struct ipxlat_priv *ipxlat,
   328					struct sk_buff *skb, struct iphdr *inner4,
   329					int *inner_delta)
   330	{
 > 331		unsigned int inner_l3_len, inner_l3_off, inner_l4_off, old_prefix,
   332			new_prefix, inner_tot_len, inner_l3_payload, inner_l4_payload;
   333		const unsigned int outer_l3_len = skb_transport_offset(skb);
   334		const struct ipxlat_cb *cb = ipxlat_skb_cb(skb);
   335		struct ipv6hdr outer_ip6_copy, *inner_ip6;
   336		struct frag_hdr *fh6;
   337		u8 next_hdr;
   338		bool has_inner_frag;
   339	
   340		inner_l3_off = cb->inner_l3_offset;
   341		inner_l4_off = cb->inner_l4_offset;
   342	
   343		/* inner header alignment is not guaranteed */
   344		memcpy(inner4, skb->data + inner_l3_off, sizeof(*inner4));
   345		inner_l3_len = inner4->ihl << 2;
   346		has_inner_frag = ip_is_fragment(inner4);
   347	
   348		/* save outer IPv6 hdr because pull+push destroys that hdr region */
   349		outer_ip6_copy = *ipv6_hdr(skb);
   350	
   351		old_prefix = inner_l3_off + inner_l3_len;
   352		new_prefix = inner_l3_off + sizeof(struct ipv6hdr) +
   353			     (has_inner_frag ? sizeof(struct frag_hdr) : 0);
   354		*inner_delta = (int)new_prefix - (int)old_prefix;
   355	
   356		if (unlikely(skb_cow_head(skb, max_t(int, 0, *inner_delta))))
   357			return -ENOMEM;
   358	
   359		skb_pull(skb, old_prefix);
   360		skb_push(skb, new_prefix);
   361		/* outer 4->6 path already set header offsets, but inner relayout
   362		 * pulls/pushes change skb->data placement. Reinitialize outer header
   363		 * offsets so ip{,v6}_hdr/icmp{,6}_hdr and skb_transport_offset keep
   364		 * pointing to the outer packet.
   365		 */
   366		skb_reset_network_header(skb);
   367		skb_set_transport_header(skb, outer_l3_len);
   368	
   369		*ipv6_hdr(skb) = outer_ip6_copy;
   370		ipv6_hdr(skb)->payload_len = htons(skb->len - sizeof(struct ipv6hdr));
   371	
   372		inner_ip6 = (struct ipv6hdr *)(skb->data + inner_l3_off);
   373		/* use quoted IPv4 total-length, not skb->len:
   374		 * skb->len also includes ICMP extension bytes at the end, which are
   375		 * not part of the quoted inner IP datagram length.
   376		 */
   377		inner_tot_len = ntohs(inner4->tot_len);
   378		if (unlikely(inner_tot_len < inner_l3_len))
   379			return -EINVAL;
   380	
   381		inner_l3_payload = inner_tot_len - inner_l3_len +
   382				   (has_inner_frag ? sizeof(struct frag_hdr) : 0);
   383		if (has_inner_frag)
   384			next_hdr = NEXTHDR_FRAGMENT;
   385		else
   386			next_hdr = ipxlat_46_map_proto_to_nexthdr(inner4->protocol);
   387	
   388		ipxlat_46_build_l3(inner_ip6, inner4, inner_l3_payload, next_hdr,
   389				   inner4->ttl);
   390	
   391		ipxlat_46_convert_addrs(&ipxlat->xlat_prefix6, inner4, inner_ip6);
   392	
   393		if (unlikely(has_inner_frag)) {
   394			fh6 = (struct frag_hdr *)(inner_ip6 + 1);
   395			ipxlat_46_build_frag_hdr(fh6, inner4, inner4->protocol);
   396		}
   397	
   398		if (unlikely(!ipxlat_is_first_frag4(inner4)))
   399			return 0;
   400	
   401		inner_l4_payload = new_prefix + ipxlat_l4_min_len(inner4->protocol);
   402		if (unlikely(skb_ensure_writable(skb, inner_l4_payload)))
   403			return -ENOMEM;
   404	
   405		return ipxlat_46_icmp_inner_l4(skb, new_prefix, inner4, inner_ip6);
   406	}
   407	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DCA1419A9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 02:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751769244; cv=none; b=pSz3wvFdw+ciUz+jhy+bpZ0c+T3ilQRFJoaAPmSH/fl28iFEo+lWSvAvvGGTw6U4q6HmUUzzzTQUsxziaOY0MhHaokhzmsHJ0TQFOMNQ8B8XrJutGXUPwiuLi6nmbW9SVZRP6LraNbDVclly6P3mtIaTmLcnNBlt9bDLniUUdUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751769244; c=relaxed/simple;
	bh=CuHNXhFH4vjOT4BqGIn40b2LVFhYcmMqVFJ3g3X/qAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qWLOlY83JIVGeQ4QtSsTMzeYEWdfCpfLntrsszIwj2DQhH2fduHrVd6sGuKaBypsRn3M0fvZRTdU2XdRuABWJZaHWhpjPqJkvY8HBoLHADKbR23XFaiGommZcpK6ggIC0F6GRrtf9F/SjsGzYnCLa7UjBaRzchNxE8AuD4bG3bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCMhth+Y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCMhth+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751769242; x=1783305242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CuHNXhFH4vjOT4BqGIn40b2LVFhYcmMqVFJ3g3X/qAk=;
  b=bCMhth+Yq2QAx6ybKyHtmrz6Z4Pmc5PpN8ljjxki9b0k6BsTcVV7DUbr
   TfmNXnCY9qL/fsmMSza7NL5a4XKWJ0Y9UyqLHG3fGADqfKy1pRsrBjb9p
   oGpYyLSdPMidsbFU/yC4hSu4g015EJhfldiCZzxFiOw4UlKibGWvF3ZA2
   kcU9gkPCXkRELP/r9QooJKtjRlZUofZ8M8IbO/XlfZGwnbXLgwOd2yM8D
   pCXi3X56paE5JkNNCaXYr1LSL1ZZIk2d522Ow5j/EaQoHjrGLncNFcFk3
   7Tx55DNh9xPBLP3IFdSRBf6KqOYlvBi1BeHPvov2CqswhZeSM5/W1K6mr
   Q==;
X-CSE-ConnectionGUID: Vy2cKotOTtiV89WjbjVeZw==
X-CSE-MsgGUID: j+VaNGIATCe9ujuXZq5L8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="54126203"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="54126203"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 19:34:01 -0700
X-CSE-ConnectionGUID: JZfZQMKmRvGah0U5WuHV5Q==
X-CSE-MsgGUID: HMhBDJXpSbyhNdBGH/+Buw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="154323271"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Jul 2025 19:34:00 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYFCX-0004pf-32;
	Sun, 06 Jul 2025 02:33:57 +0000
Date: Sun, 6 Jul 2025 10:33:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2467/2467] include/linux/if_caqm.h:391:23:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202507061006.UPqKLwaS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a9f7917e90ec872036160e2cb3a1d3c1856cb406
commit: 946747d4a52c34156031e41f9cb5cfb292747dcf [2467/2467] net: tcp: Add CAQM4TCP in the openeuler 6.6 kernel
config: x86_64-randconfig-123-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061006.UPqKLwaS-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507061006.UPqKLwaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507061006.UPqKLwaS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/gro.c: note: in included file:
>> include/linux/if_caqm.h:391:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] caqm_hdr_info @@     got restricted __be16 [usertype] h_caqm_info @@
   include/linux/if_caqm.h:391:23: sparse:     expected unsigned short [usertype] caqm_hdr_info
   include/linux/if_caqm.h:391:23: sparse:     got restricted __be16 [usertype] h_caqm_info
--
   net/ethernet/eth.c: note: in included file:
>> include/linux/if_caqm.h:470:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   include/linux/if_caqm.h:470:25: sparse:     expected unsigned short [usertype]
   include/linux/if_caqm.h:470:25: sparse:     got restricted __be16 [usertype]

vim +391 include/linux/if_caqm.h

   359	
   360	static inline void skb_gro_caqm_untag(struct sk_buff *skb)
   361	{
   362	#ifdef CONFIG_ETH_CAQM
   363		struct caqm_hdr *chdr;
   364		struct vlan_hdr *vlanhdr;
   365		u16 caqm_hdr_info;
   366		__be16 proto = skb->protocol;
   367		u8 skip_time = 0;
   368		int mac_len, meta_len;
   369		void *meta;
   370		struct caqm_hdr tmp_caqm_data;
   371	
   372		if (!static_branch_unlikely(&sysctl_caqm_enable) || skb_shared(skb))
   373			return;
   374	
   375		/* We may access the two bytes after caqm_hdr in caqm_set_encap_proto(). */
   376		if (unlikely(!pskb_may_pull(skb, VLAN_HLEN * 2 + CAQM_HLEN + sizeof(unsigned short))))
   377			return;
   378	
   379		vlanhdr = (struct vlan_hdr *)(skb->data - VLAN_HLEN);
   380		// Skip at most 2 vlan hdr
   381		while (skip_time < 2 && eth_type_vlan(proto)) {
   382			vlanhdr++; // chdr move a VLAN len
   383			skip_time += 1;
   384			proto = vlanhdr->h_vlan_encapsulated_proto;
   385		}
   386		// Look for vlan header, 2 times
   387		if (!eth_type_caqm(proto) || skb_cow(skb, skb_headroom(skb)) < 0)
   388			return;
   389	
   390		chdr = (struct caqm_hdr *)(((void *)vlanhdr) + VLAN_HLEN);
 > 391		caqm_hdr_info = chdr->h_caqm_info;
   392		__caqm_put_tag(skb, caqm_hdr_info);
   393	
   394		if ((unsigned char *) chdr != skb->data) {
   395			// adjust the caqm header before vlan header
   396			// 1. Set the vlanhdr->proto as the next
   397			vlanhdr->h_vlan_encapsulated_proto = chdr->h_caqm_encapsulated_proto;
   398			// 2. Exchange caqm and vlan hdr
   399			tmp_caqm_data = *chdr;
   400			memmove(skb->data + CAQM_HLEN, skb->data, skip_time * VLAN_HLEN);
   401			*(struct caqm_hdr *)(skb->data) = tmp_caqm_data;
   402		} else
   403			caqm_set_encap_proto(skb, chdr);
   404	
   405		skb_pull_rcsum(skb, CAQM_HLEN);
   406	
   407		mac_len = skb->data - skb_mac_header(skb);
   408		if (likely(mac_len > CAQM_HLEN + ETH_TLEN)) {
   409			memmove(skb_mac_header(skb) + CAQM_HLEN, skb_mac_header(skb),
   410				mac_len - CAQM_HLEN - ETH_TLEN);
   411		}
   412	
   413		meta_len = skb_metadata_len(skb);
   414		if (meta_len) {
   415			meta = skb_metadata_end(skb) - meta_len;
   416			memmove(meta + CAQM_HLEN, meta, meta_len);
   417		}
   418	
   419		skb->mac_header += CAQM_HLEN;
   420	
   421		skb_reset_network_header(skb);
   422		if (!skb_transport_header_was_set(skb))
   423			skb_reset_transport_header(skb);
   424		skb_reset_mac_len(skb);
   425	
   426	#endif
   427	}
   428	
   429	#ifdef CONFIG_ETH_CAQM
   430	static inline __be16 caqm_get_protocol_and_depth(struct sk_buff *skb,
   431							 __be16 type, int *depth)
   432	{
   433		type = vlan_get_protocol_and_depth(skb, type, depth);
   434		if (static_branch_unlikely(&sysctl_caqm_enable) && eth_type_caqm(type))
   435			return caqm_get_protocol_and_depth_after_vlan(skb, type, depth);
   436		else
   437			return type;
   438	}
   439	#endif
   440	
   441	static inline void caqm_update_hint_in_gro(struct sk_buff *skb, struct sk_buff *p)
   442	{
   443	#ifdef CONFIG_ETH_CAQM
   444		struct skb_caqm_info *cinfo_p = get_skb_caqm_info(p);
   445		struct skb_caqm_info *cinfo_skb = get_skb_caqm_info(skb);
   446	
   447		if (static_branch_unlikely(&sysctl_caqm_enable) && cinfo_p->recv_en && cinfo_skb->recv_en) {
   448			cinfo_p->recv_hint += cinfo_skb->recv_hint;
   449			cinfo_skb->recv_en = 0;
   450		}
   451	#endif
   452	}
   453	
   454	static inline int caqm_add_eth_header(struct sk_buff *skb, unsigned short *type,
   455				       struct net_device *dev)
   456	{
   457	#ifdef CONFIG_ETH_CAQM
   458		struct skb_caqm_info *cinfo = get_skb_caqm_info(skb);
   459	
   460		if (static_branch_unlikely(&sysctl_caqm_enable) &&
   461		    (sysctl_caqm_filter_nics & (1UL << dev->ifindex)) == 0)
   462			cinfo->send_en = 0;
   463		if (static_branch_unlikely(&sysctl_caqm_enable) && cinfo->send_en) {
   464			cinfo->send_en = 0;
   465			if (unlikely(skb_headroom(skb) <  ETH_HLEN + CAQM_HLEN))
   466				return -ETH_HLEN;
   467			u16 *chdr = skb_push(skb, CAQM_HLEN);
   468	
   469			chdr[0] = (cinfo->send_hdr);
 > 470			chdr[1] = htons(*type);
   471			*type = (unsigned short)sysctl_caqm_tpid;
   472		}
   473	#endif
   474		return 0;
   475	}
   476	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

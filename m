Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC8F2288D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 04:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784608446; cv=none; b=gZLjv4DtDjVQCx9XGrd3HqZ+niS+xsmn+YRZ15aSipZOjxM0u3EEbp1Q5xBv11GDM9vVSQ2nwJDBIjLUuoZp2Ke1aa1kmBMDJy2C1dsL3QtOXEJZ6lIDL3QQuGn5loy0yG8jnK+Gq52lpifHaxCKpFk+ys9JD/b4MOEFbsQZ1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784608446; c=relaxed/simple;
	bh=uj/2QiC/wUzMMAKawGBS6I6pJyBxfXR/W+hGtEvUJUs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WsKObZZEVsEmjmLsWtYOe7BTn2QNCc2PLRlaCTW3vjUO5SV+NIfQv5xtS7+dg+UHUS9J7tU4w+vSKsEOjGak79DF1fQK9qycvchIZXsWP0+psvIsQT9gULWahLpdJ4Mmniim9Ejg037lszpvouskgxj3NcEopscF/lp/m9iw9nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8kwJqxe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8kwJqxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784608443; x=1816144443;
  h=date:from:to:cc:subject:message-id;
  bh=uj/2QiC/wUzMMAKawGBS6I6pJyBxfXR/W+hGtEvUJUs=;
  b=Q8kwJqxeVDd1QVcfPPfWkZmCseLf5sZbgEbd2rZLcWFpk93mWXv7Bz+Q
   k44KEXC3rINm6LMVmkKyASVI8ML7/UeuDmbZo2OA2xjKwb2/Di/LECVHr
   lSWjWSELOKjGKfOs46+YE7SGqiy72UGm0keo2xDeIIiUwl4c1EILOgPpE
   ppnm28Ex8AWv4ZRGbYkO8olhyGCsqQcwkZZjn8sgEVqWUitCLWZoxsLL6
   C+jjLkfPtDcNOOVXJg42ZSjinwQqzMSejAX9PgLRt0HEFFSmMBzXJvXN0
   FM0vHvpOi1o1s311F0fePxUpe7fdwgtkQQE1DP2rNgl10BguO/nM6nJwL
   A==;
X-CSE-ConnectionGUID: TzrPESC0Qtyv/MDhO2qauQ==
X-CSE-MsgGUID: 1dwiY+p9TdeZSk3eSrQkLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="110747892"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="110747892"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 21:34:02 -0700
X-CSE-ConnectionGUID: VF+jbp6lQWGOywu8nZsSwQ==
X-CSE-MsgGUID: JqwLJZs+Q7OcDdezZclzxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="255859837"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Jul 2026 21:34:00 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wm2B3-000000006Mf-0OC1;
	Tue, 21 Jul 2026 04:33:57 +0000
Date: Tue, 21 Jul 2026 06:33:15 +0200
From: kernel test robot <lkp@intel.com>
To: Julian Anastasov <ja@ssi.bg>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/netfilter/ipvs/ip_vs_core.c:932:22: warning: unused
 variable 'coff'
Message-ID: <202607210623.du5PqolJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Julian-Anastasov/ipvs-fix-the-checksum-validations/20260721-042018
head:   1e5ec3e13b0a650732b689a4514d2f6eace5f06e
commit: 1e5ec3e13b0a650732b689a4514d2f6eace5f06e ipvs: fix places with wrong packet offsets
date:   8 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260721/202607210623.du5PqolJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260721/202607210623.du5PqolJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607210623.du5PqolJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/ipvs/ip_vs_core.c: In function 'ip_vs_nat_icmp':
>> net/netfilter/ipvs/ip_vs_core.c:932:22: warning: unused variable 'coff' [-Wunused-variable]
     932 |         unsigned int coff = toff + sizeof(struct icmphdr);
         |                      ^~~~
   net/netfilter/ipvs/ip_vs_core.c: In function 'ip_vs_in_icmp':
   net/netfilter/ipvs/ip_vs_core.c:1764:15: warning: variable 'outer_proto' set but not used [-Wunused-but-set-variable]
    1764 |         char *outer_proto = "IPIP";
         |               ^~~~~~~~~~~


vim +/coff +932 net/netfilter/ipvs/ip_vs_core.c

   921	
   922	/*
   923	 * Packet has been made sufficiently writable in caller
   924	 * - inout: 1=in->out, 0=out->in
   925	 */
   926	void ip_vs_nat_icmp(struct sk_buff *skb, struct ip_vs_protocol *pp,
   927			    struct ip_vs_conn *cp, int inout, unsigned int toff)
   928	{
   929		struct iphdr *iph	 = ip_hdr(skb);
   930		struct icmphdr *icmph	 = (struct icmphdr *)(skb->data + toff);
   931		struct iphdr *ciph	 = (struct iphdr *)(icmph + 1);
 > 932		unsigned int coff = toff + sizeof(struct icmphdr);
   933	
   934		if (inout) {
   935			iph->saddr = cp->vaddr.ip;
   936			ip_send_check(iph);
   937			ciph->daddr = cp->vaddr.ip;
   938			ip_send_check(ciph);
   939		} else {
   940			iph->daddr = cp->daddr.ip;
   941			ip_send_check(iph);
   942			ciph->saddr = cp->daddr.ip;
   943			ip_send_check(ciph);
   944		}
   945	
   946		/* the TCP/UDP/SCTP port */
   947		if (IPPROTO_TCP == ciph->protocol || IPPROTO_UDP == ciph->protocol ||
   948		    IPPROTO_SCTP == ciph->protocol) {
   949			__be16 *ports = (void *)ciph + ciph->ihl*4;
   950	
   951			if (inout)
   952				ports[1] = cp->vport;
   953			else
   954				ports[0] = cp->dport;
   955		}
   956	
   957		/* And finally the ICMP checksum */
   958		icmph->checksum = 0;
   959		icmph->checksum = ip_vs_checksum_complete(skb, toff);
   960		skb->ip_summed = CHECKSUM_UNNECESSARY;
   961	
   962		if (inout)
   963			IP_VS_DBG_PKT(11, AF_INET, pp, skb, coff,
   964				      "Forwarding altered outgoing ICMP");
   965		else
   966			IP_VS_DBG_PKT(11, AF_INET, pp, skb, coff,
   967				      "Forwarding altered incoming ICMP");
   968	}
   969	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

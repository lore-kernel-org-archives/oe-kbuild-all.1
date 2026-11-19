Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055403;
	b=Zbg6Vt01Pk6ZHpyLlunpQWMV/UIQrkmAMl1zvzwPPm/ZvCJZE9gkMsBbp6noQm6aqCqE
	 +/muwbf7RBUkESiFbpYsY2XolujSG08WEGmmOhhLvRe4eBczLHNWLNFYYsREqJnmbO0wG
	 24xw/z4QMCO01e0eSSFnkLXsmLU2ts+92EeStnMSbJvtyb6sW3rpmwA+sL60LQ7dwzo2n
	 Eym+dXtxn7EcrugMk3FKKEuQXPulinXF1uhmukgazR4Rf6msMz8UCoQdKlvhf/I8LH25+
	 pjRIpHpbqrWX3fCFxNxELzSDLTBu75avrAFtTX8yv2cV60s8SlQOCRr9hZU3pHSyTGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055403;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=4uc0OnSfNauhAVWQysGlRnmLMTGM1UsQebubgs4TK/k=;
	b=uECO3kr4FRs9VSeartChUgx/CeGpXUV0M+Q7LOJMwv27LpnWMEnwWlGUm1hH4IyZf1pe
	 CwoII0zHkIueNxOvST08gAks/+IAudvZrEd2M3Onx4mpANUanllGSdqKsaxcpjYxfbBPu
	 SbeWpBtD88Opy6OjPjwnG1N4zJMEHG1ixvepcQ9Ijrdqsixea3iyO4TDJWo6IpJaq1tfX
	 EO6d5NCulMtFTe5onxrDWKopoX90tIWzItMF/ryg0CAPU/BVrW4QRUgDrDnnT4/8RTilG
	 wNHpVMSnR/saBDvwyB6DaBt5+sxxjUacxc6BK6Sd0TVmqVUhTH/Ohg8iLyuEExGjVrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fd6hkJQC;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA4F606A336
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 02:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA4F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fd6hkJQC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795055402; x=1826591402;
  h=date:from:to:cc:subject:message-id;
  bh=GBQojEfGoo6mxD6Q2TSgKLwN9VcTJBGHxJbIegdml3M=;
  b=fd6hkJQCCuqy6hxRMFRKAYfkAHNL/thwTtptIK4PMtqSLL6keOcelNbq
   D7IrduZELA1M5vizCJP+yfHJ8TIz1zJqY6cQiSUx8oKl6rhxVxgSvoHcV
   6W8iLDef9JeslconilCIn4O05kOgE0H57feSa/jA4aWLEOQ4f+Cu4Kq4G
   Km2V2fd3uY/NtLE3I0I5HGnDM1n12kosB2aJXOYXoVKV2TKbhpoL0jiFq
   oHXKIc40HLAwQSibigEbSvCW/Gmev1wZAQumdUtYRiIQKr6aYLE2Ptx0i
   18BkbHxXnJA5wy/qufZwborhxhfOr9npc0ZUJhHStNQXs3eK2u/2aduKF
   w==;
X-CSE-ConnectionGUID: 2QjSsabrSVaPnoB56xOkag==
X-CSE-MsgGUID: OUUCFJSBTBqOmwQVaNhsUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3920177"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3920177"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 18:30:01 -0800
X-CSE-ConnectionGUID: IE+mgHaTRpytuGHVkk5z8Q==
X-CSE-MsgGUID: QqKODVomQGGrnwJzqu5ATA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10402814"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 18 Nov 2026 18:30:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTruQ-000000003bD-075F;
	Thu, 19 Nov 2026 02:29:58 +0000
Date: Thu, 19 Nov 2026 03:29:35 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp 97/107] net/ipv4/tcp_xdp.c:1058:18:
 sparse: sparse: symbol 'bpf_xdp_tcp_sock_dtor' was not declared. Should it be
 static?
Message-ID: <20261119032304.RrxYq3Rc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux xdp-tcp
head:   a80dbed970ebe4f7d8b2f6be334b64b30cfc5014
commit: 80705b79f55546fae6d35651cd9ce5f21aad9a19 [97/107] tcp: Receive out-of-order segments retained by an XDP program
config: x86_64-randconfig-2301-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119032304.RrxYq3Rc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119032304.RrxYq3Rc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119032304.RrxYq3Rc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/tcp_xdp.c:1058:18: sparse: sparse: symbol 'bpf_xdp_tcp_sock_dtor' was not declared. Should it be static?

vim +/bpf_xdp_tcp_sock_dtor +1058 net/ipv4/tcp_xdp.c

  1057	
> 1058	__bpf_kfunc void bpf_xdp_tcp_sock_dtor(void *sk)
  1059	{
  1060		struct sock *s = sk;
  1061	
  1062		if (likely(!in_hardirq() && !in_nmi())) {
  1063			sock_put(s);
  1064			return;
  1065		}
  1066		if (refcount_dec_not_one(&s->sk_refcnt))
  1067			return;
  1068		llist_add((struct llist_node *)&s->sk_rcu, &xdp_tcp_sock_put_list);
  1069		irq_work_queue(&xdp_tcp_sock_put_irq_work);
  1070	}
  1071	CFI_NOSEAL(bpf_xdp_tcp_sock_dtor);
  1072	
  1073	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

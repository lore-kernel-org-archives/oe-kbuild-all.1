Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803336;
	b=iiUIKss2nshqC77Pf5Gx31TXsB7gS1D0+h4EW8gT8W/or2r+pRBjNt2LlXW90Ljz1Zg/
	 jcUAiQeAEXMU/aGH4kEs10jWZi8W2L0uAQPcuomdvpJ1Zn27DOPnFgVE0Eg9RjsBhNq+4
	 gEU98JP3wno9JbZ2t5dgokLpWR+qsilpUBuvNGVXlMUddsUdxv7Rz1hi1EStHPGuijkGD
	 nmh6M+fhYZrifd+94rkSafkJArh5sVOcl0IdhLmyvWjGx+hQjOaNDiJnJZqM1fTy/umn0
	 vDjcTgIwWjmhwLtq5g9OMj8sL8erCYi5TpsDd87hhZC1don8hB3qjPp60cdy5GHhZyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803336;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hUvzvIMxZMM6T9ZKzBHZUXcrm3vlX5Y3EaeSlZJi+MI=;
	b=MczK/ReN97y5bhY2PAWSdSWnrRJ8TEB/aWdWnKqs0vr4SpDDrV2L4A97vC9a9lWjXkrH
	 KQGsF5oLHFBpYtiBhU2OE5kWRXJr6cAEzUEtQ2eUZjasJ6CexpTA6QM7PN698ealdO43N
	 Kff7h2jbYZZffQbHSonFJYo6VaZiw6sUQKYFsq9oN6/YpyZ0GWX5XnYu6hMdRbe4dRkEP
	 sNPRrckoLMl0xos9kynnkYC84nhnblVvoJ639Lv0Eber6N+g2HZLnIZKQjQLRRfdZBAAO
	 mk7ZdDBKx3f/gin88cJG4XcutHWB+cM676htQ4ygqiYYjsAa6XfWAtyrIP3/MFjyjCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n7sVDtiI;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1973A606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 04:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1973A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n7sVDtiI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794803335; x=1826339335;
  h=date:from:to:cc:subject:message-id;
  bh=FBaHbsrZr/Gs9CXHJbsJTYL2XyQ5wfsendL9cSkmwfo=;
  b=n7sVDtiI2r5uIyOaTRc5kB3kIl10Ed5Alj1H7MHC6iNX4zEQanrXjC2o
   gA+CFgmklIyw0MlwD8Ib8tgmN/aTJbL9a9wc0fh0sxJPQXHvl13Imnem/
   e7DDaBYd+uyGNW65gY+HJIceL2qMRj3sHO8UDq9LYvHh9W3nFII3kQUH3
   AgobRR5PKTIEPzdE1CoteSfTjS+ShhI88Ylf0EvAZ2fsYOkmNb0czw/mc
   9cVNXv5PYa8EWOSYp6gDFGmE9kD3K4LvPlmdobBc3hP9ZwtWm+u8UlnE1
   WrK8fqGVN6dmQUgqSSiRy0/oG4fTl8Dp+rjjfg/EfIAHvfI7T19vK7xsG
   A==;
X-CSE-ConnectionGUID: /ZSKofSETyS8NgHH3WBgwg==
X-CSE-MsgGUID: h4HfWynkTpmsuJETnSE3zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3419477"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3419477"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 20:28:54 -0800
X-CSE-ConnectionGUID: f4BNBpoJS3CWkeAA1kRhiQ==
X-CSE-MsgGUID: kzWkvnA6Q1CRYluCaP1egg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9325382"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 15 Nov 2026 20:28:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSoKn-000000002at-2HQU;
	Mon, 16 Nov 2026 04:28:49 +0000
Date: Mon, 16 Nov 2026 05:28:14 +0100
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:libeth 2/10] Warning:
 drivers/net/ethernet/intel/ice/ice_xsk.c:758 function parameter 'xctx' not
 described in 'ice_xmit_pkt'
Message-ID: <202611160505.VjAfLafe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/alobakin/linux libeth
head:   fe0bad42334b5194c60b75defee06b292e360503
commit: 8f482d804e2bf88416876d31846343571f24a8e3 [2/10] ice: add Tx launch time XSk Tx metadata
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20261116/202611160505.VjAfLafe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160505.VjAfLafe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160505.VjAfLafe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:758 function parameter 'xctx' not described in 'ice_xmit_pkt'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:758 Excess function parameter 'xdp_ring' description in 'ice_xmit_pkt'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:758 Excess function parameter 'total_bytes' description in 'ice_xmit_pkt'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:788 function parameter 'xctx' not described in 'ice_xmit_pkt_batch'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:788 Excess function parameter 'xdp_ring' description in 'ice_xmit_pkt_batch'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:788 Excess function parameter 'total_bytes' description in 'ice_xmit_pkt_batch'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:829 function parameter 'xctx' not described in 'ice_fill_tx_hw_ring'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:829 Excess function parameter 'xdp_ring' description in 'ice_fill_tx_hw_ring'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:829 Excess function parameter 'total_bytes' description in 'ice_fill_tx_hw_ring'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:758 function parameter 'xctx' not described in 'ice_xmit_pkt'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:758 Excess function parameter 'xdp_ring' description in 'ice_xmit_pkt'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:758 Excess function parameter 'total_bytes' description in 'ice_xmit_pkt'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:788 function parameter 'xctx' not described in 'ice_xmit_pkt_batch'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:788 Excess function parameter 'xdp_ring' description in 'ice_xmit_pkt_batch'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:788 Excess function parameter 'total_bytes' description in 'ice_xmit_pkt_batch'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:829 function parameter 'xctx' not described in 'ice_fill_tx_hw_ring'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:829 Excess function parameter 'xdp_ring' description in 'ice_fill_tx_hw_ring'
>> Warning: drivers/net/ethernet/intel/ice/ice_xsk.c:829 Excess function parameter 'total_bytes' description in 'ice_fill_tx_hw_ring'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

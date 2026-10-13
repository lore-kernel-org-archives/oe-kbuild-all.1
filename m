Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F44F47253A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 03:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862175; cv=none; b=bTlUz7GXhYzAAzvsZ37esRcTy4RD6q5ab8NLlAJfT5uHTSp7ed8Sc0752I+4cY6Tp0xZfhf67rCksUpVNB7Cw1PihzHNF8MIDyKqZntMQvzkPDKb1Er5YHJI4pEOgcRUjbMFbk/DRS8oxUGV05ZnvIm+yfE3CVpMPsnV1NpqX1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862175; c=relaxed/simple;
	bh=mYLzEZUbsvBR/Im/QVmGFqruBuUgOT08RlusRVO3pVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uLlBLpi7qtp3LAdmqafEqJyrim0digVB8Lo4laN3pWic6X35I0tsbbiyuKFbgBRN6qkYAqCJi74pOS2FxJk1AWd3vRuKV8HLntxzE03coOozgPGaKI+eh3T6mPFBBSDEwE8a8gNRACPQrdG6mSv8Hie65FLzGvRmdlbslDAhZuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UK932FBy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UK932FBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791862173; x=1823398173;
  h=date:from:to:cc:subject:message-id;
  bh=mYLzEZUbsvBR/Im/QVmGFqruBuUgOT08RlusRVO3pVk=;
  b=UK932FByX1LlBywSqUzM207NtFqLxLRiSDj55ePNioofR94Hqww/U5XQ
   OUbytf9l/jGfxcCCQvUtUzu526BcSEi0PBb1B4lriZAnt4BovsiyrszeP
   wY2P2CwbUcb+yHv1Vc8Q9RzYYNcG5BKUf4/HZdpNDH6LqXZxv02NhRW7R
   AunC3g0Cjm/IKa6W/9ogV/GYHsgEINiRvu7oRhhwRjoycJ9gYV1reEtob
   xqtVHbX+UI/o9cFk61SO8lfJm18Nj2+S0iEuhVTm1e/kb9IGWYCjNovNm
   E4bO9EnIcSuwLVGqtWLTxkK08ZpRdm6rqyR1wkrNh5udnpnkMF7T5zJEp
   g==;
X-CSE-ConnectionGUID: WKbvzoGMSW6iza767b/zUw==
X-CSE-MsgGUID: B++CSNuoSm6D4CYN+bZPgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="468479"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="468479"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 20:29:32 -0700
X-CSE-ConnectionGUID: MuuHqhcfS4CXhsmqAtwFwg==
X-CSE-MsgGUID: BteWUjLNQOevGyRF8TWaSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1170249"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 12 Oct 2026 20:29:32 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGTCj-00000000AMd-1E0D;
	Tue, 13 Oct 2026 03:29:29 +0000
Date: Tue, 13 Oct 2026 05:28:30 +0200
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:libeth 8/8] Warning:
 drivers/net/ethernet/intel/ice/ice_xsk.c:758 function parameter 'xctx' not
 described in 'ice_xmit_pkt'
Message-ID: <202610130514.7DOn2NJo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/alobakin/linux libeth
head:   35bae4f0e90f2b3d23b29da53cc25763ae9755eb
commit: 35bae4f0e90f2b3d23b29da53cc25763ae9755eb [8/8] ice: add Tx launch time XSk Tx metadata
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20261013/202610130514.7DOn2NJo-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130514.7DOn2NJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130514.7DOn2NJo-lkp@intel.com/

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

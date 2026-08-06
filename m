Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4F23ACF17
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 01:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979725; cv=none; b=kE9TyyAWKGMUCqBpd96j0cUQG94uR+dt9xW417dcOgnmQZUmGoHh0De+rcDA1Xfhv8O8LwcSu07D+ykdQBqHNVy6Gdcb3wNfabnPq1Bgca49O32NA3EvapOlKES8Z6AOkm7aJtOHQdAnYPHFuf1bhttHit/C2HoWqj5rTbjvRKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979725; c=relaxed/simple;
	bh=rl+kVTJfGw/FZY5ZZyRUuhLspLrgRrIBT//85JyEi6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gqcHx6eV2/Ciq1+gfOAAfMe4m7/198Nc2mCpV/7YoeHUcl+lrzVaWhaa9Kl13aBxUQa9TXemm//+ySp4QyWvVUtaaCkMz1AAAGkhECtmOO96SVwsDfYeXwH4CaKCq/rx/S1ISouDb4bYlrAcnBeOfUfxfcpRvM/I3IdcI4jE/kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVGdcMvq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVGdcMvq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785979724; x=1817515724;
  h=date:from:to:cc:subject:message-id;
  bh=rl+kVTJfGw/FZY5ZZyRUuhLspLrgRrIBT//85JyEi6g=;
  b=JVGdcMvqpNTnWIYEeFmKCGNVmzhUzEYmR0hAW5EiNOKSfFQoSr2kUiel
   qRW1BBOp+M732dlKzUzOKSI7903QbI4rOplozWQLdmp1hoedwrdXq8zVg
   njzSJR/pkyVSmI0DChBR407vfG0bSwna9UWSwXH0nfgn5c9yZcCT1GQwg
   KeZQcYsjPZYgqI760/Y6l4mp8D127/4pf5ArM27PP84ayBneOSjrK36ms
   nyR7BmiUtkanPFkBIZOj/KFBZlsjd6/h/Sbj6RaQlCdol+8JzG6p7GLhX
   zZPrBHQUzHprImUtydT0G044RgHTZdrkS+7B1duy2DvDkl76CD43L9uDa
   Q==;
X-CSE-ConnectionGUID: 92kaehwoTLeKxtCJfKZ8JA==
X-CSE-MsgGUID: kTNt7UQSTBCMpjlNPyLmEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86681888"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="86681888"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 18:28:43 -0700
X-CSE-ConnectionGUID: NmIBbkr7QTOmadH4Cne5yQ==
X-CSE-MsgGUID: tS1Lnx04Rg+leBiKE9CDqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="286622328"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Aug 2026 18:28:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrmuV-00000000DtB-2qDW;
	Thu, 06 Aug 2026 01:28:39 +0000
Date: Thu, 06 Aug 2026 09:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 2/2]
 drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:954:6: error: call
 to undeclared function 'xfrm_input_state'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202608060918.GNiRo5An-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   11fe19e75a18adc0a15fc1fb837623db140f5ac7
commit: 3e1da3739d68558bacc60ea5f469fbddaf529c32 [2/2] ANDROID: GKI: Add GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS
config: arm64-randconfig-004-20260806 (https://download.01.org/0day-ci/archive/20260806/202608060918.GNiRo5An-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060918.GNiRo5An-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060918.GNiRo5An-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:7:
   include/net/xfrm.h:2088:30: error: no member named 'xfrm' in 'struct dst_entry'
    2088 |         struct xfrm_state *x = dst->xfrm;
         |                                ~~~  ^
   include/net/xfrm.h:2095:46: error: no member named 'xfrm' in 'struct dst_entry'
    2095 |         if (!x->xso.offload_handle && !xdst->child->xfrm)
         |                                        ~~~~~~~~~~~  ^
   include/net/xfrm.h:2098:20: error: no member named 'xfrm' in 'struct dst_entry'
    2098 |             !xdst->child->xfrm)
         |              ~~~~~~~~~~~  ^
>> drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:954:6: error: call to undeclared function 'xfrm_input_state'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     954 |         x = xfrm_input_state(skb);
         |             ^
   drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:954:6: note: did you mean 'xfrm_init_state'?
   include/net/xfrm.h:1776:5: note: 'xfrm_init_state' declared here
    1776 | int xfrm_init_state(struct xfrm_state *x);
         |     ^
>> drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c:954:4: error: incompatible integer to pointer conversion assigning to 'struct xfrm_state *' from 'int' [-Wint-conversion]
     954 |         x = xfrm_input_state(skb);
         |           ^ ~~~~~~~~~~~~~~~~~~~~~
   5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/xfrm_input_state +954 drivers/net/ethernet/marvell/octeontx2/nic/cn10k_ipsec.c

6a77a158848a8c Bharat Bhushan 2024-12-04  929  
6a77a158848a8c Bharat Bhushan 2024-12-04  930  bool cn10k_ipsec_transmit(struct otx2_nic *pf, struct netdev_queue *txq,
6a77a158848a8c Bharat Bhushan 2024-12-04  931  			  struct otx2_snd_queue *sq, struct sk_buff *skb,
6a77a158848a8c Bharat Bhushan 2024-12-04  932  			  int num_segs, int size)
6a77a158848a8c Bharat Bhushan 2024-12-04  933  {
6a77a158848a8c Bharat Bhushan 2024-12-04  934  	struct cpt_inst_s inst;
6a77a158848a8c Bharat Bhushan 2024-12-04  935  	struct cpt_res_s *res;
6a77a158848a8c Bharat Bhushan 2024-12-04  936  	struct xfrm_state *x;
6a77a158848a8c Bharat Bhushan 2024-12-04  937  	struct qmem *sa_info;
6a77a158848a8c Bharat Bhushan 2024-12-04  938  	dma_addr_t dptr_iova;
6a77a158848a8c Bharat Bhushan 2024-12-04  939  	struct sec_path *sp;
6a77a158848a8c Bharat Bhushan 2024-12-04  940  	u8 encap_offset;
6a77a158848a8c Bharat Bhushan 2024-12-04  941  	u8 auth_offset;
6a77a158848a8c Bharat Bhushan 2024-12-04  942  	u8 gthr_size;
6a77a158848a8c Bharat Bhushan 2024-12-04  943  	u8 iv_offset;
6a77a158848a8c Bharat Bhushan 2024-12-04  944  	u16 dlen;
6a77a158848a8c Bharat Bhushan 2024-12-04  945  
6a77a158848a8c Bharat Bhushan 2024-12-04  946  	/* Check for IPSEC offload enabled */
6a77a158848a8c Bharat Bhushan 2024-12-04  947  	if (!(pf->flags & OTX2_FLAG_IPSEC_OFFLOAD_ENABLED))
6a77a158848a8c Bharat Bhushan 2024-12-04  948  		goto drop;
6a77a158848a8c Bharat Bhushan 2024-12-04  949  
6a77a158848a8c Bharat Bhushan 2024-12-04  950  	sp = skb_sec_path(skb);
6a77a158848a8c Bharat Bhushan 2024-12-04  951  	if (unlikely(!sp->len))
6a77a158848a8c Bharat Bhushan 2024-12-04  952  		goto drop;
6a77a158848a8c Bharat Bhushan 2024-12-04  953  
6a77a158848a8c Bharat Bhushan 2024-12-04 @954  	x = xfrm_input_state(skb);

:::::: The code at line 954 was first introduced by commit
:::::: 6a77a158848a8c68930df27b8840660db8531222 cn10k-ipsec: Process outbound ipsec crypto offload

:::::: TO: Bharat Bhushan <bbhushan2@marvell.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

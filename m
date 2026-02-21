Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338792F6188
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 07:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771659303; cv=none; b=rcwJJydTRmSjME4qR+/MrI4hPlWcOzxQSwXWu33FCfRteJZMcD0az0MmybRfav3vzd1ZM6W6L2yjybaSS9eTgso4zja9Q/9REJmseAmMYXHvHf3AW0zPSZeLW/Rwt9DC1/N3p6LFVwq9pjnxB0ksf9QhUvGabqukzt4s0clbaD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771659303; c=relaxed/simple;
	bh=+TIPSBekA0EELCjlUndAxpIBJUtvJsTLi5acvyDPfco=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FHzoZbVrUHgiCORUa21abocj4apnUYD1jDohY4B4IU5/dMO87wpWo8V8/oV81TbAbK/vdAqCImFCo1NVUFiUnKmoqcxGhqRr4yQrDklfLObhMpR7UEkONST4MRFc5gbDeT4U5+7QitJ/qByF5NXi5D5WozHeJQsj6i2oUdsFo4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMu6UoP+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMu6UoP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771659301; x=1803195301;
  h=date:from:to:cc:subject:message-id;
  bh=+TIPSBekA0EELCjlUndAxpIBJUtvJsTLi5acvyDPfco=;
  b=iMu6UoP+JwkwM2TCLml9QozSykCb5/Yj4DvX5cggnv9eqdCm7XNuYaye
   8/WF455WoZ7gQ9h6g/hIILQOtZs11NeUDjvdurSGt1KR2xMjMKk3z9nh0
   mJ4DHbT0+4QgrXzuzom69khJ2CMnjaXbDvyy1HViDMdTkDbwTRq5JrS7H
   8GOds97SVnhrCUnJG5QC1M6pJWgUHtJncDdOSRXtMapWg0I4qDPwT6iz6
   kMKdxt2Ux6U0QJM0N39VX+e8gpjTuDa17Voeav3xPYRjg+nHExOqIPhAi
   4urXXF+lHkipF1BMeXHUTjwLtCymmQNKTvmUEcxcOSJVSpV+c0M4As8Q6
   g==;
X-CSE-ConnectionGUID: ZTY7QxLbRg6CTY015bRnpw==
X-CSE-MsgGUID: HvmNydYkQtqiI+XogXV7Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72443906"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72443906"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 23:35:00 -0800
X-CSE-ConnectionGUID: PfSPg+0DQ4+sQ/ZUoBSv9A==
X-CSE-MsgGUID: NYdR1RqeTCqO7Y6AkEOwow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="214162392"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Feb 2026 23:34:59 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vthVw-000000004NB-20dK;
	Sat, 21 Feb 2026 07:34:56 +0000
Date: Sat, 21 Feb 2026 08:34:44 +0100
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:for-620 5/15]
 drivers/net/ethernet/intel/i40e/i40e_ethtool.c:3711:19: error: use of
 undeclared identifier 'flow_id'
Message-ID: <202602210812.3Dnwwc49-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux for-620
head:   3b794289e60f9e1cc26d239bef32c93543213772
commit: d40765a7bbafbae8f4c7546d5ffdb1f97408f1ab [5/15] i40e: drop useless bitmap_weight() call
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260221/202602210812.3Dnwwc49-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210812.3Dnwwc49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210812.3Dnwwc49-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/i40e/i40e_ethtool.c:3711:19: error: use of undeclared identifier 'flow_id'
    3711 |         for_each_set_bit(flow_id, flow_pctypes, FLOW_PCTYPES_SIZE) {
         |                          ^
>> drivers/net/ethernet/intel/i40e/i40e_ethtool.c:3711:19: error: use of undeclared identifier 'flow_id'
>> drivers/net/ethernet/intel/i40e/i40e_ethtool.c:3711:19: error: use of undeclared identifier 'flow_id'
>> drivers/net/ethernet/intel/i40e/i40e_ethtool.c:3711:19: error: use of undeclared identifier 'flow_id'
>> drivers/net/ethernet/intel/i40e/i40e_ethtool.c:3711:19: error: use of undeclared identifier 'flow_id'
   drivers/net/ethernet/intel/i40e/i40e_ethtool.c:3712:62: error: use of undeclared identifier 'flow_id'
    3712 |                 i_setc = (u64)i40e_read_rx_ctl(hw, I40E_GLQF_HASH_INSET(0, flow_id)) |
         |                                                                            ^
   drivers/net/ethernet/intel/i40e/i40e_ethtool.c:3713:56: error: use of undeclared identifier 'flow_id'
    3713 |                          ((u64)i40e_read_rx_ctl(hw, I40E_GLQF_HASH_INSET(1, flow_id)) << 32);
         |                                                                             ^
   drivers/net/ethernet/intel/i40e/i40e_ethtool.c:3716:49: error: use of undeclared identifier 'flow_id'
    3716 |                 i40e_write_rx_ctl(hw, I40E_GLQF_HASH_INSET(0, flow_id),
         |                                                               ^
   drivers/net/ethernet/intel/i40e/i40e_ethtool.c:3718:49: error: use of undeclared identifier 'flow_id'
    3718 |                 i40e_write_rx_ctl(hw, I40E_GLQF_HASH_INSET(1, flow_id),
         |                                                               ^
   drivers/net/ethernet/intel/i40e/i40e_ethtool.c:3720:19: error: use of undeclared identifier 'flow_id'
    3720 |                 hena |= BIT_ULL(flow_id);
         |                                 ^
   10 errors generated.


vim +/flow_id +3711 drivers/net/ethernet/intel/i40e/i40e_ethtool.c

eb0dd6e4a3b3df Carolyn Wyborny  2016-07-27  3614  
3b32c9932853e1 Slawomir Laba    2022-10-24  3615  #define FLOW_PCTYPES_SIZE 64
5a28983710b739 Jakub Kicinski   2025-06-14  3616  static int i40e_set_rxfh_fields(struct net_device *netdev,
5a28983710b739 Jakub Kicinski   2025-06-14  3617  				const struct ethtool_rxfh_fields *nfc,
5a28983710b739 Jakub Kicinski   2025-06-14  3618  				struct netlink_ext_ack *extack)
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3619  {
5a28983710b739 Jakub Kicinski   2025-06-14  3620  	struct i40e_netdev_priv *np = netdev_priv(netdev);
5a28983710b739 Jakub Kicinski   2025-06-14  3621  	struct i40e_vsi *vsi = np->vsi;
5a28983710b739 Jakub Kicinski   2025-06-14  3622  	struct i40e_pf *pf = vsi->back;
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3623  	struct i40e_hw *hw = &pf->hw;
272cdaf2472ab7 Shannon Nelson   2016-02-17  3624  	u64 hena = (u64)i40e_read_rx_ctl(hw, I40E_PFQF_HENA(0)) |
272cdaf2472ab7 Shannon Nelson   2016-02-17  3625  		   ((u64)i40e_read_rx_ctl(hw, I40E_PFQF_HENA(1)) << 32);
3b32c9932853e1 Slawomir Laba    2022-10-24  3626  	DECLARE_BITMAP(flow_pctypes, FLOW_PCTYPES_SIZE);
eb0dd6e4a3b3df Carolyn Wyborny  2016-07-27  3627  	u64 i_set, i_setc;
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3628  
3b32c9932853e1 Slawomir Laba    2022-10-24  3629  	bitmap_zero(flow_pctypes, FLOW_PCTYPES_SIZE);
3b32c9932853e1 Slawomir Laba    2022-10-24  3630  
70756d0a4727fe Ivan Vecera      2023-11-13  3631  	if (test_bit(I40E_FLAG_MFP_ENA, pf->flags)) {
83d14c595e011f Carolyn Wyborny  2017-06-07  3632  		dev_err(&pf->pdev->dev,
83d14c595e011f Carolyn Wyborny  2017-06-07  3633  			"Change of RSS hash input set is not supported when MFP mode is enabled\n");
83d14c595e011f Carolyn Wyborny  2017-06-07  3634  		return -EOPNOTSUPP;
83d14c595e011f Carolyn Wyborny  2017-06-07  3635  	}
83d14c595e011f Carolyn Wyborny  2017-06-07  3636  
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3637  	/* RSS does not support anything other than hashing
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3638  	 * to queues on src and dst IPs and ports
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3639  	 */
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3640  	if (nfc->data & ~(RXH_IP_SRC | RXH_IP_DST |
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3641  			  RXH_L4_B_0_1 | RXH_L4_B_2_3))
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3642  		return -EINVAL;
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3643  
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3644  	switch (nfc->flow_type) {
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3645  	case TCP_V4_FLOW:
141d0c9037ca57 Jacob Keller     2025-05-05  3646  		set_bit(LIBIE_FILTER_PCTYPE_NONF_IPV4_TCP, flow_pctypes);
0e8b9fdd40fe65 Ivan Vecera      2023-11-13  3647  		if (test_bit(I40E_HW_CAP_MULTI_TCP_UDP_RSS_PCTYPE,
0e8b9fdd40fe65 Ivan Vecera      2023-11-13  3648  			     pf->hw.caps))
141d0c9037ca57 Jacob Keller     2025-05-05  3649  			set_bit(LIBIE_FILTER_PCTYPE_NONF_IPV4_TCP_SYN_NO_ACK,
3b32c9932853e1 Slawomir Laba    2022-10-24  3650  				flow_pctypes);
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3651  		break;
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3652  	case TCP_V6_FLOW:
141d0c9037ca57 Jacob Keller     2025-05-05  3653  		set_bit(LIBIE_FILTER_PCTYPE_NONF_IPV6_TCP, flow_pctypes);
0e8b9fdd40fe65 Ivan Vecera      2023-11-13  3654  		if (test_bit(I40E_HW_CAP_MULTI_TCP_UDP_RSS_PCTYPE,
0e8b9fdd40fe65 Ivan Vecera      2023-11-13  3655  			     pf->hw.caps))
141d0c9037ca57 Jacob Keller     2025-05-05  3656  			set_bit(LIBIE_FILTER_PCTYPE_NONF_IPV6_TCP_SYN_NO_ACK,
3b32c9932853e1 Slawomir Laba    2022-10-24  3657  				flow_pctypes);
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3658  		break;
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3659  	case UDP_V4_FLOW:
141d0c9037ca57 Jacob Keller     2025-05-05  3660  		set_bit(LIBIE_FILTER_PCTYPE_NONF_IPV4_UDP, flow_pctypes);
0e8b9fdd40fe65 Ivan Vecera      2023-11-13  3661  		if (test_bit(I40E_HW_CAP_MULTI_TCP_UDP_RSS_PCTYPE,
0e8b9fdd40fe65 Ivan Vecera      2023-11-13  3662  			     pf->hw.caps)) {
141d0c9037ca57 Jacob Keller     2025-05-05  3663  			set_bit(LIBIE_FILTER_PCTYPE_NONF_UNICAST_IPV4_UDP,
3b32c9932853e1 Slawomir Laba    2022-10-24  3664  				flow_pctypes);
141d0c9037ca57 Jacob Keller     2025-05-05  3665  			set_bit(LIBIE_FILTER_PCTYPE_NONF_MULTICAST_IPV4_UDP,
3b32c9932853e1 Slawomir Laba    2022-10-24  3666  				flow_pctypes);
3b32c9932853e1 Slawomir Laba    2022-10-24  3667  		}
141d0c9037ca57 Jacob Keller     2025-05-05  3668  		hena |= BIT_ULL(LIBIE_FILTER_PCTYPE_FRAG_IPV4);
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3669  		break;
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3670  	case UDP_V6_FLOW:
141d0c9037ca57 Jacob Keller     2025-05-05  3671  		set_bit(LIBIE_FILTER_PCTYPE_NONF_IPV6_UDP, flow_pctypes);
0e8b9fdd40fe65 Ivan Vecera      2023-11-13  3672  		if (test_bit(I40E_HW_CAP_MULTI_TCP_UDP_RSS_PCTYPE,
0e8b9fdd40fe65 Ivan Vecera      2023-11-13  3673  			     pf->hw.caps)) {
141d0c9037ca57 Jacob Keller     2025-05-05  3674  			set_bit(LIBIE_FILTER_PCTYPE_NONF_UNICAST_IPV6_UDP,
3b32c9932853e1 Slawomir Laba    2022-10-24  3675  				flow_pctypes);
141d0c9037ca57 Jacob Keller     2025-05-05  3676  			set_bit(LIBIE_FILTER_PCTYPE_NONF_MULTICAST_IPV6_UDP,
3b32c9932853e1 Slawomir Laba    2022-10-24  3677  				flow_pctypes);
3b32c9932853e1 Slawomir Laba    2022-10-24  3678  		}
141d0c9037ca57 Jacob Keller     2025-05-05  3679  		hena |= BIT_ULL(LIBIE_FILTER_PCTYPE_FRAG_IPV6);
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3680  		break;
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3681  	case AH_ESP_V4_FLOW:
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3682  	case AH_V4_FLOW:
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3683  	case ESP_V4_FLOW:
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3684  	case SCTP_V4_FLOW:
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3685  		if ((nfc->data & RXH_L4_B_0_1) ||
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3686  		    (nfc->data & RXH_L4_B_2_3))
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3687  			return -EINVAL;
141d0c9037ca57 Jacob Keller     2025-05-05  3688  		hena |= BIT_ULL(LIBIE_FILTER_PCTYPE_NONF_IPV4_OTHER);
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3689  		break;
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3690  	case AH_ESP_V6_FLOW:
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3691  	case AH_V6_FLOW:
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3692  	case ESP_V6_FLOW:
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3693  	case SCTP_V6_FLOW:
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3694  		if ((nfc->data & RXH_L4_B_0_1) ||
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3695  		    (nfc->data & RXH_L4_B_2_3))
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3696  			return -EINVAL;
141d0c9037ca57 Jacob Keller     2025-05-05  3697  		hena |= BIT_ULL(LIBIE_FILTER_PCTYPE_NONF_IPV6_OTHER);
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3698  		break;
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3699  	case IPV4_FLOW:
141d0c9037ca57 Jacob Keller     2025-05-05  3700  		hena |= BIT_ULL(LIBIE_FILTER_PCTYPE_NONF_IPV4_OTHER) |
141d0c9037ca57 Jacob Keller     2025-05-05  3701  			BIT_ULL(LIBIE_FILTER_PCTYPE_FRAG_IPV4);
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3702  		break;
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3703  	case IPV6_FLOW:
141d0c9037ca57 Jacob Keller     2025-05-05  3704  		hena |= BIT_ULL(LIBIE_FILTER_PCTYPE_NONF_IPV6_OTHER) |
141d0c9037ca57 Jacob Keller     2025-05-05  3705  			BIT_ULL(LIBIE_FILTER_PCTYPE_FRAG_IPV6);
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3706  		break;
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3707  	default:
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3708  		return -EINVAL;
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3709  	}
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3710  
3b32c9932853e1 Slawomir Laba    2022-10-24 @3711  	for_each_set_bit(flow_id, flow_pctypes, FLOW_PCTYPES_SIZE) {
3b32c9932853e1 Slawomir Laba    2022-10-24  3712  		i_setc = (u64)i40e_read_rx_ctl(hw, I40E_GLQF_HASH_INSET(0, flow_id)) |
3b32c9932853e1 Slawomir Laba    2022-10-24  3713  			 ((u64)i40e_read_rx_ctl(hw, I40E_GLQF_HASH_INSET(1, flow_id)) << 32);
54b5af5a438076 Slawomir Laba    2022-10-24  3714  		i_set = i40e_get_rss_hash_bits(&pf->hw, nfc, i_setc);
3b32c9932853e1 Slawomir Laba    2022-10-24  3715  
3b32c9932853e1 Slawomir Laba    2022-10-24  3716  		i40e_write_rx_ctl(hw, I40E_GLQF_HASH_INSET(0, flow_id),
eb0dd6e4a3b3df Carolyn Wyborny  2016-07-27  3717  				  (u32)i_set);
3b32c9932853e1 Slawomir Laba    2022-10-24  3718  		i40e_write_rx_ctl(hw, I40E_GLQF_HASH_INSET(1, flow_id),
eb0dd6e4a3b3df Carolyn Wyborny  2016-07-27  3719  				  (u32)(i_set >> 32));
3b32c9932853e1 Slawomir Laba    2022-10-24  3720  		hena |= BIT_ULL(flow_id);
3b32c9932853e1 Slawomir Laba    2022-10-24  3721  	}
eb0dd6e4a3b3df Carolyn Wyborny  2016-07-27  3722  
272cdaf2472ab7 Shannon Nelson   2016-02-17  3723  	i40e_write_rx_ctl(hw, I40E_PFQF_HENA(0), (u32)hena);
272cdaf2472ab7 Shannon Nelson   2016-02-17  3724  	i40e_write_rx_ctl(hw, I40E_PFQF_HENA(1), (u32)(hena >> 32));
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3725  	i40e_flush(hw);
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3726  
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3727  	return 0;
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3728  }
c7d05ca89f8e40 Jesse Brandeburg 2013-09-11  3729  

:::::: The code at line 3711 was first introduced by commit
:::::: 3b32c9932853e11d71f9db012d69e92e4669ba23 i40e: Fix flow-type by setting GL_HASH_INSET registers

:::::: TO: Slawomir Laba <slawomirx.laba@intel.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

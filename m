Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE81265CB2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478449; cv=none; b=LzVyAeOTycyg1aGcZBZyy6o3SMOnmNVxNu9Qqrz6y6SMpSzIzYyMaisQ6gLu91a4sjFJpktOuLoIZu40KbNzJ8eHk4IWXca1S1lApjgPppLI/hHQ6v2kPlki4By1DZwTFM29s/i+JqVeSFcHRqptZs7U7DfSae1Gy9DxY/JKTjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478449; c=relaxed/simple;
	bh=0DPLET+h2t8OXJzasT0I28aOGq2AtnTh+iDdi/NNt/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZXzZ1tXlAL5PkvXN7/iHKiN8OX9XM4TzEBBFqWgTbyKQHOm9QaRK3nrLYBFHX52S3sCBpRvnn1nyPccw6LsutxyxOU/wcWWCi3dAcz3OWrvWN9nfV72ajkF4IDwbpx2vE2JbAkcN6MQbmuJyi91B0qz7asMVtNHi5b7jdn1/Af8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHaHHfu9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHaHHfu9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740478447; x=1772014447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0DPLET+h2t8OXJzasT0I28aOGq2AtnTh+iDdi/NNt/M=;
  b=WHaHHfu9jeMYdFpTpSTS9CMopjxDN96WX+IZHip/J3Ol1cZkI/vNg8nn
   qqbkA9ttGlxrNF96yE7BdFXPi0Pktth0crKeFufFqJoCfvYHdx7JKVMbA
   MO7qaRYLJTbOPMszpVc66thgzMARsG2lhxxTYAze6DEayZRsY/rp6EOVH
   PJ3LO9lhOEwgwyjBhBwPFpHtdUcjlQAJCN8P1ZYlpRCIDONnfHi/ssIkO
   pHHm9sUrs7b5/95D9sow0ufiYXl3xehhDt0UKLa4f22YLmC/6sNl64C1d
   m/6m9NAweJSKtQPUzJP1g+ogNtxcS7kCgIdERYiyuZnsQlqlO5YhwiP68
   Q==;
X-CSE-ConnectionGUID: F46PHnEXQS6qXhgup7Kafw==
X-CSE-MsgGUID: UMomd3L7RruBloNcdK+JUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41479057"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41479057"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 02:14:07 -0800
X-CSE-ConnectionGUID: K2i0vfLzS1Wwfc0u1jLODQ==
X-CSE-MsgGUID: FLznnc+OREyxS6UnsJIVmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="147171318"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Feb 2025 02:14:06 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmrwx-000A6p-26;
	Tue, 25 Feb 2025 10:14:03 +0000
Date: Tue, 25 Feb 2025 18:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 12/45]
 security/selinux/hooks.c:5970:63: error: passing argument 3 of
 'selinux_xfrm_postroute_last' from incompatible pointer type
Message-ID: <202502251801.Hka0XLwL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/stephensmalley/selinux-kernel working-selinuxns
head:   752b9498c24448fa4ace5104afa9a1c8ba1f2832
commit: 897e85169ad60085853a3d494489bf6ab7dac182 [12/45] selinux: update hook functions to use correct selinux namespace
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250225/202502251801.Hka0XLwL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502251801.Hka0XLwL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251801.Hka0XLwL-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/selinux/hooks.c: In function 'selinux_sock_rcv_skb_compat':
   security/selinux/hooks.c:5271:41: warning: passing argument 1 of 'selinux_xfrm_sock_rcv_skb' makes integer from pointer without a cast [-Wint-conversion]
    5271 |         err = selinux_xfrm_sock_rcv_skb(sksec, skb, &ad);
         |                                         ^~~~~
         |                                         |
         |                                         struct sk_security_struct *
   In file included from security/selinux/hooks.c:104:
   security/selinux/include/xfrm.h:65:49: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'struct sk_security_struct *'
      65 | static inline int selinux_xfrm_sock_rcv_skb(u32 sk_sid, struct sk_buff *skb,
         |                                             ~~~~^~~~~~
   security/selinux/hooks.c: In function 'selinux_ip_postroute_compat':
>> security/selinux/hooks.c:5970:63: error: passing argument 3 of 'selinux_xfrm_postroute_last' from incompatible pointer type [-Werror=incompatible-pointer-types]
    5970 |         if (selinux_xfrm_postroute_last(sksec->sid, skb, sksec->state, &ad,
         |                                                          ~~~~~^~~~~~~
         |                                                               |
         |                                                               struct selinux_state *
   In file included from security/selinux/hooks.c:104:
   security/selinux/include/xfrm.h:72:73: note: expected 'struct common_audit_data *' but argument is of type 'struct selinux_state *'
      72 |                                               struct common_audit_data *ad,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   security/selinux/hooks.c:5970:72: warning: passing argument 4 of 'selinux_xfrm_postroute_last' makes integer from pointer without a cast [-Wint-conversion]
    5970 |         if (selinux_xfrm_postroute_last(sksec->sid, skb, sksec->state, &ad,
         |                                                                        ^~~
         |                                                                        |
         |                                                                        struct common_audit_data *
   In file included from security/selinux/hooks.c:104:
   security/selinux/include/xfrm.h:73:50: note: expected 'u8' {aka 'unsigned char'} but argument is of type 'struct common_audit_data *'
      73 |                                               u8 proto)
         |                                               ~~~^~~~~
>> security/selinux/hooks.c:5970:13: error: too many arguments to function 'selinux_xfrm_postroute_last'
    5970 |         if (selinux_xfrm_postroute_last(sksec->sid, skb, sksec->state, &ad,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from security/selinux/hooks.c:104:
   security/selinux/include/xfrm.h:71:19: note: declared here
      71 | static inline int selinux_xfrm_postroute_last(u32 sk_sid, struct sk_buff *skb,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/selinux_xfrm_postroute_last +5970 security/selinux/hooks.c

  5945	
  5946	
  5947	static unsigned int selinux_ip_postroute_compat(struct sk_buff *skb,
  5948						const struct nf_hook_state *state)
  5949	{
  5950		struct sock *sk;
  5951		struct sk_security_struct *sksec;
  5952		struct common_audit_data ad;
  5953		struct lsm_network_audit net;
  5954		u8 proto = 0;
  5955	
  5956		sk = skb_to_full_sk(skb);
  5957		if (sk == NULL)
  5958			return NF_ACCEPT;
  5959		sksec = selinux_sock(sk);
  5960	
  5961		ad_net_init_from_iif(&ad, &net, state->out->ifindex, state->pf);
  5962		if (selinux_parse_skb(skb, &ad, NULL, 0, &proto))
  5963			return NF_DROP;
  5964	
  5965		if (selinux_secmark_enabled())
  5966			if (avc_has_perm(sksec->state, sksec->sid, skb->secmark,
  5967					 SECCLASS_PACKET, PACKET__SEND, &ad))
  5968				return NF_DROP_ERR(-ECONNREFUSED);
  5969	
> 5970		if (selinux_xfrm_postroute_last(sksec->sid, skb, sksec->state, &ad,
  5971						proto))
  5972			return NF_DROP_ERR(-ECONNREFUSED);
  5973	
  5974		return NF_ACCEPT;
  5975	}
  5976	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

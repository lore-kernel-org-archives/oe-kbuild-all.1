Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DA2190664
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 05:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740461744; cv=none; b=UoX/iuPDB5uUVJ/NsEb2jqkGTMla0PpNGPlymTumXIb/bkuuASxFkAS5sePQfVZZ9Fu+G0PXsUnewmthFWXUzy6M3kjL0o5RGjK5LHovZi3+nHNyT7nAiBxIjBAOhIL4zw8ioYzQ+VQEmEiSQBhqYgVSe93B8M0t3WLmFImP1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740461744; c=relaxed/simple;
	bh=YJdCnwsW0pSl8EGudP+zkEAPojJvpiNBIuv9hO6LA/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CRQ6leyBz7LACwpqa6gQmUujCt2AakCOOFT+ssj9STL4QrA2ir30YmxvuBQwoi4gVFCS3ghgV/FC4Ki5Xxx0kkfwMr2enc+mGx/ApU6U5VBD6LU85V10oOfIs6LNSbwyMlif8pyUsE8q9gx50+gwa+6+362E0cn+O/uqjIg/USI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5uB6ukP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5uB6ukP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740461741; x=1771997741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YJdCnwsW0pSl8EGudP+zkEAPojJvpiNBIuv9hO6LA/0=;
  b=V5uB6ukPg+avsKXB9t7Rpn/Ax9I1ogBgom01A4VS+0OCtAAOPWoOg2s1
   3p2U74sDPp1g7t+jrkm93SPlAqHnBw1vAIrTOUdFdGhaPEbDhg4QaizgG
   Wo4Pyd9cw1oeHGTB0fT/tM/fXa7sTp0ABiT8NTIGjiE0qWGn10b9uY0Ma
   HrfLKokxMMrZ10N/ViWb3qDKyGusCbJ/fXBG3OlNFnSD1w3qSk91hFn65
   FGxPpPUbZ6UQax10+/+Bmcnv2ZIBmjM9zA0vESNFfN9nnlHr3fqRqDV7/
   4a2CKJc05tO1ei5BlzfiY5kBbTSeoBaMef/2r/uGYW0hVHs8HlgfSETDl
   w==;
X-CSE-ConnectionGUID: 1U/voyCyROS7J7dQK2UmSg==
X-CSE-MsgGUID: vHcO+PIZT7q35YKEvBqoeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58671397"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="58671397"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 21:35:41 -0800
X-CSE-ConnectionGUID: BUYfEhA+TS2Z/BhoiFRXRA==
X-CSE-MsgGUID: 808sZLpJSKmpnPI9Xk88IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116769042"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Feb 2025 21:35:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmnbV-0009od-30;
	Tue, 25 Feb 2025 05:35:37 +0000
Date: Tue, 25 Feb 2025 13:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 12/45]
 security/selinux/hooks.c:5271:41: warning: passing argument 1 of
 'selinux_xfrm_sock_rcv_skb' makes integer from pointer without a cast
Message-ID: <202502251338.bnWxHSv5-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250225/202502251338.bnWxHSv5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502251338.bnWxHSv5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251338.bnWxHSv5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/selinux/hooks.c: In function 'selinux_sock_rcv_skb_compat':
>> security/selinux/hooks.c:5271:41: warning: passing argument 1 of 'selinux_xfrm_sock_rcv_skb' makes integer from pointer without a cast [-Wint-conversion]
    5271 |         err = selinux_xfrm_sock_rcv_skb(sksec, skb, &ad);
         |                                         ^~~~~
         |                                         |
         |                                         struct sk_security_struct *
   In file included from security/selinux/hooks.c:104:
   security/selinux/include/xfrm.h:65:49: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'struct sk_security_struct *'
      65 | static inline int selinux_xfrm_sock_rcv_skb(u32 sk_sid, struct sk_buff *skb,
         |                                             ~~~~^~~~~~
   security/selinux/hooks.c: In function 'selinux_ip_postroute_compat':
   security/selinux/hooks.c:5970:63: error: passing argument 3 of 'selinux_xfrm_postroute_last' from incompatible pointer type [-Werror=incompatible-pointer-types]
    5970 |         if (selinux_xfrm_postroute_last(sksec->sid, skb, sksec->state, &ad,
         |                                                          ~~~~~^~~~~~~
         |                                                               |
         |                                                               struct selinux_state *
   In file included from security/selinux/hooks.c:104:
   security/selinux/include/xfrm.h:72:73: note: expected 'struct common_audit_data *' but argument is of type 'struct selinux_state *'
      72 |                                               struct common_audit_data *ad,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~
>> security/selinux/hooks.c:5970:72: warning: passing argument 4 of 'selinux_xfrm_postroute_last' makes integer from pointer without a cast [-Wint-conversion]
    5970 |         if (selinux_xfrm_postroute_last(sksec->sid, skb, sksec->state, &ad,
         |                                                                        ^~~
         |                                                                        |
         |                                                                        struct common_audit_data *
   In file included from security/selinux/hooks.c:104:
   security/selinux/include/xfrm.h:73:50: note: expected 'u8' {aka 'unsigned char'} but argument is of type 'struct common_audit_data *'
      73 |                                               u8 proto)
         |                                               ~~~^~~~~
   security/selinux/hooks.c:5970:13: error: too many arguments to function 'selinux_xfrm_postroute_last'
    5970 |         if (selinux_xfrm_postroute_last(sksec->sid, skb, sksec->state, &ad,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from security/selinux/hooks.c:104:
   security/selinux/include/xfrm.h:71:19: note: declared here
      71 | static inline int selinux_xfrm_postroute_last(u32 sk_sid, struct sk_buff *skb,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/selinux_xfrm_sock_rcv_skb +5271 security/selinux/hooks.c

  5244	
  5245	static int selinux_sock_rcv_skb_compat(struct sock *sk, struct sk_buff *skb,
  5246					       u16 family)
  5247	{
  5248		int err = 0;
  5249		struct sk_security_struct *sksec = selinux_sock(sk);
  5250		u32 sk_sid = sksec->sid;
  5251		struct selinux_state *state = sksec->state;
  5252		struct common_audit_data ad;
  5253		struct lsm_network_audit net;
  5254		char *addrp;
  5255	
  5256		ad_net_init_from_iif(&ad, &net, skb->skb_iif, family);
  5257		err = selinux_parse_skb(skb, &ad, &addrp, 1, NULL);
  5258		if (err)
  5259			return err;
  5260	
  5261		if (selinux_secmark_enabled()) {
  5262			err = avc_has_perm(state, sk_sid, skb->secmark, SECCLASS_PACKET,
  5263					   PACKET__RECV, &ad);
  5264			if (err)
  5265				return err;
  5266		}
  5267	
  5268		err = selinux_netlbl_sock_rcv_skb(sksec, skb, family, &ad);
  5269		if (err)
  5270			return err;
> 5271		err = selinux_xfrm_sock_rcv_skb(sksec, skb, &ad);
  5272	
  5273		return err;
  5274	}
  5275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

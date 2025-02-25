Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E29D257429
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 07:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740468549; cv=none; b=Y+6fSoW+C6VhEY0EyK6Yxcwr1CFMKrrcq6NxemkVM4BSTaTWvWB2GGtc5f7RszmuJ5mQHn1O+jiL+d8Ly6WDCIDINlchyMKJhSnQskVoAaJMhvuJ4oMSRUtjVQ2chTIqXXjpHedohNPhYnIBhKImO60X0PUqobTBw+n7d3CKjhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740468549; c=relaxed/simple;
	bh=OjytoOiMepBEkeiH7ieJ4SNZJYZ0L9P+Cu2wdrHnsvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VbdqsHkECJCdj0mPYbXYCA34nhQukjgHhnZ4R2aGlVtYdtIfIkBdPR3TBzqr2/xV5+FyFN1XoPnmJOkwhEXDJzwHQ+sbGsc7XTboSZBrT3WnxBZukTVAu2XTZMFCw8p82+Qscrqhi98HmLFvFN2NjKnILzkKNdtynizbEM2vjY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XiFXn8eF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XiFXn8eF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740468548; x=1772004548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OjytoOiMepBEkeiH7ieJ4SNZJYZ0L9P+Cu2wdrHnsvc=;
  b=XiFXn8eFTxGdUR36mBUxnUcXayGvVMsCIvoMgVygMz0JIJtY8Ucu8FTw
   uiRRtJMjv0WjwW5Ye1LNtg85wIWKzq2uq+17LUEZD4Q2CbAAFC3hqso+i
   QRalxKJeVUHFKDZtZMB55RD1eSdjEu3iJFRrOl1zr8DUlc5iW4r0ow0xj
   5/Ie46/A96loGryx4tXRPS6nqG8YH6wQrgARNzt3A+U1a0QqSpWSBxrpV
   YiWA+Pso8FvhV2nuy9cwhGSrqeghwnBunCy2aQaViWhvPjTTMPHaVgNZR
   lPUnQmjhPgEfnXt8by04QizJoR+yZ2oWoXA8qEg2hXwqCWFBz984Szne2
   A==;
X-CSE-ConnectionGUID: dNaFxOQLQPGx9q/i4oMm1Q==
X-CSE-MsgGUID: tFCfRB9LSQ2MvPp/9ucl0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40447203"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="40447203"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 23:29:07 -0800
X-CSE-ConnectionGUID: moa90JC0T/GPi+dBwgFQoA==
X-CSE-MsgGUID: KjkvFqDYQfe0lTEW/Gdr7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="120927077"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2025 23:29:06 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmpMs-0009tC-1Z;
	Tue, 25 Feb 2025 07:28:44 +0000
Date: Tue, 25 Feb 2025 15:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 12/45]
 security/selinux/hooks.c:5271:34: error: incompatible pointer to integer
 conversion passing 'struct sk_security_struct *' to parameter of type 'u32'
 (aka 'unsigned int')
Message-ID: <202502251541.nBJLeBE7-lkp@intel.com>
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
config: i386-defconfig (https://download.01.org/0day-ci/archive/20250225/202502251541.nBJLeBE7-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502251541.nBJLeBE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251541.nBJLeBE7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/selinux/hooks.c:5271:34: error: incompatible pointer to integer conversion passing 'struct sk_security_struct *' to parameter of type 'u32' (aka 'unsigned int') [-Wint-conversion]
    5271 |         err = selinux_xfrm_sock_rcv_skb(sksec, skb, &ad);
         |                                         ^~~~~
   security/selinux/include/xfrm.h:65:49: note: passing argument to parameter 'sk_sid' here
      65 | static inline int selinux_xfrm_sock_rcv_skb(u32 sk_sid, struct sk_buff *skb,
         |                                                 ^
>> security/selinux/hooks.c:5971:6: error: too many arguments to function call, expected 4, have 5
    5970 |         if (selinux_xfrm_postroute_last(sksec->sid, skb, sksec->state, &ad,
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    5971 |                                         proto))
         |                                         ^~~~~
   security/selinux/include/xfrm.h:71:19: note: 'selinux_xfrm_postroute_last' declared here
      71 | static inline int selinux_xfrm_postroute_last(u32 sk_sid, struct sk_buff *skb,
         |                   ^                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      72 |                                               struct common_audit_data *ad,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      73 |                                               u8 proto)
         |                                               ~~~~~~~~
   2 errors generated.


vim +5271 security/selinux/hooks.c

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

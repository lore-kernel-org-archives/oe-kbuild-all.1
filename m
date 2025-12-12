Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6351530E837
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 21:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765576658; cv=none; b=W2RPYo5cO9Ge0sfOtErWAVmjk2/dHHufDvJ3LowKFVTZ+ADkGTH8YWnKF5mo4zSdIX6UZsnBGQkRiNmqgA6PTT5IgSn2WRVzRBPSgovVIg2CUtoDSOeEJkzsepFbn9hS7/yc0RMlD6E42tjrjG3a9c4NnkUXcsalB5rCsPt1CjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765576658; c=relaxed/simple;
	bh=lygPt0i6nWyCczFQEACCWESKpELX4p819qvFJrpLYeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pSNxUfYtRFQ2hhGr7/Vj3UPIT6T8fGFIAEx8B/9nnScJWPBLcY81W4Ypvj4+bJZx02eALhi1l6I4QwuNUimpQvwUtDM5nUNJ0lBWIuGfadHcMAYuABUjLv0UhOOHrQ+EyBAD9hAEN5LfTx6Q5b16GDpwnC+vHlqt7UUoMTk/z0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAMQ3yXa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAMQ3yXa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765576656; x=1797112656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lygPt0i6nWyCczFQEACCWESKpELX4p819qvFJrpLYeI=;
  b=LAMQ3yXa+MqVBKSUnHTpV163J+Q3G5KFR53cE5dQLMkPRj0zSAUK9wjj
   CjIdCVk1YCuvP3tQYghGYiCQt264hzTtSu+Rb7TcRpK68jUag/1ZQdPmi
   JLSSzBbovF5VM+1fhA7ECLiQyivnJM2zAFmSxfYGv0fZAx2SSwukcVAJD
   W4e3jZRLVNYko26r22qE1bLNLfvaEPotm9U50Q+BV4OVJNzo09dmekMDd
   EiwvsyYyqzRy8/8vrUsqQf4mB5x2KmuP4jM/1rvANOArF2Dy73Ob7GzJE
   yjZEbjQNsFSuaNXFKAkhdZJpkjF9lMX9IVjeS7CR3r4iDLilHEhuC0SZ5
   w==;
X-CSE-ConnectionGUID: U2Ae/L0vQKmAtwCovorh2w==
X-CSE-MsgGUID: kbxhf7xaRnasz2RfEhqbjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="84992737"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="84992737"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 13:57:34 -0800
X-CSE-ConnectionGUID: GhkrkMPGTBC39yjWg4O4Bg==
X-CSE-MsgGUID: 7T35offkREy1v7FJQzZxVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196263039"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 13:57:34 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUB8k-000000006g9-3gcH;
	Fri, 12 Dec 2025 21:57:30 +0000
Date: Sat, 13 Dec 2025 05:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine/base 3/3] net/core/filter.c:12481:21: error:
 use of undeclared identifier '__udp4_lib_rcv'
Message-ID: <202512130500.JnMumY5j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux coroutine/base
head:   3d1468dcf813bc71d425b7ce656a6877d98684e9
commit: 3d1468dcf813bc71d425b7ce656a6877d98684e9 [3/3] Basic Rx integration
config: arm-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130500.JnMumY5j-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130500.JnMumY5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130500.JnMumY5j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/filter.c:12481:21: error: use of undeclared identifier '__udp4_lib_rcv'
           udp_rcv_func_ptr = __udp4_lib_rcv;
                              ^
>> net/core/filter.c:12504:22: error: use of undeclared identifier 'icmp_rcv'; did you mean 'ip_rcv'?
           icmp_rcv_func_ptr = icmp_rcv;
                               ^~~~~~~~
                               ip_rcv
   include/net/ip.h:164:5: note: 'ip_rcv' declared here
   int ip_rcv(struct sk_buff *skb, struct net_device *dev, struct packet_type *pt,
       ^
   2 errors generated.


vim +/__udp4_lib_rcv +12481 net/core/filter.c

 12466	
 12467	__bpf_kfunc int bpf_coro_udp_rcv(struct sk_buff *skb)
 12468	{
 12469		int result_code;
 12470		int (*udp_rcv_func_ptr)(struct sk_buff *);
 12471		struct sk_buff *skb_iter;
 12472		struct sk_buff *skb_dup;
 12473		skb_iter = skb;
 12474		if (!skb_iter) {
 12475			return -22;
 12476		}
 12477		skb_dup = skb_clone(skb_iter, GFP_ATOMIC);
 12478		if (!skb_dup) {
 12479			return -12;
 12480		}
 12481		udp_rcv_func_ptr = __udp4_lib_rcv;
 12482		if (!udp_rcv_func_ptr) {
 12483			kfree_skb(skb_dup);
 12484			return -2;
 12485		}
 12486		result_code = udp_rcv_func_ptr(skb_dup);
 12487		return result_code;
 12488	}
 12489	
 12490	__bpf_kfunc int bpf_coro_icmp_rcv(struct sk_buff *skb)
 12491	{
 12492		int result_code;
 12493		int (*icmp_rcv_func_ptr)(struct sk_buff *);
 12494		struct sk_buff *skb_iter;
 12495		struct sk_buff *skb_dup;
 12496		skb_iter = skb;
 12497		if (!skb_iter) {
 12498			return -22;
 12499		}
 12500		skb_dup = skb_clone(skb_iter, GFP_ATOMIC);
 12501		if (!skb_dup) {
 12502			return -12;
 12503		}
 12504		icmp_rcv_func_ptr = icmp_rcv;
 12505		if (!icmp_rcv_func_ptr) {
 12506			kfree_skb(skb_dup);
 12507			return -2;
 12508		}
 12509		result_code = icmp_rcv_func_ptr(skb_dup);
 12510		return result_code;
 12511	}
 12512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

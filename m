Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362324E4B4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 20:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571970; cv=none; b=czbYtqYtbyyyzFnYvi7MZ0NiagyYcNtx7+5dgQK1/k3Z8Uxs0pUv+ZXcJ7JrzNbX1ugsA6+qWD5siWXxjQniy+O87ZhFbdljx6hG0UzOBED6dkfwqH0EyZkRx1CwTudJMG7/kJrPxNYiNCuWvDV2peSYOSWO6AzegCu8+NrExuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571970; c=relaxed/simple;
	bh=/q7VnH+ahkfwVlq/pzUI6a493buOTcvKclwhYnJ+el8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b8BVTtOvEqnIgZVVma7XrXAlyIBBYczcNBO9Z+LOBlFwTKZpF/QUot9ac92kD1+DUZJV0fSds0l7zQevv8OXADwzvRlFz0Mnks4jiy8o1wxlqpwTX5tiZ1Ec/dNlCPd60Js1hw8x8zHbZZCKpZaK3Y9fWkhkAbs8mWQstZr1OEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ee6ZVYrp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ee6ZVYrp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765571969; x=1797107969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/q7VnH+ahkfwVlq/pzUI6a493buOTcvKclwhYnJ+el8=;
  b=Ee6ZVYrpIjZe6hoCd7FJPLLubf1iU4m+ClHLyZfRQFzKl67PTSgutegK
   f5sG813yDZUjhZWEkpa4bnNGVLITgXkNvdeqa3ZmUb2W9wrMFT59fF+Tq
   wKQ5jCkpmpvmxhtd+wgJ/i3MeeAWBDauumgG2+SsM4gSy0XV+OIAuZUT9
   vGrlhMCZKku/MiDKInwxOXqwYDLMo7XOvxIt4Mzr6zg1PizNdbFcvuJiH
   +R+hIJRJCwT6MQzZTHkHqFpoSjbXA5eJ/hFzzAX/DXbIrRqVA0YfgDl0t
   Uh3VKLSHXms+d4r92ZXcZBdertTwS3kOBhHwj1kS3HlA3m1m2kkM+GuEu
   w==;
X-CSE-ConnectionGUID: MEjmx2DZT96R9y/21SOSbQ==
X-CSE-MsgGUID: O5J3DdEWR+yLDd72QmD9ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71427756"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="71427756"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 12:39:29 -0800
X-CSE-ConnectionGUID: pjXz+ICOSlW3eEbhwtjAeg==
X-CSE-MsgGUID: +ij5Fa0TSWCh6hkYmvOiYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="197176798"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Dec 2025 12:39:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU9vB-000000006ah-1RJM;
	Fri, 12 Dec 2025 20:39:25 +0000
Date: Sat, 13 Dec 2025 04:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine/base 3/3] net/core/filter.c:12481:28: error:
 '__udp4_lib_rcv' undeclared; did you mean '__udp4_lib_lookup'?
Message-ID: <202512130456.0dPDwxGr-lkp@intel.com>
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
config: i386-randconfig-141-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130456.0dPDwxGr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130456.0dPDwxGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130456.0dPDwxGr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> net/core/dev.c:6374:14: warning: no previous prototype for '__netif_receive_skb_hook' [-Wmissing-prototypes]
    6374 | noinline int __netif_receive_skb_hook(struct sk_buff *skb)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
--
   net/core/filter.c: In function 'bpf_coro_udp_rcv':
>> net/core/filter.c:12481:28: error: '__udp4_lib_rcv' undeclared (first use in this function); did you mean '__udp4_lib_lookup'?
   12481 |         udp_rcv_func_ptr = __udp4_lib_rcv;
         |                            ^~~~~~~~~~~~~~
         |                            __udp4_lib_lookup
   net/core/filter.c:12481:28: note: each undeclared identifier is reported only once for each function it appears in
   net/core/filter.c: In function 'bpf_coro_icmp_rcv':
>> net/core/filter.c:12504:29: error: 'icmp_rcv' undeclared (first use in this function); did you mean 'ip_rcv'?
   12504 |         icmp_rcv_func_ptr = icmp_rcv;
         |                             ^~~~~~~~
         |                             ip_rcv


vim +12481 net/core/filter.c

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

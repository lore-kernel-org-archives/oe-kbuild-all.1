Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A00A59
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 00:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765757034; cv=none; b=aCnYobaxJ7ElonO1ecHVMOC8RfLLGzkQn6nNwjrJ7P5Y+cejd5B5PDFo5QzWgjfQNrnf5tBnVmT1nHxW7FbHeVDOnydLNpCQmMSD5Qxzz2mmdpnqyeBhUufD+0FTQGJKC/gnHaRdQ/2VjHClclGMzt/gUYUSlpaYu4G3U8uYlFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765757034; c=relaxed/simple;
	bh=k8ypB53A3wPLGEiDvs4pXb1gMcNQVPlluCQ8aVYUd5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B/d3mcgWxGLMTCx6qU9BXMcEr0cBZKNGflIu7yRVC99MODC3B9J8zt9MFsR9RVuXeSVBiRvCLQ+pYzWX4Cpq89aKCoOL3LX5tOC5Tp+g48L91ZtsVl/u/vjP893iJTdLpuS3y0RAAz01VO5bBtXNj6D3ZhhUsYwBEjqWYrhgsAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRGGOdPq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRGGOdPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765757032; x=1797293032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k8ypB53A3wPLGEiDvs4pXb1gMcNQVPlluCQ8aVYUd5Q=;
  b=TRGGOdPqUAIJyC+xwlbZ3j2UEEirMOSSJh29Xkz4JKBvfgo/kiguXrra
   QQCUlB/LB7+HEqR5i9bm1fkDSPTLoQzKtlKkzeWQRv7FwhM4LlSI58xEu
   h56AjXN4YZIall9WTGxPRjNMs7fFR4R61fT0lvrPETRZ+5+Vg+0/SWe1G
   6A+0K4WCXZF2cGNPZo3WWELACyaVIfdKrHy2orsNXZd4c8k73wcsc+ORE
   0Qxt9BayTq+ySLdcaDpPBsWmVp+FERRc9dfNBVrqTbrHIVUzBOE+S9jgG
   gOQBR6RoL/H75R2ozDWnfVQh6QNQYC57HmeL2UzLJ7WDfn8vNLPRMUlMy
   Q==;
X-CSE-ConnectionGUID: VnW/CJ8HQQyQE9mSS0gDsQ==
X-CSE-MsgGUID: CXbi+BuGSbqVpOIlJ0A5AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85072639"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="85072639"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 16:03:51 -0800
X-CSE-ConnectionGUID: WdLrY4qST3evuM14JE3Aig==
X-CSE-MsgGUID: b8XoPNpWQLGoxAkPSdIwTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197350436"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 14 Dec 2025 16:03:51 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUw44-000000002Vg-1yJo;
	Mon, 15 Dec 2025 00:03:48 +0000
Date: Mon, 15 Dec 2025 01:02:49 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine/base 3/3] net/core/filter.c:12481:28: error:
 '__udp4_lib_rcv' undeclared; did you mean '__udp4_lib_lookup'?
Message-ID: <202512150122.DIKOwK0K-lkp@intel.com>
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
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251215/202512150122.DIKOwK0K-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150122.DIKOwK0K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150122.DIKOwK0K-lkp@intel.com/

All errors (new ones prefixed by >>):

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

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707293002DC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 00:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765759554; cv=none; b=oG06KLV04VOaL4KVsqB3oin09h6hQ49xuRqrzgOf7aa6twucQ6t7dk8cn8D4jJdIggBL7JEfkBxxMbZIqBt4hj3fsA8t/pVAK1eDgstnahFZZ/mBAdiHaPhkDXfeLTwBrc4GHzmPKIqWgH1/FuCsXquTif2bUtw44ssz8lD0+Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765759554; c=relaxed/simple;
	bh=FQ1FWP5YMNGg742wy9lS+ubxF2Pf+H1BdJYdl6ka+e4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NzQFfj05+256Dktb0AudBNrrRmGJx0YAkIT2t9Az3VFqRi8rTai2WN+lmltq8MvgSgEg9DsfCWndYM0uP3Nc/7ogRPQO2iUXJv+CwFcZdvRi3PO6EMOzATVG2NQLCXRYuSEnEQ8pq1rS5XAH6GZuYpJjzgqJ1cnD6BbgfCXtC7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQ8CctDo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQ8CctDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765759553; x=1797295553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FQ1FWP5YMNGg742wy9lS+ubxF2Pf+H1BdJYdl6ka+e4=;
  b=CQ8CctDonZf4NKyRSgrfXWficB/aMn2FhvvM/ud6fr641QAE5ARG3eQ5
   uh5SM6eJjmWrnS9HqlzGA+Sg/9h/oP8OCh4uVSCBLJFl4o9SFExH+9J2F
   UlSI1kHhb/ew/BjEmiNhPNYSAKus9x9frW59UINN/kCZniYkxv+12wXDn
   a274CszjDrmUwao6S8M2YpMni2Ga+oN2jdvQU1nGGfOcfcj3q3/DQ4qKb
   5zD8DK+u5WR4FJsNzPawJ37bARTIOvxNfUj5ZAxLSqlQsTMcipogiJOjT
   qAX29vRk6zx1tkBIEfKgvbaLYE76p5MIIk206gEDlL/KcodtIdKih66oW
   A==;
X-CSE-ConnectionGUID: 4mQ0sjrYQ36FPMgoVK6vkA==
X-CSE-MsgGUID: Poh7Cu7tRKq/XWvLFR8Z4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85254385"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="85254385"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 16:45:52 -0800
X-CSE-ConnectionGUID: WyJHMdRxRESw569sta8M8A==
X-CSE-MsgGUID: E3qLJoEGRFS1DG9yGwJubA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="220986787"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Dec 2025 16:45:51 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUwij-000000002WS-0JoH;
	Mon, 15 Dec 2025 00:45:49 +0000
Date: Mon, 15 Dec 2025 01:45:39 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine/base 3/3] net/core/filter.c:12481:21: error:
 use of undeclared identifier '__udp4_lib_rcv'
Message-ID: <202512150111.1iUzKcTC-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251215/202512150111.1iUzKcTC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150111.1iUzKcTC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150111.1iUzKcTC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/filter.c:12481:21: error: use of undeclared identifier '__udp4_lib_rcv'
    12481 |         udp_rcv_func_ptr = __udp4_lib_rcv;
          |                            ^
>> net/core/filter.c:12504:22: error: use of undeclared identifier 'icmp_rcv'; did you mean 'ip_rcv'?
    12504 |         icmp_rcv_func_ptr = icmp_rcv;
          |                             ^~~~~~~~
          |                             ip_rcv
   include/net/ip.h:164:5: note: 'ip_rcv' declared here
     164 | int ip_rcv(struct sk_buff *skb, struct net_device *dev, struct packet_type *pt,
         |     ^
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

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450125;
	b=Vl9PCECkLK6/Z9ecI5E1Y+pa0ML+Vz/8nklaPkXPhwZSt+GmdkW8685Peb7Tb1v25vkA
	 uxK7/NhZhWZNDU6HmXYak2PSJ563KmF7o81jZOwHPyo7kMgmFLwaumyywzawRxauOAhzr
	 qwqrW3EiSY0Pzb0my6ef46yoXMpZAhJq43egaoab6zU9ag/TAH3YX4A56qOtrWsV+0e6t
	 XUZuNfaQTNq0JcSkrQ2JPXBizrK9VryNGt9SvqYK93MHZSG2AjpoZKq3nJSN8tP/0qhKO
	 yqC16UfYuwYDHBO8i9zX26r7SQDLjiTKqzZEDUphWPeH9MlAXoHl0JL442TbnpPJATw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450125;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BDETWBk57RhCHkvDEYxUPaeJhjxlvQJ1SuqXF/6o9rU=;
	b=zGtiPoL5bGkHlYcffdUcKbB8dpgTO6HvMh6f1M4IDYQANMsxMyOQ4QdKcOAWKtbfNwBG
	 isMukAAki9ri8QpC2p/DzmmB+59qTo8O8pt7S519XLCyPSVPmMq4roW/BnNbDp+8LF7pH
	 twKSB0U0JxMY8ERBKF3UL5F5Rg/LFYE/3+PcPwitHl76oRIzSRaljaP0Pm+qdbFZT1gyN
	 EdcPcM6TVfkrbLMnifzhk00tNFxuwdCh6uE/4tjvFYQui5oVkk+SbZJGb0cmcBOElHHXL
	 DXx6nLsboxuo+pvfhDc9fNjDCEjToS8D1QH1qWYyZ5bslalPaDUs9ROnD7dscK/eAhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i70qfFS7;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE056606A319
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 22:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE056606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i70qfFS7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792450123; x=1823986123;
  h=date:from:to:cc:subject:message-id;
  bh=1FkhxuPRYe50bnWemywEBL3BoBiGWXIsShNXnjHb4k8=;
  b=i70qfFS7ba/Va3mCjJRma3N/G+909ndANc6EJJXSzX6k7TOFoHhzLV79
   37loYpVv1ngwO8eXf0ofwHMkGXY6Q3g+LuojloF78iSbz95b6iabkItG7
   aa5VCQq/A/MtXAnbEd36qiuzGtmYtCQQAaD/u9TVXlQ/QNa7LLSDSVbyG
   n6xmRHGQYIPJirpN5f0mDF93NDBecHxzFVKmewNbklVEk0uha1M1Zj4GX
   z2T78jx0UPwXssY294RdyhH+sTk+S7ZSScL3nz3eiTucTlnH0Xiaoo0jo
   2PxmuXwS/k9Miv8x9zpW7qG0mM52RfJ2t5z8aTcPQrSzVJrHthP/2M43t
   g==;
X-CSE-ConnectionGUID: fOzVvmXrTqiH9bEsOUEKcA==
X-CSE-MsgGUID: p/3VfH9TREe0JqVLpz2j6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1156268"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1156268"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:48:42 -0700
X-CSE-ConnectionGUID: DPGwH1biSUuHwmlwmG0Big==
X-CSE-MsgGUID: qS0G3a8oRyK2ylTP/7gMUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3063150"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Oct 2026 15:48:42 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIw9n-00000000MW2-0wRZ;
	Mon, 19 Oct 2026 22:48:39 +0000
Date: Tue, 20 Oct 2026 06:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:kernel-7.3/main.NFSD_TCP_WRITE_ZEROCOPY 406/408]
 Warning: net/sunrpc/svc_xprt.c:226 function parameter 'wake' not described in
 'svc_xprt_do_enqueue'
Message-ID: <202610200646.FkJTxkGV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/main.NFSD_TCP_WRITE_ZEROCOPY
head:   778e7e2f1f623dfd97c17e9da1b5d84d367a3f6f
commit: 39122acc89c20c5777690dabe10c7c6fc16d8dae [406/408] SUNRPC: Optionally avoid waking a thread after a short TCP receive
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20261020/202610200646.FkJTxkGV-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200646.FkJTxkGV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610200646.FkJTxkGV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: net/sunrpc/svc_xprt.c:226 function parameter 'wake' not described in 'svc_xprt_do_enqueue'
>> Warning: net/sunrpc/svc_xprt.c:226 expecting prototype for svc_xprt_received(). Prototype was for svc_xprt_do_enqueue() instead
   Warning: net/sunrpc/svc_xprt.c:534 function parameter 'wake' not described in 'svc_xprt_do_enqueue'
>> Warning: net/sunrpc/svc_xprt.c:534 expecting prototype for svc_xprt_enqueue(). Prototype was for svc_xprt_do_enqueue() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

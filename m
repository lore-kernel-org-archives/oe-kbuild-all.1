Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A4527144E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 01:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762911889; cv=none; b=duVEmrN5byyaqA6HpAJP4gHwXSAoJqv2ZDIr2AT7hL5PSX0N7O1dHZ7h8c4Ul5fDnz1gNaB2EFMHPkIWsuV0uA+WCL+16OmFFDAbKaFiRnjrpahWlNsSvEXAqjYEJ2otBEM7inYjnzUu2IAFtmxp6q8ySPf9Kctftz44EhW+PZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762911889; c=relaxed/simple;
	bh=mcYDaia8ApcALJQdncZ3Bn24zcnTUMQV+NL2QQlX/tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gTJAgFThrn/b7xf0KfZe8B2+J6nsPRsf00feXqshZSif77H7gSUmDoXsBz+AW1V6C3Fi8xagdLNKFTZ6NRCtY+sHcK2huMOMe94+mcWeT93QzS969+V2aNrhIizSpXvMM0LBjnZrQDJjDvP4JekxcWmos2tXq7SXKG8xKuWeW64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGnsMiwY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGnsMiwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762911888; x=1794447888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mcYDaia8ApcALJQdncZ3Bn24zcnTUMQV+NL2QQlX/tQ=;
  b=nGnsMiwY5EpwyMprxKPtFqLMBXwm/le/oum9hzOxaZkUnPw4E4mLWFkM
   TG0DuYQ55PeTXIn3RTne0ScDjp8DDLtB8TCakujcTSdV6DFN/7uFvhnCs
   8or6XteXV0QLMe+8LgYwvzw/tXH7Y4iCp8T+2DFNuiwvngZ5FrOvCOEkw
   sVIfI80OZze5qZ7h0VYf57+RF19Bg8BzAYzbfqJdYdJDX8y2FQi8hvqq9
   IkMEXvmgj1Z2dPXSxvbGMqwVkJ0FsTEwxsZf6dWxHIqo59VxPkUiwKOvZ
   ZrSG3VZDahMdh9xV6clJ0wPWGkxkP387GTHw+Iwv9BUxB2dshYADsZJ6/
   Q==;
X-CSE-ConnectionGUID: rFAv6CPXQrS8aq+iTrf07w==
X-CSE-MsgGUID: UwvH0rfJRkOZneTZt9Hodg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75653150"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="75653150"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 17:44:48 -0800
X-CSE-ConnectionGUID: 5dboXpAqQfWjnpvOoqmoKw==
X-CSE-MsgGUID: Y6jmRnP4RyOAgGd34wLgww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="189346796"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Nov 2025 17:44:46 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIzue-0003jt-0J;
	Wed, 12 Nov 2025 01:44:44 +0000
Date: Wed, 12 Nov 2025 09:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:iou-bpf/test 8/12] io_uring/bpf.h:43:1: warning: no return
 statement in function returning non-void
Message-ID: <202511121101.AKUApC2T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux iou-bpf/test
head:   22c04e600798ca3905808ff55ebf3029fca38874
commit: c153662b73aafa8d6879a136f2d643b2a2729bb6 [8/12] io_uring/bpf: add handle events callback
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251112/202511121101.AKUApC2T-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121101.AKUApC2T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511121101.AKUApC2T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:102:
   io_uring/bpf.h: In function 'io_run_cqwait_ops':
>> io_uring/bpf.h:43:1: warning: no return statement in function returning non-void [-Wreturn-type]
      43 | }
         | ^


vim +43 io_uring/bpf.h

    31	
    32	
    33	#ifdef CONFIG_IO_URING_BPF
    34	void io_unregister_bpf(struct io_ring_ctx *ctx);
    35	int io_run_cqwait_ops(struct io_ring_ctx *ctx, struct iou_loop_state *ls);
    36	#else
    37	static inline void io_unregister_bpf(struct io_ring_ctx *ctx)
    38	{
    39	}
    40	static inline int io_run_cqwait_ops(struct io_ring_ctx *ctx,
    41					    struct iou_loop_state *ls)
    42	{
  > 43	}
    44	#endif
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

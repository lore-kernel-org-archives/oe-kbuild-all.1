Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3AD10E9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 04:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754540033; cv=none; b=cGfHk3g3RVlq4AJxPfEhK/jR5jRGWFTTBhzq8BEltjYJlsJLXNA41n6Tw/qHIP0YNiu9+GfyV0RNVKlHuTYjQWGbUE1yPb7zmSrYtQ7gO1WOsuGEse6T/jPsSygj0LbEZTKZQHQfzqQ7QqRDuRd6iY8arC2uWjJhffkROYAtnwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754540033; c=relaxed/simple;
	bh=yfl5nzrnbKp0Q6TOriABcXlX1j/4hMI6wg9myBQlMk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b69r6pdgWPRfR6J876HKhnoZNJ0GI4FtEeKip3pDmTAnNLCQlhhsp4wtQ5bm65rf4e3MInBnpb6P0QGOp8QXy0Urkj0KOZc5sA4xKkEw0o38dvc5mdPJepbA6lnPkVpRv+4LsR/WABC1Z+43GSNeSXAgcMWl3KDxRMgCMynktF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/Ezr+y5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/Ezr+y5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754540031; x=1786076031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yfl5nzrnbKp0Q6TOriABcXlX1j/4hMI6wg9myBQlMk8=;
  b=H/Ezr+y5QOWD8d5zb1I76WIkYbmURJG6PSbL2EpUTGXD0eEh3xs5mUXy
   MHZK9zvDSnEh4DZgyxDtGXQwtUDoJBQJ7+YInHnSptTRtuwgeMinHwQrt
   4xwD5FhAsuY3zT4TKJwU6pAXcDUmx2z3rzRKRknTBcEDU6BdPTOz281Dq
   dVGQVjtiF+BOlTbyWkfc66TXoZ3cba+UqlvYG/054U+Og/MVEyia1LXQO
   nR+YFcrh4aVpUO1HLvtnNMZpD7mQWTbISNwK5jXF4TiYiRom64FH4dCPy
   nZC0XjixrSuEMU8k15y0Of7yzmgi2fJKLqQwK3DJZgBpzD52CBN4tbWFc
   Q==;
X-CSE-ConnectionGUID: 8ue3vfiNSZmi/irXxkAa0w==
X-CSE-MsgGUID: EBP9JlRHSIKij9Avb+Ksog==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="55902512"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="55902512"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 21:13:51 -0700
X-CSE-ConnectionGUID: ki5mlfePTDq46EGdb+oLCw==
X-CSE-MsgGUID: 8g7jcPiWTom4qV4Y4YvFAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164851034"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Aug 2025 21:13:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujs0h-0002MG-2j;
	Thu, 07 Aug 2025 04:13:47 +0000
Date: Thu, 7 Aug 2025 12:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v4 09/12] vsock/loopback: add netns support
Message-ID: <202508071150.G6ljBDH7-lkp@intel.com>
References: <20250805-vsock-vmtest-v4-9-059ec51ab111@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805-vsock-vmtest-v4-9-059ec51ab111@meta.com>

Hi Bobby,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on dd500e4aecf25e48e874ca7628697969df679493]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/vsock-a-per-net-vsock-NS-mode-state/20250806-130409
base:   dd500e4aecf25e48e874ca7628697969df679493
patch link:    https://lore.kernel.org/r/20250805-vsock-vmtest-v4-9-059ec51ab111%40meta.com
patch subject: [PATCH RFC net-next v4 09/12] vsock/loopback: add netns support
config: csky-randconfig-001-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071150.G6ljBDH7-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071150.G6ljBDH7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071150.G6ljBDH7-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: net/vmw_vsock/af_vsock.o: in function `vsock_sysctl_init_net':
>> net/vmw_vsock/af_vsock.c:2781:(.init.text+0x162): undefined reference to `vsock_loopback_init_net'
>> csky-linux-ld: net/vmw_vsock/af_vsock.c:2800:(.init.text+0x1e8): undefined reference to `vsock_loopback_exit_net'
>> csky-linux-ld: net/vmw_vsock/af_vsock.c:2802:(.init.text+0x200): undefined reference to `vsock_loopback_init_net'
   csky-linux-ld: net/vmw_vsock/af_vsock.c:2802:(.init.text+0x228): undefined reference to `vsock_loopback_exit_net'
   csky-linux-ld: net/vmw_vsock/af_vsock.o: in function `vsock_sysctl_exit_net':
>> net/vmw_vsock/af_vsock.c:2807:(.ref.text+0x1c): undefined reference to `vsock_loopback_exit_net'
>> csky-linux-ld: net/vmw_vsock/af_vsock.c:2808:(.ref.text+0x30): undefined reference to `vsock_loopback_exit_net'


vim +2781 net/vmw_vsock/af_vsock.c

  2776	
  2777	static __net_init int vsock_sysctl_init_net(struct net *net)
  2778	{
  2779		vsock_net_init(net);
  2780	
> 2781		if (vsock_loopback_init_net(net))
  2782			return -ENOMEM;
  2783	
  2784		if (vsock_sysctl_register(net))
  2785			goto err_loopback;
  2786	
  2787	#ifdef CONFIG_PROC_FS
  2788		if (!proc_create_net_single_write("vsock_ns_mode", 0644, net->proc_net,
  2789						  vsock_proc_ns_mode_show,
  2790						  vsock_proc_ns_mode_write,
  2791						  NULL))
  2792			goto err_sysctl;
  2793	#endif
  2794	
  2795		return 0;
  2796	
  2797	err_sysctl:
  2798		vsock_sysctl_unregister(net);
  2799	err_loopback:
> 2800		vsock_loopback_exit_net(net);
  2801		return -ENOMEM;
> 2802	}
  2803	
  2804	static __net_exit void vsock_sysctl_exit_net(struct net *net)
  2805	{
  2806		vsock_sysctl_unregister(net);
> 2807		vsock_loopback_exit_net(net);
> 2808	}
  2809	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

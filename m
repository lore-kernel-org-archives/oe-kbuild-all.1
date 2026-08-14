Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF66B44160C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 08:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786695814; cv=none; b=iIUTdhK2CAkAMfBYu8pQFIO8DfoITf5HO3vKxJ1X5yDxwVXJuj4opr2eZXNIj1SAeknBlm4r48AVQgJ1ad2cMc9e1mFM5hxovmc16CPBmcL2WySyC6yxXv9enbqb560BOK7JYomD+OaGYZSa4fy6a+a+UoNuKK2sqGDYm5OlvQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786695814; c=relaxed/simple;
	bh=E3/66PFJoZSy7xHDP2hDtS3Mi9TyRVFzK8yL6oKAJqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ar6yonadsh2s2/bbv+RjLvKfz27E1KZnodNBuu+xYIsFFEyRo4AHl4fyAg558TaOp8OGAgTT7+8iczkEw4PSH7h1Xb/41qpifcQq47tXMJmxYts+QW4sYtVYL2VcTuHDDjB9ECZH+CwcwSrJcuWcUYOPricd1f7he9Xk0srSHio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OOUUELkw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OOUUELkw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786695811; x=1818231811;
  h=date:from:to:cc:subject:message-id;
  bh=E3/66PFJoZSy7xHDP2hDtS3Mi9TyRVFzK8yL6oKAJqA=;
  b=OOUUELkwl8+G7WfN3i709MDET6atYyoZ9egVbsa765rqLnahN7mrjcXi
   IsDkjVPYkIxKqg9XVMKEPcL/urr53ZAKXVz/23p9oS4Clv3ch3IncKnZ7
   WcdZuKNNeaKchtUkKXR7fLH5tW9HLFbMTlbQqIZjIACcLpoaz10C+YaVL
   SCPFTBsuuibt/qy/mCIQgku0TVEcEKNRjQOQxjZscrf/p74MmUJsJRO6b
   2gE8PnotT18UcqwXbaJfTFuSPWqB73NomlShRl4ebiAd77MbQiWAxIX9C
   Ny64MD+Zh2mrHUIZcyht9+gQuRFUkMBVWe8XztmNplS7VMeVhdnwLgHp/
   g==;
X-CSE-ConnectionGUID: s0CQOEypTCqkouDnVK9Y3g==
X-CSE-MsgGUID: UTlBHgTaQxO3oWWNlBQo9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="89795150"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="89795150"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 01:23:29 -0700
X-CSE-ConnectionGUID: KvW64l+7RRuF9KdWWrpzIg==
X-CSE-MsgGUID: KfC+htOsQ3OQ1oqGpgfbcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="266152210"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2026 01:23:28 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wunCH-00000000YHG-1QJJ;
	Fri, 14 Aug 2026 08:23:25 +0000
Date: Fri, 14 Aug 2026 16:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctls-v3 15/30] net/vmw_vsock/af_vsock.c:2849:12:
 warning: 'vsock_net_child_mode_string' defined but not used
Message-ID: <202608141640.f1hqPlt0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctls-v3
head:   b5c5a5b075f61f062cb2d253d35c118b8eecc40b
commit: ae14ad1ad8ce93d5955985cc18d518bd4739585e [15/30] sysctl: net: use ctl_field in vsock sysctls
config: um-randconfig-001-20260814 (https://download.01.org/0day-ci/archive/20260814/202608141640.f1hqPlt0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141640.f1hqPlt0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141640.f1hqPlt0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/vmw_vsock/af_vsock.c:2849:12: warning: 'vsock_net_child_mode_string' defined but not used [-Wunused-function]
    2849 | static int vsock_net_child_mode_string(const struct ctl_table *table, int write,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/vmw_vsock/af_vsock.c:2835:12: warning: 'vsock_net_mode_string' defined but not used [-Wunused-function]
    2835 | static int vsock_net_mode_string(const struct ctl_table *table, int write,
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/vsock_net_child_mode_string +2849 net/vmw_vsock/af_vsock.c

eafb64f40ca49c Bobby Eshleman     2026-01-21  2834  
eafb64f40ca49c Bobby Eshleman     2026-01-21 @2835  static int vsock_net_mode_string(const struct ctl_table *table, int write,
eafb64f40ca49c Bobby Eshleman     2026-01-21  2836  				 void *buffer, size_t *lenp, loff_t *ppos)
eafb64f40ca49c Bobby Eshleman     2026-01-21  2837  {
eafb64f40ca49c Bobby Eshleman     2026-01-21  2838  	struct net *net;
eafb64f40ca49c Bobby Eshleman     2026-01-21  2839  
eafb64f40ca49c Bobby Eshleman     2026-01-21  2840  	if (write)
eafb64f40ca49c Bobby Eshleman     2026-01-21  2841  		return -EPERM;
eafb64f40ca49c Bobby Eshleman     2026-01-21  2842  
5cc619583c7e73 Greg Kroah-Hartman 2026-02-23  2843  	net = container_of(table->data, struct net, vsock.mode);
eafb64f40ca49c Bobby Eshleman     2026-01-21  2844  
eafb64f40ca49c Bobby Eshleman     2026-01-21  2845  	return __vsock_net_mode_string(table, write, buffer, lenp, ppos,
eafb64f40ca49c Bobby Eshleman     2026-01-21  2846  				       vsock_net_mode(net), NULL);
eafb64f40ca49c Bobby Eshleman     2026-01-21  2847  }
eafb64f40ca49c Bobby Eshleman     2026-01-21  2848  
eafb64f40ca49c Bobby Eshleman     2026-01-21 @2849  static int vsock_net_child_mode_string(const struct ctl_table *table, int write,
eafb64f40ca49c Bobby Eshleman     2026-01-21  2850  				       void *buffer, size_t *lenp, loff_t *ppos)
eafb64f40ca49c Bobby Eshleman     2026-01-21  2851  {
eafb64f40ca49c Bobby Eshleman     2026-01-21  2852  	enum vsock_net_mode new_mode;
eafb64f40ca49c Bobby Eshleman     2026-01-21  2853  	struct net *net;
eafb64f40ca49c Bobby Eshleman     2026-01-21  2854  	int ret;
eafb64f40ca49c Bobby Eshleman     2026-01-21  2855  
5cc619583c7e73 Greg Kroah-Hartman 2026-02-23  2856  	net = container_of(table->data, struct net, vsock.child_ns_mode);
eafb64f40ca49c Bobby Eshleman     2026-01-21  2857  
eafb64f40ca49c Bobby Eshleman     2026-01-21  2858  	ret = __vsock_net_mode_string(table, write, buffer, lenp, ppos,
eafb64f40ca49c Bobby Eshleman     2026-01-21  2859  				      vsock_net_child_mode(net), &new_mode);
eafb64f40ca49c Bobby Eshleman     2026-01-21  2860  	if (ret)
eafb64f40ca49c Bobby Eshleman     2026-01-21  2861  		return ret;
eafb64f40ca49c Bobby Eshleman     2026-01-21  2862  
6a997f38bdf822 Stefano Garzarella 2026-02-12  2863  	if (write) {
6a997f38bdf822 Stefano Garzarella 2026-02-12  2864  		/* Prevent a "local" namespace from escalating to "global",
6a997f38bdf822 Stefano Garzarella 2026-02-12  2865  		 * which would give nested namespaces access to global CIDs.
6a997f38bdf822 Stefano Garzarella 2026-02-12  2866  		 */
6a997f38bdf822 Stefano Garzarella 2026-02-12  2867  		if (vsock_net_mode(net) == VSOCK_NET_MODE_LOCAL &&
6a997f38bdf822 Stefano Garzarella 2026-02-12  2868  		    new_mode == VSOCK_NET_MODE_GLOBAL)
6a997f38bdf822 Stefano Garzarella 2026-02-12  2869  			return -EPERM;
6a997f38bdf822 Stefano Garzarella 2026-02-12  2870  
102eab95f025b4 Bobby Eshleman     2026-02-23  2871  		if (!vsock_net_set_child_mode(net, new_mode))
102eab95f025b4 Bobby Eshleman     2026-02-23  2872  			return -EBUSY;
6a997f38bdf822 Stefano Garzarella 2026-02-12  2873  	}
eafb64f40ca49c Bobby Eshleman     2026-01-21  2874  
eafb64f40ca49c Bobby Eshleman     2026-01-21  2875  	return 0;
eafb64f40ca49c Bobby Eshleman     2026-01-21  2876  }
eafb64f40ca49c Bobby Eshleman     2026-01-21  2877  

:::::: The code at line 2849 was first introduced by commit
:::::: eafb64f40ca49c79f0769aab25d0fae5c9d3becb vsock: add netns to vsock core

:::::: TO: Bobby Eshleman <bobbyeshleman@meta.com>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

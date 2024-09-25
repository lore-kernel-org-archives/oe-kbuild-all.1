Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9251220E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 03:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727236740; cv=none; b=ZdPICl5qgJTU77s0F9dKT5RvLuiyazMWhIHfCTwmPrUGb16X13BkZcV3wD2T8upV0GvOVcUFUuFPCRybFlqMvxuCwOUO6mLkff1Y6Ln3AsBjo4CoqJXnJYo+3VPdkM0DLMSKHOidBJQkJUZffSjpwJFDFOFY1H791n2q6Gi193Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727236740; c=relaxed/simple;
	bh=OR51YADJS1QLG6mSLMExh2oY1lylx/aJPSNNlyppfi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jzbEdCAxCunxGggaWbxpx7gwmQNgcJ0VHQ2pWSBF2h+ZtGboJF4EiPFAbTscKT9xYw5iiulDfMFoxIjVYyPb9Wqr12c6BAfRbJtpgdT3SPyfeqmsKjyJ0UH00SleMZ6ryyGV9CdqddRFYSwb9R9zXTXDvxEI/xg+WEoqmWhUQDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDXlfIXE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDXlfIXE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727236739; x=1758772739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OR51YADJS1QLG6mSLMExh2oY1lylx/aJPSNNlyppfi0=;
  b=LDXlfIXEUwaQhxbiU1N76BC16qIudwTF+fBlX0THH1Ny5mNwDtjnQuMK
   WbpiAhEubzmbRdIm2iVEQ4w8Wqwl1hZKv90XMKHGcZKGQRRhUR0HtZa/s
   PEBze0fiFJvOPkqjTVHBLmjvWSehaw/1UaKzDe3lrbrTpKulskJ6s0CUu
   wWBxlXhC3z4uDmzmZYWcMtH9FTHWl1snNT+eepMPOJXYSgRzWdPDfHOIi
   6qTaCGQkUP/QIQSR1LeWMnpptb75Y5OQScuLkl4i9n1Hv5Kim/dsNSbA9
   hozxk4Bn5USKvVePD2oCnI+FTtI2FuiZFeXgbmw1a9QAXcqnLC8jwjeIy
   w==;
X-CSE-ConnectionGUID: IGQyJrVeRaqYPLFZljB1ug==
X-CSE-MsgGUID: ELaY+pG8Q+q25uBZhcyoHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30054981"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="30054981"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 20:58:59 -0700
X-CSE-ConnectionGUID: q0XSqmQRRRmSDV4mBQqyBA==
X-CSE-MsgGUID: EylaEptgRS26QYf4Ag6SdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="75749442"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Sep 2024 20:58:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stJB0-000J77-26;
	Wed, 25 Sep 2024 03:58:54 +0000
Date: Wed, 25 Sep 2024 11:58:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 262/5570]
 net/socket.c:3478: undefined reference to `compat_wext_handle_ioctl'
Message-ID: <202409251149.ypkjATLB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   2b249a7f4e2299d2ffce772bdb80f501890067ea
commit: 8a167346a33aa28c6e422739e69abc87f57f81bc [262/5570] ANDROID: net: enable wireless core features with GKI_LEGACY_WEXT_ALLCONFIG
config: x86_64-randconfig-072-20240925 (https://download.01.org/0day-ci/archive/20240925/202409251149.ypkjATLB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409251149.ypkjATLB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409251149.ypkjATLB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: net/socket.o: in function `sock_ioctl':
   net/socket.c:1110: undefined reference to `wext_handle_ioctl'
   ld: net/socket.o: in function `compat_sock_ioctl':
>> net/socket.c:3478: undefined reference to `compat_wext_handle_ioctl'
   ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
   net/core/net-procfs.c:305: undefined reference to `wext_proc_exit'
   ld: net/core/net-procfs.o: in function `dev_proc_net_init':
   net/core/net-procfs.c:289: undefined reference to `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +3478 net/socket.c

7a229387d317df Arnd Bergmann   2009-11-06  3461  
95c961747284a6 Eric Dumazet    2012-04-15  3462  static long compat_sock_ioctl(struct file *file, unsigned int cmd,
89bbfc95d65839 Shaun Pereira   2006-03-21  3463  			      unsigned long arg)
89bbfc95d65839 Shaun Pereira   2006-03-21  3464  {
89bbfc95d65839 Shaun Pereira   2006-03-21  3465  	struct socket *sock = file->private_data;
89bbfc95d65839 Shaun Pereira   2006-03-21  3466  	int ret = -ENOIOCTLCMD;
87de87d5e47f94 David S. Miller 2008-06-03  3467  	struct sock *sk;
87de87d5e47f94 David S. Miller 2008-06-03  3468  	struct net *net;
87de87d5e47f94 David S. Miller 2008-06-03  3469  
87de87d5e47f94 David S. Miller 2008-06-03  3470  	sk = sock->sk;
87de87d5e47f94 David S. Miller 2008-06-03  3471  	net = sock_net(sk);
89bbfc95d65839 Shaun Pereira   2006-03-21  3472  
89bbfc95d65839 Shaun Pereira   2006-03-21  3473  	if (sock->ops->compat_ioctl)
89bbfc95d65839 Shaun Pereira   2006-03-21  3474  		ret = sock->ops->compat_ioctl(sock, cmd, arg);
89bbfc95d65839 Shaun Pereira   2006-03-21  3475  
87de87d5e47f94 David S. Miller 2008-06-03  3476  	if (ret == -ENOIOCTLCMD &&
87de87d5e47f94 David S. Miller 2008-06-03  3477  	    (cmd >= SIOCIWFIRST && cmd <= SIOCIWLAST))
87de87d5e47f94 David S. Miller 2008-06-03 @3478  		ret = compat_wext_handle_ioctl(net, cmd, arg);
87de87d5e47f94 David S. Miller 2008-06-03  3479  
6b96018b28bd93 Arnd Bergmann   2009-11-06  3480  	if (ret == -ENOIOCTLCMD)
6b96018b28bd93 Arnd Bergmann   2009-11-06  3481  		ret = compat_sock_ioctl_trans(file, sock, cmd, arg);
6b96018b28bd93 Arnd Bergmann   2009-11-06  3482  
89bbfc95d65839 Shaun Pereira   2006-03-21  3483  	return ret;
89bbfc95d65839 Shaun Pereira   2006-03-21  3484  }
89bbfc95d65839 Shaun Pereira   2006-03-21  3485  #endif
89bbfc95d65839 Shaun Pereira   2006-03-21  3486  

:::::: The code at line 3478 was first introduced by commit
:::::: 87de87d5e47f94b4ea647a5bd1bc8dc1f7930db4 wext: Dispatch and handle compat ioctls entirely in net/wireless/wext.c

:::::: TO: David S. Miller <davem@davemloft.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

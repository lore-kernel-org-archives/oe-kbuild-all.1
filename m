Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C61120E00B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754131198; cv=none; b=d6lckuHcbYDRi+Brz86p5XLQRn7J/b7Jd2W7Uvf+YPd0E7/bZOegq5vuA/Zi08g79iuEydulfmA3CxvhcrGXxLFiosnmPDPa4ZxbKqHILkqdnPTyAGL+zG7p7fE/ivYrud1y5y3oytk5nzOf4GFSzGp7nfPnqJ1FAzuPECOlf+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754131198; c=relaxed/simple;
	bh=t1tZ+HZ4TiCfxBCGNPGobtTTmK+vWX9inIdEIIFLFqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JqgEiU7XEYZi74eOXLKsNljsPRf50obWz2Td7fyIIdOuTlGZbAH1i1ZllezDgjrSetlhZ1fwyY770/oA7JQGnTZS5cw0rOptuuxg0NDRUytUatQmKY40hCJMGI9MPYwQHZbsutygeFFBt1iEhkkNYvq3UyreQLtDauBtlnhyRzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VaUqpIOg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VaUqpIOg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754131197; x=1785667197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t1tZ+HZ4TiCfxBCGNPGobtTTmK+vWX9inIdEIIFLFqs=;
  b=VaUqpIOgAB1QhwpuKBDIf80mTUV5u7idyEnazNBGRWSBmdxhKEeHoblC
   q6roumOyudb0O9GX7+IPGdBD9vJIBmPiJMJp4IACM2iqiu6L4Ti7qIoEi
   uUUxFxGZY3Uvl2/ysEwo3O+rmEkFLz58TDjDJvqOZ61rEyciLJPD3jK+7
   K/f7LX9vsA7+es6N1Z8kXtOA9Bm5m84u3jDk9qlpzgd0bfS2cMpcegzcq
   Yd6plAKURdGQySpds+dIZynlTQvt9t/jzrXQaMTSd+iLEjyA63s+KXmD7
   lfQhOahWBacEilEdUtyoWa1vvOfQBlkZ9+NS3pJ9WOT/Ss29++WpK4Jhj
   w==;
X-CSE-ConnectionGUID: VJf6SBEySO+sp8fSBDZjcQ==
X-CSE-MsgGUID: ynwO5J6iQB+uX0gN70Ft7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67037207"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67037207"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 03:39:56 -0700
X-CSE-ConnectionGUID: gmWDx51MRsyRp6TpEsCaUA==
X-CSE-MsgGUID: 1Jgmu5VvTYK/CHkEm96X5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163326521"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Aug 2025 03:39:55 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui9eb-0005Ji-0U;
	Sat, 02 Aug 2025 10:39:53 +0000
Date: Sat, 2 Aug 2025 18:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.16/bbr3 1/1] tcp_bbr.c:undefined reference to `__udivdi3'
Message-ID: <202508021818.9O3VXNEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.16/bbr3
head:   44ea9f23b99cc37f9f03c3c0b2f5858041613ca1
commit: 44ea9f23b99cc37f9f03c3c0b2f5858041613ca1 [1/1] tcp/bbr3: initial import
config: i386-buildonly-randconfig-002-20250802 (https://download.01.org/0day-ci/archive/20250802/202508021818.9O3VXNEd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021818.9O3VXNEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508021818.9O3VXNEd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/ipv4/tcp_bbr.o: in function `bbr_packets_in_net_at_edt':
>> tcp_bbr.c:(.text+0x214): undefined reference to `__udivdi3'
   ld: net/ipv4/tcp_bbr.o: in function `bbr_tso_segs':
   tcp_bbr.c:(.text+0x10a6): undefined reference to `__udivdi3'
   ld: net/ipv4/tcp_bbr.o: in function `bbr_inflight.constprop.0':
   tcp_bbr.c:(.text+0x115e): undefined reference to `__udivdi3'
   ld: net/ipv4/tcp_bbr.o: in function `bbr_main':
   tcp_bbr.c:(.text+0x26d4): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

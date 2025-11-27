Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8F020A5E5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 02:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764209499; cv=none; b=VinqB0J8MC6bVH4EjDRI1FEPKI12dxL8gnyNBBb1IZMfd8Vuk2hyzdrl/UfC+l0ejusF0YJUYQf7w4/pQHY99tvg6eecUC+LvUo5CEYu3eoZ9Axs1FzRxsK9/niSNnwKsW/61k5HPkvvyrPOQEjhUO6fDIyiUozFhsGzE99TizU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764209499; c=relaxed/simple;
	bh=03xlcrtbeQDVPYj3GQTCWdlgh50NoMk7Ww6yn/S15p8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CvfyftWXO8cQuOkxup4R6gSmFoHWsZNOmX/+zeNiXwzBer8brEDMxNIogG8kJ0WxFABlNQT0+yckNgDIgvEJtq0OviDaexxC4EHstjHdr/35FYEFfUCgt75QRhJFMIf0KxCL1SncnMVA0LYRtk38hv3RPKjSp7IDXNL3lfW7GrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIMrLuaE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIMrLuaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764209498; x=1795745498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=03xlcrtbeQDVPYj3GQTCWdlgh50NoMk7Ww6yn/S15p8=;
  b=aIMrLuaEXNKd+FgVNrmMlTcc1J8R2GB0RM/VlYhBBW+CuTQ4lks9j1op
   Q0euHErYRlDzL0Xa5btAIk1soS+oCBa9EcV6oRaZSASqDPjFb3SN/LrGc
   HHlx79tLP2S1GkxkMFtZKz2FW98vKNzpZmKFonpB698EOITAXlyixSgT5
   Uh3/La2uYiZdEQ0ucsl5230srxDJQo0t3TbNArfg1yr/anZD/zGPh07DN
   DQX1i8Oe07Ravs+Z1JvbTiGvp9DoSrONx4Rsd+/mKvAlTGHDH5Bi72abH
   w7s3SktlxoxzEGVcgW397QK9zqrJvRZsfncxCZwFy+P3Q3Gj3agmKw904
   w==;
X-CSE-ConnectionGUID: ISr/9CuSQR6XaJm2AfQiCQ==
X-CSE-MsgGUID: kPwMjX6FT86wRnoRAh84cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70116619"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="70116619"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 18:11:37 -0800
X-CSE-ConnectionGUID: C2Add/c1QEOa1nVvur+R5g==
X-CSE-MsgGUID: 2SGaAquNS3u6DcpDraP8OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192917904"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Nov 2025 18:11:37 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vORTp-000000003ZZ-3Q0Y;
	Thu, 27 Nov 2025 02:11:33 +0000
Date: Thu, 27 Nov 2025 10:11:14 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <dw@davidwei.uk>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/netkit-iouring7 2/3] net/core/netdev_queues.c:30:9:
 error: implicit declaration of function 'netdev_rx_queue_leased'; did you
 mean 'netdev_queue_busy'?
Message-ID: <202511271055.WbK6GSiR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit-iouring7
head:   b0485a3422c57df789879678c6373976fb2bd3e0
commit: 6218b42846f66ccd2de5a208da7fc61390e7d15c [2/3] net: Implement netdev_nl_queue_create_doit
config: arc-randconfig-002-20251127 (https://download.01.org/0day-ci/archive/20251127/202511271055.WbK6GSiR-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271055.WbK6GSiR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271055.WbK6GSiR-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/netdev_queues.c: In function 'netdev_queue_busy':
>> net/core/netdev_queues.c:30:9: error: implicit declaration of function 'netdev_rx_queue_leased'; did you mean 'netdev_queue_busy'? [-Werror=implicit-function-declaration]
     return netdev_rx_queue_leased(dev, idx) ||
            ^~~~~~~~~~~~~~~~~~~~~~
            netdev_queue_busy
>> net/core/netdev_queues.c:31:9: error: implicit declaration of function 'xsk_get_pool_from_qid' [-Werror=implicit-function-declaration]
            xsk_get_pool_from_qid(dev, idx);
            ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +30 net/core/netdev_queues.c

    27	
    28	bool netdev_queue_busy(struct net_device *dev, int idx)
    29	{
  > 30		return netdev_rx_queue_leased(dev, idx) ||
  > 31		       xsk_get_pool_from_qid(dev, idx);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

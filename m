Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A4C1B0F1E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735852703; cv=none; b=Qbk9xSAR24vqcb3RaASwT2YfErsF95kpq+shIai/lTXSb9bA7QxBpdieQ1msQcVtvQYv8f8VgSMpC4S8MKAmfXjM4J+gcWvTnjFJpNTMnrODzMBtDtVR7NTd0O4VFbO3XQyApuAhnlyK4KqWMk06c9MdClAtTmGgpMvIO2KMdLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735852703; c=relaxed/simple;
	bh=jT2KJA+c+Asit4xqIv9DeICVJmRPRXllLBMAN0Tra8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NWcDvJq35RPwRzVKItezf/gwZWhS77TOWdqAEFr9keDG2e8KSx/LwzgEhPjd2xCOnjWXeWw2uKsHut8Uf+K2LUm3Fmun99k2cuZPlXl4YGJlUAer+i7DH3CAakIGAdWio8PpiQmH1YaSYASB7UtkSrdjOoxCAbZNzdEETEO56+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvyaTq+X; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvyaTq+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735852701; x=1767388701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jT2KJA+c+Asit4xqIv9DeICVJmRPRXllLBMAN0Tra8E=;
  b=nvyaTq+XXutMP9uDu8UM2KvbNCaekiIaJ3nLVSJKSk/cNZerEABXVv3f
   WrlfQzjCih4hMQYeYRHjcZ2KMEpVQA1BS/EbIjHnORMvKJyPpSChULhep
   nekfmt05TSP2IJ1NppbTCsrj+3yPnXmsbKNXQikpQDeRZmVsXwObGjise
   XIcph5fFAqM4fKMqew0q4kG10uqSums4y6wzhZKmIhNTKPwrBA8dz9NGd
   OhEwPG+j5jYzrTP+dKZFE2mjS0yslmJHNphOhB+z8aVwkwolily9OI5W6
   4hJhG8cWuzfiT06gBI3fmX95ermR+9+8ApiVJKC7MmjWALEWmH1p/H+Le
   w==;
X-CSE-ConnectionGUID: f4bMUvyOTR2bMhr67sEUaQ==
X-CSE-MsgGUID: 10gsAZOaSyK8dKlSFC+wvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="39781740"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="39781740"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 13:18:21 -0800
X-CSE-ConnectionGUID: qCghb4eqTTaq41vye5CmqA==
X-CSE-MsgGUID: 2w6669GESIKV9U+Ry54yHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="106469307"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jan 2025 13:18:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTSa9-0008sL-2U;
	Thu, 02 Jan 2025 21:18:17 +0000
Date: Fri, 3 Jan 2025 05:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v10-wip 8/26] net/ipv4/../core/devmem.h:170:6: error:
 expected '=', ',', ';', 'asm' or '__attribute__' before 'net_is_devmem_iov'
Message-ID: <202501030503.WubhlqEv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v10-wip
head:   1e1214d152c4b21b5bc3e9b37e26cd60ed14632b
commit: 9852e159a9d1e771fe98518bf7f67ac9ee145203 [8/26] net: prepare for non devmem TCP memory providers
config: i386-buildonly-randconfig-003-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030503.WubhlqEv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030503.WubhlqEv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030503.WubhlqEv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/ipv4/tcp.c:288:
>> net/ipv4/../core/devmem.h:170:6: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'net_is_devmem_iov'
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         |      ^~~~~~~~~~~~~~~~~
   net/ipv4/tcp.c: In function 'tcp_recvmsg_dmabuf':
>> net/ipv4/tcp.c:2479:30: error: implicit declaration of function 'net_is_devmem_iov' [-Werror=implicit-function-declaration]
    2479 |                         if (!net_is_devmem_iov(niov)) {
         |                              ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from net/core/netdev-genl.c:15:
>> net/core/devmem.h:170:6: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'net_is_devmem_iov'
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         |      ^~~~~~~~~~~~~~~~~


vim +170 net/ipv4/../core/devmem.h

   168	
   169	static inline bool
 > 170	bool net_is_devmem_iov(struct net_iov *niov)
   171	{
   172		return false;
   173	}
   174	#endif
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

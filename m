Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1C5373BFE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jun 2026 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374179; cv=none; b=c4+WiZnfp8Dkl5QOBED3ce2ZMAdWAJXNRGEJTHi/k9trIQpD1MxnFqLVbjHP2OZFlyMRixhsGqj65TGigEVI/ljP76JLpIBGFFlEHwomg+cz6hkmQr65/CyFT/N/iUFs1CmOJx7sKqsGDe8fLjogfjc3QUSd2e3rMIpn/QR3l3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374179; c=relaxed/simple;
	bh=0BcF7wvZQc2+bOS0wSRGCDiyVju8njB6a04Sg/Zmlt0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jh7bDadSw/9OqEg6JtEhDkRF0sSYMk8ia6tFnd3eeKEUFvP+ZXzaFB8Y7KNGiPx1yjqdP/HmLBIDSN93pfrQIsRZrNM4qErf9GtA9v9sSURhqJi2ByF3GBLrRczKceEeuSbP5do5Kxj84KWAwMxvNILE2wkMvDTA5a6q0moRrn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwJTrYN3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwJTrYN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782374178; x=1813910178;
  h=date:from:to:cc:subject:message-id;
  bh=0BcF7wvZQc2+bOS0wSRGCDiyVju8njB6a04Sg/Zmlt0=;
  b=cwJTrYN3XeHKt3c4l8qIyx47G6mrXAi9v982vprIVgDm24r/BxMdXIt7
   ylwkDu8hPh7/43mXIFurElBzXCrp69iqi/h/Ix9oPWXc+Zyl3CxNLlH8F
   fOlv70HAJdHrvlSJQwu7b/wYaH5hI/RGSHsjBpMIJli7EZ8icGqX8gfZX
   ga4AdadN0lkmxbBw10sF59caHiNb3ZfgxHoYz74e/gAHsxazwCy8Po9oN
   Z8Md+/NvsooorjAiAZkCgoT6kt2WMZhiuQQDAePGjwWRkXe9HkN6kbiN0
   vsUgZzYVQjg7cmIqI/3Wkta3ZiVRCfEeh/TP5SNhNu/x2l03EJbQof8mb
   w==;
X-CSE-ConnectionGUID: qT9qYfE9Q5WO5ypRYvDO1w==
X-CSE-MsgGUID: 4Q0AV6YuR0iG5Wpa9fDPoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83197214"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="83197214"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:56:14 -0700
X-CSE-ConnectionGUID: /Z36ucInS9q1DiElsvyKOw==
X-CSE-MsgGUID: p3Mvuu/FTm2Jzhn7JD0Sfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="250160914"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Jun 2026 00:56:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcewT-0000000040T-2zWR;
	Thu, 25 Jun 2026 07:56:09 +0000
Date: Thu, 25 Jun 2026 15:55:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:abi-test 26/34] net/sctp/socket.c:7309:13:
 error: implicit declaration of function 'in_ia32_syscall'; did you mean
 'in_compat_syscall'?
Message-ID: <202606251520.cuVyLXaQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git abi-test
head:   741e95c4b46803e113402223592189848b0ac9c8
commit: d81a3a57360fb9705dbc00b272573f277717b9fe [26/34] uapi: explict padding for sctp
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260625/202606251520.cuVyLXaQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606251520.cuVyLXaQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606251520.cuVyLXaQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/sctp/socket.c: In function 'sctp_getsockopt_assoc_stats':
>> net/sctp/socket.c:7309:13: error: implicit declaration of function 'in_ia32_syscall'; did you mean 'in_compat_syscall'? [-Wimplicit-function-declaration]
    7309 |         if (in_ia32_syscall())
         |             ^~~~~~~~~~~~~~~
         |             in_compat_syscall


vim +7309 net/sctp/socket.c

  7289	
  7290	/*
  7291	 * SCTP_GET_ASSOC_STATS
  7292	 *
  7293	 * This option retrieves local per endpoint statistics. It is modeled
  7294	 * after OpenSolaris' implementation
  7295	 */
  7296	static int sctp_getsockopt_assoc_stats(struct sock *sk, int len,
  7297					       char __user *optval,
  7298					       int __user *optlen)
  7299	{
  7300		struct sctp_assoc_stats sas;
  7301		struct sctp_association *asoc = NULL;
  7302	
  7303		/* User must provide at least the assoc id */
  7304		if (len < sizeof(sctp_assoc_t))
  7305			return -EINVAL;
  7306	
  7307	#ifdef CONFIG_X86_64
  7308		/* FIXME: need to convert sctp_assoc_stats layout */
> 7309		if (in_ia32_syscall())
  7310			return -ENOSYS;
  7311	#endif
  7312	
  7313		/* Allow the struct to grow and fill in as much as possible */
  7314		len = min_t(size_t, len, sizeof(sas));
  7315	
  7316		if (copy_from_user(&sas, optval, len))
  7317			return -EFAULT;
  7318	
  7319		asoc = sctp_id2assoc(sk, sas.sas_assoc_id);
  7320		if (!asoc)
  7321			return -EINVAL;
  7322	
  7323		sas.sas_rtxchunks = asoc->stats.rtxchunks;
  7324		sas.sas_gapcnt = asoc->stats.gapcnt;
  7325		sas.sas_outofseqtsns = asoc->stats.outofseqtsns;
  7326		sas.sas_osacks = asoc->stats.osacks;
  7327		sas.sas_isacks = asoc->stats.isacks;
  7328		sas.sas_octrlchunks = asoc->stats.octrlchunks;
  7329		sas.sas_ictrlchunks = asoc->stats.ictrlchunks;
  7330		sas.sas_oodchunks = asoc->stats.oodchunks;
  7331		sas.sas_iodchunks = asoc->stats.iodchunks;
  7332		sas.sas_ouodchunks = asoc->stats.ouodchunks;
  7333		sas.sas_iuodchunks = asoc->stats.iuodchunks;
  7334		sas.sas_idupchunks = asoc->stats.idupchunks;
  7335		sas.sas_opackets = asoc->stats.opackets;
  7336		sas.sas_ipackets = asoc->stats.ipackets;
  7337	
  7338		/* New high max rto observed, will return 0 if not a single
  7339		 * RTO update took place. obs_rto_ipaddr will be bogus
  7340		 * in such a case
  7341		 */
  7342		sas.sas_maxrto = asoc->stats.max_obs_rto;
  7343		memcpy(&sas.sas_obs_rto_ipaddr, &asoc->stats.obs_rto_ipaddr,
  7344			sizeof(struct sockaddr_storage));
  7345	
  7346		/* Mark beginning of a new observation period */
  7347		asoc->stats.max_obs_rto = asoc->rto_min;
  7348	
  7349		if (put_user(len, optlen))
  7350			return -EFAULT;
  7351	
  7352		pr_debug("%s: len:%d, assoc_id:%d\n", __func__, len, sas.sas_assoc_id);
  7353	
  7354		if (copy_to_user(optval, &sas, len))
  7355			return -EFAULT;
  7356	
  7357		return 0;
  7358	}
  7359	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

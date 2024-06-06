Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55A612E4D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 01:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717637627; cv=none; b=sKSyVPMYG3SOUW41DXx8A5fFE/0xMU9hSYUvKx8QF8XKv2Nou2LDFoZh6PYIRNbuRBPb6xZ2NdbS9JC1+cfprJTOFfLMsAgwbQfsSfJt1JpSnLTU16fRAAmTPd+607yYbrAbwG2hiDRmXNgzXBAryj8Jtd/u1VZbDLImoEEJhn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717637627; c=relaxed/simple;
	bh=ScAxi7Islko6wIYvEbcuVSx0QgtEdtkb+KC0TYD2+AA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iRIdpd7SLzCpVLF1NjXmY5FVyLC8b4z6D2z3KvAjd8tf4nIeOEE2oAqvVfNIuNAezK2J4CX5cOtvHVeoBs0Q7v0E/h2vDM64TT+rJzglmlWy25BjfPNzR3gO+pSNCb98BihANdedMCeXEvoGrauivHNCCDIRk7b58a9oMOYbFbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHLWp07a; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHLWp07a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717637625; x=1749173625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ScAxi7Islko6wIYvEbcuVSx0QgtEdtkb+KC0TYD2+AA=;
  b=OHLWp07ax6i25ueD+gTlEA4m9lVs72dsbkIiO68J6eFN7jLv9jknm7B2
   bymTvS3utA8enuMRZ1i6T7sXCqD4wyfg5yTGhB+DhEWdkUN/27Og1RFYJ
   npanYq5qAl3fzwoYtHl5+Kue839f2snI/0ROqiTKNLJrU/l7yzTRCpCjR
   4mrNwPjXRLncdq3gpk5YLfje3sfxkMsTSIMSvrG8aMl+NbpVY/ne5Icn3
   9THlLR6RNM0Ldu7QRCP2ksF/7ck0Hanz3m2WDs3neSiG4uhLwudz+ijsO
   R1Yq0nqCC6LlBWhUwpI2bksci6+cmiXgBgFZIsOOt+DhqUCtcxILQtCgo
   g==;
X-CSE-ConnectionGUID: 03J42FDFSTCo9QclFmFXpw==
X-CSE-MsgGUID: +Ufte/MGQO+rdGFoJqFv4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14502664"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="14502664"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 18:33:44 -0700
X-CSE-ConnectionGUID: EgaCZ400QEi8wxcYGS7kRg==
X-CSE-MsgGUID: YYPsIAAMQzan18uQZcKSOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="42205335"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jun 2024 18:33:43 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF20a-0002Wm-1y;
	Thu, 06 Jun 2024 01:33:40 +0000
Date: Thu, 6 Jun 2024 09:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Tao <tao.peng@primarydata.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>,
	Lance Shelton <lance.shelton@hammerspace.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [snitzer:nfs-localio-for-6.11 7/29]
 include/linux/sunrpc/addr.h:100:15: warning: 'rpc_ntop6_addr_noscopeid'
 defined but not used
Message-ID: <202406060941.2fEwSeJc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11
head:   252b0c685ae2eafa0ced0682a496e9eecf23d1ff
commit: 8302af091458963dc2eb9774c0e47d036c8c1854 [7/29] sunrpc: add and export rpc_ntop6_addr_noscopeid
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240606/202406060941.2fEwSeJc-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406060941.2fEwSeJc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406060941.2fEwSeJc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/sunrpc/clnt.c:37:
>> include/linux/sunrpc/addr.h:100:15: warning: 'rpc_ntop6_addr_noscopeid' defined but not used [-Wunused-function]
     100 | static size_t rpc_ntop6_addr_noscopeid(const struct in6_addr *addr,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/clnt.c: In function 'rpc_create':
   net/sunrpc/clnt.c:582:75: warning: '%s' directive output may be truncated writing up to 107 bytes into a region of size 48 [-Wformat-truncation=]
     582 |                                 snprintf(servername, sizeof(servername), "%s",
         |                                                                           ^~
   net/sunrpc/clnt.c:582:33: note: 'snprintf' output between 1 and 108 bytes into a destination of size 48
     582 |                                 snprintf(servername, sizeof(servername), "%s",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     583 |                                          sun->sun_path);
         |                                          ~~~~~~~~~~~~~~
--
   In file included from net/sunrpc/xprtsock.c:37:
>> include/linux/sunrpc/addr.h:100:15: warning: 'rpc_ntop6_addr_noscopeid' defined but not used [-Wunused-function]
     100 | static size_t rpc_ntop6_addr_noscopeid(const struct in6_addr *addr,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/rpc_ntop6_addr_noscopeid +100 include/linux/sunrpc/addr.h

    87	
    88	static inline bool __rpc_copy_addr6(struct sockaddr *dst,
    89					    const struct sockaddr *src)
    90	{
    91		const struct sockaddr_in6 *ssin6 = (const struct sockaddr_in6 *) src;
    92		struct sockaddr_in6 *dsin6 = (struct sockaddr_in6 *) dst;
    93	
    94		dsin6->sin6_family = ssin6->sin6_family;
    95		dsin6->sin6_addr = ssin6->sin6_addr;
    96		dsin6->sin6_scope_id = ssin6->sin6_scope_id;
    97		return true;
    98	}
    99	#else	/* !(IS_ENABLED(CONFIG_IPV6) */
 > 100	static size_t rpc_ntop6_addr_noscopeid(const struct in6_addr *addr,
   101					       char *buf, const int buflen)
   102	{
   103		return 0;
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

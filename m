Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0533EB0F2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 19:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781032060; cv=none; b=RcRwyiMKjnQYilJbnxdV+FOTBcGLATsl+Ua2WTxoXbfs2k7FKGmvbx3reOYDwzt+R/mBMsdCf4QCeDpBcyRXmASwIN4vvwbPy8EpSLCdQ2ACWQ3dQIdZIpIElVnpx+0TVZYKReTFyVUYW7ver0aCJJPftbCqiYloN5XppNGUs8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781032060; c=relaxed/simple;
	bh=bWy8p4ecr3lBve5ep7vPck/LcQRy8c+2qEdh1N2Duww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ea6ZrixZ+BsJQMolroP0jQpIC/BG/Illhm0F4pwZRDM6Pws87R2PtAU7SPCdLFjILQX7gNDaQTceieLks2jfiENDvEpsCOyt8qNeW2TJCr0QiQm16TWclCaC5yiBdLeo0USmHA6EvBsfw63V4gWPHqRiYSQJsoA67JBWvXiopcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgKkrRiI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgKkrRiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781032059; x=1812568059;
  h=date:from:to:cc:subject:message-id;
  bh=bWy8p4ecr3lBve5ep7vPck/LcQRy8c+2qEdh1N2Duww=;
  b=cgKkrRiI6SyRJY7LccX8kMCFSMMlgf7WeaF7P5nM4mwS+Ycj4y6eG1fU
   dI9K0ctUyV3pbKlL9UJXfjuACvtxARAzUj3mJJSOx3cs+2A2225TD4+cX
   pRuEec3JhkiuluT6t4p6Yf/5biEBtu2PYlAT5dVVPa8+d/WqcD6UVdfPk
   j7XFhDuvhfrAyhSgTFW8LJey0KZCx3YKrJm8imxSAKBjOKtuy+WTpJCRw
   Dh863lC0DN86QX2mn5pkBu0mWreQneWSQFhS/x/wYz+mk55s7GDE8f/zT
   0Nw1khyDhgINLxpYUBg1gigp+fU1HtRY8g1ZCVpJMoDWrG34HuubOpnCj
   g==;
X-CSE-ConnectionGUID: r0lZdh6fShmwyP2uhRrN8g==
X-CSE-MsgGUID: 24rBRDCPTrieVtREmxS+kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85655653"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="85655653"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 12:07:38 -0700
X-CSE-ConnectionGUID: ZP5lebEITSyGSK8H3kao6w==
X-CSE-MsgGUID: mH2e1s0qTcunUIUk4jq0Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="241806137"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2026 12:07:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX1nS-00000000KSg-21w5;
	Tue, 09 Jun 2026 19:07:34 +0000
Date: Wed, 10 Jun 2026 03:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-06 0/10]
 fs/f2fs/f2fs.h:2183:47: error: 'struct f2fs_rwsem' has no member named
 'read_waiters'
Message-ID: <202606100221.bPLSuKFG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-06
head:   dd6f6bb58c6fc709f2ec6a3c516d758cf314d54b
commit: 29429c25a600ea41fc44db5d8de0f65bce2872ac [0/10] ANDROID: vendor_hooks: add hooks for f2fs down read
config: i386-randconfig-054-20260609 (https://download.01.org/0day-ci/archive/20260610/202606100221.bPLSuKFG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100221.bPLSuKFG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100221.bPLSuKFG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:13:
   fs/f2fs/f2fs.h: In function 'f2fs_down_read':
>> fs/f2fs/f2fs.h:2183:47: error: 'struct f2fs_rwsem' has no member named 'read_waiters'
    2183 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                               ^~


vim +2183 fs/f2fs/f2fs.h

  2176	
  2177	void _trace_android_rvh_f2fs_down_read(wait_queue_head_t *read_waiters,
  2178					   struct rw_semaphore *rwsem, bool *skip);
  2179	
  2180	static inline void f2fs_down_read(struct f2fs_rwsem *sem)
  2181	{
  2182		bool skip = false;
> 2183		_trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
  2184		if (skip)
  2185			return;
  2186	#ifdef CONFIG_F2FS_UNFAIR_RWSEM
  2187		wait_event(sem->read_waiters, down_read_trylock(&sem->internal_rwsem));
  2188	#else
  2189		down_read(&sem->internal_rwsem);
  2190	#endif
  2191	}
  2192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

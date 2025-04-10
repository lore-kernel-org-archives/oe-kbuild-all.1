Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226C1EF377
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 17:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744305596; cv=none; b=eKKxkBZ/oLuKmRTR3I78TpMIFGc0IDq7a3CSD5tmweskNXlg2LhOQzFvwHK3L2kg12QkFtM8eh2csJEWZfnBlR+JC2uybMW0VZCbtwoKP8d737kKGTN8lHFqTAmVx1mUw7Mve0uxi5IAE0rAusB21xl5n2Os9E1bJyDkl2CZQ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744305596; c=relaxed/simple;
	bh=mKHD/KZec3KalfyBSxguH3ehFlWORDRpClW4EjXlA38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IaEtn9qGs7b+fI2t236gWiJpBK56L3Jz6dN8pHlOkKLALND3cHpBnNHNQxTV0d0BC9lK+NKWLUqedb+46kekOigqjwRh3/5inDQjsGqlh32a4erctyzfTnpJH6uyPZ8US9egI9ksNcOD0MOsoHKXbYePP6WwwywxSMWs1L3ofoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZS767JR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZS767JR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744305594; x=1775841594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mKHD/KZec3KalfyBSxguH3ehFlWORDRpClW4EjXlA38=;
  b=FZS767JRJaR3ze/lKB7u80kuCU5g2C6I6GkS5d0hugl2tFtps/ZSSPcx
   LJm67l20Iu5gamR0YbRiTZEJbfacwCjFTu+Zqon+Ugb8VGX1IfthTTxVa
   nHjz2b50WxJVErncj2KWMkWleZ0NX53SBOxmnkJnmV/dy4rC59yDMI3RF
   8W20JlFkJxOQtZCAstA8n9Zk8wHDg9nPMQP6E8YFGGPwZjNgz9BvFFSzi
   7vBpqDLeh16+OwVlEvRtaiWhj5822VFRdiVn9764f3aAEFuAeOlJq0kEp
   /uLGYxjt02YTtOWXfWWXA0hCqAdyht/cm5RGMpQN9lmWZux82IsHZ8Ssx
   g==;
X-CSE-ConnectionGUID: J/tLPjRVSwuPOHAnx9YWMw==
X-CSE-MsgGUID: kJEhkEEfRKif46RZg8mxdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45082704"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45082704"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 10:19:53 -0700
X-CSE-ConnectionGUID: GKYtUUowQvGJWj8UfqmNaA==
X-CSE-MsgGUID: PX72m5hFRHOzdEF0BNkzfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="129923640"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Apr 2025 10:19:53 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2vZ8-000AMV-0r;
	Thu, 10 Apr 2025 17:19:50 +0000
Date: Fri, 11 Apr 2025 01:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/gpwrap-testing 3/3] kernel/rcu/tree.c:796: warning:
 cannot understand function prototype: 'unsigned long seq_gpwrap_lag =
 ULONG_MAX / 4; '
Message-ID: <202504110120.3REITBmY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/gpwrap-testing
head:   9667f109504f25cf7fc3938c6d71130456072bec
commit: 9667f109504f25cf7fc3938c6d71130456072bec [3/3] rcutorture: Perform more frequent testing of ->gpwrap
config: csky-randconfig-001-20250410 (https://download.01.org/0day-ci/archive/20250411/202504110120.3REITBmY-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504110120.3REITBmY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504110120.3REITBmY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/rcu/tree.c:796: warning: cannot understand function prototype: 'unsigned long seq_gpwrap_lag = ULONG_MAX / 4; '


vim +796 kernel/rcu/tree.c

   789	
   790	/**
   791	 * rcu_set_gpwrap_lag - Set RCU GP sequence overflow lag value.
   792	 * @lag_gps: Set overflow lag to this many grace period worth of counters
   793	 * which is used by rcutorture to quickly force a gpwrap situation.
   794	 * @lag_gps = 0 means we reset it back to the boot-time value.
   795	 */
 > 796	static unsigned long seq_gpwrap_lag = ULONG_MAX / 4;
   797	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

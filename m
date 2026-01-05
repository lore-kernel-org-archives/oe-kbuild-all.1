Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585E92D8387
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 07:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767597213; cv=none; b=ENaFRk3uF8CgsqCtCQvRb9Pr9Le7C+OosZi50eJ83/H/vbpMqDOOmFXkKiJmJO8jHzZq3e5NJm0MU/IRsynDlvxCkZ04H+G404X7P15E2tO/DcXK34jYhDTSZ43qvIapfNiW/uWyK4nF3OLiynBNtH9vTTn5StP6dfvA1pBhqxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767597213; c=relaxed/simple;
	bh=LHZRfN/dGGKzAODXFJj3EGsiHAokD7oKyx0PKBTphK4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dp40ghj9QrzR2frZO+ZodmiCL2h2IMgEv6LwnxtAidpD7C+sgA5BZCOm5wg61EggEBTNJzVp+vCb/dqDCmwi9swtlZoual9liIVNFzXVOsDr4vzqwupmFa+Rr6bkRmdV/nV6ohnCzzV0NpOtewoAO3xhPtcddxjIJEeQZbn7pOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nl/287UP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nl/287UP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767597209; x=1799133209;
  h=date:from:to:cc:subject:message-id;
  bh=LHZRfN/dGGKzAODXFJj3EGsiHAokD7oKyx0PKBTphK4=;
  b=nl/287UPDOjWH6cW9D/1FiapCE5uOKEIJ2119SppfVksP/m/ssF7vWFq
   udKigB/FN5aG6oegxeLU+MSDPxoCcrNPA9nWH98R4yE//Y5V0eLyyeL5Y
   i3PE4DS2cB+Gcy+Wgo7v/ilI3mVYmszFVXbnTfnSzvv53EbrS6wCpc82G
   fPrqM14oXF+Zxd0e/pvuuIDOrv6kT7xt/HZ1S0hN5/5UPKc69S7sxoiTf
   RbPtJrgpKUfKUorZLZIQmKOxp4cWIzhpmeqhVVIS55l5YGbPvAnn0BZx2
   cUcICELz7jiqi7ZdjC8N/2Fk2IsFUj7HpaLwu4CfIWTgDphLZIQeOca+f
   A==;
X-CSE-ConnectionGUID: yIwJVO/nSuqMHw3UJu+2oA==
X-CSE-MsgGUID: kDcOUcWlT12fmhbBJLdEsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="86379452"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="86379452"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 23:13:28 -0800
X-CSE-ConnectionGUID: GVgrXOKQQwC6eSOHY2tS0w==
X-CSE-MsgGUID: u0bzGebtQ+qCILvmdIM8ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="202222047"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jan 2026 23:13:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcemK-000000000z3-3skC;
	Mon, 05 Jan 2026 07:13:24 +0000
Date: Mon, 05 Jan 2026 15:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 2/2]
 mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for
 'memcg_reap_background_set'
Message-ID: <202601051505.wlLHtR3t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Xu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   f64b5635bc6da0e12f72f202d7ac1b5bb5457209
commit: 9d805ccab1e8f43af37cb84b5795c7501e772dff [2/2] anolis: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260105/202601051505.wlLHtR3t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601051505.wlLHtR3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601051505.wlLHtR3t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for 'memcg_reap_background_set' [-Wmissing-prototypes]
      47 | void memcg_reap_background_set(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memcg_zombie_reaper.c:53:6: warning: no previous prototype for 'memcg_reap_background_clear' [-Wmissing-prototypes]
      53 | void memcg_reap_background_clear(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memcg_reap_background_set +47 mm/memcg_zombie_reaper.c

    46	
  > 47	void memcg_reap_background_set(void)
    48	{
    49		reaper_kthread_on |= REAP_BACKGROUND_MEMCG;
    50		wake_up_interruptible(&reaper_waitq);
    51	}
    52	
  > 53	void memcg_reap_background_clear(void)
    54	{
    55		reaper_kthread_on &= ~REAP_BACKGROUND_MEMCG;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

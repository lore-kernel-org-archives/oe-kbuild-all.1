Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04A334107A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 22:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775861424; cv=none; b=aU21SdqowmnZ5F3pyCHJDj0t/uvTthpXqK8UThNW2nJbL4vb0FzWGdxTv4uwY5eEICkuAbPfPpaLS4faF2YQY3MucqB6sEit0IbUqBCaT3YUG9SWy/OBq0UGqbS+P3gSROkXE28O5JvFlqRsC6/jsh8jel7Z1tEx8bTiifveIXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775861424; c=relaxed/simple;
	bh=nemAwoM1xok1w8uCXWUFK6tl4WVJU8D9BSNLnC1hjfQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RL1ljbUNhRWd168JFTm5MqSBAVAi90CFMKXcJPFbr8Z8kh67QWG0X5FbvmJWYZUaldeSCiuH7vTbFdtEH3+7INnNKdM4gEdGQXYn9YXKe65nPSZnRr2Wvw1boRtDgD3uVZ6ecuZTP6vi9xfuwpKPiv+ZjzXs/sj8hfeUiiPxrTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PoCMqVjt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PoCMqVjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775861423; x=1807397423;
  h=date:from:to:cc:subject:message-id;
  bh=nemAwoM1xok1w8uCXWUFK6tl4WVJU8D9BSNLnC1hjfQ=;
  b=PoCMqVjtIeRS9UyiyhTphRP2yDxaCFwJirlLv/0AlnPYk9T+qK96Bocw
   yFsWiOVj0uSngV4f5l0dCkuIFQIDzKb5e2WNb91m+MnyD9Lpz7D37d8Sq
   84RqNuWx4KPEDx/j9u4KhZE6LNADuZMZzqP2C5Un3jVqG0L/wXSCZEafS
   JkGU7t2tt6012mPMPeGWHQfPvNNK8h7PEWUiv77C9GMZwfQmwIDEyqGZF
   61Fiu5eDGFAAzulYYJIO7BvM85kcfhAzkxT3by1wa6o+Nq8RjfADLsDeP
   NiIFRjwrwhf4iRGeYzO3MVWwY3cstXYpbD9JJhfj1DV+uDxkxK3SsBLJ1
   w==;
X-CSE-ConnectionGUID: YpiYomiyTKODEXK452W2Ng==
X-CSE-MsgGUID: d8dp7dBBROif57sP67jrmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87516052"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="87516052"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 15:50:22 -0700
X-CSE-ConnectionGUID: sa4GLlX5QaeQibxbJUtu6Q==
X-CSE-MsgGUID: VlpGKECdT5mLqYiQ4rPaAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="230944884"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2026 15:50:18 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBKg5-000000000KV-1iPK;
	Fri, 10 Apr 2026 22:50:17 +0000
Date: Sat, 11 Apr 2026 06:50:13 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
 Christian Brauner <brauner@kernel.org>
Subject: fs/namespace.c:2867 may_change_propagation() warn:
 inconsistent indenting
Message-ID: <202604110609.NRLTTg7G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
commit: cffd0441872e7f6b1fce5e78fb1c99187a291330 use uniform permission checks for all mount propagation changes
date:   8 months ago
config: x86_64-randconfig-161-20260410 (https://download.01.org/0day-ci/archive/20260411/202604110609.NRLTTg7G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cffd0441872e ("use uniform permission checks for all mount propagation changes")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110609.NRLTTg7G-lkp@intel.com/

smatch warnings:
fs/namespace.c:2867 may_change_propagation() warn: inconsistent indenting

vim +2867 fs/namespace.c

  2861	
  2862	static int may_change_propagation(const struct mount *m)
  2863	{
  2864	        struct mnt_namespace *ns = m->mnt_ns;
  2865	
  2866		 // it must be mounted in some namespace
> 2867		 if (IS_ERR_OR_NULL(ns))         // is_mounted()
  2868			 return -EINVAL;
  2869		 // and the caller must be admin in userns of that namespace
  2870		 if (!ns_capable(ns->user_ns, CAP_SYS_ADMIN))
  2871			 return -EPERM;
  2872		 return 0;
  2873	}
  2874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

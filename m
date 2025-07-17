Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1284E275855
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752751956; cv=none; b=XDyw2g6Q5xry9Gnv07tlfkw8gSO5SjgTzbaoLbcdoTo6pkgIglH4VBgY9uQBVjqPRdk8est5RSfrzQt/E8Fug1HrOmXQ0uWw0L1dc6kcOE5i0Jz6IJNL7DVbmp9R0ozJNuKuFUvo2183j5CRbm9UbdeWmWlXhBc2L35fBdAunww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752751956; c=relaxed/simple;
	bh=2TT99L4G5IH9cnJwkU3CK4yhpJA23/QaeRcMrDO2S04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bgrXx247PwjvZKnALI8RTDYZSHa8Hsp/OTzWciYLYgXWxpH4g5D2Rq3J+aKdeuqOyJPBk4YAvt4I4G77STlM3ypUZQtyec2+Mb6CbvrXAnfngm7wW0kRJYn6v7xAQIwQ5Pu/UH+DqXPCnTXvdSE+JnezXTVH2MmZC2m4bwCpGbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0FZ7nha; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0FZ7nha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752751955; x=1784287955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2TT99L4G5IH9cnJwkU3CK4yhpJA23/QaeRcMrDO2S04=;
  b=K0FZ7nhacB4CtZI9NifAsYVQK75NkKa8lA97up+jpzBaYR5WIo8ULaNl
   G7V9JmbP72eTqW5ZInK7mB4/7zWk0UvMjuJNQTCgTswWpu2yGVvm4tNAP
   Z3fvnMLbCRKs95lsGc3fmzgj0Pfa89Q/j/ROza5DfqFZpRK9kB/RgdvtS
   6Us+zm6TwSFV2ABi1pX60ja6B9KXmTxJ9CI/2nQlk+VM/ar1QDB2YSE1l
   740nDjtZqlTDx6SOGHmfUgwoQX+hS4P2zB3Io2nf6zUJwQE/1eJrbtw/s
   Ppgg5Zr4/8NRUKtWAsW5Ai9w3fxnOz2tNfv8HYRFTHY1UO6YAKYWbjeWh
   g==;
X-CSE-ConnectionGUID: P2bHHfa7Roev6ZowWHFeXA==
X-CSE-MsgGUID: lQhs4/GyRseF0d/ihtPEQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55142214"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="55142214"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 04:32:34 -0700
X-CSE-ConnectionGUID: SRf4eC52RK6lTJp6tpjesg==
X-CSE-MsgGUID: St/GHochSIaQaJuxizPyCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="157576051"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jul 2025 04:32:30 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucMqj-000DaX-1v;
	Thu, 17 Jul 2025 11:32:29 +0000
Date: Thu, 17 Jul 2025 19:31:47 +0800
From: kernel test robot <lkp@intel.com>
To: Carolina Jubran <cjubran@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Cosmin Ratiu <cratiu@nvidia.com>, Jiri Pirko <jiri@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>
Subject: [linux-next:master 5827/10441] net/devlink/rate.c:382:1: warning:
 the frame size of 1472 bytes is larger than 1024 bytes
Message-ID: <202507171943.W7DJcs6Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e8352908bdcd2d0bcf0aca8c69fae85fd5ea5edb
commit: 566e8f108fc7847f2a8676ec6a101d37b7dd0fb4 [5827/10441] devlink: Extend devlink rate API with traffic classes bandwidth management
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250717/202507171943.W7DJcs6Y-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171943.W7DJcs6Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171943.W7DJcs6Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/devlink/rate.c: In function 'devlink_nl_rate_tc_bw_parse':
>> net/devlink/rate.c:382:1: warning: the frame size of 1472 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     382 | }
         | ^


vim +382 net/devlink/rate.c

   344	
   345	static int devlink_nl_rate_tc_bw_parse(struct nlattr *parent_nest, u32 *tc_bw,
   346					       unsigned long *bitmap,
   347					       struct netlink_ext_ack *extack)
   348	{
   349		struct nlattr *tb[DEVLINK_ATTR_MAX + 1];
   350		u8 tc_index;
   351		int err;
   352	
   353		err = nla_parse_nested(tb, DEVLINK_ATTR_MAX, parent_nest,
   354				       devlink_dl_rate_tc_bws_nl_policy, extack);
   355		if (err)
   356			return err;
   357	
   358		if (!tb[DEVLINK_ATTR_RATE_TC_INDEX]) {
   359			NL_SET_ERR_ATTR_MISS(extack, parent_nest,
   360					     DEVLINK_ATTR_RATE_TC_INDEX);
   361			return -EINVAL;
   362		}
   363	
   364		tc_index = nla_get_u8(tb[DEVLINK_ATTR_RATE_TC_INDEX]);
   365	
   366		if (!tb[DEVLINK_ATTR_RATE_TC_BW]) {
   367			NL_SET_ERR_ATTR_MISS(extack, parent_nest,
   368					     DEVLINK_ATTR_RATE_TC_BW);
   369			return -EINVAL;
   370		}
   371	
   372		if (test_and_set_bit(tc_index, bitmap)) {
   373			NL_SET_ERR_MSG_FMT(extack,
   374					   "Duplicate traffic class index specified (%u)",
   375					   tc_index);
   376			return -EINVAL;
   377		}
   378	
   379		tc_bw[tc_index] = nla_get_u32(tb[DEVLINK_ATTR_RATE_TC_BW]);
   380	
   381		return 0;
 > 382	}
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

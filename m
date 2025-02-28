Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDAC819
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 04:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740717512; cv=none; b=iEPLScZRz+zMtmeW0f5ynb15/2TpJtaLITXe0BgJR3m7CHxpc9mhhO4THj4NuRwB6VU73tRxQM1jeiYqzAcBwilL1bsBAA6RrlReB/sqldOdHb9gSc0uxtUcQk1YlO3TThoj4uZTnpMyq9NFJY9xwh2pk4gtDCvHoVDNfsmBoNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740717512; c=relaxed/simple;
	bh=uZDfADhroHUTqCKcfMVCrjaehOWxtI6cE8ahi3owyK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XzgWnqaViqmq+c//nKYPaNF65y3K0MDZwYg5K2RzPFvwe8VXryciChLSuWI5xwJCMRcVMwiHP5VpSgAsc4M2S1v+rm/qV0oawJxhhkV6rncwORlknqI9SflfhIvjMIlLfYU15yfWOeKBX6bAbpm1SQBe3x1+gU1wAuuYKSIvEhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=du1r0aAx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="du1r0aAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740717511; x=1772253511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uZDfADhroHUTqCKcfMVCrjaehOWxtI6cE8ahi3owyK0=;
  b=du1r0aAxO/oRPH6Enuz5d98ucAhDLwY3vA6nDNN8yKtTjLw2KVW2fBpw
   7qLDLS/74fdm2chWo88RyArCMii4cFSiqmHkfVduFfTxt7IKC9eFFcrwa
   BKlZ+gY/tJ153qzG7vNXJQE8b368xYrN9F1COnU5n0tTj4WUsNi67DSGR
   YQEaIJ1HCXfVmJxqfQVeJsgEoH43i2z+gqhTmAT8z0GfjGOGOKi1Erv1k
   ckya+HjdaU2bjtelc4U7cTTGSwc9oIwFH6XtwKeaZQ6MU5iqQrShaMN1l
   Q8d/Fyp6AiOQlfjUgurJ/N/VSKFH2Stt4uQEOBBsiONxDDJnJVTOUqurD
   A==;
X-CSE-ConnectionGUID: e4FEOYtZQBGAe+jv16goIA==
X-CSE-MsgGUID: OUpVhay7TFuOajycDJ1LwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41484314"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="41484314"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 20:38:30 -0800
X-CSE-ConnectionGUID: oJSVTUNsR4+K2Jwnhun8Sw==
X-CSE-MsgGUID: wwLIQdJiRSazl6HkfFxH5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121354157"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Feb 2025 20:38:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tns8p-000EQ8-0N;
	Fri, 28 Feb 2025 04:38:27 +0000
Date: Fri, 28 Feb 2025 12:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_dl_pfs_parent 7/8] net/devlink/core.c:386:52:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202502281222.pwfhRLhD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw wip_dl_pfs_parent
head:   072b5ae54eec4100c9b75c542e427614a514a694
commit: 9ee2de4c481c352938b4e3ab2bec1405689ef15e [7/8] devlink: introduce shared allocation
config: loongarch-randconfig-r113-20250227 (https://download.01.org/0day-ci/archive/20250228/202502281222.pwfhRLhD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250228/202502281222.pwfhRLhD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281222.pwfhRLhD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/devlink/core.c:386:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted xa_mark_t [usertype] filter @@     got int @@
   net/devlink/core.c:386:52: sparse:     expected restricted xa_mark_t [usertype] filter
   net/devlink/core.c:386:52: sparse:     got int
   net/devlink/core.c: note: in included file (through include/linux/random.h, include/linux/net.h, include/net/genetlink.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +386 net/devlink/core.c

   383	
   384	struct devlink *devlinks_xa_find_get(struct net *net, unsigned long *indexp)
   385	{
 > 386		return __devlinks_xa_find_get(net, indexp, XA_MAX_MARKS);
   387	}
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

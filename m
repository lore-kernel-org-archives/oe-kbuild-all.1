Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3305828E7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 11:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715426167; cv=none; b=bcePbRh/8gESNwkwLJf5oLxji/egAfEWS3Xw+14sbIbaNnWZn05MlopI/6bfh5RTOECVGpYOfZ/2wmxUWS8x3wWkYoo+2uqcSv2i8NygT/EfncaghjstMjelMP3+UUGglItCHGVLSG546OROKnI5faMIPnQhZNicK5rQXtBnEDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715426167; c=relaxed/simple;
	bh=MuNyHSGmqPGSVxKazF6Va5vCd4JPF6COnNvMtN27QQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=REsIaTcMODBFsW+PxObCCWkKtJlu5OocDrpceaco8ro50q9MaKrqc5q9zS4OWnAYMBJxcxwV7vZZKJs9lorDuc4z+z25jP1Y6CnAWWJxMrJyzBxKlGVrdI+5/W+MoNEQK5ROVnsz7EqQC2Ca9WlujNdxykIUU1LFxHjvQlgyTa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKUfO59f; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKUfO59f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715426163; x=1746962163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MuNyHSGmqPGSVxKazF6Va5vCd4JPF6COnNvMtN27QQE=;
  b=PKUfO59fSGxIeapXOJWQn7sHgLGdgDtF5XybKBuWVvA8YTWoYbxOo65H
   qGz3jDLWfp28+zauVqJL5H+2GIt13PAducw7i2HRWXcBPlUkXnqKQKGpe
   T/W5piTthMp1gLbQXNqFJ/D8A69ml+AZHOeI1aoU45wk0kbJkbRFsNzzY
   FftDnJzzmIj1Xo21W6uNxoDMGk5c0oU9XPuofxCb9bC0amKYIh75YaqKN
   kc8WBcF9qOsut+N1WWyQcU+fkESsSH91Xzi9p3GNCMu48wPeP3EW2f3bx
   eD0ieXiSsEXr/WjogIbn6rjFHaQKK4UIQ1HpazKUyG2T6mkiXToAs639o
   Q==;
X-CSE-ConnectionGUID: khhCULv4TFK7w7UtgLJSDg==
X-CSE-MsgGUID: B9yVbvnDRU+r2kcmZtmkag==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="15229625"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="15229625"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 04:16:02 -0700
X-CSE-ConnectionGUID: JWc5XWIRTE692yk7gG3Xmg==
X-CSE-MsgGUID: 8pNOdKtLSDqmfq2lkFblwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="67376983"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 May 2024 04:16:01 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5khr-0007IR-0p;
	Sat, 11 May 2024 11:15:59 +0000
Date: Sat, 11 May 2024 19:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/misc-patches 8/13] task_iter.c:undefined reference to
 `net_namespace_list'
Message-ID: <202405111953.m0JmGhxv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/misc-patches
head:   3c68876290b3daed7a2766d683c73bbb4fa5b3d1
commit: 2c5555038196a4907f205f412de7e09d17c5ee2f [8/13] netns iterator
config: i386-buildonly-randconfig-003-20240511 (https://download.01.org/0day-ci/archive/20240511/202405111953.m0JmGhxv-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111953.m0JmGhxv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111953.m0JmGhxv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/task_iter.o: in function `bpf_iter_net_new':
>> task_iter.c:(.text+0x1789): undefined reference to `net_namespace_list'
>> ld: task_iter.c:(.text+0x178e): undefined reference to `net_namespace_list'
   ld: task_iter.c:(.text+0x17bb): undefined reference to `net_namespace_list'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

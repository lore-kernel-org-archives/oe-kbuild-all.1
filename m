Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267E52DFA3B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Apr 2025 02:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744682494; cv=none; b=J03EgqIAmRoT3bT+GcxGPV9opLEGY+oLZSPr4EHMWTdx/SB/j/ZG7POkEeISFPsmovj+GXk7Nb0FMa4bWjcsmewCkn6i9mB1FyRYKoFHnKx4H+ytb4op/YkNQ/5xo3MK8m0BXc3yU1PM06QIgLm80TOwGeAYTpPELp4+ILxOsZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744682494; c=relaxed/simple;
	bh=XbvBlgE/QBqdxPsxugY1EtZXni3PrNS0HWvbVkymho4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G78CChZm2z1r6AKFciJmVlWYNxj3G6QNK0EzhhJA2RvWI/u2jAmYLKUq0BmiXAoW7NRw6X8WfVr493fDMmiWN+Jar692IqwhUuEJJ0ycYguOEQ4a7sqU4esTvdN8levQKC+qo/GPkQjXDe93nXuPELyFfaun33TYEbiOcI+7odo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIjg/skr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIjg/skr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744682493; x=1776218493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XbvBlgE/QBqdxPsxugY1EtZXni3PrNS0HWvbVkymho4=;
  b=GIjg/skr0TfzXJdK4LATtAshbM3f5Ub7qzcKnIcr+JIWf52JSyxBf/zZ
   tnXjYICaYHzsbBeWJOOfwSmSivXxsq2Oh3IVK7Akr/QajadPdQvzLRKUr
   Fmn6vJucFHH6/jm7MupTTwWIVsxA44QTbO+in1vRLMbX+0lmWUt2xwRgV
   0b1pY2e5vdHhwCH0IGLOY81xwbTktMnKzKQBhlD4SctMhirOw+mGqa7A7
   kVb61h/TExXIL6ipoWZHTh0Id4xJv+odpXUPFJeAGQX1wLp2XkAolw1ry
   u6KOpCWAY/YWv8SYywoMw2gbIHJvf5qmkBcSGwcdqthJUvcm7Bl4EgHxI
   A==;
X-CSE-ConnectionGUID: rcen9mcTRMqcXz4+ab2F1A==
X-CSE-MsgGUID: 322ZwcWURteRjvI73xF+Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46052149"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46052149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 19:01:32 -0700
X-CSE-ConnectionGUID: 5sYmUmZTRna+r75E31VV+A==
X-CSE-MsgGUID: ZAZ03n3KTzqKY4j+01l9PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="153163105"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Apr 2025 19:01:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4Vc9-000Eus-1b;
	Tue, 15 Apr 2025 02:01:29 +0000
Date: Tue, 15 Apr 2025 10:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_vmscan_cpuset 2/2] vmscan.c:undefined
 reference to `cgroup_node_allowed'
Message-ID: <202504150915.hmZjUnRg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_vmscan_cpuset
head:   88bb3ae545467e127c3827d6f88d8ca905a6c6c0
commit: 88bb3ae545467e127c3827d6f88d8ca905a6c6c0 [2/2] vmscan,cgroup: apply mems_effective to reclaim
config: loongarch-randconfig-001-20250415 (https://download.01.org/0day-ci/archive/20250415/202504150915.hmZjUnRg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504150915.hmZjUnRg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504150915.hmZjUnRg-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: mm/vmscan.o: in function `can_demote':
>> vmscan.c:(.text+0xac): undefined reference to `cgroup_node_allowed'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

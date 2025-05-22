Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24DA23E34C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747946789; cv=none; b=OsgqbbeTD+pJlXtJ3Ua06gfiKMiqZDfgw2qvmcxr7nq4dNO4dR+OGYxcC4CcT1Q+DzVLKJZftb4gGqIoB5TY/SmXp6dy0ZVe+gM7OlnqB1eKk8DJFg9BXkpotuDPpE0ASZG7hmEjh1snDL0Y65EJh1QtL1vk/p4yGduxIrM+E8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747946789; c=relaxed/simple;
	bh=jLOP9tvJLxVBF/+ayIgFqaUiFPwhc0hDw67koxfr9ts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qt75Gx4MnNeMiGDE3zMNQ9kqKC3hgq872orHpagrVHG7XLxdrxg4vRmrllWuAd8Wy9oHXDIpch22s6aoIbstaYFwZocRxJXh41rcWPtUhmRSHmC1IRfoBBQhr05z7ahUpKfx32AzUw4x3hSg8RQEp4NiVxBRNoRLRds/9OEmWpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jl3CLhyJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jl3CLhyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747946787; x=1779482787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jLOP9tvJLxVBF/+ayIgFqaUiFPwhc0hDw67koxfr9ts=;
  b=Jl3CLhyJIBQKP5nsUymojx0jzv4JRxXec7oFB/D0YuzSoj3RU49IFG/e
   5pYtaOw/X1ihxYoM+ydGmGMzrz2+Z36TlYUd5/lrDIN4jnsaep/H0d5Gq
   VAR6fq/AegIitkQ6KxkTlT67qNa62qOk6ZPdsyM85IBNnj1IrAPHXH8gR
   vVYdTDdhNgctp98DUrSPrNxjJAevtHUmgo5LAbY0EuGyyejv4Dy4/o8GB
   UMCiPuLzZJ45zfP5kZ+OyS4E6k/lhoDpKBYUpFWUP22UQEZ6/uySXSi9/
   N9oiKlRf2et6vsspP0WLGxbM9kSxafKZFtlo6qzMsfNHjInWnxJh5QvkB
   Q==;
X-CSE-ConnectionGUID: ri2IJI9IR7mM3GLxgzffJA==
X-CSE-MsgGUID: JZRjS3ZMSLyDmHSBXhb4bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75391967"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="75391967"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:46:27 -0700
X-CSE-ConnectionGUID: o6nxylNQSyW3eZ+yLLU4Sg==
X-CSE-MsgGUID: kPxw7xyJTc+NZvwO1e/SMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140594555"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 May 2025 13:46:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uICo4-000Ph6-0F;
	Thu, 22 May 2025 20:46:24 +0000
Date: Fri, 23 May 2025 04:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/sequencer 25/27] compile_commands.json: warning: ignored
 by one of the .gitignore files
Message-ID: <202505230402.OJcUZxd8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/sequencer
head:   c98e166f441f5581ae6c3ddedcd90966da5a9827
commit: d288634e13b63d4bc9ddefec9d9af1841d6b047a [25/27] JOEL: Add LSM metadata
config: arc-randconfig-001-20250523 (https://download.01.org/0day-ci/archive/20250523/202505230402.OJcUZxd8-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505230402.OJcUZxd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505230402.OJcUZxd8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> compile_commands.json: warning: ignored by one of the .gitignore files
   drivers/gpu/nova-core/nvfw/r570_144_bindings.h: warning: ignored by one of the .gitignore files
>> rust-project.json: warning: ignored by one of the .gitignore files
>> scripts/target.json: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

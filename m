Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5053F36B06A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 23:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780011615; cv=none; b=H0Qm/mw0MkzdnqaL8Woo8BdOI7mxrfyPTRKmM0j2I6vrc1bPTKUe452zy8DqinGbZ8lbsM054jpiLI8Qj+R670fxsWSOPDNOyvxwfVNqyALJDZ7GCbJxU7sI7MfMc3LRgIw/SQiMTfyLHIZX0jqzB5MU5xlBNB4ExRqkNHPrbq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780011615; c=relaxed/simple;
	bh=5MoIOJZd4RHtU8HcHmIvvJk9KQKJpmk6ZaDxeadR1FM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KmtIel7zhmzvtANo7vhAHlDWnQr/rVFZx4zVZc2LXCRTF0G5P2Goy2psrV6rnY88BLKBKZVOREwSeur8ipkXef2r6Db3+HhM7QF7aztKxKB0zVt4wpcxoCmZtlcRxyaC8eGWTcT4bmZM3IGuERqLbk/XUrnZ+2E8vA81SyM9GOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+AZm9KN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+AZm9KN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780011614; x=1811547614;
  h=date:from:to:cc:subject:message-id;
  bh=5MoIOJZd4RHtU8HcHmIvvJk9KQKJpmk6ZaDxeadR1FM=;
  b=G+AZm9KNOEkVVo/ClRJK6VJoZ5KrOgE8Ajs7GOMrWK8NoZbk0h1Zq/9U
   /J3p+ee33OeFExWrLkC9UT9Yd9OAfv289ISsAQdAS/rUNPvjJ/owu0EhF
   E4EBDGfJp+6wLeoNcav+Qt9Wa6dMTbgjOmKoSVS5BCT0cnd8mFQfyOi1q
   laduqXJknN1dtt6VIvYawUGJ2A2BNyQNZw/m3MyiHxkurhig2Fq4VEhw5
   raj4Y2JGxitpXDu7XTq4Gu/9g/H7FmWrXECfXc8tsd9i95Dn34mkIzEKC
   sriVTli4WoaM4p/JzBMpSZlEhMxOgmetMrHTm+sEhdGmOugwPYMXxf6BT
   g==;
X-CSE-ConnectionGUID: 8GctEd7SR3+t77RvvVYMug==
X-CSE-MsgGUID: jj/ipeg1QsuSXbTRwV25cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80011029"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80011029"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 16:40:12 -0700
X-CSE-ConnectionGUID: 8RL8dNl9SyyPQc+GeZT8Qw==
X-CSE-MsgGUID: NgsbBLzGShK+ogTKLlOOAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="238291237"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 May 2026 16:40:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSkKf-000000006Y2-1fum;
	Thu, 28 May 2026 23:40:09 +0000
Date: Fri, 29 May 2026 07:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 17/23] <stdin>:1639:2: warning:
 #warning syscall rootns_enter not implemented
Message-ID: <202605290717.Wwss925H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   a7fde1280c1b227b71c5104a5d1fd909e0cb77cf
commit: 6116b89ac8a1d72dcad63ee3a2516ad73eea30c0 [17/23] rootns: Implement rootns_enter()
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260529/202605290717.Wwss925H-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290717.Wwss925H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290717.Wwss925H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1630:2: warning: #warning syscall rootns_create not implemented [-Wcpp]
   <stdin>:1633:2: warning: #warning syscall rootns_wait not implemented [-Wcpp]
   <stdin>:1636:2: warning: #warning syscall rootns_kill not implemented [-Wcpp]
>> <stdin>:1639:2: warning: #warning syscall rootns_enter not implemented [-Wcpp]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

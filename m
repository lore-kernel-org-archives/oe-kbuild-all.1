Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9376419755B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 07:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771399963; cv=none; b=OCOqKKRQbQ3OdzQLOdDz+qzv8iBO2ge7abV68T6ZYG3WE6dvFbOuCQfCs95ZKDd7WG3dhC6ckb6rfEG4ilVqjbsPjrwezv/fIyZFXdlb+4UhlHzWdWcKBUxKc5FID5JXQRKCIFcpGJqRcY+ASjTxrbwkmbxetNGmFr3X1CjZ0vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771399963; c=relaxed/simple;
	bh=LPvVDCUJ7Er3qPV8y5pGqA2e/DvXeAj44MXPKIy8mKE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DM2x/C0XK5yJVnwVm+AqXM7MdZe0bGLHvHqdCjPxf1gDxplpqAZ5R6AqxT6LTXTnknTMwQihfmqBLFVzPh6M0UU22OPLylyhNzxH0EFehqE4m9TDQewNPAdkgb5H9ib2UY4blVw1ydvbe+h7MqnIa++viRhQU77r5bcxNiitfxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FI08OwIb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FI08OwIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771399961; x=1802935961;
  h=date:from:to:cc:subject:message-id;
  bh=LPvVDCUJ7Er3qPV8y5pGqA2e/DvXeAj44MXPKIy8mKE=;
  b=FI08OwIbDhcLo91OR5p1vGgjyg5yTauRE8pq8BXlM1PdAalQe4Rbp8i8
   IBhXLVBpi/lGepUa7vG7q9pl4RAUyhpTqzFnAOWPyPJPGzUActwD38O8E
   RWDQFFSt/M3S9vkPiq7BjGSJyjYuZwLkYgLXXyunIdydJK94EEF4dz2Bg
   fP1NIAMSQ8URQm89UKyxVxWkqGvfEZiobsHOOZ3aGinJGpwzHsymEiBds
   XprczLbGeexr4TwuyAUz3OG14/vOlmI+zwSi6kfPIB1om05p7OG4hNChl
   rMYvrciX1Yjl+N05YDr0IXn674dr2cn1a12UsDv0mMGwS66/TxXkjnVlX
   g==;
X-CSE-ConnectionGUID: XPRpMArsSCCI8wMAG/l5ng==
X-CSE-MsgGUID: BI+ir9z4QJaplHYoTYF/Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72519654"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72519654"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 23:32:41 -0800
X-CSE-ConnectionGUID: MPSYwdj+Rqi3UxOQ50psMQ==
X-CSE-MsgGUID: 5Rxc6ZfXTue4YGSpze+VFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="213210175"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Feb 2026 23:32:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsc33-0000000129k-2GFo;
	Wed, 18 Feb 2026 07:32:37 +0000
Date: Wed, 18 Feb 2026 15:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 8/8] undefined reference to
 `nfsd_nl_svc_export_set_doit'
Message-ID: <202602181534.0MEXipVb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   67896fe53a48a300b8826416c1b4023d407c852d
commit: 67896fe53a48a300b8826416c1b4023d407c852d [8/8] nfsd: send nl_notfiy when a svc_export upcall is queued
config: x86_64-randconfig-161-20260218 (https://download.01.org/0day-ci/archive/20260218/202602181534.0MEXipVb-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602181534.0MEXipVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602181534.0MEXipVb-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `kernel_headers_data_end':
>> (.rodata+0x6ec158): undefined reference to `nfsd_nl_svc_export_set_doit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

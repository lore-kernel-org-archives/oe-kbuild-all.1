Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794051333;
	b=4M8X/YKNh/JoPVIpJVvQRwCYSU+04RusFCkvYmb/gpWTOnlFwOcCNXC6E0v7n7R+33hy
	 F/HWuIYOLOrwtigsFHs5B/Gi8iw+zNe88BqhebU2G3wcVqqkItKWp/13JY8Ncdyv4DfgT
	 jXLtzGYPG6EnGKNnF9oJMhF4+IOegPPxKheH11RhBkM0mr2kjlVpiFZ221F5+BljL2++2
	 KW+h0QPpa5f3FXQN4uslE0I/WMgNeeAfVzjxveMNz+tLxq1aW6R1jPOdTmsRic4UD2gxJ
	 CUGduH3XjbRyKrg4GKW0YZMKPbWiYH7E5+xHGs12v1ojIf3kvZ2NzOOieobsj/8/H9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794051333;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=PgKSDG+WEG+/1hqPL+lHWBm2hoHY50/wMHzkE3miLBc=;
	b=Ss6ylWsKzvAdSN0zTZpRJM2fD6wC/nC3i+zZC1SvgO3Dj+SH4zB7Q2h89yh+gEff10RF
	 VTrj0MRLUw0zR+K90+ug89zlm5v1dvW+1fRCZ/1EoK3Z/8MOQdHgP4MxPOukhY6xAzV6p
	 XquH5HkBYERy7hPHlYN2fQ6fFkaY3R2NZQdb4oH1fAwamBaWHcJ84i0PCU2UEj796VbNh
	 93tuBSaNnaoLCiTkng576NUUbwgELA9HSvSYPNmkZ2dMDiVE/zAcNbv3ovfUNRXGAozUo
	 rt4+t9OlzHJuKBwcGNTMRuT6ZtuLawTAmCfxLRe4a/IbF6g/kXbao+RGWEc+JYXpwxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hvHjtAXZ;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA8F606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 11:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA8F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hvHjtAXZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794051331; x=1825587331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0rYoSE6T1+/5PECxC1woLObCEZBLYsc5KN5Rtk3+Plc=;
  b=hvHjtAXZG3iGUa/0ARmZKrZmkCblNwdhnTIjLIeBCsyWOEms9vvnMHuK
   hsDggBZQD/86FOHgQWgZSWRorUEUHF6VRDV+2hywUKiJ9QO7Z6fg7fxmt
   hZ9MIoTWcQTWVUHElIgAgrm1E4NiJ6TiecZl2OWeHKOxtiv1etkmNqstG
   bxaFY9g31HeRjQxip56qWrpN9IKC+cZpWo3kWQ4WMcnISWfNfOlwDT9ql
   Lt5MSQyxdlcbeCGUu2ZKioObZ9/LTJCk4K7CYkY53TlHGAuDkPYJnhePL
   kgXHnab6OkjFz7DpRgxKycDNaC7e/9doCGfcbdOLUt3xw+YCQStmJg+AX
   Q==;
X-CSE-ConnectionGUID: yLftd1XsSoexJ2Jy7sGRVw==
X-CSE-MsgGUID: JlVciGJ3Q2GGp8o5YWFqfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2767679"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2767679"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 03:35:31 -0800
X-CSE-ConnectionGUID: 3jaVOPPIT1e4lv2yOJz4jA==
X-CSE-MsgGUID: LXZNFWEFTceMCNNJQjQWxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7311919"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2026 03:35:31 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPehj-00000000qlj-41ig;
	Sat, 07 Nov 2026 11:35:27 +0000
Date: Sat, 07 Nov 2026 19:35:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/configfs-const 31/34]
 samples/configfs/configfs_sample.c:343:9: warning: initialization discards
 'const' qualifier from pointer target type
Message-ID: <202611071933.6wRnAmF6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/configfs-const
head:   0e68ea5975531faee86ef390018b5d08916b17db
commit: bd1e491ccf3cb7d868d2f06405e7419328a27a7d [31/34] macro
config: x86_64-buildonly-randconfig-1001-20261107 (https://download.01.org/0day-ci/archive/20261107/202611071933.6wRnAmF6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071933.6wRnAmF6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071933.6wRnAmF6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/configfs/configfs_sample.c:343:9: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     343 |         &symlink_child_attr_nlinks,
         |         ^
   samples/configfs/configfs_sample.c:411:9: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     411 |         &symlink_children_attr_description,
         |         ^


vim +/const +343 samples/configfs/configfs_sample.c

0a51cf54232ecd Breno Leitao 2026-08-26  341  
0a51cf54232ecd Breno Leitao 2026-08-26  342  static struct configfs_attribute *symlink_child_attrs[] = {
0a51cf54232ecd Breno Leitao 2026-08-26 @343  	&symlink_child_attr_nlinks,
0a51cf54232ecd Breno Leitao 2026-08-26  344  	NULL,
0a51cf54232ecd Breno Leitao 2026-08-26  345  };
0a51cf54232ecd Breno Leitao 2026-08-26  346  

:::::: The code at line 343 was first introduced by commit
:::::: 0a51cf54232ecdfb8172ad7943e04e67e401538a samples/configfs: add a subsystem that accepts symlinks

:::::: TO: Breno Leitao <leitao@debian.org>
:::::: CC: Breno Leitao <leitao@debian.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440B135893
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 09:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745141791; cv=none; b=sVh+ITxcFVI1jdS9p8vFHGvwzjwY7u5sfiudF1PcMXjGHmTv4I1ObevWeMQrLXhOG5Es4FCno35v5II0Is1l9t9LRoSaoK6+7y2IwPOVtHJXcVnH2hvOCq9DHI81z/OUIyOQtcWEtAf8mg7ydCs/PzgkqRErwnPgRpwCSXsxvNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745141791; c=relaxed/simple;
	bh=wS7gstyJKciojYPS9VP2vEdaNP7UrxUtUkMK4jp6N7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZYarY6GbiPiOBRCpJcXcs9X+Kwo2FxeM52ahGt8vb7qphRbN012zlMvXz8LTFD9tS362wdR4YjSFXKfws6ameA82HeldcFkxkd4LnRUiknPOjahHhvag7+U/pKi7+711SDPed2PEgSEq210bKwgEWRdfT1usUsZWDfgwDFT9G6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBUFP48F; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBUFP48F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745141789; x=1776677789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wS7gstyJKciojYPS9VP2vEdaNP7UrxUtUkMK4jp6N7w=;
  b=gBUFP48FP2vLE7ikOMtj742Jj1DwXT563s7G6NPfwKG+N18DwCydhwE8
   0LpeQlmR7ON5mkvBxdIMtZ+P4mt2XPfQKsU8JlbOT5hJMoUUNrBY71FFz
   8tNuVQc9o5VWlPgYbTM5dVnpVGLvIf1m6fcZnhFyOHuyLN5EbnZwjmGxJ
   P78HAa3nS6m8Xq14u4XKCT/vD6Ax6QUO8TvrOOa68DmDXS4Qdn122DSww
   E3G2d3b7FD0d4bwcOvTdp3eCezC+hrc5W+DzQYh5HhoAYwFfQu1IOz92n
   LX2rzkK1pgaREs0bTYn/b1pDO0KDghKXO2XtXLXBE3gYpdbLpf54MwXl3
   w==;
X-CSE-ConnectionGUID: vUcF4NEuQ0+aqC35zSD6yA==
X-CSE-MsgGUID: 55ieEtdESQGk0QNvH+nr5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="64237664"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="64237664"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 02:36:28 -0700
X-CSE-ConnectionGUID: KxZJBf5DTeSqrJp0DRkoRA==
X-CSE-MsgGUID: hBrLWVVEQw24qiFzRScl1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136636777"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Apr 2025 02:36:28 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6R69-0004Z7-0r;
	Sun, 20 Apr 2025 09:36:25 +0000
Date: Sun, 20 Apr 2025 17:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:rdpmc_cleanup 1/6]
 drivers/hwmon/hwmon-vid.c:18:10: fatal error: asm/msr.h: No such file or
 directory
Message-ID: <202504201752.FkZ7L6vU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git rdpmc_cleanup
head:   ef950ee41d42e00ff671e4022ddc8faac83ffeb2
commit: dba1f6081fb02af0af96937b167d27555e293ff3 [1/6] x86/msr: Move rdtsc{,_ordered}() to <asm/tsc.h>
config: arc-randconfig-001-20250420 (https://download.01.org/0day-ci/archive/20250420/202504201752.FkZ7L6vU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201752.FkZ7L6vU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201752.FkZ7L6vU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/hwmon-vid.c:18:10: fatal error: asm/msr.h: No such file or directory
      18 | #include <asm/msr.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +18 drivers/hwmon/hwmon-vid.c

    17	
  > 18	#include <asm/msr.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

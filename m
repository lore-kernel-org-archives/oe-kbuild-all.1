Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165C2283C89
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 19:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852096; cv=none; b=DCMyu9u+JS0NFHw1ThlH8vx7WgLTaQqIiPhHqBJryVjXJ7f82bc2UDivVZnx2dKCxMSuvDsl7DYItrVclIb2C/XrNmr+aeNWs325GjAm48tkk2Mj43Cfqu5VCR8yYaBlT9OglzHd/zW4n29nkjgucl13SXHX5EiiMQ92y2XdOGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852096; c=relaxed/simple;
	bh=+aLzMwDMPYuhPLrDoo11twWLYsQSipM++U8BBEWOMt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cqjLPJJdsGT24o3jfyNVDPy5SgmzmRHljlfRzLRGP4h53xD7APKRM9d9LVBIsoUPvHdvofAD+VQypBowLoaKKUV991Vfqfq+uZpS6nowN2/+xK6v9ywsMTx0oKB4Dym9ryuTZJwBzKMTgSQ/xUAp3JEbIRuigIpOrHrXETapXkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAQjUgVX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAQjUgVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768852094; x=1800388094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+aLzMwDMPYuhPLrDoo11twWLYsQSipM++U8BBEWOMt4=;
  b=NAQjUgVX+8Gl85+0iLBmShFeHdfmr98gymPO2QBvQjTENUUoYxgcU5Z7
   +FeeYBei6hTcFQnMXL84ucevtqcEsewS22dMdsLnj3QUOEPQAMkJqMyeh
   N7VI3QLJcar6Mj7+Ppm59iaxgymyLgH6hCeJNr5HAtBXSefXxLdAEPbP0
   CZDmxcQE0uVC5+4zzs/mcMeYr3zS+OKX8dxtVkH80MeGK+lxvt41T/LO6
   tsIaZx3YeypxBufuk72HE3tV15gEYAs+l184tSQi6Rp8GdiwVLhVcfzUC
   Gy7Xflpofu4DToEoW1SeMP/P92I8OzzoUWwH95a+MfcBuSxj6zmrLuMWR
   A==;
X-CSE-ConnectionGUID: DGOFr/vqRb+JS2R0g9EttQ==
X-CSE-MsgGUID: 8zyzmpXhSCqjN5sxdCbn8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70153726"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70153726"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 11:48:13 -0800
X-CSE-ConnectionGUID: jhdb+dI/Q3WHD8UxxsLTrg==
X-CSE-MsgGUID: b3ddYlVCSGCJTEwyyVJsug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="206365602"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Jan 2026 11:48:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhvEP-00000000OF8-3xJa;
	Mon, 19 Jan 2026 19:48:09 +0000
Date: Tue, 20 Jan 2026 03:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 4/29]
 init/test.c:3:10: fatal error: time.h: No such file or directory
Message-ID: <202601200306.JSsS2gSH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   fc55af66ff49a263c16fc4ddf9877c91a307edbf
commit: 80643f78e2004b8b389b1200b6a196940afc14e4 [4/29] test
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260120/202601200306.JSsS2gSH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200306.JSsS2gSH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200306.JSsS2gSH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> init/test.c:3:10: fatal error: time.h: No such file or directory
       3 | #include <time.h>
         |          ^~~~~~~~
   compilation terminated.


vim +3 init/test.c

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

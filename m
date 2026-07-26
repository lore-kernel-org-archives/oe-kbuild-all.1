Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C12749ED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jul 2026 03:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785037462; cv=none; b=TXteuTH5UfGvhmwZE75xvSoIJ4BGd7hdQS6SBpeX1/l98ABgd0Ms6vuUhaVH0aid/dhYBGEZzzEZpJJHxT28aWaL0fbxIykpDua+wnHndrpBk0n4uiEnVjWtsan9idEASpZbCRPjctRe0XJIPE9b6863A6CQBoBrkDSXYJ+QCew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785037462; c=relaxed/simple;
	bh=gK6dwj4Odzzjbq5Ie4lhkXds8nLISCK7rdjW5BWj9nI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cs25h/iKLN/KweZC8kaRD0PfH7PcLxgBfLSpmE5vTNlMXjIoSSweML/L8+FcDlj8TkW0OstMzGwevXz+A7fz50Qv1w2/vhkbcqX75Fcy8oOaGQBLq0WaErgl/pxSiYwlUoalYZ+9eA3fKO52BNus6aHtcAHXmlcJ/pkzfecwouY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdMXIQYz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdMXIQYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785037460; x=1816573460;
  h=date:from:to:cc:subject:message-id;
  bh=gK6dwj4Odzzjbq5Ie4lhkXds8nLISCK7rdjW5BWj9nI=;
  b=kdMXIQYzBus8o6DXS06qT6M6zmSOm2EQZECXTzli342L5oQ5EMWyZtrL
   84GMdQqzvkQEJBhUah8O/IV7AiWX7illyKZ72/1qN0UQSKVCLEaT97fpm
   OGU13dPSPVpYq+8gEJQRsEYTAyTZvENKc7X70uXAtaXsF8C54ucTVLsg4
   k0nXu2QzHfrSdIW2KwYfobHwJb1Fi8fPLOXfBBnM27ka8fYYDYf8DJfcc
   eDxZfEf5HdE2VwU9XQkDQTAu5lcbCCWyDiGlW0gbPuPO7ZBAKz3uRleo+
   q2arlCL26crRzMBhP6tH4UarrQzSotiRT9P5uV4+d1WTQY7bJcPsF2jnl
   g==;
X-CSE-ConnectionGUID: 8ApS9vjUQo+svq/b6W401A==
X-CSE-MsgGUID: /sb7gID+TiqGSVs/7iD5lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="97021101"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="97021101"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 20:44:19 -0700
X-CSE-ConnectionGUID: YBfC+n0nQq2jHtdguVCEeA==
X-CSE-MsgGUID: qIIHFA8lSay0roL7FEWdsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="282403889"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jul 2026 20:44:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnpmh-00000000cGB-2byQ;
	Sun, 26 Jul 2026 03:44:15 +0000
Date: Sun, 26 Jul 2026 11:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 53/59] ERROR: modpost:
 "fs_bio_integrity_verify" [fs/xfs/xfs.ko] undefined!
Message-ID: <202607261137.rvYFCx7l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   10c7aa6f2c85085eec34737be592d6ae69583782
commit: dc5c730a1638c980c34768ffb41f195071d7e662 [53/59] xfs: add support for writing with data checksums
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260726/202607261137.rvYFCx7l-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260726/202607261137.rvYFCx7l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607261137.rvYFCx7l-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fs_bio_integrity_verify" [fs/xfs/xfs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

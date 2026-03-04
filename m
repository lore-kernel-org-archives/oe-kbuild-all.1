Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F2037702A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 04:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772597896; cv=none; b=dLgjZWnS7zt5doZ+YnwWAJ3ZdDu0lB7qbik262gp3jn7WPhcFbkNNEAa3V4M8AW1jB1WWaKDv61CsPze6dxehJB2yLeeRBCaXOShtodeTb2U1hmKhARGp1pbB/YEVm+TymwhzuPcWpU0puyT94o1ujv+aWV8kD78U/o037nvW/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772597896; c=relaxed/simple;
	bh=ZLd5ea9sWzqLJ+zi8wM68oSzh0OfiV4hCh13wo5inPQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bZgRYAPz30NhDTU7JOE2tCBGw2IQ3JT/GAl1WVgQWWMnc4/UYn6aMnG993sGqHWSKBwaYN2t0pQhKOtQgK4LQ08fBQ5M4tzV/K2JckGkGEejQxjNm1PW6glMPTgeaxhAe5ECPMH2AECitNM1WBtpXmGW/FcN+gi/ya8STrj1TIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFQIT3gV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFQIT3gV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772597894; x=1804133894;
  h=date:from:to:cc:subject:message-id;
  bh=ZLd5ea9sWzqLJ+zi8wM68oSzh0OfiV4hCh13wo5inPQ=;
  b=gFQIT3gV2M/j7rr34QVxjqfnhbpME/qv8LOsJ3H3yRQQFj/FOG3AZ7Up
   GLvtr08jR324rU9xu3jvpwZk9mNixrUh/mpKUVjzfAQjUQRcivY9gyWHD
   Cv4goKzVlHQKZV0C4PL80StBVL0M2rqdXpPpBk5jDJNyYBeAdtnrADqJN
   9q9Zq6fTJE8kdpk+cCWV8RXicYRwq6j999MM19n5j2NJ7Kwdu2hkM5GDJ
   L2R2z3WgCwkmv1N+NXQ+U1JyoUC2SYv1zm9pn0U83Cy5xkE33ZduWmd7N
   WUAN3eoqfl3Vu0OZc4UYY6LWxzDw5EYNAREl5PtkmC2cX0wbFkMb8qN8L
   w==;
X-CSE-ConnectionGUID: JYyXKxoIStml1p6X9h4dYg==
X-CSE-MsgGUID: w0XgD2KQRT++8t9Uq4ep2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84288932"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="84288932"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 20:18:14 -0800
X-CSE-ConnectionGUID: z3TxQAu7SmqcULpeIa4TyQ==
X-CSE-MsgGUID: 69UUP/8MRrCR0cLrM7afcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="244945866"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Mar 2026 20:18:12 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxdgX-000000003EH-3QRu;
	Wed, 04 Mar 2026 04:18:09 +0000
Date: Wed, 04 Mar 2026 12:17:51 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [linux-next:master 1687/3431] Warning:
 drivers/mtd/mtd_virt_concat.c:230 expecting prototype for
 mtd_virt_concat_create_add(). Prototype was for mtd_virt_concat_add() instead
Message-ID: <202603041232.fNDHNtUa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Amit,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
commit: 43db6366fc2de02050e66389f5628d3fdc9af10a [1687/3431] mtd: Add driver for concatenating devices
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260304/202603041232.fNDHNtUa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041232.fNDHNtUa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603041232.fNDHNtUa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mtd/mtd_virt_concat.c:230 expecting prototype for mtd_virt_concat_create_add(). Prototype was for mtd_virt_concat_add() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

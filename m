Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076286;
	b=Jobadch4qKLkBFTEHT7Tpx/fnIWv1Raiu2myKjLfVlwejod0pxI+ndqsjF7zpNFG1jHd
	 YZ2jEx/Kasmsa0pfWcIFSm2fSjymFC6ATrrsLpYBJfnOflUFKeJDOErokVshRl6RZkoew
	 NUPH5TF1PUCK6Lzt8i9Z04oKionoeyMPnDIpN9a+J+gjLmx0MNimPkDE46XzxsqfzGHE/
	 3cca4IAO/kBCvuV5psvC15CpGzZJDaxdLIBsgTB/wtYfxwcYOGlRKw6mEiVMVGD1XVXfd
	 zYzap39YIo4XuXlA/3MlOg3VY5S1mr6I3GVr2GxuwqldYRRTGSN1NUgPB6Qql1J00tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076286;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6FTHoVEZsx/FhNmubs3VkkRbIKjhyZE3BvnXnn+uoyM=;
	b=T5KHFnvFyGxwznblB4SshQpcbSYqApiu7IyGlrVZWUQc9J/y/nn1chGIN4zmtE+TQGdU
	 cnRJTvtBZqTnp1BcwNai6EkAwSRQRtn1lS73zxaFGE0G2lDvpWFpWTG2KKLdWsn0vzo8S
	 znTpDR1Xo3ri0TjGLjcDTb9uaKgWH4JUSTNjrYCtWI4KKDMO/ubJot7zFTag1YShfTnZV
	 60UwiMyiHFjeIoqODziglEIdkARIu7GNmOv/24I3SIqrzkXzh81EY/R41t2+ie55Wldqk
	 fYoxoQn9KLI+V5kUXaNyizgjZZNtKTDrAgyeqeEj3RtpuZtioabZxSqITgbmLPRf38g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XUAYSttn;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886DA60A2601
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 08:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 886DA60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XUAYSttn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795076285; x=1826612285;
  h=date:from:to:cc:subject:message-id;
  bh=Eixj7d1EBjhDnb31eSYedCZeku3EzSqyeyFix0tlmoQ=;
  b=XUAYSttnomDTc81DSMBvuhIyz+vpSmGUFcfLgwolckQf5CgMY9cexYIc
   GelvRaH/qC0AmycJJQBC6p7ILMbkr5goqu0mOj8oO3Gk1qyjB9qCBsyk7
   8YleYHxZNSvwbvBQa1tO6sWgbaKRDPkhCL2kmSUQbdTmSXASOqiiaAzDG
   h6K9OhafbaHq3Ii7++PYgfPgN1zp0mGRGzDV17alcDldbk552xb9qkidV
   sOy+1P30/fH5sQbEpAMT4sjAz3ak2MbL1wsA8WY995seCf2+ivpRPfTHq
   +Ywa2PLra5o7Nsla52TzkwdDvtVCVb9IB153/rQCMwxO2LmqtQ6Vdya1x
   g==;
X-CSE-ConnectionGUID: XOpCkUjKQFewSm2vpHXqiw==
X-CSE-MsgGUID: 08x52PEiR5qBTKQrh+Qn9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3965762"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3965762"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 00:18:02 -0800
X-CSE-ConnectionGUID: 0c1lY4xGQdymUTtAGVWo+Q==
X-CSE-MsgGUID: ofKSfb6VT9mPplaWjyc3vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10515907"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 19 Nov 2026 00:17:59 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTxLB-000000003j3-1TiL;
	Thu, 19 Nov 2026 08:17:57 +0000
Date: Thu, 19 Nov 2026 09:17:08 +0100
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl-pseudo-lower 10/10] ERROR: modpost:
 fs/overlayfs/overlay.ko: symbol '.__file_real' undefined!
Message-ID: <20261119090638.afJuMl5A-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/amir73il/linux ovl-pseudo-lower
head:   4853b8cf9d686f8b7c44ee0d9978a3c3bd36392c
commit: 4853b8cf9d686f8b7c44ee0d9978a3c3bd36392c [10/10] fs: add ->f_real() file operation
config: powerpc64-randconfig-2000-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119090638.afJuMl5A-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119090638.afJuMl5A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119090638.afJuMl5A-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: fs/overlayfs/overlay.ko: symbol '.__file_real' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

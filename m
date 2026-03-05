Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD63F39FCA1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723055; cv=none; b=jsI653tmcom0UZmfR9GPY52moLC6NSV2r5ElLYOps04IrFcc4HXHo6GIBj89CjYPnRa98tY0J4sXgbiShG0x/1b211Nb7CREtV9ZDPXMqouSWUf0eWZhPhuX7xaQd9yt4qDv1rc42J+ZaIqfgMtcOexHJG48heTUg5ltSIIZEBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723055; c=relaxed/simple;
	bh=Yv4oojOeY6uBnM7Ij4vLrEj9VsdAwvPL42bQ1OsB6Gk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H4A/ulPD0nYiXgTKGrx/UQ04q2egMC1GlPJ33CQ79Jfg7z1tqlw3fMGlE7P4RgkC8fn7aGLhHZKg2Hz4kO9zarzoCT+2bUXgee5jI4MIj4wFNecjUeIMcIpih16ylAuxh/+DhGc2TjD3Zuz2SjY9FaYMUFaDIfZUxl5NE/yxZeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KERXnA3W; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KERXnA3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772723054; x=1804259054;
  h=date:from:to:cc:subject:message-id;
  bh=Yv4oojOeY6uBnM7Ij4vLrEj9VsdAwvPL42bQ1OsB6Gk=;
  b=KERXnA3W56TkHx6ytwdC/09ABuKNxCgEwM114Q5GjTGOdUKBtpP0kxey
   e52bTPIOdTfh++HAqVx3cNEpYCknZGzWUbs4u/xl4nA/khGlcloyQMJSI
   7ERTLnITCZbTeFGmdil1wGi/MtXzVHLtHIqMmVIHzMVGz0yE65M4RiKBT
   VSEvsHYg/0CuTfAPathtbwWmIOUmEHju8alHrWo0/m72eMXJI+PlSCgl7
   yRaSrp8nabujPRvd8Sxdt3q7i+soJz0BJSFAXdwXu0OlAivbDYp2Svnlm
   joTT8Fb4K0UHDuIwvFiVxqqlA3ryJRqcYcWudYRMeluRjtiFilN+Xejb7
   w==;
X-CSE-ConnectionGUID: Nlpgbiu6RqGDFcsXDEDtXg==
X-CSE-MsgGUID: WevymiaFTMG26ecko3lpVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91386001"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="91386001"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 07:04:13 -0800
X-CSE-ConnectionGUID: Sb8B1zuFSUGOfTCfYl6E4A==
X-CSE-MsgGUID: Y012p6Z3Q7C+UWu5TP1Wsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="221580340"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2026 07:04:12 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyAFF-000000000nE-3KiE;
	Thu, 05 Mar 2026 15:04:09 +0000
Date: Thu, 05 Mar 2026 23:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 158/467] Warning:
 drivers/usb/dwc2/debugfs.c:27 function parameter 'iocb' not described in
 'testmode_write'
Message-ID: <202603052252.upUbbNrM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 4e816a38a0281f5bf6336d1c15a7691d5552aa84 [158/467] usb: dwc2: convert to read/write iterators
config: sparc-randconfig-002-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052252.upUbbNrM-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052252.upUbbNrM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052252.upUbbNrM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/usb/dwc2/debugfs.c:27 function parameter 'iocb' not described in 'testmode_write'
>> Warning: drivers/usb/dwc2/debugfs.c:27 function parameter 'from' not described in 'testmode_write'
>> Warning: drivers/usb/dwc2/debugfs.c:27 function parameter 'iocb' not described in 'testmode_write'
>> Warning: drivers/usb/dwc2/debugfs.c:27 function parameter 'from' not described in 'testmode_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

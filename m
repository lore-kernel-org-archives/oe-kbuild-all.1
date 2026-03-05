Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FE93A5E73
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772719027; cv=none; b=jzkocjPMC8oCaWX7U5cZqYck0L5Rcp7qxl0lw5lgqqr1iGJ1CXyHQ+lfoTYcrNzJwIOPPcMrT61YSPP0YkRslPuK3IJTfKR8SBXAbbOGP5rEn4Pv/5q5FxjinJRLUI5mOs+0E16oa8s1BmHg9hwbnLVbHkX9zD8Vs3+clIs4wVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772719027; c=relaxed/simple;
	bh=TGNMXCKMqKvWG6VvE4eJYbXvY6x2DT7dYwJggRb2K7I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ujjnDSedP7o8rQIWH29g3MBsZVuchcJmd30Wz80Emw+3UjZCkNwKsRScIQU0U2+Po+s0HA4gVEiU/rOIhhjBS5vw0vMgRaM7SQIlgcXSgwPtDgTugrcOF/vn/P1O7EOZ0UPxzahNWt0QPQ2CYLOjNc/LqSrHlz7Cx58zPLxWIgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TE+NGYZz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TE+NGYZz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772719026; x=1804255026;
  h=date:from:to:cc:subject:message-id;
  bh=TGNMXCKMqKvWG6VvE4eJYbXvY6x2DT7dYwJggRb2K7I=;
  b=TE+NGYZzK90OiGIW0CfyOmv5IBoBUlfSpyfb8KtSNDX85XWydvMTCyPW
   0aARa0PWff17AS5DNAXwia3ah3UUeZuk90cIqc5zTh0xgS8E/le17sKeb
   5XZTO8IHEzYgGuRn2Pxane2sAZvRKo0ByyaZFTJiBcxN0jxBwrXQmjnFX
   k+G6bI+MzRSZCRa1OCJQS4VT8r9vu60iGkcw5MRbBJLIFm5E+eqbbXjLb
   ulB47xSOaPmcLkyDdnbPS2ASB+0JatsbkVW320SyHNCpQuwaUhIP34U+w
   07PPu9df7ZPlHbUsToVRQBjvfxJ2/69XDjyGC0ZatM741RxMyo2hjFuzO
   A==;
X-CSE-ConnectionGUID: 9GEDMTilSp+CcBmcl3vQ5A==
X-CSE-MsgGUID: X87dIGrbSMGwaSuI9boQ1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73004875"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73004875"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 05:57:05 -0800
X-CSE-ConnectionGUID: 1wVKmQWtTg2/edX/+CbHHA==
X-CSE-MsgGUID: FEKLPgB5SyK++RwFPf+xrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223376996"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2026 05:57:04 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy9CH-000000000hG-3xED;
	Thu, 05 Mar 2026 13:57:01 +0000
Date: Thu, 05 Mar 2026 21:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 23/467] Warning:
 drivers/char/tpm/tpm_vtpm_proxy.c:72 function parameter 'iocb' not described
 in 'vtpm_proxy_fops_read'
Message-ID: <202603052122.4hP5MMEu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 80ebe9ed0a70b5e09fe3a7a474a77852ee6a15bf [23/467] char/tpm: convert to read/write iterators
config: m68k-randconfig-r071-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052122.4hP5MMEu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052122.4hP5MMEu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052122.4hP5MMEu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/char/tpm/tpm_vtpm_proxy.c:72 function parameter 'iocb' not described in 'vtpm_proxy_fops_read'
>> Warning: drivers/char/tpm/tpm_vtpm_proxy.c:72 function parameter 'to' not described in 'vtpm_proxy_fops_read'
>> Warning: drivers/char/tpm/tpm_vtpm_proxy.c:127 function parameter 'iocb' not described in 'vtpm_proxy_fops_write'
>> Warning: drivers/char/tpm/tpm_vtpm_proxy.c:127 function parameter 'from' not described in 'vtpm_proxy_fops_write'
>> Warning: drivers/char/tpm/tpm_vtpm_proxy.c:72 function parameter 'iocb' not described in 'vtpm_proxy_fops_read'
>> Warning: drivers/char/tpm/tpm_vtpm_proxy.c:72 function parameter 'to' not described in 'vtpm_proxy_fops_read'
>> Warning: drivers/char/tpm/tpm_vtpm_proxy.c:127 function parameter 'iocb' not described in 'vtpm_proxy_fops_write'
>> Warning: drivers/char/tpm/tpm_vtpm_proxy.c:127 function parameter 'from' not described in 'vtpm_proxy_fops_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

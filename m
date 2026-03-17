Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE503389DF3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 20:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773779446; cv=none; b=ef46EYC0tW6EYqlvwcY0V3z5YYLCTosbNRQoUBhQKys3FDpemZIFQ7viZuWg1mmo6cjAgkhYDF/Yj3/QOr/jEuFQuw9+5tD1SLM9tvK2ofDAo/ZeWjG6VAT32e6frOtNovoBa+hsW0poXHq3i7VgMHKE8unMHoCId/CGu8fxeN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773779446; c=relaxed/simple;
	bh=PJQeislpNizkpJl/7BS/suDEHQxARdFXlgk2oAP1Wtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=otczrO4VE2gmZFVgt/hgpE7klEO1VG5a/H4XkkGrzDGrf0R16TGwbm9oHvhFDzJzxWFg8laemseK0pBqnampursfjle/2pQhqzrZmonkrajuQItGSN7GmJj4eyZLykG/cNLmIZwiNf2vw2RmXYxfRsX5nnMiMCeCJ4R48KHJbaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmPxZCFZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmPxZCFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773779445; x=1805315445;
  h=date:from:to:cc:subject:message-id;
  bh=PJQeislpNizkpJl/7BS/suDEHQxARdFXlgk2oAP1Wtk=;
  b=nmPxZCFZcHSo5OUTxP21h+PXN+mcgO/VTMl7chtwpCFqVoKr/TqlPe8j
   /qT2eXmLi2zwhONifDYWz6y9I32y53e1CB10hE+rkLYzqLxucqP1S2jho
   WelnT4OsLtd7BcGSSWjOQwZ+Gk4K0VC661C7a1H34RPxjufZFEuFkmrol
   fZjzhiQ7fUxuAajZ3auwkRHyFj6muYsldvvIxgEsChvIAzQdrTWjIB3vD
   SzP6pusVrqZSXqXhO1UbsybZ9To6ZSINTWit+A9O3BF5uEIVYsA+pc6K0
   YCOX4HpXRfKUrT11/zlLVws79/f7LcvfeJb/jO3ZH1Yz8cHOB+ovEWiNR
   A==;
X-CSE-ConnectionGUID: rypLRk8sQmC/RK4KLtYkfA==
X-CSE-MsgGUID: qiaaK2tpQ4CG0vU1yv21Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92396293"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92396293"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 13:30:42 -0700
X-CSE-ConnectionGUID: yhGA3eujT5ywR1W7fY0jgg==
X-CSE-MsgGUID: EEA/+G5eQ2q90JLYPPkb4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226848896"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Mar 2026 13:30:40 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2b3l-000000001xN-2Bw7;
	Tue, 17 Mar 2026 20:30:37 +0000
Date: Wed, 18 Mar 2026 04:30:24 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-thread-safety 20/37] Warning:
 drivers/scsi/ipr.c:1019 function parameter
 '__must_hold(ipr_cmd->ioa_cfg->host->host_lock' not described in
 'ipr_send_blocking_cmd'
Message-ID: <202603180438.UsPfIxdK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux scsi-thread-safety
head:   3c045733a9b1fcfeeb5f3df5cf1eb6eb5a5998aa
commit: 6df185580ad331ee396efdc5a08c03e3fcbf91d4 [20/37] scsi: ipr: Prepare for enabling lock context analysis
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603180438.UsPfIxdK-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180438.UsPfIxdK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180438.UsPfIxdK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/ipr.c:1019 function parameter '__must_hold(ipr_cmd->ioa_cfg->host->host_lock' not described in 'ipr_send_blocking_cmd'
>> Warning: drivers/scsi/ipr.c:1019 function parameter '__must_hold(ipr_cmd->ioa_cfg->host->host_lock' not described in 'ipr_send_blocking_cmd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

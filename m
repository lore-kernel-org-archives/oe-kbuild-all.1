Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD97E175A7C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 04:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774069195; cv=none; b=Pw2ADC9MPJ7qNeEObHG35dHS/GX1FJkZSNN0CSj2qZ65YmTuOAGIhPeE27l+c2c5YtldQ3X3Q1JFjeHyxLqAEyiGPUect+Z1fx14z/u5aKAOehJrOY+PnaI57Mlw9Ys+UoNSTcM9VDEbHvpbEexSTgoQH7ZNodgE9JxvdbLOn6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774069195; c=relaxed/simple;
	bh=IS1Zj4tVlu7s8wwiJuJCG07RRZSlNGn6lsiY1+qieXI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cLgg6UwylMP9BDga2AIVj9XnB15eZ5t1xRNL9uVCj2UFG897A5DfiGrGOZWqKSsQzV5majQgT9/dzfBvfERUAn03hvn/gEuUd6cHOsYVNLKgkxkNkEPT4Mibsfgv1zWWXyEd0ciLcZxYQZ05+WJjIXgnzhCjw+Rw1aAdUGeB40E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhC/e2eY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhC/e2eY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774069194; x=1805605194;
  h=date:from:to:cc:subject:message-id;
  bh=IS1Zj4tVlu7s8wwiJuJCG07RRZSlNGn6lsiY1+qieXI=;
  b=YhC/e2eYFOBiS99mqelsizQ8UIpxyp+zvCqRntfh7OdZzjiDtcWYlefB
   6ygqZE0V4EoxjMEIxwab1DV6P9DFSjWFQhJkKx9FxX7VZ3FHv4PHL3AHS
   Jro/xPfwh/tjYEgKwFzidUiScMcvf7c571IRCeOEQCo3z6qXE8Zzzv233
   W7TsX+wjIJVXgjpjIpe4UQZGMK92Qz/Qruo316COdq8Cxx9zrtoSihdty
   RONd/1x9gKMHM5VPkXGjXjY3o8YT40abSkZBarXsophAYDWI8gy3XbkLP
   otetyu7WSPa/lAgncrW3DXUjd+7je9PEWd6sRNwNBuT8ItnelqlgSDoTy
   A==;
X-CSE-ConnectionGUID: J1pnNaJ5QiSl7Eiy32HYmw==
X-CSE-MsgGUID: RekaNmX0Sd+CNS1j/7DcBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75275532"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="75275532"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 21:59:53 -0700
X-CSE-ConnectionGUID: PUKGp20EQFyZTXJjoZFLvA==
X-CSE-MsgGUID: cGNXRgp5Q8a2K3exa7M59g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="222723160"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Mar 2026 21:59:51 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3oQy-000000000KL-08YZ;
	Sat, 21 Mar 2026 04:59:39 +0000
Date: Sat, 21 Mar 2026 12:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 441/539] Warning:
 drivers/scsi/lpfc/lpfc_debugfs.c:2629 function parameter 'iocb' not described
 in 'lpfc_debugfs_multixripools_write'
Message-ID: <202603211210.t5jXJrtW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   f36e0fb8d552bd827ef31f4fc1190d0149c44249
commit: cf8b7a8d95d071083dcd21a327aae46584fd133b [441/539] scsi: convert remaining fops to read/write iterators
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260321/202603211210.t5jXJrtW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211210.t5jXJrtW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211210.t5jXJrtW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:2583 function parameter 'iocb' not described in 'lpfc_debugfs_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:2583 function parameter 'to' not described in 'lpfc_debugfs_read'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:2629 function parameter 'iocb' not described in 'lpfc_debugfs_multixripools_write'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:2629 function parameter 'from' not described in 'lpfc_debugfs_multixripools_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3318 function parameter 'iocb' not described in 'lpfc_idiag_pcicfg_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3318 function parameter 'to' not described in 'lpfc_idiag_pcicfg_read'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3438 function parameter 'iocb' not described in 'lpfc_idiag_pcicfg_write'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3438 function parameter 'from' not described in 'lpfc_idiag_pcicfg_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3611 function parameter 'iocb' not described in 'lpfc_idiag_baracc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3611 function parameter 'to' not described in 'lpfc_idiag_baracc_read'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3761 function parameter 'iocb' not described in 'lpfc_idiag_baracc_write'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3761 function parameter 'from' not described in 'lpfc_idiag_baracc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4065 function parameter 'iocb' not described in 'lpfc_idiag_queinfo_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4065 function parameter 'to' not described in 'lpfc_idiag_queinfo_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4272 function parameter 'iocb' not described in 'lpfc_idiag_queacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4272 function parameter 'to' not described in 'lpfc_idiag_queacc_read'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4348 function parameter 'iocb' not described in 'lpfc_idiag_queacc_write'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4348 function parameter 'from' not described in 'lpfc_idiag_queacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4644 function parameter 'iocb' not described in 'lpfc_idiag_drbacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4644 function parameter 'to' not described in 'lpfc_idiag_drbacc_read'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4699 function parameter 'iocb' not described in 'lpfc_idiag_drbacc_write'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4699 function parameter 'from' not described in 'lpfc_idiag_drbacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4860 function parameter 'iocb' not described in 'lpfc_idiag_ctlacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4860 function parameter 'to' not described in 'lpfc_idiag_ctlacc_read'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4912 function parameter 'iocb' not described in 'lpfc_idiag_ctlacc_write'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4912 function parameter 'from' not described in 'lpfc_idiag_ctlacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5052 function parameter 'iocb' not described in 'lpfc_idiag_mbxacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5052 function parameter 'to' not described in 'lpfc_idiag_mbxacc_read'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5096 function parameter 'iocb' not described in 'lpfc_idiag_mbxacc_write'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5096 function parameter 'from' not described in 'lpfc_idiag_mbxacc_write'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5370 function parameter 'iocb' not described in 'lpfc_idiag_extacc_write'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5370 function parameter 'from' not described in 'lpfc_idiag_extacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5415 function parameter 'iocb' not described in 'lpfc_idiag_extacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5415 function parameter 'to' not described in 'lpfc_idiag_extacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:2583 function parameter 'iocb' not described in 'lpfc_debugfs_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:2583 function parameter 'to' not described in 'lpfc_debugfs_read'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:2629 function parameter 'iocb' not described in 'lpfc_debugfs_multixripools_write'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:2629 function parameter 'from' not described in 'lpfc_debugfs_multixripools_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3318 function parameter 'iocb' not described in 'lpfc_idiag_pcicfg_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3318 function parameter 'to' not described in 'lpfc_idiag_pcicfg_read'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3438 function parameter 'iocb' not described in 'lpfc_idiag_pcicfg_write'
>> Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3438 function parameter 'from' not described in 'lpfc_idiag_pcicfg_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3611 function parameter 'iocb' not described in 'lpfc_idiag_baracc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3611 function parameter 'to' not described in 'lpfc_idiag_baracc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3761 function parameter 'iocb' not described in 'lpfc_idiag_baracc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:3761 function parameter 'from' not described in 'lpfc_idiag_baracc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4065 function parameter 'iocb' not described in 'lpfc_idiag_queinfo_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4065 function parameter 'to' not described in 'lpfc_idiag_queinfo_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4272 function parameter 'iocb' not described in 'lpfc_idiag_queacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4272 function parameter 'to' not described in 'lpfc_idiag_queacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4348 function parameter 'iocb' not described in 'lpfc_idiag_queacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4348 function parameter 'from' not described in 'lpfc_idiag_queacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4644 function parameter 'iocb' not described in 'lpfc_idiag_drbacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4644 function parameter 'to' not described in 'lpfc_idiag_drbacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4699 function parameter 'iocb' not described in 'lpfc_idiag_drbacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4699 function parameter 'from' not described in 'lpfc_idiag_drbacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4860 function parameter 'iocb' not described in 'lpfc_idiag_ctlacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4860 function parameter 'to' not described in 'lpfc_idiag_ctlacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4912 function parameter 'iocb' not described in 'lpfc_idiag_ctlacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:4912 function parameter 'from' not described in 'lpfc_idiag_ctlacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5052 function parameter 'iocb' not described in 'lpfc_idiag_mbxacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5052 function parameter 'to' not described in 'lpfc_idiag_mbxacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5096 function parameter 'iocb' not described in 'lpfc_idiag_mbxacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5096 function parameter 'from' not described in 'lpfc_idiag_mbxacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5370 function parameter 'iocb' not described in 'lpfc_idiag_extacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5370 function parameter 'from' not described in 'lpfc_idiag_extacc_write'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5415 function parameter 'iocb' not described in 'lpfc_idiag_extacc_read'
   Warning: drivers/scsi/lpfc/lpfc_debugfs.c:5415 function parameter 'to' not described in 'lpfc_idiag_extacc_read'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA03337646A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654217; cv=none; b=rKzGkM0o32fdnQthPUxsLJe0ClceH2vBmjz4Nccu1WNATftk8SmpGoGGD/BlUaOJA4pCN5Yca0sOpvidSqTz05zeovTNbu9kfDtrc+gTOK/wLtKqHi529reIbEFLEWU3UQhF2FZeG6hsMvIjhCs93HgLzxMOB2g+kP7yhUErmLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654217; c=relaxed/simple;
	bh=ctZM14pGcCuO3ehcMDJTtzdHHC/vAvL67pU+U+/KqMI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DxfWYUNZYbLBCKwcnahceaWhOCYRmD7EcCNpaPs/eS+1bybdvSsVGr4jwNFuxyQdTLWNpCImBE51TvI12+pLvSQ1JLydCMuDjsZ+OAxvV/z7ZofYMHylewq8sQJDOmhBo2SZKJDFjJgpASX9hZrUWDnjDXr2j6tHQJbTDPFyLCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uq94EP15; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uq94EP15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780654216; x=1812190216;
  h=date:from:to:cc:subject:message-id;
  bh=ctZM14pGcCuO3ehcMDJTtzdHHC/vAvL67pU+U+/KqMI=;
  b=Uq94EP15VhGcSQBqY1jUU7DKIUb9DBkmV+wlnrct1MvNppCuIJTU79CN
   BD55f45iks2PhnA/GwzixB1EDyqDnXOQBHBMY7z7cwphm3AeQrr1W93/B
   E3PrQsQIairzVujlBxX4v8XHvA3RK+cL5LgUAk81zrZ7eU5EgbLDFQyBX
   vTobrTILJn5US2QHQv3OqlhEnDeSLcQfBhIKGCihEijzCmva+9oz4HNBy
   dDiC9S0m6ffOxpQlN9wflVwHZi3uBeomPE6VWHC9oxiL4onoJAvF1hHrw
   ChwwNl9UQFVxYwc+H4uzSghPG/W8p6pRglr4C9QSKeRNt07vGYindoxFr
   A==;
X-CSE-ConnectionGUID: yy1T+oDuS6yuVlM6N1JIlA==
X-CSE-MsgGUID: /hu8U+faSSun7BHMG8+MLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="99060917"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="99060917"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 03:10:15 -0700
X-CSE-ConnectionGUID: AWBhEhL6SZCxXnWyuhIttA==
X-CSE-MsgGUID: 92B9zVrSRf+AHfYhKIqvSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="268499519"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2026 03:10:14 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVRVD-000000002Y7-3WU4;
	Fri, 05 Jun 2026 10:10:11 +0000
Date: Fri, 05 Jun 2026 12:09:41 +0200
From: kernel test robot <lkp@intel.com>
To: Justin Tee <justintee8345@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: drivers/scsi/lpfc/lpfc_sli.c:261 function parameter
 'phba' not described in 'lpfc_sli4_queue_io_for_retry'
Message-ID: <202606051127.QwjG1Ef6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Justin-Tee/lpfc-Fix-use-after-free-in-lpfc_cmpl_ct_cmd_vmid/20260605-030023
head:   c4116d7aa9bf645d02aee57916c4f02ab9b611a9
commit: 71bfe938a0f8dfe6bd3cf1c1ec63dfa3862052ab lpfc: Put iocbq on phba->txq when ELS WQ is full or ELS SGL unavailable
date:   15 hours ago
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260605/202606051127.QwjG1Ef6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051127.QwjG1Ef6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051127.QwjG1Ef6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/lpfc/lpfc_sli.c:261 function parameter 'phba' not described in 'lpfc_sli4_queue_io_for_retry'
>> Warning: drivers/scsi/lpfc/lpfc_sli.c:261 function parameter 'iocb' not described in 'lpfc_sli4_queue_io_for_retry'
>> Warning: drivers/scsi/lpfc/lpfc_sli.c:261 function parameter 'head' not described in 'lpfc_sli4_queue_io_for_retry'
>> Warning: drivers/scsi/lpfc/lpfc_sli.c:261 function parameter 'phba' not described in 'lpfc_sli4_queue_io_for_retry'
>> Warning: drivers/scsi/lpfc/lpfc_sli.c:261 function parameter 'iocb' not described in 'lpfc_sli4_queue_io_for_retry'
>> Warning: drivers/scsi/lpfc/lpfc_sli.c:261 function parameter 'head' not described in 'lpfc_sli4_queue_io_for_retry'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6540B43D517
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 13:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852719; cv=none; b=Bgnp3HwrI46d8yQ97LE6WJkucoEsRnha8DtIaGBMDZE9IDWi/ksZzUQ/arzOr/5Mh1kMqUgPLxifRap6y0HCNiP/PBsAH4PRd09Cu2iUnagBMw7I9hZDQW18ojMnX0tt9+T1KkOjBEf+LSraYJdK0I5NGCorc0QbU8N+2DCF7pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852719; c=relaxed/simple;
	bh=xkrghVJH4nSRhbg4w5qasLE7UYMyinvQFhupCc7SVGc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=axxTY1zc3GUAoJP5uqDXveUAqpILYrt/EfaQxQLCPAE9Qj7zWL4wGM+chIIIp2RIr9fxVN6Nj/ETTcmaiB+UkZq7T6wTtmRAI7wz7ScFN3IwtiLOf8m+IYMnix0nxvzGlNh9EA2Nk1pyrtZxjQYCKL54VE75Vtm9RbsRW+zVldU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSrCrOH8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSrCrOH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778852717; x=1810388717;
  h=date:from:to:cc:subject:message-id;
  bh=xkrghVJH4nSRhbg4w5qasLE7UYMyinvQFhupCc7SVGc=;
  b=gSrCrOH8JWl9cdL27ZjZK4WZHO7xvSwgUpvC4BFgwO8AYLEJpYX/I7QH
   WCRFjqlRJ+SWB6WCFXhp1j8/MYkxLlOk6XSnaZFDC8Z16l58owjxKds0U
   /VjtiGxq1TKLUE3V8IxklnQj4YpVMFEqunLyQVCOxcjNFBR3v3YtCjR9I
   gck5G6pvH5LyhkKXHQ4CQZmAf+Xo7lUV3FMvI+Wty66FBlb2V3TdvgCPa
   06L+mJ/eeSpYgEIMmcnzcl4STWfGmIz0BKYC98+anC4e4mOJ3zC8ueqby
   /SpiqAvbTMR9WRokWxza2kYMJUz1st2p45Quvm2SGpz5sl4FiTEiEb51J
   Q==;
X-CSE-ConnectionGUID: HV52E6N7RsimK3eXswwb/g==
X-CSE-MsgGUID: jMIbW0OcS3qTRtoyTlR9gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="83663936"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="83663936"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 06:45:11 -0700
X-CSE-ConnectionGUID: rppuptadTcakvFC0ltPv+Q==
X-CSE-MsgGUID: PjptBZyhRIiAMZtVVYO9yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="262216033"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 May 2026 06:45:10 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNsqi-000000008zx-0UB6;
	Fri, 15 May 2026 13:45:08 +0000
Date: Fri, 15 May 2026 15:44:18 +0200
From: kernel test robot <lkp@intel.com>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ERROR: modpost: "sock_def_readable"
 [drivers/infiniband/sw/siw/siw.ko] undefined!
Message-ID: <202605151557.XPLgM8vN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Michael-Bommarito/RDMA-siw-reject-MPA-FPDU-length-underflow-before-signed-receive-math/20260515-102947
head:   5b86121753e39f40a393cdea48e55330da3026e9
commit: 5b86121753e39f40a393cdea48e55330da3026e9 RDMA/siw: add KUnit tests for MPA receive parsing
date:   11 hours ago
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260515/202605151557.XPLgM8vN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151557.XPLgM8vN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151557.XPLgM8vN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "sock_def_readable" [drivers/infiniband/sw/siw/siw.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

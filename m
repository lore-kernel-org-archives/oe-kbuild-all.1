Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F662C3272
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 06:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762325860; cv=none; b=JX08t0+cXCdkD3P82nXORqsGzcoQ9JRmVw4+vswKQFTWnlzh7NGgmqa6nc7E6vG2oaoHWPlHU0AyVcoynaCZ5MJ7muyu5iRw/W7EEwzCtbM3gB6mXNPy2+nfIcMz4v16MyoYQYKjfwL5iQRFzVAfnYC7GmmUkjG2TJmR4dnZU2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762325860; c=relaxed/simple;
	bh=HI3TZbnQxfC8CSvVlMuSRWsX64PmLtVedBcRxuj2fJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mn3wvQzQjCAgZe49JFftz92KKSazy51t6YszrVZmMvHX/R2iDyTix+dOFIgNl+7M8FMBCITORdg1v5JxGcdtO9Q0JEYG4l6oidMNkhcf/VrIrLBUdEgLa+4ZBdD77/brDNzEDmgzEztksQoZrgqI2WbWV7x1MN+WLCQJ0Ix/fiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htPqxlWq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htPqxlWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762325858; x=1793861858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HI3TZbnQxfC8CSvVlMuSRWsX64PmLtVedBcRxuj2fJU=;
  b=htPqxlWqzqumdt6ZS35GdgYIaxl8CEl7xiWF26q2vGNqgriNmuLFh5gq
   1hMIE2NwtwCuVqf7lknpphJtuoncIB6bnRRoERuit/vLTlbtUV2IXJc5u
   u0wsdUL9kBA3oSGkdw2Re72RZWYe22yXfT3t03hLK4td8SM/X3vo+1eQJ
   3BMROPXZ7Q59ZF9WrYytLg7U60igM7asRAXk+C+izzDQAuSwOOlbhZ8sK
   nVzpsopKqgFXlQSAdMOWyMa69PPlV5422MAgqmeeKcPezsUsdPbIUqM0M
   jj3YQw+KEy+nZWTHoQHFP1o+d48aLm+RjWwy4khJum8xT3dsqPCfThIk8
   Q==;
X-CSE-ConnectionGUID: OOsHpXxNS1uu08nhnetWRA==
X-CSE-MsgGUID: ix7hCeexQz67ZM5OHViX0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64128164"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="64128164"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 22:57:38 -0800
X-CSE-ConnectionGUID: 9uAz7eCiQSimWLeutTY3aw==
X-CSE-MsgGUID: VVWbD8lxTXONwW3QumXlow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="224619915"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Nov 2025 22:57:35 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGXSL-000SEm-2r;
	Wed, 05 Nov 2025 06:57:27 +0000
Date: Wed, 5 Nov 2025 14:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 31/42] ERROR: modpost: "nfsd_handle_dir_event"
 [fs/nfsd/nfsd.ko] undefined!
Message-ID: <202511051408.B0tugMxU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   c4fcd7f276a417ffe8f80480c5c929b6764602d2
commit: 786e3045f9e3ad269806d53b2488749f13ed8528 [31/42] nfsd: add notification handlers for dir events
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20251105/202511051408.B0tugMxU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051408.B0tugMxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051408.B0tugMxU-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
>> ERROR: modpost: "nfsd_handle_dir_event" [fs/nfsd/nfsd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

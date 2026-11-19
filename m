Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051015;
	b=n4MzHxSOkelje/37UVOmcTaDLEzTNkqnpK0HfKW6hzE4ieM1RrNpTM7D5GTF367F8vxa
	 QtMVxj1kUBeHxotEzv8NDmpjlilcBPO65+2EMGv+PxK9vAKUJG/huYhU7JB6gQsghtebX
	 5uBD9idXzBwOIwr46vNkXzkMzD6cwMcI9ClJDOTjtky1E5eR6fbqyVsOjEnGSwR3uJoUn
	 yE91Sr8c+jTaeHV+9lyPgHUIi0n3CQJ9UYaM7LzkPi9TXFBwI73MU6CEJhxhM/qRyr9I+
	 qYJbo8Qr6RDOZSYKyC/mivGQZWsj8xv9zbhnp3V5DphpmO5NcoxTx5Ln1zKLCKhPrBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051015;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tZEfyEAhB4aR/MKZX7WWM4tJVftbVfVjhP8P9Fvk2uY=;
	b=jYPkBEPX2bX3EHsLZk2q+D3pBU1fSO+NmHQCULOmDpZ+MdUFvBPcdP4EtBuwqPI7e/sy
	 /WNe1NbSVOhhrgTDcfoz2i0RhMShFi18AKEeQc6rabi1+CkewfxohWuIKKFPN1y48+qSB
	 qEVFi7I6QfK6/ICD0g4oB67xhLtjWDRoKESZwtySe8V5iMBYmMC3XI913XF9H2163XMYp
	 wPc3GRxDgUHJi8JI9wkgE5LpgOsauE7S426mm0jSOzapsBO315f5BvPRdNOdkvrIPkIcu
	 Lhaq0yWEJDIKFgZ4woMiSjs53eT0W95WnUPHK+F0phvaALIxlsmChpsl0KS5d19eo6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EXY71upz;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4493606A333
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 01:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4493606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EXY71upz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795051014; x=1826587014;
  h=date:from:to:cc:subject:message-id;
  bh=HPvAe2JPWaYIDnGZ+xtm3R/sjyC3E0hWj8eN5obAzJk=;
  b=EXY71upz8gOps/SBfWb3S5Qg+U08Ba9c/JPynQpdXTSfWB29+/cNIkL4
   mEQfZ9iufqSJUVGxgnP9E4vAKcd7Q60K049EV4mtQNegZs5mJPZosNEi3
   5248v8a9eYxOhMvRO2D64sQSDOfHfzRCabGRoce/9Ys6LDpezovN6Fo50
   69aa4sBsynaF5nPLRLIP+rmtfOnoyhpucbo70rSuU0sFRMmF74exxXBRV
   yMJufsYQhLJQHPa378vgSxQMFpE0Efe6MkHYYjKaRtmmKwEvmLyNZuuSK
   j0CaOr7iGPZ5kWNT3NwK+a3CllYw1XPGB0Ojx2UTxcGw4y69O7IsxYxLI
   A==;
X-CSE-ConnectionGUID: Jii9tSbsTu6qobuOcaX2Rw==
X-CSE-MsgGUID: XFrk2UGpQ8yYdtXBEaJv+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3746097"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3746097"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 17:16:54 -0800
X-CSE-ConnectionGUID: ewtbjhOnQEKzvN+rGjzY4g==
X-CSE-MsgGUID: +SIrbWHwTFS/pol4L7O5fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10683012"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2026 17:16:52 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTqld-000000003ZF-3iKf;
	Thu, 19 Nov 2026 01:16:49 +0000
Date: Thu, 19 Nov 2026 02:16:27 +0100
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl-pseudo-lower 10/10] ERROR: modpost:
 fs/overlayfs/overlay.ko: symbol '__file_real' undefined!
Message-ID: <20261119020653.MKUlzuiv-lkp@intel.com>
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
config: nios2-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119020653.MKUlzuiv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119020653.MKUlzuiv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119020653.MKUlzuiv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: fs/overlayfs/overlay.ko: symbol '__file_real' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

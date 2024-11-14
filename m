Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E141AD418
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 23:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731625293; cv=none; b=on5X6oxwCkUzJrGg+IlaAFSDqRZ7oCx4HC1KbO/ZTadBnl2P8hMzIG+k/2wDjn2ksLTDtJ2hY2kn88e8YXgBMKNztg2FLmGlrosaZbOCm9vYoU4i12k33Im38vlX3nxHp3GmDJ2Nb8yb45AAkACBnk8+af6GdnKusKG3bAn9c2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731625293; c=relaxed/simple;
	bh=Pu0LrL/KSES8vjgzYjJIJdSKjRaK6YRg7nGV7dJxIfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r6ZtUiGWEZP+J/5x/GQL6nIu9A1cg/KmlOsmnmK49SSIy78HlFS6WFxOmKqZlwMEBE67KbWcBwOHcyNdNfoYabp2/xLqGh2diU+JfZd7NNhdItclKikEd47yPQCrAGNZAdZPsXdzjM/eYkSj9hDUJeq4MOQe7vK6z5aJACVcdKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZqXNL65; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZqXNL65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731625291; x=1763161291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pu0LrL/KSES8vjgzYjJIJdSKjRaK6YRg7nGV7dJxIfE=;
  b=AZqXNL65SXv0ezPwuM8Mmy+JsB1jcuo/rc5ppUKIfp8cMnLKT8jopY4P
   3aRVEY+LFcCCR9HQ6X7T4sHmr2F7EcjUjD8maqWK2C9E5ckCKytZt4ENJ
   os5v7kuM88sshdy3938f+Aon5ekfhZIyyaRwgcoGmcTGphLmrAolFIeva
   TTD3bW7gZXSb1g9TbZ+67kG7nmrXgzrxY8edZfU2c2zAtLh5dJ/00BJOZ
   C9JpVA2RUQdHgOugksZ9QioXLkceKTvCaIk/gT8cnJCeIh1AhLtpRx3BK
   FlroYkzMyktjWGaA2/v0wul6ZdXYGGtvdOWJo4IOxRxMyD5bUqybXdx4t
   w==;
X-CSE-ConnectionGUID: 3SvC7EWMTY2Lao0iBm+LFw==
X-CSE-MsgGUID: u60dA8nMQUG+TMQPnr2Nqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42993790"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="42993790"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 15:01:30 -0800
X-CSE-ConnectionGUID: klIRvw6VRgSNwQXIFThYxg==
X-CSE-MsgGUID: 2o3F4DQaS+mWwYfAb32dUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="93299120"
Received: from lkp-server02.sh.intel.com (HELO f5eddd9a323a) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 14 Nov 2024 15:01:29 -0800
Received: from kbuild by f5eddd9a323a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBiq6-00005f-2R;
	Thu, 14 Nov 2024 23:01:26 +0000
Date: Fri, 15 Nov 2024 07:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "Jia, Yingbao" <yingbao.jia@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2435/2435] arch/x86/kernel/fpu/core.o: warning:
 objtool: can't decode instruction at .text:0x6a7
Message-ID: <202411150656.tgo1YvnN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   3faacfa7d0e66f4dbc5da1dd4588c8f556e4414b
commit: e91bb0282220911c5f019e87a3516f292c5ea804 [2435/2435] x86/fpu: Add a helper to prepare AMX state for low-power CPU idle
config: x86_64-buildonly-randconfig-001-20241115 (https://download.01.org/0day-ci/archive/20241115/202411150656.tgo1YvnN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411150656.tgo1YvnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411150656.tgo1YvnN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/fpu/core.o: warning: objtool: can't decode instruction at .text:0x6a7

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

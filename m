Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3373A1B5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 12:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766321769; cv=none; b=OM0tufwJQpyH8NjJ+vBgRTrUtOeKBrUl/+Y4XQ1LTr/ko1qrAhKoUa57HUOaRzck8wntyst7neTEkICU65JINQnVn/pJ5wR7qGnnZat68sCQPty46vwWzHxh5Qth3bMUDov7DKBC9hX41l6zJTovm5ezUk7zThHK5+SO4jXvEZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766321769; c=relaxed/simple;
	bh=jsJZ1II4XRPc30w40lEoaXMAYocfn6g371YygDJTotQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JtK67ZdzZXCdxu46wkcPA3Wg8yjfgNhyIejb5QI1IhEL8ioPYAtZxWsRIYXTnCTRcPkkigZAaXTLoXCE3JfjoMJWM8YDGQOFcbUKRB43CoS5QSuxIPLDXWJ5O9y272Lp1FV5rTsgfyN5wBZq9f9nSbv+4TdzpMdjtMchUFLXpmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eQbBvaSt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eQbBvaSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766321766; x=1797857766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jsJZ1II4XRPc30w40lEoaXMAYocfn6g371YygDJTotQ=;
  b=eQbBvaStiyksmKPAzOQd1irGx3ToCXaVVx30l8gt/CNrb+xKqn9Zp6B4
   JQ2wk7UNiDxkV0Ze6uEI4KkDp/w8xzMZwI1jMqsAOTbNsOJXyFKg9mILq
   ynA6piFNfLuHcw7OyOJX6ti3TtOrSRPyrjVwR085Zy2jKvQnte9KEpuaW
   JoSi7a6O9NDf0EvNA1jNSb+A939Dr9YZZq6LVLQcbhwNoQcMCbmVuLCra
   auRqVIXxpTpjXBXdYkW46yQnRhv+iJSGP9QSBI8qDTCjiLG2+wuJwgl2G
   mSctlbmECFEjoKGxE4Fpdt8R4+9gQSiahA4NwfJPSJqsX/Kz3cnD05eXx
   g==;
X-CSE-ConnectionGUID: 7H/2u9lrTtmUq66LVymQOw==
X-CSE-MsgGUID: eNR+B6TIQZimBh1+fdkJ0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="70779231"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70779231"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 04:56:01 -0800
X-CSE-ConnectionGUID: pJ9KccjvRXK/x12VfooBFw==
X-CSE-MsgGUID: rmO5DeDLSmmQM+bGiXp+pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199322229"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2025 04:56:01 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXIyc-0000000053u-0bOe;
	Sun, 21 Dec 2025 12:55:58 +0000
Date: Sun, 21 Dec 2025 13:55:54 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 26/26] kismet: WARNING: unmet direct
 dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PLAT
Message-ID: <202512211329.psDS1DgT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   a9d28381f95a89bdcdd37365e033274ba5247458
commit: 3aecfb5d583a915dc68f9fb5b5bc7dd643d5016d [26/26] anolis: spi: add support for Phytium SPI
config: x86_64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PLAT-0-0 (https://download.01.org/0day-ci/archive/20251221/202512211329.psDS1DgT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211329.psDS1DgT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211329.psDS1DgT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PLAT
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PLAT [=y] && SPI [=y] && SPI_MASTER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

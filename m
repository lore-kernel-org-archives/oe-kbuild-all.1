Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0946A24A058
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722392; cv=none; b=cMZi7z9LG0WrWtNHhzKjMHSzxwQQLs9Ofeu3Exi/NH+0wxIjzZlqT+7KMYtDnVBc8u9bLIBXtdHnBhgRSpAnymuCzKwvqklOBhRc1giv/b0L96lax3WqAz+49B6fhiD1dOQo4AlFHKa3izJmeVJrFD00kq5MxzaCkHil36eHn9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722392; c=relaxed/simple;
	bh=L0r31tFvPbfjyd/l+pfm6KrTqasQBHQbwp4inKXIVwY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H2Pu2RPCE32ZQD/cw3vJ4ZwOCYFlAd9XrMC/xVl/OdWTy6z90cLeYAFTDZrfQ8Plc1+0fzciS1+L37vpIlEUH+vCcD/azx8n/lZEIx5AnCsZAQ30NiLQBeCCsUvrbKUfc0MVZnfW+crxpHdoRLKTMxCClaIpVG8uB60qaWOn8oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9D83io/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9D83io/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722391; x=1804258391;
  h=date:from:to:cc:subject:message-id;
  bh=L0r31tFvPbfjyd/l+pfm6KrTqasQBHQbwp4inKXIVwY=;
  b=J9D83io/R8e/ROvsZDLMaPR4qxNWs3vQS6GH7cqkWD3bfz8mekl+p+Nx
   jK1El3fT71sO9nVvQHViyJ3tN65I9aoT7rdn8P5n+QLehvgDn7Gc7IfVA
   uhiNI7Qa5GDJfuG9ofVDO5a7oBREW0s92586ipOgl2Y4/quGgrxDXDKjZ
   pinsPkXSw4L5bdGpJf9yFlHP7hp64JML1r9ZTyW3sOI11lSdDX7jR+8IT
   FL9/YBC7Zr4SsPZuHcJA6e8YdVSnUQkTobTgzJLdgzm6I4vR/I1eUunjV
   htmCE3DRmsrUZmoZ/6QX1HUwWAOP6W+6y7+SoVzNPUFkLF8n1TXsh1eL4
   Q==;
X-CSE-ConnectionGUID: 5xQ50EMVQ4msU0F9giMwrA==
X-CSE-MsgGUID: QOWXq5rlR9+/cgRnC72mZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73857987"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73857987"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:53:11 -0800
X-CSE-ConnectionGUID: UJrZ3B/WQ7+Z8SGv7P50Lw==
X-CSE-MsgGUID: nzkP65ydRoiXbTLS7sz1JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="249164091"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2026 06:53:09 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyA4Y-000000000l6-2Ir7;
	Thu, 05 Mar 2026 14:53:06 +0000
Date: Thu, 05 Mar 2026 22:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 254/467] Warning:
 drivers/watchdog/wdt_pci.c:353 function parameter 'iocb' not described in
 'wdtpci_write'
Message-ID: <202603052206.ZdD93T00-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 781ec5131fea319eb8e500335fffb1c5644bfe35 [254/467] watchdog: wdt_pci: convert to read/write iterators
config: x86_64-randconfig-012-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052206.ZdD93T00-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052206.ZdD93T00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052206.ZdD93T00-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/watchdog/wdt_pci.c:353 function parameter 'iocb' not described in 'wdtpci_write'
>> Warning: drivers/watchdog/wdt_pci.c:353 function parameter 'from' not described in 'wdtpci_write'
>> Warning: drivers/watchdog/wdt_pci.c:353 function parameter 'iocb' not described in 'wdtpci_write'
>> Warning: drivers/watchdog/wdt_pci.c:353 function parameter 'from' not described in 'wdtpci_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

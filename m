Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB46335E55D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 22:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772748375; cv=none; b=mz1vlLz3gxaw/viWl7zjHDoiAI70MNY5KSCawTal3cVGJLDpSalT5VV7zihtOjP3eFfxwcXoyppgQCsw+YF78emRwq1skyMLh+vUhpa+Q4byhzQFjdj37x6sL2L8Pg0w0TetgDKqwaEay3Pnqupj4XoykeOq1NEuppBqby92ddw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772748375; c=relaxed/simple;
	bh=NaiZfud7Kk84eAWYyO1fxapn+q0UWuAvcGxIplpC3qU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r5vw73h1Mu9dBa2r4A7N/PJh/5UkQOq51EPWVlriwqXC3A50bB+vMtjO6FExH5SSPcwnAEklz+f1RJzEWJSf28W+39bRkKB6BjcrH3z7xFigg+m3HFlKA2qtkNw9sPtw8eAqXXtmqW2lOcZk+hqvKOng+o+opaDRHBukpswLLOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kALYmw7M; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kALYmw7M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772748374; x=1804284374;
  h=date:from:to:cc:subject:message-id;
  bh=NaiZfud7Kk84eAWYyO1fxapn+q0UWuAvcGxIplpC3qU=;
  b=kALYmw7M+1gavhEPNEQ/QVsZ2O9sFv0LNm7N6vYAunZsGLxb6E5W7T7U
   7hjiYDv2qO1dOfkqWXLFUKOf3UPdCoOx2aE0GjD8Kg2uSVONBKf/vL6nY
   zOhQRAoYQZilUN6fZu5A2YL6VhmKfpO8GzX47fPNq8MN3CCvaIKdX3vKQ
   qF5fPtlI4W11W6+y+rD8mZjHgdJ4CELY7baRgmtn5h95hXt/byO9njuHr
   AyrL7VYstcOqGJW+iJgPeJIZv8CyRm9YFYCkCjk0N4+Q4g4c7U0cgctmZ
   HdZk8AYqUYZFI0d7anNtFKDGXskeJkvCjnZJWg0XW2cGltZoifM/IuQnJ
   g==;
X-CSE-ConnectionGUID: 4XkNEdB3Q+SVTWT9P4znrg==
X-CSE-MsgGUID: DrApP0xJSwqK37d4qPZXjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84486158"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="84486158"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 14:06:13 -0800
X-CSE-ConnectionGUID: uYJg4oKiTWKZ+HTpYU3GSQ==
X-CSE-MsgGUID: ZMbjid/2Soyhn2Kx5Qp49w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="216611202"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2026 14:06:12 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyGpd-000000001GC-2JYU;
	Thu, 05 Mar 2026 22:06:09 +0000
Date: Fri, 06 Mar 2026 06:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 351/467] {standard input}:7: Error: junk at
 end of line, first unrecognized character is `P'
Message-ID: <202603060638.FTbdXm3w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 6fab61a5255761dcff6b35d0bd2a156e6029efd8 [351/467] hwmon: pmbus: core: convert to read/write iterators
config: sparc-randconfig-002-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060638.FTbdXm3w-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060638.FTbdXm3w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060638.FTbdXm3w-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:7: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:8: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:9: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:10: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:11: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:12: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:13: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:14: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:15: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:16: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:17: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:18: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:19: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:20: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:21: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:22: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:23: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:24: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:25: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:26: Error: junk at end of line, first unrecognized character is `P'
   {standard input}:27: Error: junk at end of line, first unrecognized character is `P'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64BD4086A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 05:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770441333; cv=none; b=bnoHeoXRRFu7UyPWPVSKD8KFKLlJcZVGJAhsUWScdCM1f8GsWAdeFbk/mZ3iZGeeY8xBWd6RjeFZJTsFx4MgMJgx//En00WVXCQo3hY2qFhvfbDSPzFN2jMbQx0088ihWW+B1k8yjMlnJFxBzhiXDnEkn2IEfe9LdVPlB9PTPbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770441333; c=relaxed/simple;
	bh=gysFPh/93GdUVphwRUbSB8m85HQnTZKkESEvG+xDMKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jSPWt8yiAWxJZL9FEuZjHFSG8B3dHf3Tl/0Fp/7i6P25qlj5iujcF/xZcS65/m21FMO4k3dDJDBM6/GmrYbo+nM/bDwSZAN8rjiNMyinf70AnmMqEbXCjQt54Ry8bPooPZke1HP8zjhqL0Aq/AS7ohz0RMW8Ny6DEiIaJMUeqqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWjje6Ta; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWjje6Ta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770441333; x=1801977333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gysFPh/93GdUVphwRUbSB8m85HQnTZKkESEvG+xDMKg=;
  b=mWjje6TalOqEpCgfqXRZf12ILSRZXuSSMMjIbk/lhYz3Vx6sEdzvQztS
   ni3k13S+wILaEPMLyur+s7q/0zAkDkn1l7PgDUMCkRVLNxQvFNmB43LER
   5q3DXFCtDzST2VE4fxp9by/ybXK46UM5pXqBk1YHuaFCqnb/3lXzysQG4
   6nEfnzOYT5flmOmkjClhbwiMqm5Vafx7sOwbilgmrqTPK57tmNu82xanU
   b7ix4R/h8KjL0bArALCts8ErpaPQ39ko2nph+E2v8I1or2/gxQFSOznA3
   ZW3XbUITwMAcOOVZ6WuvbWbmwzwPF8EkKBpvpctu5lYl5lhxD0Y+uQtmJ
   Q==;
X-CSE-ConnectionGUID: bcwYUM5XQhy8SsClYnEQsQ==
X-CSE-MsgGUID: o4Or92FbSAmcBjHRingmGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75494989"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="75494989"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 21:15:31 -0800
X-CSE-ConnectionGUID: QdLxFjeSR+C5iyPooIP/eA==
X-CSE-MsgGUID: KI+JefARQcuJwSQf8FNO9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="234009755"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Feb 2026 21:15:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voafH-00000000lPU-3mks;
	Sat, 07 Feb 2026 05:15:27 +0000
Date: Sat, 07 Feb 2026 13:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
 "Tzung-Bi Shih" <tzungbi@kernel.org>
Subject: [linux-next:master 10251/12094]
 drivers/hwmon/cros_ec_hwmon.o: error: objtool: cros_ec_hwmon_read+0x6c: can't
 find jump dest instruction at .text+0xd2d
Message-ID: <202602071311.Q6tATiyh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9845cf73f7db6094c0d8419d6adb848028f4a921
commit: 165c14597d53cfa7bc97b4ff8bc85f7bd98262b7 [10251/12094] hwmon: (cros_ec) Add support for temperature thresholds
config: x86_64-randconfig-071-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071311.Q6tATiyh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071311.Q6tATiyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071311.Q6tATiyh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/cros_ec_hwmon.o: error: objtool: cros_ec_hwmon_read+0x6c: can't find jump dest instruction at .text+0xd2d

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

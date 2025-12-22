Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A182E6CA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408883; cv=none; b=TVSQ0Ax2CewcTKyZgZ/BCFccYOIHj7B4JjliRSYUo6RDauukocYBGWSv/KnZtlAC9/9BJwQeNErz3GgGQAnSkIHMF3Fa4qbeAsardVz7RbB1jC1kltzk3cRnCxTvlNX+ZqKPZYlEMacN8OHua0vT9R9dsUs+AkzMTZzqCMmBbJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408883; c=relaxed/simple;
	bh=rjimW8izdmx0Fc51v+TqBrQM+rou2J8QfnypiQYWGoE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DuklzzVwPqafsVw3h9RO8iRbqe8hr06CAHERZYbeZB/QRFXiveYZrCOkZnOTTbLXG2X60aITO6/ISIiPj92lD3AqAkX24qFyytjLbR9JUAsgQ5+WsNptM4PqRSAN4mYDdfipsESHeHujCDRqRHIHpz/IuFw5nad7CJ4lmiVjbXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HnIb0WQW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HnIb0WQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766408879; x=1797944879;
  h=date:from:to:cc:subject:message-id;
  bh=rjimW8izdmx0Fc51v+TqBrQM+rou2J8QfnypiQYWGoE=;
  b=HnIb0WQWQtRq2CuEcd/xZ4BROgBOWJ1O5OKNHBDCQH2E/6bGD0HZKw0j
   r1IOs4dxZscc5zXczu/kTCW+sd8LfHKWl0omrOIvjozu12X1MnOiWgSlZ
   hn3Mq69bQyajs7NEJHZDjDFBPiGM8TjdcgYjXyqBuqFLtrgu0RlxRugZh
   ElK21luApX0ldSSwGsUn/TX472HvuPWCG9PqITGJDZQhPRHzxtTJ9xk7/
   FpmpSZ6Wn3qIf0PSBTtFHmlANuPSKNqKrAuuDQ7WJi9lzufOiGNQRe/FN
   5SvWqE2cUUbBV/Z/VliQJ+ys56U5glnG1uDprofYyujZmgmItyyKk0CW9
   A==;
X-CSE-ConnectionGUID: Mpf81twMQy6fYQMkqzpP7A==
X-CSE-MsgGUID: Jmq55pPYQzmVY+HUh0kdGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67254789"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="67254789"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 05:07:56 -0800
X-CSE-ConnectionGUID: miV2h1tqRZqeZIj7A9tdnA==
X-CSE-MsgGUID: CoUzeB0LTiOy67HlETcc6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="236943962"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 05:07:55 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXfdg-000000000bU-28yL;
	Mon, 22 Dec 2025 13:07:52 +0000
Date: Mon, 22 Dec 2025 21:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/40]
 kernel/delayacct.c:282:5: sparse: sparse: symbol 'delayacct_enabled' was not
 declared. Should it be static?
Message-ID: <202512222123.2CxchCmi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 35bb2c8c5fd3f623e062757cd943617efa29a172 [0/40] ANDROID: Add vendor_hooks to workaround CONFIG_TASK_DELAY_ACCT
config: x86_64-randconfig-121-20251212 (https://download.01.org/0day-ci/archive/20251222/202512222123.2CxchCmi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222123.2CxchCmi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222123.2CxchCmi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/delayacct.c:282:5: sparse: sparse: symbol 'delayacct_enabled' was not declared. Should it be static?

vim +/delayacct_enabled +282 kernel/delayacct.c

   281	
 > 282	int delayacct_enabled __read_mostly;	/* Delay accounting turned on/off */
   283	bool get_delayacct_enabled(void)
   284	{
   285		return delayacct_enabled;
   286	}
   287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FEF399372
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782132842; cv=none; b=SUAcSkT79QFmO5vQjwW8fglKcP3jMxG3jq7AAv5S8kIa1F1YcuJOw0GUYhr6j9zqHVRpX3PzpVS+R/VYYAxE2nTJjZsw2M2ExKLwWRuI+AY3NE0gf+miBpk2eyrWbfAjYfXrWgv90drrKQS6YyCFbRL0qhJl0XPuqUj4b1lMf1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782132842; c=relaxed/simple;
	bh=hAMdf8A1too1eF86Jv3KmQ/MmfiIzqS2sG/kWAFVaJQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W3hoGsOhXZ5Y7kXWQc8JfLFwUNYFHNT0EBek99rEwnK3wUMAJhGLZbYm3iQsxkiYMf+gN11eJWkKGTFnsGYc26+/U7XSvQ+jWHyc/GBTqK6NwaPr47LY0/TXOfCrTlZiJzeQ4quLlrLNwyvxUAwEwOSKroojQdr3loKTf/Mo+mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehG1Y1aD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehG1Y1aD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782132840; x=1813668840;
  h=date:from:to:cc:subject:message-id;
  bh=hAMdf8A1too1eF86Jv3KmQ/MmfiIzqS2sG/kWAFVaJQ=;
  b=ehG1Y1aD0UzYfWgRq2An4b71Axs/gGs9WU5rNfoZsopYU7mWLEfVIzUB
   ZPwUVfgkAx0W39DOqLD4an4jsG4Q8zjAKsq1VCZaROP6RP8Pi1+dABYD0
   xbPWIt0DUGBpJlFcJhS/+D5dQperXX4y1U/DhF2jcJC3lf3CmkJEVMfNc
   D5l+8ecu5KaKKiGgti4ec1/NC10GCdzZuzgd/65PvA3KMs1sr+S4/oshb
   jtJ/k9HQbUtyakSz3Dj7KvbwwkjbN9R/oysAYrfGzdzL5BKjButV+PIfl
   2BdlGElJJdDLrcX1d/M00dRXQsTEarR2YpYErQi8xacVSH8LgHpuMrXw5
   w==;
X-CSE-ConnectionGUID: H4SGXyolTneOFy+h68+Xzg==
X-CSE-MsgGUID: WbTJoQGPSXqazQ67YMtNcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86769985"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="86769985"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 05:53:59 -0700
X-CSE-ConnectionGUID: mYkvOkHbTpyjPl6GUvcjrA==
X-CSE-MsgGUID: vdpczLsRTBe66flOjpf47A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="279399367"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Jun 2026 05:53:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbe9z-000000001BB-2Pnc;
	Mon, 22 Jun 2026 12:53:55 +0000
Date: Mon, 22 Jun 2026 20:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v2 2/17] undefined reference to
 `init_net'
Message-ID: <202606222053.2zU7AgWv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v2
head:   e2bc6e23c907dceafa9ce30beca26cdc05bb664d
commit: ef10e19014b14b7ac73434044abbe473fa34b2df [2/17] fs/configfs: dynamically allocate super_info
config: sh-randconfig-002-20260622 (https://download.01.org/0day-ci/archive/20260622/202606222053.2zU7AgWv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222053.2zU7AgWv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222053.2zU7AgWv-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/configfs/mount.o: in function `configfs_get_super_info':
>> (.text+0x2b8): undefined reference to `init_net'
   sh4-linux-ld: fs/configfs/mount.o: in function `configfs_put_super_info':
   (.text+0x7a0): undefined reference to `init_net'
   sh4-linux-ld: fs/configfs/mount.o: in function `configfs_fill_super':
   mount.c:(.text+0x984): undefined reference to `init_net'
   sh4-linux-ld: fs/configfs/mount.o: in function `configfs_init':
   mount.c:(.init.text+0xe4): undefined reference to `init_net'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

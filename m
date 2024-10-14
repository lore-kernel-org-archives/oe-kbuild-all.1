Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9D21D0490
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 20:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728937626; cv=none; b=SsYRjUxLbBn9On1X2CoXnYI+ZVyLEvKVm0sG4TeZnzlh9kDhT3YdXUSiHKurbhEA1b7ANo44gtAw6zzNpAlmlieYXNR7u+xKDcqSTQ0l+9CZhLCtlUNOmL6e+eJGX5h/ZtrKJVhE52S4ZDU6X4N8lNmZVaOxDO3hF//Xsyc53Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728937626; c=relaxed/simple;
	bh=8QX9ko1FEboREqDCWwWVzwjymnpZISs4HLWJTkl6awg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UxZBqBj4DP5E2wKuRkAdaaUns7snadJKGE7Lw6QRK9LFoI6tqYXLdTlgsXNGoD49DfrMcsTfyP9tnRE0KNlMxGnuaoprM//BOZAdHfeiPc8ZFq7zazXzl7cGRDZTUhwQBtRM1r5GziWNOIip0bt7NA7OhI+Nti7SIo4v8F3YwhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEyQuRpf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEyQuRpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728937624; x=1760473624;
  h=date:from:cc:subject:message-id:mime-version;
  bh=8QX9ko1FEboREqDCWwWVzwjymnpZISs4HLWJTkl6awg=;
  b=kEyQuRpfQLFTbR9kEurIUpmPe28SqVJv1xVIalNPFlsxNNJ7lRj7nB4t
   9fLCNJ172kzvop4YdrAEmebWQiSDCS2lD8obnVlr2lP4cStcpk0cV/hwB
   MI00LDYVoe35f+VeAS+HSRyu2a3QqqMAbeKgSKTwVf5nA0+oBUfvuviYh
   +8wGeIXDwoiNYM0v7ZU928nkmJzDkluy1zfbPF1vkkkk6o0MoKacbPDYO
   Bb6mHO81GTLP8wyZis3qR/FGz+2WmHXefsOQmKW6BPTInlv7gpVuRw9RU
   7zh0wcUzpCu4twUQdg7M9L4S9HkWW2DY0hPKxlWKY0whDC3Tx3YYUwY6N
   g==;
X-CSE-ConnectionGUID: cTMrNuI7Ta6NcPe6/4kNcQ==
X-CSE-MsgGUID: Gt8G1pOeQ/2YZhSlf6q93w==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28431874"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="28431874"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 13:27:03 -0700
X-CSE-ConnectionGUID: 2Xj/FtKzS2ScwEcWVmcmGw==
X-CSE-MsgGUID: iDSNL5sRS4GHeYHHLc/zKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="78025350"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Oct 2024 13:27:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Red-000H5D-2e;
	Mon, 14 Oct 2024 20:26:59 +0000
Date: Tue, 15 Oct 2024 04:26:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 105/339] gb-beagleplay.c:undefined
 reference to `crc_ccitt'
Message-ID: <202410150430.SJtf9mP5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   ad218d11c51c32aae960e301cef32f8290ffe300
commit: 480b17f5bc43c5339f544530923b096dcb590ffc [105/339] greybus: Add BeaglePlay Linux Driver
config: i386-buildonly-randconfig-001-20241015 (https://download.01.org/0day-ci/archive/20241015/202410150430.SJtf9mP5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150430.SJtf9mP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150430.SJtf9mP5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/greybus/gb-beagleplay.o: in function `hdlc_tx_frames':
>> gb-beagleplay.c:(.text+0x171): undefined reference to `crc_ccitt'
>> ld: gb-beagleplay.c:(.text+0x1ad): undefined reference to `crc_ccitt'
   ld: gb-beagleplay.c:(.text+0x22d): undefined reference to `crc_ccitt'
   ld: drivers/greybus/gb-beagleplay.o: in function `gb_tty_receive':
   gb-beagleplay.c:(.text+0x4b0): undefined reference to `crc_ccitt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

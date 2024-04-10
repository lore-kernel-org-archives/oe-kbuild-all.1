Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E17413D504
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712739413; cv=none; b=Lx4QLLGKJzzs0zmHWN1o56zcOXXCqHUfzPOqel7ozMo3ePBaHvvOfTemlXcQdEtGNIosN2juRGMmmDeWLbULHRr5kRtWCcdvFIbDb1cyPKBBlvsKF47JVbTpWbPUdj3XirpNp2oPUEG/bA34w+KlERsuVkmDMXLeyzJp7eiY51A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712739413; c=relaxed/simple;
	bh=hmi4+iQzoDodmqNP9v9CsOxlk+3Dx59nWg3vDKooPIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmb5oV7ZbUvuBxXtdgGOGfIVYbK5XZveM2vKaLMRoG/WaIRP0YF2iQfChRl9+W5ty+0gkK4B8AxjViL5FuFcVvn4BeilCrbsDod/RvA1UCo/MPOdAUZhjVD2S8kQfA1NmKen85OK8XRkSaU747okCyvBw6d702USEhgqSxPo+LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b60fsbIb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b60fsbIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712739411; x=1744275411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hmi4+iQzoDodmqNP9v9CsOxlk+3Dx59nWg3vDKooPIQ=;
  b=b60fsbIbmU0qBPgKi6oHwwEEAYeNWtQaFytyFiHiQXdIQkbL4GtZj7fn
   31hGkdGdKD7n7AXasYi9Sa2QzLzGA48yvD2sGETSaoTZbEJfEZz5VU0KC
   Nt2bH4eDuv6FjiLyjSBBXv/Yc6Lbax0/kSIpM+CF2cEAYdWhxV8vvxKgu
   v+1UiX/nOewY0nZDHirCY2m/JK6VMo6nWLXZAp4OBDeuEDo3DqT77WwVZ
   Z9JexCd5dnvG3qLike7P9rl42fcRfbPoEEb2kw+3VyjYbfP6ke/LfbTRs
   AYpHlXF5R+ZKS6BYnVuUcoro/IlA0t2cvuvX5R3zlmra15FcKksk5dc5J
   Q==;
X-CSE-ConnectionGUID: OZttEMZfRDSkS9bxojkg0g==
X-CSE-MsgGUID: saj0KtCcRwyUggpG+nCghw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18802611"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="18802611"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 01:56:50 -0700
X-CSE-ConnectionGUID: +w1MJSVMRk6kpmB1gFB/Pw==
X-CSE-MsgGUID: H1254WTmQwuHZ6qQuTIYnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20386821"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Apr 2024 01:56:50 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruTl9-00078h-0i;
	Wed, 10 Apr 2024 08:56:47 +0000
Date: Wed, 10 Apr 2024 16:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:kprobes/without-modules 3/4] kprobes.c:undefined reference to
 `kprobes_alloc_insn_page'
Message-ID: <202404101621.AB9oXt7o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git kprobes/without-modules
head:   131f0030b1dcd8462b12334cb9ee9194030cb026
commit: bafa7735a361034d132ff057f5795edd5909a2b4 [3/4] kprobes/treewide: Explicitly override alloc/free functions
config: riscv-randconfig-r122-20240409 (https://download.01.org/0day-ci/archive/20240410/202404101621.AB9oXt7o-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240410/202404101621.AB9oXt7o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101621.AB9oXt7o-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/kprobes.o: in function `.LANCHOR0':
>> kprobes.c:(.data+0x378): undefined reference to `kprobes_alloc_insn_page'
>> riscv64-linux-ld: kprobes.c:(.data+0x380): undefined reference to `kprobes_free_insn_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

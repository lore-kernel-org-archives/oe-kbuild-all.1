Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94929E565
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 03:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708744628; cv=none; b=R1X8bNvgyLQG6EUOqXqAVrzHptk1mWqXgMRhOK6Uk+zoeQQXSEjJWDJt3RrGD1Nc2mV/aGhlEBbgd2WQIztKF41EXhOGICZnWEQHZF0FvMTuCzs7fdoil72BvRBqmlwBf+sHajgb+pl36CtJKofIgWJ+aP1LsQ42V2fzhxL/cMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708744628; c=relaxed/simple;
	bh=Fbjq3ViUER/RVnP9W4CBLWr7f+NIPCkE8z9JaDZyx1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YZyTNfFRRtk7m65eoCgNQn22En1LH9SRp2Jpn6U6fQbVyOLhLrdNZ0XKDthf8GWu1E8baKjT0DziR39/IbVPqg68pvqekC9DBbTpAvyqz/I+m7ErHp9DAlFVU4Y/tsn5lxLDkGgyywOXhxeoYjuMJjbAFVofaK9AAIKJsDxN+XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXppp3oY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXppp3oY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708744626; x=1740280626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fbjq3ViUER/RVnP9W4CBLWr7f+NIPCkE8z9JaDZyx1g=;
  b=NXppp3oYnJVT7BI4pAqP+G28TNs2k+fExQYYU8rnOsA495erVAMJM6Y3
   LZBu9O8PK4W031ro9Qig4VR4AiAxMOY/6ZPkXz8fVu43xM9EQqcxH8ZfV
   FkfPwriNugWOdSXHx+ai8bICqfnpPN7kbGdPUkAGX55pkd/qi6Hbo39sZ
   C2/2Qcp7TtMnSHcQAecVKM5LU5tUdA+VDJ7EhcoOZsEi466F8GNoYyrbq
   CgmmMiay291viyv7A/oy8fnfLkHJ/yyvYMHgd+gTRSiL+IXlIiaRxRCFX
   tV8zt006lJM9/e9ESoDJRFzJQO9R5EOd3A3RkoA95KDqkBuM1eN63sxwo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2967124"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="2967124"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 19:17:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6082710"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Feb 2024 19:17:03 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdiWe-00089I-2r;
	Sat, 24 Feb 2024 03:16:39 +0000
Date: Sat, 24 Feb 2024 11:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/arm32-cfi 2/8] fgraph.c:undefined reference to
 `ftrace_stub_graph'
Message-ID: <202402241153.HaOP1DxS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm32-cfi
head:   2b0074bb71d631d2a003e080f7b8c216b2ce63d4
commit: 5f298a28b8a7318dbb8989c40130651767123882 [2/8] ARM: Support CLANG CFI
config: arm-randconfig-001-20240224 (https://download.01.org/0day-ci/archive/20240224/202402241153.HaOP1DxS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241153.HaOP1DxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241153.HaOP1DxS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/trace/fgraph.o: in function `unregister_ftrace_graph':
>> fgraph.c:(.text+0x214c): undefined reference to `ftrace_stub_graph'
>> arm-linux-gnueabi-ld: kernel/trace/fgraph.o:(.data+0xc0): undefined reference to `ftrace_stub_graph'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

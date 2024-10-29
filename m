Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36D32022F8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 06:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730184469; cv=none; b=Eh/tYAmhRH+DPhF4N3QK6qW31prmi75wrv/Tx04594RvhmbVEZyNMVHncZTf84f4U0A3L5FLRJ3WQRs8/cFtXpugJv3W2X/9E9kAIP9BVYO4XlgC0vtG3+6JRNTcYVee3oOCKcnr5d4XoCazyZXTCo2BLUjMOKV/qNWoxdB/Cqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730184469; c=relaxed/simple;
	bh=gyiPS9P5IoGrTlHj3khyjY7M2A7gHU8bQ4FHUq/BI40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c9dlYpr+ZGZ6Gn2DlKlVfF5HNqUdE/L1SGy/HdlKAxXegCRZoJhsoQyhTrM6EivAlhOqta2i4hVyt8GJICBAQgijzZGwmV/Jw16XQ4BqpB3X8PMvMjMgah01447svoEsGMUWZGcmkfiWcc1gkht9vdhJST+AmixnoPwrCawIwiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z76DrNmr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z76DrNmr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730184467; x=1761720467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gyiPS9P5IoGrTlHj3khyjY7M2A7gHU8bQ4FHUq/BI40=;
  b=Z76DrNmrEDfLlALK5OVVvU4Bq72fY7vFiTY+JY370Wj1mV3QIsuDYD2C
   G05DiM+sb5rsZNmB7yakanzNFat8j2uUa0Kn5Ok2/sZd7JUctjf2WTl6w
   eS9pzBXQbB+mxUilakcbJFUaFh/PcmVwvx/mz31hQIUJtlhbP76d08suM
   cOOtLDK06ZcXVij3gNR8v5rZFGD3GF6LoHMlP0M8PlshGOb5/N+6wzP6Z
   3EUtWAl0r5jquDkqUJJ9u1qhXOQpEH/BWDAgK4mlfH1kdBFWSt7U1rb05
   mOFplwlkOerlBpoHQ6NOUOMXzaY8I5/aE7gmWnAia3jb+iji2US2VAQqC
   Q==;
X-CSE-ConnectionGUID: 4bJJxiKTR72AP7jjeSYb5w==
X-CSE-MsgGUID: 4z+D5LnERwekMRNz0QVorw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="33604265"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="33604265"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 23:47:47 -0700
X-CSE-ConnectionGUID: NYxoxDt7Q3aCzbJyaWcSFg==
X-CSE-MsgGUID: 80DvXx4AQqS9dwX5cJSkrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="86422493"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2024 23:47:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5g10-000dLE-32;
	Tue, 29 Oct 2024 06:47:42 +0000
Date: Tue, 29 Oct 2024 14:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Lockwood <lockwood@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>,
	Amit Pundir <amit.pundir@linaro.org>,
	Alistair Strachan <astrachan@google.com>
Subject: ERROR: "create_function_device"
 [drivers/usb/gadget/function/usb_f_audio_source.ko] undefined!
Message-ID: <202410291418.dG1zAW8a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: 1983276ceb62da2dda057c83fe676916b51fe939 ANDROID: usb: gadget: f_audio_source: New gadget driver for audio output
date:   5 years ago
config: x86_64-randconfig-016-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291418.dG1zAW8a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291418.dG1zAW8a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291418.dG1zAW8a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "create_function_device" [drivers/usb/gadget/function/usb_f_audio_source.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

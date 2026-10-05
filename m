Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE6F37F322
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190157; cv=none; b=q8CzbRWARBOHT9KxxBsgZRq7/pBrrZzF1byg/0ZUa8sHYLSrwTaJlLxbLUdFQC7H+spYnymtUsESrJQMjRmt9drwk85k34zzGdIQnzevVVwzz0z5sGTqLC1UFf5Dz8v9+wWeQoKavXvKewibiX166MNDvu4BC2gnPXmPkWbQUDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190157; c=relaxed/simple;
	bh=14ZNAFrYXFvBGKuOg4YxGjK6tdGUypN28ITRgrUnzjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NP0Jvz3L6RZJarY006E8V8REd9ZPkZ2u9+GpOCjh9ijSH3WmExrppPklrcpb3fQ78AM/KpfcbrCPqVLH2YOknaVN+VPXCVpK3nCEO1lB5g1nAokgdW44xOn3IWJV/gf4iRcgra3mJdTCqUFet2ddL2V4z6OV8OkaK16QvG8ZsEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRdYuYl4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRdYuYl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791190155; x=1822726155;
  h=date:from:to:cc:subject:message-id;
  bh=14ZNAFrYXFvBGKuOg4YxGjK6tdGUypN28ITRgrUnzjI=;
  b=bRdYuYl4z9iUy/zJ7DO6Z3h9h3iVo4v59c+9469JErGSEYvxBmZqv5pc
   V9jrl42pW+bF2Smp/7zP2UkkjkeCN2FtJo7E8ewvaJkoLcVmq5eNRrekT
   braE/83Yt7+2LDeaL6WbkJh1IoYiYkExfgiOAg5KmnCxJHXI5y6OshYyf
   9GOKUiTfpzqCwKU5AKCUwSt/ZB8waofyf32Rxv6qq1M8Hdft3mbF2adPp
   MrBnMrvhblMc/CZdAVXSrzrI7KhfT8oEr6uERMIUkCcbxxN1m29yLnfKc
   CLDWn9EmzgXRlOH0UADODZvBiS0nh4hZ0kY3cpI2T1vZPJB1Kf+Xsgc3R
   Q==;
X-CSE-ConnectionGUID: Sk2Ljas8QSWbbSZBXxa0Ug==
X-CSE-MsgGUID: kM3JttfdTTK1Cab4Z4CMgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91717391"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="91717391"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 01:49:15 -0700
X-CSE-ConnectionGUID: v31aJFWbQaiS44jAfb6Emg==
X-CSE-MsgGUID: 5NL8xF7DTcefth0a0O2n+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="280508210"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Oct 2026 01:49:14 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDeNj-00000000059-2M3K;
	Mon, 05 Oct 2026 08:49:11 +0000
Date: Mon, 05 Oct 2026 16:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:hardpps-filter-soak 22/23] Warning:
 kernel/time/ntp.c:105 struct member 'pps_fit_lasty' not described in
 'ntp_data'
Message-ID: <202610051643.1EXvhzVH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux hardpps-filter-soak
head:   eef47b09d53ef553d3089bce6c9a0f6a9c792f29
commit: 0405fe0203b5f47f1ef90024f4b68d0caa92650d [22/23] [WIP] one-sided latency gate before fit accumulation
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20261005/202610051643.1EXvhzVH-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051643.1EXvhzVH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051643.1EXvhzVH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/time/ntp.c:105 struct member 'pps_rawring' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_rawring_n' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_n' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sx' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sy' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sxy' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sxx' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:105 struct member 'pps_fit_lasty' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:600 function parameter 'ntpdata' not described in 'ntp_update_skew_delta'
   Warning: kernel/time/ntp.c:600 function parameter 'settle' not described in 'ntp_update_skew_delta'
   Warning: kernel/time/ntp.c:600 expecting prototype for ntp_set_time_offset(). Prototype was for ntp_update_skew_delta() instead
   Warning: kernel/time/ntp.c:105 struct member 'pps_rawring' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_rawring_n' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_n' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sx' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sy' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sxy' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sxx' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:105 struct member 'pps_fit_lasty' not described in 'ntp_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

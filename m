Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A297D33032B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 06:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791180906; cv=none; b=VZMic5h10MwKLdmCT20G0uvEto8kDB6fBh6LW2mMu1oFhDqLrnv1msFo6BQS2B7kYgKE251oY5//vrdNwtd3HrxaX9Owvtd4wPtEj90x0AjReqMgu52PdKPrV5THE37K+IjSSPEv7x+gUvtdkrDxwj8i3UtSL3EL6bJ9u8GBFWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791180906; c=relaxed/simple;
	bh=dCvmFAyq/yeVIy9ruPErOj6Z/4dFU7UqqgJwFhZzeVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U0QcIQ3eg/Mq/Lkv/KldBGSghxFkZm75R1jqiJ0sfcyZdslXN905s/69WdXX4pZdZS9eERw+L+xqgYhWBHlpiM/jcmoHgoiY41FHqiqryDvTMdEgllihqnrp+jyIZDvvhJ2QtpSVW4Se8GO7XI2F+lAPeC04g7B8r1cms88BvN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHtoy5Bu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHtoy5Bu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791180905; x=1822716905;
  h=date:from:to:cc:subject:message-id;
  bh=dCvmFAyq/yeVIy9ruPErOj6Z/4dFU7UqqgJwFhZzeVM=;
  b=MHtoy5Bu/9cCvNjza1Y/cn0dE60+agIJvmoLPts1p0H/zTnjq7KSV5yE
   89S0Y0KzwCc6oK+Iaidsxrv7AHWdQRo7UQBCw3PMgbORE4SbtUMqKRvJs
   AY49j2SGov6llAaIdp9QwpncxcIQtQbCsGwRcdrn0imJVwJxT9KUKJ+9q
   ZTF8OVW9eBDMHyeoYcpQ9fRJMuaACKc5heWGK+VNEwk/+cto2dX3qchXt
   i5k/UduFVnQVzIBM070XTS67uhtT1ey910vLzefKjanKge1bt8Fa6JF6Z
   LFL+G8KINUv/E+g6hrkumg59wIAfELwypDyjV2z/R/fCtgXdQUzjtY6kP
   g==;
X-CSE-ConnectionGUID: Xn1bp1wCTHy1BZZQG0KFmw==
X-CSE-MsgGUID: 30OnSwlYTBWRGaK90ko+QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="102360810"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="102360810"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 23:15:05 -0700
X-CSE-ConnectionGUID: OSqmc8RVTlGCGotVIUArjA==
X-CSE-MsgGUID: oTJ7ynSQQgaweWmL/tPlnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="273134594"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Oct 2026 23:15:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDbyW-00000000VPJ-2n5S;
	Mon, 05 Oct 2026 06:15:00 +0000
Date: Mon, 05 Oct 2026 14:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:hardpps-filter-soak 17/23] Warning:
 kernel/time/ntp.c:104 struct member 'pps_fit_n' not described in 'ntp_data'
Message-ID: <202610051442.7MBGW99d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux hardpps-filter-soak
head:   eef47b09d53ef553d3089bce6c9a0f6a9c792f29
commit: 12338298af43a937b964812eedbec093e236249d [17/23] ntp: Estimate PPS frequency by least-squares fit over the interval
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20261005/202610051442.7MBGW99d-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051442.7MBGW99d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051442.7MBGW99d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/time/ntp.c:104 struct member 'pps_rawring' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:104 struct member 'pps_rawring_n' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:104 struct member 'pps_fit_n' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:104 struct member 'pps_fit_sx' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:104 struct member 'pps_fit_sy' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:104 struct member 'pps_fit_sxy' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:104 struct member 'pps_fit_sxx' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:599 function parameter 'ntpdata' not described in 'ntp_update_skew_delta'
   Warning: kernel/time/ntp.c:599 function parameter 'settle' not described in 'ntp_update_skew_delta'
   Warning: kernel/time/ntp.c:599 expecting prototype for ntp_set_time_offset(). Prototype was for ntp_update_skew_delta() instead
   Warning: kernel/time/ntp.c:104 struct member 'pps_rawring' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:104 struct member 'pps_rawring_n' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:104 struct member 'pps_fit_n' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:104 struct member 'pps_fit_sx' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:104 struct member 'pps_fit_sy' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:104 struct member 'pps_fit_sxy' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:104 struct member 'pps_fit_sxx' not described in 'ntp_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

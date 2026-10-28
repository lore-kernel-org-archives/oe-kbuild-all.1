Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793226918;
	b=F87zOVKp57sACUPzNLgXaMsLm5Ecc7Uo9B9S76oHOQi/wd5Jc9Zb40rCAK80nWLuwpxV
	 CJPj0zY8hwFsxf6Mz4mDjIzYPCw1JdKBR3zN+vN7jMmyjGNfOz9jrtZdibOND7YpY3P00
	 +6Les6dqm+KcmyiJUZOEq7W+P2Cx4/GEG794/jC7d8EVXLNM1LA705qClE7JETkSfxeZk
	 QgDsNYp6Tn2bT+uzfFwDO94oECPEQcga4kmhZb+cdCSGrTZ210sRRMtn4KTquN5UMnLYj
	 kf3GOnfxbMD/8z9x/jeFfdUdY5ImH06CCxXuS5KxT9h1zjtfI1lXVM7yJahpYV3efzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793226918;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=IdF1dG4my6znEQS7ev2WNtPqGYVu7TEuZk/TknwGl4A=;
	b=wmpeOqInZ8k/oIMg0Q+AaUZgnbOvlFNMRuzNndTZdFWqIHBsgfsBaHWoNYHtgQEtn8Xg
	 VzJtCANLVWpt789a7wXkfCJ6NaJNf4/9/62zDg2cBAV0pqBMAM9xn7PenP/8oRZVDIaM9
	 vnIt40lrQ5oJ6Q654p2Kth61fc56xDehV+mS2kzjPes/Xf8/pWZRxedasZJnZ7ELvncBT
	 VmWJH9ajxwArAUoFKahaj2jYbLZaQEgUIyCycrYFV04K7bI0TaSFvdPbGBC+RvGjWVVNr
	 iwGeixiz9Ts9e9jn5ihZhbVKoOtFTc8JCuvso692ZJjpTQgYd3e1OLMSGsBiVwQFVBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lMTS2NMz;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CAE606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 22:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17CAE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lMTS2NMz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793226919; x=1824762919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nF79sxqSSH2BNarKL8WxJwYcTMufHG0nVN/l31D41C8=;
  b=lMTS2NMzHCbJvDl90YUU18dGl8jbiVil7Gfm7BoleA1prCT1w/nyY+LV
   /J6PDJ2F47qCbvw2dCyWR+HjARWSn8HcTZEair75DQGadyJIv9NRL3sFZ
   +KixS4T6Q9+LLVedmA3owQzPmMZpt2IEmBmn1zCYvN0CfyCTBKskadoti
   Klb74DmAO7oyIzrdHb9qBRieMZjDVVIFOqAUv+3E+i4pPOAWvhnCrVALY
   B3PMB/iwTIETjli44DiHHiMkM20p9ng+mcqyDlKQ/2WwWR7aKXCJiq9/t
   pZavI7DnBslWjCivOi+vRwwWwqgAq5C3MLT1CO9qY0fYgNdbVGEAtR9fG
   g==;
X-CSE-ConnectionGUID: oHExeVqHTfGsYn0cTXlI/w==
X-CSE-MsgGUID: ADhv1SDgRZyEIVD7rBl2qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1988238"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1988238"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 15:35:18 -0700
X-CSE-ConnectionGUID: S8VWlZw/SiOiKGj3mm12SQ==
X-CSE-MsgGUID: qDSYzWzATn+NZCM974W/NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5074307"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2026 15:35:17 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMCEk-00000000ZJE-1qrH;
	Wed, 28 Oct 2026 22:35:14 +0000
Date: Thu, 29 Oct 2026 06:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Message-ID: <202610290603.jyaKuy04-lkp@intel.com>
References: <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>

Hi Andrea,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linux-review/Andrea-della-Porta/dt-bindings-pwm-Add-Raspberry-Pi-RP1-PWM-controller/20260929-150211]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/pwm-rp1-Export-helper-to-read-fan-tachometer-RPM/20261023-121554
base:   https://github.com/intel-lab-lkp/linux Andrea-della-Porta/dt-bindings-pwm-Add-Raspberry-Pi-RP1-PWM-controller/20260929-150211
patch link:    https://lore.kernel.org/r/0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta%40suse.com
patch subject: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan tachometer
config: xtensa-randconfig-1001-20261028 (https://download.01.org/0day-ci/archive/20261029/202610290603.jyaKuy04-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290603.jyaKuy04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290603.jyaKuy04-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/hwmon/rp1-hwmon.o: in function `rp1_fan_put_device':
>> rp1-hwmon.c:(.text+0x40): undefined reference to `rp1_pwm_read_tachometer'
   xtensa-linux-ld: drivers/hwmon/rp1-hwmon.o: in function `rp1_fan_read':
   rp1-hwmon.c:(.text+0x52): undefined reference to `rp1_pwm_read_tachometer'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932795;
	b=RoFQPs21gRHqXGadWmDBdux4FYXTglTQJ4WCMXyH428DaBhsTy1IuXjByFJeq201Tqyi
	 UfJuWQR1BftMQ8ZOsat9spAUJ6DnI3k8lK9y0MuVEFjY7lR/EOkexmNqyqW+I38oztC5g
	 U7yDe3kQZqqWjqq8naCDpYiHVRSMahPoR3UFoWAia7/EIyjbFkaS5Ckz9zfp7A/LLUUAi
	 CwuxqPPT2A3yZYB2w2uOsHKm8fjlciZwGmjulDYuDNRZeTY1QZbxDTgB0DrPWsLz7/S0t
	 MYicUQ460JaVqieP/lUmrddSUqGJf/0xhngK3uDo6QFXJUVMibBEd9p2xAlrQp0caCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932795;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IS6QiQqo/2SUfU5FZmsyljTGYPRjkV86GuMHkH4cGNE=;
	b=uHzjCgELJdbbDxYOMSi0c99SQI+DdhJyBsrH0/3blY+RNxPBQyUGg5FGIpYxuxyrKCQ6
	 XSSN8Jdc2lUekbeurBpH9Wmw+MJAOrMi+nkZuDBZs/4/9wiBq7FtQz0TUJNsMzMmrIWC6
	 uyEI2MS+WeUi4XJ2NcefnfN4+RHyekKdn5WZsl0rcAtA61WFVwakwY4I3pNLBcB8uT8NR
	 BuDDPVvwE9N2Q5m4epAUse2V8SMI215PYoy0O5ulGdauWtGfEUQZ1EDDqTZmJAvr1ShCA
	 7QUEjpSYcNE65UAgwJSUdrowCX8rRUKYO1okYeC3iLmq9GEYCaVnYgF7iP3sZ/AzYXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bOvxeBT6;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1EA606A31B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 02:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B1EA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bOvxeBT6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793932794; x=1825468794;
  h=date:from:to:cc:subject:message-id;
  bh=ZZDjrRJeKbbalpaTFU3o+KYq+utIPHVjuoKXUtYpuE0=;
  b=bOvxeBT6f9UCZhbVQrxV/Jkm3p038u4iBxLJFR9j9Qo8ce/tkDpv6HWu
   UHa92EKZIoq95Cbgrl6xNfCd7z8DOGNopYKofvUrLunW7nFV5k59ODB8z
   RkmKm9w9M0XLi4POVsCGxFaMQKai6WK4aOwTwbSn2nDDz1xRe2yD7mZVt
   rH+nSd3OUxgiPhyqnhOaJB6tzuLjzNQXlrBt4VunquGCdXoAK4jiaCKTY
   g26IrMqCbIcWqd+kLp2gnxiTvFcRaPMfDfa5DeV2e/zKV7143AG4SlNst
   oSxGK80kwn8JM3RqBuvJPUW+CnPYssIdPxu2oCbOo3RMXSacAhg0mqOXu
   w==;
X-CSE-ConnectionGUID: Y0SeOl3vS3+yZQJkVZuDlw==
X-CSE-MsgGUID: mE8OctfWQTWNEm9AN6/MLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2642937"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2642937"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 18:39:53 -0800
X-CSE-ConnectionGUID: LrWK043DRiuhqJ7JSS6QYQ==
X-CSE-MsgGUID: Kn1QFYcYQdGEIkFG4Dn9aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7293758"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Nov 2026 18:39:51 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP9rn-00000000nCr-1sp0;
	Fri, 06 Nov 2026 02:39:47 +0000
Date: Fri, 06 Nov 2026 10:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superna9999:topic/sm8x50/iio-max34417-adc-perr-verr 11/11]
 Warning: drivers/iio/adc/max34417.c:145 struct member 'update_delay' not
 described in 'max34417_data'
Message-ID: <202611061020.5XkX79a0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/superna9999/linux topic/sm8x50/iio-max34417-adc-perr-verr
head:   560309472395672529dd22034adcd3eabc0559ea
commit: 560309472395672529dd22034adcd3eabc0559ea [11/11] Fixes
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261106/202611061020.5XkX79a0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061020.5XkX79a0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061020.5XkX79a0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/iio/adc/max34417.c:145 struct member 'update_delay' not described in 'max34417_data'
>> Warning: drivers/iio/adc/max34417.c:145 struct member 'slow_mode' not described in 'max34417_data'
>> Warning: drivers/iio/adc/max34417.c:145 struct member 'update_delay' not described in 'max34417_data'
>> Warning: drivers/iio/adc/max34417.c:145 struct member 'slow_mode' not described in 'max34417_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

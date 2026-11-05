Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911487;
	b=aBCGM6cUMi/oCILvE5rqc2POE9D/OSxnWr0pqDPVX+YXM3CnPGqXSCk/rFjp7Ug0avEL
	 QcJD/XEH3zU9kik69QtyjKfHPtgLXRKhdjEUba5FlohxNb6JpLZXMz+aCVqvEdL0noYjd
	 zijbX/0fZ1f1oDHhlBTuJ4pELyIHPkDKrrlsLeXLfa0Welf72lFZukC4P2snE6nlvNbyX
	 6fyJLzj6XRF3W2Ki5+YAliMCBv7ZdptCGoPh4GHKv1sPXA06GRZG/r4UYQhjCU4Hm1ZSn
	 itg4gtsVv+igvZw3Hybj6mX60GwahCW83VDT8RbkiAgFYeYvI4reI5ONsHaBQ+k4esw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911487;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=51gcZXFMAaoCLwTONmvsR0PYl369TaKI6wyMUUSnVr4=;
	b=eLODW9LUOjZuuen8UdsHaFYPJZ5rA/hpCmDxgpWsnjkw5ARLwy3PHfzcQU1zeeWpWA8b
	 ULBbMIg2vJdRV+OyrkA0eEcA9Nfu7hBqQoYkZRYfS+g4/zqFgYj/cUxsJS+tbvhEXOBNg
	 AOYe8yPRaMNjmh00UXgAthe1MjsTmReuFzLT9BDrdm7Gt2B7KJ19Q1f3/e+0cHKNZ5Sy/
	 vSNPVhAZaJxUJRyaMn3oEyxjUEQ80PqkuqufO1U02LF9oCyYcNDFpk5/3LYriAF1rslUn
	 3PE/TgOhrVVOXhsATvyl6CG/O6g59w2H0OG5rtUsitDs1I2TZgWvJRtHmRr4uaQCdSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lLUsxzuI;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8864606D801
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 20:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8864606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lLUsxzuI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793911485; x=1825447485;
  h=date:from:to:cc:subject:message-id;
  bh=GbnaRYRHGaI7rUUzAZNiAYcFUnP7iZrY8QgaENjKIec=;
  b=lLUsxzuI1Z7htgB8mGRZp5nCSG/Z+WujVMOMGr9IcO0ptU0wU4HtgUe2
   ODWAwbJWJFo/Awo++SGs7yRlnVvAqsRwfcRXlu+s4T1STQzpq2UgG1wtZ
   B0FSutmrL0lcuED+JwGLrZlZ+o4lNXP5DS+xcLSkTRdX/kzBtxE9W3hcS
   xrA1OTpOre9q5OWoxabPbcY2xqHbdr7oHcdCoYEDb/JvB7SSHRgkLP4uo
   osdcIoGGBIqE8Dp8rxyp4QVWQG1th+p3c+1kcDvrsXT3DvT8h9kGAi8IK
   txoFvhyW4rL9YaF/jdkHUqs7tGwRn8w5FkB72K5erxpaLqA/TEvvmOHOv
   Q==;
X-CSE-ConnectionGUID: wGrjJkiOQv+fkRH8uA5mXg==
X-CSE-MsgGUID: yDkwxLhvSWK9wgBKkmJpmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2621451"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2621451"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 12:44:44 -0800
X-CSE-ConnectionGUID: lbILDLRGSwOCkIpHl/uVCQ==
X-CSE-MsgGUID: nXtFDWXKSP6FpzGUsEoXEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6940370"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 05 Nov 2026 12:44:43 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP4K9-000000009nX-0CQy;
	Thu, 05 Nov 2026 20:44:41 +0000
Date: Thu, 05 Nov 2026 21:44:13 +0100
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superna9999:topic/sm8x50/iio-max34417-adc-perr-verr 11/11]
 Warning: drivers/iio/adc/max34417.c:145 struct member 'update_delay' not
 described in 'max34417_data'
Message-ID: <202611052101.A346Hz0Q-lkp@intel.com>
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
config: m68k-randconfig-r2105-20261105 (https://download.01.org/0day-ci/archive/20261105/202611052101.A346Hz0Q-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052101.A346Hz0Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052101.A346Hz0Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/iio/adc/max34417.c:145 struct member 'update_delay' not described in 'max34417_data'
>> Warning: drivers/iio/adc/max34417.c:145 struct member 'slow_mode' not described in 'max34417_data'
>> Warning: drivers/iio/adc/max34417.c:145 struct member 'update_delay' not described in 'max34417_data'
>> Warning: drivers/iio/adc/max34417.c:145 struct member 'slow_mode' not described in 'max34417_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

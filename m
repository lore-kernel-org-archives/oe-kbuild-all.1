Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C5C3932D8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 07:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780127789; cv=none; b=SvnsYda8h7SEFoCIbYiRy0xQl/kmAp2y6Klu11Y9D/Y7xpndqkqCJbOsesoo/mT7Kdgac+C54DUTLbibzoa5kklMPGL6soSRZtuftgQx0F0BJSshomLEdhyF1q1NqdZBWHtEQGqLeYkxhDuNedWEEPnML8QKw4bluGuhJKzcSS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780127789; c=relaxed/simple;
	bh=rnoYZCCtqr1NRkM7q1424ngdlXWMdRUDbMGiXzIaquY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cAnm8A6g7yX9LGerX1DBs2ZfDzaN1Nhbt2P5V7pkyhqmZNop7HCZJI76I5/tHs1xUYXuMlXUyYmrU72AXdUkzE06LdhvkHjBLNr++LVwrBveeDUavyM027z62GFJXyUB88Y9GsxneYfjaI+TuSeX86FarQmUrOC2/L++cdkKRJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVMwbYvY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVMwbYvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780127788; x=1811663788;
  h=date:from:to:cc:subject:message-id;
  bh=rnoYZCCtqr1NRkM7q1424ngdlXWMdRUDbMGiXzIaquY=;
  b=LVMwbYvYa+vdj7/WB/Gf2Rq0jwnTppvdk5CnTFL5LcDbUxEOmKs4q/Vj
   xvEQ022UjrBrxC+gHRVnL7Dpvp7TDOKGNiBjHGPRP0zgFuuZ+n/wSJnvO
   PkzXWyUTQOYJKsKaS9XpX5qYax+bj2Gjpn9NMP7aM/ecdfPxMbMvL/1Cq
   /Va0kenHiMWGgvNFw88Z9rbALmdHkhqsLqMF76U5pKwipC8Is2fbYi1YM
   7p4FDIg9YXk0h3CaM1u8rwS2DgsTXV+YmCEpdxcfLt+shvaoG6X9XpNO1
   rACSPPWJZWrbD/jKiCyrO4u2kskKdN2fX3363Awy5mlOGjcJiv4+CgM33
   w==;
X-CSE-ConnectionGUID: uUtPWEXeRj+QZw8H2QGTjQ==
X-CSE-MsgGUID: lWXMPPuYQvCXKzxDk+FWOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80941642"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="80941642"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 00:56:28 -0700
X-CSE-ConnectionGUID: h/7y9P/uSrak/VQjP+iuvw==
X-CSE-MsgGUID: VSi1YehSStiyhIpVzySNxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="247980246"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 May 2026 00:56:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTEYR-000000008Eq-1ehT;
	Sat, 30 May 2026 07:56:23 +0000
Date: Sat, 30 May 2026 15:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Lukasz Luba <lukasz.luba@arm.com>
Subject: [thermal:thermal/bleeding-edge 23/30]
 drivers/hwmon/mlxreg-fan.c:586:29: error: implicit declaration of function
 'devm_thermal_cooling_device_register'; did you mean
 'devm_thermal_of_cooling_device_register'?
Message-ID: <202605301558.lGtO9ni0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Daniel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/bleeding-edge
head:   100e27ef9a645f07881160256b7131fb40885215
commit: fe809a49f5cd6e2e0b24bf3c1b1af588b1a19760 [23/30] hwmon: Use non-OF thermal cooling device registration API
config: sh-randconfig-002-20260530 (https://download.01.org/0day-ci/archive/20260530/202605301558.lGtO9ni0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301558.lGtO9ni0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301558.lGtO9ni0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/hwmon/mlxreg-fan.c: In function 'mlxreg_fan_cooling_config':
>> drivers/hwmon/mlxreg-fan.c:586:29: error: implicit declaration of function 'devm_thermal_cooling_device_register'; did you mean 'devm_thermal_of_cooling_device_register'? [-Werror=implicit-function-declaration]
     586 |                 pwm->cdev = devm_thermal_cooling_device_register(dev, mlxreg_fan_name[i],
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             devm_thermal_of_cooling_device_register
>> drivers/hwmon/mlxreg-fan.c:586:27: warning: assignment to 'struct thermal_cooling_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     586 |                 pwm->cdev = devm_thermal_cooling_device_register(dev, mlxreg_fan_name[i],
         |                           ^
   cc1: some warnings being treated as errors


vim +586 drivers/hwmon/mlxreg-fan.c

   573	
   574	static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
   575	{
   576		int i;
   577	
   578		for (i = 0; i < MLXREG_FAN_MAX_PWM; i++) {
   579			struct mlxreg_fan_pwm *pwm = &fan->pwm[i];
   580	
   581			if (!pwm->connected)
   582				continue;
   583			pwm->fan = fan;
   584			/* Set minimal PWM speed. */
   585			pwm->last_hwmon_state = MLXREG_FAN_PWM_DUTY2STATE(MLXREG_FAN_MIN_DUTY);
 > 586			pwm->cdev = devm_thermal_cooling_device_register(dev, mlxreg_fan_name[i],
   587									 pwm, &mlxreg_fan_cooling_ops);
   588			if (IS_ERR(pwm->cdev)) {
   589				dev_err(dev, "Failed to register cooling device\n");
   590				return PTR_ERR(pwm->cdev);
   591			}
   592		}
   593	
   594		return 0;
   595	}
   596	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

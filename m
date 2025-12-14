Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518A97E110
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 03:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765683048; cv=none; b=tPbK3V/DFMuImamkTQTidusC1bnZV3g2qzwDSiqOGDRJa09HC456ZHHyheLokKlIV4+FJu69e0jNYU5n88XMqc72Y9nczY4riJvs3cEqNXZ8zDhAsL2Y3BUNRpvbFf6OOyoI0x4gNKuGM+DKi1N3I1h1GYW9Hy8Xg+f3OApu78s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765683048; c=relaxed/simple;
	bh=yzWTaezuZu3XznXy5tlh5o+wUPvHSSnLNDzS0IWXMgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eG3hulbi7QWpyDwx1rx9HSNMXrNuSbTxzErZodgnotnlSLAsiUOGQEs+jZPPNqFUZSsABU1rjTU1lTXLDiV4Yz0A+b2DVWjYhHwXwLbC8wmqcba9z9BhsENl7Nd6W1eyy33cBq463qQSZR0lDNYVFrqtUJHksWUiHJ9+Yok8eCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9x8OdKB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9x8OdKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765683046; x=1797219046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yzWTaezuZu3XznXy5tlh5o+wUPvHSSnLNDzS0IWXMgM=;
  b=e9x8OdKBd/cZdbNEWY9iqQSKMg6vgeF3aD3V46nKrtgklDIGzRRAg+xN
   ARoier5JQ9/De6sy1Zd0eoFh+cxO6vsvRhDEARGnovALdNCiMIBtqJ0xU
   vmwibVt5dmTHRBTGkjGOKh+HVGA+0zeJtGJdo1IU06BCk3qrBbpVjKiIx
   Qnp1hLIE0FGS06gjGGROJoi9BuHQ2YM7NU9FgMlJApSLgqtn1W22cgJyR
   d0O00G6XNwPm/ZQ+4Oa5ITvfIm4vwp4e+7//mMSL0l1axMBafuwfIpnHM
   d6pqjWmBlQFgL/Z7wsC9gTdoGHmQDZilClOwcTJ++NTkDe93kyyr02Zm+
   A==;
X-CSE-ConnectionGUID: BRCvW33NSluRdjusWKvIdg==
X-CSE-MsgGUID: QwI8T7mtSMiQLeGm/kD6+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67670410"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67670410"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 19:30:45 -0800
X-CSE-ConnectionGUID: pyWgtFO0T3SKlV+yX9mx/Q==
X-CSE-MsgGUID: pAYX8vJtQxyHrdMc/CAqMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="198258935"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2025 19:30:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUcok-000000008Wu-3ntC;
	Sun, 14 Dec 2025 03:30:42 +0000
Date: Sun, 14 Dec 2025 11:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 0/1]
 drivers/hwmon/cros_ec_hwmon.c:60:26: sparse: sparse: cast to restricted
 __le32
Message-ID: <202512141116.XhYKZwE3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   48776802cab71a77ba2ad75aae59a6f475da6efc
commit: fb8e659309f72e54ed011c6bfe98597b9236805d [0/1] hwmon: (cros_ec) add PWM control over fans
config: i386-randconfig-061-20251212 (https://download.01.org/0day-ci/archive/20251214/202512141116.XhYKZwE3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141116.XhYKZwE3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141116.XhYKZwE3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/cros_ec_hwmon.c:60:26: sparse: sparse: cast to restricted __le32
>> drivers/hwmon/cros_ec_hwmon.c:60:26: sparse: sparse: cast to restricted __le32
>> drivers/hwmon/cros_ec_hwmon.c:60:26: sparse: sparse: cast to restricted __le32

vim +60 drivers/hwmon/cros_ec_hwmon.c

    46	
    47	static int cros_ec_hwmon_read_pwm_value(struct cros_ec_device *cros_ec, u8 index, u8 *pwm_value)
    48	{
    49		struct ec_params_pwm_get_fan_duty req = {
    50			.fan_idx = index,
    51		};
    52		struct ec_response_pwm_get_fan_duty resp;
    53		int ret;
    54	
    55		ret = cros_ec_cmd(cros_ec, CROS_EC_HWMON_PWM_GET_FAN_DUTY_CMD_VERSION,
    56				  EC_CMD_PWM_GET_FAN_DUTY, &req, sizeof(req), &resp, sizeof(resp));
    57		if (ret < 0)
    58			return ret;
    59	
  > 60		*pwm_value = (u8)DIV_ROUND_CLOSEST(le32_to_cpu(resp.percent) * 255, 100);
    61		return 0;
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

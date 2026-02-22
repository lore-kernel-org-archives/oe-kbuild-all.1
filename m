Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEC06A001
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 05:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771739975; cv=none; b=uathUG8UkaQlumffUYHvbwtu/5HeZxMHxZHXsYUyM2w/rnXThS1liTQLJGB75etiN2GzHcVo0EC6vVF1GcpMsThHxjg9Wkp5cN4A1fvPd9vnD8oXzUQsHtb2VdzPg0ZPGcxbd3p4F/OuFHCrbONxe8X33cdwiMFVo1o8baNQC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771739975; c=relaxed/simple;
	bh=w4Am1aNmj6PjU0tYEuY6rnYiWfYrWfmH7UBNEUmfLZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sLn1CvNXRrc3PYMNAQq39XKuSzPwfoKbWBFA6FncQucL3s/YZWgi60FGDhQNviTKMMR2VXe/zg8A1ortX+O8WiGEulmSyxY0E61v1rZaC3jGhEt/NlgEeUHAScWPQMtcMlm6rb8nG42WNbs9tZq/49i6sQ+B1gP5Jh95PCGf6VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gb+o+xtq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gb+o+xtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771739973; x=1803275973;
  h=date:from:to:cc:subject:message-id;
  bh=w4Am1aNmj6PjU0tYEuY6rnYiWfYrWfmH7UBNEUmfLZA=;
  b=Gb+o+xtqkXIsIuHJpbUiXIt9C1P2c9DE+pmv8rYN1ZELatJB5XTDFiVl
   GkRDpISWtqT2TpCn5qk9lYffdE/x6hZ8N48DxMl/PnyxUsgTe+YT3I8TU
   a2U8UHa7yckt+ZDJFsMTWt/v/JiJC2ba3O7g/bF3HqudjFCFSpxIZjxRH
   ejgxADjJsk2BpE835rECuwbCfdefcWa3MTvFPm92MWD2owGm16KyGZIHA
   ID48LLxAKns5Qt7j5/1p0eUHuDKWrva2eF9NCcUqJnUOYQ+LgRHOGad97
   lV7/Ke4vYuuZfmAA4vGvp5L2Gmk6FfDdgogXfeAvaID0yOXlPNX/spK5C
   g==;
X-CSE-ConnectionGUID: GJdzUgG4RzCO5X3FcD2+XQ==
X-CSE-MsgGUID: HRy9aOSgQbmphUo7SsnBFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="98230735"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="98230735"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 21:59:33 -0800
X-CSE-ConnectionGUID: 2noyD4e/QnmdGZRY9TnQeg==
X-CSE-MsgGUID: AyfsDj3cQvOjbP6h478m+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="213690363"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Feb 2026 21:59:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu2V7-000000015M4-4ARc;
	Sun, 22 Feb 2026 05:59:29 +0000
Date: Sun, 22 Feb 2026 13:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Weinberger <richard@nod.at>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rw-misc:hwmon_pwm 1/1] drivers/hwmon/nct6775-core.c:2551
 show_pwm() warn: unsigned 'pwm' is never less than zero.
Message-ID: <202602221321.c41bjCjC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git hwmon_pwm
head:   ec2b70fb03a2db7f6cfae2a34aecac4d4c3d0f42
commit: ec2b70fb03a2db7f6cfae2a34aecac4d4c3d0f42 [1/1] hwmon: nct6775: Register fan pwms as pwm chip
config: x86_64-randconfig-161-20260222 (https://download.01.org/0day-ci/archive/20260222/202602221321.c41bjCjC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221321.c41bjCjC-lkp@intel.com/

smatch warnings:
drivers/hwmon/nct6775-core.c:2551 show_pwm() warn: unsigned 'pwm' is never less than zero.

vim +/pwm +2551 drivers/hwmon/nct6775-core.c

  2540	
  2541	static ssize_t
  2542	show_pwm(struct device *dev, struct device_attribute *attr, char *buf)
  2543	{
  2544		struct nct6775_data *data = nct6775_update_device(dev);
  2545		struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
  2546		int nr = sattr->nr;
  2547		int index = sattr->index;
  2548		u16 pwm;
  2549	
  2550		pwm = read_pwm(data, nr, index);
> 2551		if (pwm < 0)
  2552			return pwm;
  2553	
  2554		return sysfs_emit(buf, "%d\n", pwm);
  2555	}
  2556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FA83EBF39
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180654; cv=none; b=Sh40Myf+Sei7IK25iuaEyxbBD2uA6ZKg/H2mFJ3ypUSx6pr7BHpd+pHXyd1SQxtPvBM1M0jSjhU5TUmP98Q9cY+2GFzz9QDhQD+HiemH0HoJOaC5YXzHqJ3fk4qd9++oHiMAM7CpljyQR5MUISUtwcmomp72OT8fJ3eV8Ap0mQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180654; c=relaxed/simple;
	bh=NDaes/wUClYoHi7vascPdCfY2OlTxi2MvdOeGd2spQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KSQqzfS5JnnKaGgAC1e1m0n/kqlGYCXHFFISpUhoj8Pvx0wYjFRiULahCiIIercGZek77dGbQQ9TzoGkBA+nZSLA9kWscRjtjKxrEc+EvJx3Rd9+PDTh5oi5JCGwDwTAS0fNBMg7UMJTORtvfuZNyf8Yn1ZaRPx5KzDwUw+iu28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmpHgMx7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmpHgMx7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776180652; x=1807716652;
  h=date:from:to:cc:subject:message-id;
  bh=NDaes/wUClYoHi7vascPdCfY2OlTxi2MvdOeGd2spQQ=;
  b=PmpHgMx7bL2UztFMlHahJ4D+Swb3Y5QqCPEQp0/rBOtC3Ydkw99EPp3Z
   vRho6WXnxyM+yxuhCx+MGzBs1omn3aB+uypPkVB6vChtaS0xjikTUcZrx
   M2LdnzqmlFCmSa+aPiXw4Glm4WGPf+XL4A+/IV6+6U+pXdnxjV1gjFhkG
   v9CtXrQAGmFBJc1JoMLRzvq/UuH81dK4kotoZzoxLBgZkxArbtEeSd+7V
   2AgrmCiXHtySRA2/6yOi/24ff63eBxPDHMEg40Xa/cSZN8BYBKkVBLyje
   9UvK0ZH22WGVScw8VzXtnWXzFRtFqWlZ/d2irhhnd8iBz7rlSptmDjydr
   Q==;
X-CSE-ConnectionGUID: nM6+xJcuSUKngP4SnJgVoA==
X-CSE-MsgGUID: zF4N4LhUTMaMHntEPVH46Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77253162"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77253162"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 08:30:51 -0700
X-CSE-ConnectionGUID: /Iqme0HKRuavfT2yNkiUCw==
X-CSE-MsgGUID: lo8CUCVYRsWQMRONoUw5rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="229258915"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Apr 2026 08:30:50 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCfix-000000001aB-10A4;
	Tue, 14 Apr 2026 15:30:47 +0000
Date: Tue, 14 Apr 2026 23:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id 24/25]
 include/linux/thermal.h:242:1: warning: no previous prototype for
 'devm_thermal_of_cooling_device_register'
Message-ID: <202604142318.UHSpv92J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id
head:   4fea531ae8a1095b1fc1122441fc173a33b93005
commit: 1da9dad287e0abae276c2f8cacd7ad105b78293b [24/25] thermal/of: Pass the of_index and add a function to register with an index
config: arm64-randconfig-001-20260414 (https://download.01.org/0day-ci/archive/20260414/202604142318.UHSpv92J-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142318.UHSpv92J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142318.UHSpv92J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/acpi/processor.h:11,
                    from drivers/hwtracing/coresight/coresight-platform.c:346:
>> include/linux/thermal.h:242:1: warning: no previous prototype for 'devm_thermal_of_cooling_device_register' [-Wmissing-prototypes]
     242 | devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/devm_thermal_of_cooling_device_register +242 include/linux/thermal.h

   240	
   241	struct thermal_cooling_device *
 > 242	devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
   243						const char *type, void *devdata,
   244						const struct thermal_cooling_device_ops *ops)
   245	{
   246		return ERR_PTR(-ENODEV);
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

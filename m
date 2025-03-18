Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB41A934
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 00:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742257321; cv=none; b=ATMFjVylavC2UV3osbbte3oQUcrhkg3eTFQFcUM4HamnBowaNayx0aA1F/4cC0jfJi5i6XtrdZBjvewTQaqdQx5kdUZU1IMsI3JdX3/o6NUSS3FeqBNLke4UIadtq2utEUis+Eku+g4oAvPH5WwF9HADMaRK4uydXkSMB4YiqcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742257321; c=relaxed/simple;
	bh=D3YepuDREaAWJJHaR0hCvHz3PDJ9QUcKr2Xm+B2N2iA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kIwnp3Zewok0IOsDJbYqqWvhnJ58tjF9NoPo3Qw4nHMo74xjpb7d/WRWVAQPUt/vmtDOm+BurHql3XMlMp3Pz52l0wNTWmtYbAga3cGubXaBgLsuqNuEH2+eYZ9pkLM8ZWutvrYjIP/t4hgVTt/qprTmpfzaLtyYgEyq/Wc+8NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLjidgjs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLjidgjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742257320; x=1773793320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D3YepuDREaAWJJHaR0hCvHz3PDJ9QUcKr2Xm+B2N2iA=;
  b=DLjidgjsVUl3ubPFf8+WYwnXrRWJii+FdybFgOBg9BN3SYVYzCUxG8+v
   lMbrkflIGfKKvhyuRv5Q7WSGNs7oOBhJjRBa9dAg8v1Wpseo5pM3KTDys
   4LmL20I2Z6s7R/BExn6hf5vO/42rUPR31it3Uj3IzyVgWGASnr0g/+Xyo
   LrSFvOjArPYKH3tp0134Oz/exG5WtmwrYiPTSBHjrtYp9ZBfIHzYOznGa
   YTu4b9ajTqFTybmmzb7do1KVjEcglbnwLEIVl4Ak196NkqE/Dxu8R3Zgm
   8j8IspJn4SLqGIArYtcdrFRnDDjDcA+5W/RHUFN6EVau0/3fIlI7ieTLH
   A==;
X-CSE-ConnectionGUID: mvNo4NesRh2WkG5osbAtkw==
X-CSE-MsgGUID: dEvsokVVQAeBbsukWN49Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="42552438"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="42552438"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 17:21:56 -0700
X-CSE-ConnectionGUID: tv0+CJLmReOLsEM9iM2Z3w==
X-CSE-MsgGUID: s6/Roy7uRTG8LgQNjeIcsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="126753723"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2025 17:21:55 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuKiO-000DFd-2n;
	Tue, 18 Mar 2025 00:21:52 +0000
Date: Tue, 18 Mar 2025 08:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.03.11a 35/38]
 drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:1686:54: error: incompatible
 types when assigning to type 'atomic_t' from type 'int'
Message-ID: <202503180852.q0Z1Zi2B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2025.03.11a
head:   f8336d73124404df2b42d757b8a2c73f70281b97
commit: 85393d1591b54e5b41e61ec6ca2f2c84bf94351d [35/38] ratelimit: Convert the ->missed field to atomic_t
config: arc-randconfig-002-20250318 (https://download.01.org/0day-ci/archive/20250318/202503180852.q0Z1Zi2B-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503180852.q0Z1Zi2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503180852.q0Z1Zi2B-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c: In function 'amdgpu_set_thermal_throttling_logging':
>> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:1686:54: error: incompatible types when assigning to type 'atomic_t' from type 'int'
    1686 |                 adev->throttling_logging_rs.missed = 0;
         |                                                      ^


vim +1686 drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c

b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1657  
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1658  static ssize_t amdgpu_set_thermal_throttling_logging(struct device *dev,
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1659  						     struct device_attribute *attr,
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1660  						     const char *buf,
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1661  						     size_t count)
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1662  {
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1663  	struct drm_device *ddev = dev_get_drvdata(dev);
1348969ab68cb8 drivers/gpu/drm/amd/pm/amdgpu_pm.c     Luben Tuikov 2020-08-24  1664  	struct amdgpu_device *adev = drm_to_adev(ddev);
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1665  	long throttling_logging_interval;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1666  	unsigned long flags;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1667  	int ret = 0;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1668  
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1669  	ret = kstrtol(buf, 0, &throttling_logging_interval);
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1670  	if (ret)
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1671  		return ret;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1672  
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1673  	if (throttling_logging_interval > 3600)
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1674  		return -EINVAL;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1675  
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1676  	if (throttling_logging_interval > 0) {
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1677  		raw_spin_lock_irqsave(&adev->throttling_logging_rs.lock, flags);
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1678  		/*
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1679  		 * Reset the ratelimit timer internals.
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1680  		 * This can effectively restart the timer.
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1681  		 */
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1682  		adev->throttling_logging_rs.interval =
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1683  			(throttling_logging_interval - 1) * HZ;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1684  		adev->throttling_logging_rs.begin = 0;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1685  		adev->throttling_logging_rs.printed = 0;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22 @1686  		adev->throttling_logging_rs.missed = 0;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1687  		raw_spin_unlock_irqrestore(&adev->throttling_logging_rs.lock, flags);
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1688  
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1689  		atomic_set(&adev->throttling_logging_enabled, 1);
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1690  	} else {
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1691  		atomic_set(&adev->throttling_logging_enabled, 0);
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1692  	}
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1693  
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1694  	return count;
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1695  }
b265bdbd9f2811 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c Evan Quan    2020-05-22  1696  

:::::: The code at line 1686 was first introduced by commit
:::::: b265bdbd9f2811c2a674ea9d1161de821923897c drm/amdgpu: added a sysfs interface for thermal throttling related V4

:::::: TO: Evan Quan <evan.quan@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

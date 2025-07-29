Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481E5156CA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 19:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753817941; cv=none; b=OqsN8M70lmLMMIZT7GhOY9ffM3K5gf+Jg9YAJk3eqkAXJq7+llJXVz59BRsJCa2zPzxwd77BJrnsbYo3JCiajDCilpxAkuWpjQfKPzhzRS8XUkrEVvAak2/+5DL2v+VG0cGLEpZk1b4Koabv3BsWE11Fa3XBWTcfOaX2l27gyIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753817941; c=relaxed/simple;
	bh=P8SqqzKYj5bSnbqM7WBouWSOa4E0+IwRAAXVxv+4r7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=av3wDbXSdz+I2s7IdeWi0GUWxh+DZjl/7kLKLNoAgpCpLVibbfFarUZv0tcX255CRjDaR2FpJC2Ap67b9bKPD57jGURQAt1KxUVorMCCglBg3zcDgw64C6AQE76wiQy5pPYruO2Uh2Qk9xz1N8MJ6gGQ6NDlp9us7kJ71YSg5wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVetyat/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVetyat/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753817941; x=1785353941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P8SqqzKYj5bSnbqM7WBouWSOa4E0+IwRAAXVxv+4r7U=;
  b=eVetyat/8q+G2mJ0Qu9jW5165nIHlcFqfcXdYfndoplXMWrE39EcUGWI
   ew7V4eU41vZr1S9+j0ialm9SDo5BEuqKKeiuRQJL3GD0p/TCSf9vEBRm6
   7SRsdIsmKHfX0dJnq6UKDKd5c2WAESwYw2sXQSsxHgzHl3Q0jk8/9RWZ1
   QZirHij8Kyoa01WeJla7SAtbU1PH+h6o7gG8PMaF5hxH/HgIRwZLjhnn8
   18Hm67fTidmRIy0yOO17LgSDjFYpbjbyt7fVef4HUC4xWnKMh9BXenizU
   Su4keoIcL1lLthXA69WuDHU1BPEQNEN8jqIbPQEW5stmqnrZ0jhCdvkaJ
   Q==;
X-CSE-ConnectionGUID: P3eHRlEaTUawcdV3FTXs1Q==
X-CSE-MsgGUID: 2VfHUGw4TEqBaYYz4w7E9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55970383"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="55970383"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 12:39:00 -0700
X-CSE-ConnectionGUID: LjMQGeOQTCWVB5/SOMoB/w==
X-CSE-MsgGUID: TdvpVR01TEWwsYu9LizKKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162677379"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2025 12:38:59 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugqA4-0001cJ-0l;
	Tue, 29 Jul 2025 19:38:56 +0000
Date: Wed, 30 Jul 2025 03:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:nvme-mpath-bpf 3/6]
 drivers/nvme/host/multipath.c:1148:46: error: 'struct nvme_ns_head' has no
 member named 'bpf_ops'
Message-ID: <202507300353.u3J3J2SG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git nvme-mpath-bpf
head:   7e438588a7436fb1145593e81e9cd827bde45af9
commit: 48267d0a99cacd52ee3c2d1c14c06e87822a2ed5 [3/6] nvme: add per-namespace iopolicy sysfs attribute
config: riscv-randconfig-002-20250730 (https://download.01.org/0day-ci/archive/20250730/202507300353.u3J3J2SG-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300353.u3J3J2SG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300353.u3J3J2SG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rculist.h:11,
                    from include/linux/dcache.h:8,
                    from include/linux/fs.h:9,
                    from include/linux/backing-dev.h:13,
                    from drivers/nvme/host/multipath.c:6:
   drivers/nvme/host/multipath.c: In function 'nvme_numa_path':
   drivers/nvme/host/multipath.c:465:48: error: 'found' undeclared (first use in this function)
      rcu_assign_pointer(head->current_path[node], found);
                                                   ^~~~~
   include/linux/rcupdate.h:590:36: note: in definition of macro 'rcu_assign_pointer'
     uintptr_t _r_a_p__v = (uintptr_t)(v);          \
                                       ^
   drivers/nvme/host/multipath.c:465:48: note: each undeclared identifier is reported only once for each function it appears in
      rcu_assign_pointer(head->current_path[node], found);
                                                   ^~~~~
   include/linux/rcupdate.h:590:36: note: in definition of macro 'rcu_assign_pointer'
     uintptr_t _r_a_p__v = (uintptr_t)(v);          \
                                       ^
   drivers/nvme/host/multipath.c: In function 'iopolicy_show':
   drivers/nvme/host/multipath.c:1147:6: error: implicit declaration of function 'nvme_bpf_enabled'; did you mean 'set_cpu_enabled'? [-Werror=implicit-function-declaration]
     if (nvme_bpf_enabled(head))
         ^~~~~~~~~~~~~~~~
         set_cpu_enabled
>> drivers/nvme/host/multipath.c:1148:46: error: 'struct nvme_ns_head' has no member named 'bpf_ops'
      return sysfs_emit(buf, "bpf(%pUb)\n", &head->bpf_ops->uuid);
                                                 ^~
   cc1: some warnings being treated as errors


vim +1148 drivers/nvme/host/multipath.c

  1139	
  1140	static ssize_t iopolicy_show(struct device *dev,
  1141			struct device_attribute *attr, char *buf)
  1142	{
  1143		struct gendisk *disk = dev_to_disk(dev);
  1144		struct nvme_ns_head *head = disk->private_data;
  1145		int iopolicy;
  1146	
  1147		if (nvme_bpf_enabled(head))
> 1148			return sysfs_emit(buf, "bpf(%pUb)\n", &head->bpf_ops->uuid);
  1149		iopolicy = READ_ONCE(head->subsys->iopolicy);
  1150		return sysfs_emit(buf, "%s\n", nvme_iopolicy_names[iopolicy]);
  1151	}
  1152	DEVICE_ATTR_RO(iopolicy);
  1153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

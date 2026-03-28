Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E2933F8B1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 04:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774670991; cv=none; b=lgR44B8P8cMLTcJxy9qCyMZb83bzZKuTy+087VptNAZrF1nZJKrZni3DlZ17u6oC8yDnOKRBELPHK4f/byOr4jwPrKL1ZI8bg0w08u0VIvXP9IdQjzNdSucsJ6aE3D+/L3Ye0Cm6gpvotXyzXPMI3yMOAzHed4111FKIDjgWpqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774670991; c=relaxed/simple;
	bh=aBezF+AIdkOr56wnuHti+8YjL2+0XTnOEtgww/GYvuk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sUuIi2k/NP+eXDJ72eiK2Ei/S1MlP4DF76qAycIA5YJvbqVHm6PdyckN2R6Q6lBTAHU7AsIoZVoiT1n3+vnLKG4hHXHJcCwvVPWbHRKALmobZkza1Lbsi/4mPQmaCe5i2oK94gpZi9zB4E7XsmsMO6JLZOC9lOeT6PIzfru2HQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=guzIZ8ZE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guzIZ8ZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774670990; x=1806206990;
  h=date:from:to:cc:subject:message-id;
  bh=aBezF+AIdkOr56wnuHti+8YjL2+0XTnOEtgww/GYvuk=;
  b=guzIZ8ZEenniWRkR1m+9TF6l0n16AFnq5hJwJfWD61tD5fcTtS8z45vu
   zG5gpPyjna1PATgLNmn2YB+7jD8s4szWfXEWvpxkR96b/i7YvTPH6yRy9
   +x8GCZ8RvWe9BGSY+qf/ad0VgpSfNsAd1v19zboJoW1afBXqtIhZB3Lz1
   hQ9jgYGK6jY5R1hsGbhPlfMryAsFIvIaZIoofhu8t4SQ4l3CX+D6CBdTS
   LL8/g03f9+AZp3wiKIuVIDjwW9guX0FbAitNwSjSMUGl1PXVx5QNsZF17
   LvV0qocDxCk76dfLxmOdD6mhyqSMxWre7bNTC8G/8L+AC160VjDrlF1F+
   g==;
X-CSE-ConnectionGUID: eYfAvjpySTSAZ1NkQgkfgQ==
X-CSE-MsgGUID: uNqUOZDQS6G7RaRQEjsYwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86361793"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="86361793"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:09:49 -0700
X-CSE-ConnectionGUID: pl/aTu9dQ+miwigm+IAduA==
X-CSE-MsgGUID: 130rxNwdRguS6eIq55rKtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="224697109"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Mar 2026 21:09:48 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6KzZ-00000000B37-0osA;
	Sat, 28 Mar 2026 04:09:45 +0000
Date: Sat, 28 Mar 2026 12:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 4/4]
 drivers/vdpa/vdpa.c:674:19: sparse: sparse: cast to restricted __le16
Message-ID: <202603281251.EiUE8O9I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   fc88a7504f0f262cc5b2e8a7f58b2a1108034856
commit: 447092100c7e71aa20469a270fcee441d807ed58 [4/4] vdpa: Introduce query of device config layout
config: i386-randconfig-r133-20260325 (https://download.01.org/0day-ci/archive/20260328/202603281251.EiUE8O9I-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603281251.EiUE8O9I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281251.EiUE8O9I-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vdpa/vdpa.c:674:19: sparse: sparse: cast to restricted __le16
   drivers/vdpa/vdpa.c:674:19: sparse: sparse: cast from restricted __virtio16
   drivers/vdpa/vdpa.c:690:19: sparse: sparse: cast to restricted __le16
   drivers/vdpa/vdpa.c:690:19: sparse: sparse: cast from restricted __virtio16
   drivers/vdpa/vdpa.c:694:19: sparse: sparse: cast to restricted __le16
   drivers/vdpa/vdpa.c:694:19: sparse: sparse: cast from restricted __virtio16

vim +674 drivers/vdpa/vdpa.c

   664	
   665	static int vdpa_dev_net_mq_config_fill(struct vdpa_device *vdev,
   666					       struct sk_buff *msg, u64 features,
   667					       const struct virtio_net_config *config)
   668	{
   669		u16 val_u16;
   670	
   671		if ((features & (1ULL << VIRTIO_NET_F_MQ)) == 0)
   672			return 0;
   673	
 > 674		val_u16 = le16_to_cpu(config->max_virtqueue_pairs);
   675		return nla_put_u16(msg, VDPA_ATTR_DEV_NET_CFG_MAX_VQP, val_u16);
   676	}
   677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

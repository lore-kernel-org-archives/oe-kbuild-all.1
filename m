Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757B31361
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 01:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729386192; cv=none; b=kcml1Vk31mC4s5eFsxAQnh6z5hOvfZtnqUdrdAGTcNqABr/jrR2EXngit0zxcOFQtrjMlriOttW1HHJ7G1DMa9aBxGey/Lv3w0sg15j58cclLv5Ra+9R1YpmoLkQ7BD9P5Nn/vbXJFLsUJSIXtfd5vmf2aHlth9FGiYUjvBlnvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729386192; c=relaxed/simple;
	bh=IU6VG2FExEQJPTQOS3LakTczjXNdN5Ca1ByaiacGZ1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cs8Sz4Vnvp2xKGjOj3r7pTaP2Z/S5VWt19Qbt8BLsI+5EcrU3BKNjSiS2WIytqJV4keXJTWs/NP0o3F+V203kbaK01v1wzWQbqg8kCo+9RCB3oaNKItqM+tDxNLrZOktte/FZNxNUzram9o8g9Krcy6uyMDeznROM/H1pM969aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ze+8Yy4g; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ze+8Yy4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729386191; x=1760922191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IU6VG2FExEQJPTQOS3LakTczjXNdN5Ca1ByaiacGZ1k=;
  b=Ze+8Yy4g8OTkvF0VxKyWruzefcs/0ZboFCnWWlIhWMrnmFVkQRS1pk0C
   8GG2qxhwvCXX+iklcG6rBMVLmicoc8ui1I1ZNuJR0SYXUqxd8Jw/7S7rg
   zjmrGxfyRFRsB8cClccFoWYx4LeZe353ORGzh0ZNFV+wqeBWasbotoCq6
   2kxODCiGUey3G3hmCtvyoy1WVYrNIZEh5ZFYV9K8mDwPnuRbtOlSKeJ5d
   z4t/hSmVXm/fjA/AZ10iEoGJf73bK6roMSz9p7QQtDhkmUjS0zzDdu6xD
   DIGBnUrO2ZYIqR4L8+jXHp6ns0pq+1EUSY1FjV39GqboRjDTocasZtmWg
   A==;
X-CSE-ConnectionGUID: cKrp4wAzS6OC5mVwxflgQg==
X-CSE-MsgGUID: ZVFCtGGkRJ2f/mdESwR88Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46355591"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46355591"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 18:03:10 -0700
X-CSE-ConnectionGUID: 4XWIiD/qT2Wo7F+kkYUZSw==
X-CSE-MsgGUID: isml/qR9QCekKsURihcuTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="79530046"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Oct 2024 18:03:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2KLa-000PjU-2l;
	Sun, 20 Oct 2024 01:03:06 +0000
Date: Sun, 20 Oct 2024 09:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg 2/8] drivers/virtio/virtio_msg_mmio.c:79:17:
 error: implicit declaration of function 'writeq'; did you mean 'writel'?
Message-ID: <202410200933.bI6CjE6X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg
head:   087414af579a53d448c1a3f74eeaef61c197c504
commit: 411e244d3f6d667fb766c6d102e576aadf5d1d15 [2/8] virtio: Add support for MMIO based channel bus
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241020/202410200933.bI6CjE6X-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200933.bI6CjE6X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200933.bI6CjE6X-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_msg_mmio.c: In function 'virtio_msg_mmio_send':
>> drivers/virtio/virtio_msg_mmio.c:79:17: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
      79 |                 writeq(*(data + i), addr + i);
         |                 ^~~~~~
         |                 writel
>> drivers/virtio/virtio_msg_mmio.c:87:31: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
      87 |                 *(data + i) = readq(addr + i);
         |                               ^~~~~
         |                               readl
   cc1: some warnings being treated as errors


vim +79 drivers/virtio/virtio_msg_mmio.c

    68	
    69	static int virtio_msg_mmio_send(struct virtio_msg_device *vmdev,
    70					struct virtio_msg *request,
    71					struct virtio_msg *response)
    72	{
    73		struct virtio_msg_mmio_device *vmmdev = to_virtio_msg_mmio_device(vmdev);
    74		int i, len = sizeof(*request) / sizeof(u64);
    75		u64 *data = (u64 *) request;
    76		u64 *addr = vmmdev->base;
    77	
    78		for (i = 0; i < len; i++)
  > 79			writeq(*(data + i), addr + i);
    80	
    81		if (!response)
    82			return 0;
    83	
    84		data = (u64 *) response;
    85	
    86		for (i = 0; i < len; i++)
  > 87			*(data + i) = readq(addr + i);
    88	
    89		return 0;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

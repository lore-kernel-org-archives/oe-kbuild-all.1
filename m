Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193A454652
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 19:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731959239; cv=none; b=EOrmHRYiJYVw3AHoOaNGwksqglUFLjp6kKUZsuWsd9SWFn4IAN6tDj4+V/7cvWxivrmqkigEGeFkM1znwYY4VJgJY2KKx/uTHAzQ5kI7LoEWYDMZ41nF70/xV8m3O2A6DeLbU6YzVvCmQO3IrNuSk/SHAHHurLJFR3Cr1t62jbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731959239; c=relaxed/simple;
	bh=N/5C4NUN9Rrhb3cWlT2Ig7gaCpOlNqSNclaoL9Epcrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GNTcMseaAdwUpprabbjdB6klf+dexK6xqStwLHGts7/YkXDyWVGUbSn5iuM3V6psXZEserNc///ZLFmcz9pJL2lsf5gycMXYpFj3RnlATBzHqM1Y/Cz8KDw13GQmXKPf6v8ueaX3Cdg5qtQohS6B5nuWVHUKkMX+10Zc/subYzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DdCLAx8S; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdCLAx8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731959237; x=1763495237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N/5C4NUN9Rrhb3cWlT2Ig7gaCpOlNqSNclaoL9Epcrk=;
  b=DdCLAx8StconeM7RDSGL0oBLj9E1GNqh3t/gKE5UhQS9VuZIj4F6i2se
   wD+fgRRDMcqpD4LrCXweRakY8Y4/1QlHRm6N6BkGQTWPHGeFv7mOT+K8l
   5byKdZKVLZJzXZ/L38ACQuAw4mQ2bJ/qnUUQIbNJAxO8uRHJk3ZmU36Qr
   2+K63M75C3aanfKW5bF1QGicMzlx2eF69SqVMzSu91kxno2gd9h7CNDV3
   zdgpXvKaEWLxP315Pg+smwl3CM4gQtYWHcAhKLWMOgkqJ1cZucT31/hy2
   NCEgsrHUpHLE/k9xtF42TepTqJAtIMlz5n02Hw8a6eivQPPhqZmuXMywr
   w==;
X-CSE-ConnectionGUID: Vr3NFVD1QvS39SscULh6xA==
X-CSE-MsgGUID: xUxLG4X4TDiDu2BGI9rWNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32169265"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="32169265"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 11:47:17 -0800
X-CSE-ConnectionGUID: eWeOx5RiQneAo2u9c5t3AA==
X-CSE-MsgGUID: uXtR3tJnTPyEbuBh204eLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="93397429"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2024 11:47:16 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD7iL-0002cB-1J;
	Mon, 18 Nov 2024 19:47:13 +0000
Date: Tue, 19 Nov 2024 03:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-v2 2/21] drivers/virtio/virtio_msg_mmio.c:79:3:
 error: call to undeclared function 'writeq'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202411190357.7iddfY5x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-v2
head:   702c1af18bf513f8297bfbb99b859c37b7b900ab
commit: 91dc384463e6fcf24e2c988696689cb6a539cb94 [2/21] virtio: Add support for MMIO based channel bus
config: arm-randconfig-002-20241119 (https://download.01.org/0day-ci/archive/20241119/202411190357.7iddfY5x-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190357.7iddfY5x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190357.7iddfY5x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/virtio/virtio_msg_mmio.c:79:3: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   writeq(*(data + i), addr + i);
                   ^
>> drivers/virtio/virtio_msg_mmio.c:87:17: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   *(data + i) = readq(addr + i);
                                 ^
   2 errors generated.


vim +/writeq +79 drivers/virtio/virtio_msg_mmio.c

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

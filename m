Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CA11DFD1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 18:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731954253; cv=none; b=jma7Cm2yC8AfRFU798xkzsDVjwbbvEKDTdPu2O4RiYqbFs5hGU46SOjOdw8Ydvu5r6jhAXqWkHiRIXdjUW/DOdsCwZGaNqKH9WCwIS+GyPdK/FBa38Tj6mp/tK2XHBXWOLOPT4IoN53HxWRSrVqDLXR6mCNCclgUpybLPb4S4Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731954253; c=relaxed/simple;
	bh=SixhlgfLVWe/JF13Z+IlKjNleq4WiBNQKzCNqUkn3lA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hfvGBaShqBkM1zSDMEtRy7Kxdk3P6chPONaTSpTLsOBtPKqCci2eXN/qWkyNIb7yMQm6UnY04RY52vJKN/ge/Us87qtRbUoHRgW7ZpfF1/R7w8EFEUekJ9MF0dqdoQmYRgi6w2xIf6aLaRT1mK/ICMxF8DUZ/XtQcj5CAKxwrsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yt2RTajW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yt2RTajW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731954251; x=1763490251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SixhlgfLVWe/JF13Z+IlKjNleq4WiBNQKzCNqUkn3lA=;
  b=Yt2RTajW/cMlcHUikpqDN9vsD9/g8zWYes0uHi2g0MYlylWJalJwjjfZ
   U0YcwMxXPGebhSgKp8vtdsnpgar/gwj64PG5EKWuJjw5o9C/viauSdDE2
   774hjad62ptOdO6CsQGfIz8wrjijILp1c+dL7uQFe2mLawwTi1aVYrfZs
   gPzuSLJb4RdjUgXkxincoOxR0XMrlmplRMqqaYxE6k9ZkJY6uRl02aIt1
   MMJK1oVQiPeeaEabrFws28KRXXS8b72mdN6+sFPnBC+hOoZlAoazz9Zt3
   6/wd2vmxaPpp/kspImxD1xhWHnBwGcguerC7+kVgzeRCVPoScPXu2zcGx
   w==;
X-CSE-ConnectionGUID: Je4BbQ7iT1KRUQfavO44WA==
X-CSE-MsgGUID: FbbjOTX5RYS1tB6EC7Ntgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="49464288"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="49464288"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 10:24:11 -0800
X-CSE-ConnectionGUID: xK5jX/3FSIiG19C5p6sbZw==
X-CSE-MsgGUID: LRZUT9MzSJS4Wwv7Wf+6oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94350056"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Nov 2024 10:24:11 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD6Pv-0002aV-1M;
	Mon, 18 Nov 2024 18:24:07 +0000
Date: Tue, 19 Nov 2024 02:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-test 2/26]
 drivers/virtio/virtio_msg_mmio.c:79:17: error: implicit declaration of
 function 'writeq'; did you mean 'writeb'?
Message-ID: <202411190237.nGmIEspd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-test
head:   702c1af18bf513f8297bfbb99b859c37b7b900ab
commit: 4095173660abdd1c436f8761ba626ad1a2098fda [2/26] virtio: Add support for MMIO based channel bus
config: arc-randconfig-r131-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190237.nGmIEspd-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241119/202411190237.nGmIEspd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190237.nGmIEspd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_msg_mmio.c: In function 'virtio_msg_mmio_send':
>> drivers/virtio/virtio_msg_mmio.c:79:17: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
      79 |                 writeq(*(data + i), addr + i);
         |                 ^~~~~~
         |                 writeb
>> drivers/virtio/virtio_msg_mmio.c:87:31: error: implicit declaration of function 'readq'; did you mean 'readw'? [-Werror=implicit-function-declaration]
      87 |                 *(data + i) = readq(addr + i);
         |                               ^~~~~
         |                               readw
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

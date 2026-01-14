Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19ED36C0DD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 06:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768371510; cv=none; b=la/p/6Cz3WM7J/b2f3TG7ha34CiF0SgPiWJwaBrG3k6wwfhoUHmAouySQn0f9o9aqGlgr5EagfLm3yzRtxD4g4pkfbd3iKRt3RWT/Fpkoxd0kWUzbp269lRI6wAP/eySXO7sQi0cm2FO8Am0rwLb89eBNpRhG8Li61MuX7lcqms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768371510; c=relaxed/simple;
	bh=tHJHt/jS2EgNSbU7VvM8Kv2gVj4MnALwLGdyZzpXgzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JrqUTUbzaW/xwQSygD0CSdgtN1HDwigiJJ4SwE/i0aMMHbJZTOMn6tj/mV760oGfFX0hR2sN8RSu5K0QXVIfwKKXhfSddlY2do3MkHZVL2/3yFcz34m+ecIWuqCvFdH4+Xcy/1k8ZtOyJV73qKVCy79bMwt46jVeAZIG7br0vgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtepIznE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtepIznE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768371502; x=1799907502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tHJHt/jS2EgNSbU7VvM8Kv2gVj4MnALwLGdyZzpXgzc=;
  b=DtepIznEJzKGG9uVnGEkW9aqYgYSuay9w4youEvgeIyInNlc7aKkhHrE
   4tU6C1TrLlpePU7AkGw0Zn2bTOMMdvoo9RobiisUOqI3gJdTs1g0XN/lT
   V5wgfWzjiOyBtud+cfd1dtnKHZ04Ng6dve772aqutQnZ4/aUryCvzItGf
   oKPLZbLCZnabJCwXKyx9U+V1ERRYQ8Df5Mcf/ueJDATn4ICTXS4cf44s/
   Qkt6fQo3BtUkFIJg5Kv/ybaFxMiDnSbdTgtEorQlFvVH1KpLAPRJHMOW/
   Liu8gfUACnSB7UyYv/Xho4P3NyaU4LCmRFSXqOqoWHOe8p4aPcJyJgg/Y
   A==;
X-CSE-ConnectionGUID: vqiIbmNDQGm/vCuVstUtCA==
X-CSE-MsgGUID: +aW+WFvCRpanFLot50XSzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69717664"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69717664"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 22:18:18 -0800
X-CSE-ConnectionGUID: aQ1faRThRZiRgXOOGKP2EQ==
X-CSE-MsgGUID: qBmCsVJmTgO00QGEiXO8Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204224664"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2026 22:18:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfuCs-00000000Fuq-1AYp;
	Wed, 14 Jan 2026 06:18:14 +0000
Date: Wed, 14 Jan 2026 14:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: [linux-next:master 3552/6121]
 ./usr/include/linux/hyperv.h:361:2: error: field  within 'struct
 hv_kvp_exchg_msg_value' is less aligned than 'union
 hv_kvp_exchg_msg_value::(anonymous at ./usr/include/linux/hyperv.h:361:2)'
 and is usually due to 'struct hv_kvp_exchg_msg_value' being pac...
Message-ID: <202601141415.v7H5vQ6k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b775e489bec70895b7ef6b66927886bbac79598f
commit: e3970d77ec504e54c3f91a48b2125775c16ba4c0 [3552/6121] kbuild: uapi: drop dependency on CC_CAN_LINK
config: arm-randconfig-r052-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141415.v7H5vQ6k-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141415.v7H5vQ6k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141415.v7H5vQ6k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/hyperv.h:361:2: error: field  within 'struct hv_kvp_exchg_msg_value' is less aligned than 'union hv_kvp_exchg_msg_value::(anonymous at ./usr/include/linux/hyperv.h:361:2)' and is usually due to 'struct hv_kvp_exchg_msg_value' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     361 |         union {
         |         ^
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/vbox_vmmdev_types.h:239:4: error: field u within 'struct vmmdev_hgcm_function_parameter32' is less aligned than 'union (unnamed union at ./usr/include/linux/vbox_vmmdev_types.h:223:2)' and is usually due to 'struct vmmdev_hgcm_function_parameter32' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     239 |         } u;
         |           ^
>> ./usr/include/linux/vbox_vmmdev_types.h:254:6: error: field u within 'struct vmmdev_hgcm_function_parameter64::(unnamed at ./usr/include/linux/vbox_vmmdev_types.h:249:3)' is less aligned than 'union (unnamed union at ./usr/include/linux/vbox_vmmdev_types.h:251:4)' and is usually due to 'struct vmmdev_hgcm_function_parameter64::(unnamed at ./usr/include/linux/vbox_vmmdev_types.h:249:3)' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     254 |                         } u;
         |                           ^
   2 errors generated.
--
   In file included from <built-in>:1:
   In file included from ./usr/include/linux/vboxguest.h:14:
>> usr/include/linux/vbox_vmmdev_types.h:239:4: error: field u within 'struct vmmdev_hgcm_function_parameter32' is less aligned than 'union (unnamed union at usr/include/linux/vbox_vmmdev_types.h:223:2)' and is usually due to 'struct vmmdev_hgcm_function_parameter32' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     239 |         } u;
         |           ^
>> usr/include/linux/vbox_vmmdev_types.h:254:6: error: field u within 'struct vmmdev_hgcm_function_parameter64::(unnamed at usr/include/linux/vbox_vmmdev_types.h:249:3)' is less aligned than 'union (unnamed union at usr/include/linux/vbox_vmmdev_types.h:251:4)' and is usually due to 'struct vmmdev_hgcm_function_parameter64::(unnamed at usr/include/linux/vbox_vmmdev_types.h:249:3)' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     254 |                         } u;
         |                           ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

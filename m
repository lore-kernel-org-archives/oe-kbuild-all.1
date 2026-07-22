Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A52737B40E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 01:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784685165; cv=none; b=OH8Wr7Dx7Nprrm238J/iCzdP7ed5UPPSUN/4e7eYmOlCIVQyZlY2bsHyen/IqN9PcRVNugUEbxmi7upSOjbcK0HrdQi11UoZCTe3SNAFIamfydy3TYqqrILJRWdvVrRL4BFw4/40OdNpW4mHaFzsV9VaALaJatxgOSi6OGffe3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784685165; c=relaxed/simple;
	bh=4cSDdNZYhrVJ2AcqnLlAw02MnDH2DRVATFi7lOZWXQE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rd4Gf43RM68SrcvsRgMWbp/xVawuvpc0oT+YWNwTNyWhLC8JM+ZgkXOmU5ngcGVbI2pQyhV7Tz2xAKKcEqqFoWQCzWHkZxhoES91rn1IartlHHBRL4P3u2HaKtUBl2jB3+VYK8wp7DTxCzN4195eiZP0TR5frmowS/HoHT8RWc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWAhIvam; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWAhIvam"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784685163; x=1816221163;
  h=date:from:to:cc:subject:message-id;
  bh=4cSDdNZYhrVJ2AcqnLlAw02MnDH2DRVATFi7lOZWXQE=;
  b=QWAhIvam91C8tfK/scdaPhi3T8LnnG7+vYh2Zik+MLtxCIziwZkDsVgK
   3nmIiV/MHE8Vd+8JJq6t8CH8Is+SqL2Z+Oq/NYZCgjL/wc3vWcEw5Viai
   vxkk0ux6dBoqPWpgPxAV0hg7u/fwfI3Y3JgkkY1VRRAJIew3HQzGQqNTP
   cQjWOAOVVKcV76Fmq24NOGtVw6o/qks3HZMoXh19gXOSUpZqhJxlI04Rl
   dHevxBgunyoL3QfYpctKPn2SRUKAVQZOTI0yNJZ7GCn9UQ7uitAMT0DX6
   bAO+XBtEd8t8RQmoCrKV6HcuuVT3kbC00LZyxDaImZSoW1JhkTiue8kZn
   w==;
X-CSE-ConnectionGUID: hFHjoWTcSPqDDaO7qwAdyg==
X-CSE-MsgGUID: ir2aGqyyQR6CfNXgvvES/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="87842380"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="87842380"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 18:52:43 -0700
X-CSE-ConnectionGUID: 1qExGDwsQIS+2j0vlqQ51A==
X-CSE-MsgGUID: +/anKDU9Qo6UgdlTdJJCBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="262881272"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jul 2026 18:52:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmM8P-00000000YIa-1ioL;
	Wed, 22 Jul 2026 01:52:34 +0000
Date: Wed, 22 Jul 2026 09:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>
Subject: [tip:core/entry 20/23] syscall.c:undefined reference to
 `syscall_enter_audit'
Message-ID: <202607220954.BZkTBQyt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
head:   05c033db7e9ad3c34f6968ec568cb6ee01051c57
commit: 6f25517010ddd3f8080d7e06b9b1cb1b64b73772 [20/23] entry: Rework syscall_audit_enter()
config: s390-randconfig-002-20260722 (https://download.01.org/0day-ci/archive/20260722/202607220954.BZkTBQyt-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607220954.BZkTBQyt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607220954.BZkTBQyt-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: arch/s390/kernel/syscall.o: in function `__do_syscall':
>> syscall.c:(.noinstr.text+0x210): undefined reference to `syscall_enter_audit'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

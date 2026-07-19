Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E18428640B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jul 2026 02:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784427075; cv=none; b=ZIcuZtuW4XFokp5o6Zjzp0/QrTLovaekltlsnkxXcOEc4ZLyyNnxGfPklKpWL6K+9nvhH4NBTBb2/U66+dDYlFOyIU3JQqmpeYj2R/nbf+16u95qQGGjyRC6ag8I/ZLj/gBFYJ+G9FOCKqMn8pBTuzGn75nEYQTno0hEWJZgcic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784427075; c=relaxed/simple;
	bh=MgLZFLCRoXsK6wxaeImEGDT0DSLpN3seBx04ef5VKhk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a4dviP018eTOUETDa0KquQ/vH6c8kMlVM6ZQNH2tMFrZZKe0jYYDEqzciYCERFmE19D3K8b6TY9VmmEKED7YqWlrT1pZaC1i0DfJ67lX8vOGHUSXo3VE9pDbNOlNbm8JnuKOg4lwp9Sqk5RTkX1bO/6gE8d7egYtKnBqr6KLpps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeaiMyCx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeaiMyCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784427073; x=1815963073;
  h=date:from:to:cc:subject:message-id;
  bh=MgLZFLCRoXsK6wxaeImEGDT0DSLpN3seBx04ef5VKhk=;
  b=QeaiMyCxuQ3QWCv3ydILBZ7nNuIxa3/vrl/ouG3PxbVvl79O+534BPAf
   kNF3LfEYc9vg2hHyn4giWgMWxM+/Tk+3XFb48IrZKyOBwfm8Wc9brStfI
   hfAVwSE6dgkCn+gOnY8COwsz914O6I+AKUhGky8JMFGBNqAo1AlM2vFdx
   42m4s0n5NKRCOE0gGkYgBm1HaeJuttl0WqmFfrRCRRQ6zmiYENSDy89Lc
   BA1X53vR5qwodxg4Xs5nlaThi7PNtwwUGBOA4vRMjAt+NWo+rWNT1uA64
   ZmT6tiLKVNLmOQS0232Z3QstgIHWWdZWBwdkbHFUThoig1bQ+Jek6gyyI
   Q==;
X-CSE-ConnectionGUID: sZFdCkh1SM28Tw3/58k6AA==
X-CSE-MsgGUID: K1g3QLdRSTKlgTf92XlGYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="96415775"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="96415775"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 19:11:13 -0700
X-CSE-ConnectionGUID: oFM2KpZ5Q56z/6mPA9Op2A==
X-CSE-MsgGUID: +vzHYn08SRywvPaYey4hCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="253712900"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 Jul 2026 19:10:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlGyh-00000000VG3-0j8E;
	Sun, 19 Jul 2026 02:10:03 +0000
Date: Sun, 19 Jul 2026 10:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: drivers/power/reset/reboot-mode.c:39:2-7: WARNING: invalid
 free of devm_ allocated data
Message-ID: <202607191025.h6bQp891-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: cfaf0a90789ac74391ac7583c86cdaaada78cdbb power: reset: reboot-mode: Expose sysfs for registered reboot_modes
date:   5 months ago
config: powerpc64-randconfig-r064-20260716 (https://download.01.org/0day-ci/archive/20260719/202607191025.h6bQp891-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cfaf0a90789a ("power: reset: reboot-mode: Expose sysfs for registered reboot_modes")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607191025.h6bQp891-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/power/reset/reboot-mode.c:39:2-7: WARNING: invalid free of devm_ allocated data

vim +39 drivers/power/reset/reboot-mode.c

    30	
    31	static inline void reboot_mode_release_list(struct reboot_mode_sysfs_data *priv)
    32	{
    33		struct mode_info *info;
    34		struct mode_info *next;
    35	
    36		list_for_each_entry_safe(info, next, &priv->head, list) {
    37			list_del(&info->list);
    38			kfree_const(info->mode);
  > 39			kfree(info);
    40		}
    41	}
    42	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

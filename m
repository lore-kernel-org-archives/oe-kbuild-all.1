Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631763A1A59
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778427890; cv=none; b=sNfgwnrKaHVgOxckqeupU4elrhTIEzPlNRGYWhq3rhVTT3NdeQsHDJZuaYJ69PuFyeC/Q/1K9KKdy8TWH6uBhf2bAYiKal1nKrdG+5WAdCW1Np9Cqjk0YQ+u/WHXi+aykzzF5HnAvah/nFLBefbJbYjis65q6hSWv5wPme5DfdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778427890; c=relaxed/simple;
	bh=sNdX5YmNUgXWUhPlvLxQZqUPETvy8FJif2OTnlpTY6s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R1ZQTVfof3+VC40cYNf40GhL/pHMkpnGsRhWuqEDbo0yk6Ieczx+AT/eGwdwRYtuCPznVS51mT6tfNL0brbLtJWBLr8UtXCpJQ/JxHXa9CXFyIXfCJYsQ2DFdpYE1Da8Gt1CWGYN0BKip3bZu3R6K7RQtkIKIz7CA+2q2PeMpaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bitRkuo8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bitRkuo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778427888; x=1809963888;
  h=date:from:to:cc:subject:message-id;
  bh=sNdX5YmNUgXWUhPlvLxQZqUPETvy8FJif2OTnlpTY6s=;
  b=bitRkuo8PJItPx1c0y0PzaAwDDzV80JGkdX7eXFodmxYu/imjBbwjPIx
   0JdZUchrE4829dHwzXinYLNVWG59jkMRGQ1Vqk7IY66lgdsvJfbixoGVw
   6yjj/6WlOtsUaSnPRDdLojnT6dD5bsL1az6SGZasEGFIViJRmAL/SkmC/
   kMiHCOA5U8QmLyvx6RSNrW2crjqTpQ8iO6a2sX11vakJ9YuL2KY6I54WN
   JlwupPDipIVqSnw/GFoYAve57vriOcV3M/DUtuU+kdOY61Jep9FMH4Gll
   AL55rOqWolHhUSgkWxX4UutssiEgbSthqrhyTq1+WtO+aE2cerNkvTf2n
   A==;
X-CSE-ConnectionGUID: kzLP3jl6S1+lToe40IDdSg==
X-CSE-MsgGUID: iBZleUdkTV2VKIM/Opw5Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79367110"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79367110"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 08:44:48 -0700
X-CSE-ConnectionGUID: oGO/S5D1QiiNcHh4Sh0m7A==
X-CSE-MsgGUID: l9MDDW8mSfKeVpEALdNpvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="275370121"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 May 2026 08:44:46 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM6Kh-000000007kH-3wip;
	Sun, 10 May 2026 15:44:43 +0000
Date: Sun, 10 May 2026 17:44:41 +0200
From: kernel test robot <lkp@intel.com>
To: Asier Gutierrez <gutierrez.asier@huawei-partners.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/admin-guide/mm/damon/hugepage.rst:3:
 WARNING: Title overline too short.
Message-ID: <202605101727.glKBkFJv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/gutierrez-asier-huawei-partners-com/mm-damon-Generalize-ctx_target-creation-for-damon_ops_id-and-add-vaddr-support/20260510-155505
head:   022dc7c281135daee8dd8ad5c6ff6593bcfd2787
commit: 022dc7c281135daee8dd8ad5c6ff6593bcfd2787 Documentation/admin-guide/mm/damon: add DAMON-based Hugepage Management documentation
date:   8 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260510/202605101727.glKBkFJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605101727.glKBkFJv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:36: abi_sys_class_reboot_mode_driver_reboot_modes doesn't have a description
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>> Documentation/admin-guide/mm/damon/hugepage.rst:3: WARNING: Title overline too short.
--
   =======================
   DAMON-based huge page collapsing
   ======================= [docutils]
>> Documentation/admin-guide/mm/damon/hugepage.rst:11: WARNING: Title underline too short.


vim +3 Documentation/admin-guide/mm/damon/hugepage.rst

     2	
   > 3	=======================
     4	DAMON-based huge page collapsing
     5	=======================
     6	
     7	DAMON-based huge page collapsing (DAMON_HUGEPAGE) is a static kernel module
     8	that aimed to collapse hot regions into huge pages.
     9	
    10	Where Proactive huge page collapsing is Required?
  > 11	========================================
    12	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

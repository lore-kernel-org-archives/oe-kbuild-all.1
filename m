Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E7A25F98A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 02:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935829; cv=none; b=UsiGlOq8+yvwcSn4LxWC2wHsZLdYP1nxQzUMPQl5gOesuJguNkmvA6sBRyKdeonh2Vp1Bq8UdSiMEFdBnysNvWONsIJMGHpi+3AMzQhOYCQfZ9dtlYzvytlJDs0F3TWGaFgAMUPPAH5DKbiPMpkGAsY+Yrn9Q1Z7x7bqweFCb/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935829; c=relaxed/simple;
	bh=Tx34bfrkuSv0RcUa6Qw+Oes/AE1Ehl10yz4Nrb7BMJI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z8O16H2NEsBw5SJ7TFv3HbWJ407bJCWTEw1LqFtTJNbSIKBpbR9ukD9Hl8BJT1VM/a/QO8vyMqEIIq+cHvE8kvKF1q7cuvwrqs9p3nGkms5d67BCVGvO5qRAgnShPohR3FwF4IkaTvaRjEit/xjfvBzIajjng9fHMIOM3J3S7So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2v3Dt17; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2v3Dt17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779935828; x=1811471828;
  h=date:from:to:cc:subject:message-id;
  bh=Tx34bfrkuSv0RcUa6Qw+Oes/AE1Ehl10yz4Nrb7BMJI=;
  b=I2v3Dt17S6Jgn9JLsdLbgw6E9c05cp38npKkqy+eY4uASKKEYEMWzh6X
   m0OjrddxkEKM08d58UEBRTEFkgGwZyvrjeilxPdUOQZdZpMX4g1nSQe9F
   KVIpeFdM2vntfb2/txyWOmhOGhbgDApmjbIe8PwVK75pJyawRdaQ99pY1
   dZ+dScgy5f86pIFYHvgL27YENUe27X2K4HJ3zfKwfEpE1QkTttKvicATm
   qqHTazdMVhhg60MtGOCCI8BPdS/wTJgKC1KgtJ4CoqixA+x1S60vkX3iK
   cBJFb3VOo6wjhgFrQYdpDBep2sddKObYva85v6VpTvRVlcWND1j7ekPue
   w==;
X-CSE-ConnectionGUID: P2e9E1HLRDq6eZW34vxOxA==
X-CSE-MsgGUID: 6AdfOWgXRZujdEsQjDcgtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80502835"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="80502835"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 19:37:07 -0700
X-CSE-ConnectionGUID: LnSES0FGSHiM68CDWLM1WQ==
X-CSE-MsgGUID: HdfYZ9SiTgOGAse4384GQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="266310683"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2026 19:37:05 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSQcJ-000000000FR-1gnV;
	Thu, 28 May 2026 02:37:03 +0000
Date: Thu, 28 May 2026 04:36:31 +0200
From: kernel test robot <lkp@intel.com>
To: Wang Yaxin <wang.yaxin@zte.com.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/accounting/delay-accounting.rst:237:
 WARNING: Block quote ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202605280425.CtB8dwcy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/wang-yaxin-zte-com-cn/delaytop-add-delay-max-for-delaytop/20260527-220949
head:   44e6b3df52686da300225295e81360c85eac7218
commit: 44e6b3df52686da300225295e81360c85eac7218 delaytop: sort by max delay to highlight top latency processes
date:   12 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260528/202605280425.CtB8dwcy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605280425.CtB8dwcy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   [WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   [WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   [WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
   Using alabaster theme
   Documentation/accounting/delay-accounting.rst:236: ERROR: Unexpected indentation. [docutils]
>> Documentation/accounting/delay-accounting.rst:237: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/accounting/delay-accounting.rst:237: ERROR: Missing matching underline for section title overline.
--
   30        30  kworker/2:0H-kb   2.87   11.36  2026-05-27T13:32:36 [docutils]
   Documentation/accounting/delay-accounting.rst:243: ERROR: Unexpected indentation. [docutils]
   Documentation/accounting/delay-accounting.rst:244: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/accounting/delay-accounting.rst:246: ERROR: Unexpected indentation. [docutils]
   Documentation/accounting/delay-accounting.rst:247: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/accounting/delay-accounting.rst:249: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/accounting/delay-accounting.rst:246: ERROR: Unknown target name: "pool_workqueue". [docutils]
   WARNING: Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:36: abi_sys_class_reboot_mode_driver_reboot_modes doesn't have a description
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252


vim +237 Documentation/accounting/delay-accounting.rst

   224	
   225	
   226	System Pressure Information: (avg10/avg60vg300/total)
   227	CPU some:       0.4%/   0.2%/   0.1%/     220(ms)
   228	CPU full:       0.0%/   0.0%/   0.0%/       0(ms)
   229	Memory full:    0.0%/   0.0%/   0.0%/       0(ms)
   230	Memory some:    0.0%/   0.0%/   0.0%/       0(ms)
   231	IO full:        0.0%/   0.0%/   0.0%/      12(ms)
   232	IO some:        0.0%/   0.0%/   0.0%/      13(ms)
   233	IRQ full:       0.0%/   0.0%/   0.0%/       0(ms)
   234	[o]sort [M]memverbose [q]quit
   235	Top 20 processes (sorted by cpu MAX delay, largest first):
   236	     PID      TGID  COMMAND          AVG(ms)  MAX(ms)   MAX_TIMESTAMP
 > 237	------------------------------------------------------------------------------------------------
   238	       9         9  kworker/0:0-eve   0.59   16.87  2026-05-27T13:32:39
   239	      30        30  kworker/2:0H-kb   2.87   11.36  2026-05-27T13:32:36
   240	      27        27  migration/2       1.05    9.51  2026-05-27T13:32:37
   241	      50        50  kworker/2:1-eve   0.50    9.13  2026-05-27T13:32:37
   242	      15        15  rcu_preempt       0.11    8.98  2026-05-27T13:32:37
   243	       1         1  init              0.17    7.12  2026-05-27T13:32:38
   244	      67        67  scsi_eh_0         1.20    4.23  2026-05-27T13:32:37
   245	      23        23  ksoftirqd/1       1.12    3.77  2026-05-27T13:32:36
   246	       3         3  pool_workqueue_   0.72    3.55  2026-05-27T13:32:38
   247	      62        62  kworker/u20:2-a   0.49    3.03  2026-05-27T13:32:37
   248	       2         2  kthreadd          0.18    2.82  2026-05-27T13:32:37
 > 249	      11        11  kworker/0:1       1.42    2.76  2026-05-27T13:32:36

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

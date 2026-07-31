Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575AA35DA5D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489073; cv=none; b=aJ1Br79t/G/PhhAF6TbvNVW5fx2QZLCzjrNYq8CgxgacsZqBsbqF4BgfdG5dE5A4T6UDHoakhJI2LOL1JPLPDR4UV2UNjEvs0sXqKVLVxCrdAXgzmQK29LFC+JiTTnaGHjA4XhdCopmpMHC0ZLYH+mB5BT4fpliZ38mjroX/Eho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489073; c=relaxed/simple;
	bh=5XUZi8GsiVLf/Vb+67K9iznleyV2RXl5LlPnl7gw/kc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sj2HjDZSGOb6lFswEPSvYibm479+hGkdRvlVGqP4j3+oLTfluIHLXw9Y//PTBdi4DV8ps6mZge5Gj09V/UPwvWaTqyc+J5MeMQuX+F0Zj0N28/avRIrld0qluRwkU7IpYcauxvEqq+fSHzbG/+90hZLnQchK2GGT5rHhnTI3jDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRZ3Awqb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRZ3Awqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785489071; x=1817025071;
  h=date:from:to:cc:subject:message-id;
  bh=5XUZi8GsiVLf/Vb+67K9iznleyV2RXl5LlPnl7gw/kc=;
  b=iRZ3AwqbljPZHm+IFcCctzrWemGyoq4sPSYkZ2XzHQ9AKPldwaNmBsgX
   PJPhvoAweDVb5B85gliE1dgPqqniCsaSXcDKvv1ebeSOkwhx7EVwyJ503
   ELPwD7i89DM8t5CqqArwp8IpjrHQVRFLlP1HYnXw389KGaka5Oixe+iW5
   Hz7Cz3fTBKL9SFYqwPm2hZfJfgp3RCcC4j9IDGxroNFFXh2B2JYEo5vtF
   hjhL3S5jmQcwYEhGRChEgmih8ZMdDLIbOoXAdHIXlLEz5X27smLU5t0up
   vPsHVYSGGwrQ8hinXEI8gTrdbMUUXDdxC57qdQVevbf7f7zsBhSGViv0n
   w==;
X-CSE-ConnectionGUID: LAqrdnraRBmxDoa0S3e2Ig==
X-CSE-MsgGUID: hbUjBtDeTE2o0f3UPXjcIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85880726"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="85880726"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 02:11:10 -0700
X-CSE-ConnectionGUID: NT0N3CMWSPqR8ntn+Zic/A==
X-CSE-MsgGUID: XtZUKY9NSfSisx9/dmSmWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="285139664"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2026 02:11:09 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpjGl-000000002fm-1r0G;
	Fri, 31 Jul 2026 09:11:07 +0000
Date: Fri, 31 Jul 2026 11:10:09 +0200
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [gourryinverse:djhacks 36/38] htmldocs:
 Documentation/ABI/testing/sysfs-bus-dax:183: WARNING: Definition list ends
 without a blank line; unexpected unindent. [docutils]
Message-ID: <202607311126.xEbrg8UU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux djhacks
head:   09de2580129cf36e7ed3de65282a91fe3cc29e24
commit: 64636b7d457b68054d7a759c4a688476a22044cb [36/38] Documentation: describe private memory nodes
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260731/202607311126.xEbrg8UU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311126.xEbrg8UU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Using alabaster theme
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>> Documentation/ABI/testing/sysfs-bus-dax:183: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-class-power-bd71828:1: ERROR: Malformed table.
   No bottom table border found.


vim +183 Documentation/ABI/testing/sysfs-bus-dax

 > 183	What:		/sys/bus/dax/devices/daxX.Y/mm_capabilities
   184	Date:		June, 2026
   185	KernelVersion:	v6.21
   186	Contact:	nvdimm@lists.linux.dev
   187	Description:
   188			(RW) dax_kmem only.  A NODE_MEMORY_CAP_* bitmask selecting how the
   189			device onlines its memory.  NODE_MEMORY_CAP_ALL (~0, the default)
   190			onlines it as ordinary system RAM; any other value onlines it as a
   191			private node (an N_MEMORY node not in N_MEMORY_FALLBACK) whose set bits are the only mm
   192			services that may act on the node's memory -- everything else is
   193			isolated.  Accepts decimal or 0x hex.  Writable only while the
   194			device is "unplugged" (-EBUSY otherwise).
   195	
   196			The capability bits (see include/linux/nodemask.h) are:
   197	
   198			  NODE_MEMORY_CAP_RECLAIM	reclaim of the node's folios,
   199							by the mm and by userspace madvise
   200			  NODE_MEMORY_CAP_USER_NUMA	userspace placement and migration
   201							via mempolicy and move/migrate_pages
   202			  NODE_MEMORY_CAP_DEMOTION	reclaim demotion/tiering onto the
   203							node (requires RECLAIM)
   204			  NODE_MEMORY_CAP_NUMA_BALANCING NUMA balancing scan/migrate of
   205							the node's folios
   206			  NODE_MEMORY_CAP_LTPIN		FOLL_LONGTERM GUP pins
   207			  NODE_MEMORY_CAP_COLLAPSE	THP collapse (khugepaged/madvise)
   208			  NODE_MEMORY_CAP_HUGETLB	hugetlb pool allocation
   209	
   210			Dependencies (DEMOTION requires RECLAIM) are validated at hotplug,
   211			not at write time: an inconsistent mask is accepted by the write
   212			but the subsequent online fails.
   213	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

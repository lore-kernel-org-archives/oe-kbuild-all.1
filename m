Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8163E95A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051946; cv=none; b=B9sQvTS5tG8jxhmVi7tCGoeBPp1GwPOyc+cCUJeJmfmwOoIPKlb1MCfzUaqNre0epEHOLu/EP5m/VIj6RKuvIxr7u/xz+tQvicgh4hMoJ3/LiYm+DEtYdQiV9VmoUv12riWjStLd1E9ErfHpRO2HmPcDBfSEca2OPedRx9MmUYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051946; c=relaxed/simple;
	bh=DG+fU/4OrA94zK1U+TxxVq5gj97r0bK0vhRma1rP+yU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=plGORtdXe5OTI5nghbbRN/tA4Ms6KaJ7iY6sbdhYUFvyYbndTio/XFqH3OI/lc/9/kT0rxu6TRxu5zIIUhM1B5rZbkkxJNSg6g7Thou9RHN20kREct8C7TzKIL/Y5KypUqUZzUplNu4AgOsixA8KccPu8LgZylupTCAPzpYLcPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/n8M3TR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/n8M3TR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792051946; x=1823587946;
  h=date:from:to:cc:subject:message-id;
  bh=DG+fU/4OrA94zK1U+TxxVq5gj97r0bK0vhRma1rP+yU=;
  b=D/n8M3TRrUp6OszUr6ZVxFr7D3ukpaLv+CGVc+d0UAZDi61UdDuyn4KZ
   bSX41pbQo808O2o1b2Cc7UATvBnQUPE1vCJR7NxvNXXlel/2rBlCpIEJK
   Tpe/WxiOH1yY7zRf2ltJdhhQlTPVF+V0Tzq1QsWNwf8DVhZIg+aFugafQ
   3L7fQA+vEweFuiAGItMjnTjYJyDUtWMBwJeWOr11bMiC2aXXRz1hmHOBs
   uXeRdWlpAq/RB0sI3x0zWNGFi9+NCMWRG4iVfRmbYPKOZLpF7V6zU0vjz
   ImXFPUqnQlXx4q6At0uxRD4BLzxaa+TSFRIker13qiBpD4OAnxgfbqEVu
   A==;
X-CSE-ConnectionGUID: H9Wpld1xRsGhBwNnnimFxQ==
X-CSE-MsgGUID: PZoNGzjARGa8nKep4BvEJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="699549"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="699549"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 01:12:25 -0700
X-CSE-ConnectionGUID: +GaMWRGlRKyHfES3B+cJOA==
X-CSE-MsgGUID: FyRcD/RNRfalx/dEAvBT8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2074918"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 15 Oct 2026 01:12:23 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHGZY-00000000Bf1-3JuK;
	Thu, 15 Oct 2026 08:12:20 +0000
Date: Thu, 15 Oct 2026 10:11:50 +0200
From: kernel test robot <lkp@intel.com>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-doc@vger.kernel.org
Subject: [linux-next:master 3622/16987] htmldocs:
 Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <202610151025.1g5IgCv2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Waqar,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d419d682257d813f6cb7a28e42b35d0edf4ad038
commit: 3f21de6784a654503cc148169d1f59d89971da13 [3622/16987] power: supply: rt9467: Use POWER_SUPPLY_PROP_LOAD_SWITCH
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261015/202610151025.1g5IgCv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610151025.1g5IgCv2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Using alabaster theme
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>> Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
   Documentation/driver-api/basics:42: ./kernel/time/time.c:387: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:410: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.


vim +1 Documentation/ABI/testing/sysfs-class-power-rt9467

eedb923279b78cb ChiaEn Wu 2023-01-03 @1  What:		/sys/class/power_supply/rt9467-*/sysoff_enable

:::::: The code at line 1 was first introduced by commit
:::::: eedb923279b78cbfe16dd54dade0d73e9977f118 Documentation: power: rt9467: Document exported sysfs entries

:::::: TO: ChiaEn Wu <chiaen_wu@richtek.com>
:::::: CC: Sebastian Reichel <sre@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

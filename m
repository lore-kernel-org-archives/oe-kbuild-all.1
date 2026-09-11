Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F852EEE7B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 05:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105230; cv=none; b=uh6xkFfcjbecUmFUWYDvAF6diS7Am6C6aib+49XY+mJyKQ7fE1Rh/zboCqu9bbAQHJDbisUYnnaHpGaEXoofvhoKwSHZOuE9qZRSeN9cyFzK+jdLLm+2059h2LcK9tA4aU7X1QyPENXcaFATBhQrxA+HBryENlTtnk9uMccdO0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105230; c=relaxed/simple;
	bh=KJ9sSelnLxT9AfhFfzkw92a36Alc+I4x0glXfGQku4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lDMsMqjvB6zDtQKZjpnmFd3qc+gGek1vyQqV9vuKS5OjJR/lqSnAYPKP9wFF1vRX9ulSeqP/XTVb0gMGLEvbM+HoSxP/0eG+u2tN+7KtcTsPw3zS8UOdLgJ/lyiuCwiYrzwy4CAUtYkbH8Ay6lAWbTE9Z0QkEopZd4ZTKbK2cbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F417H22g; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F417H22g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789105228; x=1820641228;
  h=date:from:to:cc:subject:message-id;
  bh=KJ9sSelnLxT9AfhFfzkw92a36Alc+I4x0glXfGQku4c=;
  b=F417H22g2A7wQJZmLePDfYh0Zdzd8HzfByP1eT6W0gfvpCdx8PmjCV6o
   R2sY+e/+oXcv9WI5Jo6EoGT9EX5+gplV17MA+tcJLnvuYX44y0ENeZKHE
   8BxRcKWbO1OnnD5Encx2517k9pziwkDLY5aJS7Km4oczygEKlIJRS16Ce
   afK9HxZGkObutGpOb5xQ6DsnA/x+svv7e2gimB5REpcaEeXZ6xmGbbLKR
   ANY20LlNXFxjknAaAYofNZ8mlFebPu/hKqd1ImVLuFHD8tMOW9Zkux6SU
   +pfNZxQqY1Jtn4bNC/D9L3xe0azXog1JQAARZG5n012HOvYNGLypq4KG/
   A==;
X-CSE-ConnectionGUID: 2H6aHkWoRlCVijDPYf7Yvg==
X-CSE-MsgGUID: FD1eb+t0Tq2P3wN2uKBdVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93256510"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="93256510"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 22:40:27 -0700
X-CSE-ConnectionGUID: Otfms0ZJS+SvNyox4XvqCA==
X-CSE-MsgGUID: CPUND/EiTmyBGZmdvBjy2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="135978"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 10 Sep 2026 22:40:26 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4tzr-000000000eL-43Sy;
	Fri, 11 Sep 2026 05:40:23 +0000
Date: Fri, 11 Sep 2026 07:40:07 +0200
From: kernel test robot <lkp@intel.com>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-doc@vger.kernel.org
Subject: [linux-next:master 5111/5916] htmldocs:
 Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <202609110722.GAZVme6v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2bfbc3554ca6919484030729424b9dee2942d24
commit: cb012fe405f0f487e9480472f3558e678556ed49 [5111/5916] power: supply: rt9471: Use POWER_SUPPLY_PROP_LOAD_SWITCH
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260911/202609110722.GAZVme6v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110722.GAZVme6v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Using alabaster theme
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>> Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
   Documentation/driver-api/basics:42: ./kernel/time/time.c:387: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:410: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]


vim +1 Documentation/ABI/testing/sysfs-class-power-rt9471

ab8174bbc39669 ChiYuan Huang 2023-01-13  @1  What:		/sys/class/power_supply/rt9471-*/sysoff_enable
ab8174bbc39669 ChiYuan Huang 2023-01-13   2  Date:		Feb 2023
ab8174bbc39669 ChiYuan Huang 2023-01-13   3  KernelVersion:	6.3
ab8174bbc39669 ChiYuan Huang 2023-01-13   4  Contact:	ChiYuan Huang <cy_huang@richtek.com>
ab8174bbc39669 ChiYuan Huang 2023-01-13   5  Description:
ab8174bbc39669 ChiYuan Huang 2023-01-13   6  		This entry allows enabling the sysoff mode of rt9471 charger devices.
ab8174bbc39669 ChiYuan Huang 2023-01-13   7  		If enabled and the input is removed, the internal battery FET is turned
ab8174bbc39669 ChiYuan Huang 2023-01-13   8  		off to reduce the leakage from the BAT pin. See device datasheet for details.
ab8174bbc39669 ChiYuan Huang 2023-01-13   9  		It's commonly used when the product enter shipping stage. After entering
ab8174bbc39669 ChiYuan Huang 2023-01-13  10  		shipping mode, only 'VBUS' or 'Power key" pressed can make it leave this
ab8174bbc39669 ChiYuan Huang 2023-01-13  11  		mode. 'Disable' also can help to leave it, but it's more like to abort
ab8174bbc39669 ChiYuan Huang 2023-01-13  12  		the action before the device really enter shipping mode.
ab8174bbc39669 ChiYuan Huang 2023-01-13  13  
cb012fe405f0f4 Waqar Hameed  2026-09-01  14  		Note: use /sys/class/power_supply/rt9471-*/load_switch instead.
cb012fe405f0f4 Waqar Hameed  2026-09-01  15  
ab8174bbc39669 ChiYuan Huang 2023-01-13  16  		Access: Read, Write
ab8174bbc39669 ChiYuan Huang 2023-01-13  17  		Valid values:
ab8174bbc39669 ChiYuan Huang 2023-01-13  18  		- 1: enabled
ab8174bbc39669 ChiYuan Huang 2023-01-13  19  		- 0: disabled
ab8174bbc39669 ChiYuan Huang 2023-01-13  20  

:::::: The code at line 1 was first introduced by commit
:::::: ab8174bbc39669321b25a0fbeef630fdbe1b8ffe Documentation: power: rt9471: Document exported sysfs entries

:::::: TO: ChiYuan Huang <cy_huang@richtek.com>
:::::: CC: Sebastian Reichel <sre@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

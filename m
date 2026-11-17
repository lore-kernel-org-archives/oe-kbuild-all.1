Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952480;
	b=frDt+jQNnekmnxjRK8ZAv+1Z21+owd/mtk8Muj0r7Y+OsevCm0q8ZG7T+VOOUjjP8BZE
	 K2wG+N4iPQRITIzE/xWMwBg7AVkX+LDxiJJDI+vScP7YIlI7DsSako68GtA3NSDqauUVz
	 1FIEr5KieGI2If1HaHDiVt6V9U2tf21wHIcPmnZi7K88Yw6LHjXN+4tYbKaAwx5RM/JI8
	 2OSHP88zZvqhmqGf81Rlj18zaMpncbKD5uyV3G7TMG9pccHVPJnBemms99nwMKOM2Wrtw
	 CGtmaxgR96D1bkhEEIBJ8/5lV7cqfeXPqpQyP80OMzKdcWVZ52KOuEjyZjfdRDFFAOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952480;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=x9bRN/a672fUu4HY2jFT2QX2UA+R56scYeVS/YxZ74Q=;
	b=tiI4LDClYIUB6mlhLGiwFmcwFlaQ+mWbTTjS8KK4AlJTRLzSNlxD+5K8DWgO07sALbqB
	 zsF0/v0VZBtVShd24kjMbm2mImBh4XuPIakSqlrUXsgzrUFGLWamnRZZFAEaGnROP6K4n
	 cBwT9DR08FZdE4Z4XL0hPYicYdX29gZqdhlwPKem1+R2pAWns6+g1Q0OKrumxA5Avkl3M
	 8kpnaXmEyU01yFsHUM417aeKgs3R9jS309ooDbDVFbYBqIb70Ueo/V/NdpOWjtIARaYVl
	 NLGZrTj9mPWXbOme/lPy31ng9lKZpFNqyZvsJ24eTJ4dTLfnBbSisGoVVTYfBXcI2Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UXgWzVn8;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235DE606A32C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 21:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 235DE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UXgWzVn8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794952480; x=1826488480;
  h=date:from:to:cc:subject:message-id;
  bh=rmNmGm+k5IU447bhgmbmSt+TBicgsRjDVNe1B9UPefw=;
  b=UXgWzVn8WWbtQW00LwAA1PoUlkp4GTM+3uytqVa6IH2emf6k23blZJnx
   Kv3qpnX2OvXzTEOsSw3Q20rwT+6oEzzwCeH3Nc7sOJI51Pv6YGcW4NgtL
   0PoLdjGy5/n4JeDKR9i4qe5MoX6hqdbnLDA3hqavjm9wFJpmJo0tLpaYb
   BPxBr8kEyZVT6+TJcX+WZVE+x7PZUL++BytgRcL76zzvK74Y2wIvw8oM0
   r5QGOenhNLAEcThFlqoPMjYjfJV3KqnIRudDy6YxAjZY2P8G1IAMh8DB8
   q0o4MO8sU2q2vlWitsxYMBj9ETBANav/sfki2+yg/v6DJDgfk9hxX/QJw
   g==;
X-CSE-ConnectionGUID: YqV75o30SgKkpvKQU5Brrg==
X-CSE-MsgGUID: Wu7V2GH0S8qjKnckg2QhrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3784220"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3784220"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 13:54:39 -0800
X-CSE-ConnectionGUID: KNPFQ3QNSda/9BmzLN3FIQ==
X-CSE-MsgGUID: SpWCgOZyQwi301UUuQ4hVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10201610"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 17 Nov 2026 13:54:38 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTR8N-000000003Ca-3Mzh;
	Tue, 17 Nov 2026 21:54:35 +0000
Date: Tue, 17 Nov 2026 22:54:10 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152] htmldocs:
 ./include/linux/tty_port.h:1: warning: 'tty_port_tty_hangup' not found
Message-ID: <20261117225000.NKBZQYa1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 6d1a984afc3ca477dab3e51ec806671d443ad524 [152/152] tty: port: fix tty_port_tty_vhangup() race
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261117/20261117225000.NKBZQYa1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117225000.NKBZQYa1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVEL_ITU_OPT1_EPRC' not described in enum 'dpll_clock_quality_level'
   ./drivers/firmware/stratix10-svc.c:180: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
   * svc_mem_lock protects access to the svc_data_mem list for
   ./include/linux/i3c/master.h:317: warning: Enum value 'I3C_ADDR_SLOT_EXT_STATUS_MASK' not described in enum 'i3c_addr_slot_status'
   ./drivers/base/core.c:2057: warning: Excess function parameter 'con' description in '__fw_devlink_relax_cycles'
>> ./include/linux/tty_port.h:1: warning: 'tty_port_tty_hangup' not found
>> ./include/linux/tty_port.h:1: warning: 'tty_port_tty_vhangup' not found
   ./include/linux/tty.h:245: warning: Function parameter or struct member 'break_wait' not described in 'tty_struct'
   ./drivers/usb/dwc3/core.h:804: warning: Function parameter or struct member 'nostream_work' not described in 'dwc3_ep'
   ./fs/eventpoll.c:2340: warning: Function parameter or struct member 'ep' not described in 'ep_get_upwards_depth_proc'
   ./fs/eventpoll.c:2340: warning: Function parameter or struct member 'depth' not described in 'ep_get_upwards_depth_proc'
   ./drivers/gpu/drm/amd/include/amd_shared.h:378: error: Cannot parse struct or union!


vim +/tty_port_tty_hangup +1 ./include/linux/tty_port.h

67b94be44771ab Jiri Slaby 2021-07-23 @1  /* SPDX-License-Identifier: GPL-2.0 */
67b94be44771ab Jiri Slaby 2021-07-23  2  #ifndef _LINUX_TTY_PORT_H
67b94be44771ab Jiri Slaby 2021-07-23  3  #define _LINUX_TTY_PORT_H
67b94be44771ab Jiri Slaby 2021-07-23  4  

:::::: The code at line 1 was first introduced by commit
:::::: 67b94be44771ab99bdbd019e19314f268fa1ff8c tty: move tty_port to new tty_port.h

:::::: TO: Jiri Slaby <jslaby@suse.cz>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

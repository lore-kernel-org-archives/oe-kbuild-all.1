Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794209927;
	b=qANJMokZ6AHeuwwwbLeawLSkiYZI8SPXzC2mAWTOiNjASP1dKe624zDM29Rwidt0UCJb
	 d9fc+FGclhZLjTJpnU2bhxQyq6JewCMp+uN1aKSJLRStUMrre19MVVZfly3BB5l7P9MzZ
	 UaaxZPrCmrHFMQanD5S/1k+asppijd5nmDRAWzpeUb+O/PHA6qbS1Xfw3nqLa9NL/69co
	 G8czA3aIh45FvRytstFWHvXC1DgM8/imyLnGeEh8uWQWP/MKwVeL9ua7IKtagL0yF/Ub0
	 /RqKjqc6/PqNynUYyTTe2eg8Gt6/WmExHTsUiVfl2WKd1wWGspR+1bHDSJEfPQcjVeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209927;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=6JU6xtFKthA2zRlJh7qdzdgFWV8F/Bo6cfjUwjZfQ30=;
	b=q2AMWAOaKCPb6hHdxyLgRwCyM17bpgYqSv81taXKqR4ALOnP5PjkF4A4pAO++/SgDpPt
	 FqYauDcP/h6SBJIAvFTUgEphAlHnjDgUYp6VI5Limo8bDOq2ffskZuCvMCKoHNZmbjnIC
	 jwMizOT2rRWHQn74XTqIzstYjrAF008r0TXhCDFXxb5YiWuxqNAwjBu4ssoJqR7XyBGcK
	 ScHa8ncozkhz94bg7Ll3RU5UmKLfAJhHyNxZ4hseQRahsk1j4PZNOPezjJFQVu5JYop7y
	 jjbNGZINVOKYCP+mmhccAeiC0XC++lZ0cRQ0IH47SjR17PP3E74aoRRGwU/LYj3cC5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NiVkkIqK;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5D4606B400
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 07:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A5D4606B400
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NiVkkIqK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794209926; x=1825745926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zwELtjam7GKqo85ZVynC3Qdp55nl/ZCftXuwpBrakY0=;
  b=NiVkkIqKfiANAI/4UPbSYLeJGZCMWRZlri1oKUzVWWEeefvj9lapvJs9
   bad0IfOhhQhxF1Q/t4kkjmeU5XnHyO0PdvLU6SX6ErUBkDJurf6W03pa+
   QIQD+hRFOP0uiL15xnFWs8/alzjgHv3d9tINYoq664KCALXXsUp+KniKD
   lJogvbw0FWajVShQ6D3P2dfk3xT3+LYloEHT1eB25fE55jYYBX4m+1dV3
   w8SvrcfPEAnMVG5YJ3NxPNH3ZOkXUoXXQkvVpnUV9POfeiVx8fYyoH0Tb
   O6RwUaX1R0r76RoVO/k2g4pLuyCupb5mdvGAHSgbUX63jr28WlZKLxHVc
   A==;
X-CSE-ConnectionGUID: T03V2proQh2ek1y9XTItjA==
X-CSE-MsgGUID: SwFswev5QNGhhctB806YaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3028792"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3028792"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 23:38:45 -0800
X-CSE-ConnectionGUID: L5JTDd+zSr24OJ5hnjurpA==
X-CSE-MsgGUID: vAo3WpwiR66RZNpemFn4Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7621623"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Nov 2026 23:38:45 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQJxh-00000000u6X-31uB;
	Mon, 09 Nov 2026 07:38:41 +0000
Date: Mon, 09 Nov 2026 15:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-maple-clean 47/50]
 include/asm-generic/vmlinux.lds.h:728:3: error: invalid preprocessing
 directive #BOUNDED_SECTION_BY
Message-ID: <202611091507.oAsYCMxY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-maple-clean
head:   5f7782a41d4ca319992609b6589a592f87e83006
commit: af718ee6a3256d73ee276d2c2bbbae9df0da6bfb [47/50] dyndbg: Save _ddebug_site fields into a maple-tree
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20261109/202611091507.oAsYCMxY-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091507.oAsYCMxY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091507.oAsYCMxY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/boot/compressed/decompress.c:20:
>> include/asm-generic/vmlinux.lds.h:728:3: error: invalid preprocessing directive #BOUNDED_SECTION_BY
     728 | # BOUNDED_SECTION_BY(.initcall.modnames, _initcall_modnames)
         |   ^~~~~~~~~~~~~~~~~~


vim +728 include/asm-generic/vmlinux.lds.h

   701	
   702	/* init and exit section handling */
   703	#define INIT_DATA							\
   704		KEEP(*(SORT(___kentry+*)))					\
   705		*(.init.data .init.data.*)					\
   706		KERNEL_CTORS()							\
   707		MCOUNT_REC()							\
   708		*(.init.rodata .init.rodata.*)					\
   709		FTRACE_EVENTS()							\
   710		TRACE_SYSCALLS()						\
   711		KPROBE_BLACKLIST()						\
   712		ERROR_INJECT_WHITELIST()					\
   713		CLK_OF_TABLES()							\
   714		RESERVEDMEM_OF_TABLES()						\
   715		TIMER_OF_TABLES()						\
   716		CPU_METHOD_OF_TABLES()						\
   717		CPUIDLE_METHOD_OF_TABLES()					\
   718		KERNEL_DTB()							\
   719		IRQCHIP_OF_MATCH_TABLE()					\
   720		ACPI_PROBE_TABLE(irqchip)					\
   721		ACPI_PROBE_TABLE(timer)						\
   722		THERMAL_TABLE(governor)						\
   723		EARLYCON_TABLE()						\
   724		LSM_TABLE()							\
   725		EARLY_LSM_TABLE()						\
   726		KUNIT_INIT_TABLE()						\
   727		DYNDBG_RO_SECTIONS()
 > 728	# BOUNDED_SECTION_BY(.initcall.modnames, _initcall_modnames)
   729	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

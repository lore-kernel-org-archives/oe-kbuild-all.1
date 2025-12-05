Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F57EDDAB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 20:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764965902; cv=none; b=QZRR1J0OBdXohHBIPiUg2eJ6zBokncOFI/xJccLuoMcXghZC99Z/WYjSmU7IREmwwtMLXUXJ52znSf5J4zDegqRKrtJe+6KNcwopHzGBNpKt8eIWM6f28L/XHcnDs9kR7ixSoA0pFMQ6QRqvAxym2lYqtv2JMMgfbOSngDiLOLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764965902; c=relaxed/simple;
	bh=ktY4yCwuPBwPD8D6ib4uaerTiPinn94K/PVzelABOGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o9CJRoouc3becX8MjI44GqIgcywDTCOelABpUeO1AkMVkSqqQEeO6oG66ZH4EY/SQyq8cOh1z1r87AHOOxS6+WW1vNGal7vCS6iEqFlC+ussrEgnlZ8X4TlzsNzQZEgcHuExYpGcRdjR5sdhIV3EZ5sFxpKNoeSL2g+QTJqsbew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikN+U8e9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikN+U8e9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764965900; x=1796501900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ktY4yCwuPBwPD8D6ib4uaerTiPinn94K/PVzelABOGM=;
  b=ikN+U8e99Yo6JZ6J3OosXr/GKyBdEniGRf/3is0ArZe3ZiBWM205c3us
   Vm0aRPMiMOCbWwP4vjPx+SRVaNoY/vAQc5uAUvtsebcbOsjwlVIcx7EWM
   SWIHl4RyeC43V6PrSNG1334KMkqetx3KsrVgEcefXkCvfJdryZcsMEwXf
   GQC4tG4XS/WTjgCTcg4tOPeA4tPlwlOj4BAghU+BIidZM7wF/FRt5rP+a
   VlOEBaJkxsspYaIg5wDRNryM2JnooThtHX1GcFJwgtdZ8hzgx7MvBAtS0
   EB+KOhS85DVRuaJUUb9DEZ/yYhh8p0OLnhR5noDhjJMq6G2peB+BXeiZx
   w==;
X-CSE-ConnectionGUID: YEdNJigmT0OyzT+J3HjAsw==
X-CSE-MsgGUID: UqNNt+X0Q2+BQUiPnSi+NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77328422"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="77328422"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 12:18:19 -0800
X-CSE-ConnectionGUID: GvQpuLC8R+izfkPhzt/83w==
X-CSE-MsgGUID: JSnMOM6BQvWDvvRq9fFwTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="195299139"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Dec 2025 12:18:18 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRcFs-00000000FVB-0esa;
	Fri, 05 Dec 2025 20:18:16 +0000
Date: Sat, 6 Dec 2025 04:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/no-macro-conv 25/25] kernel/time/jiffies.c:160:
 undefined reference to `proc_int_conv'
Message-ID: <202512060455.SEkBYosz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/no-macro-conv
head:   60075afc9fabecdb5b1015df21a05df3b2d50562
commit: 60075afc9fabecdb5b1015df21a05df3b2d50562 [25/25] sysctl: Remove SYSCTL_INT_CONV_CUSTOM macro and use explicit functions
config: xtensa-randconfig-r064-20251205 (https://download.01.org/0day-ci/archive/20251206/202512060455.SEkBYosz-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060455.SEkBYosz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060455.SEkBYosz-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: kernel/time/jiffies.o: in function `proc_dointvec_ms_jiffies':
>> kernel/time/jiffies.c:160: undefined reference to `proc_int_conv'
   xtensa-linux-ld: kernel/time/jiffies.o: in function `do_proc_int_conv_jiffies':
   kernel/time/jiffies.c:161: undefined reference to `proc_int_conv'
>> xtensa-linux-ld: kernel/time/jiffies.c:168: undefined reference to `proc_int_conv'
   xtensa-linux-ld: kernel/time/jiffies.o: in function `do_proc_int_conv_userhz_jiffies':
   kernel/time/jiffies.c:169: undefined reference to `proc_int_conv'
   xtensa-linux-ld: kernel/time/jiffies.c:176: undefined reference to `proc_int_conv'
   xtensa-linux-ld: kernel/time/jiffies.o:kernel/time/jiffies.c:177: more undefined references to `proc_int_conv' follow
   xtensa-linux-ld: kernel/time/jiffies.o: in function `do_proc_int_conv_ms_jiffies_minmax':
   kernel/time/jiffies.c:119: undefined reference to `proc_int_k2u_conv_kop'
   xtensa-linux-ld: kernel/time/jiffies.o: in function `sysctl_k2u_int_conv_hz':
   kernel/time/jiffies.c:120: undefined reference to `proc_int_k2u_conv_kop'
>> xtensa-linux-ld: kernel/time/jiffies.c:134: undefined reference to `proc_int_k2u_conv_kop'
   xtensa-linux-ld: kernel/time/jiffies.o: in function `sysctl_k2u_int_conv_userhz':
   kernel/time/jiffies.c:135: undefined reference to `proc_int_k2u_conv_kop'
   xtensa-linux-ld: kernel/time/jiffies.c:154: undefined reference to `proc_int_k2u_conv_kop'
   xtensa-linux-ld: kernel/time/jiffies.o:kernel/time/jiffies.c:155: more undefined references to `proc_int_k2u_conv_kop' follow
   xtensa-linux-ld: kernel/time/jiffies.o: in function `sysctl_k2u_int_conv_ms':
   kernel/time/jiffies.c:114: undefined reference to `proc_int_u2k_conv_uop'
   xtensa-linux-ld: kernel/time/jiffies.o: in function `sysctl_u2k_int_conv_hz':
   kernel/time/jiffies.c:115: undefined reference to `proc_int_u2k_conv_uop'
>> xtensa-linux-ld: kernel/time/jiffies.c:124: undefined reference to `proc_int_u2k_conv_uop'
   xtensa-linux-ld: kernel/time/jiffies.o: in function `sysctl_u2k_int_conv_userhz':
   kernel/time/jiffies.c:125: undefined reference to `proc_int_u2k_conv_uop'
   xtensa-linux-ld: kernel/time/jiffies.c:144: undefined reference to `proc_int_u2k_conv_uop'
   xtensa-linux-ld: kernel/time/jiffies.o:kernel/time/jiffies.c:145: more undefined references to `proc_int_u2k_conv_uop' follow
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen2.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen2.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o


vim +160 kernel/time/jiffies.c

   122	
   123	static int sysctl_u2k_int_conv_userhz(const bool *negp, const ulong *u_ptr, int *k_ptr)
 > 124	{
   125		return proc_int_u2k_conv_uop(u_ptr, k_ptr, negp, clock_t_to_jiffies);
   126	}
   127	
   128	static ulong sysctl_jiffies_to_clock_t(const ulong val)
   129	{
   130		return jiffies_to_clock_t(val);
   131	}
   132	
   133	static int sysctl_k2u_int_conv_userhz(bool *negp, ulong *u_ptr, const int *k_ptr)
 > 134	{
   135		return proc_int_k2u_conv_kop(u_ptr, k_ptr, negp, sysctl_jiffies_to_clock_t);
   136	}
   137	
   138	static ulong sysctl_msecs_to_jiffies(const ulong val)
   139	{
   140		return msecs_to_jiffies(val);
   141	}
   142	
   143	static int sysctl_u2k_int_conv_ms(const bool *negp, const ulong *u_ptr, int *k_ptr)
   144	{
   145		return proc_int_u2k_conv_uop(u_ptr, k_ptr, negp, sysctl_msecs_to_jiffies);
   146	}
   147	
   148	static ulong sysctl_jiffies_to_msecs(const ulong val)
   149	{
   150		return jiffies_to_msecs(val);
   151	}
   152	
   153	static int sysctl_k2u_int_conv_ms(bool *negp, ulong *u_ptr, const int *k_ptr)
   154	{
   155		return proc_int_k2u_conv_kop(u_ptr, k_ptr, negp, sysctl_jiffies_to_msecs);
   156	}
   157	
   158	static int do_proc_int_conv_jiffies(bool *negp, ulong *u_ptr, int *k_ptr,
   159					    int dir, const struct ctl_table *tbl)
 > 160	{
   161		return proc_int_conv(negp, u_ptr, k_ptr, dir, tbl, false,
   162				     sysctl_u2k_int_conv_hz, sysctl_k2u_int_conv_hz);
   163	}
   164	
   165	static int do_proc_int_conv_userhz_jiffies(bool *negp, ulong *u_ptr,
   166						   int *k_ptr, int dir,
   167						   const struct ctl_table *tbl)
 > 168	{
   169		return proc_int_conv(negp, u_ptr, k_ptr, dir, tbl, false,
   170				     sysctl_u2k_int_conv_userhz,
   171				     sysctl_k2u_int_conv_userhz);
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3BF1CEEAA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 07:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734332605; cv=none; b=Ly51AettILwvUXbJGBbXgLIpu7WR+Iu/ckCUrB71HvAO7ZcuuqSDuO/SvFRMXrxyskR1hKLyPNenF1eQRtlUs8MTbDj8dMgAUhivK5eSaWjUP/PteZTRu9w9vDCsC62EWi7z0zuYiRIOawFgSPkSA18uRpERZDufE9T4twZ8DPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734332605; c=relaxed/simple;
	bh=wTYQTLEAnS0MOVrMiUkVQyKKUHyBtksixCYZparOKEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f3XsURAxvhStDx1F2J6PmmdDL6IzUrW2PfmMKUwkZotII5SEOzxWZbT/byKiaYJIO4rw1EPymT9g96grdz+RjBRtCk252A9IrZ6KO7GcnyRxSI42LOBzTQkP5p5sPJyHDCPd3ghvmOqGSrqHJm2eflCFGs/kHwaiDq/atbHInWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABffi0pe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABffi0pe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734332604; x=1765868604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wTYQTLEAnS0MOVrMiUkVQyKKUHyBtksixCYZparOKEk=;
  b=ABffi0pe/EtXZTvOjg5EBuAe2dnla66Mm3VqsCM6PZNreygXKkeWy5A0
   K70pORdCwaWd6UzzFjkctbq3v7nmQoLFIq/IT9PUx6nuUJ3M+GAVzcr2r
   TLWfp8KnehN1f0Bp3LWxPd02n+RvF+ZDgdKat3Xmt9vYXTviDlzuLrEDL
   UP4iGDaePVB1/pKWRNQOHRMZYi+036IW27OPSFOK1S/wUjwrm21aZMueA
   z11kSC850e2xm4xa1XHaEKOQYmydmh6zNUEx+sq8MhKbV0E/0D7s0q6I4
   4vk9n6LEelyb6NHtWBlYaDoU4985sC2Ho/u+SqaezkqZWJYfI6gd5ZbmS
   g==;
X-CSE-ConnectionGUID: KyAi/43pRl2f3rwADG5tsg==
X-CSE-MsgGUID: fubZ81ULQ7i00PyJw5xK1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34584298"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34584298"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 23:03:23 -0800
X-CSE-ConnectionGUID: BLSf9J3/ROyBMmovjE0/UQ==
X-CSE-MsgGUID: +krNJQJJRgSq2XM0c0XFvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="96991233"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Dec 2024 23:03:21 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN58R-000E4w-2Q;
	Mon, 16 Dec 2024 07:03:19 +0000
Date: Mon, 16 Dec 2024 15:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_mpxy_mailbox_v1 15/15]
 include/linux/module.h:250:1: error: expected ',' or ';' before 'extern'
Message-ID: <202412161442.jLorQ7X9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_mpxy_mailbox_v1
head:   e3df0b6c23f2a7d94c095cd40ec22e09915ae150
commit: 2f17a72a2542bac2e6a2d9b393fa5f04572ea471 [15/15] clk: Add clock driver for the RISC-V RPMI clock service group
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20241216/202412161442.jLorQ7X9-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412161442.jLorQ7X9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161442.jLorQ7X9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/platform_device.h:13,
                    from drivers/clk/clk-rpmi.c:13:
>> include/linux/module.h:250:1: error: expected ',' or ';' before 'extern'
     250 | extern typeof(name) __mod_device_table__##type##__##name                \
         | ^~~~~~
   drivers/clk/clk-rpmi.c:574:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     574 | MODULE_DEVICE_TABLE(of, rpmi_clk_of_match);
         | ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/platform_device.h:13,
                    from clk-rpmi.c:13:
>> include/linux/module.h:250:1: error: expected ',' or ';' before 'extern'
     250 | extern typeof(name) __mod_device_table__##type##__##name                \
         | ^~~~~~
   clk-rpmi.c:574:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     574 | MODULE_DEVICE_TABLE(of, rpmi_clk_of_match);
         | ^~~~~~~~~~~~~~~~~~~


vim +250 include/linux/module.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  246  
cff26a51da5d20 Rusty Russell   2014-02-03  247  #ifdef MODULE
cff26a51da5d20 Rusty Russell   2014-02-03  248  /* Creates an alias so file2alias.c can find device table. */
^1da177e4c3f41 Linus Torvalds  2005-04-16  249  #define MODULE_DEVICE_TABLE(type, name)					\
054a9cd395a79f Masahiro Yamada 2024-11-20 @250  extern typeof(name) __mod_device_table__##type##__##name		\
cff26a51da5d20 Rusty Russell   2014-02-03  251    __attribute__ ((unused, alias(__stringify(name))))
cff26a51da5d20 Rusty Russell   2014-02-03  252  #else  /* !MODULE */
cff26a51da5d20 Rusty Russell   2014-02-03  253  #define MODULE_DEVICE_TABLE(type, name)
cff26a51da5d20 Rusty Russell   2014-02-03  254  #endif
^1da177e4c3f41 Linus Torvalds  2005-04-16  255  

:::::: The code at line 250 was first introduced by commit
:::::: 054a9cd395a79f4a5595f2cd24542e9bca8723c8 modpost: rename alias symbol for MODULE_DEVICE_TABLE()

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

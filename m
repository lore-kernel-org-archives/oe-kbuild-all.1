Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8CC3A3E8B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254064; cv=none; b=kfZ9XkckhvGj5eD0W+SjXYP71YfRRbzqbYmVW9rSUlbbO+JjAXjMFqI4tPxJv5wXQQDoRNbwaTNtqg/X3Os2KMZ3L8X1HjHbUYYWAzYUaVDlaj4ilo8SXqDPg8Pazy2pTeHY2WLiIjERzemDvRcNn2fGVOSf8aoBKS58uY/GZj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254064; c=relaxed/simple;
	bh=NO+jGpFGIMf6K8+wQapxoskxneWTmEQUAzjvtrlTahc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LukeZ8TVx1i3gy1zfm7QboQCvHYWf3YitgwYz9Le/U1Lw2Cmv9oLFbQkdQ9CJQgOfbb6g9a+Xy1RBSuU77/+LBO98g+v83J50sCDuAA1SNW9WJULHrYmbDkpbdZemzaz8TKajEyiJz/spJpe3G8mZwRloscTquNIZ8mkmjQXRsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F04u7MJd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F04u7MJd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790254062; x=1821790062;
  h=date:from:to:cc:subject:message-id;
  bh=NO+jGpFGIMf6K8+wQapxoskxneWTmEQUAzjvtrlTahc=;
  b=F04u7MJdacpoiWJk0RFITaxU9KjXqGzVCkoRLrruO6YjY0famnkmOmgS
   53Kcw8JtBYFbUYVmk9+eWSLgZWtTAOazCZAtAs2M1vEdygIBhlmbcNJNj
   aa8HNZ//j9o7PqzB81MCjChU6n40mIlPifUwreQpcNSXrh+oXceynyS/b
   x5agkACPww2ZxE/42kPWhGKUFkalVPcbTPpvvoob5Y6nbZgqm+yoL5QmN
   IMN1unPwZ0MsxWl8P+LMs0ZfEycr8wVbPQZ8Ei3YYwrrgampjkvMtLAm+
   prX6/F33KcronF4HJTiONbkQWoAbt9uwdfsVrvwGCWpQYTX+jhmwj0B8U
   Q==;
X-CSE-ConnectionGUID: C+87P4UkTZS7ddAGMe/Uog==
X-CSE-MsgGUID: iNk9i/QfSjO+Qi4av171Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101553365"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="101553365"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 05:47:41 -0700
X-CSE-ConnectionGUID: zOrXy4WBRLacLToKi4yXUQ==
X-CSE-MsgGUID: yYwO1icoSWm9pcNaoaWR9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="272603532"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Sep 2026 05:47:40 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9irR-00000000Ipu-3JFk;
	Thu, 24 Sep 2026 12:47:37 +0000
Date: Thu, 24 Sep 2026 20:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-panic 11/11]
 drivers/firmware/efi/libstub/efi-stub-helper.c:811:29: warning: variable
 'message' set but not used
Message-ID: <202609242057.WnypyJjY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-panic
head:   26122a1889cbac101c0fabcddf161a87db4ba38c
commit: 26122a1889cbac101c0fabcddf161a87db4ba38c [11/11] efi/libstub: Implement efi_panic()
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260924/202609242057.WnypyJjY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609242057.WnypyJjY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609242057.WnypyJjY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/efi-stub-helper.c:809:6: warning: no previous prototype for 'efi_check_panic' [-Wmissing-prototypes]
     809 | void efi_check_panic(void)
         |      ^~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:7,
                    from include/asm-generic/bug.h:31,
                    from arch/riscv/include/asm/bug.h:90,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/cmpxchg.h:9,
                    from arch/riscv/include/asm/barrier.h:14,
                    from include/linux/list.h:11,
                    from include/linux/list_lru.h:11,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/proc_fs.h:10,
                    from include/linux/efi.h:19,
                    from drivers/firmware/efi/libstub/efi-stub-helper.c:12:
   drivers/firmware/efi/libstub/efi-stub-helper.c: In function 'efi_check_panic':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects a matching 'long unsigned int' argument [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   drivers/firmware/efi/libstub/efistub.h:77:20: note: in expansion of macro 'KERN_WARNING'
      77 |         efi_printk(KERN_WARNING "WARNING: " fmt, ##__VA_ARGS__)
         |                    ^~~~~~~~~~~~
   drivers/firmware/efi/libstub/efi-stub-helper.c:826:17: note: in expansion of macro 'efi_warn'
     826 |                 efi_warn("Found panic report from previous boot (%lu bytes)\n");
         |                 ^~~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%a' expects argument of type 'double', but argument 2 has type 'const char *' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   drivers/firmware/efi/libstub/efistub.h:79:20: note: in expansion of macro 'KERN_ERR'
      79 |         efi_printk(KERN_ERR "ERROR: " fmt, ##__VA_ARGS__)
         |                    ^~~~~~~~
   drivers/firmware/efi/libstub/efi-stub-helper.c:838:25: note: in expansion of macro 'efi_err'
     838 |                         efi_err("%a(): Failed to allocate memory\n", __func__);
         |                         ^~~~~~~
   drivers/firmware/efi/libstub/efi-stub-helper.c:841:17: error: 'messsage' undeclared (first use in this function); did you mean 'message'?
     841 |                 messsage = p;
         |                 ^~~~~~~~
         |                 message
   drivers/firmware/efi/libstub/efi-stub-helper.c:841:17: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/firmware/efi/libstub/efi-stub-helper.c:811:29: warning: variable 'message' set but not used [-Wunused-but-set-variable=]
     811 |         const efi_char16_t *message;
         |                             ^~~~~~~


vim +/message +811 drivers/firmware/efi/libstub/efi-stub-helper.c

   808	
   809	void efi_check_panic(void)
   810	{
 > 811		const efi_char16_t *message;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

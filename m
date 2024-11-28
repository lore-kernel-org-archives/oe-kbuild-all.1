Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC661C173C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 17:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732815714; cv=none; b=MR83tFGNGeWF6BbZF6K/S50TQOh1bacW4V8CtRR1lbvS+43wZyyh5KwMfX7LwIFYS42hC1s6ao4OTTGVbx8H2pQZkvETg4YZdQD/ETsW+8AtUTdmOfBjeW2ok0LXGsRWH/PGZyYiyKYdge/npl0Eh22WwWJ6SdIrbJBbMYJDT1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732815714; c=relaxed/simple;
	bh=v5lcnT5L87NBohcEfucRTDdeHAY82WhyMP6mM8pk5vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cTkqpPkLALmGhC+C36/CRcQQw2cP5sRDBkm/HAYOydfi1gXYh45W99BuXtR20bGy4bbBLDhPkX5aMNSVKy/SCezbuguQTOMdPgs2qs23PKZtCuAj9U7K4ea2S7CjWaHKkpBAMrHX3UEgSkDlX5ouHUOwEIGFYloDibTKGv5cDic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hq/NvmZD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hq/NvmZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732815712; x=1764351712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v5lcnT5L87NBohcEfucRTDdeHAY82WhyMP6mM8pk5vQ=;
  b=hq/NvmZD4PJlK0uFOS4jRhCJvtLjibJzh+4ahhT+qERQte/+CgpPz4bN
   zsBOI24rRUi6kJdPUaOY/sqDjpxxOlEKtOQq/6xZqzSpF9uKEoFIlDaT6
   Esj+88L6sDQBV1nOZA+/Ts86taSD1cQWhDfyO87eNQVxRsERl6cN38JEZ
   zdWniJcMLWcY7t6eQLLH2fKHdOeFHbp7SCKc8PuqB2ddgoRwpBMrthK57
   vBfiWatnOID1BnvIMYBdpqaVLtaDWl7Rj1hD1dmgPJGfcZ43DxeqGAwwI
   VoUOkeXlH+EnuVylRyELkAUsl81SYHIcGtgSdoG6coFjEJkWMggGuoOxG
   A==;
X-CSE-ConnectionGUID: WrGMBpZ0TpqaK2dAX1OoJA==
X-CSE-MsgGUID: pQSNBBmVQkufr0goc6isgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36842481"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="36842481"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 09:41:50 -0800
X-CSE-ConnectionGUID: cUdZprNbTZOsk5UOa8/NDQ==
X-CSE-MsgGUID: QfiqWDK+Sq63foklUoUmlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="115571790"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Nov 2024 09:41:49 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGiWQ-0009sb-2i;
	Thu, 28 Nov 2024 17:41:46 +0000
Date: Fri, 29 Nov 2024 01:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, wangyuan <wangyuan46@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1315/1315]
 include/linux/uaccess.h:112:17: warning: 'qp_ctx' may be used uninitialized
Message-ID: <202411290122.mcPBFrhU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi wangyuan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 267bce716c1008522c3b8ddbeac8d3c65514e98f [1315/1315] crypto: hisilicon/qm - drop unnecessary IS_ENABLE(CONFIG_NUMA) check
config: arm64-randconfig-001-20241128 (https://download.01.org/0day-ci/archive/20241129/202411290122.mcPBFrhU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290122.mcPBFrhU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290122.mcPBFrhU-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/linux/poll.h:12,
                    from include/linux/rtc.h:52,
                    from include/linux/efi.h:20,
                    from arch/arm64/include/asm/acpi.h:15,
                    from include/acpi/acpi_io.h:7,
                    from include/linux/acpi.h:47,
                    from drivers/crypto/hisilicon/qm.c:4:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'hisi_qm_uacce_ioctl' at drivers/crypto/hisilicon/qm.c:2280:7:
>> include/linux/uaccess.h:112:17: warning: 'qp_ctx' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:265,
                    from arch/arm64/include/asm/memory.h:24,
                    from arch/arm64/include/asm/page.h:52,
                    from drivers/crypto/hisilicon/qm.c:3:
   include/linux/kasan-checks.h: In function 'hisi_qm_uacce_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/crypto/hisilicon/qm.c:2277:28: note: 'qp_ctx' declared here
    2277 |         struct hisi_qp_ctx qp_ctx;
         |                            ^~~~~~
   drivers/crypto/hisilicon/qm.c:3322: warning: Excess function parameter 'ce' description in 'qm_hw_error_init'
   drivers/crypto/hisilicon/qm.c:3322: warning: Excess function parameter 'nfe' description in 'qm_hw_error_init'
   drivers/crypto/hisilicon/qm.c:3322: warning: Excess function parameter 'fe' description in 'qm_hw_error_init'
   drivers/crypto/hisilicon/qm.c:3322: warning: Excess function parameter 'msi' description in 'qm_hw_error_init'


vim +/qp_ctx +112 include/linux/uaccess.h

d597580d373774 Al Viro        2017-03-20  104  
d597580d373774 Al Viro        2017-03-20  105  #ifdef INLINE_COPY_FROM_USER
d597580d373774 Al Viro        2017-03-20  106  static inline unsigned long
d597580d373774 Al Viro        2017-03-20  107  _copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  108  {
d597580d373774 Al Viro        2017-03-20  109  	unsigned long res = n;
9c5f6908de03a4 Al Viro        2017-06-29  110  	might_fault();
4983cb67a383a7 Linus Torvalds 2019-02-14  111  	if (likely(access_ok(from, n))) {
9c5f6908de03a4 Al Viro        2017-06-29 @112  		kasan_check_write(to, n);
d597580d373774 Al Viro        2017-03-20  113  		res = raw_copy_from_user(to, from, n);
9c5f6908de03a4 Al Viro        2017-06-29  114  	}
d597580d373774 Al Viro        2017-03-20  115  	if (unlikely(res))
d597580d373774 Al Viro        2017-03-20  116  		memset(to + (n - res), 0, res);
d597580d373774 Al Viro        2017-03-20  117  	return res;
d597580d373774 Al Viro        2017-03-20  118  }
d597580d373774 Al Viro        2017-03-20  119  #else
d597580d373774 Al Viro        2017-03-20  120  extern unsigned long
d597580d373774 Al Viro        2017-03-20  121  _copy_from_user(void *, const void __user *, unsigned long);
d597580d373774 Al Viro        2017-03-20  122  #endif
d597580d373774 Al Viro        2017-03-20  123  
d597580d373774 Al Viro        2017-03-20  124  #ifdef INLINE_COPY_TO_USER
d597580d373774 Al Viro        2017-03-20  125  static inline unsigned long
d597580d373774 Al Viro        2017-03-20  126  _copy_to_user(void __user *to, const void *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  127  {
9c5f6908de03a4 Al Viro        2017-06-29  128  	might_fault();
4983cb67a383a7 Linus Torvalds 2019-02-14  129  	if (access_ok(to, n)) {
9c5f6908de03a4 Al Viro        2017-06-29  130  		kasan_check_read(from, n);
d597580d373774 Al Viro        2017-03-20  131  		n = raw_copy_to_user(to, from, n);
9c5f6908de03a4 Al Viro        2017-06-29  132  	}
d597580d373774 Al Viro        2017-03-20  133  	return n;
d597580d373774 Al Viro        2017-03-20  134  }
d597580d373774 Al Viro        2017-03-20  135  #else
d597580d373774 Al Viro        2017-03-20  136  extern unsigned long
d597580d373774 Al Viro        2017-03-20  137  _copy_to_user(void __user *, const void *, unsigned long);
d597580d373774 Al Viro        2017-03-20  138  #endif
d597580d373774 Al Viro        2017-03-20  139  
d597580d373774 Al Viro        2017-03-20  140  static __always_inline unsigned long __must_check
d597580d373774 Al Viro        2017-03-20  141  copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  142  {
b0377fedb65280 Al Viro        2017-06-29  143  	if (likely(check_copy_size(to, n, false)))
d597580d373774 Al Viro        2017-03-20 @144  		n = _copy_from_user(to, from, n);
d597580d373774 Al Viro        2017-03-20  145  	return n;
d597580d373774 Al Viro        2017-03-20  146  }
d597580d373774 Al Viro        2017-03-20  147  

:::::: The code at line 112 was first introduced by commit
:::::: 9c5f6908de03a4f52ba7364b11fcd6116225480c copy_{from,to}_user(): move kasan checks and might_fault() out-of-line

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

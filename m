Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A1D242910
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 21:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817723; cv=none; b=PuOoi1b8p2601PSMt7w3H1bNq/+DTEWFmGYpL4Q/zFI2TxSeJ1LzYHtzt6+m63rlLILX7DXVmnAQKwJkJN/TbUEfpYvpWJ+N/vzMv3alGKhfThM3Q54wlic4wV2yBR/uq4fNztW6JgLmLCaWnV4A0SlOkihUCvHWRDx8XRC8if8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817723; c=relaxed/simple;
	bh=8qatH9TpCKAIFwoMIsC9yDtfCpYAXYXoAyc3I08P/xo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o79hx/K9ZI887XAAY3qWHpYjR5DwnM3h3i93Yn5jPAiZodWIoAJMJYO9kyQ9gC6PU86/mxN6/oRyNgCRd+dBq6Wybzt2+lwrDvEupTzXht5W+IGOmZPRJp3aoKvJIQgasQtTEBQKsv3ME8k5WKpQk6p/vkyWlaziFvZU8MzE2eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCtKp7UY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCtKp7UY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788817722; x=1820353722;
  h=date:from:to:cc:subject:message-id;
  bh=8qatH9TpCKAIFwoMIsC9yDtfCpYAXYXoAyc3I08P/xo=;
  b=SCtKp7UYjnKmhX9YLAzWO9WYm6Is3dYRiHTkxlYtBm/tZc8FOzXKvyrM
   8gw5bq8udVWv4GQnSLoo6mcbdPJs1f2zr6X0epYHycyxxrxW0UWDWgP6J
   7nHuaJYZb52/xFargc/QuDtCsnkVmFybxBpiFHOzcz9iP+K3F0dRqPmOg
   DqdFJHHmxHqWpWSrCeDQAItzEZmH9jb8eIofh1HdfZgPwfZfWETj2gxlY
   y0q9RsQxwOctoMcjne8bWEItRZ8xuh0NW5oSPpE08LVuajevgrCQ4+ZYp
   owrsoW0wRHSiTMbFACjZASu+t6kQWk7sbcKCsjyep00hplawj14ov5pJr
   A==;
X-CSE-ConnectionGUID: HMnYp4+xQIyAlZM95vlB2g==
X-CSE-MsgGUID: TECXhVgQQr6J1hfmCRGeLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89264063"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89264063"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 14:48:41 -0700
X-CSE-ConnectionGUID: 7AjfWg3mTXSruXA5l8W/eQ==
X-CSE-MsgGUID: wtnBpaGWQV2BLYOhxU2OjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="270777128"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Sep 2026 14:48:40 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3hCg-000000001LD-0HIl;
	Mon, 07 Sep 2026 21:48:38 +0000
Date: Tue, 08 Sep 2026 05:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-libstub-native-utf16 9/9]
 drivers/firmware/efi/libstub/vsprintf.c:511:5: warning: no previous prototype
 for 'efi_snprintf'
Message-ID: <202609080541.1c9kYF5X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-libstub-native-utf16
head:   c23f326a96b5293512720f389c597f967132c334
commit: 7046b0d50cf479b4122a5b0ab2f03ac07cd0de22 [9/9] efi/libstub: Add efi_snprintf() to construct wide strings
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260908/202609080541.1c9kYF5X-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080541.1c9kYF5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080541.1c9kYF5X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/vsprintf.c:274:5: warning: no previous prototype for 'efi_vsnprintf' [-Wmissing-prototypes]
     274 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char *fmt, va_list ap,
         |     ^~~~~~~~~~~~~
>> drivers/firmware/efi/libstub/vsprintf.c:511:5: warning: no previous prototype for 'efi_snprintf' [-Wmissing-prototypes]
     511 | int efi_snprintf(efi_char16_t *buf, size_t size, const char *fmt, ...)
         |     ^~~~~~~~~~~~


vim +/efi_snprintf +511 drivers/firmware/efi/libstub/vsprintf.c

   510	
 > 511	int efi_snprintf(efi_char16_t *buf, size_t size, const char *fmt, ...)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

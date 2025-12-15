Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F9032FA08
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797060; cv=none; b=aoqBBCc0qTSCzA0j7xARFINrjtptkdv8LrDzFB3bEvkbCzKM5qIOtoauB2yzR5OEPchH94RFPGDwkd2zgG6YNfqxLzBeRW65BAKCmMLbCy6+Tm4iSWcs27pzWjH34yg2brpT2K0vi0NpIQWhlQXl/8lIEKwLiww51jqxP1X+qCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797060; c=relaxed/simple;
	bh=fbMKxc0SVnBb8JSXZJSEzYc7HsERg6okOebVEE0dkJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lxbmvOoov90wqzS7Ku4B575PfuJVQAf5gSF4sRFAuRsjpEmSruxjJpBqgSOQeeGYoL2ujToTzoROqvSyxba3xWGpwyzuRehTSzCw3CttCUNdMwOdGNA5EeJKT+lUy4r/9MeFEGnFD1AJPTb3F+Kut3T48G/3YIOsYIlCjLaiR9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SitPwY53; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SitPwY53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765797058; x=1797333058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fbMKxc0SVnBb8JSXZJSEzYc7HsERg6okOebVEE0dkJA=;
  b=SitPwY53QDHBUsMjiXcp7uO2CXGOT37OZbGQ5sCQ/D0/Bi7NMkbXSZIO
   rg1SBWroCmzQ7/aYYSSZBXeY6q3qoxLccIp2FqFmz0XLZ3X1KWXDVzhos
   L4S8CubkovZOKNwvJQTCWfTlxebqM4DQOYLEMuLEcISAfDJB3rsMRZZ7H
   pLuX4gHQ6+giPYIFguNj7AdI2XXkE0u8tkYuxk/YstT2nCvx9s+T5Uqqw
   qFeoFADqEsfWvP7oXKvAvDWV6o/GZY8bc/IOpqtd9qy15M4BhA5c2V1Eh
   X2WQB/ybhIkLINLCGPT/Imnr8FuYzZyhaSpZVKodTxNuGE/jEMpgKA1FB
   A==;
X-CSE-ConnectionGUID: FCREeNgaRUGHdZEer5rSeQ==
X-CSE-MsgGUID: E+wpkHwZQzWHMO09cTIowQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85105849"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="85105849"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:10:57 -0800
X-CSE-ConnectionGUID: yNVK6Xh4SS+NzjJZBv97rA==
X-CSE-MsgGUID: pjFLkUHxSdGotIoQV1tPiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="201881749"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 15 Dec 2025 03:10:57 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV6Te-000000002d2-06VA;
	Mon, 15 Dec 2025 11:10:54 +0000
Date: Mon, 15 Dec 2025 12:10:18 +0100
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 12/16] error[E0425]: cannot find function
 `i2c_del_driver` in crate `bindings`
Message-ID: <202512151235.RZy9PbKu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   a8811acb11ba01eb88a548d40735773355424255
commit: 3ba70776dd9c02b64ba2b9dd8541be5da1126f4e [12/16] x86: Use PIE codegen for the core kernel
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251215/202512151235.RZy9PbKu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151235.RZy9PbKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151235.RZy9PbKu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `i2c_del_driver` in crate `bindings`
   --> rust/kernel/i2c.rs:142:28
   |
   142 |         unsafe { bindings::i2c_del_driver(idrv.get()) }
   |                            ^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `i2c_get_adapter` in crate `bindings`
   --> rust/kernel/i2c.rs:396:55
   |
   396 |         let adapter = NonNull::new(unsafe { bindings::i2c_get_adapter(index) }).ok_or(ENODEV)?;
   |                                                       ^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `i2c_get_adapter` in crate `bindings`
   --> rust/kernel/i2c.rs:413:28
   |
   413 |         unsafe { bindings::i2c_get_adapter(self.index()) };
   |                            ^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `i2c_unregister_device` in crate `bindings`
   --> rust/kernel/i2c.rs:577:28
   |
   577 |         unsafe { bindings::i2c_unregister_device(self.0.as_ptr()) }
   |                            ^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `pci_free_irq_vectors` in crate `bindings`
   --> rust/kernel/pci/irq.rs:170:28
   |
   170 |         unsafe { bindings::pci_free_irq_vectors(self.dev.as_raw()) };
   |                            ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `udelay` in crate `bindings`
   --> rust/kernel/time/delay.rs:84:19
   |
   84 |         bindings::udelay(delta.as_micros_ceil() as c_ulong)
   |                   ^^^^^^ not found in `bindings`
   |
   help: consider importing this function
   |
   10 + use crate::time::delay::udelay;
   |
   help: if you import `udelay`, refer to it directly
   |
   84 -         bindings::udelay(delta.as_micros_ceil() as c_ulong)
   84 +         udelay(delta.as_micros_ceil() as c_ulong)
   |
--
>> error[E0425]: cannot find function `interface_to_usbdev` in crate `bindings`
   --> rust/kernel/usb.rs:359:42
   |
   359 |         let usb_dev = unsafe { bindings::interface_to_usbdev(self.as_raw()) };
   |                                          ^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `usb_put_dev` in crate `bindings`
   --> rust/kernel/usb.rs:429:28
   |
   429 |         unsafe { bindings::usb_put_dev(obj.cast().as_ptr()) }
   |                            ^^^^^^^^^^^ not found in `bindings`
--
>> error[E0282]: type annotations needed for `core::ptr::NonNull<_>`
   --> rust/kernel/i2c.rs:396:13
   |
   396 |         let adapter = NonNull::new(unsafe { bindings::i2c_get_adapter(index) }).ok_or(ENODEV)?;
   |             ^^^^^^^
   ...
   400 |         Ok(unsafe { (&*adapter.as_ptr().cast::<I2cAdapter<device::Normal>>()).into() })
   |                                         ---- type must be known at this point
   |
   help: consider giving `adapter` an explicit type, where the type for type parameter `T` is specified
   |
   396 |         let adapter: core::ptr::NonNull<T> = NonNull::new(unsafe { bindings::i2c_get_adapter(index) }).ok_or(ENODEV)?;
   |                    +++++++++++++++++++++++

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

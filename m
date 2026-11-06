Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994100;
	b=hEDFpYVhgFnxCfErd8FoY/K604JopsN1TtAdVdfSvW0vq33dJCuE4oEHnzOokBI1zBA4
	 jTL96Y5mi+3EBkS2rfdYdkSaos3taqqYJHmoMHAYMLFQma8iKPd9fXdub1FF+K8zPoM/S
	 cVCoUPKejAGY1WkV3R6Nb3IsozMDGkBpthjKADW4WBwSQby2ARTNkKJBAZU4UvEPm2RbG
	 OlrjFhO2I3s8g9/p0P7DH6CPf0O+6+s+WLmP0u1bR8NBAPufn8sNYImV66zQYo4hQGpOG
	 dYUjq5+ohL3uzWMpy6ak7i8DtJn9VYmlTagycda6HBM5v6uCzy95RTFEOjTeRhQTsbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994100;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kPYnzKsCezx9klAfWF69tQDpjsKl1fxU0PsuHm4EPn8=;
	b=StbipZ7bG1diNz8ad+/kpEi2M5jsMHj0xX1LoyRx6EL52xxlfir8ckkGg3yOY1eC+fY7
	 Y2k7Gwu+6l8nFjxDDoWjz+N3DZKbCIj2rud7hvLOLGfi2Tl6mLzBo7oUr7NUQmwozEoi0
	 vQBO56NNPRxRIIoZJ31Vwt+B+gFww8hL4unzxGVU74wzhcA1uhGAF2dvDNGZ1TU7lcHK+
	 r0LQZG4kOQ3DWHbEYqKP0zr18/erRaxgU0dabWGDc+7AltdxPz+rXnY4aduFaA4cvLMMj
	 ENB7O6ad4j57fIMApfACT1m/DsFtuHsUwiQDt/fdP60/ZHTgYhL1f8G+EdBpV0aYsDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JPVpAp5X;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F63606D812
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 19:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9F63606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JPVpAp5X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793994100; x=1825530100;
  h=date:from:to:cc:subject:message-id;
  bh=8NYsY5LS5YysIdqHvLuvm6y10d+JDyLcOS7i2UyNj6s=;
  b=JPVpAp5XE1P72gRULCp3zJFiSdMXxn2J/Y+sQ99XQbF5ELA7J5m2wTmh
   sS8hynkp9GDfnxAJEF/soH39dJF5GiGSi4CUn/2OSiy9IFnvf/SgBbJwL
   frxO4Z/dJN9uGDuOhasGvOO48dQUu+1//1uHFpcK2ImRzK23Vqi7eTB+H
   Z8+KP8+bbETePXNeZjXESCnP83EXFvqZ3xQ5Uey3DPzktOWQh3t3mXzpm
   OOy4ecOtSS7TFmuudvQE2MOQH8Mt8yBSeZrMhe/PeijeTr5UeliVVeB4W
   NCe824P5h1SM40oUnDTyC1wi4gY60BVKztWnBCWXJ4Ac27rLalAmEO0c3
   g==;
X-CSE-ConnectionGUID: 3kmtXgCvSO6eeVCKhitOdw==
X-CSE-MsgGUID: mcQOw4z8Q1y29HhpO9nGCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2915252"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2915252"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 11:41:39 -0800
X-CSE-ConnectionGUID: BXE39mR1TxaQFNCUs0domA==
X-CSE-MsgGUID: tRBy/kc0TyCLMXM5SkWPLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7248337"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2026 11:41:37 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPPoc-00000000ALX-2eBe;
	Fri, 06 Nov 2026 19:41:34 +0000
Date: Fri, 06 Nov 2026 20:40:56 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 39/56] warning: could not
 parse code block as Rust code
Message-ID: <202611062024.puM6nqyA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: edc992b67167295cef057cda20bae7ea553e8fac [39/56] rust: usb: add ALSA-specific USB abstraction extensions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261106/202611062024.puM6nqyA-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611062024.puM6nqyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611062024.puM6nqyA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: could not parse code block as Rust code
   --> rust/kernel/usb.rs:1463:5
   |
   1463 |   /// ```ignore
   |  _____^
   1464 | | /// Returns the USB interface with the given interface number, if any.
   1465 | | ///
   1466 | | /// This is a thin wrapper around `usb_ifnum_to_if`, needed by audio class
   ...    |
   1471 | | /// The returned reference borrows from the device; the interface pointer is
   1472 | | /// valid as long as the USB device is bound.
   | |_____________________________________________^
   |
   help: `ignore` code blocks require valid Rust code for syntax highlighting; mark blocks that do not contain Rust code as text: ```text
   --> rust/kernel/usb.rs:1463:5
   |
   1463 | /// ```ignore
   |     ^^^
   = note: error from rustc: unknown start of token: `
   = note: error from rustc: unknown start of token: `
   = note: `#[warn(rustdoc::invalid_rust_codeblocks)]` on by default
--
>> warning: Rust code block is empty
   --> rust/kernel/usb.rs:1517:5
   |
   1517 | /// ```
   |     ^^^
   |
   help: mark blocks that do not contain Rust code as text
   |
   1517 | /// ```text
   |        ++++

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

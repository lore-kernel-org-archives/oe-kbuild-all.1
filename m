Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999269;
	b=jmRkN03ZO4doFBlJOF2eV3JHvADtD9m8ZfG5K+En/57xoG6I3jGPwxhVKk9m2GB3Ma0l
	 D/HOGxfxBtqii7VY/EOmudf5Sxm1s9OUfq33FnEV5DzgEVr2hMG7wIEVixg6fcnVLmBdI
	 vSMHXvVFt4zRgrmi0y0xo3dIij2OGrURml59qrUMCTD1qXoTkf99rHB2SPeV2sAcB7E+f
	 uiL3uwOzmYYYp2zQEdDHf3qU9YxuuAnCYoyF8ggx4ILM1LJQ1enYmCMjuRloyJxR0E040
	 jEn7XyD3VT0uhoUgZfkLY20y4aCAqsUgLnoVrQJLXkwihIbn1ayIurcF4qUwM2qB03w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999269;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/QgMqsXdrD5pQBjw+QmxeYsM3qVWGrGugb5ktgLWmnM=;
	b=h+FG1/NU75NjMJ/84xJiQHOF1YeaY749F9/X7R0ZIlWH2+JEoYLl7uWxHQk1dkFf6y8Z
	 mC7pRbxc/g0tvSBfI4EVbqyy5L4rb5vq7UVRzIiSBduSbzzG8Gon3350eONut7S5Sq0Uy
	 Si2PgADhCZdAI1ah2de4WmHwWs8ZpyNeZYvXxd8NyBygR/U4aiIX66p/hkCRtiqY4kdxe
	 5zy0bnWFUD6lHDtzoLtuviJzm1yAIF89pLlmEW/tnNJ74zw5luB0A+3vYRWcuVFUM3M+A
	 evKhbt8SKYZCli73yrBhV/2UWX+eW5ibBvXFMJMe1vu59l+dJdPUAjkVUi2e8rKSN8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KT04e51X;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC607606A32C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 21:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC607606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KT04e51X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793999268; x=1825535268;
  h=date:from:to:cc:subject:message-id;
  bh=mNWXcQyMHSHmYjjF+ErQ3qO51LSnxf+/Umo4VPw+vMw=;
  b=KT04e51XQo3AL9gKnhe5zhP3p4fUm+gSy6QYZUEY0fK8pH63jBRt9kGM
   8G2he0bs5m++uJ+PNbwFRFaentVXcHdZAoT+7QIR8H4Q0JaQnwUiL7O+8
   1qs7NEUEdekb3rWkRRjchjQClu3Edq+XwP3FOq1JyNKpokS2B5FHJJCTf
   63mLZEbvTo79jaNuSdNGO97hjj8aQDng4zfRUJ/sKrXBYeb9CIzxi9UkV
   UQi6r2NFVw8t87iWXf7ieFLIL8HqczUaREzzp2KVsSwhZYLTR6MBadbLz
   qPS+3vmAk+iTS+dJjcv4GviuzQujzKBFy61rk9xL5Z/vKB3FEuae489yU
   w==;
X-CSE-ConnectionGUID: ihFg6glbQOSDJ1C9YWPt6g==
X-CSE-MsgGUID: pvNiLMe2TByGa4Jd9YH7dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2719718"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2719718"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 13:07:45 -0800
X-CSE-ConnectionGUID: rK9lnQn2Sr+Jb19rR5bmmw==
X-CSE-MsgGUID: rk7JVfquQmuss6a8ocNDpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7355638"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2026 13:07:43 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPR9x-00000000AMj-0CNf;
	Fri, 06 Nov 2026 21:07:41 +0000
Date: Fri, 06 Nov 2026 22:06:54 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 42/56] warning: `as`
 casting between raw pointers without changing their constness
Message-ID: <202611062249.snPBEWys-lkp@intel.com>
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
commit: b172ad8bf456b4d29c21afeebf24dba090c8a62e [42/56] rust: usb: Add safe mutable isochronous methods to Urb and UrbData
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261106/202611062249.snPBEWys-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611062249.snPBEWys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611062249.snPBEWys-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/usb.rs:883:21
   |
   883 |                     urb.transfer_buffer as *mut u8,
   |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `urb.transfer_buffer.cast::<u8>()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#ptr_as_ptr
   = note: requested on the command line with `-W clippy::ptr-as-ptr`
--
>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/usb.rs:913:21
   |
   913 |                     urb.transfer_buffer as *mut u8,
   |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `urb.transfer_buffer.cast::<u8>()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#ptr_as_ptr
--
>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/usb.rs:982:24
   |
   982 |         unsafe { &mut *(self.urb.as_ptr() as *mut Urb<T>) }
   |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `self.urb.as_ptr().cast::<Urb<T>>()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#ptr_as_ptr

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

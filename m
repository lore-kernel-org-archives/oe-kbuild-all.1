Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE834A23
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374003; cv=none; b=gAxGTg8PramSz8IcSe6KOn4//+iLObFvj1vxsziXZv0/uxJYTYKwXs4QhuLoEp25h6IM1ac50yFxEu9CXAnLKR2BJSXarx8dYKqSWNT+bf0Vl7X3qBIaGoLHqHkHJy3XWci2k0E63ddREuAC+VGpENf7LQQG9H916r9ZioXoTjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374003; c=relaxed/simple;
	bh=hQdRp4ob6vvZa9G1DO/UHUttmwjYclzcgb9vZ6HBmdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KUw0lsqVRN/pGL66/Q9rYdFSXAA6/z5vp9tMe05QoFbff0aRcOzKAfXpG1RGXKYyJpwTSfPWafgh6o1YcC3SV4Wb5oZhivy6EjATDGUc6+gZgeCPqspTjbrGTxvky19bdwjMp9EZMzvYDfXMAdSkjL4GV0zyDMlvahxpLyWUP4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUpDTxsA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUpDTxsA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751374003; x=1782910003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hQdRp4ob6vvZa9G1DO/UHUttmwjYclzcgb9vZ6HBmdw=;
  b=UUpDTxsALaHl/+iA2YyI/xPpSAeszg5zlct2PbzDF2oV675pAz48GnD5
   kaHu0zBfuSVcOM434Gub6rJtA+JTc2vXVKoRO7Livs+CfcwJKv8+Yz845
   AXVe4/431fdg3K5vkJmaV1MDxa5BrJYAPYV6AnPEGYOSD/BzmBC8MAZT+
   dKluJ9n6zH8g1RkLqlH5/uCyZN+cElgaLT2CA5s0MmLoJ7hyqCMtrqG4N
   b+sQ8QLhB0ibAH3mVh6Ed4YfD9megmFV6e7pJeYM3aq/KkdQCUT1OlkSX
   pDlUuB1lsGKIQHRbqtcsYVWhU5+9/vOjcJxrwEbz53fdNAKPbkM8hRX/z
   Q==;
X-CSE-ConnectionGUID: OAPxEkfJSx23imaYHhSshg==
X-CSE-MsgGUID: gXXLnk7YRNCg6wu63LzbTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53501088"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53501088"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 05:46:33 -0700
X-CSE-ConnectionGUID: Yrtyu+RTQ364Ni8a42ldEA==
X-CSE-MsgGUID: FvkMxUQiTMuJW0BgCORx+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="157793287"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Jul 2025 05:46:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWaNZ-000a9q-2c;
	Tue, 01 Jul 2025 12:46:29 +0000
Date: Tue, 1 Jul 2025 20:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, John Hubbard <jhubbard@nvidia.com>
Subject: [jfern:nova/master 67/87] Diff in drivers/gpu/nova-core/regs.rs at
 line 204:
Message-ID: <202507012005.8qhLTyif-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/master
head:   dfa2b234298399a62d48d2a78ce8f3f58d21cda1
commit: 4ded3836543309dc0cf93d6308511f1b45f3f2b5 [67/87] nova-core: falcon: Add support to write firmware version
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250701/202507012005.8qhLTyif-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507012005.8qhLTyif-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507012005.8qhLTyif-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j28 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/regs.rs at line 204:
        31:0    value as u32;
    });
    
   -
    // Used to store version information about the firmware running
    // on the Falcon processor.
    register!(NV_PFALCON_FALCON_OS @ +0x00000080 {
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 1:
    // SPDX-License-Identifier: GPL-2.0
    
   -use kernel::time::Delta;
    use kernel::prelude::*;
   +use kernel::time::Delta;
    
    use crate::{
        driver::Bar0,
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 28:
    
        /// Function to check if GSP reload/resume has completed during the boot process.
        #[expect(dead_code)]
   -    pub(crate) fn check_reload_completed(
   -        &self,
   -        bar: &Bar0,
   -        timeout: Delta,
   -    ) -> Result<bool> {
   +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
            wait_on(timeout, || {
                let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
                if val.boot_stage_3_handoff() {
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 1:
    // SPDX-License-Identifier: GPL-2.0
    
   -use kernel::time::Delta;
    use kernel::prelude::*;
   +use kernel::time::Delta;
    
    use crate::{
        driver::Bar0,
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 28:
    
        /// Function to check if GSP reload/resume has completed during the boot process.
        #[expect(dead_code)]
   -    pub(crate) fn check_reload_completed(
   -        &self,
   -        bar: &Bar0,
   -        timeout: Delta,
   -    ) -> Result<bool> {
   +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
            wait_on(timeout, || {
                let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
                if val.boot_stage_3_handoff() {
>> Diff in drivers/gpu/nova-core/regs.rs at line 204:
        31:0    value as u32;
    });
    
   -
    // Used to store version information about the firmware running
    // on the Falcon processor.
    register!(NV_PFALCON_FALCON_OS @ +0x00000080 {
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 1:
    // SPDX-License-Identifier: GPL-2.0
    
   -use kernel::time::Delta;
    use kernel::prelude::*;
   +use kernel::time::Delta;
    
    use crate::{
        driver::Bar0,
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 28:
    
        /// Function to check if GSP reload/resume has completed during the boot process.
        #[expect(dead_code)]
   -    pub(crate) fn check_reload_completed(
   -        &self,
   -        bar: &Bar0,
   -        timeout: Delta,
   -    ) -> Result<bool> {
   +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
            wait_on(timeout, || {
                let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
                if val.boot_stage_3_handoff() {
   make[2]: *** [Makefile:1825: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

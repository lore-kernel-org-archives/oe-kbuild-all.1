Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BBA26A0FC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 10:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751366595; cv=none; b=E8k4TuAXoAtqtmR+K1w472xG6tdX0HhQCREE8l1s4uUsozh+epSaZk0jycTOUBfGTMMtnUpMmIk44nJZ9JnNvX3vHzgYz6AbWnvnEsNpueo/G76ITwdUnLYIY3XP5pX5uj2wcwBpnyF9P+pnb+B1+5JTucCD5uZuEB27JWFDibk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751366595; c=relaxed/simple;
	bh=l/4PizZzQIKzcOfs7URCC/wywMWbISlOmXS51ctuSb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SPocFTlmA5XFxxzCW0g8VZ3Oh/aNNXvcwa54ydOBMU3bmjrowe89q7zjwMx1mIAOscYLXzOgViNMm2BPtVIlJ3BkYfpsd4Hkns7uPxuiHSEwm5mECKFnqsaUlv3FBoJssOq3baJLGfO4W0aQZL/gEDbsV1TKmuL5xHEnxpTCtjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfOBytap; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfOBytap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751366594; x=1782902594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/4PizZzQIKzcOfs7URCC/wywMWbISlOmXS51ctuSb0=;
  b=JfOBytapE9zbgo2LO2sCTc0dXrXj+JjYsmxTqe3MDqDGYv+WESybpgy/
   yuKCYOT2xKvDkpycbZtdNXToMavYn9aavSz6TL+C9kjzE8KKlWt0sa0Ey
   420yM8TXJ24F1UbjxTy1bJVV64u4eS3bA7xAA2cfb0SUoOIxZsBeGTOli
   YRdTMcB5tMz2Du1wpof6VMGEO7wSnip5wzmIoUAgRkebX80DW/zKog2Az
   3kCDZ/bOILu1Djf0zu4NZpmKcCYjoqyyvwyEW4M5YXoOMz3EhKIbcIv8L
   ZFsvGbRpAODVIlRiu/RbLxK57wIgDk0Cgy+rAvPcoHdfMVS1Y9yIzxJI1
   w==;
X-CSE-ConnectionGUID: wv940JR8RLCSEBtfLU0TcA==
X-CSE-MsgGUID: QxfxOg4QSzSd9t2Gc/kGjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64679057"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="64679057"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 03:43:13 -0700
X-CSE-ConnectionGUID: +ppM86PaRdmPryciMO3xBg==
X-CSE-MsgGUID: IYjG9TCvQCeAauxRfXB5Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153209267"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Jul 2025 03:43:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWYSE-000a1o-01;
	Tue, 01 Jul 2025 10:43:10 +0000
Date: Tue, 1 Jul 2025 18:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, John Hubbard <jhubbard@nvidia.com>
Subject: [jfern:nova/master 64/87] Diff in
 drivers/gpu/nova-core/falcon/gsp.rs at line 1:
Message-ID: <202507011855.Uj0lOWHk-lkp@intel.com>
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
commit: f44ae3fcdbe155060b348c66ae943d53744e1f5c [64/87] nova-core: gsp: Add support for checking if GSP reloaded
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250701/202507011855.Uj0lOWHk-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011855.Uj0lOWHk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011855.Uj0lOWHk-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j28 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 1:
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
>> Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 1:
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
>> Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 1:
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
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: *** [Makefile:1825: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

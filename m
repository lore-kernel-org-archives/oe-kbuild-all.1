Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C131D514F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889590; cv=none; b=a5YK7+2P4cBJYcU2sQJJRfVGkvzQeAkLZplwA7eQaTIn8KAC2tZQulrxLzOvnF5ACbT/3MfdAMRJWB3BaxcptimghTiSdgCq1zlX3GnDVZYQH8MMuLIERDOltHJzgUzfS7+n2KHKu/8F2eSMbqWA/Y+KpwPG7q4U5f7/WF+rIqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889590; c=relaxed/simple;
	bh=ESfGqGQLctRui4NTLoqwyeRM30pIreBKANNrLvwIEzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WcmyrHPl7b3GKuYvahlTzXdqpaUyI4gNodfkJOpfR7mG8KW0spfQLzTzvLV/jlNPDwSW4WokRWKW9me3QazQF4BSQUeBonRXhvO7HwfhrtBKnA8Jnkzf/4rcmjZdGKonIcO/n0hv8YiO3nZZT+Pe250Te3byyOXwjc1uG+pB8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVjjL8lv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVjjL8lv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889589; x=1777425589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ESfGqGQLctRui4NTLoqwyeRM30pIreBKANNrLvwIEzg=;
  b=fVjjL8lvNzQ7lj4NrLIrodHTsf/vysHg5PDP9+xWFuteBCNU+jqky2nm
   m5XD0baM0rwMG9OnVfeNISkP2oslJBQ4bsGc57goStV5NMreAE/hqwCEs
   qiZdzPYDbfS+huiZwxEupi4yIi2GEX/Zj7vE1xSHVWgFOmqft0bAg34JL
   eXn7eOZ1a+xQEytC1b5TYcRry+rgA2glYLcDldFTOWq/ac9WDIZkutmpH
   7rieSOH7HipP2DTBBg8BBH+YCT9stYUwawSQKvAzs+i8fvVbc+C7ihJro
   hI9C9Xpojl41A9HZOzEJq6PKgJSyxe0yvg3NPVD49JU3ooG4L9qu/07oj
   A==;
X-CSE-ConnectionGUID: zY1Q3S+8RD62PoG8gwocfA==
X-CSE-MsgGUID: X+LfqOXLQKaWW2oGB7xRTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51165295"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51165295"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:35 -0700
X-CSE-ConnectionGUID: bMCRH2pJTfOHMEAdkPvPIg==
X-CSE-MsgGUID: Jor/ccutQVGIkZTVsaFvbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164775844"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Apr 2025 18:19:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdA-00006Q-0z;
	Tue, 29 Apr 2025 01:19:28 +0000
Date: Tue, 29 Apr 2025 08:39:45 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-gsp-fixups 21/42] Diff in drivers/gpu/nova-core/vbios.rs
 at line 70:
Message-ID: <202504290843.KHQbVl6l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-gsp-fixups
head:   854374f0545cd01b0d66384526d9ecdf7a894ff8
commit: 3c3016a9891b04c678f290765e10f51dbee52da4 [21/42] nova-core: vbios: Fixup: Move data into struct Vbios
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250429/202504290843.KHQbVl6l-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290843.KHQbVl6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290843.KHQbVl6l-lkp@intel.com/

Note: the jfern/nova-gsp-fixups HEAD 854374f0545cd01b0d66384526d9ecdf7a894ff8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/vbios.rs at line 70:
        }
    
        /// Read bytes at a specific offset, filling any gap
   -    fn read_more_at_offset(
   -        &mut self,
   -        bar0: &Devres<Bar0>,
   -        offset: usize,
   -        len: usize,
   -    ) -> Result {
   +    fn read_more_at_offset(&mut self, bar0: &Devres<Bar0>, offset: usize, len: usize) -> Result {
            if offset > BIOS_MAX_SCAN_LEN {
                pr_err!("Error: exceeded BIOS scan limit.\n");
                return Err(EINVAL);
   Diff in drivers/gpu/nova-core/vbios.rs at line 104:
        ) -> Result<BiosImage> {
            let data_len = self.data.as_ref().ok_or(EINVAL)?.len();
            if offset + len > data_len {
   -            self.read_more_at_offset(bar0, offset, len).inspect_err(|e| {
   -                pr_err!("Failed to read more at offset {:#x}: {:?}\n", offset, e)
   -            })?;
   +            self.read_more_at_offset(bar0, offset, len)
   +                .inspect_err(|e| {
   +                    pr_err!("Failed to read more at offset {:#x}: {:?}\n", offset, e)
   +                })?;
            }
    
            let data = self.data.as_ref().ok_or(EINVAL)?;
   Diff in drivers/gpu/nova-core/vbios.rs at line 137:
            loop {
                // Try to parse a BIOS image at the current offset
                // This will now check for all valid ROM signatures (0xAA55, 0xBB77, 0x4E56)
   -            let image_size =
   -                vbios.read_bios_image_at_offset(bar0, cur_offset, BIOS_READ_AHEAD_SIZE)
   -                    .and_then(|image| image.image_size_bytes())
   -                    .inspect_err(|e| {
   -                        pr_err!(
   -                            "Failed to parse initial BIOS image headers at offset {:#x}: {:?}\n",
   -                            cur_offset,
   -                            e
   -                        );
   -                    })?;
   +            let image_size = vbios
   +                .read_bios_image_at_offset(bar0, cur_offset, BIOS_READ_AHEAD_SIZE)
   +                .and_then(|image| image.image_size_bytes())
   +                .inspect_err(|e| {
   +                    pr_err!(
   +                        "Failed to parse initial BIOS image headers at offset {:#x}: {:?}\n",
   +                        cur_offset,
   +                        e
   +                    );
   +                })?;
    
                // Create a new BiosImage with the full image data
   -            let full_image =
   -                vbios.read_bios_image_at_offset(bar0, cur_offset, image_size)
   -                    .inspect_err(|e| {
   -                        pr_err!(
   -                            "Failed to parse full BIOS image at offset {:#x}: {:?}\n",
   -                            cur_offset,
   -                            e
   -                        );
   -                    })?;
   +            let full_image = vbios
   +                .read_bios_image_at_offset(bar0, cur_offset, image_size)
   +                .inspect_err(|e| {
   +                    pr_err!(
   +                        "Failed to parse full BIOS image at offset {:#x}: {:?}\n",
   +                        cur_offset,
   +                        e
   +                    );
   +                })?;
    
                // Determine the image type
                let image_type = full_image.image_type_str();
>> Diff in drivers/gpu/nova-core/vbios.rs at line 70:
        }
    
        /// Read bytes at a specific offset, filling any gap
   -    fn read_more_at_offset(
   -        &mut self,
   -        bar0: &Devres<Bar0>,
   -        offset: usize,
   -        len: usize,
   -    ) -> Result {
   +    fn read_more_at_offset(&mut self, bar0: &Devres<Bar0>, offset: usize, len: usize) -> Result {
            if offset > BIOS_MAX_SCAN_LEN {
                pr_err!("Error: exceeded BIOS scan limit.\n");
                return Err(EINVAL);
   Diff in drivers/gpu/nova-core/vbios.rs at line 104:
        ) -> Result<BiosImage> {
            let data_len = self.data.as_ref().ok_or(EINVAL)?.len();
            if offset + len > data_len {
   -            self.read_more_at_offset(bar0, offset, len).inspect_err(|e| {
   -                pr_err!("Failed to read more at offset {:#x}: {:?}\n", offset, e)
   -            })?;
   +            self.read_more_at_offset(bar0, offset, len)
   +                .inspect_err(|e| {
   +                    pr_err!("Failed to read more at offset {:#x}: {:?}\n", offset, e)
   +                })?;
            }
    
            let data = self.data.as_ref().ok_or(EINVAL)?;
   Diff in drivers/gpu/nova-core/vbios.rs at line 137:
            loop {
                // Try to parse a BIOS image at the current offset
                // This will now check for all valid ROM signatures (0xAA55, 0xBB77, 0x4E56)
   -            let image_size =
   -                vbios.read_bios_image_at_offset(bar0, cur_offset, BIOS_READ_AHEAD_SIZE)
   -                    .and_then(|image| image.image_size_bytes())
   -                    .inspect_err(|e| {
   -                        pr_err!(
   -                            "Failed to parse initial BIOS image headers at offset {:#x}: {:?}\n",
   -                            cur_offset,
   -                            e
   -                        );
   -                    })?;
   +            let image_size = vbios
   +                .read_bios_image_at_offset(bar0, cur_offset, BIOS_READ_AHEAD_SIZE)
   +                .and_then(|image| image.image_size_bytes())
   +                .inspect_err(|e| {
   +                    pr_err!(
   +                        "Failed to parse initial BIOS image headers at offset {:#x}: {:?}\n",
   +                        cur_offset,
   +                        e
   +                    );
   +                })?;
    
                // Create a new BiosImage with the full image data
   -            let full_image =
   -                vbios.read_bios_image_at_offset(bar0, cur_offset, image_size)
   -                    .inspect_err(|e| {
   -                        pr_err!(
   -                            "Failed to parse full BIOS image at offset {:#x}: {:?}\n",
   -                            cur_offset,
   -                            e
   -                        );
   -                    })?;
   +            let full_image = vbios
   +                .read_bios_image_at_offset(bar0, cur_offset, image_size)
   +                .inspect_err(|e| {
   +                    pr_err!(
   +                        "Failed to parse full BIOS image at offset {:#x}: {:?}\n",
   +                        cur_offset,
   +                        e
   +                    );
   +                })?;
    
                // Determine the image type
                let image_type = full_image.image_type_str();
   make[2]: *** [Makefile:1828: rustfmt] Error 123
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

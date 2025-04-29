Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDE31CA9C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745890903; cv=none; b=CSFNJd2edmL/GdIDwLvdLFdfX5i4ul+0qNXCEJJkfQtJm+CW6ef7DR2VAREl1W0H7wPIMhV099x+yQQMHjyrfTbteSq6ZDxNg55P1+9L9bfDnu88tzmLnxAy+X264ZABpY6XWTKfkuak+xOqzWi2cnLEjdgc5Mctxv5qRce6PKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745890903; c=relaxed/simple;
	bh=sx6TZNKV8oeJGno1W9+Zds7xKjDfZ+AP0GLr2JyIvk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jJRTP5ME30KSantDFo+LI78RaXx4cwwToGujHhrDlNq7tFHrsJo9i5DhuJ6QnnSMx0kICN6hlP3JIZoRQ00fG7/vl/cwvZOy8IEbG5lcjApMYJjPKZ8memNPnJuk6hikFHyOuxn9fhf5DAqps8ImNu66Pgw8usL1EWNp1PAP4Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctcYg+fp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctcYg+fp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745890901; x=1777426901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sx6TZNKV8oeJGno1W9+Zds7xKjDfZ+AP0GLr2JyIvk8=;
  b=ctcYg+fphs21bkukSiomUYeWIUVYXrFGR8Kr/EiNO/QeQE7rJOSGPLMO
   OfBTOnFDAz8PGVkdL5gUo92mE/wY/Pq3Kr9bZu6hpM51MK4dQ0tZALZMU
   Ohlj1Opgfl/8/Q4epvCdB/5c4tCMLzqS7MWTt8fsxoW6w0dpfPUOTXAin
   ye5r57G6ouk+aMRXhvP3E50qc3hR+MhM/SwYG71/LQq8VsZt+ovAfEflT
   AqRipC+9MqNwvUFg5h8k3Jhn0p2vpgD/s1v/1VrcJP9X+6WnR0zJ6Uv7B
   RP3Vx2ymb4IL1fARuzTOLPAo25h1d6wr68YcpRm/9UAQabcJCbLY4IutL
   g==;
X-CSE-ConnectionGUID: KAHZcEAYRWyloTBcSjv2Bg==
X-CSE-MsgGUID: nnZB6atqSoW2I5dlJFz8NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47409572"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="47409572"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:41:40 -0700
X-CSE-ConnectionGUID: 8lqaHhyBQjeYdvtU01iD0w==
X-CSE-MsgGUID: 2sbR8WL6QyOr4uxuf7I5qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="134656667"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Apr 2025 18:41:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9Zyb-0000ON-2E;
	Tue, 29 Apr 2025 01:41:37 +0000
Date: Tue, 29 Apr 2025 09:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-gsp-fixups 23/42]  use kernel::error::Result;
Message-ID: <202504290913.JgcDu6s3-lkp@intel.com>
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
commit: 4c372d5abfd1856db59e4f8322906f8f0378a0af [23/42] nova-core: vbios: Fixup: Use dev_err instead of pr_err where possible
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250429/202504290913.JgcDu6s3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290913.JgcDu6s3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290913.JgcDu6s3-lkp@intel.com/

Note: the jfern/nova-gsp-fixups HEAD 854374f0545cd01b0d66384526d9ecdf7a894ff8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/vbios.rs at line 7:
    use core::convert::TryFrom;
    use kernel::devres::Devres;
>>  use kernel::error::Result;
   -use kernel::prelude::*;
    use kernel::pci;
   +use kernel::prelude::*;
    
    /// The offset of the VBIOS ROM in the BAR0 space.
    const ROM_OFFSET: usize = 0x300000;
   Diff in drivers/gpu/nova-core/vbios.rs at line 46:
    
            // Ensure length is a multiple of 4 for 32-bit reads
            if len % core::mem::size_of::<u32>() != 0 {
   -            dev_err!(self.pdev.as_ref(), "VBIOS read length {} is not a multiple of 4\n", len);
   +            dev_err!(
   +                self.pdev.as_ref(),
   +                "VBIOS read length {} is not a multiple of 4\n",
   +                len
   +            );
                return Err(EINVAL);
            }
    
   Diff in drivers/gpu/nova-core/vbios.rs at line 59:
                    let word = bar0_ref.try_read32(rom_addr)?;
    
                    // Convert the u32 to a 4 byte array and push each byte
   -                word.to_ne_bytes().iter().try_for_each(|&b| data.push(b, GFP_KERNEL))?;
   +                word.to_ne_bytes()
   +                    .iter()
   +                    .try_for_each(|&b| data.push(b, GFP_KERNEL))?;
                }
                Ok(())
            })?;
   Diff in drivers/gpu/nova-core/vbios.rs at line 68:
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
                dev_err!(self.pdev.as_ref(), "Error: exceeded BIOS scan limit.\n");
                return Err(EINVAL);
   Diff in drivers/gpu/nova-core/vbios.rs at line 102:
        ) -> Result<BiosImage> {
            let data_len = self.data.as_ref().ok_or(EINVAL)?.len();
            if offset + len > data_len {
   -            self.read_more_at_offset(bar0, offset, len).inspect_err(|e| {
   -                dev_err!(self.pdev.as_ref(), "Failed to read more at offset {:#x}: {:?}\n", offset, e)
   -            })?;
   +            self.read_more_at_offset(bar0, offset, len)
   +                .inspect_err(|e| {
   +                    dev_err!(
   +                        self.pdev.as_ref(),
   +                        "Failed to read more at offset {:#x}: {:?}\n",
   +                        offset,
   +                        e
   +                    )
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
   -                        dev_err!(
   -                            vbios.pdev.as_ref(),
   -                            "Failed to parse initial BIOS image headers at offset {:#x}: {:?}\n",
   -                            cur_offset,
   -                            e
   -                        );
   -                    })?;
   +            let image_size = vbios
   +                .read_bios_image_at_offset(bar0, cur_offset, BIOS_READ_AHEAD_SIZE)
   +                .and_then(|image| image.image_size_bytes())
   +                .inspect_err(|e| {
   +                    dev_err!(
   +                        vbios.pdev.as_ref(),
   +                        "Failed to parse initial BIOS image headers at offset {:#x}: {:?}\n",
   +                        cur_offset,
   +                        e
   +                    );
   +                })?;
    
                // Create a new BiosImage with the full image data
   -            let full_image =
   -                vbios.read_bios_image_at_offset(bar0, cur_offset, image_size)
   -                    .inspect_err(|e| {
   -                        dev_err!(
   -                            vbios.pdev.as_ref(),
   -                            "Failed to parse full BIOS image at offset {:#x}: {:?}\n",
   -                            cur_offset,
   -                            e
   -                        );
   -                    })?;
   +            let full_image = vbios
   +                .read_bios_image_at_offset(bar0, cur_offset, image_size)
   +                .inspect_err(|e| {
   +                    dev_err!(
   +                        vbios.pdev.as_ref(),
   +                        "Failed to parse full BIOS image at offset {:#x}: {:?}\n",
   +                        cur_offset,
   +                        e
   +                    );
   +                })?;
    
                // Determine the image type
                let image_type = full_image.image_type_str();
   Diff in drivers/gpu/nova-core/vbios.rs at line 202:
    
                // Safety check - don't go beyond BIOS_MAX_SCAN_LEN (1MB)
                if cur_offset > BIOS_MAX_SCAN_LEN {
   -                dev_err!(vbios.pdev.as_ref(), "Error: exceeded BIOS scan limit, stopping scan\n");
   +                dev_err!(
   +                    vbios.pdev.as_ref(),
   +                    "Error: exceeded BIOS scan limit, stopping scan\n"
   +                );
                    break;
                }
            } // end of loop
   Diff in drivers/gpu/nova-core/vbios.rs at line 217:
                if let (Some(second), Some(first), Some(pci_at)) =
                    (second.as_mut(), first_ref, pci_at_ref)
                {
   -                second
   -                    .setup_falcon_data(pci_at, first)
   -                    .inspect_err(|e| dev_err!(vbios.pdev.as_ref(), "Falcon data setup failed: {:?}\n", e))?;
   +                second.setup_falcon_data(pci_at, first).inspect_err(|e| {
   +                    dev_err!(vbios.pdev.as_ref(), "Falcon data setup failed: {:?}\n", e)
   +                })?;
                } else {
   -                dev_err!(vbios.pdev.as_ref(), "Missing required images for falcon data setup, skipping\n");
   +                dev_err!(
   +                    vbios.pdev.as_ref(),
   +                    "Missing required images for falcon data setup, skipping\n"
   +                );
                }
                second // Return the potentially modified second image
            };
   Diff in drivers/gpu/nova-core/vbios.rs at line 7:
    use core::convert::TryFrom;
    use kernel::devres::Devres;
>>  use kernel::error::Result;
   -use kernel::prelude::*;
    use kernel::pci;
   +use kernel::prelude::*;
    
    /// The offset of the VBIOS ROM in the BAR0 space.
    const ROM_OFFSET: usize = 0x300000;
   Diff in drivers/gpu/nova-core/vbios.rs at line 46:
    
            // Ensure length is a multiple of 4 for 32-bit reads
            if len % core::mem::size_of::<u32>() != 0 {
   -            dev_err!(self.pdev.as_ref(), "VBIOS read length {} is not a multiple of 4\n", len);
   +            dev_err!(
   +                self.pdev.as_ref(),
   +                "VBIOS read length {} is not a multiple of 4\n",
   +                len
   +            );
                return Err(EINVAL);
            }
    
   Diff in drivers/gpu/nova-core/vbios.rs at line 59:
                    let word = bar0_ref.try_read32(rom_addr)?;
    
                    // Convert the u32 to a 4 byte array and push each byte
   -                word.to_ne_bytes().iter().try_for_each(|&b| data.push(b, GFP_KERNEL))?;
   +                word.to_ne_bytes()
   +                    .iter()
   +                    .try_for_each(|&b| data.push(b, GFP_KERNEL))?;
                }
                Ok(())
            })?;
   Diff in drivers/gpu/nova-core/vbios.rs at line 68:
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
                dev_err!(self.pdev.as_ref(), "Error: exceeded BIOS scan limit.\n");
                return Err(EINVAL);
   Diff in drivers/gpu/nova-core/vbios.rs at line 102:
        ) -> Result<BiosImage> {
            let data_len = self.data.as_ref().ok_or(EINVAL)?.len();
            if offset + len > data_len {
   -            self.read_more_at_offset(bar0, offset, len).inspect_err(|e| {
   -                dev_err!(self.pdev.as_ref(), "Failed to read more at offset {:#x}: {:?}\n", offset, e)
   -            })?;
   +            self.read_more_at_offset(bar0, offset, len)
   +                .inspect_err(|e| {
   +                    dev_err!(
   +                        self.pdev.as_ref(),
   +                        "Failed to read more at offset {:#x}: {:?}\n",
   +                        offset,
   +                        e
   +                    )
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
   -                        dev_err!(
   -                            vbios.pdev.as_ref(),
   -                            "Failed to parse initial BIOS image headers at offset {:#x}: {:?}\n",
   -                            cur_offset,
   -                            e
   -                        );
   -                    })?;
   +            let image_size = vbios
   +                .read_bios_image_at_offset(bar0, cur_offset, BIOS_READ_AHEAD_SIZE)
   +                .and_then(|image| image.image_size_bytes())
   +                .inspect_err(|e| {
   +                    dev_err!(
   +                        vbios.pdev.as_ref(),
   +                        "Failed to parse initial BIOS image headers at offset {:#x}: {:?}\n",
   +                        cur_offset,
   +                        e
   +                    );
   +                })?;
    
                // Create a new BiosImage with the full image data
   -            let full_image =
   -                vbios.read_bios_image_at_offset(bar0, cur_offset, image_size)
   -                    .inspect_err(|e| {
   -                        dev_err!(
   -                            vbios.pdev.as_ref(),
   -                            "Failed to parse full BIOS image at offset {:#x}: {:?}\n",
   -                            cur_offset,
   -                            e
   -                        );

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

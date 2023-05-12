Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF1623D6E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683920399; x=1715456399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NQ2pyu1LE2Y4OfvNHUc/om2AcyTjuzvjqbqywmsO8R4=;
  b=CFaUwm1NErrOjtnYxy9VIAYySMv5d+l4q/0J5WEMuFmt55U+72/6YzIa
   z7lxZWZEsnUocx148a9u+jiY9tbgu1XvTxPiqdP/L0xVKB+QiC0NuUx9X
   cNzpWy3dd4+rMMVCcwh/+5jzymihvWrxPRUy4ZWZH1XiiCUW2c1X53MrQ
   GUxyT3fqF848w5tzRBQ0S9LRshVZwy+W05wVni67o4ux1vDXYMajb3CTW
   chpZ3G8BLxsL5ikAFpuLE710NVYgu8XAs3LjoM0BAbI+4+YspzcX1+cnt
   8mfXrKhOQv1A3268JyNb8r8s4L81acpUYEYDdE0HV5iyhUgbujvej4PPS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335394060"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="335394060"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 12:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="694351035"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="694351035"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 May 2023 12:39:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxYcM-00054S-2J;
	Fri, 12 May 2023 19:39:54 +0000
Date: Sat, 13 May 2023 03:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-unaccepted-memory 9/9]
 drivers/firmware/efi/unaccepted_memory.c:11:6: warning: no previous
 prototype for 'accept_memory'
Message-ID: <202305130314.b7Y8Zzol-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-unaccepted-memory
head:   c8e5c81a3f61692562b165b7d98dca3766006835
commit: c8e5c81a3f61692562b165b7d98dca3766006835 [9/9] x86/tdx: Add unaccepted memory support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230513/202305130314.b7Y8Zzol-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/c8e5c81a3f61692562b165b7d98dca3766006835
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-unaccepted-memory
        git checkout c8e5c81a3f61692562b165b7d98dca3766006835
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/firmware/efi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130314.b7Y8Zzol-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/unaccepted_memory.c:11:6: warning: no previous prototype for 'accept_memory' [-Wmissing-prototypes]
      11 | void accept_memory(phys_addr_t start, phys_addr_t end)
         |      ^~~~~~~~~~~~~
>> drivers/firmware/efi/unaccepted_memory.c:89:6: warning: no previous prototype for 'range_contains_unaccepted_memory' [-Wmissing-prototypes]
      89 | bool range_contains_unaccepted_memory(phys_addr_t start, phys_addr_t end)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/accept_memory +11 drivers/firmware/efi/unaccepted_memory.c

0b1136f3414c71 Kirill A. Shutemov 2021-08-25  10  
0b1136f3414c71 Kirill A. Shutemov 2021-08-25 @11  void accept_memory(phys_addr_t start, phys_addr_t end)
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  12  {
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  13  	struct efi_unaccepted_memory *unaccepted;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  14  	unsigned long range_start, range_end;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  15  	unsigned long flags;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  16  	u64 unit_size;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  17  
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  18  	if (efi.unaccepted == EFI_INVALID_TABLE_ADDR)
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  19  		return;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  20  
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  21  	unaccepted = efi_get_unaccepted_table();
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  22  	if (!unaccepted)
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  23  		return;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  24  
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  25  	unit_size = unaccepted->unit_size;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  26  
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  27  	/*
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  28  	 * Only care for the part of the range that is represented
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  29  	 * in the bitmap.
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  30  	 */
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  31  	if (start < unaccepted->phys_base)
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  32  		start = unaccepted->phys_base;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  33  	if (end < unaccepted->phys_base)
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  34  		return;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  35  
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  36  	/* Translate to offsets from the beginning of the bitmap */
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  37  	start -= unaccepted->phys_base;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  38  	end -= unaccepted->phys_base;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  39  
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  40  	/*
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  41  	 * load_unaligned_zeropad() can lead to unwanted loads across page
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  42  	 * boundaries. The unwanted loads are typically harmless. But, they
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  43  	 * might be made to totally unrelated or even unmapped memory.
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  44  	 * load_unaligned_zeropad() relies on exception fixup (#PF, #GP and now
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  45  	 * #VE) to recover from these unwanted loads.
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  46  	 *
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  47  	 * But, this approach does not work for unaccepted memory. For TDX, a
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  48  	 * load from unaccepted memory will not lead to a recoverable exception
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  49  	 * within the guest. The guest will exit to the VMM where the only
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  50  	 * recourse is to terminate the guest.
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  51  	 *
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  52  	 * There are two parts to fix this issue and comprehensively avoid
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  53  	 * access to unaccepted memory. Together these ensure that an extra
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  54  	 * "guard" page is accepted in addition to the memory that needs to be
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  55  	 * used:
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  56  	 *
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  57  	 * 1. Implicitly extend the range_contains_unaccepted_memory(start, end)
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  58  	 *    checks up to end+unit_size if 'end' is aligned on a unit_size
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  59  	 *    boundary.
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  60  	 *
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  61  	 * 2. Implicitly extend accept_memory(start, end) to end+unit_size if
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  62  	 *    'end' is aligned on a unit_size boundary. (immediately following
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  63  	 *    this comment)
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  64  	 */
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  65  	if (!(end % unit_size))
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  66  		end += unit_size;
bcb86a076644d3 Kirill A. Shutemov 2022-05-11  67  
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  68  	/* Make sure not to overrun the bitmap */
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  69  	if (end > unaccepted->size * unit_size * BITS_PER_BYTE)
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  70  		end = unaccepted->size * unit_size * BITS_PER_BYTE;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  71  
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  72  	range_start = start / unit_size;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  73  
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  74  	spin_lock_irqsave(&unaccepted_memory_lock, flags);
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  75  	for_each_set_bitrange_from(range_start, range_end, unaccepted->bitmap,
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  76  				   DIV_ROUND_UP(end, unit_size)) {
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  77  		unsigned long phys_start, phys_end;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  78  		unsigned long len = range_end - range_start;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  79  
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  80  		phys_start = range_start * unit_size + unaccepted->phys_base;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  81  		phys_end = range_end * unit_size + unaccepted->phys_base;
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  82  
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  83  		arch_accept_memory(phys_start, phys_end);
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  84  		bitmap_clear(unaccepted->bitmap, range_start, len);
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  85  	}
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  86  	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  87  }
0b1136f3414c71 Kirill A. Shutemov 2021-08-25  88  
0b1136f3414c71 Kirill A. Shutemov 2021-08-25 @89  bool range_contains_unaccepted_memory(phys_addr_t start, phys_addr_t end)

:::::: The code at line 11 was first introduced by commit
:::::: 0b1136f3414c71150a3b12d81f2266425b8070e3 efi: Provide helpers for unaccepted memory

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

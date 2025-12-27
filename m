Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DE51DBB3A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766823562; cv=none; b=qNzUMh5lwjgT49IVi/px2LprNCfee/PFLMgBAb18ac6D5TrcoFJDdVY7EDR7MtCJ+cNvd20DyFl00bik+zNitgGb6wZC7IZ7xXsknSKpc8gXxrPB8bEtMJIgdIfqU9ynG4PpUQ0TEePU87/CQ8uQ9Y/vbegesFTX4mj2SbA+2tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766823562; c=relaxed/simple;
	bh=c5vFlbXZLbBO7IB1hMBpAWRFd75QjPhpezdRK/RzZVE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Khwd+A0p3JWpUNc7HIafRC9+Vec7HDui+SvuGx+fmP3+37n3GwzMAkbShinFBWPz3vaXMUw+SEi1o10nPiTQbETBDQU2jBkmuKH9qdWHRakLyG0/BvclMr6MrIPq58cewOvAMLVDA3723GzJA/ekXSap2kuhqrxgpLH1MU5pG/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/k2lpFu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/k2lpFu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766823560; x=1798359560;
  h=date:from:to:cc:subject:message-id;
  bh=c5vFlbXZLbBO7IB1hMBpAWRFd75QjPhpezdRK/RzZVE=;
  b=Y/k2lpFum31lfgD1snmnCQgUmNzdUEB7zYF0O1jhyWoZVp9dI3PWApb+
   WBVBecLLp/KI/aTQf741IE1ouEC94VctYZZfuy1nJe1b2YjkDGUTDIkYi
   QcdDdy4mIBimi/Fu61B1C/739ABayWLiGS3PirldQ+8bPNoq/fZDW3MDr
   jmY5Lna/8bq3pec2wiw2v2AlAvdl9tTeFOiKh2+PGtcYh9W6mXLG0fXcy
   IUPOR/XEYu+269HClD5n5x1b/iDoC9DiYy3GgaJB1GjWbgsHaRktviDVj
   puV7Jqv30oEYxo/TBj4bzBYCJpYz8o2X3If/4BwPywuK6dRLTFa6CdyPJ
   Q==;
X-CSE-ConnectionGUID: mJ73CqcTTZCTsu0hNixJwA==
X-CSE-MsgGUID: v9VOIA2tRCq0nA1UYFasxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="79655768"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79655768"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 00:19:20 -0800
X-CSE-ConnectionGUID: 9sgJf7vRSAmRYVqdSpPnrA==
X-CSE-MsgGUID: dMFiaT8vRP+3AS7CvPOWsA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Dec 2025 00:19:14 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZPW0-000000005fH-4C6Q;
	Sat, 27 Dec 2025 08:19:09 +0000
Date: Sat, 27 Dec 2025 16:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 20/29]
 drivers/firmware/efi/libstub/zboot.c:36:15: warning: no previous prototype
 for 'entry_offset'
Message-ID: <202512271647.vrHZhxn5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   b6f238d2e8720acf63467aa0d48d7fc4e31c07c2
commit: 48d32d494f9f9a7f30d08647fd94bf20c50705e9 [20/29] efi/zboot: Add support for ELF payloads
config: riscv-randconfig-002-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271647.vrHZhxn5-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271647.vrHZhxn5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271647.vrHZhxn5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/zboot.c:36:15: warning: no previous prototype for 'entry_offset' [-Wmissing-prototypes]
      36 | unsigned long entry_offset(void)
         |               ^~~~~~~~~~~~
   drivers/firmware/efi/libstub/zboot.c: In function 'efi_zboot_entry':
   drivers/firmware/efi/libstub/zboot.c:102:11: error: too few arguments to function 'efi_zboot_decompress'
     102 |  status = efi_zboot_decompress((void *)image_base, alloc_size) ?:
         |           ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/firmware/efi/libstub/zboot.c:8:
   drivers/firmware/efi/libstub/efistub.h:1268:14: note: declared here
    1268 | efi_status_t efi_zboot_decompress(u8 *out, unsigned long outlen,
         |              ^~~~~~~~~~~~~~~~~~~~


vim +/entry_offset +36 drivers/firmware/efi/libstub/zboot.c

    35	
  > 36	unsigned long entry_offset(void)
    37	{
    38		return entrypoint;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

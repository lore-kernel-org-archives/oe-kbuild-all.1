Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C361877
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jul 2024 03:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722137154; cv=none; b=Ir780VPT2plckIuc/xr9lN4sJBq0aHlh7STqXk9ZOuWyLH3Rh0MU9aJPhLRuu8Q9qiw6Vd0tO3OpZacGy+GO1uohZn25pd4NflX5MIpNxzLEiW7qlzH/9PtFs1Lo/za8u19j6B6/I+ONA2ZxUhhmw0LiDEfbWxYX5exo1PmYIt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722137154; c=relaxed/simple;
	bh=ePdUMW/HdlDjNktxdbHbvt+30f/M8cfP+i2kAdWzTZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XLEvyLGGkpJlv6I8VtktUTclyIsJJ27IwmckPcVIm/WdrCwxHla7IUA9aUtUvj6MIDoJv8+JpvphAqGinGDKXF1oYQugkCA9CQ5hW59muO1yM2TctWqyTc70+R8YD8ajOJcQVQc1bHlBcG0O15h51nWoP83OxP7Gn87U4Mt9dmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aabu/Aht; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aabu/Aht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722137152; x=1753673152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ePdUMW/HdlDjNktxdbHbvt+30f/M8cfP+i2kAdWzTZQ=;
  b=Aabu/AhtYiPjLQ537Oy8puxg+BgHhNd2hymBZabS94sZK94u9RYInJG5
   QI97gtfwpjlf0XRYM/fsW2nDzm2S/aCIRXabFS+1MkjUw3jZFl8/VhOgF
   Gw1+2ecd0Ja3B8s7/iFafz14TRIvaQgqNwmG48WBXVKcPBUwt26MyNg16
   QmALEDXRVDKjRkP333Va8psu5ZsTLCtxJ0pmZdoxAcBVCJ2TthbA3yAmP
   1MK5al7OfZByv+yAMQ6JR1fj3duWZyGzwB+OwesvK9XHd0jXCgwMDqh35
   ICLYbtRLMQVlw6okuQ+RsOWF9+b7LCJKBOcJ31KwhydsgLESxlo/cnZEA
   Q==;
X-CSE-ConnectionGUID: W2oLdRFSRSqHYHkR/FA/iA==
X-CSE-MsgGUID: vX9EwM5UTNevzwzj7hp9Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="31301698"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="31301698"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 20:25:52 -0700
X-CSE-ConnectionGUID: OEBo114vTBSeRv8MAjST0g==
X-CSE-MsgGUID: 1COwDh6dQCSvAAuxfut1Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="53848094"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jul 2024 20:25:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXuXc-000qTO-0g;
	Sun, 28 Jul 2024 03:25:48 +0000
Date: Sun, 28 Jul 2024 11:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 5/7] loongarch64-linux-ld: warning: orphan
 section `.init.bss.screen_info_offset' from
 `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o' being placed in
 section `.init.bss.screen_info_offset'
Message-ID: <202407281116.R8lvwv9w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   caecd138f3c820b6e24d9fa9eb0ee20d755cd5c0
commit: 66bfbcac7d7d81f205bc35c060d70f5c378ad3d4 [5/7] livepatch: Enable -ffunction-sections -fdata-sections
config: loongarch-randconfig-001-20240728 (https://download.01.org/0day-ci/archive/20240728/202407281116.R8lvwv9w-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407281116.R8lvwv9w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407281116.R8lvwv9w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> loongarch64-linux-ld: warning: orphan section `.init.bss.screen_info_offset' from `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o' being placed in section `.init.bss.screen_info_offset'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.cmdline' from `./drivers/firmware/efi/libstub/gop.stub.o' being placed in section `.init.bss.cmdline'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_system_table' from `./drivers/firmware/efi/libstub/systable.stub.o' being placed in section `.init.bss.efi_system_table'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_mem_encrypt' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_mem_encrypt'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_disable_pci_dma' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_disable_pci_dma'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_nosoftreserve' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_nosoftreserve'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_noinitrd' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_noinitrd'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_novamap' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_novamap'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_nokaslr' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_nokaslr'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_nochunk' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_nochunk'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.text_to_dp.0' from `./drivers/firmware/efi/libstub/file.stub.o' being placed in section `.init.bss.text_to_dp.0'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.screen_info_offset' from `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o' being placed in section `.init.bss.screen_info_offset'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.cmdline' from `./drivers/firmware/efi/libstub/gop.stub.o' being placed in section `.init.bss.cmdline'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_system_table' from `./drivers/firmware/efi/libstub/systable.stub.o' being placed in section `.init.bss.efi_system_table'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_mem_encrypt' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_mem_encrypt'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_disable_pci_dma' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_disable_pci_dma'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_nosoftreserve' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_nosoftreserve'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_noinitrd' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_noinitrd'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_novamap' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_novamap'
>> loongarch64-linux-ld: warning: orphan section `.init.bss.efi_nokaslr' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_nokaslr'
   loongarch64-linux-ld: warning: orphan section `.init.bss.efi_nochunk' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_nochunk'
   loongarch64-linux-ld: warning: orphan section `.init.bss.text_to_dp.0' from `./drivers/firmware/efi/libstub/file.stub.o' being placed in section `.init.bss.text_to_dp.0'
   loongarch64-linux-ld: warning: orphan section `.init.bss.screen_info_offset' from `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o' being placed in section `.init.bss.screen_info_offset'
   loongarch64-linux-ld: warning: orphan section `.init.bss.cmdline' from `./drivers/firmware/efi/libstub/gop.stub.o' being placed in section `.init.bss.cmdline'
   loongarch64-linux-ld: warning: orphan section `.init.bss.efi_system_table' from `./drivers/firmware/efi/libstub/systable.stub.o' being placed in section `.init.bss.efi_system_table'
   loongarch64-linux-ld: warning: orphan section `.init.bss.efi_mem_encrypt' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_mem_encrypt'
   loongarch64-linux-ld: warning: orphan section `.init.bss.efi_disable_pci_dma' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_disable_pci_dma'
   loongarch64-linux-ld: warning: orphan section `.init.bss.efi_nosoftreserve' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_nosoftreserve'
   loongarch64-linux-ld: warning: orphan section `.init.bss.efi_noinitrd' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_noinitrd'
   loongarch64-linux-ld: warning: orphan section `.init.bss.efi_novamap' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_novamap'
   loongarch64-linux-ld: warning: orphan section `.init.bss.efi_nokaslr' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_nokaslr'
   loongarch64-linux-ld: warning: orphan section `.init.bss.efi_nochunk' from `./drivers/firmware/efi/libstub/efi-stub-helper.stub.o' being placed in section `.init.bss.efi_nochunk'
   loongarch64-linux-ld: warning: orphan section `.init.bss.text_to_dp.0' from `./drivers/firmware/efi/libstub/file.stub.o' being placed in section `.init.bss.text_to_dp.0'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

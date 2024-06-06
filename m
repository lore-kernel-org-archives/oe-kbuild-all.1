Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74852260C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717659657; cv=none; b=a9DftwGj/LkBnhObeZShj4TuV0iByByd0f1gqTfQMWMMilvooA7VKX+ZrIdnEL7TBhxty1F8TxzJkDtJPf5CUt7N+lb2HhfjxHRH+4XSOgTxRmCIhSRDkkupDO0YRVHAfJ+mNVhRhGP3eS3XhrBmxe7jTwc1EObLYeyd7YDx3Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717659657; c=relaxed/simple;
	bh=C3Ato6lx+EXoU58rKKvuy/luz3LA7CKJ4nY2ZwYbIN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sS/OFtIC9uN3LRYlsQmLCN1lCpvkJ2x9/IMQjyTlt9EpzwEBw2eKwxYYfYd5m9UORfYasr1S8egifQW0+badp4xLjoUC3Fwu9Cinz0J0791CMDcP8YjfvhAoUid/Cw0I18tTny1SZz9bywBDGpdOIvoOIXgAp2MZ8157WuIwY+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRHF12+Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRHF12+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717659656; x=1749195656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C3Ato6lx+EXoU58rKKvuy/luz3LA7CKJ4nY2ZwYbIN0=;
  b=QRHF12+Qc0OFfpcHpXLdIhzpuZN8xaoRsj981OAcYytYlk4M/eDo529Z
   tM9PJY77jeVOUrNXMdfwOpMcxal66njb52jAoLpiSeCH9jfMwQhisdau4
   UlUeMPr+jRWmjwnKYLFcBaJs1SEa6f5gywwuPhjmNamUfDBhNo9zli+cR
   Gmla1RgI5ZPhlZoZXNASrlg6chsNXGe/yAKXFj9d+WdBan2xhoqr+vuZF
   CE6HN+FGmas+XTsHS3KroCUTRIR38pPOmFjeeJHWgPuZd/K7QdcbsSVPh
   xET782FKZJos/1MRs+Z0yUvbRvHSu82lpCaPoCG5ltXh1ZXaClH98Y0sL
   g==;
X-CSE-ConnectionGUID: 4kzIIuuxSWuFXGkbJQXy5w==
X-CSE-MsgGUID: EvlTG2C9R3CWtq5WhrViDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14445018"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="14445018"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 00:40:56 -0700
X-CSE-ConnectionGUID: 6W+b1wHuQu+0pRVMrCCHzQ==
X-CSE-MsgGUID: RUqklMKBR862RA+Jn3Gztg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="42973481"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Jun 2024 00:40:54 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF7jw-0002oY-11;
	Thu, 06 Jun 2024 07:40:52 +0000
Date: Thu, 6 Jun 2024 15:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 264/377] ld.lld: error:
 undefined symbol: ntb_db_event
Message-ID: <202406061525.bx8W6SDR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   c61bd26ae81a896c8660150b4e356153da30880a
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [264/377] PCI: endpoint: Support NTB transfer between RC and EP
config: i386-randconfig-r111-20240606 (https://download.01.org/0day-ci/archive/20240606/202406061525.bx8W6SDR-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061525.bx8W6SDR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061525.bx8W6SDR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ntb_db_event
   >>> referenced by pci-epf-vntb.c:261 (drivers/pci/endpoint/functions/pci-epf-vntb.c:261)
   >>>               pci/endpoint/functions/pci-epf-vntb.o:(epf_ntb_cmd_handler) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ntb_link_event
   >>> referenced by pci-epf-vntb.c:173 (drivers/pci/endpoint/functions/pci-epf-vntb.c:173)
   >>>               pci/endpoint/functions/pci-epf-vntb.o:(epf_ntb_cmd_handler) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ntb_register_device
   >>> referenced by pci-epf-vntb.c:1242 (drivers/pci/endpoint/functions/pci-epf-vntb.c:1242)
   >>>               pci/endpoint/functions/pci-epf-vntb.o:(pci_vntb_probe) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

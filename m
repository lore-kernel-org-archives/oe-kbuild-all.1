Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0126724A05D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 07:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768721475; cv=none; b=ERO6HCIf1p+ZnMk5WdK2Z0IvVWBU9ndKedqeuEmicCS6Q6xUW8W7/bJ3hwHkwgDFs7MahY1BOPFado98TLkwPuEPNkYpRq/8i9IximOjNDawfaZzNvIprBVU7OyUvm7/gLey4n++1Csmo2dAdxVOjugHBQG5RzeODEeDDlLTVbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768721475; c=relaxed/simple;
	bh=7aQAb4FWGTLFO/7XEu+hANEflydVmotam1eW8ggo8Y0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KXKxw60Ocm+Rm/0/BCAcHxfCbFRnCwMUk3cucsPBjZhgYG7LlVi/PGdIzhawWgZyx1QeR3/eY4QqS7oKkKD7EsAm5QuhmrD3MBDABb4Erp1m8SnAd6xmJD7gxwml8EUXdoCq8MvF7//BHP23V9Sxe2m5EfCxUPy1dAxc26IDx9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpi8Uyu8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpi8Uyu8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768721474; x=1800257474;
  h=date:from:to:cc:subject:message-id;
  bh=7aQAb4FWGTLFO/7XEu+hANEflydVmotam1eW8ggo8Y0=;
  b=gpi8Uyu8Lo6HmfG/9pXXz+SYMEB+9tsZmsrcG+0lMjVN56h71vNGMXJV
   yYadakAYw8CyiobyD3pJ3bUYbxN88nwqbp0uxfn4SjhHKacCsdF5j7GJR
   uEFIJJTkVdkfEiIXmyczOG2hTV6y/qqOcZtMJR9YJdZRjOJgeIbYG0NiK
   En6skpxV3XSVuvjthU/apjvTjfWtiygiqEoOh3b45B9jLWV+hmR23mQNi
   Lg3h553gzaxwBLzhDKhXFpKPIUU5tAOZy0FZw2HMaYL/GIbFS6dF+Wc2W
   PmYYgx+uXNMwnVokX5qGNCf+z6vkzw6G9axxIkkCvDxYWlqxd7QCdHMWW
   A==;
X-CSE-ConnectionGUID: NSM3Vqp7RuCxJdRHLtcFaQ==
X-CSE-MsgGUID: JVckvRNMSe2irxldjZKBng==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="80269256"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="80269256"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 23:31:12 -0800
X-CSE-ConnectionGUID: XQDBGYATSPmMutjg1PVu+w==
X-CSE-MsgGUID: y/9ejnH7RRaUEgiCqvoh2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="210073651"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jan 2026 23:31:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhNFb-00000000Mli-3UpG;
	Sun, 18 Jan 2026 07:31:07 +0000
Date: Sun, 18 Jan 2026 15:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Adrien Ricciardi <aricciardi@baylibre.com>
Subject: [fustini:b4/ssqosid-cbqri 17/20]
 include/linux/riscv_qos.h:10:10: fatal error: asm/qos.h: No such file or
 directory
Message-ID: <202601181527.mCItVrtA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   b34c2f7cb87d02f5b712e9e35ac9b66d21ce07e9
commit: 06bff4d3050a3b1c23ebe8412e5f9730deddf83d [17/20] [NFU] resctrl: riscv: build CBQRI drivers
config: x86_64-randconfig-161-20260118 (https://download.01.org/0day-ci/archive/20260118/202601181527.mCItVrtA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181527.mCItVrtA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181527.mCItVrtA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/resctrl/riscv/cbqri_cache.c:6:
>> include/linux/riscv_qos.h:10:10: fatal error: asm/qos.h: No such file or directory
      10 | #include <asm/qos.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +10 include/linux/riscv_qos.h

279a516c8a1314 Drew Fustini 2023-04-19   9  
279a516c8a1314 Drew Fustini 2023-04-19 @10  #include <asm/qos.h>
279a516c8a1314 Drew Fustini 2023-04-19  11  

:::::: The code at line 10 was first introduced by commit
:::::: 279a516c8a131464cc73327ecfb2c6a62ad33622 RISC-V: QoS: define properties of CBQRI controllers

:::::: TO: Drew Fustini <fustini@kernel.org>
:::::: CC: Drew Fustini <fustini@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

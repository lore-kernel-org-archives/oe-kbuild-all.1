Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C1F1DF261
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743490324; cv=none; b=iBUsRtvEqN7Uhrmdq0WDcA1hjnHrwJso3Gi2w9OgJNxG/ttvQcipM4WiS1cjWoeSH3rUaUz7+F4W4+SzHvjvsWVMFYVneInK9idGAdTRD5wvb/fQZpTrBqfBsJ8RS2wetDTFgqFngwx51TQ1sJUoym7IfKzx8gzj+kaOTW/zL/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743490324; c=relaxed/simple;
	bh=KnVLzdzH4hMSspIYCxyrFoqAoO9bPLSe1z8LJ+Pade0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Si+zjEQRPe6Fa/LSlUIj4yhRfh7VM4514t+mIM+dn2DE78VFm47GM1nQXUk2Ov43jVb29N5whJy9bDb/J1fApAYkiSFXH8ZB7x/8M5TgH9B3KbnDPbSVxDM4QcLGx82YBvDmdaY9S9A+nf9o1fSO2bQpGgXp5rn6QJdq3iC9Qzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6RiCqN/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6RiCqN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743490322; x=1775026322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KnVLzdzH4hMSspIYCxyrFoqAoO9bPLSe1z8LJ+Pade0=;
  b=i6RiCqN/VCls0dULqqSlA1EnLHgYzMLrmuC8cizH1oNCXZ6YVLNdzJ9u
   X/CCI9oeKtZUNtLEaQYQzzIjokv9Fn7uQ1AA30ncHqtkHylOSDvVqTVmc
   zWw4EfAgweROi2JZmo7zkqjJHLPxBtOSTNSPSkhHPL/2Qp/lIcdctPX7W
   FUyWdllEy+vwoisloCxf7B3adt6pL5f+8zFZM/ntj1EvJWCRCR1JAKS13
   Q+ZfewZn9XZ2900ZSGuO7MTuAZ2FYdduISiBQPDFKdkSmEmRDrCFsA2v6
   Pi98abc6NOzLN6ZPbXhN3LImGIZquGkeJFEOfRlPxUCj9i61AdNDmoIXk
   w==;
X-CSE-ConnectionGUID: yM9wm5x/TsaOJhSdPLeSmw==
X-CSE-MsgGUID: 6Wsr+dHiQgOogbtSGATIcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="56162624"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="56162624"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 23:52:01 -0700
X-CSE-ConnectionGUID: YutgSJ12QViZ89RSs4Dbgw==
X-CSE-MsgGUID: ilPI676rReOew5wozRsXMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="126058131"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2025 23:51:59 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzVTV-0009gI-1L;
	Tue, 01 Apr 2025 06:51:54 +0000
Date: Tue, 1 Apr 2025 14:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1544/1544] fs/proc/etmem_scan.c:1031:
 undefined reference to `proc_page_scan_operations'
Message-ID: <202504011440.KymThb7O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9866a4dd6fd198f871f6c1692e61ce7d10c96836
commit: bad4d8833739acc8eef306e7ad5c7877f9f4f0fb [1544/1544] etmem: add etmem-scan feature
config: x86_64-randconfig-r113-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011440.KymThb7O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011440.KymThb7O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504011440.KymThb7O-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: fs/proc/etmem_scan.o: in function `page_scan_entry':
>> fs/proc/etmem_scan.c:1031: undefined reference to `proc_page_scan_operations'
>> ld: fs/proc/etmem_scan.c:1032: undefined reference to `proc_page_scan_operations'
>> ld: fs/proc/etmem_scan.c:1031: undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.c:1033: undefined reference to `proc_page_scan_operations'
>> ld: fs/proc/etmem_scan.c:1032: undefined reference to `proc_page_scan_operations'
   ld: fs/proc/etmem_scan.o:fs/proc/etmem_scan.c:1034: more undefined references to `proc_page_scan_operations' follow


vim +1031 fs/proc/etmem_scan.c

  1028	
  1029	static int page_scan_entry(void)
  1030	{
> 1031		proc_page_scan_operations.owner = THIS_MODULE;
> 1032		proc_page_scan_operations.read = page_scan_read;
  1033		proc_page_scan_operations.open = page_scan_open;
  1034		proc_page_scan_operations.release = page_scan_release;
  1035		return 0;
  1036	}
  1037	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B871FDA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 04:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KeuFVaRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704429024; x=1735965024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Xww92LyLc6tPt9kalGTMG9TaVfqsG/312bsnKjA8EM=;
  b=KeuFVaRBoVNCNvA8hkKdwaZH9PWXumaAyCj5AKKc/P1M0MDon8cM0n8E
   8/NymC2V4ELkwZGDoEHaMh443Zm2MJrR9zjkw7cs/wEDocoYNo8+Ld8Da
   /zGbaJYoH7ZuZdNjcPxsKSeF6QV1SzWm6HPWCFsuFEwW4qvVdDLTeH6fr
   FXciUitQyBPLZ0Y2zKEWpt8SPIKw7xllYr+ZEVoKraej2vwnIhhi3DUfn
   N/XNHVPf8BHBhwcjnhr4RtIt/p8L0tvGvE8ocOqTrJakgaPlZWd1GHePw
   1wIUzXyucL23F0nspjLbguKxQgvG2C50MFhivz9zEc0wTeJ5opL8tJZ/D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="387880137"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="387880137"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 20:30:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="904052379"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="904052379"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Jan 2024 20:30:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLbqS-0000mA-1m;
	Fri, 05 Jan 2024 04:30:08 +0000
Date: Fri, 5 Jan 2024 12:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 1/8] udmabuf: Use vmf_insert_pfn and VM_PFNMAP for
 handling mmap
Message-ID: <202401051229.BWklqSV8-lkp@intel.com>
References: <20240104072518.807950-2-vivek.kasireddy@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104072518.807950-2-vivek.kasireddy@intel.com>

Hi Vivek,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/udmabuf-Use-vmf_insert_pfn-and-VM_PFNMAP-for-handling-mmap/20240104-155026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240104072518.807950-2-vivek.kasireddy%40intel.com
patch subject: [PATCH v10 1/8] udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
config: riscv-randconfig-002-20240104 (https://download.01.org/0day-ci/archive/20240105/202401051229.BWklqSV8-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401051229.BWklqSV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051229.BWklqSV8-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/dma-buf/udmabuf.o: in function `.L0 ':
>> udmabuf.c:(.text.udmabuf_vm_fault+0x78): undefined reference to `vmf_insert_pfn'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A5F10781
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691411410; x=1722947410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FXJTq45AIqsfuwWwSJ2t/zwiSaFYQ3Xi7vuToBn1yV0=;
  b=OlwiE2YbiO/YFbplkywYbw21p62nw0NLKumankxjiaNacKauT47OXhVb
   CRh1AdSy82Ia5zEPAOsTb05+PhaGQheqrMz5YKP3E9AWFjbw8BGonXdYQ
   DzGayBHSikiz5RwAVJ347c0dhh5+eT2VqAO3zwrfRsthgAJdkUEOO3JE3
   P/u9/GJW7y1jR5diXe4uvXbp8ydxbNhk6kI8T3eZn/FqJBkAfF1BvzYSu
   BTzb362eGpPsimz8Ca7HRumn14tvS7ipXi5TXfqN8ti4TTghAwftW/JlP
   yOcjgMxNKKZiW0EJejD1FAMz2x/lnP8u+9x/AuvYNqgnwYlkVj90UT8sF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="436861965"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="436861965"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 05:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="707852437"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="707852437"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Aug 2023 05:28:54 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSzLx-0004fz-0D;
	Mon, 07 Aug 2023 12:28:53 +0000
Date: Mon, 7 Aug 2023 20:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dylan Jhong <dylan@andestech.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
	alexghiti@rivosinc.com, anup@brainfault.org, rppt@kernel.org,
	samuel@sholland.org, panqinglin2020@iscas.ac.cn,
	sergey.matyukevich@syntacore.com, maz@kernel.org,
	linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ycliang@andestech.com,
	x5710999x@gmail.com, tim609@andestech.com,
	Dylan Jhong <dylan@andestech.com>
Subject: Re: [PATCH 1/1] riscv: Implement arch_sync_kernel_mappings() for
 "preventive" TLB flush
Message-ID: <202308072050.0T0FlSpT-lkp@intel.com>
References: <20230807082305.198784-2-dylan@andestech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807082305.198784-2-dylan@andestech.com>

Hi Dylan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc5 next-20230807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dylan-Jhong/riscv-Implement-arch_sync_kernel_mappings-for-preventive-TLB-flush/20230807-162922
base:   linus/master
patch link:    https://lore.kernel.org/r/20230807082305.198784-2-dylan%40andestech.com
patch subject: [PATCH 1/1] riscv: Implement arch_sync_kernel_mappings() for "preventive" TLB flush
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230807/202308072050.0T0FlSpT-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308072050.0T0FlSpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308072050.0T0FlSpT-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: mm/memory.o: in function `.L1539':
>> memory.c:(.text+0x3b5c): undefined reference to `arch_sync_kernel_mappings'
   riscv64-linux-ld: mm/vmalloc.o: in function `.L301':
>> vmalloc.c:(.text+0xd24): undefined reference to `arch_sync_kernel_mappings'
   riscv64-linux-ld: mm/vmalloc.o: in function `vb_alloc.constprop.0':
   vmalloc.c:(.text+0x2c4e): undefined reference to `arch_sync_kernel_mappings'
   riscv64-linux-ld: mm/vmalloc.o: in function `.L0 ':
   vmalloc.c:(.text+0x2f2c): undefined reference to `arch_sync_kernel_mappings'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

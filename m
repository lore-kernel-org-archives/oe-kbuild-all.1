Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0357F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 03:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675827289; x=1707363289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6kRFyxQHHedbgLEa5qA0GQP9wwzW4XaVy2z+gJFxG3Q=;
  b=FF2gG83i5b5VYHGTu+/wvMdwqBuby9kqZyQUfwp6CtXZSTIaUmWUD72V
   weuan2Ahqb8E+AtZ6wWODNei61CAvKAyXasmyVQLtWCCRl0k6YjUOa40I
   5dk8SBPeczAUSJgZk/v5gA0lhZkwQO+R7Knay+y7wEYc7pz/4bIG9yMJS
   D6oIN0IPnZNYAj6k3hdhhvPT1Wgm52HLK92VmHoa6CAWQQfIHqBINkKVV
   kWWldUVqZMy7l+m9JT96MsXu/fePvnREfkJ7qLzw+5djO26uvw+NrVtPb
   KtBvD6u8q+Ew81Jfqjv7iKPmXLssE5vK+93cfSoRwaiOjlCatVXIJDcPm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="394291434"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="394291434"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 19:34:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="617056736"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="617056736"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Feb 2023 19:34:47 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPbEN-000492-0X;
	Wed, 08 Feb 2023 03:34:47 +0000
Date: Wed, 8 Feb 2023 11:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest 102/136] arch/x86/kernel/tdx.c:712:15: sparse:
 sparse: symbol 'tdx_mmio_readq' was not declared. Should it be static?
Message-ID: <202302081112.STP1dlyS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest
head:   f3d7a7e86bf2f0d5ce629f2fb7be11dca88ac06d
commit: c2b75088b70d45a8b98121cd1c4a4fa1380d4cf7 [102/136] x86/tdx: Enable direct iomap MMIO optimizations
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230208/202302081112.STP1dlyS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/c2b75088b70d45a8b98121cd1c4a4fa1380d4cf7
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest
        git checkout c2b75088b70d45a8b98121cd1c4a4fa1380d4cf7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/tdx.c:267:5: sparse: sparse: symbol 'tdx_hcall_set_notify_intr' was not declared. Should it be static?
   arch/x86/kernel/tdx.c:490:14: sparse: sparse: symbol 'tdx_write_msr' was not declared. Should it be static?
>> arch/x86/kernel/tdx.c:712:15: sparse: sparse: symbol 'tdx_mmio_readq' was not declared. Should it be static?

vim +/tdx_mmio_readq +712 arch/x86/kernel/tdx.c

   711	
 > 712	unsigned long tdx_mmio_readq(void __iomem *addr)
   713	{
   714		unsigned long val;
   715	
   716		if (tdx_virt_mmio(8, false, (unsigned long)addr, &val))
   717			return 0xffffffffffffffff;
   718		return val;
   719	}
   720	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075F637B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 01:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675820986; x=1707356986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dq+oOI+8hUIxlaQV4myDWkn1y+QrvpTy2jbijQaNCiU=;
  b=W7Snfm2PY8E9UDQl5ikHFXH8zXZ53ac3hKrwiMlpGi2kMn0OY4IyJ5yL
   ddnx9xxY+S5L6sDZmoyfPLFGq8w7uV2CCG1r1PoRABOyK0XjaxnyC+IUd
   vLtfdYk79fG4JL2XIQSzEZWghZvEbAJvfJ2DOGh+EnInnGcB3Xqm4QexX
   Lc/yFOHllwMl5Qp78Kx4cTp2GOsiZZEJZF/OjQzfaeyCF0h5o+SfgCgsA
   b4ElxXGvur6QivgfJhl3x/yl8fheNIno2wFsjVurPoFQygvH3bmeOGTG5
   z8v8VMYbpeN6PiGe5RJ9RC9SFWz3p/VgSA0ncbGdrVlnfRvRgq9HjeEqD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="329705040"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="329705040"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 17:49:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="775803557"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="775803557"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2023 17:49:44 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPZah-00043i-2O;
	Wed, 08 Feb 2023 01:49:43 +0000
Date: Wed, 8 Feb 2023 09:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest 98/136] arch/x86/kernel/tdx.c:489:14: sparse:
 sparse: symbol 'tdx_write_msr' was not declared. Should it be static?
Message-ID: <202302080926.xWuOGK2j-lkp@intel.com>
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
commit: 0b2ba653fca5799158883bdaefabe6176aea7db9 [98/136] x86/tdx: Use direct paravirt call for wrmsrl
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230208/202302080926.xWuOGK2j-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/0b2ba653fca5799158883bdaefabe6176aea7db9
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest
        git checkout 0b2ba653fca5799158883bdaefabe6176aea7db9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/tdx.c:266:5: sparse: sparse: symbol 'tdx_hcall_set_notify_intr' was not declared. Should it be static?
>> arch/x86/kernel/tdx.c:489:14: sparse: sparse: symbol 'tdx_write_msr' was not declared. Should it be static?

vim +/tdx_write_msr +489 arch/x86/kernel/tdx.c

   488	
 > 489	void notrace tdx_write_msr(unsigned int msr, u32 low, u32 high)
   490	{
   491		if (tdx_fast_tdcall_path_msr(msr))
   492			tdx_write_msr_safe(msr, low, high);
   493		else
   494			native_write_msr(msr, low, high);
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

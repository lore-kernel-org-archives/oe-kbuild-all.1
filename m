Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9896101
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 08:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696061290; x=1727597290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LqVFbkhV5pJt3JLQDEZo6gLw8U7hmdC/KPEqBMHWmSk=;
  b=P+5xu+3KPAlNzz2Ck95vuyVTe/+vBHISrvAmlZiij/DB5SFmwQ1VUq9Q
   A+53TVNUqz2JURlI6toTgwkARCvEh2AuciN6PGJRZaHXF+AkeB8SbObGM
   msGdo1fId5R/4z+WKI7gbWvm0/Na9kcBjU47ELbqfHoIs4gW0dyhBEkWU
   j2gtvWUbHfwmx/qgeBBknGqAbrAC8Kd7RlbjcDH1nLPl6tk9wVCSW2BXT
   npxy3jUGId5yGfchonPH4GbYn4qWlyIhBjLeyELK4Yyhdos7DApA4QsyO
   5e/nfFzG7okEz9S5EGxycPPHVeqAyQeDzr5E9cAJ42Scwav89EaRkiwBV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="413333866"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="413333866"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 01:08:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="997149842"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="997149842"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Sep 2023 01:08:08 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmV1B-0003tb-2W;
	Sat, 30 Sep 2023 08:08:05 +0000
Date: Sat, 30 Sep 2023 16:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-kexec 6/13] arch/x86/hyperv/ivm.c:611:53: error:
 assignment to 'int (*)(long unsigned int,  int,  bool)' {aka 'int (*)(long
 unsigned int,  int,  _Bool)'} from incompatible pointer type 'bool (*)(long
 unsigned int,  int,  bool)' {aka '_Bool (*)(long unsigned int,  int...
Message-ID: <202309301607.LtdmAS2t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-kexec
head:   34488d4fd2b299a51196e878575dd1e83cbbbc7f
commit: 5b0bf2c45e44dcbe901d262a72c26b2088b5719c [6/13] x86/mm: Make x86_platform.guest.enc_status_change_*() return errno
config: x86_64-randconfig-015-20230930 (https://download.01.org/0day-ci/archive/20230930/202309301607.LtdmAS2t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301607.LtdmAS2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301607.LtdmAS2t-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/hyperv/ivm.c: In function 'hv_vtom_init':
>> arch/x86/hyperv/ivm.c:611:53: error: assignment to 'int (*)(long unsigned int,  int,  bool)' {aka 'int (*)(long unsigned int,  int,  _Bool)'} from incompatible pointer type 'bool (*)(long unsigned int,  int,  bool)' {aka '_Bool (*)(long unsigned int,  int,  _Bool)'} [-Werror=incompatible-pointer-types]
     611 |         x86_platform.guest.enc_status_change_finish = hv_vtom_set_host_visibility;
         |                                                     ^
   cc1: some warnings being treated as errors


vim +611 arch/x86/hyperv/ivm.c

d3a9d7e49d1531 Dexuan Cui     2023-08-24  596  
d3a9d7e49d1531 Dexuan Cui     2023-08-24  597  	case HV_ISOLATION_TYPE_TDX:
d3a9d7e49d1531 Dexuan Cui     2023-08-24  598  		cc_vendor = CC_VENDOR_INTEL;
d3a9d7e49d1531 Dexuan Cui     2023-08-24  599  		break;
d3a9d7e49d1531 Dexuan Cui     2023-08-24  600  
d3a9d7e49d1531 Dexuan Cui     2023-08-24  601  	default:
d3a9d7e49d1531 Dexuan Cui     2023-08-24  602  		panic("hv_vtom_init: unsupported isolation type %d\n", type);
d3a9d7e49d1531 Dexuan Cui     2023-08-24  603  	}
d3a9d7e49d1531 Dexuan Cui     2023-08-24  604  
812b0597fb4043 Michael Kelley 2023-03-26  605  	cc_set_mask(ms_hyperv.shared_gpa_boundary);
812b0597fb4043 Michael Kelley 2023-03-26  606  	physical_mask &= ms_hyperv.shared_gpa_boundary - 1;
812b0597fb4043 Michael Kelley 2023-03-26  607  
812b0597fb4043 Michael Kelley 2023-03-26  608  	x86_platform.hyper.is_private_mmio = hv_is_private_mmio;
812b0597fb4043 Michael Kelley 2023-03-26  609  	x86_platform.guest.enc_cache_flush_required = hv_vtom_cache_flush_required;
812b0597fb4043 Michael Kelley 2023-03-26  610  	x86_platform.guest.enc_tlb_flush_required = hv_vtom_tlb_flush_required;
812b0597fb4043 Michael Kelley 2023-03-26 @611  	x86_platform.guest.enc_status_change_finish = hv_vtom_set_host_visibility;
c957f1f3c498bc Juergen Gross  2023-05-02  612  
c957f1f3c498bc Juergen Gross  2023-05-02  613  	/* Set WB as the default cache mode. */
c957f1f3c498bc Juergen Gross  2023-05-02  614  	mtrr_overwrite_state(NULL, 0, MTRR_TYPE_WRBACK);
812b0597fb4043 Michael Kelley 2023-03-26  615  }
812b0597fb4043 Michael Kelley 2023-03-26  616  

:::::: The code at line 611 was first introduced by commit
:::::: 812b0597fb4043240724e4c7bed7ba1fe15c0e3f x86/hyperv: Change vTOM handling to use standard coco mechanisms

:::::: TO: Michael Kelley <mikelley@microsoft.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

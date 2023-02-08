Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C686036E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 05:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675832813; x=1707368813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=adDutJM3dUgdWzLuj5H3FytZrMnmCgWAaJhoobdjCso=;
  b=i3JAdN8ISC4ZrIGdnegUdMq9mtNzDWUzPw2jBnkZJ9Rqi9yW+OGdNsap
   vHHQopho5xSNIdpM3x3/zMdlA65LOtO5iKfuy91AtVhXzLetLD1h8dkjE
   RUamDRJjbQpp+zRN+GJxB/amWw3LVOlXZqw5qrJMPkf3HBuQM7K5+YtT7
   GByOm0prbMzeXVe7MlVF9jEbnD1CRHwmQ8JnoVzq+UIBejVscoOa+1TU+
   uP8gvhTwmKNSo3Dx3BpOkc/JedhcOcTrikXvZQLXOq+WrlQBFqbaIXlz8
   bevxH1jzw6JEA0Frur1dsk9n0T7sfJF9oQZeoJukkSgrEC3YKA5J7BrK9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="329738402"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="329738402"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 21:06:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="669044157"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="669044157"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Feb 2023 21:06:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPcfR-0004D4-3D;
	Wed, 08 Feb 2023 05:06:50 +0000
Date: Wed, 8 Feb 2023 13:06:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:ucode-for-ashok 3/16]
 arch/x86/kernel/cpu/microcode/amd.c:686:29: warning: unused variable 'c'
Message-ID: <202302081219.Mjn7uGWh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git ucode-for-ashok
head:   01bd4486138ec018e1bb204d93e4e52190dfde21
commit: 58a58f297959dfa2dc6a90e01a2b273f7954df54 [3/16] x86/microcode: Update cpuinfo_x86 microcode version in common code
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230208/202302081219.Mjn7uGWh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/commit/?id=58a58f297959dfa2dc6a90e01a2b273f7954df54
        git remote add daveh-devel https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git
        git fetch --no-tags daveh-devel ucode-for-ashok
        git checkout 58a58f297959dfa2dc6a90e01a2b273f7954df54
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/cpu/microcode/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/amd.c: In function 'apply_microcode_amd':
   arch/x86/kernel/cpu/microcode/amd.c:709:17: error: label 'out' used but not defined
     709 |                 goto out;
         |                 ^~~~
>> arch/x86/kernel/cpu/microcode/amd.c:686:29: warning: unused variable 'c' [-Wunused-variable]
     686 |         struct cpuinfo_x86 *c = &cpu_data(cpu);
         |                             ^


vim +/c +686 arch/x86/kernel/cpu/microcode/amd.c

80cc9f1020f49c arch/x86/kernel/microcode_amd.c     Peter Oruba     2008-07-28  683  
3f1f576a195aa2 arch/x86/kernel/cpu/microcode/amd.c Borislav Petkov 2018-02-16  684  static enum ucode_state apply_microcode_amd(int cpu)
80cc9f1020f49c arch/x86/kernel/microcode_amd.c     Peter Oruba     2008-07-28  685  {
bcb80e53877c20 arch/x86/kernel/microcode_amd.c     Borislav Petkov 2011-10-17 @686  	struct cpuinfo_x86 *c = &cpu_data(cpu);
2efb05e8e9fa35 arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-08-01  687  	struct microcode_amd *mc_amd;
2efb05e8e9fa35 arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-08-01  688  	struct ucode_cpu_info *uci;
2efb05e8e9fa35 arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-08-01  689  	struct ucode_patch *p;
8da38ebaad23fe arch/x86/kernel/cpu/microcode/amd.c Filippo Sironi  2018-07-31  690  	enum ucode_state ret;
2b730952066cd0 arch/x86/kernel/cpu/microcode/amd.c Borislav Petkov 2019-09-28  691  	u32 rev, dummy __always_unused;
80cc9f1020f49c arch/x86/kernel/microcode_amd.c     Peter Oruba     2008-07-28  692  
2efb05e8e9fa35 arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-08-01  693  	BUG_ON(raw_smp_processor_id() != cpu);
80cc9f1020f49c arch/x86/kernel/microcode_amd.c     Peter Oruba     2008-07-28  694  
2efb05e8e9fa35 arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-08-01  695  	uci = ucode_cpu_info + cpu;
2efb05e8e9fa35 arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-08-01  696  
2efb05e8e9fa35 arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-08-01  697  	p = find_patch(cpu);
2efb05e8e9fa35 arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-08-01  698  	if (!p)
3f1f576a195aa2 arch/x86/kernel/cpu/microcode/amd.c Borislav Petkov 2018-02-16  699  		return UCODE_NFOUND;
80cc9f1020f49c arch/x86/kernel/microcode_amd.c     Peter Oruba     2008-07-28  700  
2efb05e8e9fa35 arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-08-01  701  	mc_amd  = p->data;
2efb05e8e9fa35 arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-08-01  702  	uci->mc = p->data;
2efb05e8e9fa35 arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-08-01  703  
f3ad136d6ef966 arch/x86/kernel/cpu/microcode/amd.c Borislav Petkov 2017-01-20  704  	rdmsr(MSR_AMD64_PATCH_LEVEL, rev, dummy);
80cc9f1020f49c arch/x86/kernel/microcode_amd.c     Peter Oruba     2008-07-28  705  
685ca6d797af9d arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-06-20  706  	/* need to apply patch? */
685ca6d797af9d arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-06-20  707  	if (rev >= mc_amd->hdr.patch_id) {
8da38ebaad23fe arch/x86/kernel/cpu/microcode/amd.c Filippo Sironi  2018-07-31  708  		ret = UCODE_OK;
8da38ebaad23fe arch/x86/kernel/cpu/microcode/amd.c Filippo Sironi  2018-07-31 @709  		goto out;
685ca6d797af9d arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-06-20  710  	}
685ca6d797af9d arch/x86/kernel/microcode_amd.c     Borislav Petkov 2012-06-20  711  
d982057f631df0 arch/x86/kernel/microcode_amd.c     Torsten Kaiser  2013-07-23  712  	if (__apply_microcode_amd(mc_amd)) {
258721ef34fce9 arch/x86/kernel/microcode_amd.c     Borislav Petkov 2011-01-05  713  		pr_err("CPU%d: update failed for patch_level=0x%08x\n",
f58e1f53de52a7 arch/x86/kernel/microcode_amd.c     Joe Perches     2009-12-08  714  			cpu, mc_amd->hdr.patch_id);
3f1f576a195aa2 arch/x86/kernel/cpu/microcode/amd.c Borislav Petkov 2018-02-16  715  		return UCODE_ERROR;
d982057f631df0 arch/x86/kernel/microcode_amd.c     Torsten Kaiser  2013-07-23  716  	}
80cc9f1020f49c arch/x86/kernel/microcode_amd.c     Peter Oruba     2008-07-28  717  
8da38ebaad23fe arch/x86/kernel/cpu/microcode/amd.c Filippo Sironi  2018-07-31  718  	rev = mc_amd->hdr.patch_id;
8da38ebaad23fe arch/x86/kernel/cpu/microcode/amd.c Filippo Sironi  2018-07-31  719  	ret = UCODE_UPDATED;
8da38ebaad23fe arch/x86/kernel/cpu/microcode/amd.c Filippo Sironi  2018-07-31  720  
8da38ebaad23fe arch/x86/kernel/cpu/microcode/amd.c Filippo Sironi  2018-07-31  721  	pr_info("CPU%d: new patch_level=0x%08x\n", cpu, rev);
8da38ebaad23fe arch/x86/kernel/cpu/microcode/amd.c Filippo Sironi  2018-07-31  722  
8da38ebaad23fe arch/x86/kernel/cpu/microcode/amd.c Filippo Sironi  2018-07-31  723  	uci->cpu_sig.rev = rev;
370a132bb2227f arch/x86/kernel/cpu/microcode/amd.c Prarit Bhargava 2018-07-31  724  
8da38ebaad23fe arch/x86/kernel/cpu/microcode/amd.c Filippo Sironi  2018-07-31  725  	return ret;
80cc9f1020f49c arch/x86/kernel/microcode_amd.c     Peter Oruba     2008-07-28  726  }
80cc9f1020f49c arch/x86/kernel/microcode_amd.c     Peter Oruba     2008-07-28  727  

:::::: The code at line 686 was first introduced by commit
:::::: bcb80e53877c2045d9e52f4a71372c3fe6501f6f x86, microcode, AMD: Add microcode revision to /proc/cpuinfo

:::::: TO: Borislav Petkov <borislav.petkov@amd.com>
:::::: CC: Borislav Petkov <borislav.petkov@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17DA7F4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 02:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691635324; x=1723171324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pxYgUeZ7oW6PH99IQ8aR2h6Krc1Ha7iEqoQ/zcXq1JE=;
  b=W4knPWtvA6UCoWX+bu2wDtW7QQ+07P74l3MrgLZTa0nsB4qw0OEvIAG5
   50GdZsuRoFUTGga4aPVyn9M7b6147SNoOSHA51pokGnmJdEGcfVIxcNs8
   uliyY1RBDwWTsZ6HN3NdApQZLr7K+cJmnXjLRG4mwd5QMLa9rnINW+pfd
   K/ZckFJtfGbwHuCersyTUEw6Grz5K9T32YzuB+sWwC9TCvnle3CZKV15y
   1dl345eRz9CsDHNkxuOglG18xrEUM0sMMWx8L8m/ftGalT3+yyWXa00Rn
   2zEpFQ9xF0Rrmh37FJv4cnA9Vcexh8nf+S2Dg2WXtiaDQbvrJyjw0yH1E
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="437638573"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="437638573"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 19:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="846194724"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="846194724"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2023 19:41:57 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTvca-0006fO-1G;
	Thu, 10 Aug 2023 02:41:56 +0000
Date: Thu, 10 Aug 2023 10:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 247/358]
 arch/x86/kvm/trace.h:151: warning: "TDG_VP_VMCALL" redefined
Message-ID: <202308101006.RtsTo5XD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   5b1f1957f70a985c147be902e3429e46f06c4769
commit: bf714e777e9e10870f9b9c354ee5cc71d866bfdd [247/358] KVM: TDX: add trace point for TDG.VP.VMCALL
config: i386-randconfig-i002-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101006.RtsTo5XD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101006.RtsTo5XD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101006.RtsTo5XD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/i8259.c:37:
>> arch/x86/kvm/trace.h:151: warning: "TDG_VP_VMCALL" redefined
     151 | #define TDG_VP_VMCALL(x) {x, #x}
         | 
   In file included from arch/x86/include/asm/tdx.h:12,
                    from arch/x86/include/asm/kvm_para.h:10,
                    from include/uapi/linux/kvm_para.h:37,
                    from include/linux/kvm_para.h:5,
                    from include/linux/kvm_host.h:41,
                    from arch/x86/kvm/irq.h:15,
                    from arch/x86/kvm/i8259.c:34:
   arch/x86/include/asm/shared/tdx.h:14: note: this is the location of the previous definition
      14 | #define TDG_VP_VMCALL                   0
         | 


vim +/TDG_VP_VMCALL +151 arch/x86/kvm/trace.h

   150	
 > 151	#define TDG_VP_VMCALL(x) {x, #x}
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

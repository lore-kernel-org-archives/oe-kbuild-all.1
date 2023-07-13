Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177D718AE1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 14:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689257817; x=1720793817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hqOGXQGh867SA28wkkLAEKz06wBfeIH6NMfRsebRATI=;
  b=SN/UtMcHJsyVc9LjSMSG1KSfMV8ReJWndkoYrZlr/cGtoOeETvkbrBtE
   3+j5gL5qHg6xWycVSRxCBaPdraAxMWBt0mtTf7UXcOHhHV+5FpU4wkpoU
   FAgax3Rn7/quQsHaNFAQBTJvWiDz/9qo5K1YY8wwChmvuiiskjihLbnp3
   kiSmwoM50Hs3RsIX6urk0L2CV5wpG2VkRDiKNJ2oekLJII/Me38ikXVgD
   +eINC1te8y82foDeytXQ57E5tVCZdBLoFXZK7vo3QMnPDCUyhhxbYqyUP
   OtL+c/RnHZv3DNJjS6l1WtJxUEP1mry+jpJ/Xwl/O4n296QzDbRImVzsh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="344794242"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="344794242"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 07:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="721991887"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="721991887"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Jul 2023 07:16:54 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJx7m-0006el-0y;
	Thu, 13 Jul 2023 14:16:54 +0000
Date: Thu, 13 Jul 2023 22:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Green <evan@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [conor:riscv-extensions-strings-scalar-crypto 13/13]
 arch/riscv/kernel/cpufeature.c:228:1: warning: 'inline' is not at beginning
 of declaration
Message-ID: <202307132247.uzD4fSvu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git riscv-extensions-strings-scalar-crypto
head:   8300b98e487e57d192bc9581c6a3639c40c52623
commit: 8300b98e487e57d192bc9581c6a3639c40c52623 [13/13] RISC-V: Add support Scalar Crypto using "bundled extensions"
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230713/202307132247.uzD4fSvu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307132247.uzD4fSvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307132247.uzD4fSvu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/cpufeature.c:228:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     228 | static void inline __init match_isa_ext(const struct riscv_isa_ext_data *ext, const char *name,
         | ^~~~~~


vim +/inline +228 arch/riscv/kernel/cpufeature.c

   227	
 > 228	static void inline __init match_isa_ext(const struct riscv_isa_ext_data *ext, const char *name,
   229						const char *name_end, struct riscv_isainfo *isainfo)
   230	{
   231		if ((name_end - name == strlen(ext->name)) &&
   232		     !strncasecmp(name, ext->name, name_end - name)) {
   233			/*
   234			 * If this is a bundle, enable all the ISA extensions that
   235			 * comprise the bundle.
   236			 */
   237			if (ext->bundle_size) {
   238				for (int i = 0; i < ext->bundle_size; i++) {
   239					if (riscv_isa_extension_check(ext->bundle_ids[i]))
   240						set_bit(ext->bundle_ids[i], isainfo->isa);
   241				}
   242			} else if (riscv_isa_extension_check(ext->id)) {
   243				set_bit(ext->id, isainfo->isa);
   244			}
   245		}
   246	}
   247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

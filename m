Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC5101F0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 11:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689765416; x=1721301416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LzlhbIrVKkVGaTeANt1AIbCeJlXC9m5/WBXsJyVgPGM=;
  b=UcntPIsVOT3irl/kWqQLxQADxOBtdD7U7kN0U/kBxwF+5Ti8ahUhL9t2
   YV2k9SCfLb0sQf2WJqx3iaOfLentcWNseeKMeDVnuAxT/Agiqo1TfQzKi
   QOHKe0QZi008mQqAuBIw3TZeoQFY47wD5+iWOtW6N09oSF4rSzbwHe4fD
   TQ+zKXE1xM/GSZTF/Ojvhn2Roq+zJhiecNSWbpA+p47WLHUP8OaVFsvPu
   ECc7vYaTh7r35tys565Y4aPtkNh/yG5PmB2cVeE+aqoKQH6GZBZ0F38ZW
   gtXcHMoshDVPUZsvLi+1cYAv84qzC9i6mSXZMonYoPS1Hh/QUosU4inSS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="366476063"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="366476063"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 04:16:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="723960912"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="723960912"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 Jul 2023 04:16:44 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM5Ai-0004iH-03;
	Wed, 19 Jul 2023 11:16:44 +0000
Date: Wed, 19 Jul 2023 19:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 126/12466]
 sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for
 function 'fsl_easrc_get_status'
Message-ID: <202307191906.2PiHRJog-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shengjiu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: 46ac86d263c28d721f9f740b0e31d488ee95bc43 [126/12466] MLK-21940-4: ASoC: fsl_easrc: Support the m2m function
config: x86_64-randconfig-r015-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191906.2PiHRJog-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191906.2PiHRJog-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191906.2PiHRJog-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_easrc.c:1754:
>> sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for function 'fsl_easrc_get_status' [-Wmissing-prototypes]
   void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
        ^
   sound/soc/fsl/fsl_easrc_m2m.c:19:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
   ^
   static 
>> sound/soc/fsl/fsl_easrc_m2m.c:282:5: warning: no previous prototype for function 'fsl_easrc_process_buffer_pre' [-Wmissing-prototypes]
   int fsl_easrc_process_buffer_pre(struct fsl_easrc_m2m *m2m, bool dir)
       ^
   sound/soc/fsl/fsl_easrc_m2m.c:282:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fsl_easrc_process_buffer_pre(struct fsl_easrc_m2m *m2m, bool dir)
   ^
   static 
>> sound/soc/fsl/fsl_easrc_m2m.c:415:6: warning: no previous prototype for function 'fsl_easrc_submit_dma' [-Wmissing-prototypes]
   void fsl_easrc_submit_dma(struct fsl_easrc_m2m *m2m)
        ^
   sound/soc/fsl/fsl_easrc_m2m.c:415:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void fsl_easrc_submit_dma(struct fsl_easrc_m2m *m2m)
   ^
   static 
   3 warnings generated.


vim +/fsl_easrc_get_status +19 sound/soc/fsl/fsl_easrc_m2m.c

    18	
  > 19	void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
    20				  struct asrc_status_flags *flags)
    21	{
    22		flags->overload_error = 0;
    23	}
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

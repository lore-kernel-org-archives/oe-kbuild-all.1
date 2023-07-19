Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675F71FB3E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 17:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689787995; x=1721323995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wEnidKb99MW1zb6ipNXnYSMOHIc64WkdO6X50MyuVPA=;
  b=f5ovTnaxFzOCgF6gF/Mus6fQZNVhgEGS7RmwxEPhsmlmfUVneiOgw9Cd
   2anIdGL1vX7FFKgF20KcKeRngbedk7If6NDKKGzgaaN5ZCldz/Ta2WqTR
   9CWnCEuEOiw1rR4fFMYW8CKpaJvthA0j0+sb4kb15hx2g4N6WGGPxbu2f
   635+sK+tX8YHpkzNl8GTPox0B1Wo+P/8mdHd663af3/j5mwACZhlV1DEi
   aV5g8IlRlQwfIudR6JarNNdcbXP2109C1DwXC1225Uoswm+2Dl1uEvhjK
   EfgFg4NbqyZAlZJL/Wxe7nT/f8NiA3n5DHfLsWfniduJQ5L5onNNrYhKq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430297830"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="430297830"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 10:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="794130466"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="794130466"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2023 10:33:11 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMB2w-0005LF-1I;
	Wed, 19 Jul 2023 17:33:07 +0000
Date: Thu, 20 Jul 2023 01:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 126/12467]
 sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for
 'fsl_easrc_get_status'
Message-ID: <202307200145.rqoO2iHA-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-2.0.x-imx
head:   b872b1170fc8843b55e9f8838dd373ff43bb7552
commit: 46ac86d263c28d721f9f740b0e31d488ee95bc43 [126/12467] MLK-21940-4: ASoC: fsl_easrc: Support the m2m function
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307200145.rqoO2iHA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200145.rqoO2iHA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200145.rqoO2iHA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/fsl/fsl_easrc.c:1754:
>> sound/soc/fsl/fsl_easrc_m2m.c:19:6: warning: no previous prototype for 'fsl_easrc_get_status' [-Wmissing-prototypes]
      19 | void fsl_easrc_get_status(struct fsl_asrc_pair *ctx,
         |      ^~~~~~~~~~~~~~~~~~~~
>> sound/soc/fsl/fsl_easrc_m2m.c:282:5: warning: no previous prototype for 'fsl_easrc_process_buffer_pre' [-Wmissing-prototypes]
     282 | int fsl_easrc_process_buffer_pre(struct fsl_easrc_m2m *m2m, bool dir)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/fsl/fsl_easrc_m2m.c:415:6: warning: no previous prototype for 'fsl_easrc_submit_dma' [-Wmissing-prototypes]
     415 | void fsl_easrc_submit_dma(struct fsl_easrc_m2m *m2m)
         |      ^~~~~~~~~~~~~~~~~~~~


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

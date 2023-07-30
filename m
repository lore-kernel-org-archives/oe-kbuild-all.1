Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF9E100B9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 17:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690739515; x=1722275515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IviZgKqIBQs+rQqZ3cwTkFLo61D6KyK2INY+NTLF+90=;
  b=ZcWo+NnXbzNHugTY7rJnBy61/qLrAP5tSM8n7NB+863SFTBzqWy6nc1e
   KQyWouwp3Yq7jKzTl92A4Bf2gyH1dRWooAafW53A2t/g5HMXxczm51ieE
   tsjpFa3oVPSymOGbN1RbAEXrRLy4C6WPjqJw06l+bOW57G6E0KJ30YEpC
   AKNzIB0sF/AvY9boIEv8zJ0Szrmh4yb2617h0Yz3feYyCU4gz8pu67HFe
   es9GVc16Gw7suMYIIOwPDUKbptPPiQdE043CEeU8lMUr92hKuuJqwpH5u
   fZDIJLp+mwbjglrPe2dWVC1ohS61jNwl5DZabaXWlYwHkY+Vo7lKdk/63
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="435165434"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="435165434"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 10:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="731332070"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="731332070"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jul 2023 10:51:50 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQAa3-0004ip-2s;
	Sun, 30 Jul 2023 17:51:47 +0000
Date: Mon, 31 Jul 2023 01:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/3] firmware: qcom_scm: Add support for Qualcomm
 Secure Execution Environment SCM interface
Message-ID: <202307310104.C9TMGNaM-lkp@intel.com>
References: <20230730161906.606163-3-luzmaximilian@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230730161906.606163-3-luzmaximilian@gmail.com>

Hi Maximilian,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc3 next-20230728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maximilian-Luz/lib-ucs2_string-Add-UCS-2-strscpy-function/20230731-002132
base:   linus/master
patch link:    https://lore.kernel.org/r/20230730161906.606163-3-luzmaximilian%40gmail.com
patch subject: [PATCH v5 2/3] firmware: qcom_scm: Add support for Qualcomm Secure Execution Environment SCM interface
config: nios2-randconfig-r011-20230730 (https://download.01.org/0day-ci/archive/20230731/202307310104.C9TMGNaM-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310104.C9TMGNaM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307310104.C9TMGNaM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   nios2-linux-ld: drivers/firmware/qcom_scm-smc.o: in function `qcom_scm_qseecom_app_get_id':
>> drivers/firmware/qcom_scm-smc.c:136: multiple definition of `qcom_scm_qseecom_app_get_id'; drivers/firmware/qcom_scm.o:qcom_scm.c:(.text+0xc2c): first defined here
   nios2-linux-ld: drivers/firmware/qcom_scm-smc.o: in function `qcom_scm_qseecom_app_send':
>> drivers/firmware/qcom_scm-smc.c:142: multiple definition of `qcom_scm_qseecom_app_send'; drivers/firmware/qcom_scm.o:qcom_scm.c:(.text+0xc34): first defined here
   nios2-linux-ld: drivers/firmware/qcom_scm-legacy.o: in function `qcom_scm_qseecom_app_get_id':
   drivers/firmware/qcom_scm-legacy.c:136: multiple definition of `qcom_scm_qseecom_app_get_id'; drivers/firmware/qcom_scm.o:qcom_scm.c:(.text+0xc2c): first defined here
   nios2-linux-ld: drivers/firmware/qcom_scm-legacy.o: in function `qcom_scm_qseecom_app_send':
   drivers/firmware/qcom_scm-legacy.c:142: multiple definition of `qcom_scm_qseecom_app_send'; drivers/firmware/qcom_scm.o:qcom_scm.c:(.text+0xc34): first defined here
--
   In file included from drivers/firmware/qcom_scm-smc.c:11:
>> include/linux/firmware/qcom/qcom_scm.h:133:5: warning: no previous prototype for 'qcom_scm_qseecom_app_get_id' [-Wmissing-prototypes]
     133 | int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/firmware/qcom/qcom_scm.h:138:5: warning: no previous prototype for 'qcom_scm_qseecom_app_send' [-Wmissing-prototypes]
     138 | int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size, void *rsp,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +136 drivers/firmware/qcom_scm-smc.c

6bf32599223634 drivers/firmware/qcom_scm-smc.c Guru Das Srinagesh 2023-01-13  117  
6bf32599223634 drivers/firmware/qcom_scm-smc.c Guru Das Srinagesh 2023-01-13  118  static int __scm_smc_do(struct device *dev, struct arm_smccc_args *smc,
3f951ea627dae8 drivers/firmware/qcom_scm-64.c  Elliot Berman      2020-01-07  119  			struct arm_smccc_res *res, bool atomic)
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  120  {
6bf32599223634 drivers/firmware/qcom_scm-smc.c Guru Das Srinagesh 2023-01-13  121  	int ret, retry_count = 0;
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  122  
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  123  	if (atomic) {
3f951ea627dae8 drivers/firmware/qcom_scm-64.c  Elliot Berman      2020-01-07  124  		__scm_smc_do_quirk(smc, res);
6bf32599223634 drivers/firmware/qcom_scm-smc.c Guru Das Srinagesh 2023-01-13  125  		return 0;
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  126  	}
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  127  
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  128  	do {
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  129  		mutex_lock(&qcom_scm_lock);
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  130  
6bf32599223634 drivers/firmware/qcom_scm-smc.c Guru Das Srinagesh 2023-01-13  131  		ret = __scm_smc_do_quirk_handle_waitq(dev, smc, res);
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  132  
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  133  		mutex_unlock(&qcom_scm_lock);
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  134  
6bf32599223634 drivers/firmware/qcom_scm-smc.c Guru Das Srinagesh 2023-01-13  135  		if (ret)
6bf32599223634 drivers/firmware/qcom_scm-smc.c Guru Das Srinagesh 2023-01-13 @136  			return ret;
6bf32599223634 drivers/firmware/qcom_scm-smc.c Guru Das Srinagesh 2023-01-13  137  
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  138  		if (res->a0 == QCOM_SCM_V2_EBUSY) {
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  139  			if (retry_count++ > QCOM_SCM_EBUSY_MAX_RETRY)
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  140  				break;
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  141  			msleep(QCOM_SCM_EBUSY_WAIT_MS);
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20 @142  		}
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  143  	}  while (res->a0 == QCOM_SCM_V2_EBUSY);
6bf32599223634 drivers/firmware/qcom_scm-smc.c Guru Das Srinagesh 2023-01-13  144  
6bf32599223634 drivers/firmware/qcom_scm-smc.c Guru Das Srinagesh 2023-01-13  145  	return 0;
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  146  }
1a5ea3b7a6ac6c drivers/firmware/qcom_scm-64.c  Vivek Gautam       2019-09-20  147  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

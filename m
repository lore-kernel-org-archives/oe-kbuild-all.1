Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0494A14AB8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 23:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUsaVmRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697413630; x=1728949630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p64fPrYWM1q2Rvmis4wA4kTZLr9EfdSqmPW52jGTDB4=;
  b=BUsaVmRpLB910j6S8fWstRrJPjOYwJXcJgWO/SHKIG49saKjEet0you7
   oJ2leQXHCt7s88JcdtgxZhKokeeOP6MBZVwjwiK04ZVJyFPhqz+LstRZk
   jkEInb7cwH2xmFFJrGs2rYICRFXWXUhpaoTG3tCFeGIztS+p/QfBg7ibr
   qcuqug/VvnAZWSqTvW7lSfJbWAq3pLvxFa0QNE1DrI2jvhqcJUID3CNqk
   Zr9/CD+FjzUTz3cHpNJJpmsrP8DYlBM0aStaGKtuPVoU5fZ0ozpwLCOki
   jnB7HVoSHVJdQVc4gOP0AJ44TQeSSiLqN+XtqcVY9nRXtunS0ps3r6V9A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="4032474"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="4032474"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 16:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790620971"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790620971"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Oct 2023 16:47:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsAp3-0007vt-38;
	Sun, 15 Oct 2023 23:47:01 +0000
Date: Mon, 16 Oct 2023 07:46:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2463/30000]
 drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm_compat.c:359:83:
 warning: suggest braces around empty body in an 'if' statement
Message-ID: <202310160739.bIz3F1gg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 8cf1c902a92d99b8780fc4259d94ffd3109a8242 [2463/30000] net: Makefile: re-add DPAA SDK drivers
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231016/202310160739.bIz3F1gg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160739.bIz3F1gg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160739.bIz3F1gg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm_compat.c: In function 'compat_copy_fm_pcd_cc_next_engine':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm_compat.c:359:83: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     359 |             _fm_cpt_dbg(compat, " param->next_engine = %i \n", param->next_engine);
         |                                                                                   ^
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm_compat.c: At top level:
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm_compat.c:783:6: warning: no previous prototype for 'compat_copy_fm_port_pcd_cc' [-Wmissing-prototypes]
     783 | void compat_copy_fm_port_pcd_cc(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm_compat.c: In function 'compat_copy_fm_pcd_cc_next_engine':
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm_compat.c:378:33: warning: this statement may fall through [-Wimplicit-fallthrough=]
     378 |                 param->manip_id = compat_pcd_id2ptr(compat_param->manip_id);
         |                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm_compat.c:379:13: note: here
     379 |             default:
         |             ^~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm_compat.c:405:40: warning: this statement may fall through [-Wimplicit-fallthrough=]
     405 |                 compat_param->manip_id = compat_pcd_ptr2id(param->manip_id);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm_compat.c:406:13: note: here
     406 |             default:
         |             ^~~~~~~


vim +/if +359 drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm_compat.c

60bb3db8cf5f62 Madalin Bucur 2017-05-10  347  
60bb3db8cf5f62 Madalin Bucur 2017-05-10  348  static inline void compat_copy_fm_pcd_cc_next_engine(
60bb3db8cf5f62 Madalin Bucur 2017-05-10  349          ioc_compat_fm_pcd_cc_next_engine_params_t   *compat_param,
60bb3db8cf5f62 Madalin Bucur 2017-05-10  350          ioc_fm_pcd_cc_next_engine_params_t          *param,
60bb3db8cf5f62 Madalin Bucur 2017-05-10  351          uint8_t                                     compat)
60bb3db8cf5f62 Madalin Bucur 2017-05-10  352  {
60bb3db8cf5f62 Madalin Bucur 2017-05-10  353      _fm_cpt_dbg (compat, " {->...\n");
60bb3db8cf5f62 Madalin Bucur 2017-05-10  354  
60bb3db8cf5f62 Madalin Bucur 2017-05-10  355      if (compat == COMPAT_US_TO_K)
60bb3db8cf5f62 Madalin Bucur 2017-05-10  356      {
60bb3db8cf5f62 Madalin Bucur 2017-05-10  357          param->next_engine = compat_param->next_engine;
60bb3db8cf5f62 Madalin Bucur 2017-05-10  358          if (param->next_engine != e_IOC_FM_PCD_INVALID )
60bb3db8cf5f62 Madalin Bucur 2017-05-10 @359              _fm_cpt_dbg(compat, " param->next_engine = %i \n", param->next_engine);
60bb3db8cf5f62 Madalin Bucur 2017-05-10  360  
60bb3db8cf5f62 Madalin Bucur 2017-05-10  361          switch (param->next_engine)
60bb3db8cf5f62 Madalin Bucur 2017-05-10  362          {
60bb3db8cf5f62 Madalin Bucur 2017-05-10  363  #if DPAA_VERSION >= 11
60bb3db8cf5f62 Madalin Bucur 2017-05-10  364              case e_IOC_FM_PCD_FR:
60bb3db8cf5f62 Madalin Bucur 2017-05-10  365                  param->params.fr_params.frm_replic_id = compat_pcd_id2ptr(compat_param->params.fr_params.frm_replic_id);
60bb3db8cf5f62 Madalin Bucur 2017-05-10  366                  break;
60bb3db8cf5f62 Madalin Bucur 2017-05-10  367  #endif /* DPAA_VERSION >= 11 */
60bb3db8cf5f62 Madalin Bucur 2017-05-10  368              case e_IOC_FM_PCD_CC:
60bb3db8cf5f62 Madalin Bucur 2017-05-10  369                  param->manip_id = compat_pcd_id2ptr(compat_param->manip_id);
60bb3db8cf5f62 Madalin Bucur 2017-05-10  370                  compat_copy_fm_pcd_cc_next_cc(&compat_param->params.cc_params, &param->params.cc_params, compat);
60bb3db8cf5f62 Madalin Bucur 2017-05-10  371                  break;
60bb3db8cf5f62 Madalin Bucur 2017-05-10  372              case e_IOC_FM_PCD_KG:
60bb3db8cf5f62 Madalin Bucur 2017-05-10  373                  param->manip_id = compat_pcd_id2ptr(compat_param->manip_id);
60bb3db8cf5f62 Madalin Bucur 2017-05-10  374                  compat_copy_fm_pcd_cc_next_kg(&compat_param->params.kg_params, &param->params.kg_params, compat);
60bb3db8cf5f62 Madalin Bucur 2017-05-10  375                  break;
60bb3db8cf5f62 Madalin Bucur 2017-05-10  376              case e_IOC_FM_PCD_DONE:
60bb3db8cf5f62 Madalin Bucur 2017-05-10  377              case e_IOC_FM_PCD_PLCR:
60bb3db8cf5f62 Madalin Bucur 2017-05-10  378                  param->manip_id = compat_pcd_id2ptr(compat_param->manip_id);
60bb3db8cf5f62 Madalin Bucur 2017-05-10  379              default:
60bb3db8cf5f62 Madalin Bucur 2017-05-10  380                  memcpy(&param->params, &compat_param->params, sizeof(param->params));
60bb3db8cf5f62 Madalin Bucur 2017-05-10  381          }
60bb3db8cf5f62 Madalin Bucur 2017-05-10  382          param->statistics_en = compat_param->statistics_en;
60bb3db8cf5f62 Madalin Bucur 2017-05-10  383      }
60bb3db8cf5f62 Madalin Bucur 2017-05-10  384      else
60bb3db8cf5f62 Madalin Bucur 2017-05-10  385      {
60bb3db8cf5f62 Madalin Bucur 2017-05-10  386          compat_param->next_engine = param->next_engine;
60bb3db8cf5f62 Madalin Bucur 2017-05-10  387  
60bb3db8cf5f62 Madalin Bucur 2017-05-10  388          switch (compat_param->next_engine)
60bb3db8cf5f62 Madalin Bucur 2017-05-10  389          {
60bb3db8cf5f62 Madalin Bucur 2017-05-10  390  #if DPAA_VERSION >= 11
60bb3db8cf5f62 Madalin Bucur 2017-05-10  391              case e_IOC_FM_PCD_FR:
60bb3db8cf5f62 Madalin Bucur 2017-05-10  392                  compat_param->params.fr_params.frm_replic_id = compat_pcd_ptr2id(param->params.fr_params.frm_replic_id);
60bb3db8cf5f62 Madalin Bucur 2017-05-10  393                  break;
60bb3db8cf5f62 Madalin Bucur 2017-05-10  394  #endif /* DPAA_VERSION >= 11 */
60bb3db8cf5f62 Madalin Bucur 2017-05-10  395              case e_IOC_FM_PCD_CC:
60bb3db8cf5f62 Madalin Bucur 2017-05-10  396                  compat_param->manip_id = compat_pcd_ptr2id(param->manip_id);
60bb3db8cf5f62 Madalin Bucur 2017-05-10  397                  compat_copy_fm_pcd_cc_next_cc(&compat_param->params.cc_params, &param->params.cc_params, compat);
60bb3db8cf5f62 Madalin Bucur 2017-05-10  398                  break;
60bb3db8cf5f62 Madalin Bucur 2017-05-10  399              case e_IOC_FM_PCD_KG:
60bb3db8cf5f62 Madalin Bucur 2017-05-10  400                  compat_param->manip_id = compat_pcd_ptr2id(param->manip_id);
60bb3db8cf5f62 Madalin Bucur 2017-05-10  401                  compat_copy_fm_pcd_cc_next_kg(&compat_param->params.kg_params, &param->params.kg_params, compat);
60bb3db8cf5f62 Madalin Bucur 2017-05-10  402                  break;
60bb3db8cf5f62 Madalin Bucur 2017-05-10  403              case e_IOC_FM_PCD_DONE:
60bb3db8cf5f62 Madalin Bucur 2017-05-10  404              case e_IOC_FM_PCD_PLCR:
60bb3db8cf5f62 Madalin Bucur 2017-05-10  405                  compat_param->manip_id = compat_pcd_ptr2id(param->manip_id);
60bb3db8cf5f62 Madalin Bucur 2017-05-10  406              default:
60bb3db8cf5f62 Madalin Bucur 2017-05-10  407                  memcpy(&compat_param->params, &param->params, sizeof(compat_param->params));
60bb3db8cf5f62 Madalin Bucur 2017-05-10  408          }
60bb3db8cf5f62 Madalin Bucur 2017-05-10  409          compat_param->statistics_en = param->statistics_en;
60bb3db8cf5f62 Madalin Bucur 2017-05-10  410      }
60bb3db8cf5f62 Madalin Bucur 2017-05-10  411  
60bb3db8cf5f62 Madalin Bucur 2017-05-10  412      _fm_cpt_dbg (compat, " ...->}\n");
60bb3db8cf5f62 Madalin Bucur 2017-05-10  413  }
60bb3db8cf5f62 Madalin Bucur 2017-05-10  414  

:::::: The code at line 359 was first introduced by commit
:::::: 60bb3db8cf5f6273e826cae6c2c8c3940729f33f fmd: SDK DPAA 1.x FMan driver

:::::: TO: Madalin Bucur <madalin.bucur@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

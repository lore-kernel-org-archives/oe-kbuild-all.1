Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2A8848E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693486014; x=1725022014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1o0CqcwG58M3nIO/9H3FG9ce4dhk2V3IYqT+g1+EtN0=;
  b=a1pXWTtQMjKNhKWzWuHU5DjBdKgcfSIy45Iya6oVHBAH8tMOs9hULZLO
   eX4ujr/TeBi1TtIiuMXlWuKk+QR51b+JoakrG7l7MGbD+foTMAO1vXWC8
   HdFMnGQeeiYgpjiH8wE0xeMvX+MJA/JA1NS1cVv9srLjg8a1vU57oP4bD
   qNlik59r9JzLSG8fygsBDGhV6DFKO4DPTqmegCTiZthJKrV/xRvG/6Jic
   huEKhEdv8uCthD4wv2L1V3uVIu/zdy7JFwkY3o1bPwa0lsj6rE/dNRXDQ
   ubpm7FZLjOvmZHTlvUiNr2pjYIZoCWmVOR+/ELZA8udM5fFbHBpqxXXtu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373328825"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="373328825"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 05:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739505264"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="739505264"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Aug 2023 05:46:49 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbh4R-00009D-2D;
	Thu, 31 Aug 2023 12:46:47 +0000
Date: Thu, 31 Aug 2023 20:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6164/24604]
 drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype
 for function 'int_imx_secvio_sc_check_state'
Message-ID: <202308312028.fLgLCfP9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: 8e33e9a47296b6a3afd7da3c950b77eaacfc42b3 [6164/24604] Merge branch 'firmware/next' into next
config: riscv-randconfig-r016-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312028.fLgLCfP9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312028.fLgLCfP9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312028.fLgLCfP9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype for function 'int_imx_secvio_sc_check_state' [-Wmissing-prototypes]
     140 | int int_imx_secvio_sc_check_state(struct device *dev)
         |     ^
   drivers/soc/imx/secvio/imx-secvio-sc.c:140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     140 | int int_imx_secvio_sc_check_state(struct device *dev)
         | ^
         | static 
   drivers/soc/imx/secvio/imx-secvio-sc.c:377:29: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     377 |         struct imx_secvio_sc_data *data;
         |                                    ^
   2 warnings generated.
--
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:35:5: warning: no previous prototype for function 'fuse_reader' [-Wmissing-prototypes]
      35 | int fuse_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^
   drivers/soc/imx/secvio/imx-secvio-debugfs.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | int fuse_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         | ^
         | static 
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:56:5: warning: no previous prototype for function 'snvs_reader' [-Wmissing-prototypes]
      56 | int snvs_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^
   drivers/soc/imx/secvio/imx-secvio-debugfs.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | int snvs_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         | ^
         | static 
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:95:5: warning: no previous prototype for function 'snvs_dgo_reader' [-Wmissing-prototypes]
      95 | int snvs_dgo_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^
   drivers/soc/imx/secvio/imx-secvio-debugfs.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | int snvs_dgo_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         | ^
         | static 
   3 warnings generated.


vim +/int_imx_secvio_sc_check_state +140 drivers/soc/imx/secvio/imx-secvio-sc.c

c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  139  
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05 @140  int int_imx_secvio_sc_check_state(struct device *dev)
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  141  {
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  142  	struct secvio_sc_notifier_info info = {0};
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  143  	int ret = 0;
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  144  
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  145  	ret = int_imx_secvio_sc_get_state(dev, &info);
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  146  	if (ret) {
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  147  		dev_err(dev, "Failed to get secvio state\n");
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  148  		goto exit;
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  149  	}
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  150  
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  151  	/* Call chain of CB registered to this module if status detected */
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  152  	if (info.hpsvs || info.lps || info.lptds)
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  153  		if (imx_secvio_sc_notifier_call_chain(&info))
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  154  			dev_warn(dev,
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  155  				 "Issues when calling the notifier chain\n");
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  156  
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  157  exit:
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  158  	return ret;
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  159  }
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  160  

:::::: The code at line 140 was first introduced by commit
:::::: c4c96d8e4f4bd60d88bfbcedf2edefdc1e1f7cf8 SSI-87: soc: imx: secvio: Add support for SNVS secvio and tamper via SCFW

:::::: TO: Franck LENORMAND <franck.lenormand@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

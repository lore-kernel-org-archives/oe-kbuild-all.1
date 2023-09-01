Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDDD1381
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 02:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693533689; x=1725069689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Evqf9X0BOX4hSP9Dq1fEOw6pT3qtML6/eL2vm8B4SVM=;
  b=RjlJmhpvIWBBvIax7W/dn7ntRn9gFySiuNQMOgSwSlQ2Lg8GV+vXL/92
   gbQtsjPxh5IOuQyh0JBNmrALeDplF7/7KiGXJdywnUOIXBf70Zo2z8xAQ
   UiNlFqyETUD3RrYK2UaT7dqd1AyVBJslsfsKKAYtfNMaRESlBvJqxvCXW
   98Vdc0js9S4tm9U5JCjh5froV9+PBsF2qzsWVUzNHy5ujdcUYB6Vsqsf3
   fdm0cN1+wy4c3yrhvqzodjcgb8A3YmXjUJTcW++KFbK+14IDU4YrijeKq
   McIHEQqihOSHq7O3l74S3rG8LWDFpBlF/B4JcU9lpryYYYp6M9MP33rt4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="373510765"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="373510765"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 19:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739764207"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="739764207"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Aug 2023 19:01:17 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbtTH-0000l1-1s;
	Fri, 01 Sep 2023 02:01:15 +0000
Date: Fri, 1 Sep 2023 10:01:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6164/24603]
 drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous
 declaration for 'int_imx_secvio_sc_check_state'
Message-ID: <202309010950.zpvnag3i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 8e33e9a47296b6a3afd7da3c950b77eaacfc42b3 [6164/24603] Merge branch 'firmware/next' into next
config: x86_64-buildonly-randconfig-004-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010950.zpvnag3i-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010950.zpvnag3i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010950.zpvnag3i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous declaration for 'int_imx_secvio_sc_check_state' [-Wmissing-declarations]
    int int_imx_secvio_sc_check_state(struct device *dev)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/imx/secvio/imx-secvio-sc.c: In function 'int_imx_secvio_sc_disable_irq':
   drivers/soc/imx/secvio/imx-secvio-sc.c:377:29: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     struct imx_secvio_sc_data *data;
                                ^~~~
   drivers/soc/imx/secvio/imx-secvio-sc.c: At top level:
   drivers/soc/imx/secvio/imx-secvio-sc.c:459:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    const static struct file_operations imx_secvio_sc_fops = {
    ^~~~~
--
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:35:5: warning: no previous declaration for 'fuse_reader' [-Wmissing-declarations]
    int fuse_reader(struct device *dev, u32 id, u32 *value, u8 mul)
        ^~~~~~~~~~~
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:56:5: warning: no previous declaration for 'snvs_reader' [-Wmissing-declarations]
    int snvs_reader(struct device *dev, u32 id, u32 *value, u8 mul)
        ^~~~~~~~~~~
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:95:5: warning: no previous declaration for 'snvs_dgo_reader' [-Wmissing-declarations]
    int snvs_dgo_reader(struct device *dev, u32 id, u32 *value, u8 mul)
        ^~~~~~~~~~~~~~~


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

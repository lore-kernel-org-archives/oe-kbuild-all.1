Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EF4193
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 00:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682727350; x=1714263350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TP6+SWroBC4zdp14iC3PexzQQSPoLkvhMOG1TzqLP64=;
  b=d4N1fkJJYpPbNLrYUatJmFxxhbO7MSsKWpKoVth3tr5EGmJRV7U98GPO
   yruIo7UBhox2re5+yrb5/1St/e8gw90Y/SmPKueZBUag/FZkl2prtQRfv
   UOV/wjZToDPQVO8ljJpfz7BwOzcrifj5YXtaevHvz/sw3j0QSgtNmRA0N
   1TP7ay2OxSl8zYHeex7o0oWx0PTeqQ7x3lVCRh9THLH6pnjccW5vXZg/H
   pz+eHBjBOwRKEAAtymiKClGY3gYYVaBPOy3uLgVPEsYlhFZ6WCDusZSlg
   X4QRQy/ailpj2l2u43bxuq0SzKyY1Q39K8kyKvoPQo1ycy/q7/YqMktQ4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="327506033"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="327506033"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 17:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="806597174"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="806597174"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2023 17:15:47 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psYFf-0000lt-2g;
	Sat, 29 Apr 2023 00:15:47 +0000
Date: Sat, 29 Apr 2023 08:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 57/57]
 drivers/edac/highbank_mc_edac.c:158:12: warning: assignment to 'const struct
 of_device_id *' from 'int' makes pointer from integer without a cast
Message-ID: <202304290840.wYGkNOAV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   d03f4bcb40575c1caf4deb8072eb2f9486e51b25
commit: d03f4bcb40575c1caf4deb8072eb2f9486e51b25 [57/57] of: header cleanups
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230429/202304290840.wYGkNOAV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=d03f4bcb40575c1caf4deb8072eb2f9486e51b25
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout d03f4bcb40575c1caf4deb8072eb2f9486e51b25
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/bus/ drivers/cpufreq/ drivers/crypto/stm32/ drivers/edac/ drivers/gpu/drm/armada/ drivers/gpu/drm/omapdrm/ drivers/gpu/drm/sti/ drivers/hsi/controllers/ drivers/memory/tegra/ drivers/mtd/maps/ drivers/power/reset/ drivers/remoteproc/ drivers/reset/sti/ drivers/soc/tegra/fuse/ drivers/soc/ti/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290840.wYGkNOAV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/edac/highbank_mc_edac.c: In function 'highbank_mc_probe':
   drivers/edac/highbank_mc_edac.c:158:14: error: implicit declaration of function 'of_match_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
     158 |         id = of_match_device(hb_ddr_ctrl_of_match, &pdev->dev);
         |              ^~~~~~~~~~~~~~~
         |              acpi_match_device
>> drivers/edac/highbank_mc_edac.c:158:12: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     158 |         id = of_match_device(hb_ddr_ctrl_of_match, &pdev->dev);
         |            ^
   cc1: some warnings being treated as errors
--
   drivers/edac/highbank_l2_edac.c: In function 'highbank_l2_err_probe':
   drivers/edac/highbank_l2_edac.c:88:14: error: implicit declaration of function 'of_match_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
      88 |         id = of_match_device(hb_l2_err_of_match, &pdev->dev);
         |              ^~~~~~~~~~~~~~~
         |              acpi_match_device
>> drivers/edac/highbank_l2_edac.c:88:12: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      88 |         id = of_match_device(hb_l2_err_of_match, &pdev->dev);
         |            ^
   cc1: some warnings being treated as errors
--
   drivers/edac/armada_xp_edac.c: In function 'axp_mc_check':
   drivers/edac/armada_xp_edac.c:129:47: warning: variable 'cause_msg' set but not used [-Wunused-but-set-variable]
     129 |         uint32_t cnt_sbe, cnt_dbe, cause_err, cause_msg;
         |                                               ^~~~~~~~~
   drivers/edac/armada_xp_edac.c:129:36: warning: variable 'cause_err' set but not used [-Wunused-but-set-variable]
     129 |         uint32_t cnt_sbe, cnt_dbe, cause_err, cause_msg;
         |                                    ^~~~~~~~~
   drivers/edac/armada_xp_edac.c:128:26: warning: variable 'data_l' set but not used [-Wunused-but-set-variable]
     128 |         uint32_t data_h, data_l, recv_ecc, calc_ecc, addr;
         |                          ^~~~~~
   drivers/edac/armada_xp_edac.c:128:18: warning: variable 'data_h' set but not used [-Wunused-but-set-variable]
     128 |         uint32_t data_h, data_l, recv_ecc, calc_ecc, addr;
         |                  ^~~~~~
   drivers/edac/armada_xp_edac.c: In function 'axp_mc_probe':
   drivers/edac/armada_xp_edac.c:317:14: error: implicit declaration of function 'of_match_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
     317 |         id = of_match_device(axp_mc_of_match, &pdev->dev);
         |              ^~~~~~~~~~~~~~~
         |              acpi_match_device
>> drivers/edac/armada_xp_edac.c:317:12: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     317 |         id = of_match_device(axp_mc_of_match, &pdev->dev);
         |            ^
   drivers/edac/armada_xp_edac.c: In function 'aurora_l2_probe':
   drivers/edac/armada_xp_edac.c:535:12: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     535 |         id = of_match_device(aurora_l2_of_match, &pdev->dev);
         |            ^
   cc1: some warnings being treated as errors
--
   drivers/remoteproc/omap_remoteproc.c: In function 'omap_rproc_enable_timers':
   drivers/remoteproc/omap_remoteproc.c:346:25: error: implicit declaration of function 'of_find_device_by_node'; did you mean 'bus_find_device_by_fwnode'? [-Werror=implicit-function-declaration]
     346 |                 tpdev = of_find_device_by_node(np);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         bus_find_device_by_fwnode
>> drivers/remoteproc/omap_remoteproc.c:346:23: warning: assignment to 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     346 |                 tpdev = of_find_device_by_node(np);
         |                       ^
   cc1: some warnings being treated as errors
--
   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_of_memory_translations':
   drivers/remoteproc/stm32_rproc.c:147:44: error: invalid use of undefined type 'struct platform_device'
     147 |         struct device *parent, *dev = &pdev->dev;
         |                                            ^~
   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_wdg':
   drivers/remoteproc/stm32_rproc.c:278:31: error: implicit declaration of function 'platform_get_drvdata' [-Werror=implicit-function-declaration]
     278 |         struct rproc *rproc = platform_get_drvdata(pdev);
         |                               ^~~~~~~~~~~~~~~~~~~~
>> drivers/remoteproc/stm32_rproc.c:278:31: warning: initialization of 'struct rproc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_parse_dt':
   drivers/remoteproc/stm32_rproc.c:681:35: error: invalid use of undefined type 'struct platform_device'
     681 |         struct device *dev = &pdev->dev;
         |                                   ^~
   drivers/remoteproc/stm32_rproc.c:687:15: error: implicit declaration of function 'platform_get_irq'; did you mean 'platform_notify'? [-Werror=implicit-function-declaration]
     687 |         irq = platform_get_irq(pdev, 0);
         |               ^~~~~~~~~~~~~~~~
         |               platform_notify
   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_probe':
   drivers/remoteproc/stm32_rproc.c:789:35: error: invalid use of undefined type 'struct platform_device'
     789 |         struct device *dev = &pdev->dev;
         |                                   ^~
   drivers/remoteproc/stm32_rproc.c:831:9: error: implicit declaration of function 'platform_set_drvdata' [-Werror=implicit-function-declaration]
     831 |         platform_set_drvdata(pdev, rproc);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_remove':
   drivers/remoteproc/stm32_rproc.c:860:31: warning: initialization of 'struct rproc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     860 |         struct rproc *rproc = platform_get_drvdata(pdev);
         |                               ^~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/stm32_rproc.c:862:35: error: invalid use of undefined type 'struct platform_device'
     862 |         struct device *dev = &pdev->dev;
         |                                   ^~
   drivers/remoteproc/stm32_rproc.c: At top level:
   drivers/remoteproc/stm32_rproc.c:905:15: error: variable 'stm32_rproc_driver' has initializer but incomplete type
     905 | static struct platform_driver stm32_rproc_driver = {
         |               ^~~~~~~~~~~~~~~
   drivers/remoteproc/stm32_rproc.c:906:10: error: 'struct platform_driver' has no member named 'probe'
     906 |         .probe = stm32_rproc_probe,
         |          ^~~~~
>> drivers/remoteproc/stm32_rproc.c:906:18: warning: excess elements in struct initializer
     906 |         .probe = stm32_rproc_probe,
         |                  ^~~~~~~~~~~~~~~~~
   drivers/remoteproc/stm32_rproc.c:906:18: note: (near initialization for 'stm32_rproc_driver')
   drivers/remoteproc/stm32_rproc.c:907:10: error: 'struct platform_driver' has no member named 'remove'
     907 |         .remove = stm32_rproc_remove,
         |          ^~~~~~
   drivers/remoteproc/stm32_rproc.c:907:19: warning: excess elements in struct initializer
     907 |         .remove = stm32_rproc_remove,
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/remoteproc/stm32_rproc.c:907:19: note: (near initialization for 'stm32_rproc_driver')
   drivers/remoteproc/stm32_rproc.c:908:10: error: 'struct platform_driver' has no member named 'driver'
     908 |         .driver = {
         |          ^~~~~~
   drivers/remoteproc/stm32_rproc.c:908:19: error: extra brace group at end of initializer
     908 |         .driver = {
         |                   ^
   drivers/remoteproc/stm32_rproc.c:908:19: note: (near initialization for 'stm32_rproc_driver')
   drivers/remoteproc/stm32_rproc.c:908:19: warning: excess elements in struct initializer
   drivers/remoteproc/stm32_rproc.c:908:19: note: (near initialization for 'stm32_rproc_driver')
>> drivers/remoteproc/stm32_rproc.c:914:1: warning: data definition has no type or storage class
     914 | module_platform_driver(stm32_rproc_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/stm32_rproc.c:914:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
>> drivers/remoteproc/stm32_rproc.c:914:1: warning: parameter names (without types) in function declaration
   drivers/remoteproc/stm32_rproc.c:905:31: error: storage size of 'stm32_rproc_driver' isn't known
     905 | static struct platform_driver stm32_rproc_driver = {
         |                               ^~~~~~~~~~~~~~~~~~
   drivers/remoteproc/stm32_rproc.c:905:31: warning: 'stm32_rproc_driver' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors
--
   drivers/power/reset/st-poweroff.c: In function 'st_reset_probe':
   drivers/power/reset/st-poweroff.c:79:17: error: implicit declaration of function 'of_match_device'; did you mean 'of_match_node'? [-Werror=implicit-function-declaration]
      79 |         match = of_match_device(st_reset_of_match, dev);
         |                 ^~~~~~~~~~~~~~~
         |                 of_match_node
>> drivers/power/reset/st-poweroff.c:79:15: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      79 |         match = of_match_device(st_reset_of_match, dev);
         |               ^
   cc1: some warnings being treated as errors
--
   drivers/soc/ti/knav_qmss_queue.c: In function 'knav_get_link_ram':
   drivers/soc/ti/knav_qmss_queue.c:1138:40: error: implicit declaration of function 'to_platform_device' [-Werror=implicit-function-declaration]
    1138 |         struct platform_device *pdev = to_platform_device(kdev->dev);
         |                                        ^~~~~~~~~~~~~~~~~~
>> drivers/soc/ti/knav_qmss_queue.c:1138:40: warning: initialization of 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/soc/ti/knav_qmss_queue.c:1139:40: error: invalid use of undefined type 'struct platform_device'
    1139 |         struct device_node *node = pdev->dev.of_node;
         |                                        ^~
   drivers/soc/ti/knav_qmss_queue.c: At top level:
>> drivers/soc/ti/knav_qmss_queue.c:1753:36: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1753 | static int knav_queue_probe(struct platform_device *pdev)
         |                                    ^~~~~~~~~~~~~~~
   drivers/soc/ti/knav_qmss_queue.c: In function 'knav_queue_probe':
   drivers/soc/ti/knav_qmss_queue.c:1755:40: error: invalid use of undefined type 'struct platform_device'
    1755 |         struct device_node *node = pdev->dev.of_node;
         |                                        ^~
   drivers/soc/ti/knav_qmss_queue.c:1758:35: error: invalid use of undefined type 'struct platform_device'
    1758 |         struct device *dev = &pdev->dev;
         |                                   ^~
   drivers/soc/ti/knav_qmss_queue.c:1776:9: error: implicit declaration of function 'platform_set_drvdata' [-Werror=implicit-function-declaration]
    1776 |         platform_set_drvdata(pdev, kdev);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/soc/ti/knav_qmss_queue.c:1784:32: error: invalid use of undefined type 'struct platform_device'
    1784 |         pm_runtime_enable(&pdev->dev);
         |                                ^~
   drivers/soc/ti/knav_qmss_queue.c:1785:46: error: invalid use of undefined type 'struct platform_device'
    1785 |         ret = pm_runtime_resume_and_get(&pdev->dev);
         |                                              ^~
   drivers/soc/ti/knav_qmss_queue.c:1787:41: error: invalid use of undefined type 'struct platform_device'
    1787 |                 pm_runtime_disable(&pdev->dev);
         |                                         ^~
   drivers/soc/ti/knav_qmss_queue.c:1881:34: error: invalid use of undefined type 'struct platform_device'
    1881 |         pm_runtime_put_sync(&pdev->dev);
         |                                  ^~
   drivers/soc/ti/knav_qmss_queue.c:1882:33: error: invalid use of undefined type 'struct platform_device'
    1882 |         pm_runtime_disable(&pdev->dev);
         |                                 ^~
   drivers/soc/ti/knav_qmss_queue.c:1757:36: warning: unused variable 'match' [-Wunused-variable]
    1757 |         const struct of_device_id *match;
         |                                    ^~~~~
   drivers/soc/ti/knav_qmss_queue.c: At top level:
   drivers/soc/ti/knav_qmss_queue.c:1886:37: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1886 | static int knav_queue_remove(struct platform_device *pdev)
         |                                     ^~~~~~~~~~~~~~~
   drivers/soc/ti/knav_qmss_queue.c: In function 'knav_queue_remove':
   drivers/soc/ti/knav_qmss_queue.c:1889:34: error: invalid use of undefined type 'struct platform_device'
    1889 |         pm_runtime_put_sync(&pdev->dev);
         |                                  ^~
   drivers/soc/ti/knav_qmss_queue.c:1890:33: error: invalid use of undefined type 'struct platform_device'
    1890 |         pm_runtime_disable(&pdev->dev);
         |                                 ^~
   drivers/soc/ti/knav_qmss_queue.c: At top level:
   drivers/soc/ti/knav_qmss_queue.c:1894:15: error: variable 'keystone_qmss_driver' has initializer but incomplete type
    1894 | static struct platform_driver keystone_qmss_driver = {
         |               ^~~~~~~~~~~~~~~
   drivers/soc/ti/knav_qmss_queue.c:1895:10: error: 'struct platform_driver' has no member named 'probe'
    1895 |         .probe          = knav_queue_probe,
         |          ^~~~~
>> drivers/soc/ti/knav_qmss_queue.c:1895:27: warning: excess elements in struct initializer
    1895 |         .probe          = knav_queue_probe,
         |                           ^~~~~~~~~~~~~~~~
   drivers/soc/ti/knav_qmss_queue.c:1895:27: note: (near initialization for 'keystone_qmss_driver')
   drivers/soc/ti/knav_qmss_queue.c:1896:10: error: 'struct platform_driver' has no member named 'remove'
    1896 |         .remove         = knav_queue_remove,
         |          ^~~~~~
   drivers/soc/ti/knav_qmss_queue.c:1896:27: warning: excess elements in struct initializer
    1896 |         .remove         = knav_queue_remove,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/soc/ti/knav_qmss_queue.c:1896:27: note: (near initialization for 'keystone_qmss_driver')
   drivers/soc/ti/knav_qmss_queue.c:1897:10: error: 'struct platform_driver' has no member named 'driver'
    1897 |         .driver         = {
         |          ^~~~~~
   drivers/soc/ti/knav_qmss_queue.c:1897:27: error: extra brace group at end of initializer
    1897 |         .driver         = {
         |                           ^
   drivers/soc/ti/knav_qmss_queue.c:1897:27: note: (near initialization for 'keystone_qmss_driver')
   drivers/soc/ti/knav_qmss_queue.c:1897:27: warning: excess elements in struct initializer
   drivers/soc/ti/knav_qmss_queue.c:1897:27: note: (near initialization for 'keystone_qmss_driver')
>> drivers/soc/ti/knav_qmss_queue.c:1902:1: warning: data definition has no type or storage class
    1902 | module_platform_driver(keystone_qmss_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/ti/knav_qmss_queue.c:1902:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
>> drivers/soc/ti/knav_qmss_queue.c:1902:1: warning: parameter names (without types) in function declaration
   drivers/soc/ti/knav_qmss_queue.c:1894:31: error: storage size of 'keystone_qmss_driver' isn't known
    1894 | static struct platform_driver keystone_qmss_driver = {
         |                               ^~~~~~~~~~~~~~~~~~~~
   drivers/soc/ti/knav_qmss_queue.c:1894:31: warning: 'keystone_qmss_driver' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors
--
   drivers/crypto/stm32/stm32-hash.c:1572:34: error: array type has incomplete element type 'struct of_device_id'
    1572 | static const struct of_device_id stm32_hash_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~
   drivers/crypto/stm32/stm32-hash.c: In function 'stm32_hash_get_of_match':
   drivers/crypto/stm32/stm32-hash.c:1593:23: error: implicit declaration of function 'of_device_get_match_data' [-Werror=implicit-function-declaration]
    1593 |         hdev->pdata = of_device_get_match_data(dev);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/stm32/stm32-hash.c:1593:21: warning: assignment to 'const struct stm32_hash_pdata *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1593 |         hdev->pdata = of_device_get_match_data(dev);
         |                     ^
   drivers/crypto/stm32/stm32-hash.c:1599:13: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]
    1599 |         if (of_property_read_u32(dev->of_node, "dma-maxburst",
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/stm32/stm32-hash.c: At top level:
   drivers/crypto/stm32/stm32-hash.c:1572:34: warning: 'stm32_hash_of_match' defined but not used [-Wunused-variable]
    1572 | static const struct of_device_id stm32_hash_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/crypto/stm32/stm32-cryp.c:1947:34: error: array type has incomplete element type 'struct of_device_id'
    1947 | static const struct of_device_id stm32_dt_ids[] = {
         |                                  ^~~~~~~~~~~~
   drivers/crypto/stm32/stm32-cryp.c: In function 'stm32_cryp_probe':
   drivers/crypto/stm32/stm32-cryp.c:1966:22: error: implicit declaration of function 'of_device_get_match_data' [-Werror=implicit-function-declaration]
    1966 |         cryp->caps = of_device_get_match_data(dev);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/stm32/stm32-cryp.c:1966:20: warning: assignment to 'const struct stm32_cryp_caps *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1966 |         cryp->caps = of_device_get_match_data(dev);
         |                    ^
   drivers/crypto/stm32/stm32-cryp.c: At top level:
   drivers/crypto/stm32/stm32-cryp.c:1947:34: warning: 'stm32_dt_ids' defined but not used [-Wunused-variable]
    1947 | static const struct of_device_id stm32_dt_ids[] = {
         |                                  ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/mtd/maps/physmap-ixp4xx.c:17:
>> drivers/mtd/maps/physmap-ixp4xx.h:6:34: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
       6 | int of_flash_probe_ixp4xx(struct platform_device *pdev,
         |                                  ^~~~~~~~~~~~~~~
>> drivers/mtd/maps/physmap-ixp4xx.c:114:34: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
     114 | int of_flash_probe_ixp4xx(struct platform_device *pdev,
         |                                  ^~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-ixp4xx.c:114:5: error: conflicting types for 'of_flash_probe_ixp4xx'; have 'int(struct platform_device *, struct device_node *, struct map_info *)'
     114 | int of_flash_probe_ixp4xx(struct platform_device *pdev,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-ixp4xx.h:6:5: note: previous declaration of 'of_flash_probe_ixp4xx' with type 'int(struct platform_device *, struct device_node *, struct map_info *)'
       6 | int of_flash_probe_ixp4xx(struct platform_device *pdev,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-ixp4xx.c: In function 'of_flash_probe_ixp4xx':
   drivers/mtd/maps/physmap-ixp4xx.c:118:35: error: invalid use of undefined type 'struct platform_device'
     118 |         struct device *dev = &pdev->dev;
         |                                   ^~
   drivers/mtd/maps/physmap-ixp4xx.c:129:9: error: implicit declaration of function 'dev_info' [-Werror=implicit-function-declaration]
     129 |         dev_info(dev, "initialized Intel IXP4xx-specific physmap control\n");
         |         ^~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/memory/tegra/tegra20.c: In function 'tegra20_mc_of_icc_xlate_extended':
   drivers/memory/tegra/tegra20.c:395:35: error: invalid use of undefined type 'struct of_phandle_args'
     395 |         unsigned int i, idx = spec->args[0];
         |                                   ^~
   drivers/memory/tegra/tegra20.c:424:9: error: implicit declaration of function 'dev_err' [-Werror=implicit-function-declaration]
     424 |         dev_err(mc->dev, "invalid ICC client ID %u\n", idx);
         |         ^~~~~~~
   drivers/memory/tegra/tegra20.c: In function 'tegra20_mc_stats_show':
   drivers/memory/tegra/tegra20.c:613:37: error: implicit declaration of function 'dev_get_drvdata' [-Werror=implicit-function-declaration]
     613 |         const struct tegra_mc *mc = dev_get_drvdata(s->private);
         |                                     ^~~~~~~~~~~~~~~
>> drivers/memory/tegra/tegra20.c:613:37: warning: initialization of 'const struct tegra_mc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/memory/tegra/tegra20.c: In function 'tegra20_mc_handle_irq':
   drivers/memory/tegra/tegra20.c:778:17: error: implicit declaration of function 'dev_err_ratelimited'; did you mean 'pr_err_ratelimited'? [-Werror=implicit-function-declaration]
     778 |                 dev_err_ratelimited(mc->dev, "%s: %s%s @%pa: %s (%s)\n",
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 pr_err_ratelimited
   cc1: some warnings being treated as errors
..


vim +158 drivers/edac/highbank_mc_edac.c

0ec8579e16bfae Robert Richter     2013-10-10  143  
9b3c6e85c2cfa7 Greg Kroah-Hartman 2012-12-21  144  static int highbank_mc_probe(struct platform_device *pdev)
a1b01edb274518 Rob Herring        2012-06-13  145  {
0ec8579e16bfae Robert Richter     2013-10-10  146  	const struct of_device_id *id;
0ec8579e16bfae Robert Richter     2013-10-10  147  	const struct hb_mc_settings *settings;
a1b01edb274518 Rob Herring        2012-06-13  148  	struct edac_mc_layer layers[2];
a1b01edb274518 Rob Herring        2012-06-13  149  	struct mem_ctl_info *mci;
a1b01edb274518 Rob Herring        2012-06-13  150  	struct hb_mc_drvdata *drvdata;
a1b01edb274518 Rob Herring        2012-06-13  151  	struct dimm_info *dimm;
a1b01edb274518 Rob Herring        2012-06-13  152  	struct resource *r;
0ec8579e16bfae Robert Richter     2013-10-10  153  	void __iomem *base;
a1b01edb274518 Rob Herring        2012-06-13  154  	u32 control;
a1b01edb274518 Rob Herring        2012-06-13  155  	int irq;
a1b01edb274518 Rob Herring        2012-06-13  156  	int res = 0;
a1b01edb274518 Rob Herring        2012-06-13  157  
0ec8579e16bfae Robert Richter     2013-10-10 @158  	id = of_match_device(hb_ddr_ctrl_of_match, &pdev->dev);
0ec8579e16bfae Robert Richter     2013-10-10  159  	if (!id)
0ec8579e16bfae Robert Richter     2013-10-10  160  		return -ENODEV;
0ec8579e16bfae Robert Richter     2013-10-10  161  
a1b01edb274518 Rob Herring        2012-06-13  162  	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
a1b01edb274518 Rob Herring        2012-06-13  163  	layers[0].size = 1;
a1b01edb274518 Rob Herring        2012-06-13  164  	layers[0].is_virt_csrow = true;
a1b01edb274518 Rob Herring        2012-06-13  165  	layers[1].type = EDAC_MC_LAYER_CHANNEL;
a1b01edb274518 Rob Herring        2012-06-13  166  	layers[1].size = 1;
a1b01edb274518 Rob Herring        2012-06-13  167  	layers[1].is_virt_csrow = false;
a1b01edb274518 Rob Herring        2012-06-13  168  	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
a1b01edb274518 Rob Herring        2012-06-13  169  			    sizeof(struct hb_mc_drvdata));
a1b01edb274518 Rob Herring        2012-06-13  170  	if (!mci)
a1b01edb274518 Rob Herring        2012-06-13  171  		return -ENOMEM;
a1b01edb274518 Rob Herring        2012-06-13  172  
a1b01edb274518 Rob Herring        2012-06-13  173  	mci->pdev = &pdev->dev;
a1b01edb274518 Rob Herring        2012-06-13  174  	drvdata = mci->pvt_info;
a1b01edb274518 Rob Herring        2012-06-13  175  	platform_set_drvdata(pdev, mci);
a1b01edb274518 Rob Herring        2012-06-13  176  
e7a293658c20a7 Miaoqian Lin       2022-12-29  177  	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
e7a293658c20a7 Miaoqian Lin       2022-12-29  178  		res = -ENOMEM;
e7a293658c20a7 Miaoqian Lin       2022-12-29  179  		goto free;
e7a293658c20a7 Miaoqian Lin       2022-12-29  180  	}
a1b01edb274518 Rob Herring        2012-06-13  181  
a1b01edb274518 Rob Herring        2012-06-13  182  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
a1b01edb274518 Rob Herring        2012-06-13  183  	if (!r) {
a1b01edb274518 Rob Herring        2012-06-13  184  		dev_err(&pdev->dev, "Unable to get mem resource\n");
a1b01edb274518 Rob Herring        2012-06-13  185  		res = -ENODEV;
a1b01edb274518 Rob Herring        2012-06-13  186  		goto err;
a1b01edb274518 Rob Herring        2012-06-13  187  	}
a1b01edb274518 Rob Herring        2012-06-13  188  
a1b01edb274518 Rob Herring        2012-06-13  189  	if (!devm_request_mem_region(&pdev->dev, r->start,
a1b01edb274518 Rob Herring        2012-06-13  190  				     resource_size(r), dev_name(&pdev->dev))) {
a1b01edb274518 Rob Herring        2012-06-13  191  		dev_err(&pdev->dev, "Error while requesting mem region\n");
a1b01edb274518 Rob Herring        2012-06-13  192  		res = -EBUSY;
a1b01edb274518 Rob Herring        2012-06-13  193  		goto err;
a1b01edb274518 Rob Herring        2012-06-13  194  	}
a1b01edb274518 Rob Herring        2012-06-13  195  
0ec8579e16bfae Robert Richter     2013-10-10  196  	base = devm_ioremap(&pdev->dev, r->start, resource_size(r));
0ec8579e16bfae Robert Richter     2013-10-10  197  	if (!base) {
a1b01edb274518 Rob Herring        2012-06-13  198  		dev_err(&pdev->dev, "Unable to map regs\n");
a1b01edb274518 Rob Herring        2012-06-13  199  		res = -ENOMEM;
a1b01edb274518 Rob Herring        2012-06-13  200  		goto err;
a1b01edb274518 Rob Herring        2012-06-13  201  	}
a1b01edb274518 Rob Herring        2012-06-13  202  
0ec8579e16bfae Robert Richter     2013-10-10  203  	settings = id->data;
0ec8579e16bfae Robert Richter     2013-10-10  204  	drvdata->mc_err_base = base + settings->err_offset;
0ec8579e16bfae Robert Richter     2013-10-10  205  	drvdata->mc_int_base = base + settings->int_offset;
0ec8579e16bfae Robert Richter     2013-10-10  206  
0ec8579e16bfae Robert Richter     2013-10-10  207  	control = readl(drvdata->mc_err_base + HB_DDR_ECC_OPT) & 0x3;
a1b01edb274518 Rob Herring        2012-06-13  208  	if (!control || (control == 0x2)) {
a1b01edb274518 Rob Herring        2012-06-13  209  		dev_err(&pdev->dev, "No ECC present, or ECC disabled\n");
a1b01edb274518 Rob Herring        2012-06-13  210  		res = -ENODEV;
a1b01edb274518 Rob Herring        2012-06-13  211  		goto err;
a1b01edb274518 Rob Herring        2012-06-13  212  	}
a1b01edb274518 Rob Herring        2012-06-13  213  
a1b01edb274518 Rob Herring        2012-06-13  214  	mci->mtype_cap = MEM_FLAG_DDR3;
a1b01edb274518 Rob Herring        2012-06-13  215  	mci->edac_ctl_cap = EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
a1b01edb274518 Rob Herring        2012-06-13  216  	mci->edac_cap = EDAC_FLAG_SECDED;
41ec0e8da05267 Robert Richter     2013-10-10  217  	mci->mod_name = pdev->dev.driver->name;
41ec0e8da05267 Robert Richter     2013-10-10  218  	mci->ctl_name = id->compatible;
41ec0e8da05267 Robert Richter     2013-10-10  219  	mci->dev_name = dev_name(&pdev->dev);
a1b01edb274518 Rob Herring        2012-06-13  220  	mci->scrub_mode = SCRUB_SW_SRC;
a1b01edb274518 Rob Herring        2012-06-13  221  
a1b01edb274518 Rob Herring        2012-06-13  222  	/* Only a single 4GB DIMM is supported */
a1b01edb274518 Rob Herring        2012-06-13  223  	dimm = *mci->dimms;
a1b01edb274518 Rob Herring        2012-06-13  224  	dimm->nr_pages = (~0UL >> PAGE_SHIFT) + 1;
a1b01edb274518 Rob Herring        2012-06-13  225  	dimm->grain = 8;
a1b01edb274518 Rob Herring        2012-06-13  226  	dimm->dtype = DEV_X8;
a1b01edb274518 Rob Herring        2012-06-13  227  	dimm->mtype = MEM_DDR3;
a1b01edb274518 Rob Herring        2012-06-13  228  	dimm->edac_mode = EDAC_SECDED;
a1b01edb274518 Rob Herring        2012-06-13  229  
fc7cc6b7820b54 Takashi Iwai       2015-02-04  230  	res = edac_mc_add_mc_with_groups(mci, highbank_dev_groups);
a1b01edb274518 Rob Herring        2012-06-13  231  	if (res < 0)
a1b01edb274518 Rob Herring        2012-06-13  232  		goto err;
a1b01edb274518 Rob Herring        2012-06-13  233  
a72b8859fd3941 Robert Richter     2013-10-10  234  	irq = platform_get_irq(pdev, 0);
a72b8859fd3941 Robert Richter     2013-10-10  235  	res = devm_request_irq(&pdev->dev, irq, highbank_mc_err_handler,
a72b8859fd3941 Robert Richter     2013-10-10  236  			       0, dev_name(&pdev->dev), mci);
a72b8859fd3941 Robert Richter     2013-10-10  237  	if (res < 0) {
a72b8859fd3941 Robert Richter     2013-10-10  238  		dev_err(&pdev->dev, "Unable to request irq %d\n", irq);
a72b8859fd3941 Robert Richter     2013-10-10  239  		goto err2;
a72b8859fd3941 Robert Richter     2013-10-10  240  	}
a72b8859fd3941 Robert Richter     2013-10-10  241  
a1b01edb274518 Rob Herring        2012-06-13  242  	devres_close_group(&pdev->dev, NULL);
a1b01edb274518 Rob Herring        2012-06-13  243  	return 0;
a72b8859fd3941 Robert Richter     2013-10-10  244  err2:
a72b8859fd3941 Robert Richter     2013-10-10  245  	edac_mc_del_mc(&pdev->dev);
a1b01edb274518 Rob Herring        2012-06-13  246  err:
a1b01edb274518 Rob Herring        2012-06-13  247  	devres_release_group(&pdev->dev, NULL);
e7a293658c20a7 Miaoqian Lin       2022-12-29  248  free:
a1b01edb274518 Rob Herring        2012-06-13  249  	edac_mc_free(mci);
a1b01edb274518 Rob Herring        2012-06-13  250  	return res;
a1b01edb274518 Rob Herring        2012-06-13  251  }
a1b01edb274518 Rob Herring        2012-06-13  252  

:::::: The code at line 158 was first introduced by commit
:::::: 0ec8579e16bfaed5587ae8bb02adcb089f29c397 edac, highbank: Add Calxeda ECX-2000 support

:::::: TO: Robert Richter <robert.richter@linaro.org>
:::::: CC: Robert Richter <rric@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

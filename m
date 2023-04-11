Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C450320F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 06:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681194419; x=1712730419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bUMD2RbDfj/EobMhR/JsAqkzXXW6k41jhjRiVvEZ3JU=;
  b=c+EbopXAtLvTZAonv5jXxx07eF1uvoyUATDQlgDnFcJpWlG3H3JRAQhn
   VpsFMlayA/zLYmdDmm7DzjmV3lAV6o27XQCRXtmNA/+NVgprO/6/+SSoc
   DM8KYS/F2b2LeZrytupw6/jD4CP6RSCLycb3x+Y56NR7LkEZzklO1JqUy
   koiVDzQX7CUAUvorfcPxqoeEwRnyvTYZ45NWY/GojqDMRFrh/w5sQZPo3
   Os3O5wwQ8NUdDL2di91NOIup+V9+JcmZLXGX5JU0uVVmGnO2g6aPtryXw
   LEmBdacwJMWgLtvT9kHIEz6xUSit/SPzhGffqNtfLTtXcTRDigskvvhl3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323896968"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="323896968"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 23:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="665868488"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="665868488"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Apr 2023 23:26:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm7Sy-000W2D-23;
	Tue, 11 Apr 2023 06:26:56 +0000
Date: Tue, 11 Apr 2023 14:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:for-next 4/4]
 drivers/platform/chrome/cros_ec_debugfs.c:404: warning: This comment starts
 with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202304111451.2jNVy9ao-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git for-next
head:   4696f24c5655dafc277c778bc7c20812bd72d44b
commit: 4696f24c5655dafc277c778bc7c20812bd72d44b [4/4] platform/chrome: cros_ec: Separate logic for getting panic info
config: i386-randconfig-a002-20230410 (https://download.01.org/0day-ci/archive/20230411/202304111451.2jNVy9ao-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git/commit/?id=4696f24c5655dafc277c778bc7c20812bd72d44b
        git remote add tzungbi-chrome-platform https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git
        git fetch --no-tags tzungbi-chrome-platform for-next
        git checkout 4696f24c5655dafc277c778bc7c20812bd72d44b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/chrome/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111451.2jNVy9ao-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/chrome/cros_ec_debugfs.c:404: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Returns the size of the panicinfo data fetched from the EC


vim +404 drivers/platform/chrome/cros_ec_debugfs.c

   402	
   403	/**
 > 404	 * Returns the size of the panicinfo data fetched from the EC
   405	 */
   406	static int cros_ec_get_panicinfo(struct cros_ec_device *ec_dev, uint8_t *data,
   407					 int data_size)
   408	{
   409		int ret;
   410		struct cros_ec_command *msg;
   411	
   412		if (!data || data_size <= 0 || data_size > ec_dev->max_response)
   413			return -EINVAL;
   414	
   415		msg = kzalloc(sizeof(*msg) + data_size, GFP_KERNEL);
   416		if (!msg)
   417			return -ENOMEM;
   418	
   419		msg->command = EC_CMD_GET_PANIC_INFO;
   420		msg->insize = data_size;
   421	
   422		ret = cros_ec_cmd_xfer_status(ec_dev, msg);
   423		if (ret < 0)
   424			goto free;
   425	
   426		memcpy(data, msg->data, data_size);
   427	
   428	free:
   429		kfree(msg);
   430		return ret;
   431	}
   432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

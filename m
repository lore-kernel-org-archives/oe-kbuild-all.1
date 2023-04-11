Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A7220F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 05:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681190096; x=1712726096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XIarlKR1osAtjvxJhKqoW9Rn3D9sflbHwYwESIJiDVw=;
  b=dPJ+5Uxfa+9YOq4HIThNi8hZeFgB4JZOJg9siKUn9lGVYX+WfO9qEhFM
   pslaS6xKPe1ReGrtmNmTaugP+YJ1VLlKOLUNpWVyPpyQhLvnW/5dGTvQJ
   IFihh5RG2nQGbikQEEpvFn7+GVx5sMlLrUxfBqDl0y8fgB+l9p/EE6czM
   GChW4Do+vWe+uWcH4bHIfeOXI4vZSFQuq0gTKRbICxkWXGCFITTAJVGGA
   6O7rCWkwZ+okRoRuDy/jElMmoQ4DsIfqugcu45ptg+WAaQJo3rPIHavUW
   NlaH1oElCiAwCzR7hbVu3xVJX0xdakfE112ZRJU3c91XYOfWedeBiGYfd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="406354679"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="406354679"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 22:14:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="753009212"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="753009212"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2023 22:14:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm6LF-000VyJ-2t;
	Tue, 11 Apr 2023 05:14:53 +0000
Date: Tue, 11 Apr 2023 13:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:for-next 4/4]
 drivers/platform/chrome/cros_ec_debugfs.c:404: warning: This comment starts
 with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202304111306.f3AWxKuA-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230411/202304111306.f3AWxKuA-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git/commit/?id=4696f24c5655dafc277c778bc7c20812bd72d44b
        git remote add tzungbi-chrome-platform https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git
        git fetch --no-tags tzungbi-chrome-platform for-next
        git checkout 4696f24c5655dafc277c778bc7c20812bd72d44b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/platform/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111306.f3AWxKuA-lkp@intel.com/

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

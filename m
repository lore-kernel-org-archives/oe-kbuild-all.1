Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3542C6FC5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678198580; x=1709734580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pJcdxhKafyz6zGFgZspmeYiHlMigdQK9yYEDDD9Lgzo=;
  b=aNUlBj0NdcZnLq0YYQ06g7bubj7xyIpkcDo3Kc/yCZXgOlHFfYAGeoV9
   PQcFCEPVZB88YXAftrRNYA5UVS5pEnWJY5EAULw2EmR/wwCb/0nwipVei
   sZxLKnV2HXR0NlMnE+7JgH24E0Y9L8YbNZ3u+b8BdH82n4l85bCdJhl5I
   pl99Hs1OOElFT3pyH35mGY3vaEkj7DTQsVWZqFGqw9fPfY60YMtkNuNhi
   t169vlwZTUJwcMWCV6vkv+kIBJ2BT4z/ius2GjfH0EIgijiZY6tAt7lbn
   FKy7JzFiLBoeG7p8yPLXtH2wl4emL8HEsHMhY/aSnEwYu8hE0N3KePuXF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422131120"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="422131120"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 06:16:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="678947731"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="678947731"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Mar 2023 06:16:08 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZY6q-0001NX-07;
	Tue, 07 Mar 2023 14:16:08 +0000
Date: Tue, 7 Mar 2023 22:15:25 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.2 136/139] fs/debugfs/file.c:959:9: warning:
 no previous prototype for 'debugfs_read_file_cpumask'
Message-ID: <202303072202.jsd0sqAM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.2
head:   b04a157f0da06d80607a04ca0c1f58b610ba4a44
commit: eca824efb549effb3884515952c8587ee46cc8fb [136/139] debugfs: Add helpers for creating cpumask entries in debugfs
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230307/202303072202.jsd0sqAM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?id=eca824efb549effb3884515952c8587ee46cc8fb
        git remote add morse https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
        git fetch --no-tags morse mpam/snapshot/v6.2
        git checkout eca824efb549effb3884515952c8587ee46cc8fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash fs/debugfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303072202.jsd0sqAM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/debugfs/file.c:959:9: warning: no previous prototype for 'debugfs_read_file_cpumask' [-Wmissing-prototypes]
     959 | ssize_t debugfs_read_file_cpumask(struct file *file, char __user *user_buf,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/debugfs_read_file_cpumask +959 fs/debugfs/file.c

   958	
 > 959	ssize_t debugfs_read_file_cpumask(struct file *file, char __user *user_buf,
   960					   size_t count, loff_t *ppos)
   961	{
   962		struct dentry *dentry = F_DENTRY(file);
   963		struct cpumask *cpumask;
   964		char *kernel_buf;
   965		ssize_t ret;
   966		int len;
   967	
   968		ret = debugfs_file_get(dentry);
   969		if (unlikely(ret))
   970			return ret;
   971	
   972		/* How long is a piece of string? */
   973		kernel_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
   974		if (!kernel_buf) {
   975			debugfs_file_put(dentry);
   976			return -ENOMEM;
   977		}
   978	
   979		cpumask = (struct cpumask *)file->private_data;
   980		len = scnprintf(kernel_buf, PAGE_SIZE,
   981				"%*pb\n", cpumask_pr_args(cpumask));
   982		debugfs_file_put(dentry);
   983		if (len + 1 >= PAGE_SIZE) {
   984			kfree(kernel_buf);
   985			return -EIO;
   986		}
   987	
   988		ret = simple_read_from_buffer(user_buf, count, ppos, kernel_buf, len);
   989		kfree(kernel_buf);
   990	
   991		return ret;
   992	}
   993	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

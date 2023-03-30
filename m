Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81361C31
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680165645; x=1711701645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CT+Y8lL66LulbqYjyUVdpcLyn2OzNrS7QdLeRz/9voM=;
  b=KVifw5bLgGFA2uDa+6uNZvPM6Kf46DA8Z8D34yT+dFNdiwJc8KFS9Spn
   RpKTVKMWHJ2hPOnv6iVaiIq/h2V96c72YDDjbMqvIZ3TMP1cpG7HJ1mMG
   C7DOUmE9goOE5sz+zxd/316x5VlFlU4axCei0K/HqdG1aS/bRxMVn0PZa
   WQkfZ1JLGsMrkYe1l4fXkdVX08bWgTHQ/3UnSF8zcbzxDsdjzWl/q5qZp
   kdnWAujMQ/clRRcLWxkCeffE0xAOfsxKxg3XNlM/9zmeCu3Iz+FmwMRC1
   33jvu76Z/Ah37EW3UHS1SPBReN9zekVbX+WqhuEQ8X3MQ1zZjq3DiJNY5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="339831006"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="339831006"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 01:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="661910925"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="661910925"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Mar 2023 01:40:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phnpq-000Kd8-0j;
	Thu, 30 Mar 2023 08:40:42 +0000
Date: Thu, 30 Mar 2023 16:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:xen/host 3/4] drivers/xen/privcmd.c:967:24: error:
 'GUEST_SIZE' undeclared
Message-ID: <202303301612.9dyFGU6n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git xen/host
head:   65d8423a4a54f82d4e03d95bd16f8677f0d146b4
commit: 54b9328c826175b945670c172369f90e14d0b11a [3/4] HACK: xen: privcmd: Implement llseek()
config: arm-randconfig-r046-20230329 (https://download.01.org/0day-ci/archive/20230330/202303301612.9dyFGU6n-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/commit/?id=54b9328c826175b945670c172369f90e14d0b11a
        git remote add vireshk https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git
        git fetch --no-tags vireshk xen/host
        git checkout 54b9328c826175b945670c172369f90e14d0b11a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/xen/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301612.9dyFGU6n-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/xen/privcmd.c: In function 'privcmd_llseek':
>> drivers/xen/privcmd.c:967:24: error: 'GUEST_SIZE' undeclared (first use in this function)
     967 |                 return GUEST_SIZE;
         |                        ^~~~~~~~~~
   drivers/xen/privcmd.c:967:24: note: each undeclared identifier is reported only once for each function it appears in


vim +/GUEST_SIZE +967 drivers/xen/privcmd.c

   963	
   964	static loff_t privcmd_llseek(struct file *file, loff_t offset, int whence)
   965	{
   966		if (whence == SEEK_END)
 > 967			return GUEST_SIZE;
   968	
   969		return 0;
   970	}
   971	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

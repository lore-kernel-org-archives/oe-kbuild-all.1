Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7CC136D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Mar 2023 06:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679724291; x=1711260291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GhAWiJnBLxCWJQ7GBINKevJwenLfd+WKDbf63CPjnuQ=;
  b=SV0HD/QXjiQhcBdvkW8n3H2qkV138qP43gWbOW0zcgl8DQHHxxJQho8N
   jhv0MgVb7eiD61T5R3izPkvpOR4pQiItFbw00ObNTbhbd3AtGrqDL0lXA
   hRQCOnaG5FXSnFIDzsnSVqU3GF1WaRknYhjxo/JCjbbfHGiS6ughiAZLj
   cPg8pztOYcFoqH8HRFz4kTDR0AAqoXhGpbdok6xfo5JF4LSoz1Uct12Yj
   5gFSLWr5GffzNUxgk5kGHnlYZPGnBK3VqWU8QtBcFPwEiIMBVayaSmDDa
   mexzLJgJsr22yBlXWzgYmKP0Hb9CwV44DBJEJp4Pex63SlVSAkub/5Zkx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="404866053"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="404866053"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 23:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="793696212"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="793696212"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2023 23:04:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfx1F-000G0k-10;
	Sat, 25 Mar 2023 06:04:49 +0000
Date: Sat, 25 Mar 2023 14:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] kunit: Add APIs for managing devices
Message-ID: <202303251331.N1fmzaiH-lkp@intel.com>
References: <20230325043104.3761770-3-davidgow@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230325043104.3761770-3-davidgow@google.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc3]
[cannot apply to next-20230324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Gow/kunit-resource-Add-kunit_defer-functionality/20230325-123304
patch link:    https://lore.kernel.org/r/20230325043104.3761770-3-davidgow%40google.com
patch subject: [RFC PATCH 2/2] kunit: Add APIs for managing devices
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230325/202303251331.N1fmzaiH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/489de1f44af455844bbc158f03f5940c2707992d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Gow/kunit-resource-Add-kunit_defer-functionality/20230325-123304
        git checkout 489de1f44af455844bbc158f03f5940c2707992d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303251331.N1fmzaiH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/device.c:32:16: warning: no previous prototype for 'kunit_device_register' [-Wmissing-prototypes]
      32 | struct device *kunit_device_register(struct kunit *test, const char *name)
         |                ^~~~~~~~~~~~~~~~~~~~~
>> lib/kunit/device.c:63:6: warning: no previous prototype for 'kunit_device_unregister' [-Wmissing-prototypes]
      63 | void kunit_device_unregister(struct kunit *test, struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/kunit_device_register +32 lib/kunit/device.c

    31	
  > 32	struct device *kunit_device_register(struct kunit *test, const char *name)
    33	{
    34		struct kunit_device *kunit_dev;
    35		int err = -ENOMEM;
    36	
    37		kunit_dev = kzalloc(sizeof(struct kunit_device), GFP_KERNEL);
    38		if (!kunit_dev)
    39			return ERR_PTR(err);
    40	
    41		kunit_dev->owner = test;
    42	
    43		err = dev_set_name(&kunit_dev->dev, "%s.%s", test->name, name);
    44		if (err) {
    45			kfree(kunit_dev);
    46			return ERR_PTR(err);
    47		}
    48	
    49		kunit_dev->dev.release = kunit_device_release;
    50	
    51		err = device_register(&kunit_dev->dev);
    52		if (err) {
    53			put_device(&kunit_dev->dev);
    54			return ERR_PTR(err);
    55		}
    56	
    57		kunit_defer(test, (kunit_defer_function_t)device_unregister, &kunit_dev->dev, GFP_KERNEL);
    58	
    59		return &kunit_dev->dev;
    60	}
    61	EXPORT_SYMBOL_GPL(kunit_device_register);
    62	
  > 63	void kunit_device_unregister(struct kunit *test, struct device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

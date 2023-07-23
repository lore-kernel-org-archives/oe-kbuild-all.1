Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC547F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690111133; x=1721647133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gH/acgN/Pjhp26In5ltM/5jZ95SuLV5Z78Od5ZnfzdI=;
  b=Q5Xcbfrx19D7jvDQF/9h8KacZboeEnsfFG/kKfY3R9lua/ZCuKTlX5dj
   uKjjGq9F5mOaNe9MN61VwXiXrx/9KDj00WpqZ+6kT+17pgud1p4hY5Zq8
   jUBTNCcIHPYpiuMt7uUZ4KVXEDhx5F72n+Pwfp3DbuDSP3X1mui9A+FCP
   9+4W76ula9NDkDl2RgWGxtgAPekd+H9tNdjZFbvvz2128EVNARu/Z88ML
   isal48vrEpXNi61JazsZW5a5Z8qaZ8BRKd5UVEs4zvzJk9J6XV+plQ37I
   YJKURIKYepmukg8gYmPyTkiq4QyrrZx7Z1NO/BIb+umY6vgbm7fken4K2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="369941516"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="369941516"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 04:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="702559916"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="702559916"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 23 Jul 2023 04:18:51 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNX6x-0008yR-0L;
	Sun, 23 Jul 2023 11:18:51 +0000
Date: Sun, 23 Jul 2023 19:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <202307231907.FiS4VQie-lkp@intel.com>
References: <20230723083721.35384-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230723083721.35384-3-biju.das.jz@bp.renesas.com>

Hi Biju,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus wsa/i2c/for-next linus/master v6.5-rc2 next-20230721]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/drivers-fwnode-Extend-device_get_match_data-to-struct-bus_type/20230723-163825
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20230723083721.35384-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
config: nios2-randconfig-r033-20230723 (https://download.01.org/0day-ci/archive/20230723/202307231907.FiS4VQie-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307231907.FiS4VQie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307231907.FiS4VQie-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/i2c-core-base.c: In function 'i2c_get_match_data_helper':
>> drivers/i2c/i2c-core-base.c:126:16: warning: return discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     126 |         return (const void *)match->driver_data;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c: In function 'i2c_device_get_match_data':
>> drivers/i2c/i2c-core-base.c:141:42: warning: passing argument 1 of 'i2c_get_match_data_helper' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     141 |         return i2c_get_match_data_helper(driver, client);
         |                                          ^~~~~~
   drivers/i2c/i2c-core-base.c:117:59: note: expected 'struct i2c_driver *' but argument is of type 'const struct i2c_driver *'
     117 | static void *i2c_get_match_data_helper(struct i2c_driver *driver,
         |                                        ~~~~~~~~~~~~~~~~~~~^~~~~~


vim +/const +126 drivers/i2c/i2c-core-base.c

   116	
   117	static void *i2c_get_match_data_helper(struct i2c_driver *driver,
   118					       const struct i2c_client *client)
   119	{
   120		const struct i2c_device_id *match;
   121	
   122		match = i2c_match_id(driver->id_table, client);
   123		if (!match)
   124			return NULL;
   125	
 > 126		return (const void *)match->driver_data;
   127	}
   128	
   129	static const void *i2c_device_get_match_data(const struct device *dev)
   130	{
   131		const struct i2c_client *client = to_i2c_client(dev);
   132		const struct i2c_driver *driver;
   133	
   134		if (!dev->driver)
   135			return NULL;
   136	
   137		driver = to_i2c_driver(dev->driver);
   138		if (!driver)
   139			return NULL;
   140	
 > 141		return i2c_get_match_data_helper(driver, client);
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

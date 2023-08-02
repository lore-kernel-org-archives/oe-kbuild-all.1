Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3095F110C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 04:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690950191; x=1722486191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uniHFEhC0kf7c4W37qcR9vLoVyBWjgm6Wi/d7amYaug=;
  b=gOiNdLPZwERXrlaPrAFLO6If4f/NCnPdmGmoh3dJsx3WCG224w2O4C9j
   i/boZ3qB5KCfLYU+YOyW8WMwBX8wa+vt2zC2BYDOroCDLWhrljhQKiXF4
   MPWEjGLF7DodciXImGCS1TustCsxugzp87q8bEuyEwXn69CWbYeQqJvuN
   TquuQhOZK1W5Kk+IrLW3c8Wnickpfu335jhLMf6VCbrobMv7X7C/mni5Q
   Sz0V2C2u2tEJMqX8qGR2bm5GcXBFClXEFWjAf8MR7DrulaP9bO7vmJvuN
   FyCQU21r2Dk829oh5BJ6rHrzyGfcCGybk11Fnd5D83OlBxSKNzOB2w8WG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369473739"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="369473739"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 21:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="902843405"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="902843405"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Aug 2023 21:23:07 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR3O6-0000rT-19;
	Wed, 02 Aug 2023 04:23:06 +0000
Date: Wed, 2 Aug 2023 12:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	linux-i2c@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <202308021202.uZeI7Cnt-lkp@intel.com>
References: <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801170318.82682-3-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.5-rc4 next-20230801]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/drivers-fwnode-Extend-device_get_match_data-to-struct-bus_type/20230802-010931
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230801170318.82682-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
config: parisc-randconfig-r026-20230731 (https://download.01.org/0day-ci/archive/20230802/202308021202.uZeI7Cnt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021202.uZeI7Cnt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021202.uZeI7Cnt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/i2c/i2c-core-base.c:23:
   include/linux/i2c.h:1038:2: error: redefinition of 'i2c_of_match_device'
    1038 | *i2c_of_match_device(const struct of_device_id *matches,
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:1031:2: note: previous definition of 'i2c_of_match_device' with type 'const struct of_device_id *(const struct of_device_id *, struct i2c_client *)'
    1031 | *i2c_of_match_device(const struct of_device_id *matches,
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c: In function 'i2c_device_get_match_data':
>> drivers/i2c/i2c-core-base.c:146:25: error: implicit declaration of function 'i2c_of_match_device_sysfs'; did you mean 'i2c_of_match_device'? [-Werror=implicit-function-declaration]
     146 |                 match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                         i2c_of_match_device
>> drivers/i2c/i2c-core-base.c:146:23: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     146 |                 match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
         |                       ^
   cc1: some warnings being treated as errors


vim +146 drivers/i2c/i2c-core-base.c

   128	
   129	static const void *i2c_device_get_match_data(const struct device *dev)
   130	{
   131		/* TODO: use i2c_verify_client() when it accepts const pointer */
   132		const struct i2c_client *client = (dev->type == &i2c_client_type) ?
   133						  to_i2c_client(dev) : NULL;
   134		const void *data;
   135	
   136		if (!dev->driver)
   137			return NULL;
   138	
   139		data = i2c_get_match_data_helper(to_i2c_driver(dev->driver), client);
   140		if (data)
   141			return data;
   142	
   143		if (dev->driver->of_match_table) {
   144			const struct of_device_id *match;
   145	
 > 146			match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
   147							  (struct i2c_client *)client);
   148			if (match)
   149				data = match->data;
   150		}
   151	
   152		return data;
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

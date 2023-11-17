Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65524321AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGfak7Pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700231093; x=1731767093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KkQB0JC1sh9iALs/FsLxS+o9qCBJEgLAxvhigYsmDTs=;
  b=cGfak7PuD7KUSEHeSN+Ic7vG2qW/pNWNpWWPCPz38pWfzPMaubmULJ4Z
   HP3fM8fWz98xciyQYZFbjElnzHGwJqbvq541fIcO6zxFLfAW8cVxa1LFD
   layonwZRZ67KaOvJOwlnp/eKDMHS1w3NuuY9y7C0BkJK6K1AWxe25PcbM
   tw5OvlUQdJMhk5OCH1OHaYwB4Z3VQbK8U09ptgBdmSZIUzqh/3hswuIjM
   MuNJ2Rb3xkzVkFiGhZME1hfLklpWLz6MR0uzF8JHa0B27CmPAmloicH7O
   LxMxEsyymB6Bl+CnHpdtbbYy2vwN7HfNuV1SP2Aac+Eq5Tv4eu8jyh8VB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="390163906"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="390163906"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 06:24:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="889255853"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="889255853"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Nov 2023 06:24:48 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3zlz-0002qh-1u;
	Fri, 17 Nov 2023 14:24:43 +0000
Date: Fri, 17 Nov 2023 22:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: Anshul Dalal <anshulusr@gmail.com>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Anshul Dalal <anshulusr@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jonathan Cameron <jic23@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] iio: light: driver for Lite-On ltr390
Message-ID: <202311172224.S2IXNUii-lkp@intel.com>
References: <20231117074554.700970-2-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117074554.700970-2-anshulusr@gmail.com>

Hi Anshul,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on robh/for-next linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshul-Dalal/iio-light-driver-for-Lite-On-ltr390/20231117-154922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20231117074554.700970-2-anshulusr%40gmail.com
patch subject: [PATCH v2 2/2] iio: light: driver for Lite-On ltr390
config: xtensa-randconfig-r081-20231117 (https://download.01.org/0day-ci/archive/20231117/202311172224.S2IXNUii-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311172224.S2IXNUii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311172224.S2IXNUii-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/iio/light/ltr390.c:23:
>> drivers/iio/light/ltr390.c:217:25: error: 'ltr390_id_table' undeclared here (not in a function); did you mean 'ltr390_of_table'?
     217 | MODULE_DEVICE_TABLE(of, ltr390_id_table);
         |                         ^~~~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__ltr390_id_table_device_table' aliased to undefined symbol 'ltr390_id_table'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/iio/light/ltr390.c:217:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     217 | MODULE_DEVICE_TABLE(of, ltr390_id_table);
         | ^~~~~~~~~~~~~~~~~~~


vim +217 drivers/iio/light/ltr390.c

   212	
   213	static const struct of_device_id ltr390_of_table[] = {
   214		{ .compatible = "liteon,ltr390"},
   215		{ /* Sentinel */ }
   216	};
 > 217	MODULE_DEVICE_TABLE(of, ltr390_id_table);
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B430A5C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 05:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686720536; x=1718256536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kFYvEOf4qnpF1L29yohf4l+qA/2M0cadu9gIeKSADAc=;
  b=FvzgJnRg06eQPHF8EEbqUidKs2VpxtLtmNuigL8nJRjxh4xwOAboUJL1
   844Xy7bh/UkSsgEQYeaJ9ndJogHnHYC0nZXJCV5HaaJD4M3u1eGoRuYAb
   e/yIVM6Pe+snPxqtYGPhkepIjZOL+OvZgClw3ncZY0lLmfhhc08UaBn+O
   5sqKNozf2WOKsXRfmxhrJBLhy9EXq6lPw9xd83mUG+nf20rxNJylbkuGl
   sX60FKZZBxZ4v9Fe8PxEUuYdPQuOEPLb6q9Qvd4ci55f4kzRsraC74JNJ
   TjbfbncibDRlsoN2EdVJqd9DBsu8NkTXf9QIqEdqm4uxRVfYCv3n0mobu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="424409606"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="424409606"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 22:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="886081786"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="886081786"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Jun 2023 22:28:52 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9J2k-0000Dh-1K;
	Wed, 14 Jun 2023 05:28:01 +0000
Date: Wed, 14 Jun 2023 13:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] rtc: isl12022: implement support for the
 #clock-cells DT property
Message-ID: <202306141318.xPzubJXo-lkp@intel.com>
References: <20230613130011.305589-9-linux@rasmusvillemoes.dk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613130011.305589-9-linux@rasmusvillemoes.dk>

Hi Rasmus,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on robh/for-next linus/master v6.4-rc6 next-20230613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rasmus-Villemoes/rtc-isl12022-remove-wrong-warning-for-low-battery-level/20230613-210308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20230613130011.305589-9-linux%40rasmusvillemoes.dk
patch subject: [PATCH v2 8/8] rtc: isl12022: implement support for the #clock-cells DT property
config: i386-randconfig-i012-20230612 (https://download.01.org/0day-ci/archive/20230614/202306141318.xPzubJXo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add abelloni https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
        git fetch abelloni rtc-next
        git checkout abelloni/rtc-next
        b4 shazam https://lore.kernel.org/r/20230613130011.305589-9-linux@rasmusvillemoes.dk
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306141318.xPzubJXo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__clk_hw_register_fixed_rate" [drivers/rtc/rtc-isl12022.ko] undefined!
>> ERROR: modpost: "of_clk_hw_simple_get" [drivers/rtc/rtc-isl12022.ko] undefined!
>> ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/rtc/rtc-isl12022.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

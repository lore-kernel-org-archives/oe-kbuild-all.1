Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEAF7C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 05:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674450661; x=1705986661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G0T9CBQMm3M05NepIpVoxbviDZVhyd2lAZttRFNTUkc=;
  b=U/9ewjImN0wLC6uBbZkk9boj5SijaADnYeEQ2sYm4LMJoy6uj8DpmK3M
   4qC3eFxz95/u+eLgow0ISylnJz9uukXdfQkLzxsXkF2RJYVJk9PfHNU8Z
   ehZsJc3JFLO44+p8iM/trOCsg7muorn6w2RFwvqKkXTlM/YfKMC47OTNM
   F1CsZy3/vkQTtQlSZibHwzNmfOBp1QPnB1Re1gf6jbHO5w0BmYAGXWiCq
   pXsFvm4rC/G3XonKeUbx76vYdfjb3xC+qnZZaoVLEZ2sub/ecspiOT8qz
   n2MSG/1Nz9KPlV8NnH247lUiBabTPotUKqt5W087a7JPjBBBNzBsVPxiw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="305633841"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="305633841"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 21:11:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="692009289"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="692009289"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Jan 2023 21:10:58 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJp6f-0005RU-0e;
	Mon, 23 Jan 2023 05:10:57 +0000
Date: Mon, 23 Jan 2023 13:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2] thermal: int340x_thermal: Add production mode
 attribute
Message-ID: <202301231218.inlZXxdA-lkp@intel.com>
References: <20230123024040.337866-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123024040.337866-1-srinivas.pandruvada@linux.intel.com>

Hi Srinivas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on linus/master v6.2-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Pandruvada/thermal-int340x_thermal-Add-production-mode-attribute/20230123-104105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20230123024040.337866-1-srinivas.pandruvada%40linux.intel.com
patch subject: [PATCH v2] thermal: int340x_thermal: Add production mode attribute
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230123/202301231218.inlZXxdA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/2c4e5f536a8e523a9f48701629806ecb63346cc0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Srinivas-Pandruvada/thermal-int340x_thermal-Add-production-mode-attribute/20230123-104105
        git checkout 2c4e5f536a8e523a9f48701629806ecb63346cc0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/thermal/intel/int340x_thermal/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/thermal/intel/int340x_thermal/int3400_thermal.c:351:6: warning: no previous prototype for 'production_mode_exit' [-Wmissing-prototypes]
     351 | void production_mode_exit(struct int3400_thermal_priv *priv)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/production_mode_exit +351 drivers/thermal/intel/int340x_thermal/int3400_thermal.c

   350	
 > 351	void production_mode_exit(struct int3400_thermal_priv *priv)
   352	{
   353		if (priv->production_mode >= 0)
   354			sysfs_remove_file(&priv->pdev->dev.kobj, &dev_attr_production_mode.attr);
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

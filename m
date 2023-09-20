Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A8F8833
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 10:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695206731; x=1726742731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BQ04r3rhhEvN+xUr1SkWuerOykbF40OxGzgam9T1NW4=;
  b=O24NrbdaDheZvKNYYOj7MkHhqsCKCUjV2Z6YDFph1/PfVlmjHExC4t81
   +0j6y/yWXhIWbA21wUC8CC/kgcJ+tA4kmW72s9uvdvxV+qEc6zinqsDJ3
   x+na9AOCuNJtqysCyh9syNbSClzS9lfma76w7OcUyYl3RJz9oGCV8pYp4
   LbazsTUZRvO4jURkKN/IBNnXrsKLVXAoJK/aRKurA68YK8rXD5ZzjUE6o
   j1Gug0scBImDl92BQKFAUNffwbG35DxBKcZILi/WZR718o6EM9zq4XLi1
   Z2GMNP+DwXzkJJZsVc1lyH/u9H2+OPq9NsKSQ2IsliGuxnVh4WOGL+cqt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="360445469"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="360445469"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 03:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="723226594"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="723226594"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Sep 2023 03:45:27 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiuhx-0008ei-08;
	Wed, 20 Sep 2023 10:45:25 +0000
Date: Wed, 20 Sep 2023 18:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
	lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: tfa9879: Convert to dtschema
Message-ID: <202309201811.iKOZ5prG-lkp@intel.com>
References: <20230919090739.2448-1-bragathemanick0908@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919090739.2448-1-bragathemanick0908@gmail.com>

Hi Bragatheswaran,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.6-rc2 next-20230920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bragatheswaran-Manickavel/ASoC-dt-bindings-tfa9879-Convert-to-dtschema/20230919-170919
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230919090739.2448-1-bragathemanick0908%40gmail.com
patch subject: [PATCH] ASoC: dt-bindings: tfa9879: Convert to dtschema
reproduce: (https://download.01.org/0day-ci/archive/20230920/202309201811.iKOZ5prG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201811.iKOZ5prG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/tfa9879.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

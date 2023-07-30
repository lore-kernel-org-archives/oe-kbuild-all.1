Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32001FDA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 19:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690746229; x=1722282229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OJcPVZGJsNDtlNBUMYQUs217ooQQcJO9vUAsDUDHiUw=;
  b=lk+A64zqC+FMeZexdhEE6u+2pK5i3bjuTlemz3O1fUICoZx0BZ+pKxjH
   PcugwEKjoxsBC7DU4Y9OU0UOLHKmvn9f2zYqbi4Ki/dgWiQAJSnlJyVV4
   GhzUY1XwVM8PVxAHNF6/Gid3aCBqRL64Zmsq8PLgdjV1oN01RSHSH+H1p
   cegC9tqaB3ZxX8aSrWKOt1/6zzeY7dq2LGRu2oWEeiZm0MuKNL3DB+r9Y
   uie6MCPj07YWoK1pW+s6Ef09SvlWOSRjTkVZZw1Rq1OrGRnaLY7KmnvN+
   hKi2A473p6nufd/XccCe2iY3Q2nB91xmyJmk0g/ylwFvq/RaioFg4nNEh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="366351077"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="366351077"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 12:43:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="841968895"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="841968895"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2023 12:43:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQCKO-0004kv-0r;
	Sun, 30 Jul 2023 19:43:44 +0000
Date: Mon, 31 Jul 2023 03:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>, Iskren Chernev <me@iskren.info>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matheus Castello <matheus@castello.eng.br>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] power: max17040: get thermal data from adc if
 available
Message-ID: <202307310308.FDG6br3Y-lkp@intel.com>
References: <20230730172648.71578-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230730172648.71578-4-clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk-dt/for-next]
[also build test ERROR on linus/master v6.5-rc3 next-20230728]
[cannot apply to sre-power-supply/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-power-supply-maxim-max17040-update-properties/20230731-012920
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git for-next
patch link:    https://lore.kernel.org/r/20230730172648.71578-4-clamor95%40gmail.com
patch subject: [PATCH v2 3/3] power: max17040: get thermal data from adc if available
config: x86_64-buildonly-randconfig-r001-20230731 (https://download.01.org/0day-ci/archive/20230731/202307310308.FDG6br3Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310308.FDG6br3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307310308.FDG6br3Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `max17040_get_property':
>> max17040_battery.c:(.text+0x1cb3dd0): undefined reference to `iio_read_channel_processed_scale'
   ld: vmlinux.o: in function `max17040_probe':
>> max17040_battery.c:(.text+0x1cb40f5): undefined reference to `devm_iio_channel_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

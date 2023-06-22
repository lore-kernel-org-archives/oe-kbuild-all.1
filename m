Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CBC15C1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 02:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687402161; x=1718938161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tt3wX80eeUJQMUKZ5re8uDuyu//FG7twtLDZz+jjnVo=;
  b=bTEp3xGNcqgazI1fyX8xh9EDWfXO9pnXM+eOqtJ+SbAJnPWwZAkxzMNA
   9rmgqcNzRdqEImcToVMR0ypXLSHSpvneew+dqf0cDVxqM4XfK1Im1hTDU
   YokWO3hpVaOlWfcnXnrAL2mQLLsKrImwCbCcOD0ZFWi7SCrJgkeF91YNv
   y4bcErlZkb6KD5grmEOmOjAxnDc+98r9wLY5CsvnGLZSiBLfvloQeJ2FZ
   SmSbVURswuiIUJI11o/kRSFGGUrJktaoLVag06dKx6WbXDK9XaVi3AFx7
   dIue9YTFQ5In16Fu1xft4RzKwy5Dw+O2KgaihDgmp4OHJ/drwIU/QWZbT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="446747560"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="446747560"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 19:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="744432432"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="744432432"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Jun 2023 19:48:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCAN0-0007HO-2b;
	Thu, 22 Jun 2023 02:48:26 +0000
Date: Thu, 22 Jun 2023 10:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Junxiao Chang <junxiao.chang@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next 08/11] net: stmmac: platform: provide
 devm_stmmac_probe_config_dt()
Message-ID: <202306221025.K6fKRmj7-lkp@intel.com>
References: <20230621153650.440350-9-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621153650.440350-9-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/net-stmmac-platform-provide-stmmac_pltfr_init/20230621-234133
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230621153650.440350-9-brgl%40bgdev.pl
patch subject: [PATCH net-next 08/11] net: stmmac: platform: provide devm_stmmac_probe_config_dt()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230622/202306221025.K6fKRmj7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221025.K6fKRmj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306221025.K6fKRmj7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `__ksymtab_devm_stmmac_probe_config_dt':
>> stmmac_platform.c:(___ksymtab_gpl+devm_stmmac_probe_config_dt+0x0): undefined reference to `devm_stmmac_probe_config_dt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

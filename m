Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EC123CC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 20:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689019288; x=1720555288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kZ45qk7hVluta2GMMn37Fyi3fXfY6yfPSBwe92peGkM=;
  b=ffIadL2SrIQZ3ua0irtCibxTwZ0Le4/jrhop7gtRZtHqbXcTl5ykssmr
   ZpnB3tZV39p7XRU7oUj+KYqCyI4ajKuf6239t7XIW9/fb7xzxqCUdPLVe
   1zNbhLLqe89tht8vgYdspma9sTFq0mrrfdTHz98ZgxbxaaGA7kNL95PoP
   /bL1vp57TeV0uJZuarzVJG2VOmIDWGOUVrPTdwHlWPbwkeSwUaGkjPyZL
   PrkOkrvQrlnNO8c7aNthx/RqTfiG7zjc3YKKJuMqbIw4CPwb75Gn/a5zj
   4Ta1XMJ58sIaj5RMLBGp5PIkiuFip713/hVNUZE4pypNbNik+PCaa7toF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="363309445"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="363309445"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 13:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="967538695"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="967538695"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jul 2023 13:01:25 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIx4W-0003vK-1c;
	Mon, 10 Jul 2023 20:01:24 +0000
Date: Tue, 11 Jul 2023 04:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: alison@she-devel.com, johan@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alison@she-devel.com, achaiken@aurora.tech
Subject: Re: [PATCH v8 1/2] gnss: ubx: customize serial device open to set
 U-Blox Zed-F9P baud
Message-ID: <202307110347.FjEbD70k-lkp@intel.com>
References: <20230628150948.908273-2-alison@she-devel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628150948.908273-2-alison@she-devel.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6995e2de6891c724bfeb2db33d7b87775f913ad1]

url:    https://github.com/intel-lab-lkp/linux/commits/alison-she-devel-com/gnss-ubx-customize-serial-device-open-to-set-U-Blox-Zed-F9P-baud/20230628-231318
base:   6995e2de6891c724bfeb2db33d7b87775f913ad1
patch link:    https://lore.kernel.org/r/20230628150948.908273-2-alison%40she-devel.com
patch subject: [PATCH v8 1/2] gnss: ubx: customize serial device open to set U-Blox Zed-F9P baud
config: microblaze-randconfig-r062-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110347.FjEbD70k-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110347.FjEbD70k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110347.FjEbD70k-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gnss/ubx.c:293:5-11: ERROR: allocation function on line 292 returns NULL not ERR_PTR on failure

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

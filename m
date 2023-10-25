Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907F62031F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 19:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMtDasIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698260998; x=1729796998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YjKHxYzEmBH/UUmvmSImTusCIJhp0uLybwSGjEBY/tE=;
  b=AMtDasIuaB+UdMOAZ+/w9pCcS7Z7EYRtInlujwIh11lyftaNu5cOMYMq
   qLKgNu1wgHROuaR4aID+gfHdoomp9ePNVoIqeyS5L2MzgqKChfna5PraV
   3sX0X+gdFB4S6lkZmIKS+RzSGMAp8G1PZ69x3eCSbHIwL9sMUcu3Fe6lU
   fRAwdY33S1rzVV6bJl+ZJI4OeMZdKZLR1Iyodgr4Daj5lFyYb5MyjM2bo
   EZYKH6V/M1S2B3EBod9vADAZ6upFnXRfh7HKok/fMqqvrSFbpsMWwkAA8
   PhYnPnUHXpafU/sh+k9RKSa580qbbicFtQUOUbfnH1eG/w23R8IGfCXFe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="366728097"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="366728097"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 12:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="1006117278"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="1006117278"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Oct 2023 12:09:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvjFt-00098W-0F;
	Wed, 25 Oct 2023 19:09:25 +0000
Date: Thu, 26 Oct 2023 03:09:21 +0800
From: kernel test robot <lkp@intel.com>
To: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	corbet@lwn.net, steen.hegelund@microchip.com, rdunlap@infradead.org,
	horms@kernel.org, casper.casan@gmail.com, andrew@lunn.ch
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, horatiu.vultur@microchip.com,
	Woojung.Huh@microchip.com, Nicolas.Ferre@microchip.com,
	UNGLinuxDriver@microchip.com, Thorsten.Kummermehr@microchip.com,
	Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>
Subject: Re: [PATCH net-next v2 1/9] net: ethernet: implement OPEN Alliance
 control transaction interface
Message-ID: <202310260209.uDkw3VNh-lkp@intel.com>
References: <20231023154649.45931-2-Parthiban.Veerasooran@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023154649.45931-2-Parthiban.Veerasooran@microchip.com>

Hi Parthiban,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Parthiban-Veerasooran/net-ethernet-implement-OPEN-Alliance-control-transaction-interface/20231023-235310
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231023154649.45931-2-Parthiban.Veerasooran%40microchip.com
patch subject: [PATCH net-next v2 1/9] net: ethernet: implement OPEN Alliance control transaction interface
reproduce: (https://download.01.org/0day-ci/archive/20231026/202310260209.uDkw3VNh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260209.uDkw3VNh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/networking/oa-tc6-framework.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

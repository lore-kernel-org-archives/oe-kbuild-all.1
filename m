Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63AAC2D6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 04:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFCaaUKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700108687; x=1731644687;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TiPWqw/qM6n/38QVo1PwW/L4da+B9xY4k/95Cn88Zbc=;
  b=QFCaaUKlspMMCZYMQXXrPmSvuS2yc1VBAQakbLKxZTpHY9qC3VB2Qz1G
   CLEhtS5F/DUwoZOE1h8G/jTVnlhC68xYxD9lR130ZRbKZfr8d1LuV0v0E
   Z7RXvy0mdYXpjhj6sezeQ+hhSS+XGwM3HU7js5+jTXZiq1qlGL0+vi7IW
   NPbTA5pKMvXBWOLSnnWY1ozWmFzimEyWP/y8+6yrSMqyUL42TT35+ZAVM
   3kbHLEpGhro8xastTb5kMCHWq47obQ3MZPiYw4MJOb95xVJv3+GyAu3Ld
   B4m0fh8ievdTgwdlt3K/0xxue5L/OB5JFSXo0PRsMgtU6+VD3uPp5qczO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4087193"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="4087193"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 20:24:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="768795669"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="768795669"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Nov 2023 20:24:43 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Tvl-0001Hn-1G;
	Thu, 16 Nov 2023 04:24:41 +0000
Date: Thu, 16 Nov 2023 12:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: Bryant Mairs <bryant@mai.rs>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/7] ARM: dts: qcom: apq8026-samsung-milletwifi: Enable
 Wi-Fi and Bluetooth
Message-ID: <202311161232.aXIYGTAD-lkp@intel.com>
References: <20231105204759.37107-7-bryant@mai.rs>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105204759.37107-7-bryant@mai.rs>

Hi Bryant,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on dtor-input/next dtor-input/for-linus linus/master v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryant-Mairs/dt-bindings-input-melfas-mms114-add-MMS252-compatible/20231106-045021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231105204759.37107-7-bryant%40mai.rs
patch subject: [PATCH 6/7] ARM: dts: qcom: apq8026-samsung-milletwifi: Enable Wi-Fi and Bluetooth
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231116/202311161232.aXIYGTAD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161232.aXIYGTAD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161232.aXIYGTAD-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts:15.15-26 Label or path mba_region not found
   Error: arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts:16.15-27 Label or path mpss_region not found
   Error: arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts:18.15-28 Label or path wcnss_region not found
>> Error: arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts:313.1-8 Label or path pronto not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

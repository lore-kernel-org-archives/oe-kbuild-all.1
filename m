Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140F77C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 10:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681469855; x=1713005855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8581aDVLXia4BD7N5gh7+6X7T7ZkX9w7ZpnUdBdBB74=;
  b=QznoSh6eee2Ut4pHlSill72wpskf76JrOSQNH+EzwEjxbNZTY1ocvtt3
   +WlycEzNRyY3KKVOh2nPxqK/DHC6FSwhCav2cuwzDMafushpfa8n4uSLI
   zK2tTB/7uSokBGIKAx0X5Vj4K92Bc5jKLu5qBUxzJ3QzJ6mTFpSxBkFbM
   RApaVY+ni5AphoPn861Gi7sL3Iaoi3VP9H4y/39fve83vArmdiGdpCV/u
   bk6dmQVEFxB5VWJkSVcRAtRfyKRUf3LosU+5bcgMPr3Jr9gZFq05kYX7M
   oUlE+kfipPXf96p5gYHLyZg575D+xEs30C4D2z9BK1wq8OUjvKCpx2WBy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="324065605"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="324065605"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 03:57:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="779155520"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="779155520"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2023 03:57:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnH7N-000ZST-2c;
	Fri, 14 Apr 2023 10:57:25 +0000
Date: Fri, 14 Apr 2023 18:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jianmin Lv <lvjianmin@loongson.cn>,
	wanghongliang@loongson.cn, Liu Peibao <liupeibao@loongson.cn>,
	loongson-kernel@lists.loongnix.cn, Yinbo Zhu <zhuyinbo@loongson.cn>
Subject: Re: [PATCH v7 1/2] dt-bindings: spi: add loongson spi
Message-ID: <202304141851.mUss7Eyn-lkp@intel.com>
References: <20230412045152.4694-2-zhuyinbo@loongson.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412045152.4694-2-zhuyinbo@loongson.cn>

Hi Yinbo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.3-rc6 next-20230413]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yinbo-Zhu/dt-bindings-spi-add-loongson-spi/20230412-125222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20230412045152.4694-2-zhuyinbo%40loongson.cn
patch subject: [PATCH v7 1/2] dt-bindings: spi: add loongson spi
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/e230989729f1d1e10c49d1903a5c76a5b8b81f95
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yinbo-Zhu/dt-bindings-spi-add-loongson-spi/20230412-125222
        git checkout e230989729f1d1e10c49d1903a5c76a5b8b81f95
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141851.mUss7Eyn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/spi/loongson,ls-spi.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

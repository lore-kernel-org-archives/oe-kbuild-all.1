Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A04A8477
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688717636; x=1720253636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HFnfePJDRb6z/n9hQj2zbNYyU3A+xSTQY+MubH7tn00=;
  b=WDBtxo2n9A6uds89Fo5nK4y+EZ+89eevJ8WL6nZvUtBKo6p4YTl438pw
   67Xla7E0EjCJwJAXy6AtnGpkwJPR+0ZY6vqnKZZSToV57j60GVLOKO2oU
   NLYl+SkuusWZAuycLbl9Ed0g25bzONv/xu8wsnMIhVKkkzcxfVW7zNAhh
   I8hUNOD1XURKA66F6uWStbQ0x+0w2X1AQhdw2WrN2cJgRM/If3yMsxBH3
   mzJqDKvfP15R0AkUnfz+5ooIJ25l+KMpjXHQYUH3fGcKKcUIiTsYC2a66
   vkuIqvdq573suNy8Of6JwXKcrMfG0Oh8O9fPYK/5CggLxHmLOhFO24kI7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="367326174"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="367326174"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 01:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="670079833"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="670079833"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Jul 2023 01:13:54 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHgbC-0001sm-0V;
	Fri, 07 Jul 2023 08:13:54 +0000
Date: Fri, 7 Jul 2023 16:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 213/377] Error:
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:123.1-5 Label or path gpu
 not found
Message-ID: <202307071605.IXxnHQrI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   91da1079a24840825fccc4b320c4a08b4b66fcdd
commit: 0c0fd75a179540585b867e5af837fb881ff25530 [213/377] arm64: dts: mediatek: mt8195-cherry: Enable Mali-G57 GPU
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230707/202307071605.IXxnHQrI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071605.IXxnHQrI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071605.IXxnHQrI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:123.1-5 Label or path gpu not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A32B1860
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676197245; x=1707733245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0dYjb/FZF1cTnvMYarDtzuImV+WjlJqATcEUQBlZZv8=;
  b=RQGzG5gErI3QP2iBEofWmg4tU48El5A9FGNzLGPnlYlVIoCxKmWB8K5M
   dlcUbk6ZKTG1k2HsF9V+mpqquWMw9y7qAmuWahoSYGN7ClYYK53Bcy5rG
   BfoBb14r3a8G2Zw6IG7Nvp/257QTapNZFcGv2ztHurz8R6IvQYupGHWRF
   0pQNWLDDXA+mEB07SWIdxaQjktUPvB/9nVzcR5nygBMQiDJPi4twOOY/D
   wulFLeZRKOGfWltm3L+TbySdwLAXYwiTXYLm8KKrltthZ5V+ld7pMJM4a
   i1u1xK4P8CbBizRLWgR0hVFLEVf/600cB2qy/Yv3QZGclRbZg9R/GWbIx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="332843936"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="332843936"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 02:20:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="661853694"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="661853694"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Feb 2023 02:20:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pR9TO-0007BJ-0K;
	Sun, 12 Feb 2023 10:20:42 +0000
Date: Sun, 12 Feb 2023 18:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, linux-doc@vger.kernel.org
Subject: [broonie-spi:for-next 43/43] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/spi/brcm,bcm63xx-hsspi-peripheral-props.yaml
Message-ID: <202302121840.GtduUT37-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
head:   80323599e33f9c19287a1a3707481fb157b27052
commit: 80323599e33f9c19287a1a3707481fb157b27052 [43/43] MAINTAINERS: Add entry for Broadcom Broadband SoC HS SPI drivers
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?id=80323599e33f9c19287a1a3707481fb157b27052
        git remote add broonie-spi https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
        git fetch --no-tags broonie-spi for-next
        git checkout 80323599e33f9c19287a1a3707481fb157b27052
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302121840.GtduUT37-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/spi/brcm,bcm63xx-hsspi-peripheral-props.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

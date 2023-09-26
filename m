Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49D17461
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 18:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695752217; x=1727288217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bj4BqbQF4jiCu5Kp0S5CsQDVL39sb0yTjBPlALL9qIU=;
  b=NXwbDyIO+kXLNzE/O8cKXJZ5ZL3Al/T7vDIItP+r99PlGfFljiwUxFc9
   9CFdnh1pWU2CNsOEjyg4x2tX3j0kEbDZxnkAXqMlFWiqNsTGT3sVA0z+n
   BJUyd1RfhvKEq/EgV3DZtEkNclpK1FCGVT1NWu3QobmJ+qy0ehk+WCLRy
   P66DmiVBsnuu/Dqvly9jBKUJYtuJI3xXHJ/XwxwXg7lpPU4uY29YX7WjI
   1lyZRxslIVD7sHKI44uBuNOEdoYWTlDovAs4R5yPnKhAFxap5T99gXdEC
   xKCPmaNbHgGg9MsX9EXnrvh7qhkBgBPMOQ+nRkcDhtTpQGHnIz0eZFLHZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="467921510"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="467921510"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 11:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752274452"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="752274452"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 26 Sep 2023 11:16:56 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlCc9-0003Dr-2r;
	Tue, 26 Sep 2023 18:16:53 +0000
Date: Wed, 27 Sep 2023 02:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [omap-audio:peter/linux-next-wip 44/48] dtbs_check:
 Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml:
 'maintainers' is a required property
Message-ID: <202309270235.sycR3B3F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   53915ce9abe60ba07d0e5456948553edefc6cbfb
commit: 772542b0fec8204d68ab9c1b73be2fe5a2b90558 [44/48] dt-bindings: display: bridge: tc358768: Remove maintainer information
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270235.sycR3B3F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270235.sycR3B3F-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml: 'maintainers' is a required property
   	hint: Metaschema for devicetree binding documentation
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml:
   while parsing a block mapping
     in "<unicode string>", line 4, column 1
   did not find expected key
     in "<unicode string>", line 65, column 3
   Documentation/devicetree/bindings/sound/simple-card.yaml:65:3: did not find expected key
   Documentation/devicetree/bindings/gpio/gpio-shared.yaml: title: 'Bindings for shared GPIO lines in board level' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA541D31B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 15:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692717650; x=1724253650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=126PYpTFgNWNrGZ7TD478cuYrkTzyARzZTyWre4ExCI=;
  b=bvEHWKayATmYPVNLYgrQBFZpq5yntFag5haShrlyX35iSWTI3VyIkjTw
   bsuE8PntL/TC2NkFkumzLaSlvlP3TBX2DtzMs1mGjZh4S0GhZSt9dA/Rs
   NqyBRyyE5bl6LI9nZ1CHTqnjLivgRPk56dZNTScLm0QPycAuyUXs0Or4z
   Gysy95g9GQVpqVBNSK78pO4maRTRgi4xRBSmnooBGcyoz6e7srfMcfPwT
   9vOh7HnVL4++TTmT7EItTJzfk3KMVFAQqpPpfiO1vdLRoyfnXsKQMfBDj
   n0QmODdBTNwYahgV0uEXvP6Jd8AIeNXQgy3mBq1c504XbZhYL/+10WCYt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377670283"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="377670283"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 08:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806328281"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="806328281"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2023 08:20:26 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYTBB-0000HQ-0p;
	Tue, 22 Aug 2023 15:20:25 +0000
Date: Tue, 22 Aug 2023 23:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ASoC: Delete UDA134x/L3 audio codec
Message-ID: <202308222331.ZaXmBhDK-lkp@intel.com>
References: <20230821-delete-l3-v1-1-26d9cd32e7a2@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821-delete-l3-v1-1-26d9cd32e7a2@linaro.org>

Hi Linus,

kernel test robot noticed the following build errors:

[auto build test ERROR on 17b9f4387ebabb19b871bbe2d06562e48e4e7130]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/ASoC-Delete-UDA134x-L3-audio-codec/20230821-222139
base:   17b9f4387ebabb19b871bbe2d06562e48e4e7130
patch link:    https://lore.kernel.org/r/20230821-delete-l3-v1-1-26d9cd32e7a2%40linaro.org
patch subject: [PATCH] ASoC: Delete UDA134x/L3 audio codec
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230822/202308222331.ZaXmBhDK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308222331.ZaXmBhDK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308222331.ZaXmBhDK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'sound/soc/codecs/l3.o', needed by 'sound/soc/codecs/snd-soc-l3.o'.
   scripts/Makefile.build:243: sound/soc/codecs/Makefile: wcd-clsh-v2.o is added to multiple modules: snd-soc-wcd9335 snd-soc-wcd934x snd-soc-wcd938x
   make[6]: Target 'sound/soc/codecs/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

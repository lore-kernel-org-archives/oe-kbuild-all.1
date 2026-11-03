Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729247;
	b=Pa/iMaN7mEDBWJgmZPUalkXiBNphr1YA50wFgZJ6RG9KXuzLrIoAyJFYfZVaDB5at3h+
	 UNMi26+bkXPpFdVHmL1TRp6zgDrp/YwwyuJvIPng9notRdYSsX7yq786MDGVwcetjTBZ9
	 L+OiASH70NXOKkQHVCwfoXVOVUr7+ij6sTaoWMTVqJGL3F2fptyacbjCfp2uUZABl7QWy
	 WaMjicCWzOMgjpanU5YMsf4jWvx0IvKzN4lhzT+3GhLyBH3rez5gjLyp6SnFky2CzyVoE
	 Zxu6EiGfi76FIxNoW4zMxsFz0JRzgVPXjxMjSA5jEKe2ARXP3ibdHa7OPNbA54oXs6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729247;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=36cm16tufu7kjTcTNSq16Pm9zCzreKSbe6goJz6bMTQ=;
	b=MLCpms5SZk+QzNca+hXNl3+/Lt5bzQ1G2cr4Lc4dX7gv2qs4acsbwMZhVup0BR76zgND
	 zfMSU2f2QJllRA6799sJBY5wJvoKBF4FQwJPclPpiNuxdUW7JASrw5GQRi9VxZgxrwGcV
	 X+kUBrSivR4rliJqVHmqabc6GskWzAkFTEt2L4aH2u2IemYyJyztVE+xY2isgF5hISFmh
	 lcvaYwJ+z8IA2GTilAdcbTedCeqVOYy3fcolLMc3qX9vzhHZPaTainWlmdPU1yibYuwni
	 vjwHl/gaHikC2PZRCsUOi51oIcrIppUu3vq9hGl7KochR2WSSN9eEXeAB/SLz4sOATg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NpZxaxKG;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DF2606A324
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Nov 2026 18:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24DF2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NpZxaxKG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793729246; x=1825265246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PTAlkxju/fJJHCh73QmaawX6QCKknpPLilXfmcReF7g=;
  b=NpZxaxKGTdiJ9RqPPBqR6gxl98eV67EPY+XZDbpatk+RzEpEeIFzF6ei
   CRc3q9yvnH5W1nSGAA7QZ6qX8Y9ToKkRvUKZevWC3PpVPoi6J+7+mjCkj
   hMPr2EFBgbB15TITeGxR8Yrv1I+ywtjy3kXtgwP2ESxU/mrMjmoTnLPC2
   sLJFK7i/3K39jr+NjN9YgMqL0AaJTx0ARuE42VzMpdvQnhRSsfZ3+hCrK
   6+z6Zdrz9VOaFhyPCYPP8yHbFQ1JL6VeLZYbCShTaR1aMZVEQshoDPd0d
   STlCUynWDZYnsprUFOzq7M/7XjgCALe8wIghV5psboLN1LN3/TqkoiViE
   w==;
X-CSE-ConnectionGUID: kT7jZO46SNa4Q0aJDC7+Vg==
X-CSE-MsgGUID: FgUAVA3pS420m1whqRq+ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2462675"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2462675"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:07:26 -0800
X-CSE-ConnectionGUID: WvR26PhPSiaDr0w86VeDNw==
X-CSE-MsgGUID: SqOd2sBOTTS5AMW0gY8a0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6576967"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Nov 2026 10:07:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOIun-00000000j73-0fbB;
	Tue, 03 Nov 2026 18:07:21 +0000
Date: Wed, 4 Nov 2026 02:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Szuying Chen <Chloe_Chen@asmedia.com.tw>, linusw@kernel.org,
	Markus.Elfring@web.de, brgl@kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Yd_Tseng@asmedia.com.tw,
	Jesse1_Chang@asmedia.com.tw, Richard_Hsu@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw
Subject: Re: [PATCH v3] gpio: amdptpci: add support for AMD PT PCI controller
Message-ID: <202611040148.eJCUsJBi-lkp@intel.com>
References: <20261028084531.6237-1-Chloe_Chen@asmedia.com.tw>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028084531.6237-1-Chloe_Chen@asmedia.com.tw>

Hi Szuying,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Szuying-Chen/gpio-amdptpci-add-support-for-AMD-PT-PCI-controller/20261028-164531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20261028084531.6237-1-Chloe_Chen%40asmedia.com.tw
patch subject: [PATCH v3] gpio: amdptpci: add support for AMD PT PCI controller
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20261104/202611040148.eJCUsJBi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611040148.eJCUsJBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611040148.eJCUsJBi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-amdptpci.c:75:8: error: unnamed field has incomplete type
      75 | struct gpio_generic_chipgen;
         |        ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-amdptpci.c: In function 'pt27_gpio_isr':
>> drivers/gpio/gpio-amdptpci.c:369:51: error: 'struct pt27_gpio' has no member named 'gen'
     369 |                 if (generic_handle_domain_irq(chip->gen.gc.irq.domain, hwirq)) {
         |                                                   ^~
   drivers/gpio/gpio-amdptpci.c: In function 'pt27_gpio_probe':
   drivers/gpio/gpio-amdptpci.c:454:43: error: 'struct pt27_gpio' has no member named 'gen'
     454 |         ret = gpio_generic_chip_init(&chip->gen, &config);
         |                                           ^~
   drivers/gpio/gpio-amdptpci.c:458:19: error: 'struct pt27_gpio' has no member named 'gen'
     458 |         gc = &chip->gen.gc;
         |                   ^~
   drivers/gpio/gpio-amdptpci.c: In function 'pt27_gpio_runtime_suspend':
>> drivers/gpio/gpio-amdptpci.c:561:17: error: break statement not within loop or switch
     561 |                 break;
         |                 ^~~~~


vim +75 drivers/gpio/gpio-amdptpci.c

    72	
    73	struct pt27_gpio {
    74	struct device                     *dev;
  > 75	struct gpio_generic_chipgen;
    76		void __iomem              *base;
    77		struct pt27_saved_regs	  saved;
    78		raw_spinlock_t            lock;
    79		u16                       wake_mask;
    80		bool                      use_msi;
    81		int                       irq;
    82	};
    83	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777599;
	b=EqaR0sp/aiBez0cSLGhL1TXMbGZGobV/PvhPiXs/+hnGb76PhgRJy8aTbPncHU2Jq69w
	 cQ+Fp0lD5UwZQySwtgXheOdxfixTVJwl41+KHDm6BCuHBRjjvm0X0kQhwYAeOT8NCctcn
	 Vr87MicfyYgFKkAS6cs4lwiGb0cza1+FfbagusMqFWP4aZZU8oN4rivMEFYdqGtMdv4+l
	 Xl/xZma85MdVan9hetDfI8FOCTP1pcrmgEAY0veFHX/gYtEnlHrFuvUJqhGUoD8T65oan
	 BGMfWbt5RcYlYxk2vS4qgJLxJmZRM3uuWkD41NUoHs+09ObdS8e7LlxhWIYrCPCLb4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777599;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=/4uby6K+dvhEKI9jlVOohhHd2SunK9ZcoGm5SRjDqP0=;
	b=wiC1MuCaLVKCBtbYc5UStcZqP8BEQKD0hXzI8c6CKFAVEbE4XISXVcvU3+JVjVWt1qvj
	 QCxdWCj924M6/yy5l+eipdfT+Lojk7pOiq/q2rAVP83ShnJ0/J7BNom9pWwRdKrCKhkAN
	 jMLGLrtSU6oGXRRu7rvgPqsHYubPmz20OEDQl/kqTpKx1Hx80bFCg82vTOf3dr9Gt79rg
	 VxMZz4RGWlCTwF46Z3lETXA2WrQPHN2Dlrq8qu6tSHTiuDqHd6jYBlVdtjI4VuURO/gOU
	 acwxuvyQBsRDlMINeFyuDa1FRdc/JJfZjO97CQ5ME7LM2MDDdf+M+Xo9ZA3WU4m0OFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ia2iY8lu;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F8E606A323
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 21:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F8E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ia2iY8lu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794777599; x=1826313599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MoUWYmdXOVPS3N4vpeXkJku4pGrtk8drmvbX/dNJtPY=;
  b=ia2iY8luIMv1xMGTsZt3RYGozMTiTUZlRHtZpvyzLEsftfKJ8UT6CFOY
   aKAfOHUfLaQ0vwRVuM4nEu0nflGwB4xhFT10tKbkPjmEh+52kxEguTA1W
   mUG0+2aVG4FqKDpHUq8ztz0+OJ5jF4NBwUSyjISo3gMtrJ8lbxa/msPrD
   3ifs9ZvUaANWuOprWBOA/gLQmf3429RMJUhwlqhcQQCysVKDMyc/WdmFX
   paz/65sl18uN+Qyba0TfVDhRAv+/Jk4egkH5YXO4yWBBH7NUCJg5QCEzT
   +GEUXOJpHE2U2UnOqKA22iKCEP4xw68bC9leF+rTzoVMLfUMaTh9oNaUK
   w==;
X-CSE-ConnectionGUID: Sj5YMxNcSyqEjeNRqPqu3A==
X-CSE-MsgGUID: LmR/MiuZT3ePZz/OmI7/xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3590505"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3590505"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 13:19:59 -0800
X-CSE-ConnectionGUID: K/x7qEOiTNW0RCeCPiu0XQ==
X-CSE-MsgGUID: B/XzAGmCREqNcfhvpwAexg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9812155"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Nov 2026 13:19:56 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xShdg-000000017Ki-2C5w;
	Sun, 15 Nov 2026 21:19:52 +0000
Date: Mon, 16 Nov 2026 05:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: Akshat Chandra <notmissinge@gmail.com>, linux-iio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jic23@kernel.org, andy@kernel.org,
	Lukasz Kulga <lukasz.kulga@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: chemical: Add support for Sensirion SGP41
Message-ID: <202611160427.m6uyOPMn-lkp@intel.com>
References: <20261115055941.362185-3-notmissinge@gmail.com>
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
In-Reply-To: <20261115055941.362185-3-notmissinge@gmail.com>

Hi Akshat,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on robh/for-next linus/master v7.4-rc2 next-20261113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akshat-Chandra/iio-chemical-Add-support-for-Sensirion-SGP41/20261115-112940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20261115055941.362185-3-notmissinge%40gmail.com
patch subject: [PATCH v2 2/2] iio: chemical: Add support for Sensirion SGP41
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261116/202611160427.m6uyOPMn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160427.m6uyOPMn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160427.m6uyOPMn-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/iio/chemical/sgp41.c:478:12: warning: 'sgp41_probe' defined but not used [-Wunused-function]
478 | static int sgp41_probe(struct i2c_client *client)
|            ^~~~~~~~~~~
>> drivers/iio/chemical/sgp41.c:459:13: warning: 'sgp41_remove' defined but not used [-Wunused-function]
459 | static void sgp41_remove(struct i2c_client *client)
|             ^~~~~~~~~~~~
--
>> ERROR: modpost: drivers/iio/chemical/sgp41.ko: missing MODULE_LICENSE()
>> WARNING: modpost: drivers/iio/chemical/sgp41.ko: missing MODULE_DESCRIPTION()

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

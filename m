Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF77382
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 05:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725254264; cv=none; b=Dtl9lyldw9G+TOEd/L1HElg3KPaSkHZmHLSEeLEFYAjo+mp7Vr/4pdIipeCr61C+ZzYR1anmGa+hahOrUDXYvVukni7Sp9Mz/fD65aRgJ+I5JEfKIAPZD2K75anZDvWXH6DjdRhWU4ZWCxlbn6EuXFr0IWqhGOkYrCHzLJdl0uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725254264; c=relaxed/simple;
	bh=tFUMWPh3aJ5ZCUaxW1dtAsa6eZP+PkZScIfCUyDtUuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cr2CcZNV7e/wro2hiFbh698fX2A5Zkgwmt6UnWHNhb9uBNzw5UaX0I/iOICRSjCdSyqLFhIJzsENrSZKPKr/CBB5jsAy4bkB1Sv6xTt8YaldqDl1bqluZdSAxIZhUWX3iDF4nQvrIgVZ5M+hC4o4M1Td9SFf8qtX0wv2//FvvlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hr3TtgdR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hr3TtgdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725254262; x=1756790262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tFUMWPh3aJ5ZCUaxW1dtAsa6eZP+PkZScIfCUyDtUuw=;
  b=Hr3TtgdRaa10dZYv2JOd7YGrJjT++SjAcB/YDXeR0xtYm1tDM9DqYZHA
   2mmyoUXZLgIWwUpUuis4ie+97OYvjAdIlxKS9g5ys/L3wVffXgCuXIz+H
   oR4P8B5rgbJtKNgvBBHr8R8yc1FILrmpckG/Rd9zEVLCA1HxYDev0SNYQ
   sc27qXzXjRX/76FUytosraS4EdfJhkGQQJgWQVaON+FYzV9uvAft5/9Dv
   LcN9XmBolhwrBiQEJbjJs1xRY6j+JgRo/JuxyyrLKqm2aqt9PzSLPF3GT
   9rMqtaZFCrHI+Li6YnNbq6Ng06yp36j27wliYibcyD69PhUKiqVz1gv58
   A==;
X-CSE-ConnectionGUID: mthcZj5UTomIv7qLTEUyQA==
X-CSE-MsgGUID: dIsaEhkaSf6CtXJmR3bpkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="35220138"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="35220138"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 22:17:41 -0700
X-CSE-ConnectionGUID: obfOfuZ+RLGTwQuEiosgUg==
X-CSE-MsgGUID: ZH3OfEPWSUGI5hNqCMPjMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="65000300"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Sep 2024 22:17:40 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skzRa-000590-04;
	Mon, 02 Sep 2024 05:17:38 +0000
Date: Mon, 2 Sep 2024 13:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <202409021148.xUP07N9p-lkp@intel.com>
References: <20240829-x1e80100-ps8830-v1-2-bcc4790b1d45@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-x1e80100-ps8830-v1-2-bcc4790b1d45@linaro.org>

Hi Abel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on b18bbfc14a38b5234e09c2adcf713e38063a7e6e]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-usb-Add-Parade-PS8830-Type-C-retimer-bindings/20240830-025134
base:   b18bbfc14a38b5234e09c2adcf713e38063a7e6e
patch link:    https://lore.kernel.org/r/20240829-x1e80100-ps8830-v1-2-bcc4790b1d45%40linaro.org
patch subject: [PATCH RFC 2/2] usb: typec: Add support for Parade PS8830 Type-C Retimer
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240902/202409021148.xUP07N9p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021148.xUP07N9p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021148.xUP07N9p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/typec/mux/ps8830.c: In function 'ps8380_set':
>> drivers/usb/typec/mux/ps8830.c:64:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      64 |         int ret;
         |             ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +/ret +64 drivers/usb/typec/mux/ps8830.c

    60	
    61	static int ps8380_set(struct ps8830_retimer *retimer)
    62	{
    63		int cfg0 = 0x00, cfg1 = 0x00, cfg2 = 0x00;
  > 64		int ret;
    65	
    66		retimer->needs_update = false;
    67	
    68		switch (retimer->orientation) {
    69		/* Safe mode */
    70		case TYPEC_ORIENTATION_NONE:
    71			cfg0 = 0x01;
    72			cfg1 = 0x00;
    73			cfg2 = 0x00;
    74			break;
    75		case TYPEC_ORIENTATION_NORMAL:
    76			cfg0 = 0x01;
    77			break;
    78		case TYPEC_ORIENTATION_REVERSE:
    79			cfg0 = 0x03;
    80			break;
    81		}
    82	
    83		switch (retimer->mode) {
    84		/* Safe mode */
    85		case TYPEC_STATE_SAFE:
    86			cfg0 = 0x01;
    87			cfg1 = 0x00;
    88			cfg2 = 0x00;
    89			break;
    90	
    91		/* USB3 Only */
    92		case TYPEC_STATE_USB:
    93			cfg0 |= 0x20;
    94			break;
    95	
    96		/* DP Only */
    97		case TYPEC_DP_STATE_C:
    98		case TYPEC_DP_STATE_E:
    99			cfg0 &= 0x0f;
   100			cfg1 = 0x85;
   101			break;
   102	
   103		/* DP + USB */
   104		case TYPEC_DP_STATE_D:
   105		case TYPEC_DP_STATE_F:
   106			cfg0 |= 0x20;
   107			cfg1 = 0x85;
   108			break;
   109	
   110		default:
   111			return -EOPNOTSUPP;
   112		}
   113	
   114		gpiod_set_value(retimer->reset_gpio, 0);
   115		msleep(20);
   116		gpiod_set_value(retimer->reset_gpio, 1);
   117	
   118		msleep(60);
   119	
   120		ret = ps8830_configure(retimer, 0x01, 0x00, 0x00);
   121	
   122		msleep(30);
   123	
   124		return ps8830_configure(retimer, cfg0, cfg1, cfg2);
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

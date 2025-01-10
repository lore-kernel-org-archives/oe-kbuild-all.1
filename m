Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA6F20ADE9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 12:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736511437; cv=none; b=cLbAxOCPElXHF3NySvC1szhLupkqPin4t7XPpD2vqXyuCmVIhkUtFU8aMMOB8KoVXn1KLxuV8kWNSY5hLgOExawPODdktQ519A3uwDeuyCRcwLMLoccPX3fRw4UiAZbj/lHG5omm6fTMJm/W0mABCg8h4Mg6ypK3r/EM/WzuA6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736511437; c=relaxed/simple;
	bh=pCaqy0TV70zpA2C9umleMdUaaugCzRAc7t3yONUx9G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLcn9RS9PUXfBB7xFaoEjIMCTxHyK4ho/1eh0f6kUD8Sl4HKb+CotLppRI1WEgG9GuXtfxYyKYja6cLg7zM6m2BW8gYHCnmHSB/JIj0X6ekAdWxPkdIBAl97qhB0rlCHwf0hwA+F8GeS5jbJYKTGOit2X4fYMQJVz0+PbwEyB0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/IoV/wa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/IoV/wa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736511435; x=1768047435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pCaqy0TV70zpA2C9umleMdUaaugCzRAc7t3yONUx9G0=;
  b=f/IoV/waGLBz0/ULQ9Do3GIa8hBHmnuThcUE4li2q/l635JC07ozbmIU
   Rjal9MqrQcLXjnwEfGsOmPmgaHynTXiYvuxrnC1SrhfnOnvw88CHFg71f
   nQBXUMQk/UIbiXDi5VycNWlDkwOji4GuAeVmXbGShM0jcXFK24ngmFbaC
   VNYjEZ2Sqwx+1S4kM67HkwbJNnQ4s4glvBHvNDzU+bsIOxKpQgmd4L8fp
   //LAyXRZ7OpHCcuxjAoa9WUkcIHR4GcY+8MOK4ncM3jDmR0FsSki6/Ont
   Oz/ykhBgjp7rKP7Gu1HLQsxEX4KApnd6meBhio25z+jkJvxIxT4e1SHDM
   w==;
X-CSE-ConnectionGUID: Vv3cDeS0TMSk+sYRZZNZfQ==
X-CSE-MsgGUID: XdaUvFpUQqCEWy5gSfDcAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="39619731"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="39619731"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 04:17:14 -0800
X-CSE-ConnectionGUID: kC9N6R1QRfergmtgNji9Mw==
X-CSE-MsgGUID: /b2WQs2yQ1ufe5UhGxwYRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="108722874"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jan 2025 04:17:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWDwq-000JCl-0e;
	Fri, 10 Jan 2025 12:17:08 +0000
Date: Fri, 10 Jan 2025 20:16:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Message-ID: <202501101956.vOyuZzUh-lkp@intel.com>
References: <20250109054544.2342442-2-fj5100bi@fujitsu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109054544.2342442-2-fj5100bi@fujitsu.com>

Hi Yoshihiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm-perf/for-next/perf]
[also build test ERROR on linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yoshihiro-Furudera/perf-Fujitsu-Add-the-Uncore-MAC-PMU-driver/20250109-135249
base:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
patch link:    https://lore.kernel.org/r/20250109054544.2342442-2-fj5100bi%40fujitsu.com
patch subject: [PATCH v3 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250110/202501101956.vOyuZzUh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101956.vOyuZzUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101956.vOyuZzUh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/fujitsu_mac_pmu.c: In function 'fujitsu_mac_counter_start':
>> drivers/perf/fujitsu_mac_pmu.c:41:31: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      41 | #define EVSEL(__val)          FIELD_GET(MAC_EVTYPE_MASK, __val)
         |                               ^~~~~~~~~
   drivers/perf/fujitsu_mac_pmu.c:110:24: note: in expansion of macro 'EVSEL'
     110 |         writeq_relaxed(EVSEL(event->attr.config), macpmu->regs + MAC_PM_EVTYPE(idx));
         |                        ^~~~~


vim +/FIELD_GET +41 drivers/perf/fujitsu_mac_pmu.c

    39	
    40	/* MAC_PM_EVTYPEx */
  > 41	#define EVSEL(__val)          FIELD_GET(MAC_EVTYPE_MASK, __val)
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

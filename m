Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A673F9FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 03:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745552254; cv=none; b=YDcePOUanPFH5SaVgoSlTOn0YpQHoUclDla4DLMALw3Ya+hkAEqb2+5F9CLx9PUy7RlFZ3TdCEEASCvJ9HbpuE/02xTAxEqt9960ANfdxTYS72+tC4l/oy0t0FfdnVr1rUyUyWpsz/yJ/V6f8Q8AV8QpSA7i3q28ur66n3m0SVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745552254; c=relaxed/simple;
	bh=tX+IWUlIERPsv8gkrnAvi8wVokUQZ8j2rGKLLycOZNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLPQFNU0Xvt1qOTlENVKNLS/6p7B1NIArGcLYLtMxKv4u2R+jQKVUn4LC+y4AV68vRaNBZ/Cuh6G6Na6TSGM2nbziXEnn5489zAdxhlBkCCR+1JncAxKxgF9Z6TQg1wOPs5WqqXE4Sjt1b5KMnhHMyIebB53SUmmrHRd3C/KvXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQuh1lqB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQuh1lqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745552253; x=1777088253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tX+IWUlIERPsv8gkrnAvi8wVokUQZ8j2rGKLLycOZNk=;
  b=EQuh1lqBZEtrrEtIJvMaH70biiZGtA0WG4JMdiLU/7Ag2JyzNb3OTn+E
   uCT3Yed4Crgbw4kWgyyR+2nVSTjDitie7nXqfYdRhNTc0mG0MEtEGIxva
   ZjRT+SD9I4D64fg/LssfgHYW3dLxxwqADPl2q53vYbl+d+hEA1Gi/UeEo
   aSwRef0eyWdnxWfihxD89n/Ds52xRKp7ph9AKtJzA9huWgVR3tG0pagZY
   dVsvAFycn2oURHc22enltU8byYf25/DMlO1Q5Sr1Ew/O+0+sp2e6Wplb+
   3nZdteOm5gJlttEhtmzUl0afndUOpfs+nMqwdV4mSq4Yn6YleGieX9MAe
   Q==;
X-CSE-ConnectionGUID: M9BtW+18Ra2OVmu7MsugsQ==
X-CSE-MsgGUID: 4RlobyN3RUGgzucrPUeayQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="64737038"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="64737038"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 20:37:32 -0700
X-CSE-ConnectionGUID: rDFmjDsNSUGs6S7/iVhGpg==
X-CSE-MsgGUID: y+1FxILsRhSp5KCZ5SYLLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="133105324"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Apr 2025 20:37:28 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u89sU-0004oV-03;
	Fri, 25 Apr 2025 03:37:26 +0000
Date: Fri, 25 Apr 2025 11:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	Lee Jones <lee@kernel.org>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Michal Schmidt <mschmidt@redhat.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next v4 3/8] mfd: Add Microchip ZL3073x support
Message-ID: <202504251112.NvSTD02Y-lkp@intel.com>
References: <20250424154722.534284-4-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424154722.534284-4-ivecera@redhat.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Vecera/dt-bindings-dpll-Add-DPLL-device-and-pin/20250424-235141
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250424154722.534284-4-ivecera%40redhat.com
patch subject: [PATCH net-next v4 3/8] mfd: Add Microchip ZL3073x support
reproduce: (https://download.01.org/0day-ci/archive/20250425/202504251112.NvSTD02Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251112.NvSTD02Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/dpll/microchip,zl3073x*.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1804: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

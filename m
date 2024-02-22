Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718B4171C2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 05:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708580223; cv=none; b=DPzFcQ0dyF0VV6rnRStoBGmLz+P0Wq0WR9jbZuT7/O5Nr7fWPm037MEEgdeZ3EZ0+uERyyi3Bx3z/1I1Bxy2Q6YjYlAeVuoZtOnsZIhePyBV/AGUg5IEZUGQmpBz9jtSA8qb2YmNNTf85xw5/jSzXaaCtjU/EsJiUHjd/l3VXhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708580223; c=relaxed/simple;
	bh=QeI2uBjQcu057UUOzLotCkKnUelckhJN0RTsfRbGdyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sg+Pf8u+5Uss/M4w9nQoQVEWLF/GEy5EUFLZMGyXJdmiSHfpD2D3vIKuvnQlo2M02B0yJf4ziKqw/QEfBi4SEiElVir/pGsB4v16JtpSF4JfOzPuWb7k1yWr1j2nmGGyr/gCAvbGcHaRXUZYoFZ2IozGwJqHijhHUs+zhPkT1hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDTlZxMX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDTlZxMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708580209; x=1740116209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QeI2uBjQcu057UUOzLotCkKnUelckhJN0RTsfRbGdyE=;
  b=mDTlZxMXXTfE+Bd5qerVPW6eaIgDdjXOnGwnW76IqTh9Gik+Haii6IS2
   wk6lXm2nQP7Z+ThSsbdonTjQ/nFVpKu+MFyVZU9i2rbGRA0yKnJkw5saI
   XW1c9yfHEYUh+LBtZlINOwsMwqZuqqpxF14R0fFSSec5Mi5F5BdOIiTnt
   bs1/ZMz+5lfNCPDPvmq86OmmKKVC+ck2JZOeAMovbWeVjVcrhLBdZL3N0
   sPVJ6XHf12F1NDS+Fys41QT0sIr58+TBc70mwT2san07scIpVcDIsQfBM
   0zhNqym/9LVLczxO5fvIJk5h4OhbxfExds//CzRnre2uk1xWqOI+gHFZT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13406327"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="13406327"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 21:36:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="9975667"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Feb 2024 21:36:42 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd1l9-00061A-2w;
	Thu, 22 Feb 2024 05:36:39 +0000
Date: Thu, 22 Feb 2024 13:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Viacheslav Bocharov <adeep@lexina.in>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] soc: amlogic: meson-gx-socinfo-sm: Add Amlogic
 secure-monitor SoC Information driver
Message-ID: <202402221322.ifGMGQa6-lkp@intel.com>
References: <20240221143654.544444-3-adeep@lexina.in>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221143654.544444-3-adeep@lexina.in>

Hi Viacheslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9fc1ccccfd8d53dc7936fe6d633f2373fc9f62e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Viacheslav-Bocharov/soc-amlogic-meson-gx-socinfo-move-common-code-to-header-file/20240221-224803
base:   9fc1ccccfd8d53dc7936fe6d633f2373fc9f62e8
patch link:    https://lore.kernel.org/r/20240221143654.544444-3-adeep%40lexina.in
patch subject: [PATCH v2 2/3] soc: amlogic: meson-gx-socinfo-sm: Add Amlogic secure-monitor SoC Information driver
config: arm64-randconfig-002-20240222 (https://download.01.org/0day-ci/archive/20240222/202402221322.ifGMGQa6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221322.ifGMGQa6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221322.ifGMGQa6-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/soc/amlogic/meson-gx-socinfo-sm.o: in function `socinfo_get_chipid':
>> meson-gx-socinfo-sm.c:(.text+0xac): undefined reference to `meson_sm_call_read'
   aarch64-linux-ld: drivers/soc/amlogic/meson-gx-socinfo-sm.o: in function `meson_gx_socinfo_sm_probe':
>> meson-gx-socinfo-sm.c:(.text+0x438): undefined reference to `meson_sm_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

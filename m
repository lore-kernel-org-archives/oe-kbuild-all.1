Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758556;
	b=4uWMicLqtFLPZr4/6YvaOO4HqGIww3br+VP/cSs4z0t+4rZ1nkWIOOKHNxXBR/bc2jkm
	 iwEmKcYrkbBI21aJgVoaZi+rW4trgSNvRhw1Is/0ju+pgBzC4TUhGkgOB197KfXEnbLWL
	 CvKK3k/dEh1nXRo6INYdsmwk9qEsSkf2DTAQjg1evIcpP2wqtTtsQp1M+whs7Y+4Zfrq8
	 ZJRWXYgAEaEEDe/ov0GP/G7phOMVuVGLc8clbE76ObqNvBkmFTl+2dC04OaaJGEF6RUe/
	 WDONSaXysYSGE3hNIcZj1U05ApN9Gw9tQhccLO482pDYMbqQG+abrAcAc5SlCZACW9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758556;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=adgFSfDuufHuxaHo+dm2lLcqZwDVD8C/pUFO+r8bArY=;
	b=mKwZNzJuuy0E/K6EHudAo9lkKDX3aJBVePsyx2ao3VolKpzWmpnGxlMEU+dGJNnbNqO4
	 +IBAxooc5B5YasOZu6Hj9JyZ6uKZhPTIT/zSho/i+lHS4ghQ8p/+grcL7GzaINJkpu8bx
	 f246jB6CZTnjaT9QwSWT9VPWWEgX0Q4OBFCCxwYGJFxH+TlqtCtp/WMzPtlV4UUfq8a4v
	 F2iDkdH5WVYO2mx4FbHdjKbYo2a7ChlrAzBk52JDLE/v9PwVR1MYxOY1nlpuLoCVzBU51
	 mHkM/RdZEJiHtVKG7943goQEHLU+cZntFGmxcBwlNil0nbrGcfmX9ri7uZoWLuOW1Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PvgEXXkY;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C667606A31E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 05:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C667606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PvgEXXkY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795758555; x=1827294555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ajpt4zyRc5JSG+G+1jKrWNHQepdVzILCm+KQA4/m2Jk=;
  b=PvgEXXkYSETJdd1U+iF8IERUA87dHa4N/6P1Pq/rU132aZBQ0Jjc1+kD
   Hp1Ze/0wwCXtQFHGuED7dB+HCvJor3kSskpgY+ph0iMAN252bGsnIiEDY
   WhQUzzFMEDhnra1Tpo/SqftPeyrrFdmWd9o9KlsSAwO7EJaBYdZqceXXE
   Fyaz4UZnKaDX50EJ0pVzykGE4IdKLOyidkT7oqNl08/8AUDz+945OZMou
   MK+D/N9nTmsrcZXmtfEiE2Dor8vuVR/TsUHqblrdniV5lIMVk/BslDWRs
   vFd9u7kPfZjczg5c+AR9u4c+IaoRAw3Zl7WqPWRPwQO3+dDMZXJDDXSRM
   w==;
X-CSE-ConnectionGUID: f37/ulBbQTGcuF4OZ6Kjjw==
X-CSE-MsgGUID: CGWDa5J0T8WHN3DgAtszsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4656184"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4656184"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 21:49:15 -0800
X-CSE-ConnectionGUID: 8sFd97oLSumaK8JQ5bcxzw==
X-CSE-MsgGUID: RMzXsnOPSGyULDtmW3RAjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12205794"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Nov 2026 21:49:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWopZ-00000001VPO-1AKJ;
	Fri, 27 Nov 2026 05:49:09 +0000
Date: Fri, 27 Nov 2026 13:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Robert Ijtsma <robertijtsma@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: light: add ams OSRAM TCS3430 XYZ and ambient
 light sensor driver
Message-ID: <20261127134342.AXwSjSmQ-lkp@intel.com>
References: <20261126-iio-tcs3430-v2-2-6c5329d20919@gmail.com>
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
In-Reply-To: <20261126-iio-tcs3430-v2-2-6c5329d20919@gmail.com>

Hi Robert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4843f6873f7c4835e62f2c73ba0fd538e57a2f22]

url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Ijtsma-via-B4-Relay/dt-bindings-iio-light-add-ams-OSRAM-TCS3430/20261126-091147
base:   4843f6873f7c4835e62f2c73ba0fd538e57a2f22
patch link:    https://lore.kernel.org/r/20261126-iio-tcs3430-v2-2-6c5329d20919%40gmail.com
patch subject: [PATCH v2 2/2] iio: light: add ams OSRAM TCS3430 XYZ and ambient light sensor driver
config: loongarch-randconfig-1000-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127134342.AXwSjSmQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127134342.AXwSjSmQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127134342.AXwSjSmQ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/iio/light/tcs3430.ko: module uses symbol 'iio_gts_all_avail_scales' from namespace 'IIO_GTS_HELPER', but does not import it.
>> WARNING: modpost: drivers/iio/light/tcs3430.ko: module uses symbol 'iio_gts_avail_times' from namespace 'IIO_GTS_HELPER', but does not import it.
>> WARNING: modpost: drivers/iio/light/tcs3430.ko: module uses symbol 'iio_gts_find_gain_by_sel' from namespace 'IIO_GTS_HELPER', but does not import it.
>> WARNING: modpost: drivers/iio/light/tcs3430.ko: module uses symbol 'iio_gts_get_scale' from namespace 'IIO_GTS_HELPER', but does not import it.
>> WARNING: modpost: drivers/iio/light/tcs3430.ko: module uses symbol 'iio_gts_find_new_gain_by_gain_time_min' from namespace 'IIO_GTS_HELPER', but does not import it.
>> WARNING: modpost: drivers/iio/light/tcs3430.ko: module uses symbol 'iio_gts_find_sel_by_gain' from namespace 'IIO_GTS_HELPER', but does not import it.
>> WARNING: modpost: drivers/iio/light/tcs3430.ko: module uses symbol 'iio_gts_find_gain_sel_for_scale_using_time' from namespace 'IIO_GTS_HELPER', but does not import it.
>> WARNING: modpost: drivers/iio/light/tcs3430.ko: module uses symbol 'iio_gts_find_gain_time_sel_for_scale' from namespace 'IIO_GTS_HELPER', but does not import it.
>> WARNING: modpost: drivers/iio/light/tcs3430.ko: module uses symbol 'devm_iio_init_iio_gts' from namespace 'IIO_GTS_HELPER', but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

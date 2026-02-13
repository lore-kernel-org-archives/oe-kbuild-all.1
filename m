Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E2E272E56
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770976288; cv=none; b=GCRQO6G4GdYAgUuOLtXbMVxjaFUES+3o6P9Obx6dA3FdZtlPGrMCbf56fh3Lc36qsBzQ0IbKsT3O+laZ9w+yy0BJxBxyA90BwBgIW5qsA/Z9/EKL1FiAWorqcTvpxv4RX/wDTrpmxQhs21wzWuyzrFg/3lyaOaL/fMrn026GXnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770976288; c=relaxed/simple;
	bh=84cqhQxYamXqo+10VWcQQ4qQXh87NRcXTKNZwApzapU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nne3RbVyjIXGNLHwL7HRlNDFwP3PNboZHiFP1mixH/Yxj75aErD8ItRgqKHKq6AilcXI2DhZUjeYLt9TQbAPQz6X/hIi/22A7Fyp1FKzwEG0PNt6t4WzxTPG58x9xI8qzFG8vZ7BIWw4LvuwhQ2Oj1fLGyX+0RBae/YwIlqK+tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYZZWyTK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYZZWyTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770976287; x=1802512287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=84cqhQxYamXqo+10VWcQQ4qQXh87NRcXTKNZwApzapU=;
  b=ZYZZWyTKwIYT7aQxMcd1ObQCJ2TB7S61ViZmILYHKF9yNfdsOWMcayu1
   GWqax5nm6EmZdV82Tw/E/uowIs+ouqJ3C0Ojatn+l+NlaLWXD8GELTcwf
   rcU2gz9y7COmR0tUYsnkGGqZPRaCDJPWdz6Lloj1p9o+Q4IX9Gj/V+NDf
   rV9ut89mOUgHzEZ4iPST2SWwjL20EO9HF0tm+B/05wOIrx6igqcrYMCbP
   e1Xxt7m4M6sDBAP4mmwi36U6VQj0mbXrIl3RKHMlDzK4YiCytQVtAUBp0
   FnfLa2R2QG/UzRiO5H9meV0GnlFConPUdc+kED8L00eKx4AOXCOtswUHx
   w==;
X-CSE-ConnectionGUID: WfQCmEn/Q7aL1ndG4ZscQA==
X-CSE-MsgGUID: N3rsk8gfStShecH4PooW7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="76005242"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="76005242"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:51:26 -0800
X-CSE-ConnectionGUID: MalrhjJ7RniQKdiHbkYKqw==
X-CSE-MsgGUID: mfKkC6w2RZ6YamYWJJ7GZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="211784960"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2026 01:51:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqppZ-00000000vHU-1rFV;
	Fri, 13 Feb 2026 09:51:21 +0000
Date: Fri, 13 Feb 2026 17:51:01 +0800
From: kernel test robot <lkp@intel.com>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>, jbrunet@baylibre.com,
	linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: Re: [PATCH v2 1/3] hwmon: (pmbus/tps25990): Rework TPS25990 non
 standatd direct conversion
Message-ID: <202602131757.UpBvEXu8-lkp@intel.com>
References: <20260213001408.2454567-2-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213001408.2454567-2-sbogdanov@baylibre.com>

Hi Stoyan,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.19 next-20260212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stoyan-Bogdanov/hwmon-pmbus-tps25990-Rework-TPS25990-non-standatd-direct-conversion/20260213-081713
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260213001408.2454567-2-sbogdanov%40baylibre.com
patch subject: [PATCH v2 1/3] hwmon: (pmbus/tps25990): Rework TPS25990 non standatd direct conversion
config: sparc-randconfig-001-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131757.UpBvEXu8-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131757.UpBvEXu8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131757.UpBvEXu8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/hwmon/pmbus/tps25990.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

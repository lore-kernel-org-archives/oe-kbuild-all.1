Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FA836EAA7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911094; cv=none; b=J0adSy48d1AVbI9wySr7r+K3sL3Vie4+QKyt2xi2VeKhsajgS60YksZiN7dklIrr3rLd+Jra/QLdFhsQAiRiPBv0pDW2vxceD3v/uaUaDk1hBwbQf7Ht3B7Afuf6ut0Mgy2ICZYuN6labKIHUw1gfbdEf3S9B6r7kGezOEfG86c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911094; c=relaxed/simple;
	bh=TRM4DddZ6ecLK6JJj0Yca2RAbUWeLTWFYFeYFezGLTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhlmElK/+qQ05NSj8DnEsjssNoDFOHGiw9B2/9txfUeTCzr4BRRFsSLfWAawXx/BI62GvksSvJyYHejpFSd6N92mlr6lw6yUQAl+qfCWVAoYkcXvI7YNuh9cNVUZxXZw+WCvIQKxCt2SK9O4TFSZRuR0yZrA1zl1BWFcnn6gwIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3gzIbBv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3gzIbBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773911093; x=1805447093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TRM4DddZ6ecLK6JJj0Yca2RAbUWeLTWFYFeYFezGLTU=;
  b=E3gzIbBvJahMo42WVUQqIPD1xJ2KAq3QkduVO52xWo0n/bMPlbionOyE
   hJt2nIG5LwBv2GzJ2tkzmG4Ogz9FjoedL9tb2Fxc/Y3PrrUtsmMfhicSY
   0kjvu00GzqmnO6JFCSqZlwJoVwVvvcaWC3VIkasp6xlLf6sP+waSqkAXy
   OMlecw00ktCoh4NAUeIGI7M/5rw/hnHgBp33WZFLoQiISLROUSPmOXbLR
   1pZeE75x8wiswRc6xZWg5AYJxtDLSMSN8GTUhltxEgdL46685ljT23k+R
   jgGhyCj4quue4nkhd2oGIZPVe9JiwIQ3dk9p6MQtyYwWHrNGCiJz/LPJp
   Q==;
X-CSE-ConnectionGUID: lkLQ8rZjScmxkMkxjQNr4Q==
X-CSE-MsgGUID: Ox93BlV+QeioLV5M1AAkhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75010465"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="75010465"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 02:04:53 -0700
X-CSE-ConnectionGUID: ncQrF148RruU1rp975Qhlw==
X-CSE-MsgGUID: Upr/bQP+S5KOOZU5PaoZXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227387273"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 Mar 2026 02:04:50 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w39J7-000000000dV-0O9M;
	Thu, 19 Mar 2026 09:04:45 +0000
Date: Thu, 19 Mar 2026 17:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Eckert <fe@dev.tdt.de>, Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Florian Eckert <fe@dev.tdt.de>,
	Eckert.Florian@googlemail.com, ms@dev.tdt.de
Subject: Re: [PATCH 2/2] irqchip: Add Lightning Mountain irqchip support
Message-ID: <202603191633.AoajEi81-lkp@intel.com>
References: <20260318-irq-intel-soc-msi-v1-2-0e8cdf844fa8@dev.tdt.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-irq-intel-soc-msi-v1-2-0e8cdf844fa8@dev.tdt.de>

Hi Florian,

kernel test robot noticed the following build errors:

[auto build test ERROR on f338e77383789c0cae23ca3d48adcc5e9e137e3c]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Eckert/dt-bindings-Add-Lightning-Mountain-MSI-interrupt-controller-bindings/20260319-033849
base:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
patch link:    https://lore.kernel.org/r/20260318-irq-intel-soc-msi-v1-2-0e8cdf844fa8%40dev.tdt.de
patch subject: [PATCH 2/2] irqchip: Add Lightning Mountain irqchip support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260319/202603191633.AoajEi81-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191633.AoajEi81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191633.AoajEi81-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-intel-soc-msi.c:17:10: fatal error: asm/irqdomain.h: No such file or directory
      17 | #include <asm/irqdomain.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +17 drivers/irqchip/irq-intel-soc-msi.c

    16	
  > 17	#include <asm/irqdomain.h>
    18	#include <asm/apic.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45D126CE3B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 02:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766543452; cv=none; b=ahXXusVf6POIklnqbQCu4TfFtUtiJsbsW2ac4k/cC5x/kTp6Y29AWAmOIIi6nsQio7ko+sbUi/aZV4Mid6PONnKviSq/n5Zisj6rYGBcM2SF2BaY+DCth5Piz5KP0XyRif+Y9ppmOMmpUgelpWwmIMGBKtgeFjawC1JGvvUYSNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766543452; c=relaxed/simple;
	bh=w4pwBDpX0ndWKuH8tbElcaiKaQ+mnetkmvCjkt14seo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0rKLlNO+MQayJY62f03qQhEZm+5/nPX8lSGcRrguz1SN2P1vydDah7mfKATNGK34yRs/09ScKHNjgD7kat6U+UWGuo/+e3VuXzWn1ut5lWUfP4W0iIp3+956HD87ybAISE0V2GwrNxcRLv5rOfWSI7DgkgzNYHCeogyXy3c3ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gf4C1p3z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gf4C1p3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766543450; x=1798079450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w4pwBDpX0ndWKuH8tbElcaiKaQ+mnetkmvCjkt14seo=;
  b=Gf4C1p3zSUtazclAwv5FKZuQdT/tBfRZDF9cOhzqIGxVTL92ERj3z+he
   VHhzKuY4eYsmP4MntHYtrSXYaVXxvxjFNtTWMa4NN+LfFq9q/RMNh4TIH
   V911840J02EneIu3tYNDn/i1vK3VUnwtkXZt/VZw6JVQWgAmHUcwGhLhG
   Bq8MxO4/rQT9+ly3YZ75bEgVurkrUNg+Jkc28OAEUiGYdnHjkCeswGpuB
   ZqHs5mjm0ySquJosPEWJ/Xbcz1Fh+RTM9F8MUtiihK2dO6o8cRfLbPTS+
   bzgwexZtHNBHHbrTpOzBQeb6pMMQrr7KF5qE9MLMjyz3/c1jdm64M3Kyt
   A==;
X-CSE-ConnectionGUID: 6gv0BD14S56SB7IbH6VZ9g==
X-CSE-MsgGUID: Mzy9wdG/S3ektPDCmU798Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="55956612"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="55956612"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 18:30:50 -0800
X-CSE-ConnectionGUID: 88GaVRchTY6TIWFj2Rdn2g==
X-CSE-MsgGUID: 0rB+r1M/TFisMXV6Be13Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="204456803"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2025 18:30:47 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYEeD-0000000065Y-2epx;
	Wed, 24 Dec 2025 02:30:45 +0000
Date: Wed, 24 Dec 2025 03:29:53 +0100
From: kernel test robot <lkp@intel.com>
To: Arun Muthusamy <arun.muthusamy@gaisler.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mkl@pengutronix.de,
	mailhol@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
	Arun Muthusamy <arun.muthusamy@gaisler.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: net: can: grcan: Convert GRCAN CAN
 controllers binding from txt to YAML
Message-ID: <202512240358.V4rXhlja-lkp@intel.com>
References: <20251223105604.12675-3-arun.muthusamy@gaisler.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223105604.12675-3-arun.muthusamy@gaisler.com>

Hi Arun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4001bda0cc911fcdd3dde36963a17f4eac173d7d]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-Muthusamy/dt-bindings-Add-vendor-prefix-for-Frontgrade-Gaisler-AB/20251223-190933
base:   4001bda0cc911fcdd3dde36963a17f4eac173d7d
patch link:    https://lore.kernel.org/r/20251223105604.12675-3-arun.muthusamy%40gaisler.com
patch subject: [PATCH v2 02/10] dt-bindings: net: can: grcan: Convert GRCAN CAN controllers binding from txt to YAML
reproduce: (https://download.01.org/0day-ci/archive/20251224/202512240358.V4rXhlja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240358.V4rXhlja-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/sphinx/parse-headers.pl
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
>> Warning: drivers/net/can/grcan.c references a file that doesn't exist: Documentation/devicetree/bindings/net/can/grcan.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Using alabaster theme
   ERROR: Cannot find file ./include/linux/pci.h
   WARNING: No kernel-doc for file ./include/linux/pci.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA43B194093
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 13:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717765622; cv=none; b=hEXF94AgGqg/biA1PCQDr75hN1KgUVaGB0PnLyBJ+CRbI5b8WRTNVBKHqW7KDRNe7R9pLk1u+93oGpJmyny+RBxJKoU6oJdWrO8NtKCRIwYzNk8kV+sB2TWgSnxY4fbATIHEdcVmWGGJ0wNOQmxMkBxA8SGfgADjUPaLwSpl4jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717765622; c=relaxed/simple;
	bh=Cl1VjJYMkumRiEN01m8cKTK5QcLM61/oHQxBE4Vr0Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LK2BBSyTLUjODNW06EUpOrnQOrTzHsKz88KLNiPwJaTWsX//bmD0U/6Fmj7N0w5RdLoXvyUw3bAxPp0Jx8vCsOTGp4iN7KX3bZ7xN4Fv+x2E03p36csoYmqDV0wehPvlGYVUruZo/uzT1YiSRo9YcK2y1jd7AI9lkHGxS4xsWeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCUcBADB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCUcBADB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717765619; x=1749301619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cl1VjJYMkumRiEN01m8cKTK5QcLM61/oHQxBE4Vr0Eg=;
  b=FCUcBADBwKUom5Xawq1fnuXhvqL9RysqXhwjr3zYcZYEyKJzKC+aECXH
   0Xa0EGjdh/Jb1Et/1iKSb7pnLaCphE9HPb2vqDrnJmHAnTUWAelKttxaZ
   MM2lTCJYiHe8wMB2zfeQDiGChl803qJeLvBdeh1PZx0nkBQn/9900vKzJ
   818Utl5neVbRe6dc+b9m585EQS2A90ggVJKo3lIUA+C6ACLTJ9PBm0dT0
   eXLw5ulcwcPXV7d+FUUvTEqiZsOpg9QGR2K12J1yZijiN1GPWPMSaqkyU
   F9R7RYKpHQzmDfJwtPXSRHnSkybKb02exqpgbJR6C8f0LxnQRXvQrzU+r
   Q==;
X-CSE-ConnectionGUID: TheNIqwiQzm1NNFIj5IJ1A==
X-CSE-MsgGUID: eVUn/4JbT5ymw7LQOKJVnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25587511"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25587511"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 06:06:59 -0700
X-CSE-ConnectionGUID: SgtAXGKJRQSmo94SscSW+w==
X-CSE-MsgGUID: aW0G0XJESzSS8loZJhAOCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="61522733"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jun 2024 06:06:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFZJ0-0004oK-08;
	Fri, 07 Jun 2024 13:06:54 +0000
Date: Fri, 7 Jun 2024 21:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, mka@chromium.org,
	gregkh@linuxfoundation.org, javier.carrasco@wolfvision.net,
	benjamin.bara@skidata.com, m.felsch@pengutronix.de,
	jbrunet@baylibre.com, frieder.schrempf@kontron.de,
	stefan.eichenberger@toradex.com, michal.simek@amd.com
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: Re: [PATCH] usb: misc: add Microchip usb5744 SMBus programming
 support
Message-ID: <202406072046.cA1Mbg1K-lkp@intel.com>
References: <1717676883-2876611-1-git-send-email-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1717676883-2876611-1-git-send-email-radhey.shyam.pandey@amd.com>

Hi Radhey,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.10-rc2 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Radhey-Shyam-Pandey/usb-misc-add-Microchip-usb5744-SMBus-programming-support/20240606-203028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/1717676883-2876611-1-git-send-email-radhey.shyam.pandey%40amd.com
patch subject: [PATCH] usb: misc: add Microchip usb5744 SMBus programming support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240607/202406072046.cA1Mbg1K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406072046.cA1Mbg1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406072046.cA1Mbg1K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: drivers/usb/misc/onboard_usb_dev_pdevs.o:(.rodata+0x1498): undefined reference to `onboard_dev_5744_i2c_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

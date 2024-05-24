Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F2F6FE16
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716582320; cv=none; b=YPsYG8wRjKOC0WsLjmqKBSDPcd1YweR8jWFxOGND2tXWHZ+no/R3Lxm45sAiJy1mpZa6sKPszzeemNBeQNgrEt0c6iWYOTQkYxFDNZRAw7IFsRuiMsLcTJjCwxnRyfYhr28pGW+Oe1lMdI0U/5EKsdfZzv/erlaKPYq85wIKDTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716582320; c=relaxed/simple;
	bh=N60imoZMBnLS23fSq0Hjar4yZ8wEBbLazETbtrkv+Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCncnqQR9dfL3giLva/ioIyQSoCQ8EnPX81nSxJBU9VwvoUvo6x/NFnBbcuA8VjKrAQ3GYj1X32Swjt5Oot7hdBR+wy/Mr7KoGqIqoi7M0sb3J/3vitgheW1NVYJcBHfnaAKx+Jnu1ublmXOB9/caV1aXVpWznQfK//bp5Ix4Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVc0g2sp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVc0g2sp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716582319; x=1748118319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N60imoZMBnLS23fSq0Hjar4yZ8wEBbLazETbtrkv+Ks=;
  b=ZVc0g2spJQwDD6sL1+hRriJkz89fdChT39Fz+SvnzxIcQrPfHa+NtpYv
   vJI9sBd/J2elWD+UD1F2sWIpVzKs4higQvch/sfn/ex/e1F/i5alZATFa
   8RfeKoL11edsebpBYsj42pZyTwDPJT2xR1NEPA+gnsFiPm7G1xer8e2ha
   0MbD/5GbnvH7UC4/3F/5nl1unFxCE1v6N8lH/KC6PMGUPRRb66rz89MMb
   9VnNtR939WFuUwmqlG2NCzRhSwpQs/SQxSZ7J47kufZeYUUWzwHq0F74x
   NXx9Gm5L53GUJpBoaUQbC8kxs52MyEgD2itp9tPmmmPIzkWfsAifVe54T
   w==;
X-CSE-ConnectionGUID: pGjDsCy8RNu/Q3rRpAeVtQ==
X-CSE-MsgGUID: eDaLszZbToaHFMJ6t6HvNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="23580581"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="23580581"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 13:25:18 -0700
X-CSE-ConnectionGUID: b240/P9xS3igwcOpmEmkXg==
X-CSE-MsgGUID: oLt0tMaeTne9J7GljLev2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34631108"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 May 2024 13:25:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAbTU-0005tB-1l;
	Fri, 24 May 2024 20:25:13 +0000
Date: Sat, 25 May 2024 04:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 1/8] drm/i915: Define and compute Transcoder CMRR
 registers
Message-ID: <202405250452.oOr8GbJS-lkp@intel.com>
References: <20240524102432.2499104-2-mitulkumar.ajitkumar.golani@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524102432.2499104-2-mitulkumar.ajitkumar.golani@intel.com>

Hi Mitul,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip next-20240523]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/drm-i915-Define-and-compute-Transcoder-CMRR-registers/20240524-183131
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240524102432.2499104-2-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [PATCH v9 1/8] drm/i915: Define and compute Transcoder CMRR registers
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240525/202405250452.oOr8GbJS-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250452.oOr8GbJS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250452.oOr8GbJS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_vrr.c:12:10: fatal error: intel_vrr_reg.h: No such file or directory
      12 | #include "intel_vrr_reg.h"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +12 drivers/gpu/drm/i915/display/intel_vrr.c

  > 12	#include "intel_vrr_reg.h"
    13	#include "intel_dp.h"
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

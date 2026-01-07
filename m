Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0BD26E6E8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 20:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767817383; cv=none; b=lkYmFVGoWCRUWZpg9GhGnRbhIm80fSE/IKiDqAPgjh+4tuAU4YC9rjxw+M+eYDKAdZsDq1IDUwjLgC/MaBhqGN7bYY7E0LWbwhSyb4GexhDqffhxtDyX9zNfZX1Lnu/2UNOB5F0tgkytJZ21SxbxXKzWPPQHx/8Y48E894dFNNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767817383; c=relaxed/simple;
	bh=N5N5kpkbQuEF6Uhrqi7QxkiwEFRW2zFbnmCdlURZdvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmzolNusOnBQcU5K8r67Z9XPUPlhpGphQuFgWHXVXZKQ7LrjofCjTkHCgPxqezRJ1DMDTl0uUBetKY2fvICd95wQe9/mRBpDbD35txHXs1S2c0g/kqDjY7cx9tGFG/w2TiNoLYgStIWUhLe8KHn7FsfzRGS6wfRXcZd+VMAdL7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnR2Zsd3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnR2Zsd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767817382; x=1799353382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N5N5kpkbQuEF6Uhrqi7QxkiwEFRW2zFbnmCdlURZdvE=;
  b=RnR2Zsd3fo8yejVY02zDfbE5RWDDh2H+Z26QzED/PgbFgRcgKEHYKkCZ
   Lca2U6v6ROeZVDAaiFQrY3C9p3O5Svf5Dj0dFWVX/vyVMoFMCrpCfe6WN
   DzM5nHj4FEw804IVItroYVAKbH2zdwXmeqc69om/JKRVIjq9iRnq8PDVf
   3PUh76oXKsiD8AhuaSdiIqJWuRzr8aIvcRpBxXPHl/AwS7xwcSfuQIDkx
   ROwCYJIev3bmXGMW2FTLDBMSHNnOs3c2tXjQzhIGZNLmooNpJ+Ia4aIXw
   3m/oZmqKkGsRHRTnAN68SK2dJHH4YxEK2DXtDyjPcGYI7fI4VZ/c92eKu
   g==;
X-CSE-ConnectionGUID: s7rku34ETgmz/3kzLUWEGQ==
X-CSE-MsgGUID: f7j7Wv63ReewfLJ1ToYy9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86783105"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="86783105"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 12:23:01 -0800
X-CSE-ConnectionGUID: UHYq1S0LT5+pbtfRSLyEsQ==
X-CSE-MsgGUID: kDaQDf6ORoyRwrhlkY1yhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="240496463"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 07 Jan 2026 12:23:01 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vda3W-000000001cG-2GyJ;
	Wed, 07 Jan 2026 20:22:58 +0000
Date: Wed, 7 Jan 2026 21:22:08 +0100
From: kernel test robot <lkp@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 4/4] Input: Add TouchNetix aXiom I2C Touchscreen
 support
Message-ID: <202601072119.UEVp2yFY-lkp@intel.com>
References: <20260106-v6-10-topic-touchscreen-axiom-v4-4-9e9b69c84926@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-v6-10-topic-touchscreen-axiom-v4-4-9e9b69c84926@pengutronix.de>

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/firmware_loader-expand-firmware-error-codes-with-up-to-date-error/20260107-031755
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260106-v6-10-topic-touchscreen-axiom-v4-4-9e9b69c84926%40pengutronix.de
patch subject: [PATCH v4 4/4] Input: Add TouchNetix aXiom I2C Touchscreen support
reproduce: (https://download.01.org/0day-ci/archive/20260107/202601072119.UEVp2yFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601072119.UEVp2yFY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/pci.h
   WARNING: No kernel-doc for file ./include/linux/pci.h
   ERROR: Cannot find file ./include/linux/mod_devicetable.h
   WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
   Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:57: ERROR: Unexpected indentation. [docutils]
>> Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:57: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:57: ERROR: Unexpected indentation. [docutils]
>> Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom:57: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./include/linux/bootconfig.h
   WARNING: No kernel-doc for file ./include/linux/bootconfig.h
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   WARNING: No kernel-doc for file ./include/linux/pstore_zone.h


vim +57 Documentation/ABI/testing/sysfs-driver-input-touchnetix-axiom

    52	
    53			Access: Read
    54	
    55			Valid values: Represented as string
    56	
  > 57	What:		/sys/bus/i2c/devices/xxx/device_state

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

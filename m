Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70193242BD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 02:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790215833; cv=none; b=lxEfageZBCoKQ8gWymojgyWLccjh3dEBHMYD+AyE7y5F/iK2sf0jMm86r51BcdN+rRW+6+uEO1rJnQvCiD2v0YaNKTbv6YVZmqwIbw7T4zIoqJaYnzHTnAJSHRw5F/VtdxFPV4UrBhNa2gQ6Tx/2y3c+btM80AuQoO+tpIckQnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790215833; c=relaxed/simple;
	bh=ACw+v8q9HJglXsBWYNk5QW21ScNlTem+t6YcCssEcOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwYCUpo2PSNHzwckU0n/Aq07Ypyv4R0orQK7CFXFVV37NJ/4GELeerUh8PsRajb6MhOSINCXvw1RzSgQsHO1CKUl71AmZs4BaaScElW2IjwTIrtfwlyaryLv8M4r4X/GVnM6c1mfMYyxYpTSc082ad6xy9aYyvOJITsT6x7E/X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H29+z0G4; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H29+z0G4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790215833; x=1821751833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ACw+v8q9HJglXsBWYNk5QW21ScNlTem+t6YcCssEcOA=;
  b=H29+z0G4cq2nAfNGLRj54Ml3tWe+lNorkz5a3eu2aACCGEH0Na93rQGv
   L52NMM6DOPwO4gtHVHXQLdPTZyJp6Ump13dAxys+faUsWGCcOzTr0OjAL
   fUZ07IuXiJ1GqKS7OjluvNAhHdtqyfN5arB1DP2POEqJoNyU58ce3yr9Q
   qQCrXSjUv2bRo2hiXNcVSjhMYpQPnUNPafVek3t6B/f/FEn3EgkRaqTLq
   uYtVdjO0wrvfBtMW1DauFr/4iYG9Kn51mNUK9J/qS/CKgsPD1tFmR3sIg
   q/xIwiFY1ucIBO539leXe3w1/l/lQ+tf88jPOrudjvYCluwATUF8Gq+TM
   Q==;
X-CSE-ConnectionGUID: RZU/zMmlR4uQb59BBp/Q6A==
X-CSE-MsgGUID: 8TffQP8mTH6T+6HneBmAJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1483050"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="1483050"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 19:10:22 -0700
X-CSE-ConnectionGUID: 8oOBvtnYT5uuRb0qIqwBQA==
X-CSE-MsgGUID: 4jXlXmiHTn6WuPXX8lIZ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="300124716"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2026 19:10:18 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Yud-00000000I6E-2f8T;
	Thu, 24 Sep 2026 02:10:15 +0000
Date: Thu, 24 Sep 2026 10:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>,
	Dave Airlie <airlied@redhat.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH] pci/vgaarb: pass a data pointer to be used in the decode
 callback
Message-ID: <202609241015.1yXHBzfy-lkp@intel.com>
References: <20260922064111.2468741-1-airlied@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922064111.2468741-1-airlied@gmail.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on pci/next pci/for-linus drm-tip/drm-tip linus/master v7.3-rc4 next-20260922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/pci-vgaarb-pass-a-data-pointer-to-be-used-in-the-decode-callback/20260922-164111
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260922064111.2468741-1-airlied%40gmail.com
patch subject: [PATCH] pci/vgaarb: pass a data pointer to be used in the decode callback
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260924/202609241015.1yXHBzfy-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241015.1yXHBzfy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241015.1yXHBzfy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/radeon/radeon_device.c:1079 function parameter 'data' not described in 'radeon_vga_set_decode'
>> Warning: drivers/gpu/drm/radeon/radeon_device.c:1079 Excess function parameter 'pdev' description in 'radeon_vga_set_decode'
>> Warning: drivers/gpu/drm/radeon/radeon_device.c:1079 function parameter 'data' not described in 'radeon_vga_set_decode'
>> Warning: drivers/gpu/drm/radeon/radeon_device.c:1079 Excess function parameter 'pdev' description in 'radeon_vga_set_decode'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B119E197A6A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 17:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695441; cv=none; b=YqXVMHfIDnvmkIAV8pWpYB3wpAMoacuMMK2g7vtONy6qGBzs9HprNbnxlV1tUCat5+SOa5faZme4FbGkXc7QpNvbvk+RWEaLgoR9a4GXd+as2VlXUrrVvmGXMCmyWnNSbaTjex6s+aQC7MIFZNVnRpeweNSvPC67GFg8QiIvpM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695441; c=relaxed/simple;
	bh=an4yF0MIp11gUcda5A5NeD9QCW3WQZkq2Y2Wd4VZhqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ky6rC4qlbIcTFzjUXqgrEKOV7QSNDFlHO8+C5cg7Vte3BIr2FS1TKD/mN8mdVTU1m6LU8abJTSMqgqHSKxg2u0QqmlKSNK+gVBe8qJRrRAm754uGF/HMPwNb5bwebw3jPOacIc34kjg/GirWHXtMPNeDgQNxk1VOai0eKDON0gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hErswLPv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hErswLPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717695439; x=1749231439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=an4yF0MIp11gUcda5A5NeD9QCW3WQZkq2Y2Wd4VZhqg=;
  b=hErswLPvOuxvy82FyGAh6eenz9jajOorXEpTN9xXzmBFxeoRrnNGAIPi
   kCUZKW+35efiCP21l16IdJj64XDtR5A9jjjRsRPdzIa4Jiql1fCrrDngK
   OEBYo+sOGcPWqmFrZGWXcYj85ryAKe5JesWyd2580UlBALOe/cAw9SNDb
   eQnDWT759LG89Kps/WQzw/qeIyRHlgiYoY0qHoyHYnqgd/LZPqec1bomP
   CHO9J17D8xpMRVSY8UvSwkhPTfIl+YjYrIRdYMTBCSwDtzwoiAcNlqkRy
   jvbWkexzKVCQVrEWQK1+DZ0SefFZolsEyURZ19e+lKoK8iGvNq4qdeLJm
   Q==;
X-CSE-ConnectionGUID: c6cJSF7kSBq12YbWJNdiBQ==
X-CSE-MsgGUID: /c95q5S3Se2r6IFMWYiA3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="24957739"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="24957739"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:37:19 -0700
X-CSE-ConnectionGUID: 7yX0SKLFTQu9jAEYMYczyw==
X-CSE-MsgGUID: bgLvO1WrQBet9VHSqWh5gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38494005"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Jun 2024 10:37:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFH35-0003VI-32;
	Thu, 06 Jun 2024 17:37:15 +0000
Date: Fri, 7 Jun 2024 01:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V3 1/3] platform/x86/intel/sdsi: Add ioctl SPDM transport
Message-ID: <202406070140.GQV3d12h-lkp@intel.com>
References: <20240606011617.557264-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606011617.557264-1-david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on c3f38fa61af77b49866b006939479069cd451173]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/tools-arch-x86-intel_sdsi-Rework-Makefile/20240606-091801
base:   c3f38fa61af77b49866b006939479069cd451173
patch link:    https://lore.kernel.org/r/20240606011617.557264-1-david.e.box%40linux.intel.com
patch subject: [PATCH V3 1/3] platform/x86/intel/sdsi: Add ioctl SPDM transport
config: x86_64-buildonly-randconfig-003-20240606 (https://download.01.org/0day-ci/archive/20240607/202406070140.GQV3d12h-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070140.GQV3d12h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070140.GQV3d12h-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/intel_sdsi.h:13:10: fatal error: linux/sizes.h: No such file or directory
      13 | #include <linux/sizes.h>
         |          ^~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

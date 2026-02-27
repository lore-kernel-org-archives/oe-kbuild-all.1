Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F110638A71C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 06:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175480; cv=none; b=fiFCQyE+nbUG6LVUVvz2toNu3eDdLS0A/k+OcJ5Cl2kijkAtQkyfCgpFFfEvkJ3Mbmo9JSabRfa/mABoBcNbuUhHXtkzSkObe4h5tib9LY34aJbzCBXQ0JLBr99KaAv8BD80zNdIceTw1+jRNc2VysF2jA9EaWRoxgUGGscaIX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175480; c=relaxed/simple;
	bh=UJbderW4otTO6b1LtImNkneD3TUGIis4MErn2AGd7uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pV96UVrwqHWyT/JqAphzT6v3/ZTBW0TB6jFtXGMMnMbEjpJUbT1co9eWbTV83y1Kvbu2XeM14eIEu3PBTP+lnCylM34BksRhb0ryNvmffRi7AvPcN1PFh3LzfuEKS9OV1gZCcOqpBvEBfJfLgyg7RVOmsfSmVnC/Xep+olZXNMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9w+0C51; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9w+0C51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772175479; x=1803711479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UJbderW4otTO6b1LtImNkneD3TUGIis4MErn2AGd7uE=;
  b=d9w+0C51LzdJeqF2ojt3zi9FEHY0eo+BHA06YEONzH/2vhbp62LyeTe7
   e4czi2eBm+yHVsNKi8khq9chAgNI1CvJnqJ2uMoQ3QNzqhdgehFaS477t
   i5fxYSrnpfxlv0hrkavC7TSMx2D7CWQmzCwjN2hgytI8O+qe5/8vWfSyX
   0j2oWSJvXfGq28UkDJb5IHU8uuUglf767yrvDEyBFLXMxz97YVbhOXox9
   IZVpbxvAHZb7xAvWbC1rOvqSHyEMDPBbYWPOftFFSAi8wbTWaYSGE7maI
   Vr4UvPMgEyHnskDSXu059XoeL7EG3E9kSqLvcNlSGGPX01eqqpoHDi2sK
   g==;
X-CSE-ConnectionGUID: QEDxhjOKQ86yksO4puC5Zw==
X-CSE-MsgGUID: FyfsmdMZT3SN0ZG0ASTUIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83959735"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="83959735"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 22:56:59 -0800
X-CSE-ConnectionGUID: oeUMi0x/TausyW+s1rBEig==
X-CSE-MsgGUID: 0B+ioBECR7iHFg34FRF8HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="254597993"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Feb 2026 22:56:55 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvrm5-00000000AHn-2QPw;
	Fri, 27 Feb 2026 06:56:38 +0000
Date: Fri, 27 Feb 2026 14:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Morduan Zang <zhangdandan@uniontech.com>,
	devnull+cryolitia.gmail.com@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, CoelacanthusHex@gmail.com,
	Cryolitia@gmail.com, corbet@lwn.net, jdelvare@suse.com,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@roeck-us.net,
	marcin@stragowski.com, Morduan Zang <zhangdandan@uniontech.com>
Subject: Re: [PATCH] hwmon: gpd-fan: replace custom EC I/O with kernel
 ec_read/ec_write
Message-ID: <202602271410.w0cX8IID-lkp@intel.com>
References: <53C09CAECC90EB98+20260227024945.151198-1-zhangdandan@uniontech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53C09CAECC90EB98+20260227024945.151198-1-zhangdandan@uniontech.com>

Hi Morduan,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v7.0-rc1 next-20260226]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Morduan-Zang/hwmon-gpd-fan-replace-custom-EC-I-O-with-kernel-ec_read-ec_write/20260227-105255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/53C09CAECC90EB98%2B20260227024945.151198-1-zhangdandan%40uniontech.com
patch subject: [PATCH] hwmon: gpd-fan: replace custom EC I/O with kernel ec_read/ec_write
config: x86_64-buildonly-randconfig-004-20260227 (https://download.01.org/0day-ci/archive/20260227/202602271410.w0cX8IID-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271410.w0cX8IID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271410.w0cX8IID-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/gpd-fan.c: In function 'gpd_ecram_read':
>> drivers/hwmon/gpd-fan.c:255:16: error: implicit declaration of function 'ec_read'; did you mean 'up_read'? [-Wimplicit-function-declaration]
     255 |         *val = ec_read(offset, val);
         |                ^~~~~~~
         |                up_read
   drivers/hwmon/gpd-fan.c: In function 'gpd_ecram_write':
>> drivers/hwmon/gpd-fan.c:260:9: error: implicit declaration of function 'ec_write'; did you mean 'up_write'? [-Wimplicit-function-declaration]
     260 |         ec_write(offset, value);
         |         ^~~~~~~~
         |         up_write


vim +255 drivers/hwmon/gpd-fan.c

   251	
   252	// Helper functions to handle EC read/write
   253	static void gpd_ecram_read(u16 offset, u8 *val)
   254	{
 > 255		*val = ec_read(offset, val);
   256	}
   257	
   258	static void gpd_ecram_write(u16 offset, u8 value)
   259	{
 > 260		ec_write(offset, value);
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

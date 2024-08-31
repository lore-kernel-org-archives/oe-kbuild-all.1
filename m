Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84AC1D12EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 02:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725071268; cv=none; b=eSf9AKccY6zdwjHfUXS4feEKZDce9SGJs8as1P73kdX7Oj1SOf04g3ykbeF5PH7O/apE42uFrLEdiGglIdxbnpRZ2RLBIfM9JvbAHGFJf4YI9v0wkkcQ/EkGTQr8qiRWGDS3Cr1fT1+EmeM4hqlxbZ/U7Nl0aIEXiPxZyj8G02A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725071268; c=relaxed/simple;
	bh=hvCG8Hspg2D7fhFjRA9FthTgABmSUJZiQdPrMIHoDEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNWc0tRO7Q2HY0Ou9HXFAHWwRk0jamAOlNt9CQ3Fr4esMAnwXJ48HQp1WXMkNlab6ikeryqiWlDVJXIZMybJf0ekE7JUzYgMqlsb26iw2Vy191OzAntEPfd1zznaqI+18HnsA2iWF6pqAJ4msHjm6UT4AdfLg5MPsYxw2j2wmEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMiMlpVO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMiMlpVO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725071266; x=1756607266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hvCG8Hspg2D7fhFjRA9FthTgABmSUJZiQdPrMIHoDEE=;
  b=FMiMlpVOVYEAsdMMRbxR/bhbFfaK92bV1HTpuXTiggGhSFKydKuG2wDi
   5SWCUFT8Ilt5VKe2KH8U4Iqm3usPpQwp9vv0YscO+KSasIKV6p2ezPkp1
   WgrAfjFzsenvF6gb3ZV1jpIWrSe7KWLA4sGRw/sslqxjETm1Ain6D2WR9
   1gcRKZP17m7sonSfr7eNWBwkYHrygFstgzOHsYJEl2Y75g1TUvy7G5bbx
   d/v01QbEsfAupNr/1xi0MU/zNo1y0Jt8mjWzfrica7uTv+StpAvu+9Gdw
   KO+TWuv/9ktk9sg5HkrWh9h/LeoaiVPyConoPiNTJo8R3kvgkfMZGZFsK
   Q==;
X-CSE-ConnectionGUID: bbqEBCq2RAKCLaXFMipj5Q==
X-CSE-MsgGUID: gxJBnPb/Q82m5YzSywRVUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="41221943"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="41221943"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 19:27:45 -0700
X-CSE-ConnectionGUID: 4VRHfVNpTAWjFL1E20qkrA==
X-CSE-MsgGUID: qlCWxZeORYyfz8FtlLIWtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="68732238"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Aug 2024 19:27:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skDq2-0002IA-0u;
	Sat, 31 Aug 2024 02:27:42 +0000
Date: Sat, 31 Aug 2024 10:27:37 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v11 1/4] firmware: ti_sci: Add support for querying the
 firmware caps
Message-ID: <202408311026.LluPK1A2-lkp@intel.com>
References: <20240829201606.1407773-2-msp@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829201606.1407773-2-msp@baylibre.com>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/firmware-ti_sci-Add-support-for-querying-the-firmware-caps/20240830-041726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20240829201606.1407773-2-msp%40baylibre.com
patch subject: [PATCH v11 1/4] firmware: ti_sci: Add support for querying the firmware caps
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240831/202408311026.LluPK1A2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311026.LluPK1A2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311026.LluPK1A2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/ti_sci.c:10:9: warning: "pr_fmt" redefined
      10 | #define pr_fmt(fmt) "%s: " fmt, __func__
         |         ^~~~~~
   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from drivers/firmware/ti_sci.c:9:
   include/linux/printk.h:355:9: note: this is the location of the previous definition
     355 | #define pr_fmt(fmt) fmt
         |         ^~~~~~


vim +/pr_fmt +10 drivers/firmware/ti_sci.c

aa276781a64a5f1 Nishanth Menon 2016-10-18 @10  #define pr_fmt(fmt) "%s: " fmt, __func__
aa276781a64a5f1 Nishanth Menon 2016-10-18  11  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

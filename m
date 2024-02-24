Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4BB14B804
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708786152; cv=none; b=spAuZMYN7oGpWj/mXVLfkY/QSL1v6otvtS8p5OTLNUEFNfg25SPmawmkYRlZbL4sAMkk10mGDZanW31WBEn3mWWkIivqnVxWwBJpcW5biwoVgI4Ubwx2A5Wuxn3JarSY9l1Wlxx1EPnx+dmFFmYR+/ExeK7+/Z+qJfd41+6Pvyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708786152; c=relaxed/simple;
	bh=07Y/P7jnzo6GwEvHb+Lo2pchnch01CbOA4p6fk8NyPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JDYMpUUnQC6Nsyuy3wJylXHzRO1a3vSPKKot3uwBCV61u9rn4Le6K9U3nFCgFkaWPv9jl4PuG/YLoSCPw9z1GYH1HUPXKhKfVoqA1I5mMJD53Etef32kTipjuXFHwHUtV+4u6n2jryaUVW/YM27/LtkW5yHkwhrdEunsC5NQC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4EIe0LK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4EIe0LK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708786150; x=1740322150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=07Y/P7jnzo6GwEvHb+Lo2pchnch01CbOA4p6fk8NyPw=;
  b=j4EIe0LKQ4xMDsmDnY4hhUue7VzrENQVl34VvqkO+GqUnNuO6nORPHrv
   A0ZX06VAXPLY18KGERaiik1KnWDkJf1f+SkMQx6RjjjbMYYaqipXSHV6p
   CX1xPAmC2ZsCBIIZzQbOZ1Yb9h2Tliz9V2ls7OKypPVvfOoR6MEMWDKwd
   oeSjWU4qfZgKMfSwAlidCnRNQq0WSVKAairOZzdQIn+5BjMN7JACNPKJc
   2GIkud1fX1J+OaPVTyRlN1akqsDZ2IR3baG9XmhiRQJofjWPG09Y0oll3
   rMOeTx6rpJ+pIuoh6BAN+QXfF7cTdKnynNw/un3flkEqmHAmdhzoRpfl8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="28538248"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="28538248"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 06:49:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6632306"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Feb 2024 06:49:08 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdtKr-0008cW-01;
	Sat, 24 Feb 2024 14:49:05 +0000
Date: Sat, 24 Feb 2024 22:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: [lee-backlight:for-backlight-next 3/18]
 drivers/video/backlight/ktd2801-backlight.c:8:10: fatal error:
 linux/leds-expresswire.h: No such file or directory
Message-ID: <202402242236.5mNHwLDX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
head:   3c40590fafd4cc2447fb482a640c450e1a58ffa1
commit: 48749e2f14e3ae6c62ba7d51d140a848582df66c [3/18] backlight: Add Kinetic KTD2801 backlight support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240224/202402242236.5mNHwLDX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402242236.5mNHwLDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402242236.5mNHwLDX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/backlight/ktd2801-backlight.c:8:10: fatal error: linux/leds-expresswire.h: No such file or directory
       8 | #include <linux/leds-expresswire.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +8 drivers/video/backlight/ktd2801-backlight.c

   > 8	#include <linux/leds-expresswire.h>
     9	#include <linux/platform_device.h>
    10	#include <linux/property.h>
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

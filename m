Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CF2298CAF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763218820; cv=none; b=MoPS7wqdrfSLvcgQ2Vmpz9Q9uZUmTZy6iHTsCjHR/02B2rCiuWB5HKiSGY4PaI9yP6n9YtnzUq2sxDZZeAu7AiIWTl9rBmScdWf5jp1iCvIcaDPis7umdLAnS0YMovygLy5m2rhSmEUYNkd9eTG2bkHT6LPXJaY+7UB2Q8AE2c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763218820; c=relaxed/simple;
	bh=lE0aak0pWYyWG+KifPC+rehvXJ6fTE7oYiLAWTS/zj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OX3uCPLi4dDUg5NJt8YAia/T8c9jOXLVP9dtdN7xoQ5t8/U9Il19LYaXI4KMv3wN8kptssC80JU35abPxVUw6NykqkuEuJh8FblTZnyZPUF1GpOd14VmqYkTHkzRPQJna3Lf/jTJNeCiuNn3vsd+SM++Bd6Hv2/66p5v9T3FRtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMZ/IpEK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMZ/IpEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763218819; x=1794754819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lE0aak0pWYyWG+KifPC+rehvXJ6fTE7oYiLAWTS/zj4=;
  b=jMZ/IpEK4fY6Foug8xGVxIXJ4Yj1mqtsYFclN180hFo8DkF2t4IJ/6bE
   bccIa8MdDAWYrJD4+1G3VpboAVg7J8Zlt23CXWn4NwwVRc5Is3hvRaVBd
   o1DswPUBMOa59No6vsMGTGAi4GS99WUvQ6x1A+oME/2GZmW/fSd4FC95G
   DT+NOX6T9+e5xHKfEoknME0XUlh6P20eRGE1du0Kp0KIRGkz+3kt6bkfN
   tHUy+D7p/z4znwLmuZzBHtSSHILJ+pT3fH107vjQkCjToiS40NfKKAgDb
   yRlckwZgXRTszyxDXcttgZPS9oYfYUNbhtMmur/7qNngwLD+sBYudYMke
   A==;
X-CSE-ConnectionGUID: TkOtGkHcRQqFD5HhNZx4pQ==
X-CSE-MsgGUID: er9cBHroQbyXZcJaeXXOKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="82916814"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="82916814"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 07:00:16 -0800
X-CSE-ConnectionGUID: uUcB55A2TsmSEZ67mcAFzQ==
X-CSE-MsgGUID: WRa0B01VRqyfVEICJ4Ww0A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Nov 2025 07:00:14 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKHl6-00082l-08;
	Sat, 15 Nov 2025 15:00:12 +0000
Date: Sat, 15 Nov 2025 22:59:18 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>, Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, tzungbi@kernel.org
Subject: Re: [PATCH] lkdtm: Add lockdep related crash tests
Message-ID: <202511152240.uaKhTU6M-lkp@intel.com>
References: <20251114062535.1827309-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114062535.1827309-1-tzungbi@kernel.org>

Hi Tzung-Bi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus kees/for-next/pstore kees/for-next/kspp soc/for-next linus/master v6.18-rc5 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tzung-Bi-Shih/lkdtm-Add-lockdep-related-crash-tests/20251114-142702
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20251114062535.1827309-1-tzungbi%40kernel.org
patch subject: [PATCH] lkdtm: Add lockdep related crash tests
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20251115/202511152240.uaKhTU6M-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511152240.uaKhTU6M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511152240.uaKhTU6M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/lkdtm/lockdep.c: In function 'lkdtm_LOCKDEP_CIRCULAR_LOCK':
>> drivers/misc/lkdtm/lockdep.c:21:48: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
      21 |                 scoped_guard(spinlock, &lock_B);
         |                                                ^
   drivers/misc/lkdtm/lockdep.c:23:48: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
      23 |                 scoped_guard(spinlock, &lock_A);
         |                                                ^
   drivers/misc/lkdtm/lockdep.c: In function 'lkdtm_LOCKDEP_INCONSISTENT_LOCK':
   drivers/misc/lkdtm/lockdep.c:37:40: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
      37 |         scoped_guard(spinlock, &lock_A);
         |                                        ^
   drivers/misc/lkdtm/lockdep.c:40:40: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
      40 |         scoped_guard(spinlock, &lock_A);
         |                                        ^


vim +/else +21 drivers/misc/lkdtm/lockdep.c

    16	
    17	/* For "WARNING: possible circular locking dependency detected". */
    18	static void lkdtm_LOCKDEP_CIRCULAR_LOCK(void)
    19	{
    20		scoped_guard(spinlock, &lock_A)
  > 21			scoped_guard(spinlock, &lock_B);
    22		scoped_guard(spinlock, &lock_B)
    23			scoped_guard(spinlock, &lock_A);
    24	}
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

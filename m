Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453F2801
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Aug 2024 20:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724617258; cv=none; b=uXwuOWjLf1E+M0UJtAGJ4TCUm1bdOXGJNzV1ktoD7xOBBBV7nnnpir1J0d98ZAx5KZaxE4Prm8co+9kxyOie+dHi1T61jETWRdX/JPVUib8s9mvweLKBEtNSyq01Xd5dR60X2z08wm512MUxcL3jPe8fhqJ42mhkdE+0imKD+Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724617258; c=relaxed/simple;
	bh=VToyjT4OoFC4dS60qEQQiqadSDnhMkvbENO3UZI0d18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlxwOWSDhbnFmjEyRx0l+d9zBXHmJ8qt96H9ryoKfcP1UgKdWBi1F9KbG050146jdLpPqrIAtpsAPp9nah1AKKGLvwdsK6K+G9+JYeZjpOu/tNh3E1yvfAEujs2TodGdIGBip20xIQSqhsB8uLNeGKiOP//+E8Zsv2Pw112JC2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibM11TMN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibM11TMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724617256; x=1756153256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VToyjT4OoFC4dS60qEQQiqadSDnhMkvbENO3UZI0d18=;
  b=ibM11TMNJTssxXZ011MY+gsFQ3fcvRUp3iC7IeDDs+1Up7wjOY0SypIE
   VCkuqw3oZiYzJ/iIOZgeW7a8aJIsCx+pViw3fP1EhIjA2KAJv7MPDboh5
   W5zZ7I3LFifMLF1I6G3R/2V9no0fSizbUfUKay7bfgZH4tVKvBkdJ/7d6
   RPs7Q9RbDQvPcBqJxxfAU8ds0b0Pe2gq5+IfaTKikMmlIc4b0hIof19bj
   wVna1muuMYafVNr4cE03CbAF9N+BKL7XgR5BPogOu9twBRcnKuKGDp8Gv
   DYockoMP/vl22RuR5EuiByRm1TtLW+mE7H8p8bcQNoUGJajaGd8Umnn0K
   g==;
X-CSE-ConnectionGUID: JX7pkzulRhaNeceQk1RGwg==
X-CSE-MsgGUID: TI0Aktx7RdCyimLhu8lF0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25921309"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="25921309"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 13:20:55 -0700
X-CSE-ConnectionGUID: pB7ASK6XQKKftgRlJOisnA==
X-CSE-MsgGUID: xm7w5AE9QZaMP5KcNAaBwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="67124979"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Aug 2024 13:20:52 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siJjE-000FQZ-2g;
	Sun, 25 Aug 2024 20:20:48 +0000
Date: Mon, 26 Aug 2024 04:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
	linux@roeck-us.net, andi.shyti@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
	badal.nilawar@intel.com, riana.tauro@intel.com,
	ashutosh.dixit@intel.com, karthik.poosa@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v6] drm/i915/hwmon: expose fan speed
Message-ID: <202408260446.0EeOPMO6-lkp@intel.com>
References: <20240820062010.2000873-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820062010.2000873-1-raag.jadav@intel.com>

Hi Raag,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.11-rc5 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/drm-i915-hwmon-expose-fan-speed/20240820-135849
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240820062010.2000873-1-raag.jadav%40intel.com
patch subject: [PATCH v6] drm/i915/hwmon: expose fan speed
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240826/202408260446.0EeOPMO6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408260446.0EeOPMO6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408260446.0EeOPMO6-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/i915_hwmon.o: in function `hwm_read':
>> i915_hwmon.c:(.text+0xe36): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

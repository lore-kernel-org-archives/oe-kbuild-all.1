Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD9F14BFBF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712841220; cv=none; b=gVhZo7kyzS5LsnJ0ooFNzrWXPwLxluq470En8sRxO84YlzI+VmdGL4nCKlaVndap1hShNoAKQiUH3N1IwlWNZX2Lw0CY4EFck5i5Ci7giwsOPZQ4eAMONiM5xttw/Jn9vkazebfJG7VxO/X24VLEEagqzFL9IxVJ+u1AA5UTmP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712841220; c=relaxed/simple;
	bh=cKVota42RfwGKllIp5/r7dYR/TgI5WoVoI34bCafrK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJs+tWpa5ylDH3RkZDk5LBvV77Zhc+BVSuusJHzjG3eaOIgwPIEZtpgrHJ6O8E4wUaj/7UtxDtz6Qlcz7/E3ftwuxNYW6mWGoD1+ZXAXTi4N+OKQXmYuI9w70AzHc/hL0QOdgGakQLt1ROYxSMzQOGFHyDUSxMqjCCS3Ze/hMRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbg/D+xN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbg/D+xN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712841219; x=1744377219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cKVota42RfwGKllIp5/r7dYR/TgI5WoVoI34bCafrK0=;
  b=bbg/D+xNsyO3fcwTIQ53I2DS4IABUsdj6VPX5a9m0XkplhZsrpcjYjaK
   cap2Yqk+ImZj+GCXY5a5kbPM5aPX5GebwHHCwRsqtQ3v2ZZ8i+OZkcBqI
   L45W5fzS7xlMQTdb08JdYqBjBaBCGGBgHTvJYiFD1N5L9djJwLphf6QRo
   SGRKz3wLjF3QbPMy/ZZfKsQ8eS6bUHnFWgcnEY/ouPr7QAtFwTjynRAe6
   4TVAXOJ4f9hHduRjC8bsE/Zy7tqjbqlWOIe4rM97Sd/zwipQKxSB3ipFh
   6fSgfO2mb53Ryz+O5fLZ+N4yuA58KxxLPD/ZcZzZiYndISUYx9P75cN9E
   g==;
X-CSE-ConnectionGUID: 1grv8SMDREm/9fUg+3Yllg==
X-CSE-MsgGUID: siozBBBDS9WtfhGsLXFKig==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8124068"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8124068"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 06:13:39 -0700
X-CSE-ConnectionGUID: 7XgB02TiTaiYSukHIhDvyg==
X-CSE-MsgGUID: y5AHdSZrScmjhaSU6zXdow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25369975"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Apr 2024 06:13:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruuF7-0008dh-04;
	Thu, 11 Apr 2024 13:13:29 +0000
Date: Thu, 11 Apr 2024 21:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: Zayd Qumsieh <zayd_qumsieh@apple.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Miguel Luis <miguel.luis@oracle.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Christoph Paasch <cpaasch@apple.com>,
	Kees Cook <keescook@chromium.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Baoquan He <bhe@redhat.com>,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Joel Granados <j.granados@samsung.com>,
	Dawei Li <dawei.li@shingroup.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Florent Revest <revest@chromium.org>,
	David Hildenbrand <david@redhat.com>,
	Stefan Roesch <shr@devkernel.io>, Andy Chiu <andy.chiu@sifive.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Oleg Nesterov <oleg@redhat.com>, Helge Deller <deller@gmx.de>,
	Zev Weiss <zev@bewilderbeest.net>,
	Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH 3/3] tso: aarch64: allow userspace to set tso bit using
 prctl
Message-ID: <202404112024.tvGveZOX-lkp@intel.com>
References: <20240410211652.16640-4-zayd_qumsieh@apple.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410211652.16640-4-zayd_qumsieh@apple.com>

Hi Zayd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.9-rc3 next-20240411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zayd-Qumsieh/tso-aarch64-allow-linux-kernel-to-read-write-ACTLR-TSOEN/20240411-061830
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20240410211652.16640-4-zayd_qumsieh%40apple.com
patch subject: [PATCH 3/3] tso: aarch64: allow userspace to set tso bit using prctl
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240411/202404112024.tvGveZOX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112024.tvGveZOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112024.tvGveZOX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sys.c:2319:12: warning: no previous prototype for 'arch_set_mem_model' [-Wmissing-prototypes]
    2319 | int __weak arch_set_mem_model(struct task_struct *task, int memory_model)
         |            ^~~~~~~~~~~~~~~~~~


vim +/arch_set_mem_model +2319 kernel/sys.c

  2318	
> 2319	int __weak arch_set_mem_model(struct task_struct *task, int memory_model)
  2320	{
  2321		return -EINVAL;
  2322	}
  2323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

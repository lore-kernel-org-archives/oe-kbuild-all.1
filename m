Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EA93090F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 22:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763159024; cv=none; b=Jb7R1WDEsPNih2JynMlDGUOoEwaURwJpVlWf+9NQrRe0t3LClNHSuYA4UufJFrtR8sz+RFI796dFy0hnE+prkvgFV5TDJx/PipdcjpwS0CGzczvJVKhi1kL6BdV8vlFmklMUL4fKjtmdDtt/uApw2ZzaLg3WdNU9HsM+Zcqa/jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763159024; c=relaxed/simple;
	bh=c6fENqcDyteb8OfeyDMtWwmBmjclcuCusMm4K2AIU/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTmDNBy7I8RwRj0yfomnQWgJDFxelUtEjYhYSNNUGvsGZR7J2oeR1Q0jh3F6dlWJiMDQnzyaN4daYggqAmbuisRUMCyGe4DB3EQM0Zodj6DFaiFu5pcrJqY/+NEpJf8ktL13tXbvEehV7Q4FJcgokq0NuWE2o+epAQYZmRVW1NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PyXvJRl1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyXvJRl1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763159023; x=1794695023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c6fENqcDyteb8OfeyDMtWwmBmjclcuCusMm4K2AIU/8=;
  b=PyXvJRl17x+rZnskNKJBkcANMJCRzYqT78XaygK4r/x/KB2aauhQC6tF
   nbo4NxlVl7w20q9ZtVmmMqFOJOJD1xOATzyLpQrOztR9LcZX4wb6P6h6/
   VGgcZXwu2M4RJiQTpuEbRkwSwVpKrnzKG2jH8IRbrDpADxzLO7zWeejti
   pdI5s4ny8BnCjhZiL18PAO410dh5YSeDMO8xftk/xlDvP4o3pWy9nFG3O
   +I4Ssqrd7+wBPEHPffY1FxWtH/eE0mIUTtU2wVFn4eLJtD0ratPcFxfti
   fgrdp0Mtgvase3X42ttAi2q/+9891rG0vneeBBIHY3zy1WoB2LVZxnWjT
   Q==;
X-CSE-ConnectionGUID: buZnmrxjSwGs9ke2azhOYQ==
X-CSE-MsgGUID: a79VauhXSqerbvVSF/LVbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="90738187"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="90738187"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 14:23:42 -0800
X-CSE-ConnectionGUID: R5zKaP4uQOCEpAnd+RrOzA==
X-CSE-MsgGUID: HNDoznhWT2GPho9S6Nz2jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="195033708"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Nov 2025 14:23:40 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK2Cf-0007Ln-2d;
	Fri, 14 Nov 2025 22:23:37 +0000
Date: Sat, 15 Nov 2025 06:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, ville.syrjala@linux.intel.com,
	uma.shankar@intel.com
Subject: Re: [PATCH] drm/xe: use the same vga decode code as i915
Message-ID: <202511150634.0W0ZmJta-lkp@intel.com>
References: <20251113133815.696987-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113133815.696987-1-jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.18-rc5 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-xe-use-the-same-vga-decode-code-as-i915/20251113-220145
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251113133815.696987-1-jani.nikula%40intel.com
patch subject: [PATCH] drm/xe: use the same vga decode code as i915
config: i386-randconfig-004-20251114 (https://download.01.org/0day-ci/archive/20251115/202511150634.0W0ZmJta-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511150634.0W0ZmJta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511150634.0W0ZmJta-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: cannot find drivers/gpu/drm/xe/i915-display/intel_gmch.o: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

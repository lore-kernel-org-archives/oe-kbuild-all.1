Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C492B1B3935
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 19:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758138492; cv=none; b=uv0avhAmE+a96DtoRuQDQgaD75l76Czv4Riavhr2YHA8Kr9ZjZE2ohibXEYQKBg2YNuapHgv0y4JoYV0L+VcqxW4ugS6ZfmHj8bO1h8bhN9Yi0pL5GZXhOXbtyP7TnJFUoTYSN910+bPTCjopaShbtGGonpR9Wg+/bFSyGLPiPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758138492; c=relaxed/simple;
	bh=+agGcSVJ6gxVerRGtjsu12e+Ad0qjlyIBjyjjMKamJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/1+5/D6PO92xTeRWsVW/eY+V+d+8W08I2hz4umnNozedfEb1AJwRmG+2UAKRL/qAFUTBjolJNFFctPBry1QGdVyqcSD/7HFjkL51UDhAAO09llhz9Kje/LVYtv1BKFLMGgDXhgK083QK6u8tnSx/LJfEbBjeCgHPpRszVGIiFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsaSRFci; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsaSRFci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758138491; x=1789674491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+agGcSVJ6gxVerRGtjsu12e+Ad0qjlyIBjyjjMKamJM=;
  b=OsaSRFciE/LIIu+Wu7/XiKb3PiSMsSH6JmLJMxIntfH/ZZa8jTNraVZs
   LycnGSUkZf0GtTUl1yh9SNfQsveYDa0aR1L88FlS1iMaejgsSzg7ZNnHH
   dWj8AgqFh3Z/Ty1weoeHNKqkDbaJi/yhVAAr9oE8nWG/pkWPiQifrpRxk
   sMI+wv0+AWHPiqLUBmkyv1UQjA9Z6U4FEqZukXCk1P9BtFGpCEzjMsxrf
   hG5eAa/R9wAzAz/Dxj+k671ye2vzoJHHqKlXvKeW2WqnTGBl6d4a8JOJE
   Ypx57HCDd6CQueuaaxGujgvQTHEk5M7ZoHipNpBzkTtuZmmCEoT+Yq7VH
   g==;
X-CSE-ConnectionGUID: /JO+9FKsTmqrf9SvALOYSQ==
X-CSE-MsgGUID: 51r+EY8CQrSs6Cxe+Osveg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71882073"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="71882073"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 12:48:11 -0700
X-CSE-ConnectionGUID: VVnOWhmQSZGWnFdLmvESIA==
X-CSE-MsgGUID: hLUhdfp/SUa+2Y9iqWvEog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="180465649"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Sep 2025 12:48:10 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyy8N-0002Op-0N;
	Wed, 17 Sep 2025 19:48:07 +0000
Date: Thu, 18 Sep 2025 03:47:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup
 detector
Message-ID: <202509180209.zAS20Rk2-lkp@intel.com>
References: <20250916145122.416128-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916145122.416128-1-wangjinchao600@gmail.com>

Hi Jinchao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on akpm-mm/mm-everything linus/master v6.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinchao-Wang/watchdog-Add-boot-time-selection-for-hard-lockup-detector/20250916-225719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20250916145122.416128-1-wangjinchao600%40gmail.com
patch subject: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
config: i386-buildonly-randconfig-005-20250917 (https://download.01.org/0day-ci/archive/20250918/202509180209.zAS20Rk2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509180209.zAS20Rk2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509180209.zAS20Rk2-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: watchdog_hardlockup_probe_ptr+0x0 (section: .data) -> watchdog_perf_hardlockup_probe (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

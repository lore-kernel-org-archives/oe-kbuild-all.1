Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1260E29B793
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 06:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770447158; cv=none; b=o19jplzaSzchf2OTm27t+veglT0T+MkY2XOD1J4HruqWS4WU3/1OAlHzCN+8z4Qgy6YH4ST5e3Y7NEDlH8QvfEZK5AmqaV3Trft5OYCUre3SXUAVdYSny4u5sKRPN56T+Cp5KjsVagA9FED6gWKssgdlQR2jGyg6wcYjXFkcr8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770447158; c=relaxed/simple;
	bh=8p+QsbP4HBg7fY/gIbyzD0L3MXt+DZaiCtVaO9cjxAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CROF3joxmILPU7YTJDguoINEdRefHiB0CwqAkfjNVsTdqvjeDjAMO1JWRvv+74e+OQ4o6WLFRQBh3BLSbHKThq/2so2SX04L79QZ6cinViMo5dZNUJjBgx7WAdm1oL7PlPklbIvQS+WAORniOCUcTZwIvnKbKf0ZIE6lMqhWTGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgHm9GPr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgHm9GPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770447157; x=1801983157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8p+QsbP4HBg7fY/gIbyzD0L3MXt+DZaiCtVaO9cjxAw=;
  b=UgHm9GPrJsQFdhx1LUkkuAIsa5r+xWGdFIKYk6knih5IiXme8GDnn+mt
   7ZHqbQvNJaYD7ZgqVO1XXDVe9MTy3XJpWn7dbystQPsCRSee38ZjoJJaI
   Gwp8dlox4J5XgPlCAPA8AJH26Eem0Zf8s7hMnDkqapjpWq91fU24n+1h3
   I+LSrf7ReYCYFC5xu6RvN1lmzkbIROe0pNorIykacwC4ZD8DkW2Voah+E
   jqeAB2olT/hvdb7YtwNQ1E1lYekbBPJOzDgx87EkKsNgibMVp3O2e4MTF
   iD/nxFYpv8tQanrzWeQPJJwWURXQbV4EkWSLYb/DrlYicAAFj1guX0u7A
   g==;
X-CSE-ConnectionGUID: zr+GRxEeQemgWl6ZzNVqfg==
X-CSE-MsgGUID: TzwibIKbSwqbI1hVSZSQfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="59213886"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="59213886"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 22:52:36 -0800
X-CSE-ConnectionGUID: TFWc4yYUSbGGi6MnNGcJ6A==
X-CSE-MsgGUID: m0ivL34rRmap+yx/e8g0eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215244450"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2026 22:52:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vocBE-00000000lT6-0rhy;
	Sat, 07 Feb 2026 06:52:32 +0000
Date: Sat, 7 Feb 2026 14:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: sunliming@linux.dev, song@kernel.org, yukuai@fnnas.com
Cc: oe-kbuild-all@lists.linux.dev, linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org, linan666@huaweicloud.com,
	sunliming <sunliming@kylinos.cn>
Subject: Re: [PATCH v2 2/3] lib/raid6: Optimizing the raid6_select_algo time
 through asynchronous processing
Message-ID: <202602071412.HND36w5Q-lkp@intel.com>
References: <20260206054341.106878-3-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206054341.106878-3-sunliming@linux.dev>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on linus/master v6.19-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunliming-linux-dev/lib-raid6-Divide-the-raid6-algorithm-selection-process-into-two-parts/20260206-134850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20260206054341.106878-3-sunliming%40linux.dev
patch subject: [PATCH v2 2/3] lib/raid6: Optimizing the raid6_select_algo time through asynchronous processing
config: arc-randconfig-001-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071412.HND36w5Q-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071412.HND36w5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071412.HND36w5Q-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: lib/raid6/raid6_pq: section mismatch in reference: raid6_exit+0x2 (section: .text) -> raid6_benchmark_work (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

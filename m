Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B63368948
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Feb 2026 05:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772256208; cv=none; b=JdYP58/OOFCOHPHXrDR2P7RKdy9R57Mc/y/LIdWNWG/E28xiptch/18UFpDBnGVqDOxbNF9sak8eBrfoslLRkROdQO2cZnSdIzHwahjsdeTQ9sn8lBZqbhCQmyrdjESSFPpNc8n3ZJRyEuis86wjQprXyR1RRWA5vGqetJm/qto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772256208; c=relaxed/simple;
	bh=mkxFIuSvUqZIvx4k/FLOk3kTUpkjeVjBp54cI70xBH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlmOIoAA5UGAfP3DGIG/tWx+6wUu58lSNjLTLETuKxCf+UYbm2C6PsG8+uIOPlDu/jXxqRku8uifQa5x4AN25Fyz9XJkW4DLd7rsJdZjlwf/yR51U62A5G9xFsbcoy0oomwNJghAaNXyhCD2Un2sM2Yr30RwxQi/5fyX/Zq06VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTzC6Xx+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTzC6Xx+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772256205; x=1803792205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mkxFIuSvUqZIvx4k/FLOk3kTUpkjeVjBp54cI70xBH8=;
  b=HTzC6Xx+MmpTJaHhxR+Il6s49yyM16VW9+N3IFn46MZFGWV00TtBodWF
   BEQw5zh1Ubb7pYA4f2JpGR3u8XTUdXm/tv54EO/o6dnpDSUftUVJ5vc1d
   J9poDZlQ+r4wvW+t3DV34b2G+R+wx8ZdnpiJGZYI5R557JoC1FfgOjJ+Z
   06mVUgCD0I3Cp95jeBmZ7JHgR2T77OhfBRNph22Eju81SNnm1WvEVc/U1
   HWORuaG7U3xzEgihV6DKp4weejfLH7f51nvw/Cjq0BTxq6zLPHWL+FGO+
   hnesu76QoLxYUQrZbzd0gr4EBpqjURWn+ScdQQ4yngkAsGzfIa0g/1YiM
   g==;
X-CSE-ConnectionGUID: A1AItkeBSNK9LlMieFCgKQ==
X-CSE-MsgGUID: 0nywIR4IQEWuUO9dif9Ssw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73244069"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="73244069"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 21:23:24 -0800
X-CSE-ConnectionGUID: OMuPZIl/REWGuPWP8IbgNw==
X-CSE-MsgGUID: bH7wsoQHSDGBIgja9OgTZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="216229646"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Feb 2026 21:23:24 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwCnR-00000000BJv-2kqX;
	Sat, 28 Feb 2026 05:23:21 +0000
Date: Sat, 28 Feb 2026 13:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Jun <chenjun102@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] fbcon: Fix out-of-bounds memory in fbcon_putcs
Message-ID: <202602281348.05dMV1Vd-lkp@intel.com>
References: <20260227144358.101173-1-chenjun102@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227144358.101173-1-chenjun102@huawei.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.0-rc1 next-20260227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Jun/fbcon-Fix-out-of-bounds-memory-in-fbcon_putcs/20260227-225307
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260227144358.101173-1-chenjun102%40huawei.com
patch subject: [RFC PATCH] fbcon: Fix out-of-bounds memory in fbcon_putcs
config: x86_64-buildonly-randconfig-005-20260228 (https://download.01.org/0day-ci/archive/20260228/202602281348.05dMV1Vd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602281348.05dMV1Vd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602281348.05dMV1Vd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_do_set_font':
>> fbcon.c:(.text+0x3655): undefined reference to `fbcon_rotate_font'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

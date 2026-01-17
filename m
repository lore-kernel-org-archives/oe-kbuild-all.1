Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9A3227B94
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 17:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768672093; cv=none; b=SSZ+CWlFi4/DIhwQR2xwK5DwWLBtBXBzuQH3s/6RyfQU4vFinh4BN4rscxymnnhZ+1uZiIFpfL64Z+9/4Vk91HOVCJo0Itl+QzLfpcBHbUnr8mp0NcxyaRbx5gNxwk7I47Ythgrkv5x4+akCR1jTyCYaW4BWouQt1tF+MT/fgvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768672093; c=relaxed/simple;
	bh=jQqYjuv4mFBqGb9tGmPhtLCdLxiqHOpFFaJbHz4JVAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0V/pEYO4kSX5aAC+OhIizKhEvREy4gkXKydGeF5E9XBtHpT+x3VG/7gEy8oqTbNEoFblIAJBTt8XUnRWgahoph6tI6JR6a+dymoL8jfOWzhpMG1q/pfcWqIPOu5VVeKOaUFuI7xSK+MAXJ/KSVaE9brj3QgTCgs791ro8Zg1ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0PG6px9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0PG6px9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768672092; x=1800208092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jQqYjuv4mFBqGb9tGmPhtLCdLxiqHOpFFaJbHz4JVAg=;
  b=V0PG6px9f95cY0GtYdtY8H080cMv+bvMF8mvHB3hdYsv2JwF1JkiZacJ
   rCyIzNW4Kg9q1aoxwPSULcGx1tllY4gNN7yIjMmqY4E7q76by1y/Cya+I
   hp9k6dsRcOqrf/lg3CnXvt9rXPfJ8ohYqhGOQHsSkCV1zdAMc7OWc4r6m
   yaQDd/SwjeT29pmvodGJ9FG70fP6YwxnA2Wocq93Mp7fyOnin3rZ6K11t
   OQsK942xopUIOL9HWEYA8+ONlc1Ae7HOsmqXobp1XCjN47LHRTZPS3FxR
   DgnDV9cQlAV1mghB7GZSEOavNCq1t+Dp4pU5HyVwOB34Wk91H/wvyB2tH
   w==;
X-CSE-ConnectionGUID: APLuSP/ESMGbylne6dACtg==
X-CSE-MsgGUID: 6dG9T4geTuGDwmr0K4G6Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="70118426"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="70118426"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 09:48:12 -0800
X-CSE-ConnectionGUID: xTeHxfv+QC+p1uM22l5CPA==
X-CSE-MsgGUID: WLTmUQlgRLettxuGAf83GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205298410"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jan 2026 09:48:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhAP9-00000000M64-3wlz;
	Sat, 17 Jan 2026 17:48:07 +0000
Date: Sun, 18 Jan 2026 01:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Xiuwei <yangxiuwei@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 2/3] bsg: add uring_cmd support to BSG generic
 layer
Message-ID: <202601180130.fyyrRaAu-lkp@intel.com>
References: <217eb9315df1a2aea32a595a12b8a5b16ba597b5.1768536312.git.yangxiuwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <217eb9315df1a2aea32a595a12b8a5b16ba597b5.1768536312.git.yangxiuwei@kylinos.cn>

Hi Yang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mkp-scsi/for-next]
[also build test ERROR on jejb-scsi/for-next axboe/for-next linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Xiuwei/bsg-add-bsg_uring_cmd-uapi-structure/20260116-123155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/217eb9315df1a2aea32a595a12b8a5b16ba597b5.1768536312.git.yangxiuwei%40kylinos.cn
patch subject: [RFC PATCH v3 2/3] bsg: add uring_cmd support to BSG generic layer
config: parisc-randconfig-002-20260117 (https://download.01.org/0day-ci/archive/20260118/202601180130.fyyrRaAu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180130.fyyrRaAu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180130.fyyrRaAu-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: block/bsg.o: in function `bsg_uring_cmd':
>> (.text+0x528): undefined reference to `scsi_bsg_uring_cmd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

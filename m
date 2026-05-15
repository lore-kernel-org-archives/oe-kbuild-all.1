Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A4B37187F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 15:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778858231; cv=none; b=l6DhhrAw6fH57s8Ov/OHrm0Z69OlaxFbk3HM9lZZG23Wy0mSVz6P+19H9VMEMiwNaarSiJ10BnB2Q21c9bTlKQ4n+bHXncj4MOf/71spukFzkdZUBGtWVndVXaJHDPlczhJDEsdlwnmLvi/VyGdeHGRCmY6WxwUed8kiFy9jVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778858231; c=relaxed/simple;
	bh=iuxKX4yA9jS3SnBKGNBWdP4pCJkdgodXaHYVrnn7UFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqtFl4vAyuz9UorZ+st7PD6Detcwckzi6PEMHKK52bRXJPm5VOH9rm0pyc5qGERr6VKalObXVbATIbAzV1Nlcz5xjdQ4U7f0rC9DPbnulRH86asdq7ldUrLLHzsZudieXPZ+hQzLFxdnCEBbydNvt6+Gl6YASicW+hMLpZNKoIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bi0gzgcR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bi0gzgcR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778858230; x=1810394230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iuxKX4yA9jS3SnBKGNBWdP4pCJkdgodXaHYVrnn7UFs=;
  b=Bi0gzgcR2gxzgc8lgy67Ci2gQlXZ5ohcSeQfXLQFuHiK1vCygKGQ6d5Q
   Kvy2PJMHca8g6omdSV9G7b8gJYCHA2hbUQquoXlAE5IYYR0vOJrZcsyGL
   96jRHcRIOtSDxozVZNEnqW91OKTpGtYFapXNQrRiXmg1whomJ2IoF2qVj
   0CF0KmuwmoFhoynmyDTU16/SPYeSEl187eAFd273kQe/8uMiiEl7wuZR5
   KMvVMiTCoPweUV/zoogYHGE7HWQaowgY+hrstYkMnuKMPRnE6DfEo2LyH
   lH98xraL1mG8qzbvjFiwT7KM2GPxJYjRBIBsZWaIUz/A6UVp3d3GZfNpu
   g==;
X-CSE-ConnectionGUID: p+b7y+RuSJu1CFc9zx4oQQ==
X-CSE-MsgGUID: t75m2GxPQaKEKOVDtrJLgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="67344653"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="67344653"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 08:17:09 -0700
X-CSE-ConnectionGUID: i7VeuLdCS+uEhRKizRAgow==
X-CSE-MsgGUID: mVgcKwmQS3WwjRt2+bvHbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="242712643"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 May 2026 08:17:06 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNuGj-0000000023F-2RlS;
	Fri, 15 May 2026 15:16:23 +0000
Date: Fri, 15 May 2026 23:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: Horst Birthelmer <horst@birthelmer.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Horst Birthelmer <hbirthelmer@ddn.com>
Subject: Re: [PATCH] dcache: add fs.dentry-limit sysctl with negative-first
 reaper
Message-ID: <202605152333.0pOd2zJR-lkp@intel.com>
References: <20260514-limit-dentries-cache-v1-1-431b9eb0c530@ddn.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-limit-dentries-cache-v1-1-431b9eb0c530@ddn.com>

Hi Horst,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5d6919055dec134de3c40167a490f33c74c12581]

url:    https://github.com/intel-lab-lkp/linux/commits/Horst-Birthelmer/dcache-add-fs-dentry-limit-sysctl-with-negative-first-reaper/20260515-154600
base:   5d6919055dec134de3c40167a490f33c74c12581
patch link:    https://lore.kernel.org/r/20260514-limit-dentries-cache-v1-1-431b9eb0c530%40ddn.com
patch subject: [PATCH] dcache: add fs.dentry-limit sysctl with negative-first reaper
config: openrisc-randconfig-r073-20260515 (https://download.01.org/0day-ci/archive/20260515/202605152333.0pOd2zJR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152333.0pOd2zJR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605152333.0pOd2zJR-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/dcache.c: In function 'dentry_limit_worker_fn':
>> fs/dcache.c:1474:7: error: implicit declaration of function 'get_nr_dentry'; did you mean 'retain_dentry'? [-Werror=implicit-function-declaration]
    1474 |  nr = get_nr_dentry();
         |       ^~~~~~~~~~~~~
         |       retain_dentry
   cc1: some warnings being treated as errors


vim +1474 fs/dcache.c

  1463	
  1464	static void dentry_limit_worker_fn(struct work_struct *work)
  1465	{
  1466		struct dentry_limit_ctx ctx;
  1467		unsigned long limit = READ_ONCE(sysctl_dentry_limit);
  1468		unsigned int ms;
  1469		long nr;
  1470	
  1471		if (!limit)
  1472			return;
  1473	
> 1474		nr = get_nr_dentry();
  1475		if (nr <= (long)limit)
  1476			return;
  1477	
  1478		ctx.over = nr - (long)limit;
  1479	
  1480		/* Phase 1: drain negative dentries across every superblock. */
  1481		ctx.isolate = dentry_lru_isolate_negative;
  1482		iterate_supers(dentry_limit_prune_sb, &ctx);
  1483	
  1484		/* Phase 2: still over? Apply the ordinary LRU policy. */
  1485		if (ctx.over > 0) {
  1486			ctx.isolate = dentry_lru_isolate;
  1487			iterate_supers(dentry_limit_prune_sb, &ctx);
  1488		}
  1489	
  1490		/*
  1491		 * Re-arm while still above the limit. Re-read the sysctls in
  1492		 * case the admin raised the cap or disabled the feature during
  1493		 * the walk.
  1494		 */
  1495		limit = READ_ONCE(sysctl_dentry_limit);
  1496		if (!limit || get_nr_dentry() <= (long)limit)
  1497			return;
  1498	
  1499		ms = READ_ONCE(sysctl_dentry_limit_interval_ms);
  1500		queue_delayed_work(system_unbound_wq, &dentry_limit_work,
  1501				   msecs_to_jiffies(ms));
  1502	}
  1503	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

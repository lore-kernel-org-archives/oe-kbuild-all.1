Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A893B6363
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278794; cv=none; b=dPZwZX6umwaDi/zUGSSpVytQnNOB/RE9Fo9ffxxUYEW+ntjQwV4hsOFlPYQ6kZIJ+DRo8hd1pORIojkRJT9ktpQyio7S820mtd6PFNNBGw/C7VBqIFFqIF+8GlbdaR5J1lI5esmDbg0lk7W45TtaUeqJckXqxqLJ+LeHtkVH2vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278794; c=relaxed/simple;
	bh=2+gH9APRNX+3Ob8jqA/zpvpm1qi4gqLKK6cs/fc/YQY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mkbluDkaG5Gm1SLUPQdUMk4LmB+vU9y6hDcsgYU2RWm7K93Zo7YZ3EVR7am5gpjitNQydV2Z2KIuJnAgcTfaJo+j8z4s8ch6iI/9CEWRzrMJ8h2iSUny3v6HOCe3o8OcWRsIeu9FQIRgdXenuyRlyEgnSJFODsnK9i4kxvpAQpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yzl281/V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yzl281/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774278792; x=1805814792;
  h=date:from:to:cc:subject:message-id;
  bh=2+gH9APRNX+3Ob8jqA/zpvpm1qi4gqLKK6cs/fc/YQY=;
  b=Yzl281/VrhuSZW8kv1tky4Cc45PJkShlslclsq7ihRVUwWSR5VSCOAC2
   3JPS0ttycdcA4HN0BsxC9hwdxRchqxUu/PdN+O+NueTRJ33+kE5d0jN8+
   a2rL/zVcK2pGGvbARB4qyaSFt4ZNOL9YsLmlzUpugEUV762Gf/WKzxvFc
   ibc67Mx3qTg/+nBlnufJsRKAl9hUdYxn1ThvoD9yTAMOABcyGrFYiqfsA
   WK5wZcEXoD3RgoWzkw6/AIY0ix90z+3PeeNbxLtqEpVrr7CO0Ldyjs6pm
   eedfPzy1y3/V6pj8kBzfb2FaPciITtbdP02733pm6qca5+fTNA9kUDozU
   g==;
X-CSE-ConnectionGUID: K0OJC+uvTHC4GCuOciCDYA==
X-CSE-MsgGUID: iBwhIzVqShmwCwP88O9yKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="97898786"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="97898786"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 08:13:12 -0700
X-CSE-ConnectionGUID: jU/yviJZQEicINqmr4m0bg==
X-CSE-MsgGUID: H/nSozjgQH6z38j/o6hTAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228782859"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2026 08:13:11 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4gxo-000000001hj-4B0I;
	Mon, 23 Mar 2026 15:13:08 +0000
Date: Mon, 23 Mar 2026 23:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 36/36]
 drivers/base/power/wakeup.c:1219:5: warning: no previous prototype for
 'wakeup_sources_stats_open'
Message-ID: <202603232346.PjsWu9AC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   b98cfc3cd4ab26abf9d75eaa32b740007d196796
commit: 5df128deb8f2e04a46acb77df6aec44b1d343583 [36/36] ANDROID: Allow vendor modules to get wakeup sources data.
config: x86_64-buildonly-randconfig-003-20260323 (https://download.01.org/0day-ci/archive/20260323/202603232346.PjsWu9AC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603232346.PjsWu9AC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603232346.PjsWu9AC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/wakeup.c:1219:5: warning: no previous prototype for 'wakeup_sources_stats_open' [-Wmissing-prototypes]
    1219 | int wakeup_sources_stats_open(struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/wakeup_sources_stats_open +1219 drivers/base/power/wakeup.c

  1218	
> 1219	int wakeup_sources_stats_open(struct inode *inode, struct file *file)
  1220	{
  1221		return seq_open_private(file, &wakeup_sources_stats_seq_ops, sizeof(int));
  1222	}
  1223	EXPORT_SYMBOL_GPL(wakeup_sources_stats_open);
  1224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

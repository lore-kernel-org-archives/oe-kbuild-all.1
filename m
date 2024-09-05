Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4E35381B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725558866; cv=none; b=bihYza3RC2y74MJ7xgBu7POgRHihx5IDlrIiBquypJFnnypHybi3j1f+1p0D/5KuMrMXo95ePegXjFRYQNQ7vxHFYJf7hVPUt/Nbo/BEo+ZplQ09WuG1UL2NWkwiLtxkDZ2x8EOjAgb7nqtXFdTGCHZuiI0KwEzx70OaeFkuXY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725558866; c=relaxed/simple;
	bh=RN67M3eoTGR/9SB0vczspXZelgyK5xsMT7zDEgGEOWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fi4pEqy/TbF5vAjXmOOkwxcwTFfOas5WmPTnl+/KkZcD6+9K8YbdxEQbDvd5LuSvhlktdiDLQ8UWlrEHK/PnQX3acQBEGXwhKf2PrroVjF4YrzHId2H8pxnA6uHao1b8izR6FFPIbSUCPQeSIE+4JF+AL3guXXu8+RVI9m9GgLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NT8O9rly; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NT8O9rly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725558865; x=1757094865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RN67M3eoTGR/9SB0vczspXZelgyK5xsMT7zDEgGEOWc=;
  b=NT8O9rly2z6RUO8cb/jVrtbxbaK3OqP7sL9YtS8LuodS/t6nR47O/oib
   314OCsT2ch46OI9cD8eOn5dFVNDdxowQ2J9cu+/9Xdv6ns6ORul50DYxz
   BsS1nRG2QSjiltX4NxqNamlWJphhaksHAYdA+NameZmBQOXYCL+HtLqmD
   NEU7k1UEepyTrJuhO+AA1NLc4U/eTu3SKZGGtUEw9q+8wivIpUfcrWCLA
   6XvKyYpqgCRBlWKp6knjCpUWJ/xcyQ3mAt1peF7srOi/Z0i7Op8OJumLn
   1GWkgzBbJcnIdk6Y1sush+RBBtshuJgBGn6NC2qFNHTLzZO6r9Yex2g0I
   w==;
X-CSE-ConnectionGUID: uUQUwb2kS3qRfe+plEXYjQ==
X-CSE-MsgGUID: ybqabjllTgKTqlZ+/vRzcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="41801061"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="41801061"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 10:54:23 -0700
X-CSE-ConnectionGUID: KjNWhKJNTR2ZxX3HRhqWHg==
X-CSE-MsgGUID: hziLlVwCQ+q2+Rm0vejFTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65348423"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Sep 2024 10:54:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smGgW-000AC9-1L;
	Thu, 05 Sep 2024 17:54:20 +0000
Date: Fri, 6 Sep 2024 01:54:16 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [linux-next:master 8141/9692] ERROR: modpost:
 "devm_imx_drm_legacy_bridge" [drivers/gpu/drm/imx/ipuv3/parallel-display.ko]
 undefined!
Message-ID: <202409060118.z8BxMg7Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ad40aff1edffeccc412cde93894196dca7bc739e
commit: f94b9707a1c91292c32f82847aa00d66472c0c62 [8141/9692] drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector
config: parisc-randconfig-c031-20220820 (https://download.01.org/0day-ci/archive/20240906/202409060118.z8BxMg7Z-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060118.z8BxMg7Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409060118.z8BxMg7Z-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
>> ERROR: modpost: "devm_imx_drm_legacy_bridge" [drivers/gpu/drm/imx/ipuv3/parallel-display.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

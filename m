Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F25205AB8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740474028; cv=none; b=hlD3TdiFLVuAR391++5gfH7Y7EQwJmvBW5JUtrGXA8TPNOYZqWHS3SYtUJI+iAb9COdDje+uiSWBlN9V7A5WNT4efUxP1HHi3zjAuDumLl32LAwpTZsqT5+L1dexxc5ikBQ3BPiFr2TNY/8zTdTNCWZmk9/DAUomvV5YtMR1KGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740474028; c=relaxed/simple;
	bh=Tq1Mifxt8OWkH33zXBdBtVyKGliaEpDHhAHDLssRYds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rM14iV60cSEqwQT2kcMwlXb79d4nIgEDfEIeyv+HREFzxFIHYCtBCb/gHs6xdllmiPAumfxdzww4ggGTHjV4LvajPkx7AouWIt6kMEB1xedK6Tr7d/wXZ/VDcE0qNw7HmHImaS7+37glU9U0WEgGT5Z2v/iuTmpZuIsPkG8AbPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3jZDqpK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3jZDqpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740474027; x=1772010027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tq1Mifxt8OWkH33zXBdBtVyKGliaEpDHhAHDLssRYds=;
  b=P3jZDqpKg8SvaPe3caxe0Jn7sUuxt2YajYAS0BuK7e+Dn5tFCjwnOeZL
   7182KQ0PFXwgdxGKOKzF5Umn6sNoRZt7U6R10A/fpY8iaxleyNWKWjSQA
   hAZJ5bb3Sj+qbFE86fZhzfNskpjnuXA/Ea8jDgIalyNL96m3LfP574LnG
   trWqvLALv+CY1tvopZB+GLoJuvrK7b5Hw1QZYAT+HWCJ/LoBSA8+zBjr+
   q58ExgswAULzLi0vyFVJYPOQCc0Xioq+XxbELKuhwZz6IOK7vuPP8akLK
   63BcUfy8Bk65afXeGrOIYDBevHwXs/3Kq5BTg+AUYAVJtZl2apnmnt7Wb
   A==;
X-CSE-ConnectionGUID: 88xo4+ovR7KC2KKVMtVQTw==
X-CSE-MsgGUID: 2wbGVTKwSlaD8PGXDrPdKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44092084"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="44092084"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 01:00:26 -0800
X-CSE-ConnectionGUID: BQZ3zD8RQ6GuvOLde9vQqg==
X-CSE-MsgGUID: TOpiFn+ARA6XWyCOU65gPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="120947354"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Feb 2025 01:00:25 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmqnf-0009yR-0z;
	Tue, 25 Feb 2025 09:00:23 +0000
Date: Tue, 25 Feb 2025 16:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:microq 1/1] build_policy.c:undefined reference to
 `__divdi3'
Message-ID: <202502251650.0Kw4okHM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux microq
head:   00a569cb6069576a53081ef9112cf361497c009b
commit: 00a569cb6069576a53081ef9112cf361497c009b [1/1] sched: Add micro quanta scheduling class
config: i386-buildonly-randconfig-005-20250225 (https://download.01.org/0day-ci/archive/20250225/202502251650.0Kw4okHM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502251650.0Kw4okHM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251650.0Kw4okHM-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/sched/build_policy.o: in function `account_microq_bandwidth':
>> build_policy.c:(.text+0x16fa): undefined reference to `__divdi3'
   ld: kernel/sched/build_policy.o: in function `sched_microq_period_timer':
>> build_policy.c:(.text+0xda5a): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

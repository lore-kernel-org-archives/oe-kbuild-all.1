Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB7E7E101
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721299797; cv=none; b=VOCSawveVobgYuPj+1qw9QOdYphjQ3zOruO/3m0WJi/a66r37HMiruKmLylqtGOjDfOlZjALFhTPAuyKFrYBDuZmRkuLPgBZU6XQUPetoHjO3dU8mtaAXYlM7sKZzULdocgUem/zlg6QfG8Xcy9JZGJveZ9HX0PDDI0+N1oajE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721299797; c=relaxed/simple;
	bh=evJna2kJ3mDUp/ZcDxK9Q2FgMmUHBkDpAweXwKsD08U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r+Mp0ZMyhzfanz5GHpnvMCFDaYHS03QvEv2UqbjI4cOB9c8MfWoukoH4UFIWCZTJYLhBsxJzsxG5tkwllM3inwWqoGx6nJAgRV07LexSpFlVM8rn5RCEp1srVoPfCuzwcHeNPdPgd6tMAhfxCrRvByjVN0G/m+ZUlk6C6swIN1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UW2/T0iW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UW2/T0iW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721299796; x=1752835796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=evJna2kJ3mDUp/ZcDxK9Q2FgMmUHBkDpAweXwKsD08U=;
  b=UW2/T0iWeyLieNL5+AuR2dyhf1KqD05eoCSHykODz0xMUTSUwsbtUQqp
   FKum2ELzxQ9N7j9QPoSheKgTZNPSWpLg547Sx62pozI77JhML9LQnpSX4
   xcaiNNTOSxzp5HbCQOlvMoUrmoaLFRiG3FSj6AlhzPZzdIw3xk/V+8/2Q
   72uESQ7gQcUTO5wVjMTtplPpgt4NErPYIgySheFsIm/DbIzsiMKd4Tkrz
   EJ7XEuVLmOiCsSmbZRLT5F+lu0Knkoj2DppGfb0AiGmai3v5jgK0vamA2
   2z+VvB0P6xl2++RfYUTMT5j909Mwo7IYzyrHlbtUGR+xn8sRXGKhtVUZT
   A==;
X-CSE-ConnectionGUID: TD/fw/PLT/6bPxqgdN0RAA==
X-CSE-MsgGUID: 3iGBCgcNRj+p3fHfEEBxuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18474532"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="18474532"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 03:49:36 -0700
X-CSE-ConnectionGUID: vrzajB8bRPm5u7zejFlI5Q==
X-CSE-MsgGUID: R84AHYFzTMad73wF2ZD1Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="73955616"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jul 2024 03:49:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUOhZ-000hAe-0C;
	Thu, 18 Jul 2024 10:49:33 +0000
Date: Thu, 18 Jul 2024 18:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 14/64]
 drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c:38:5: sparse: sparse: symbol
 'pl011_hyp_init' was not declared. Should it be static?
Message-ID: <202407181816.QYQuYea0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   dd2c5eb5fb46ea911770ba40bff299c8e6ad73da
commit: 069b706b122edd75104eae172b165047a1900935 [14/64] ANDROID: drivers: misc: Add an example pl011 driver for pKVM
config: arm64-randconfig-r113-20240716 (https://download.01.org/0day-ci/archive/20240718/202407181816.QYQuYea0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240718/202407181816.QYQuYea0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181816.QYQuYea0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c:38:5: sparse: sparse: symbol 'pl011_hyp_init' was not declared. Should it be static?

vim +/pl011_hyp_init +38 drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c

    37	
  > 38	int pl011_hyp_init(const struct pkvm_module_ops *ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

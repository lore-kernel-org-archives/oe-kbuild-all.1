Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3E81EE7C6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 00:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746838459; cv=none; b=gk8UPPJnIQHdCjJG/EpwnCYCuqtP2BhqcAunqwLgqDHZX20vf5xgrpsUq+NsMgSfFvNhzVwCb7mASHyQNDood/c+jQarinIfb4itfMEV+AX+3x1IELxhKpIVqDbOPkVtLyFeNY6IHBd41OXqxhnjlsoUp4IPZmUUWoiSY4046b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746838459; c=relaxed/simple;
	bh=rqhdLqJXHkTyTk517Ns99RkGcKXD/auJpwAceuzjnIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sd/DUHgUP8iGdxHqop63mIK2K4WaGX0fKvbIkW0VdeNi0MKKj6t69Q4uAX+gjm9Scj6BJWSA9alTGrd9PQICfK+tp9rivoRHTvHC36xYmX1BAEhae2vi5wA34ccDm6ZXa763F5+C27E8v/qL3mMDf03Ozg64+HshLiSQxLoNnWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYDzMlnL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYDzMlnL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746838457; x=1778374457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rqhdLqJXHkTyTk517Ns99RkGcKXD/auJpwAceuzjnIo=;
  b=HYDzMlnL3obIQ53u+Ij+mRfUDoZioCBSI4agHo2wnP3S+IWiefp/Mrkc
   /VFS+IBjUmVG1jYvewJJtCTANwdOQBD9gPGlsRsIfer+sdyEQseXEwy5r
   MMHTvcRXt1phVWI42Z/Dd4VQoSGeO1VK5mJRjNK+iVn0RmXc2n/YIorLa
   0Di1hAbwHGCdQfHOjzjl/fAVT0jOeaBqTRf20QtMFp5TmZbNBiKoAH+IZ
   ys176LhKvOMoiyIUKre0MkyEv0uzRfH/yqBdKAOG2xwqdXjVvEzm/U6r6
   JTtsbdaFxuREnkTIR1d5gUAE1j/nlj5eGc7HiqCsxRc19g8IGA5d7nLRX
   g==;
X-CSE-ConnectionGUID: sbqNlENLSWyFBJWKir9/kw==
X-CSE-MsgGUID: Eh9VLdUNQFybz7ybRs+dQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47934245"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="47934245"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 17:54:17 -0700
X-CSE-ConnectionGUID: JNaqQlDNTO+NDt2rvpU7/g==
X-CSE-MsgGUID: uISfhtXpReWWAjtyAUxxCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137269829"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2025 17:54:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDYTl-000Cc7-28;
	Sat, 10 May 2025 00:54:13 +0000
Date: Sat, 10 May 2025 08:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2218/2218] kismet: WARNING: unmet direct
 dependencies detected for ARM64_ERRATUM_845719 when selected by ARCH_MXC
Message-ID: <202505100830.TI8oJiuj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   eb29ec38301f3cfe72a33627aef774ac499803cb
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [2218/2218] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-kismet-CONFIG_ARM64_ERRATUM_845719-CONFIG_ARCH_MXC-0-0 (https://download.01.org/0day-ci/archive/20250510/202505100830.TI8oJiuj-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250510/202505100830.TI8oJiuj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100830.TI8oJiuj-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719 when selected by ARCH_MXC
   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
     Depends on [n]: AARCH32_EL0 [=n]
     Selected by [y]:
     - ARCH_MXC [=y] && ARCH_NXP [=y] && COMPAT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

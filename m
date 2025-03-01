Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15331192B84
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 02:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740794409; cv=none; b=PD3cdvlifznnnUeiLXypKMB8b+ME05BNVSUVYaCnO5x7N4lPuG6JTTK71XoPIUIOBhqrHYDAv7hcglfTHCcnZZyGf8OAfWDOTnREr+w1EAhFkUz6o96K2BA0q0iZM5E33qNkOMr7NLVbXhKEyOKQEuzcC2z8wB2lGAlF0+QNIAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740794409; c=relaxed/simple;
	bh=3rVKTn9Lo72VRyzGqIdvDGx0fFP2S8YqjKnP3uQ0mD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BHKH2trDHQ9LSRtIKLCVwb6D6QauWpxNwW37J7g1FXdLeQFyZgtdfDcFkjs5cdxRGGTunWFj0uQEt+is06gks0ciWhBkSR8NGolxoFlI44J4brIniTMzkVsIx9r+uIv+NQUKtjKbIyC9t9pl3G0UhTlnczg+JG7PhI+C39HpTW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYHG36GA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYHG36GA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740794406; x=1772330406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3rVKTn9Lo72VRyzGqIdvDGx0fFP2S8YqjKnP3uQ0mD0=;
  b=YYHG36GAiOEt+tYQU7GCpAJvR5RpVbMkBwFCE/tKbfcbfuYbdpjAX1+K
   vfSg2Wj+xVo3MWmpzhe1e3oC2sZdbaX4AqpinAF+LisPfcQuXAEyfgFty
   kFuvRegWjl5Jyya6w2y2mpllc8865FF9R+I+/q1VfjAoo7AvXyywiXj0j
   OtGiWxMyYETJ3EZeqaPhLHKPcHm89ARg9YaxM1iLzZzgQMOq0wJIW5iz5
   Jtm05eLSC6qZca7SN+vIKtFF9o2wjnIhmAqVIfFVx4c8mJk7TuaxX7G43
   U32KPqc+ArZQm3A8IRFjH5a2ODp0tGELP9ozLZoma8sNRYnJSG+TERu0E
   Q==;
X-CSE-ConnectionGUID: xHBbLkZDSqO1oYSxuoU74w==
X-CSE-MsgGUID: nomXUIysSOudfPy+N0zNBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41583005"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="41583005"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 18:00:05 -0800
X-CSE-ConnectionGUID: OGucqvyDQVyR1jt5Cghstg==
X-CSE-MsgGUID: AyL7SPdoSn6YUjgGsSOJ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="117277541"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Feb 2025 17:59:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toC8I-000Fjd-2M;
	Sat, 01 Mar 2025 01:59:39 +0000
Date: Sat, 1 Mar 2025 09:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: kismet: WARNING: unmet direct dependencies detected for HUGETLBFS
 when selected by PPC_8xx
Message-ID: <202503010944.5eKUTSGt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   276f98efb64a2c31c099465ace78d3054c662a0f
commit: f8142cf94d4737ea0c3baffb3b9bad8addcb9b6b hugetlb: make hugetlb depends on SYSFS or SYSCTL
date:   2 years, 6 months ago
config: powerpc-kismet-CONFIG_HUGETLBFS-CONFIG_PPC_8xx-0-0 (https://download.01.org/0day-ci/archive/20250301/202503010944.5eKUTSGt-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250301/202503010944.5eKUTSGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503010944.5eKUTSGt-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HUGETLBFS when selected by PPC_8xx
   WARNING: unmet direct dependencies detected for HUGETLBFS
     Depends on [n]: (X86 || IA64 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
     Selected by [y]:
     - PPC_8xx [=y] && <choice>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

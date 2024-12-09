Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BC741A8F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 03:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733716327; cv=none; b=nGzaUhAI4Filq8CNF7ZRiEFqzKtfcrVDpyC6ZzXfHKUNAQRXmKrTnTfk7NB5kSmgdW8PSgb6xSJCX/ZYvjjW8+dhNfizxNEPDdTRZFKdAdxtXsUCNbjM474OH8ZA+OS3Dk7hj9u2KPohflbh5OiQcNlghlnAzVJ2JpMckzFR9hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733716327; c=relaxed/simple;
	bh=Fr3yASwmzec6lHkUzFNFx5jV7QsvoUOqoMzS6NGjHcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kDxIaG7NFD/x4AiNGG4WrViiwzynMTWo4CaieMcN3kE+pSlsPRIRfMPlz6anwifmzDmHcN01Z7Ems+rs7rF012yjafpf6rLWsbhNr242EySUEFMwGS13EfHDfIwCN9hiT+wgDrJJfl9kNYodya+q85oYRMOcfOQ+kyZ+YtZzOYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gakdu6dO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gakdu6dO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733716326; x=1765252326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fr3yASwmzec6lHkUzFNFx5jV7QsvoUOqoMzS6NGjHcg=;
  b=Gakdu6dOiBEnsMVoSqTSuYCRhdPxymMNmKAAb9ci6mNdmwTaZBX9w1ak
   obAbeRrRGuE+Lh5IvYGhWPB/g9p+SNEdXAJxDNPn1OI2SwnZUGVO5xxof
   m3lgCQMwlCYEqH5C/Yf19eBsWKo/3Qa/MLkWy6C6ep7BE659KvyDPTDv6
   IiEuf450pUSzsIishCSUJSlFXx4pNGLBD/1UjaVZevfsq3amc7ybt8lie
   5zuhcHo8/e1BMZVohcHY/MkWICzlQ93v2/RcswuDiuytl1fq0o+aLiulR
   9lLJT8/drRUt5prR/jm9nFwGE+sajy/oYkBGbfOaaFonmbF+pNucXiBWw
   w==;
X-CSE-ConnectionGUID: PgnSn3EnTy6ymmLxc6y3qg==
X-CSE-MsgGUID: biZieY+IRzaCvlAguwjU+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37928646"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37928646"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 19:52:04 -0800
X-CSE-ConnectionGUID: J0/Q29VAS8SM2dF7RVo4yA==
X-CSE-MsgGUID: TuZpi7lFRUuWUWNs46z4aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99898166"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Dec 2024 19:52:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUoS-0003kt-1A;
	Mon, 09 Dec 2024 03:52:00 +0000
Date: Mon, 9 Dec 2024 11:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 73/1491] make[7]: *** No
 rule to make target 'drivers/gpu/drm/panel/panel-himax-hx83112a.o', needed
 by 'drivers/gpu/drm/panel/modules.order'.
Message-ID: <202412070846.bk78sa2r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 5231012766cc9828fd7af0e87d481f5e95599e26 [73/1491] BACKPORT: FROMGIT: drm/panel: himax-hx83102: Break out as separate driver
config: arm64-randconfig-003-20241207 (https://download.01.org/0day-ci/archive/20241207/202412070846.bk78sa2r-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070846.bk78sa2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070846.bk78sa2r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[7]: *** No rule to make target 'drivers/gpu/drm/panel/panel-himax-hx83112a.o', needed by 'drivers/gpu/drm/panel/modules.order'.
   make[7]: Target 'drivers/gpu/drm/panel/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

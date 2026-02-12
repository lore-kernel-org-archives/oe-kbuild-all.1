Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8B3285058
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 17:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770915603; cv=none; b=U7ZXPCUYZwKl4dA5Ydmq3Gj7jAbdOXRP3cAqgKMDEtzAnpn21IT2M2dGw9SdFP87rcyfvZBdu1nx1xinPOmsPrY4tZfxelDw+CEzC/OUkfc+bXM6phAzP/oTlNMe1jveX4arj4NSbwhn+7XH7JdJ6xkKq8UTYBNGeDtNqLamSPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770915603; c=relaxed/simple;
	bh=vRYPZp7dhIffUlZGBewZ3dQDal6YgBAa+0yCHEjTVM4=;
	h=Date:From:Cc:Subject:Message-ID; b=ZE8G7vvRlUt4PjIdVwSJjq67vvElkwu+HLbYBWyZjd4MfMyF5lMKLrwV/c5nmkjN5LbgBz5BHbJvr3SUrYscd5U+dkGG3xuEkHRVnnMCnZe3mEE+w531TpjqSZRr3hf+c7RsWuSQ4E3ZV25MvPizTp7Nt5inhrp9TmXsN7AAfpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TiiLnZnf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TiiLnZnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770915601; x=1802451601;
  h=date:from:cc:subject:message-id;
  bh=vRYPZp7dhIffUlZGBewZ3dQDal6YgBAa+0yCHEjTVM4=;
  b=TiiLnZnfTZRhx8iEHE/x33gYhKhDmecJNqAEmFxzSWw+X9Db3i7qNr0L
   giwaU5gwsjQanEgMgbdi/PxFzObwcJ8XWssChTErLw7ziyW9z9Abui1ys
   2mb7CLUOiTu+XHRwHmS6h0eI6A1ZSS5G9UOJrKzJ+fsPJcCO4VDz6OL/F
   KBz9sPT4SSJGtbgofYV+pXRqjdaUdZ56iC4WKeGyqLLmuMB9xMScn6rTh
   1hIov5+CkgoXVGs18bct8WjnDRP4s7bwzCvgPLe63KvOUnPH8/7GXg2Nd
   M9udWmw5Clb15lh+km42nV8oWNVrGUwdd8wihDMVAzB49uAuuiX6ZM1kz
   w==;
X-CSE-ConnectionGUID: x6q4Z5xDQw+QA899K0gUVw==
X-CSE-MsgGUID: dYgf9HwKQQeZSKTKzS+WfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="75937207"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="75937207"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 09:00:00 -0800
X-CSE-ConnectionGUID: oijP2N/wSLeQUq70i95KdA==
X-CSE-MsgGUID: fr2LNKJARUWAg6FWQlpnxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="216818923"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Feb 2026 08:59:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqa2m-00000000rnC-0dSI;
	Thu, 12 Feb 2026 16:59:56 +0000
Date: Fri, 13 Feb 2026 00:59:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Riana Tauro <riana.tauro@intel.com>
Subject: ld.lld: error: undefined symbol:
 xe_configfs_get_psmi_enabled
Message-ID: <202602130022.hA5x2ikt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lucas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   37a93dd5c49b5fda807fd204edf2547c3493319c
commit: afe902848b417da81f60b3d15cbae40a67286dbf drm/xe/configfs: Allow to enable PSMI
date:   6 months ago
config: x86_64-randconfig-r052-20260212 (https://download.01.org/0day-ci/archive/20260213/202602130022.hA5x2ikt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130022.hA5x2ikt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130022.hA5x2ikt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xe_configfs_get_psmi_enabled
   >>> referenced by xe_guc.c:91 (drivers/gpu/drm/xe/xe_guc.c:91)
   >>>               vmlinux.o:(xe_guc_init_post_hwconfig)
   >>> referenced by xe_psmi.c:36 (drivers/gpu/drm/xe/xe_psmi.c:36)
   >>>               vmlinux.o:(xe_psmi_debugfs_register)
   >>> referenced by xe_psmi.c:36 (drivers/gpu/drm/xe/xe_psmi.c:36)
   >>>               vmlinux.o:(xe_psmi_init)
   >>> referenced 1 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

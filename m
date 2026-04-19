Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2062AD10
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Apr 2026 00:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776557759; cv=none; b=nN8hbZC23s2Ofxaz6CjivlVY2e3EZSkK2fT+6emQJKdXO88w/dvEOAUt9OhgJv0I/maqIRXKQXuu/8oNu5CEMQgjiZ0zMqXCQOQms/CvrutMH5bUT7yRvhjJqPOubTa1MWZ9PbE76gD/a5ChUvjD6b8etLnqSYoODWPzVzCKCPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776557759; c=relaxed/simple;
	bh=0f831QMgV5m08OSru3grZxpQxwfcHwj2qjqR7bdSiIc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WBP5fOLn7rI8jT2sNs9MmuWzD2IQE/QiIwc1rpsf3t1QO4xcZBWsRur8B7JRxEjj01Ia0n4DRK6u7vG1tggtjGPrPqEcCUwdQpkBJXNnWQ/hqDNLa1Tpb7bWEWv5QlYA8BL1FQMNJUiQtISFfX5WucY3vies9LfU9JZ0U+mCpB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDOhxS/+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDOhxS/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776557757; x=1808093757;
  h=date:from:to:cc:subject:message-id;
  bh=0f831QMgV5m08OSru3grZxpQxwfcHwj2qjqR7bdSiIc=;
  b=kDOhxS/+8N3dglf9KDneYXjaHCJT0yijx0MkN1cyiSLWN4WnyHKnjPcs
   7a8qobVDYb4nAHiUAWl1Vgy7md8h55MvvzN3KY8VBDhD+kPljTRnw+UwY
   boL9NaT11Dfef6rP69Paw9TbWlOyp1qBZSjCDKYu+jNduwtohLIyaofFQ
   7R7KXmKFArf2ML9QV+Mw+KcNFJpQCeg57sboG72NOz/dcA6AfS/eu/MsT
   HTOU0IVKyKkIa0UBUEmCUo8kVyAPq7qCu/GwGoF772EgGqHu38cvmdhAx
   IFcCrb/esurrWEnB7Cmj+IhjOiKoLtPvBKY1SJBjOKRThmL8aazssSyn7
   w==;
X-CSE-ConnectionGUID: WnBOzg6PSsC//87OxpVMoQ==
X-CSE-MsgGUID: Vfj+eU0jRe6hYcqwzR/uyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77228042"
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="77228042"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 17:15:57 -0700
X-CSE-ConnectionGUID: oZmluQoeQFqEjC7wu6zylQ==
X-CSE-MsgGUID: j/9mLiTdRjmddm3ESwgxkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="224868987"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Apr 2026 17:15:55 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEFpJ-000000001bs-0Pex;
	Sun, 19 Apr 2026 00:15:53 +0000
Date: Sun, 19 Apr 2026 08:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Linus Walleij <linusw@kernel.org>
Subject: [drm-misc:drm-misc-next 16/19] Warning:
 drivers/gpu/drm/drm_panel.c:119 function parameter 'dev' not described in
 'devm_drm_panel_add'
Message-ID: <202604190843.wiFWsofZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   17394e05b295e4936e0ed50d2f02ed7f08fd4f7d
commit: e43a8e3ad8fa3c2c2220a06fa46545c7ff82a9b7 [16/19] drm/panel: add devm_drm_panel_add() helper
config: openrisc-randconfig-r071-20260419 (https://download.01.org/0day-ci/archive/20260419/202604190843.wiFWsofZ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9007-gcf3ea02b
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260419/202604190843.wiFWsofZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604190843.wiFWsofZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_panel.c:119 function parameter 'dev' not described in 'devm_drm_panel_add'
>> Warning: drivers/gpu/drm/drm_panel.c:119 function parameter 'dev' not described in 'devm_drm_panel_add'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

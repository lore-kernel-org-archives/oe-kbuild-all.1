Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1D92C3276
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 20:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766004076; cv=none; b=N6v2z7V7JKUjXplj6+ak4DmCA/IExapsINjCqxCnLIUov28Fvk0PAhB8fdB8UGjtJdTsWbR6FMEL12QWoHEy3sGPDYEUFLbKKn82GyaqaxPg+4NFUBkBfmpzlrHsz4IbAgO//BbdGfkS3JfSYwz8inBCYuRLvR0qoNcC4lINzpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766004076; c=relaxed/simple;
	bh=YCbp77U0daX8btDw+blv2sBwriGYnVgVewRtbaktnuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VdWS6ZvioCrLoz+G9vWvgpENXdaDi74ty9HvJdyfJwKgL7MeQ3MIz/ARir4bgwArl7wTvMxfOtDRQbjZpEpg5zIhCdWsugS4eVpiNL6SEsIWKLSklQ3nOCvKG4bYqJUlCkRMNzVDPBjJ+K8/988pl95LbHFEzN7pXhQ5j9OtCM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V64RGANf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V64RGANf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766004074; x=1797540074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YCbp77U0daX8btDw+blv2sBwriGYnVgVewRtbaktnuQ=;
  b=V64RGANfjpDd+n119/3aIfG7lqYe1FeHQ/X69pzBqDulRF7PeY81He6N
   swnTFCPgTnV9aAWfAAInYL+QACjZppZlzWTQ+w1bVDSosUYXLinWpEZAV
   pe8q2jpLmGEJInigqHbM9Bbl7vgyFf65E6nq8bFCeKQFHTpdaLU/TQrBP
   HMPQcSsOyOARktSU5QPoktNAgRRZNnRZUkMAunSZc4rX/is1ibWnuYKl6
   UE0uWqtss8OnBBuV6b6yMOVdwf4PMNM1blaYGLnKiIuSolD1axUnCTiae
   uLW61JmeNGtDYfw0f0v7/aRVmBMMT581iGmRNgM4HQ8Lxk3G6N/eV8FaR
   w==;
X-CSE-ConnectionGUID: +XWjZx1xTSeF2hq3ytq+RQ==
X-CSE-MsgGUID: IYvTyVUUQXO12bOJD5+vug==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67844844"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67844844"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 12:41:13 -0800
X-CSE-ConnectionGUID: 4C+bjDDHQOKp1rfXsg7pfg==
X-CSE-MsgGUID: z6irZ2V+SB+BlHNvwV9MTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="203492267"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Dec 2025 12:41:12 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVyKb-000000001E9-3jOu;
	Wed, 17 Dec 2025 20:41:09 +0000
Date: Thu, 18 Dec 2025 04:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1945/1945] drivers/ssb/main.o: warning:
 objtool: missing symbol for section .exit.text
Message-ID: <202512180405.asM9sTF4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: b8b6069cf2087545fe53ec920e8353133e9a70bf [1945/1945] ssb: Remove home-grown printk wrappers
config: x86_64-buildonly-randconfig-001-20251217 (https://download.01.org/0day-ci/archive/20251218/202512180405.asM9sTF4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180405.asM9sTF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180405.asM9sTF4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ssb/main.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCA617575
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707129387; cv=none; b=nrevXesCPj2l+jACjsSPttBH+cOeryq7vQ7m8jSc5+CgdG6/1PDUQFOaBOtAXtMvN9goQDgiPVWTtd235ZMVrSN0a1Wk1CLqNVuU1PHTKNkClpmzALo2jztGUhctK5kkyCWQC3vZE9qHENAeQrSSW6Gm6ori226bgWlyVsWbvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707129387; c=relaxed/simple;
	bh=x4PTHOfkEbbFfO/blxBfweK2HL4YNW0QVJZ4O+J2y4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZJRc2UVQOYxsJcb6owYXx3hQL90gjYC6YvP7iIYfQy8VQOzDiAlIYNPjpQCRFgQm3CfipIR85nJhylk1jYRhW5VvVXOf4As9RL1Xwqg3gmhQzJylLi1HmIuTCeGXBzgOma/lmNbVzQNGZC7cql0J0Jdzd0yjaUDZEnjpQiNxpmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tf4RgHBx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tf4RgHBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707129384; x=1738665384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x4PTHOfkEbbFfO/blxBfweK2HL4YNW0QVJZ4O+J2y4c=;
  b=Tf4RgHBxcYvf+Ru52QT+Lc/vgJvfid2PKpcUGJUKWPN/Ma2xxHs/U53l
   +4bXnh85WcC4HSD2nbvzeE6mu9F62glk6kGVGu8tyjNbS+2OyQWHgcd35
   8tC9J02lW7u+G20LHcXRz7/aNpqveUGYOiQLgwguQjuWjnWGQGr/hPQh4
   vsgb/OlDKHShjPBLbdzSrmR18FJfSKNUkN8JPFrJA17PV8tkGWIqn8GJH
   PHua+fbKLuKbI6cTIfTUc9l2IP6yg1AwWlx0Pd4sVR4FBIXF5nrepQW1L
   tSCrU1IB/CbnGI3jFBaRtm2FaWiRc9B0qo8URdhRxm7oqKKgx6F7SRNo8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="386163"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="386163"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 02:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="31491086"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Feb 2024 02:36:23 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWwKq-0000O4-1q;
	Mon, 05 Feb 2024 10:36:20 +0000
Date: Mon, 5 Feb 2024 18:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Chengchang Tang <tangchengchang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21358/30000] htmldocs: Warning:
 openEuler/MAINTAINERS references a file that doesn't exist:
 Documentation/admin-guide/perf/hisi-pcie-pmu.rst
Message-ID: <202402051845.4V7FAKgO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   176b28d6dec6d47c9316c56ec8a5f056ad8cf3a0
commit: 6801e8d4aee41e141be7512ece7df9170cd06d85 [21358/30000] MAINTAINERS: update openEuler/MAINTAINERS for Kunpeng SoC.
reproduce: (https://download.01.org/0day-ci/archive/20240205/202402051845.4V7FAKgO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051845.4V7FAKgO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: openEuler/MAINTAINERS references a file that doesn't exist: Documentation/admin-guide/perf/hisi-pcie-pmu.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

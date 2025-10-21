Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9559D34C83C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 18:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761072936; cv=none; b=fINX3ukYjCXvO25D5EIQy0weQCxlPL11+kyEF/G5ds61Gp89r9z8KA6iXZUwFqiVaqVILJaQ+Y6Y2Dy2ShTJYhGdmdeObnxHXnFWdCMcMdIj20m2aMAeCgwzoE4mXeUfRYsqcvkwt52+GIArpwW8TvBpprp7clr5wLMae5nv2l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761072936; c=relaxed/simple;
	bh=/xb2aAlJVIMFpmXLOA5XBQAsaTESxivBBznwBpXjtxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IRuKWMVq/6zMObdA3Cs9MLYJ+IMzhqyVuB+YXwPui/HE6dVZAUOM/BwdXLvZE2Iv05JLOlzrIzHnH4NVzm3GPZsA7K36StW+LaI6Mw2lKdFL/KCrT/R+HvUzSFqQnzWH8PD4E5liLTECZq1eOjAAxx04/P2607cStzfMxLwRmnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMzleZGH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMzleZGH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761072935; x=1792608935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/xb2aAlJVIMFpmXLOA5XBQAsaTESxivBBznwBpXjtxs=;
  b=PMzleZGHn6wL5HOSx2hcW8WwUWP/+YF5dGB5wGFWHzhb1WA9O2olvjBC
   tfqOPE1c3t+b1L7YLifWyeFI2hnQ8APz9befyuO2zKfi+lOLxx6y+lJ/g
   87prTk6XDzKJ2ru8maAkuyGRdbHeGLAa+RJU7Mv/C5UFE+GgoKSYTde5M
   TLdeaXQ8MqEwjpuoyZurL/3WtlfL8FRBOLDGAxRQZP2vLFl4Hbb2lVfIS
   J8udnvMWn+QFdBNQRBOWNpsr4gBeygLw3ZO/41/rmL1HUXnPAWT7WM4Gq
   8YNRTrZEUczVkzxM0nz3IB7XW2RYd8hQYTxjAxBX15ahCKz6epvGxRNCj
   w==;
X-CSE-ConnectionGUID: XtKZ/kt/Qrab5gbK8L9Jmw==
X-CSE-MsgGUID: EkhzYjT1R0OXizYAk3aSKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63307132"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="63307132"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 11:55:33 -0700
X-CSE-ConnectionGUID: o+IOoEKNR6CoF0Z4OfXiUw==
X-CSE-MsgGUID: 3sHq3Kh5SmaoJ6QnPN6r9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="182827909"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Oct 2025 11:55:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBHW3-000BCC-0q;
	Tue, 21 Oct 2025 18:55:27 +0000
Date: Wed, 22 Oct 2025 02:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl-v1 4/7] ld.lld: error: undefined symbol:
 pinconf_generic_dt_node_to_map
Message-ID: <202510220203.kuinJmYS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl-v1
head:   2a9e670758f639c552513080c7688b161ef78bf7
commit: 4ebe93ed9c854eedb59a02198d64545c429bbc89 [4/7] pinctrl: add pic64gx "gpio2" pinmux driver
config: x86_64-buildonly-randconfig-002-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220203.kuinJmYS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220203.kuinJmYS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220203.kuinJmYS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pinconf_generic_dt_node_to_map
   >>> referenced by pinconf-generic.h:235 (include/linux/pinctrl/pinconf-generic.h:235)
   >>>               vmlinux.o:(pinconf_generic_dt_node_to_map_all)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

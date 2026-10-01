Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC784779BC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 22:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790893649; cv=none; b=l4SAvQPEd7hHRuQGWurjPJit3Eh38mR3Q79aqDkwpZB/5yL44guEVTWMLfK2W0vbDME2/lwq/hAJ2y24Q2o88ObzG154Zk450WerYhGBtR38MB+D2dFqvoDK15+C3tVc5A1EPpgCJP5NzoZNYVjGFJ78nLhXqJZwLj3G3u9ho6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790893649; c=relaxed/simple;
	bh=HiQYt36D1dLYoVNqj65CQoGaRLO5K7je95Y0m7BTIhY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WlSnXVZE4EnoFZIel8ALEnp8Eovja43S0741B5CiSGTu0K7IUm/Es7GcHwxOwycqN8nS5gdC/L7W7/ymdPTCw4LddCT8YLdzcIzK1p2/JMEGp+8YeYbPMToVzFJ/q6K9fmkT/ubSFcKf+4ZpI6ThLpBWcmaeDyZDyEIGh05dsjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KgxdU5DG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgxdU5DG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790893647; x=1822429647;
  h=date:from:to:cc:subject:message-id;
  bh=HiQYt36D1dLYoVNqj65CQoGaRLO5K7je95Y0m7BTIhY=;
  b=KgxdU5DGJYHb6/j84213mpgyTKKtzEx14Pf7wXC/LaoBnWpbxJNct3W3
   8tcnmWZ3yg8hMrp910KxLt8b9pvzmQ9rxpju7sYbTrdFehVoo4jKVr5HH
   RVL/6It0Il+6s9MGtkG/lgq6hebm+VX/ZvMILfpDveL/jHg0ZMlUVhJrH
   gKBAJbXjR2nzLJrXXcrWGVeDGkU6QkOgUFXr+vw+MVCiFCUxzLNMqNrUQ
   Hn5ZN/9YffCoa8Y4gn0xc05HgQ940Enfkhm7u8IvOi373TF+BV3wIgHXk
   BLL0ICcdeQnRz5rilSLtlIYRl1T/8UXCoPyqP46Xg0COLL9Hx3/4zNrYu
   Q==;
X-CSE-ConnectionGUID: Uca0iuEkSe6ZypnDDPolYw==
X-CSE-MsgGUID: hgyZI9DyTRqH9Jjc3EHoDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91528396"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91528396"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:27:27 -0700
X-CSE-ConnectionGUID: F9p/Q3HRRKyIO4kQMfuURw==
X-CSE-MsgGUID: KXQ4dRAuSFCaNApOhQaa7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="132383"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 01 Oct 2026 15:27:25 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCPFL-000000000Fb-0RN5;
	Thu, 01 Oct 2026 22:27:23 +0000
Date: Fri, 02 Oct 2026 00:27:19 +0200
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 76/87] kismet: WARNING:
 unmet direct dependencies detected for PERF_EVENTS when selected by GTRACE
Message-ID: <202610020024.NHlZqWxh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   dc5b9586f90cc15314085bdaa74661fc00d1688f
commit: 17ed86e21fb97985103da6dd9f879843e828b643 [76/87] gtrace: Add perf driver for tracing using perf tool
config: sparc-kismet-CONFIG_PERF_EVENTS-CONFIG_GTRACE-0-0 (https://download.01.org/0day-ci/archive/20261002/202610020024.NHlZqWxh-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261002/202610020024.NHlZqWxh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020024.NHlZqWxh-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PERF_EVENTS when selected by GTRACE
   WARNING: unmet direct dependencies detected for PERF_EVENTS
     Depends on [n]: HAVE_PERF_EVENTS [=n]
     Selected by [y]:
     - GTRACE [=y] && OF [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

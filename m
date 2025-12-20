Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F629274FD3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 21:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766266911; cv=none; b=kUZEzMLmVAnBAbnc9AodY/zfhbBvsyJCKLFpA2BnWiD5hvLlY2EZdSJC87UBLrdQX7caXIyiE/PDnxMvTAiuYkLFXEtW5/mqc15muGGf+Vpm0b+0jCT/uJBh0/whhrTrqi0vNssVNH+2Mr/U6molekuBWhGnFROvTIc6ByBxTc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766266911; c=relaxed/simple;
	bh=jCnbikPRZA9w5qAneFHncfzF+e7nmiiVKSq34bBUb5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pQA/JV3s7vE7XPymJrh2hMljH12qCBDgUQ0G8wVT47+NVmVvgZ/kw6zTkpYjuHeQoM1mxPdRnTTmesRaETfZG/r1x6S7kB8XFRr5XOnK+hzydjSTA5/+74/z0ByCLqv45FexCXzqcA+S2hJnoHp3h9nK5xaL1odQbS3WZLlhvy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSf2srdK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSf2srdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766266910; x=1797802910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jCnbikPRZA9w5qAneFHncfzF+e7nmiiVKSq34bBUb5s=;
  b=iSf2srdKQqBS+GisftTG+TzTAUQEAlITzbg8ZXIm3LlgghFDL73XBVAQ
   1ceoJspamNolP92D4NlxLpw7899jRQcRsM1OViv6KLc5fe1MB36RS638N
   ApvHkcBUvPtpl/13Qc5qAKyLBv4IzT4iI7oFRubfc6+u+ucsKa8bnRFNw
   1/krtw7/Mnmz2nP4+O1yC8BQT+41YW30hlsh234ob9thSHbLH9WD+gqiB
   5ddGbMuxS0xzja6HPabO+vf1ZfIdewIUCfOhDn+fu6orYOshvnnphgL3l
   J1AvmJNEZm4A6S0+y6uw9cta0b6s4aAlDG5hYl8f+WBr3YXMqszxoxT67
   Q==;
X-CSE-ConnectionGUID: dYMnIuOkTWWbXox8xBzdhg==
X-CSE-MsgGUID: ic/XLAcGSEi2cLNo3t3LTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79552443"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79552443"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 13:41:49 -0800
X-CSE-ConnectionGUID: 4G8csJntR6K7qAqTsIIo9g==
X-CSE-MsgGUID: lI/pqs2BRKmmndmwoK7iIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198413330"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 20 Dec 2025 13:41:48 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX4ht-000000004my-2Gdm;
	Sat, 20 Dec 2025 21:41:45 +0000
Date: Sat, 20 Dec 2025 22:41:45 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1/1] kismet: WARNING: unmet direct dependencies
 detected for RESCTRL_FS when selected by ARM64_MPAM
Message-ID: <202512202217.vP7L1WOs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: c5a4bf91167c714de74c47f5cd6d888c66e9860d [1/1] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-kismet-CONFIG_RESCTRL_FS-CONFIG_ARM64_MPAM-0-0 (https://download.01.org/0day-ci/archive/20251220/202512202217.vP7L1WOs-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512202217.vP7L1WOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202217.vP7L1WOs-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS when selected by ARM64_MPAM
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

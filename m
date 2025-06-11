Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279BB21CC5F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 06:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749621899; cv=none; b=CWceK4md4Fc0o+TgErgOjLlKyryAg4KQRrh/j+ESw1QUd8bEy52zED7VtgAvqZ9XpFvHeJujODL1IcBHRjpSLTkYPrrkSjAITNVKTJkzhrNJkwb84KZ/iO81Qfoq1YgE62MmsSpFGksL5AlVvwaQaF5AzvhXz43mulAXs1h8fHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749621899; c=relaxed/simple;
	bh=zHwHWhtzZutG060VJgojlB+TrLGTtCW9Yi+iIPien/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bOC7Kj6ppSisn9pQ5a6p/pPr1v8WKe2Gw0HvqQTMQLeCSS31Hg1n8QTRqcRhF/YQLOtTHa8996+U/p+98cheokK/kRcIvts51KANzNr1ovUp1IXVBsuDaj448OMN+gmELG80McEowbW/QiUmq2HghfF7yB0ZpG/6DfVkWjxvyMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PU75I+3S; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PU75I+3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749621897; x=1781157897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zHwHWhtzZutG060VJgojlB+TrLGTtCW9Yi+iIPien/8=;
  b=PU75I+3SutZ5oHN51+kpj7tfIBwZT1XBvtBI8RwJ/iQZu9aMNb9Zhd4Z
   CWVcGKzgrgHo3GUxT/1TXuNXs0JxXlv+FfRXVOa3+vq6Rsck2h0LyYSi/
   CWkwFi9H9vI6rCFNg11deCRhUA4IuodI9jgXFqdpq977miIZCxEpilSDL
   xN73KX0D2kBKqlw8Rdu+Me5mXMKTOAOnV9ybEKt1ew7BKB1edwSV3B+tr
   bXQ7gxg631JOcqz/xdEQGzxMYgh07O8u8vZGbXbrTha6WuTX1iGRd0/Ko
   5nsSorVhojqg3CkO1Pb2R1feNUcBVe4UFqIqiBoUdsPwEaUCyer3SZ4nA
   w==;
X-CSE-ConnectionGUID: +v62zDxXT4qaxlQ8yW0bmQ==
X-CSE-MsgGUID: mJew+waTQju6xbjKrisLQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51741872"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51741872"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 23:04:56 -0700
X-CSE-ConnectionGUID: vgDF+IevQEmaewkPpjKCWg==
X-CSE-MsgGUID: NWePE53WTnCUQKkK1Iy/Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="147634861"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jun 2025 23:04:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPEZx-000A3e-0U;
	Wed, 11 Jun 2025 06:04:53 +0000
Date: Wed, 11 Jun 2025 14:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 35/57] kismet: WARNING: unmet
 direct dependencies detected for FWNODE_PCS when selected by PCS_MTK_USXGMII
Message-ID: <202506111411.QD5UQzcZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   e5c7b7a9182ec3d5b1936a508b2b8d7b4479e7ab
commit: aebd97da22e97c7db6c7d44e5c6f79c63f9819b2 [35/57] net: pcs: add driver for MediaTek USXGMII PCS
config: alpha-kismet-CONFIG_FWNODE_PCS-CONFIG_PCS_MTK_USXGMII-0-0 (https://download.01.org/0day-ci/archive/20250611/202506111411.QD5UQzcZ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250611/202506111411.QD5UQzcZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111411.QD5UQzcZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FWNODE_PCS when selected by PCS_MTK_USXGMII
   WARNING: unmet direct dependencies detected for FWNODE_PCS
     Depends on [n]: NETDEVICES [=y] && (ACPI || OF [=n]) && PHYLINK [=y]
     Selected by [y]:
     - PCS_MTK_USXGMII [=y] && NETDEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

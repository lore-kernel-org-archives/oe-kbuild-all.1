Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A90409620
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354529; cv=none; b=r4DIPVWhoICH8rm/cnyUxR9TH92bIbnzSX7GSd9jNy/sd49/hxxSiYqGhHOVrKc+x4hgHmQRTovi0hg672c6y1PPjcA5R6LHkB5sqmOHMPY3DeE23DagSKEEXrFSi9F5WNA+haNJymQ4g83/wxWL4AHlJHAcwnt0zJetZvPDwc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354529; c=relaxed/simple;
	bh=BfQxyK3l9ckaUvnqASmBUkwBScvCno93rXDFI0wbcqU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OEqJ4kZcSwgNBMvoiKAELpwSp4B4cFLD1v1Wmj934d98CZTzy6Nx/W4/g1Q6lOTur5lD+qBAyR21fuarhpanVAua5W5c7EvXd9D9yAxwyFzSFWt0Gk2kPdNp9ES6ZatgKKQN0d89wMnkFL1+GAJnB044aDI0kdVbGeSK/XQyPGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFSXfi29; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFSXfi29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788354528; x=1819890528;
  h=date:from:to:cc:subject:message-id;
  bh=BfQxyK3l9ckaUvnqASmBUkwBScvCno93rXDFI0wbcqU=;
  b=MFSXfi29ZtcGGLanTn4HKSs9JpcvBrXOnU+V2xIc8SMhDfxZJSz1C5g2
   cORaX6MhPGoyu+uN3ietRlHMF/b9hvH6wtDElZZQFkuBc+i+gREEKvKcJ
   UaPRkziqzw6e8aSJvBKmbiHoaVtB80yAaRWbFrqh5n6U6uyKZadcU0AXf
   jNBs2qzqr3tmbS6othOYLk3Zqq2US6aDWAX1Lbs33G82rOy1zgBKePQif
   a8kzmdO+RcS5S9QU7jkt+difEUPxhPYZP4y6tLrvwxoFnfmZdahY3TTxM
   b9ZrnMhzeXtKMidztuFeLdTJGBn8qNhhaZBpem52xvxNFqLfw1JbJKGl8
   g==;
X-CSE-ConnectionGUID: 0XRgYnoqToWZ6rcF8YWuww==
X-CSE-MsgGUID: +Hl2eEWbQjWpopzcrIBo9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88738733"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88738733"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 06:08:48 -0700
X-CSE-ConnectionGUID: Jr5xFXfTRuOd1rP1FAUnLw==
X-CSE-MsgGUID: 0b28pDfcQc2ggLA8OXv40Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266799935"
Received: from igk-lkp-server01.igk.intel.com (HELO 05545efcfdd3) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 02 Sep 2026 06:08:46 -0700
Received: from kbuild by 05545efcfdd3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1kho-000000000Br-11RS;
	Wed, 02 Sep 2026 13:08:44 +0000
Date: Wed, 02 Sep 2026 15:07:45 +0200
From: kernel test robot <lkp@intel.com>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: net/ipv6/ip6_tunnel.c:1113 function parameter
 'reason' not described in 'ip6_tnl_xmit'
Message-ID: <202609021417.JGBjc7Sj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Anton-Danilov/ip_tunnel-add-drop-reasons-to-the-generic-RX-path/20260901-005127
head:   b729d2aa357fe44583ecf8968abd309c05256b3c
commit: b289af760bb2e0d347aa3ab990e1bc1d380c5db7 ip6_tunnel: add drop reasons to the transmit path
date:   2 days ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260902/202609021417.JGBjc7Sj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609021417.JGBjc7Sj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609021417.JGBjc7Sj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: net/ipv6/ip6_tunnel.c:1113 function parameter 'reason' not described in 'ip6_tnl_xmit'
>> Warning: net/ipv6/ip6_tunnel.c:1113 function parameter 'reason' not described in 'ip6_tnl_xmit'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

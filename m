Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B741D8E10
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 22:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755986812; cv=none; b=TkRG6CGivFOiYXzwpqvOWHZFo5+6oMsGWiRDlJ+1tlO4QIrzCRtBd21fgyRqRGjlxe2z+h/v7Xpsp+BxwdD5SlYNnyygdhH1f3HaTEcqt6kGYfb7CKyd+z4AFxs3/IWMYffXO9LRYOvAZTT53Iigs8kHy1HM+voKUojtCEACWp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755986812; c=relaxed/simple;
	bh=ZlGz2uqU9/ivnjkI8rsc21jM/7/DPuIbjEA6kk2xNPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CPZsmFe9gMyk7phmxrf3DnTfdpwV1TvfjCbf9DjQOtzyUCo3fWLuBbV9fz4CAE+Idqp6bECArSnZ9eknMJ5AaVR3C57xk/LcPIk5rUjpw1AdJxZL4mgYaCGPYMO3EBAZz8PILIVdPz6ZJrI/pfH9E6jPJbxA6gWbOGAu1s6ijko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpGps3Xd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpGps3Xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755986811; x=1787522811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZlGz2uqU9/ivnjkI8rsc21jM/7/DPuIbjEA6kk2xNPc=;
  b=RpGps3XdVhgUUojoRIP9VS7lba/2R27ZRt2SEKoGKC9itXEpepNxCiaX
   6SfSYNNlLCYv44CHj7lC+8QjLgSvPvzTTTwmcQWHXdS60OggExWhKB2Rq
   ox8UZTnbw8RaFQPxCWw2gRpDyS8wdt73BprREAKYh+zGCCnySn4qvback
   glZ08jsRgXsxJItpWyK4f270IDDxIYrkJKFLfiKKiin7H1mffFoV9/3k0
   Bzf1bYqZrQWTcmdBZz+ONleuFPtIL40dvNOGDd/NbuLrZ7c7sQUTfPTho
   8aeLRkCCVwiuv86M4sntyZhO6Bh2Ew+FUWxKZtDRwHRv0HfwiGnxUnmK8
   Q==;
X-CSE-ConnectionGUID: Sq7jBRcpSqmhgbKZfZqc2g==
X-CSE-MsgGUID: DkhfNhH9S0OzaOeOBlmWSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="57451635"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="57451635"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 15:06:50 -0700
X-CSE-ConnectionGUID: YmK5r9YkSQa7BbhzI6So2g==
X-CSE-MsgGUID: b+oZz8ofSZ+VzO/EYGovWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168181749"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 23 Aug 2025 15:06:49 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upwNq-00029r-3B;
	Sat, 23 Aug 2025 22:06:46 +0000
Date: Sun, 24 Aug 2025 00:05:54 +0200
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 1594/4234] ld:
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.o:undefined reference to
 `stmmac_simple_pm_ops'
Message-ID: <202508240036.5DKuJ0uK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f4c93f7eb861acab537dbe94441817a270537bf
commit: c91918a1e9767fc40488f69436f61af90221615b [1594/4234] net: stmmac: pci: convert to suspend()/resume() methods
config: x86_64-buildonly-randconfig-2002-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240036.5DKuJ0uK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240036.5DKuJ0uK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240036.5DKuJ0uK-lkp@intel.com/

Note: the linux-next/master HEAD 0f4c93f7eb861acab537dbe94441817a270537bf builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld: drivers/net/ethernet/stmicro/stmmac/stmmac_pci.o:(.data+0xe0): undefined reference to `stmmac_simple_pm_ops'
   ld: drivers/net/ethernet/stmicro/stmmac/dwmac-intel.o:(.data+0xe0): undefined reference to `stmmac_simple_pm_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

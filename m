Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB622E9ED4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 17:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751046993; cv=none; b=SGLhVuRy/0tvjJmmOpdyPSgIfOx6PB7fvKgmAMMeziju8lGdIrEssQ96R3r/K9g2e4VTiMmHg8rQyD+yPFpm0d2z7X6MeM0aKLrg28N98sp7tto8ys96PHPsjJP6+/7JktTLUoWIcQvhNOBI5KhAYB7X2IkJPmuHhpDFXizvm4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751046993; c=relaxed/simple;
	bh=1NxRjiTAeJ9etgyHKJQQfmt/+rX9/2lIy7wN9HR9Y2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0ykmT4PxMHNkMEDDEic1eUMMZ4vKDWJaU+U7HThSmPAGBg2kzxEWE8k8mdNTmnN8UUl92JInYPtG5VyRNg8McjyC69Ro6lX/gNbCTCabGbMrck6dSwfLwdNyCmrWVSULu3X+QEUiEl6+tSgHlpKQ6x3psHP5EgDPdioGTXIPFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myejEJM6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myejEJM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751046992; x=1782582992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1NxRjiTAeJ9etgyHKJQQfmt/+rX9/2lIy7wN9HR9Y2w=;
  b=myejEJM6Uf5qzXYtpNfWm7tuM/jNk3R7nwcNJehvf4QxXaYFGuxfkaA3
   Wm27pjedJmwxcqZEMGXBxWGJN4yOFuovCxLyb26c2L7zup3ix3hEwZAeL
   s0/LrdqKZvRUCLFic21l61f/vniGIvQX/wNXaQ+GtXUXLShS3wUAyxnap
   AqFkbyd/169LWqm3zoT89Im+frDlVh2jM8aeeDHQl7wO24hILeHdAhRTO
   rSGSmLcLELrxQNpH6+0bdnboAfpHj7+b0Run9VFvTCw50IHatrmJsk9Gg
   fbo1XVi/jAKJn7B4KAD21v23yt5KlHw4rqMmwsPk623pj7hMI6gbXa4d9
   Q==;
X-CSE-ConnectionGUID: 78RHqp95QuG3kSr3iSwTLQ==
X-CSE-MsgGUID: hds4IBZPSK6hxwU4be/d7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53448456"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53448456"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 10:56:31 -0700
X-CSE-ConnectionGUID: me8QKM5rQa6Z1Pn8ndOWKg==
X-CSE-MsgGUID: h26sOQHXQSykWqy/SsSVwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="158362380"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jun 2025 10:56:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVDJM-000WRy-0D;
	Fri, 27 Jun 2025 17:56:28 +0000
Date: Sat, 28 Jun 2025 01:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Georgi Djakov <djakov@kernel.org>,
	Gabor Juhos <j4g8y7@gmail.com>
Subject: [djakov-icc:icc-fixes 5/5]
 include/linux/interconnect-provider.h:156:12: warning: 'icc_node_set_name'
 defined but not used
Message-ID: <202506280134.bxPIYES0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git icc-fixes
head:   65fceba30d6f1e7849048d0b292d3541695403f3
commit: 65fceba30d6f1e7849048d0b292d3541695403f3 [5/5] interconnect: avoid memory allocation when 'icc_bw_lock' is held
config: i386-buildonly-randconfig-001-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280134.bxPIYES0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506280134.bxPIYES0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280134.bxPIYES0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/soc/tegra/mc.h:12,
                    from drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c:10:
>> include/linux/interconnect-provider.h:156:12: warning: 'icc_node_set_name' defined but not used [-Wunused-function]
     156 | static int icc_node_set_name(struct icc_node *node, const struct icc_provider *provider, const char *name)
         |            ^~~~~~~~~~~~~~~~~


vim +/icc_node_set_name +156 include/linux/interconnect-provider.h

   155	
 > 156	static int icc_node_set_name(struct icc_node *node, const struct icc_provider *provider, const char *name)
   157	{
   158		return -EOPNOTSUPP;
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

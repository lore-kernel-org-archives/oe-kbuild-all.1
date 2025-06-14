Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DCF2E7F1C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749932984; cv=none; b=fYNB7AE5Wg7XdL3fsCeSOvOZUx9IXVIxStJ7WwWnU7YWiRPRom1FEif667Rv5PHkVIK2wTBroGz5G+D5ETciq2cvKNmyeCIMeDV5EfsXPGZzaxvo/aQ6P0SCGp4xMWPxwwS4D+M/0mHWrmhbIRn0V7FCBVY/nMWhi5OGDq13Pu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749932984; c=relaxed/simple;
	bh=Dgg59bT54O9y1UpViroNNg9X279+DaiLz+8Vq4X/qxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GOu9KkfYHt3fwTpHCy7YeG87bNwbwxdQcwyqMjzq+qXVUhq2LZct7q7PVSV9oaEbIc5CvfbDLUTYXBUnb0yzcQlnBZ7wpad4oL1x35p6v3f+edIcfbBHtTOG6OQ28yk1xjvonjJo2kQ3S2fTgzDIT+eOrEJoItlBAjHExcjcDM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aY2MJUnd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aY2MJUnd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749932983; x=1781468983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dgg59bT54O9y1UpViroNNg9X279+DaiLz+8Vq4X/qxE=;
  b=aY2MJUndhwG56Z5/Vzi99LTf8+Iv4eXEjcZjtVs9vEw/yU3vqCfOUC1x
   bSVrvJl6xAnriv0eRXNHTDfEKraGA/OFfkcuOCcpueA7VMWrL5a6v3anv
   HAiCWNaAruyH+CXFqwkLuxG9hzEX6PnaS5b0ejWlwZqvbvsf0sRzwbfw0
   QC4frvP6ywOXPDnBiFDiUNzzGWIv230kjSborGQ3s3m6DOW513xEZ9s0m
   PZc7ZnT9YSWe704fvsyRmSCdGNMqWjQMMVwFS8bNBwfsxS/nUVlZdvUyf
   uhRVdei/tkvxvTpw76aZXtejBWoKEFzaRDznhJd4f8NRTltfh9RdSnu/y
   A==;
X-CSE-ConnectionGUID: SDFBb339S7ueSrh46WC7FA==
X-CSE-MsgGUID: hr+9PO4/TVSbuwgfzQJvZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52215733"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="52215733"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 13:29:42 -0700
X-CSE-ConnectionGUID: pjTsottyRz60QF+H1MwC6Q==
X-CSE-MsgGUID: 5cKTPd8vQUC4D1kTQCVz6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="148003363"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jun 2025 13:29:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQXVH-000Dqm-1z;
	Sat, 14 Jun 2025 20:29:27 +0000
Date: Sun, 15 Jun 2025 04:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Igor Belousov <igor.b@beldev.am>
Subject: [akpm-mm:mm-new 130/130] ERROR: modpost: "__vmalloc_node_noprof"
 [mm/zblock.ko] undefined!
Message-ID: <202506150458.8B6mRtZk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   28d0e5a97b6cba743de4cfb635adc24d20222f5d
commit: 60b86f117fc62b16e357bf4cd2e5f0a3892ada2a [130/130] mm: add zblock allocator
config: i386-buildonly-randconfig-002-20250615 (https://download.01.org/0day-ci/archive/20250615/202506150458.8B6mRtZk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150458.8B6mRtZk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150458.8B6mRtZk-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__vmalloc_node_noprof" [mm/zblock.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE1E78F26
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 22:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764541878; cv=none; b=lju7Cbqne2lnP/CtNl15VHvJALsYyvQKgjYtOXsz4wHE8vNgxJ8JlswCPwmQNNgaS8ob0BpekZ2WcVKrkCBT6ir3Y5whno/P30jIYOYCqg0U0rHt5RwcPcP7XNvI7k1dgOFdfg8WxXej+YVAahocYwXfVXGxl2+8aLw15BXudlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764541878; c=relaxed/simple;
	bh=ynp2ZaDj4RbyRSg/U7yTW99U3XynO6tR++aDp8nzpxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GWVrfuL+jRVbRRf/dibmx3Nbj6Bh6j+80LOnJlAX3Gb5UiIrudZSVPA+JBdjRgz37inOWJ1BfC1lYFUKtS0cNCqmS8T4nKChTK+ZYRFj6k0wce0tR0BFHwurSW4Qn/mx/VhLTS6vzKZebRDIACIpps3qebw//ABBSk/g4KO+84Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xv8gwklZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xv8gwklZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764541876; x=1796077876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ynp2ZaDj4RbyRSg/U7yTW99U3XynO6tR++aDp8nzpxs=;
  b=Xv8gwklZ4pM4ufgINUe+kXjv8O7AFrDMUOpAQqT0uzInIiYvdNdq2ufh
   aFE8rwYbOwxR8qq75JxqkWGvUE7E+o4r+TD45qaQcSvKVrRLcnN5tPOT9
   hqawtbl6Ah0dAiyRpQBQKX4DkIX5i650Mx0dTPp3Z4quq/jNtzLY2/VmA
   +q2HPPeYaNZaDHZHhorWZs/CSdXw4o2192QQNQ3AuPqSZSPQX2A4DFpsh
   iqh9oR+REiWbMFiyV9nZFgU2GCBnccDUnJ3oaoVZUjpwE0vW7wFDoX9Ls
   g9MHPFYanbmfCJxCx4IJek44z7svlF2f9FFjss3Z7Hhe+C4tYUWvvv0pQ
   Q==;
X-CSE-ConnectionGUID: BKyZA1gdSCyBhIYmRWcMRg==
X-CSE-MsgGUID: iyKTB40wT7OBsCw5ghczLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="65481634"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="65481634"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 14:31:16 -0800
X-CSE-ConnectionGUID: dW4g6HowSfKuEcmMaPwHUw==
X-CSE-MsgGUID: rovbBWpFSbO6X5RRJpofEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="224881539"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Nov 2025 14:31:06 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPpwd-000000008DR-2l5n;
	Sun, 30 Nov 2025 22:31:03 +0000
Date: Mon, 1 Dec 2025 06:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [lwn:docs-next 64/66] Warning: drivers/cpufreq/gx-suspmod.c:142 This
 comment starts with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512010641.WnzpYJId-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.lwn.net/linux.git docs-next
head:   464257baf99200d1be1c053f15aa617056361e81
commit: 5f88f44d8427a97347afda3a6114aed0df472a0b [64/66] docs: kdoc: various fixes for grammar, spelling, punctuation
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251201/202512010641.WnzpYJId-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512010641.WnzpYJId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512010641.WnzpYJId-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/cpufreq/gx-suspmod.c:142 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * we can detect a core multiplier from dir0_lsb
   Warning: drivers/cpufreq/gx-suspmod.c:202 function parameter 'cpu' not described in 'gx_get_cpuspeed'
   Warning: drivers/cpufreq/gx-suspmod.c:218 function parameter 'khz' not described in 'gx_validate_speed'
   Warning: drivers/cpufreq/gx-suspmod.c:218 function parameter 'on_duration' not described in 'gx_validate_speed'
   Warning: drivers/cpufreq/gx-suspmod.c:218 function parameter 'off_duration' not described in 'gx_validate_speed'
   Warning: drivers/cpufreq/gx-suspmod.c:250 function parameter 'policy' not described in 'gx_set_cpuspeed'
   Warning: drivers/cpufreq/gx-suspmod.c:250 function parameter 'khz' not described in 'gx_set_cpuspeed'
   Warning: drivers/cpufreq/gx-suspmod.c:202 function parameter 'cpu' not described in 'gx_get_cpuspeed'
   Warning: drivers/cpufreq/gx-suspmod.c:218 function parameter 'khz' not described in 'gx_validate_speed'
   Warning: drivers/cpufreq/gx-suspmod.c:218 function parameter 'on_duration' not described in 'gx_validate_speed'
   Warning: drivers/cpufreq/gx-suspmod.c:218 function parameter 'off_duration' not described in 'gx_validate_speed'
   Warning: drivers/cpufreq/gx-suspmod.c:250 function parameter 'policy' not described in 'gx_set_cpuspeed'
   Warning: drivers/cpufreq/gx-suspmod.c:250 function parameter 'khz' not described in 'gx_set_cpuspeed'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

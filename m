Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D109367749
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706617230; cv=none; b=ACcNg6hmQLpXXdcv5fpzF8cIqFExGnOainj8ZYnBDku05N6Hik5X8tanrnk1Op+vIpnyFcrj2P723Lmpd7WluX+VEUAZzRON8OI0idgxTMfAxjraLQjR1Iq6NR/78NAC3N5xObIGQTgdcJlhGtwfjwMQQvrGzN3KQITKfS+oYYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706617230; c=relaxed/simple;
	bh=x/Bwe35UcFZ432cEebDSrm3xLEhA/N0F6oSsq85Cvwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mzl7bElD6ogrpdYns13xz20FyZ24WZdwjDkJoDWpG9/fd/PgGWkvMLRDGVGZF37CPanF2CquJtvOAgvK8idNPK6cwkPsG/f77n+Q0TDXpEbLjAU2nTsvAzi721nkE6Q3Tv9c2nLKiJR20J2fplplGUZU16JXYe41BqWKD9/UySs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrHAY2TC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrHAY2TC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706617229; x=1738153229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/Bwe35UcFZ432cEebDSrm3xLEhA/N0F6oSsq85Cvwk=;
  b=WrHAY2TCRnXFeyObjPMpfQay+EkbmFV70U1dIvCST9fdL1vWGXSuUVpA
   rNXhnf+yLsymAPbHj1IyRRnx7e99QGUCqE8QLoP+Lldj4GtiUSAhEaErV
   I0kla9eRdRcXrf6f24Q02dM2nFvHboNrTGvaF65Cbm/5ISj9gLPFWPSZh
   lWhMMKpuOJqY3fh7p+wEM1eaXrt2rGZndDl66T5JqFZkC0hCJqdbsVH/u
   zQ0u2N96udKIl4yciHTtUWuOkorJqasSwOcoTgrI96pcnY0Z1yjLXypkX
   ABMbCSEInhZe6tbrFHxNdeOTfMwsI4RT+GVKDkeNtPb7wzlQEPpNYtvQO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="24738612"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="24738612"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 04:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="961258705"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="961258705"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Jan 2024 04:20:25 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUn5l-0000Gw-2Z;
	Tue, 30 Jan 2024 12:19:54 +0000
Date: Tue, 30 Jan 2024 20:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 2643/2827] htmldocs: Warning:
 Documentation/gpu/amdgpu/display/display-contributing.rst references a file
 that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
Message-ID: <202401302044.TYqzwNmq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
commit: ba162ae749a5526025a6f1061bfcbb301a6adb65 [2643/2827] Documentation/gpu: Introduce a simple contribution list for display code
reproduce: (https://download.01.org/0day-ci/archive/20240130/202401302044.TYqzwNmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401302044.TYqzwNmq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

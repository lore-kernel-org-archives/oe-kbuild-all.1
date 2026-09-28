Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A5749D5A4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 23:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790636878; cv=none; b=b+3BEJQg8poVPal5qCZ6BBig7Vp3AqHy4c5Tc0E9hayJNlgAt7XsRB+TUUTG+3P635ihItNWu/O5wQQMoPNK6419LZf9IHua3RlMPm5Zdu+c/eTBBM/GK8p23jOuK/1pCx7BkjiHWvKRzmmIIfUZPy7aY1MR93fRYKCPozGOO4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790636878; c=relaxed/simple;
	bh=Sj5M+41Al7fRO9vqLVvnZYhu/SxLf2wuEC7QaeSqUCQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=auMS3MtUzGDUGRHUtDOQJNpSFuHle7+mdIJT3a59+S19iYI/iaynxYlNxhmabbRo0qGxjvUMFmsZQIsLQrZIPRxySbdsEAhDgs80wvUApgEP6dYJDAj1Z+Ssz50vlI+EZrJXgFp3et68bEwizKXFxj9QkeADzyF9dOrrpr290dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7u/WacS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7u/WacS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790636877; x=1822172877;
  h=date:from:to:cc:subject:message-id;
  bh=Sj5M+41Al7fRO9vqLVvnZYhu/SxLf2wuEC7QaeSqUCQ=;
  b=R7u/WacSybezGaaCS4acjVPbSbh1HGADfOJKPgfSGq6BVKbE7FPp8c+V
   cEbb2Fzhw1ect5qk8lKWaD6b/XgRYhuj6VGbwn3FsF4z93bxiDTxfdP6r
   /4ClRfP3ws+eJQvprKm3Uerb4AwfSPvZTRUu1xrP91LxuGzBvIjVy04BQ
   QBSLwgNRm1n2HTs63f5LjNlCDYc81+ZW12f81Mb7roWO98a3yJBTdU0sY
   MZNnrIq2aboTKLW16P1dlLqC4oMyDEs+J040QnGU3X0CWnxq7QbhL3PkR
   I33eoYMYaoxIyVJO4gK6k0WZ0auoQBwFrUEO7EtvPP5LzSc+pjQ858RmW
   g==;
X-CSE-ConnectionGUID: efFEDrx3TSC/nTeFi8kzWA==
X-CSE-MsgGUID: TAoU/gohTkK1eUCzE1fUcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="94062262"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="94062262"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 16:07:57 -0700
X-CSE-ConnectionGUID: 1/Bo7LCSSq+Nh+o1JE+oJA==
X-CSE-MsgGUID: cgWQq2V3SEGS5SvNzzyrMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="273808295"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2026 16:07:54 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBKRr-000000001B0-1FVO;
	Mon, 28 Sep 2026 23:07:51 +0000
Date: Tue, 29 Sep 2026 01:07:00 +0200
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, linux-doc@vger.kernel.org
Subject: [linux-next:master 9482/11456] htmldocs:
 Documentation/filesystems/api-summary:20: ./fs/dcache.c:2010: WARNING: Block
 quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202609290155.PQiaOalK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6375e61c01e93e35ee7acd336a689ac1fae4b509
commit: 33d76519f0ccb55b975a399f2a9a9c8933fa89d7 [9482/11456] VFS: add d_duplicate()
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260929/202609290155.PQiaOalK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290155.PQiaOalK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Ring Design
   ----------- [docutils]
   Documentation/filesystems/api-summary:20: ./fs/dcache.c:2009: ERROR: Unexpected indentation. [docutils]
>> Documentation/filesystems/api-summary:20: ./fs/dcache.c:2010: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   WARNING: ./include/linux/jbd2.h:523 struct member 'h_invalid' not described in 'jbd2_journal_handle'
   WARNING: ./include/linux/jbd2.h:523 struct member 'h_invalid' not described in 'jbd2_journal_handle'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:732 struct member 'power_module' not described in 'amdgpu_display_manager'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:732 struct member 'hdmi_frl_status_polling_wq' not described in 'amdgpu_display_manager'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:732 struct member 'hdmi_frl_status_polling_delay_ms' not described in 'amdgpu_display_manager'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A53E21D3D4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 18:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754332051; cv=none; b=XZTMNxKcAHehI/ErVjd17C1zgAC7qsQzvMnF7JBDqJBXBYn1FuVpPqL8GXq3/3ZBkxwvAgg9tii9wRlnMBoqHe2SqFLr89ETS1nE7u3Ruaym0ar3f5ZBxRNVZUcsgakGG27rDL0pNQgURshWAMATZy9CcLQrs55w711NH7d2LZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754332051; c=relaxed/simple;
	bh=JHdSE0ggyDWmZZkCmxyKKCXOqKN8mP5/Be1jbIxKSuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iP0kNueyVLLj/XEsqUszcFI9g2WbtzvzQ5bA0z51Nd8JsXyGTH1U90Br9GntF3HdtTxJUIJqkcOf1A3KzBMmsDUBhNn6eHZHkt0T1edoX5a7gCFtu7A61xtWph5Ut+uUYxUStVvuDsH0FFX/FLjN0Y4J/ZoKbGBBOQpyoYS+jOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIp8Zu0o; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIp8Zu0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754332050; x=1785868050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JHdSE0ggyDWmZZkCmxyKKCXOqKN8mP5/Be1jbIxKSuw=;
  b=lIp8Zu0oBrHX4e3utTibeYrf0CATpdePVaLVdxX9u0Py2Uwa+Y4AUjk/
   hVJk74j9nlilsPykrDuzeVDUjZiGeAmwVtm0j0wDBvaCwBdS83u6+i1Jx
   hxJnDAR1UDMahnwHNq3lF46wm0NKbh9Dld3MHhLvDm0pAJga40Z1Iylpf
   Kxem9VWGwBZ0O2hGDGjLolKGBVtc0qeyqceO0x0gfJEk5/TUGYWCcaqOD
   K0b4Jbv/iRA/l9aYReestgyjwVdTNmWOOI0b+1UgwcOU7Byi9/deKuKi1
   0T4yJuoknN+J6vj6dBRdQxsJLgtoYRN8/b9OOPkvvgxmD8CZBgXfrgNbH
   w==;
X-CSE-ConnectionGUID: 6g36bVp0TdqhtiFi5Xp73A==
X-CSE-MsgGUID: bgLy1KxzQj6X4QJxVC0MDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56751657"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56751657"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 11:27:29 -0700
X-CSE-ConnectionGUID: 03gnvxDQQVqL93gWN6CrSQ==
X-CSE-MsgGUID: it7jyFUxRfq5kxPdOchcxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="201397538"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 04 Aug 2025 11:27:28 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uizu9-0001pT-2d;
	Mon, 04 Aug 2025 18:27:25 +0000
Date: Mon, 4 Aug 2025 20:26:37 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] vmlinux.o: error: objtool:
 cpuidle_enter_state+0x21d: return with instrumentation enabled
Message-ID: <202508042020.d9q3KpQL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   c47064085b01b8e8acc3d8ecc51b3d985f2d37f1
commit: 8a504fbd272ac3a5c3597957f049d33c358677cb [2/2] Merge 758e4c86a159 ("Merge tag 'drm-next-2025-04-05' of https://gitlab.freedesktop.org/drm/kernel") into android-mainline
config: x86_64-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20250804/202508042020.d9q3KpQL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508042020.d9q3KpQL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508042020.d9q3KpQL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: cpuidle_enter_state+0x21d: return with instrumentation enabled

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

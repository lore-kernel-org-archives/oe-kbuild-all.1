Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7561F8736
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743073646; cv=none; b=pKz1FXxOkYIf/0bU1oQUBpmqptRJCwQz6+bOHNtak+6zzucPyis611k9/vmjvGpuL7eO7ixsXfk9tJwC0rSIzcElkFlCTF9Nt3jOL0lhYc/tkXsWMTOhoC5OVPMGt57sdzrTRm/jhMBXD6Ca0g8NxGr0j0+T9VIvl7wLVM9Qz/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743073646; c=relaxed/simple;
	bh=zyB1EYXGFjH9iCbXSpdt47NGWarDtXNVLhR0Vtsy2z0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qe4SIR7gK06+wVx/WbAlrRI9CjFo93wHsl3diBKKK6NiS8ZtX9WLiI83lN5t2rX6Zr/tGApaqmpNqwUBb1FZN5t/3/dzWgN+KxFye0f/LFAVtbB6hPS7K8qVVg4Q0TmCHLci6s2OHQ18QCjGOo8XtTjkK5m6jabaFI+0c/ZLa2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdZFzAK2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdZFzAK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743073645; x=1774609645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zyB1EYXGFjH9iCbXSpdt47NGWarDtXNVLhR0Vtsy2z0=;
  b=kdZFzAK2dFw/tCJMcarScSHg9NSOb2P2Lclee3eVBKYVgfb411V3ltiI
   DSl7Bnqodhu0QzACLBBFQSiocqS5FQhsoQ0qIQaSWV8fbDHNWwCREL9dX
   zAha0H0VDDxMRykP27qG5rVJ4mAmQcndOrpiV/+qaevQbt3uS1aMQNKWb
   87wPZ9lVULrthshF9tz0TUsngsGPviNjuLBQnylRGVUNkg2tGYjtuYX2T
   fyBVYqgVnX5PaGGMglw4RhHe+TEsQxQlE7gdTXCVYb/uRfUnUkdSKLXie
   mnI8fXSWmQHnbxMj3sqxKqLXI2isUjAFjkjZ51MZFyPG6BM4nqdgpXEWR
   w==;
X-CSE-ConnectionGUID: f+gzS3TqSyaf7FSCqaL/fA==
X-CSE-MsgGUID: ZBmFVl3CR9eJYiWUoNTbYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66870371"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="66870371"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 04:07:24 -0700
X-CSE-ConnectionGUID: /SmI5q/sS+Wv0wY4zmKgzw==
X-CSE-MsgGUID: eR69v6IfQzCOalDtZq5AHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="129794463"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2025 04:07:23 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txl4u-0006c9-34;
	Thu, 27 Mar 2025 11:07:18 +0000
Date: Thu, 27 Mar 2025 19:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1523/1523] ERROR: "ata_dev_same_device"
 [drivers/scsi/libsas/libsas.ko] undefined!
Message-ID: <202503271838.22rCFdNn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   69d39b683755039471781fee8dc7ed96952f771b
commit: d856ec500c97835c591ffacc005f514509f1a931 [1523/1523] scsi: libsas: check if the same sata device when flutter
config: x86_64-buildonly-randconfig-005-20250327 (https://download.01.org/0day-ci/archive/20250327/202503271838.22rCFdNn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271838.22rCFdNn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503271838.22rCFdNn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "ata_dev_same_device" [drivers/scsi/libsas/libsas.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

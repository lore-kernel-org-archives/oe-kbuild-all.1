Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4104314B96
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427078; cv=none; b=U8A/0tWVyce0kTpAJQKiiyZZv2fD+y2E19eVXVLc8h6N+z4H8Ji0QLjaSvHJ/4kZjsFU25xvd621Oa9BOJLOVeES2/by13HMPVMYLJqiyhdXJ/Op0G/fEVmQCargFkAu+q5hPZu32D2KN47fod2sxg/1RYMy0dWpH9zOpGAN8d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427078; c=relaxed/simple;
	bh=tbxvMhKMoUgQ8xgacMHM6o+WB4IiClC5JPiA7OgU4bQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hgu1h9PwKGdnGy3bEYSUN20qy6qzPYPa05eaE8lUnPABIqDndmOEpmbeEP/aIDt3WsQ7VzN89omxkaMX67NAHE/favj3CAnXi+TbofuDWrqqsR9i2MTHfeBmHPpL4WBkqlfU16UzNsRtIVRXbEW57Li+ekmmMiGPdDaIMn0J4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5GCSB7O; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5GCSB7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774427077; x=1805963077;
  h=date:from:to:cc:subject:message-id;
  bh=tbxvMhKMoUgQ8xgacMHM6o+WB4IiClC5JPiA7OgU4bQ=;
  b=C5GCSB7O9HOSvy5rf3IewA9TGSK7PpPpdPykiKIh1HRcU5p9FwzvT93+
   KpMjkE/xheVy5xYyo/2OVEfqJHL0oD1uriVeFIc8vz5Y/iWUjjL28eD6S
   Xhii60byku1uZ4xVjuSEyqfsFbL3wdIP2K6gB0/WfkBxZ4/sB4JKFUmhU
   7BVGFsi5LbPuOmlex9LIWy9XX4yMxci7a12s/e5bRovb2uInd5kueCrfR
   ickLXAmQeIuP13fhjxD4GTTYp3N7lYf5VrNGPUou9U+rbghAYwgAVZ7dP
   m6F87ezXYoQbrC86Aw1Db4i33QrvKHbnSmVL3EkpdEQ6gTQeIXu0BUvDM
   Q==;
X-CSE-ConnectionGUID: 4u/LTkYxRzaheh/acPJjYw==
X-CSE-MsgGUID: cFUTZxnfQTKgskHUolcelQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75527711"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75527711"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 01:24:36 -0700
X-CSE-ConnectionGUID: lTl1a3F1T8uN2X36pLktVg==
X-CSE-MsgGUID: SWhtFFpJT/SH2mSQOrD24g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229385977"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Mar 2026 01:24:36 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5JXU-000000006UL-3sgX;
	Wed, 25 Mar 2026 08:24:32 +0000
Date: Wed, 25 Mar 2026 16:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 44/44]
 drivers/gpu/drm/xe/xe_pxp_multi_session.c:34: warning: Excess struct member
 'exec' description in 'xe_pxp_client'
Message-ID: <202603251643.0IP9B3WU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Daniele,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   bb47b925bb600e95cd776d4ab19d2b6c2ae342c7
commit: 6c20834df647ecc1e5510340e4139e99d9d64841 [44/44] ANDROID: drm/xe/pxp_multi: Add ioctl to initialize and query client handle
config: i386-randconfig-141-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251643.0IP9B3WU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251643.0IP9B3WU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251643.0IP9B3WU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_pxp_multi_session.c:34: warning: Function parameter or struct member 'res' not described in 'xe_pxp_client'
>> drivers/gpu/drm/xe/xe_pxp_multi_session.c:34: warning: Excess struct member 'exec' description in 'xe_pxp_client'


vim +34 drivers/gpu/drm/xe/xe_pxp_multi_session.c

    19	
    20	/**
    21	 * struct xe_pxp_client
    22	 *
    23	 * We dont need to allocate multiple execution resources (above struct)
    24	 * for a single drm_client that is executing multiple PXP sessions.
    25	 * So we use a link list of nodes indexed by the drmclient handle
    26	 */
    27	struct xe_pxp_client {
    28		/** @link: achor for linked list. */
    29		struct list_head link;
    30		/** @exec: session execution resource for a given client. */
    31		struct xe_pxp_gsc_client_resources res;
    32		/** @drmfile: drm_file handle for a given client. */
    33		struct drm_file *drmfile;
  > 34	};
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

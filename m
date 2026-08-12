Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497A54949FA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 22:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786574525; cv=none; b=Ivmtlg0fzcuiNu4j1snFMcDg0rBKgARh5ptN3cDPxrKQglfwEm2Nuey2kqHFSE5NSfB0c/8jfHSj6JQJRVEAGyqVQlKPXkP26kctTnflLgu+A/JudPjum6mph9At/p/D63sWbjd9+6gZYNBuodqAIJb8ozy91Md+ZBNNE+Hg00g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786574525; c=relaxed/simple;
	bh=ZDTVdipAyJmFAb2NAl9wMDeE/HZlmGq+cCa/4qTKw8E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eW/J1hemvI0kLZs2lg6/QoZbeBU6eAvgDTzdaLDd5OlDannqA5YgReOFJ3Qsb6vH4wkyAbvBOxuydXfEHh60ZHdkr5OgDLp9WhTf+LLRJMFzHbriPJlevor4xjGKFGefeqqOgGniL8F+U1YMLaI1mB7yeQEe8YfGitZtDDLZ4Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkwYIWN1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkwYIWN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786574524; x=1818110524;
  h=date:from:to:cc:subject:message-id;
  bh=ZDTVdipAyJmFAb2NAl9wMDeE/HZlmGq+cCa/4qTKw8E=;
  b=bkwYIWN1769A+9JRNrPR9gZbZtvBwO6NRJVZaDSTmxuy25PDabNygEeD
   IW1xx4VZrG5IfLBMeCKjOh20Ph1MS9qiP/hgFIYnD7GiWJ8CaSgIVHTUD
   XVN3cTgkwWC/wfW4cihog5ROLC+MEnNFBmBp5XwS9nb1/FdY68KHnjuy9
   6WeqIN++9eug1Rb76RvngcZXpRp00FBfCH89oQbxTFEhXtoRquWc/GKQp
   athkYeuzYpEowIbA075QssN6GKwRmEdJ8HvT9lWfkC3k2tLqJgOOO7wjK
   H4YcOS+eDdPJ+cz58z/ys14iephC6RbNTDaiMkqYwSSc7gabyYKQH4Tl8
   g==;
X-CSE-ConnectionGUID: 24O3J0dGRki1asyzqGSt1g==
X-CSE-MsgGUID: RZ1bBk/lTB2knEjtTN8DFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87162688"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87162688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 15:42:04 -0700
X-CSE-ConnectionGUID: xcx0euv1Qpi4BM3aSOkENw==
X-CSE-MsgGUID: 4Dpe4CF6TF+NsrQj/JQ+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="259518776"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2026 15:42:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuHe4-00000000RwE-1FzG;
	Wed, 12 Aug 2026 22:42:00 +0000
Date: Thu, 13 Aug 2026 06:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/gpu/drm/xe/xe_pxp_multi_session.c:34: warning: Function parameter or
 struct member 'res' not described in 'xe_pxp_client'
Message-ID: <202608130646.Qd4AmxmK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Daniele,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: 6c20834df647ecc1e5510340e4139e99d9d64841 [1/1] ANDROID: drm/xe/pxp_multi: Add ioctl to initialize and query client handle
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130646.Qd4AmxmK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130646.Qd4AmxmK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130646.Qd4AmxmK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_pxp_multi_session.c:34: warning: Function parameter or struct member 'res' not described in 'xe_pxp_client'
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

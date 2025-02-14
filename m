Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D0714830C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 03:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739503690; cv=none; b=DpyzzQRUoKfhLNGqu9WwGct+wJjFDyK7MQOEjKyYOcYjXyCzSPs9KlKUIn8aufBTt1M5IkwcAXUqyvR6Gq/UygKaxI5DUhmzygtnoebavT6yWLUZAqCUjTNQoBlNZYj0+r9zjT6vrjfhtThpRh24mPOES5drca6rqPP9nK9gLRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739503690; c=relaxed/simple;
	bh=0IJ7KIhDAjiOf0rLwL66f8OgWgu3WbVQCNDZCltJ53M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zum1CL9cbVuV+zxDMZ3KNriEG3jzKDUatLkgtF8NXwuxakTf4Ixp2mbaQPlmhnqkNNUApkFVJC30B+za3geItW1tto9scCsvLZdP9CBEPMUnek8ok21N+OqWmkxzAM6WqEebuvpwwg/CDbQ2E97eKQlYgwrxwZhoymXti/V6nq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naQjzf5+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naQjzf5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739503689; x=1771039689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0IJ7KIhDAjiOf0rLwL66f8OgWgu3WbVQCNDZCltJ53M=;
  b=naQjzf5+Q2rn1qa93/ajK38jB1GmhiNNmHt0vl8g4c0UDVLHo+0V42IT
   jD5KajwGeDNsnVwgNr9K5ZyEjIZiOBgzSPp3ppq3h3SWCElacfz6qjh/y
   qYi0m0mthPBB87ExWX5DVM5i6AHCsReyGFVFABMFRN4Cw2tAlYkFQEImC
   /G3JvBxxTdS7emkRdaCnGLcWenQXch3myZB/2sWB+d9ljwGIQagntfkbs
   mSYGk93tMfOiYiKc3+EykBmDxosTFwZe2qONcMdThVRazI8Uvpk7Wf6fg
   e3H0FxLsbZwCXxYz9KMYVWYQu8jSphwJyq39MwMMO+VYymecNNCkfJ2pE
   Q==;
X-CSE-ConnectionGUID: IqvJ8t5WTnmfMCY08QFPmA==
X-CSE-MsgGUID: UfagjoNQTWiEQ1oHfhxCIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50885361"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="50885361"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 19:28:08 -0800
X-CSE-ConnectionGUID: OYyroNu7RcetJ9le40Ch9w==
X-CSE-MsgGUID: pSrenbBkRZSNahTBUFvpNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118549332"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Feb 2025 19:28:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1timN2-001919-1n;
	Fri, 14 Feb 2025 03:28:04 +0000
Date: Fri, 14 Feb 2025 11:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>
Subject: [djiang:cxl/fwctl 19/25] ./usr/include/cxl/features.h:104:17: error:
 unknown type name 'u8'
Message-ID: <202502141101.hVFxNq8Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   368060188b78ad57197303bbffb78081837a7481
commit: 7cba274115899fa86fbaa2d90b2ed46274906fd0 [19/25] cxl: Move cxl feature command structs to user header
config: i386-buildonly-randconfig-002-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141101.hVFxNq8Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141101.hVFxNq8Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141101.hVFxNq8Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from usr/include/linux/posix_types.h:5,
                    from usr/include/linux/types.h:9,
                    from ./usr/include/cxl/features.h:10,
                    from <command-line>:
>> ./usr/include/cxl/features.h:104:17: error: unknown type name 'u8'
     104 |                 u8 version;
         |                 ^~
   usr/include/linux/stddef.h:35:26: note: in definition of macro '__struct_group'
      35 |                 struct { MEMBERS } ATTRS; \
         |                          ^~~~~~~
   ./usr/include/cxl/features.h:105:17: error: unknown type name 'u8'
     105 |                 u8 rsvd[9];
         |                 ^~
   usr/include/linux/stddef.h:35:26: note: in definition of macro '__struct_group'
      35 |                 struct { MEMBERS } ATTRS; \
         |                          ^~~~~~~
>> ./usr/include/cxl/features.h:104:17: error: unknown type name 'u8'
     104 |                 u8 version;
         |                 ^~
   usr/include/linux/stddef.h:36:50: note: in definition of macro '__struct_group'
      36 |                 struct __struct_group_tag(TAG) { MEMBERS } ATTRS NAME; \
         |                                                  ^~~~~~~
   ./usr/include/cxl/features.h:105:17: error: unknown type name 'u8'
     105 |                 u8 rsvd[9];
         |                 ^~
   usr/include/linux/stddef.h:36:50: note: in definition of macro '__struct_group'
      36 |                 struct __struct_group_tag(TAG) { MEMBERS } ATTRS NAME; \
         |                                                  ^~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

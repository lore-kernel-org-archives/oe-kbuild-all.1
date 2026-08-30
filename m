Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EC27082D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 08:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788077419; cv=none; b=Q6benZzKMrISsDicmHyCDNgj3e8ge5JUO3dfreKv1RoQb85jzByxa3jk8vGvxIuABl/DkMPphg2qqmaHyxwcTH8EWR22AMFIZs56+rGsgcnD9v8n70j+A71qJqK3xf9YTejQ/vv839gF3Rj+cZ07JdLwCba5lQvRTl6wqmgNC2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788077419; c=relaxed/simple;
	bh=2z95/c2v3IeH56NqwNPGb2Dhw1vSFmdf+R7ETKNhXqQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AX6OFgZWzMu00IIPqs8RWsK4P3q9GOAl9+ck8T2ciZQg/u9T+7LCNU4PqNDpzWJLfVoNKP54MbiBlAtyimqIkQEq+eoz00rFg52GzZ1pFuS4/h/V+SK1Y2cuPtbCWL1yAk7p/HPCECu+uaDvasbCIzRtgBi+yVgGjNQzKLerWa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuYfWidD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuYfWidD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788077418; x=1819613418;
  h=date:from:to:cc:subject:message-id;
  bh=2z95/c2v3IeH56NqwNPGb2Dhw1vSFmdf+R7ETKNhXqQ=;
  b=PuYfWidDfEcusRqMHqjYSdin5PbJUmZm7rk0MMrdiSa9wMKS86TwsIue
   le9fJmu1rV+eUcMY0zciYsuPvZf7or+Pdf4LxjQ4thQtpsHdwQX5lgnBj
   zWsGmUXp163uYIhrKhnx5hIA5T6CvQbTt3thiniKv/U52rFVxWjw2tF3v
   HqUJ940YQNa211A9jr1/+Zs10GGpVYeBv9jEinR30IWmwmydDfBVRDDa9
   uvKl6h6iiIqAu1fA1LQEMUeptT/LunHbTUuPs87uvUbBNDc+eOKH61HSG
   oscAZZ40cksLD6FEQKS1KBdNA1lFVWnEXACFLLK7t4w+kq55392spWnKb
   A==;
X-CSE-ConnectionGUID: F9J/L+CtTRqCE5LS1tVqwg==
X-CSE-MsgGUID: W0Eo4z1ASdi9nTMg8oFxkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="98851037"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="98851037"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 01:10:17 -0700
X-CSE-ConnectionGUID: azJD450hQ7+c6+FxhQN+rA==
X-CSE-MsgGUID: kVO55WcmTFirBOsIMsJR+Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Aug 2026 01:10:14 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0acG-00000000DiY-0S1P;
	Sun, 30 Aug 2026 08:10:12 +0000
Date: Sun, 30 Aug 2026 16:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kelvin Zhang <zhangxp1998@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:feature/subpage 1/10] include/linux/f2fs_fs.h:431:31:
 error: flexible array member in a struct with no named members
Message-ID: <202608301649.G22k4ucE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/subpage
head:   3a537197e7b9327a386b4c5deab273a387072d1f
commit: c2b3b99e814a6c70d1498fbd92d0d459901fc876 [1/10] f2fs: describe SIT block layout dynamically
config: m68k-randconfig-r072-20260830 (https://download.01.org/0day-ci/archive/20260830/202608301649.G22k4ucE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608301649.G22k4ucE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608301649.G22k4ucE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:10:
>> include/linux/f2fs_fs.h:431:31: error: flexible array member in a struct with no named members
     431 |         struct f2fs_sit_entry entries[];
         |                               ^~~~~~~
--
   In file included from fs/f2fs/segment.c:9:
>> include/linux/f2fs_fs.h:431:31: error: flexible array member in a struct with no named members
     431 |         struct f2fs_sit_entry entries[];
         |                               ^~~~~~~
   fs/f2fs/segment.c: In function 'f2fs_flush_sit_entries':
>> fs/f2fs/segment.c:4865:37: warning: variable 'sit_offset' set but not used [-Wunused-but-set-variable]
    4865 |                         int offset, sit_offset;
         |                                     ^~~~~~~~~~
--
   In file included from f2fs/segment.c:9:
>> include/linux/f2fs_fs.h:431:31: error: flexible array member in a struct with no named members
     431 |         struct f2fs_sit_entry entries[];
         |                               ^~~~~~~
   f2fs/segment.c: In function 'f2fs_flush_sit_entries':
   f2fs/segment.c:4865:37: warning: variable 'sit_offset' set but not used [-Wunused-but-set-variable]
    4865 |                         int offset, sit_offset;
         |                                     ^~~~~~~~~~


vim +431 include/linux/f2fs_fs.h

   424	
   425	/*
   426	 * The on-disk SIT block is a filesystem-block-sized array of SIT entries.
   427	 * Its entry count depends on the filesystem block size, so it must be
   428	 * calculated by the caller rather than implied by this C structure.
   429	 */
   430	struct f2fs_sit_block {
 > 431		struct f2fs_sit_entry entries[];
   432	} __packed;
   433	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

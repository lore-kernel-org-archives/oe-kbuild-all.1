Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4B02DEA7B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 06:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760337504; cv=none; b=qqCHeyjzMJoZyZTUdZjUOnYQ0QpqUaJOWPZu3yFQPePs6N5APj74AAH/CUBIHqHzLFBjJl1pMAwY/g93r98Eq2qZfxw7bjlPIVoFHXyqryrd/+rJDRHia/t5fPuygS79QEpSL+u4Z9jedrsvvb9Bx19A0jK/i3C9RBaqeS21BC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760337504; c=relaxed/simple;
	bh=u+KJ3J5hocETP52HDs8puNL6tGEF6iXXX8jni8LBMkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ezRDImpXs3oeY3luSmS0bdG5LGZLxYYuP8z6bnK+JUHwaFBi4wW2M5sbGDTQFRBgmZdBLiuk/+k3IVPIpP3Vf//ymGTY0uiiRB112Slc1rWLrLzKSg+/EOkMn7uqhSEMmKM/AyyrPY90ufyD1VwM4ZfU+ggfJoUJDDuU1qCx4bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Twb6IZHY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Twb6IZHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760337503; x=1791873503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u+KJ3J5hocETP52HDs8puNL6tGEF6iXXX8jni8LBMkg=;
  b=Twb6IZHYX27TrnLycMqqsTAf6OhD0+emMRc8QvaH/dQze2bV6ofE5T3o
   IZR8hO+NV4SP5xXWqQkp4UYYYSXJ8HGBkfD9jpZHSJTjkqjPEo6qJ5hSu
   nbzU0c4iiUPh1Bnr1twLi02cvTJbjzmwpILW1b5LUMhElLas4SicWHMXG
   UFnbyEcWG1TqLuM2MP1MBgzLEtGUkS8CDq0mDWwOxwrWq1FMOAarWWNo1
   HCEvk/Bb9jn9QzzzErp+urvrynoMwPo56ALpgJyvoykoZMGN5Nt6x7Wii
   hNYRQojN2YC5UQd6pIfej1hD+4deqTs9ZL5yPN1nAitlBM0RNRRT+FV5n
   w==;
X-CSE-ConnectionGUID: N4DwRX0YQQOYoQd1CnffnQ==
X-CSE-MsgGUID: m8u7/UbtQF+xZFcf3TDqaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62385326"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62385326"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 23:38:22 -0700
X-CSE-ConnectionGUID: bry6tbGRSyy3yRJQoA8DcA==
X-CSE-MsgGUID: gJ+13iW/RC6097VAhG52Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="185929783"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 12 Oct 2025 23:38:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8CCI-0000Dn-0i;
	Mon, 13 Oct 2025 06:38:18 +0000
Date: Mon, 13 Oct 2025 14:37:59 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool/merge 66/70] error: objtool: --checksum not
 supported; install xxhash-devel and recompile
Message-ID: <202510131412.DEdNtoeO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool/merge
head:   f8a72ab791073ba755c7ea51cdbec6ad963351b8
commit: d118c28e401965b8db84cb00e3cb08bf6a1888d6 [66/70] livepatch/klp-build: Introduce klp-build script for generating livepatch modules
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251013/202510131412.DEdNtoeO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510131412.DEdNtoeO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510131412.DEdNtoeO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: objtool: --checksum not supported; install xxhash-devel and recompile
--
   drivers/input/mouse/sermouse.c: In function 'sermouse_connect':
   drivers/input/mouse/sermouse.c:240:61: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     240 |         snprintf(sermouse->phys, sizeof(sermouse->phys), "%s/input0", serio->phys);
         |                                                             ^~~~~~~
   drivers/input/mouse/sermouse.c:240:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     240 |         snprintf(sermouse->phys, sizeof(sermouse->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> error: objtool: --checksum not supported; install xxhash-devel and recompile
--
   drivers/input/mouse/vsxxxaa.c: In function 'vsxxxaa_connect':
   drivers/input/mouse/vsxxxaa.c:468:55: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     468 |         snprintf(mouse->phys, sizeof(mouse->phys), "%s/input0", serio->phys);
         |                                                       ^~~~~~~
   drivers/input/mouse/vsxxxaa.c:468:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     468 |         snprintf(mouse->phys, sizeof(mouse->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> error: objtool: --checksum not supported; install xxhash-devel and recompile
--
   sermouse.c: In function 'sermouse_connect':
   sermouse.c:240:61: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     240 |         snprintf(sermouse->phys, sizeof(sermouse->phys), "%s/input0", serio->phys);
         |                                                             ^~~~~~~
   sermouse.c:240:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     240 |         snprintf(sermouse->phys, sizeof(sermouse->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> error: objtool: --checksum not supported; install xxhash-devel and recompile
--
   vsxxxaa.c: In function 'vsxxxaa_connect':
   vsxxxaa.c:468:55: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     468 |         snprintf(mouse->phys, sizeof(mouse->phys), "%s/input0", serio->phys);
         |                                                       ^~~~~~~
   vsxxxaa.c:468:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     468 |         snprintf(mouse->phys, sizeof(mouse->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> error: objtool: --checksum not supported; install xxhash-devel and recompile

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A12E1758
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 10:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758711208; cv=none; b=ZoiBi1LcFRoB5ZlzjoiyFh5/HD5jj3ZDLNLRbveIv0mSpNhenecfZTfkyr3jyeUHrAIIjssg2c6cDB3FLhmtsju89LHNV180l4RxBNCxcAomPYzELjz+VAlueiyhrqW51x/BCA79ys7R+ajD390BUEX+l8DRcrjxTJw8edujP7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758711208; c=relaxed/simple;
	bh=LHxvxSmkdeweuXihq7xbAkQOxs2RzWZUhoqtUCK8pDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CfhekZWZ4cLfobkH+AR1LCN9+x64pE3azjnRsG5mW7bJmsZ8OcNRofug/qoLfRUPYjjL6P8lFS0lq/DPrkN5loqmPbsbi/sIzJUi7EwX1C2B0w6q9QmwLX8JtN87+2o59133V7/49xJycreK8P3PlK5UOHsTbw4HaDWHfoXFyBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQL8m3TT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQL8m3TT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758711203; x=1790247203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LHxvxSmkdeweuXihq7xbAkQOxs2RzWZUhoqtUCK8pDo=;
  b=aQL8m3TTVJp3x+N06ZQk7vh26GYwCyNS/nzLQQa6q5g2gVW7yTGvX47c
   4yK1lI5aqagvNkn0TMRqtwLqOdyFDNSEriGLUjTJImDX04Y732UjyYEjf
   O6AERa0UjFZmNOsrqaAWL9qwE4n19ZUY+yU12TEHThqFD14aXQQCCD08e
   NztO5pdYo4blw7mIUlYOz68iPHGyrXrguoaQK6j0dSJS6fJS3+eKrzTG2
   +pD80yh4JYdoFl84PFZAYpkfi6u2mHYq2oH3fgqqZGVg/Jf64olFhpmka
   F/Nv9jQEkIk7QwYMw2IOyu9hEfnfbI77SoWg+5RbLtLoeYIw5b/U5osVv
   A==;
X-CSE-ConnectionGUID: KanxZpQGTfKh0pI7ncwRiQ==
X-CSE-MsgGUID: sMOVpaTYSQW8Mewhi20WcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63631559"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="63631559"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 03:53:22 -0700
X-CSE-ConnectionGUID: 8MmbKL04QkWL9/OQ8gN/nA==
X-CSE-MsgGUID: hFsA0pAITJWvOwSW++5Saw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="182174582"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 24 Sep 2025 03:53:21 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1N7d-000000004TJ-3BfB;
	Wed, 24 Sep 2025 10:53:17 +0000
Date: Wed, 24 Sep 2025 12:52:41 +0200
From: kernel test robot <lkp@intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [intel-lts:5.15/android_u 3/3] htmldocs:
 ./include/uapi/linux/rpmb.h:168: warning: expecting prototype for struct
 rpmb_cmd. Prototype was for struct rpmb_ioc_cmd instead
Message-ID: <202509241227.GhUdjg6C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_u
head:   038b979913cc03833b6d6cc18d3a50f11d1040b6
commit: a2d17e22111160662f622d94e4ed6c6740330039 [3/3] char: rpmb: Document Replay Protected Memory Block (RPMB) subsystem
reproduce: (https://download.01.org/0day-ci/archive/20250924/202509241227.GhUdjg6C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241227.GhUdjg6C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/intel,ixp46x-rng.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/intel,kmb_display.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/imx8-jpeg.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/driver-api/rpmb.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/regulator/silergy,sy8106a.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: fs/locks.c references a file that doesn't exist: Documentation/filesystems/mandatory-locking.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
--
   Error: Cannot open file ./include/linux/reset.h
   Error: Cannot open file ./include/linux/reset.h
   Error: Cannot open file ./include/linux/reset-controller.h
   Error: Cannot open file ./include/linux/reset-controller.h
   Error: Cannot open file ./include/linux/rpmb.h
>> ./include/uapi/linux/rpmb.h:168: warning: expecting prototype for struct rpmb_cmd. Prototype was for struct rpmb_ioc_cmd instead
   Error: Cannot open file ./include/linux/slimbus.h
   Error: Cannot open file ./include/linux/slimbus.h
   Error: Cannot open file ./include/linux/spi/spi.h
   Error: Cannot open file ./include/linux/spi/spi.h
   Error: Cannot open file ./include/linux/surface_aggregator/serial_hub.h
--
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/regulator/machine.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/regulator/driver.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/reset.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/reset-controller.h' failed with return code 2
   Documentation/driver-api/rpmb/introduction.rst:79: ERROR: Unexpected indentation. [docutils]
>> Documentation/driver-api/rpmb/introduction.rst:80: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/rpmb.h' failed with return code 1
   Documentation/driver-api/rpmb/introduction:120: ./drivers/char/rpmb/core.c:80: WARNING: Duplicate C declaration, also defined at driver-api/rpmb/introduction:32.
   Declaration is '.. c:function:: int rpmb_cmd_seq (struct rpmb_dev *rdev, struct rpmb_cmd *cmds, u32 ncmds)'. [duplicate_declaration.c]
   Documentation/driver-api/rpmb/introduction:120: ./drivers/char/rpmb/core.c:110: WARNING: Duplicate C declaration, also defined at driver-api/rpmb/introduction:37.
   Declaration is '.. c:function:: int rpmb_get_capacity (struct rpmb_dev *rdev)'. [duplicate_declaration.c]
>> Documentation/driver-api/rpmb/rpmb-tool.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/slimbus.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/spi/spi.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/surface_aggregator/serial_hub.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/surface_aggregator/controller.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/surface_aggregator/device.h' failed with return code 1


vim +168 ./include/uapi/linux/rpmb.h

3071f7f819138e Tomas Winkler 2015-07-16  152  
3071f7f819138e Tomas Winkler 2015-07-16  153  /**
3071f7f819138e Tomas Winkler 2015-07-16  154   * struct rpmb_cmd - rpmb access command
3071f7f819138e Tomas Winkler 2015-07-16  155   *
3071f7f819138e Tomas Winkler 2015-07-16  156   * @flags: command flags
3071f7f819138e Tomas Winkler 2015-07-16  157   *      0 - read command
3071f7f819138e Tomas Winkler 2015-07-16  158   *      1 - write command RPMB_F_WRITE
3071f7f819138e Tomas Winkler 2015-07-16  159   *      2 - reliable write RPMB_F_REL_WRITE
3071f7f819138e Tomas Winkler 2015-07-16  160   * @nframes: number of rpmb data frames in the command.
3071f7f819138e Tomas Winkler 2015-07-16  161   *           0 means 1 frame with meta data only.
3071f7f819138e Tomas Winkler 2015-07-16  162   * @frames_ptr:  a pointer to the list of rpmb frames
3071f7f819138e Tomas Winkler 2015-07-16  163   */
3071f7f819138e Tomas Winkler 2015-07-16  164  struct rpmb_ioc_cmd {
3071f7f819138e Tomas Winkler 2015-07-16  165  	__u32 flags;
3071f7f819138e Tomas Winkler 2015-07-16  166  	__u32 nframes;
3071f7f819138e Tomas Winkler 2015-07-16  167  	__aligned_u64 frames_ptr;
3071f7f819138e Tomas Winkler 2015-07-16 @168  };
3071f7f819138e Tomas Winkler 2015-07-16  169  

:::::: The code at line 168 was first introduced by commit
:::::: 3071f7f819138e910165410ce3471124629220c3 char: rpmb: provide a user space interface

:::::: TO: Tomas Winkler <tomas.winkler@intel.com>
:::::: CC: Pan, Kris <kris.pan@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

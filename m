Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C68D517
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 14:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735828185; cv=none; b=sx+1MNzsH5eLSM1w8WGgIwe0pCSs5AJLwsth8faMQRtVy6q5+8BUQPQU7gU+v25ZuKCwjAdN4VE58M1y5XPjbHwP+g4hVqQV2X4td4UUI6VSO1gg3DXisBlp3kLTOCIsUsBZm0Mg4SNC6Zs0oVUsYwPP6CZ6uNVI3NKHXHD1OMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735828185; c=relaxed/simple;
	bh=W/TMDKlM+yG68MH9dvTHfeCEqx1HvUgq6173nibAsIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YUaV3r+0coxXP/krxLmyu19bpp6WQFGyRvLmJVwXB5ICj6wL+3bRHpaTYrDM0mck4UlLJ+Q+2GiuS0+hbar/wCSo6R5fCWttzS8jTEpWkBIuDKnyXpek6GSmybT8bh7Nes7ziZn1AABUgOCobHyvWAW24XRIkbkGrZRIfK6BcEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+2VRAq+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+2VRAq+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735828183; x=1767364183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/TMDKlM+yG68MH9dvTHfeCEqx1HvUgq6173nibAsIA=;
  b=R+2VRAq+VQWUbOIID6mfnAApo5dTZpiF5ekUaVv2qGBU1d79KEm6U1bL
   J8YnaZqsMFcOzBns40xZa6GV1/+42h0cUK3uxUNyaIrxG7ANDGKFKm9z5
   +o9oTpo9YMpoj97emqDSoo+HYydDDRVz7J1daGtpVCXECj43CX2kFtRKq
   C2Z+b0iypf/Iq8mDNsh90fqXNqe0KfBgUQXsRjQwHwTG4JIvEyVF/OVkj
   YVzSEYRVtX9ajBW/+qBESiMmMFi5UDrt0j8TIt6MS/u7QpWI/a3dqRZPb
   bpKBi/DmeTc0vXcX36XxCrCva7dglt59mNeVOwxIfZTGsKaX7x2JK7V/l
   w==;
X-CSE-ConnectionGUID: EklHOKsLT6qKBujXuoFjuA==
X-CSE-MsgGUID: QhfylT8AQ+Oab+ZRRfoc1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="39742350"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="39742350"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 06:29:43 -0800
X-CSE-ConnectionGUID: nJfyBp+wQzKOQHHl+TlJlQ==
X-CSE-MsgGUID: i7zH4F9CSHGtyx5btLaQtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102366409"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Jan 2025 06:29:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTMCg-0008Z5-2q;
	Thu, 02 Jan 2025 14:29:38 +0000
Date: Thu, 2 Jan 2025 22:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 774/5236] samples/vfs/mountinfo.c:142:29:
 warning: format '%lx' expects argument of type 'long unsigned int', but
 argument 2 has type 'uint64_t' {aka 'long long unsigned int'}
Message-ID: <202501022241.dIsZdFET-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: 0c8f746452aa75bbca927a9f5e9d0a7e69b892a4 [774/5236] samples: add a mountinfo program to demonstrate statmount()/listmount()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250102/202501022241.dIsZdFET-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501022241.dIsZdFET-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501022241.dIsZdFET-lkp@intel.com/

All warnings (new ones prefixed by >>):

   samples/vfs/mountinfo.c: In function 'dump_mountinfo':
>> samples/vfs/mountinfo.c:142:29: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'uint64_t' {aka 'long long unsigned int'} [-Wformat=]
     142 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
         |                           ~~^                 ~~~~~~~~~
         |                             |                 |
         |                             long unsigned int uint64_t {aka long long unsigned int}
         |                           %llx
   samples/vfs/mountinfo.c:142:35: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'uint64_t' {aka 'long long unsigned int'} [-Wformat=]
     142 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
         |                                 ~~^                      ~~~~~~
         |                                   |                      |
         |                                   long unsigned int      uint64_t {aka long long unsigned int}
         |                                 %llx


vim +142 samples/vfs/mountinfo.c

   124	
   125	static int dump_mountinfo(uint64_t mnt_id, uint64_t mnt_ns_id)
   126	{
   127		int ret;
   128		struct statmount *buf = alloca(STATMOUNT_BUFSIZE);
   129		const uint64_t mask = STATMOUNT_SB_BASIC | STATMOUNT_MNT_BASIC |
   130					STATMOUNT_PROPAGATE_FROM | STATMOUNT_FS_TYPE |
   131					STATMOUNT_MNT_ROOT | STATMOUNT_MNT_POINT |
   132					STATMOUNT_MNT_OPTS | STATMOUNT_FS_SUBTYPE |
   133					STATMOUNT_SB_SOURCE;
   134	
   135		ret = statmount(mnt_id, mnt_ns_id, mask, buf, STATMOUNT_BUFSIZE, 0);
   136		if (ret < 0) {
   137			perror("statmount");
   138			return 1;
   139		}
   140	
   141		if (ext_format)
 > 142			printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
   143	
   144		printf("%u %u %u:%u %s %s ", buf->mnt_id_old, buf->mnt_parent_id_old,
   145					   buf->sb_dev_major, buf->sb_dev_minor,
   146					   &buf->str[buf->mnt_root],
   147					   &buf->str[buf->mnt_point]);
   148		show_mnt_attrs(buf->mnt_attr);
   149		show_propagation(buf);
   150	
   151		printf(" - %s", &buf->str[buf->fs_type]);
   152		if (buf->mask & STATMOUNT_FS_SUBTYPE)
   153			printf(".%s", &buf->str[buf->fs_subtype]);
   154		if (buf->mask & STATMOUNT_SB_SOURCE)
   155			printf(" %s ", &buf->str[buf->sb_source]);
   156		else
   157			printf(" :none ");
   158	
   159		show_sb_flags(buf->sb_flags);
   160		if (buf->mask & STATMOUNT_MNT_OPTS)
   161			printf(",%s", &buf->str[buf->mnt_opts]);
   162		printf("\n");
   163		return 0;
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

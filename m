Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D77742AA9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 04:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731470419; cv=none; b=TczJlP47LXxs+Why6o1Igc/l1slmXkkYOM1hsoAIfBDDWOWZak7ktoDtwhhbDUj2bFgzCW/899fA4jUyzO4jaHiglBg2oDYhiGolPW5imOC7bmMowfBfyme2C5HU+BzoX4U3++2uP47Z+fjaAD0RZD6LkJkSFfiiAr2ZuRg+NRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731470419; c=relaxed/simple;
	bh=A2FqQ4qmW1xm2h1NPAUpdRfDMVxNGww2Ydj6ShxHURA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aLZAQLAgoBwPNbJuQ1jikX55eFNytkim2jFnKOFz2jOo3lXK5SQbXcZrx5xEMh/mMrc02/Q+bKCHqBxMl2A6qwTl/SA3iSNyvwAFAlEwbGMzVAQl2+pPLmKfgmgVEW45gYblNhVfRTqQdTgCX/yO0BbL+uMLYmaBDglK3c/S4tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zudec+R2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zudec+R2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731470417; x=1763006417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A2FqQ4qmW1xm2h1NPAUpdRfDMVxNGww2Ydj6ShxHURA=;
  b=Zudec+R2kyG/mfUGiPItYS2e/A+27OJaVPM94RlTgRN8GKHoS1xlB8EI
   wdwABEvGOl1Z/Yxz168fJcZyEu4W5OBpd9162VGwb89PtQ+AAkR/4Y0Z6
   d4m8Xk3kt9Z2Uu5COlzaBuBdEDh5GMIPkYDoviI5POmH1Yt188yENnCbE
   qNNnyKH1rH3TtStmv2kxUyqrMZO3AEcTenA4ahT6x2P8Og5hW+U9j+EvR
   piZE0vBWxjPOnnS5hAQiyivV3Jo5vIuc10o29rxULEXIipjU/2i2/gNst
   isfXqtBMTgqfwp8B9/jLaOjCet0kU3lPpQ33dXvqSVimWdnmfz8V9hNwI
   w==;
X-CSE-ConnectionGUID: fCn2vEpESviXNeks8ruYpQ==
X-CSE-MsgGUID: Rt9PCXZHTyO1wscX/Bx4Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="41952137"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="41952137"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 20:00:17 -0800
X-CSE-ConnectionGUID: LGiklfxMSF2cNm8C9XlYqQ==
X-CSE-MsgGUID: rjW5WLknSQ+4XACuX8dFnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87894186"
Received: from lkp-server01.sh.intel.com (HELO c782e932e0d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2024 20:00:16 -0800
Received: from kbuild by c782e932e0d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB4Y9-000039-1p;
	Wed, 13 Nov 2024 04:00:13 +0000
Date: Wed, 13 Nov 2024 12:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:statmount 5/5] samples/vfs/mountinfo.c:122:21: warning:
 format '%lx' expects argument of type 'long unsigned int', but argument 2
 has type 'uint64_t' {aka 'long long unsigned int'}
Message-ID: <202411131139.1qjgvfqh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git statmount
head:   b362a0ea5036587314ee0f8f5cbc491cd4ded303
commit: b362a0ea5036587314ee0f8f5cbc491cd4ded303 [5/5] samples: add a mnt-ns-walk program to demonstrate statmount()/listmount()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241113/202411131139.1qjgvfqh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131139.1qjgvfqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131139.1qjgvfqh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   samples/vfs/mountinfo.c: In function 'dump_mountinfo':
>> samples/vfs/mountinfo.c:122:21: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'uint64_t' {aka 'long long unsigned int'} [-Wformat=]
     122 |         printf("0x%lx 0x%lx %u:%u %s %s ", mnt_id, buf->mnt_parent_id,
         |                   ~~^                      ~~~~~~
         |                     |                      |
         |                     long unsigned int      uint64_t {aka long long unsigned int}
         |                   %llx
>> samples/vfs/mountinfo.c:122:27: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type '__u64' {aka 'long long unsigned int'} [-Wformat=]
     122 |         printf("0x%lx 0x%lx %u:%u %s %s ", mnt_id, buf->mnt_parent_id,
         |                         ~~^                        ~~~~~~~~~~~~~~~~~~
         |                           |                           |
         |                           long unsigned int           __u64 {aka long long unsigned int}
         |                         %llx

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +122 samples/vfs/mountinfo.c

   106	
   107	static int dump_mountinfo(uint64_t mnt_id, uint64_t mnt_ns_id)
   108	{
   109		int ret;
   110		struct statmount *buf = alloca(STATMOUNT_BUFSIZE);
   111		const uint64_t mask = STATMOUNT_SB_BASIC | STATMOUNT_MNT_BASIC |
   112					STATMOUNT_PROPAGATE_FROM | STATMOUNT_FS_TYPE |
   113					STATMOUNT_MNT_ROOT | STATMOUNT_MNT_POINT |
   114					STATMOUNT_MNT_OPTS | STATMOUNT_FS_SUBTYPE |
   115					STATMOUNT_SB_SOURCE;
   116	
   117		ret = statmount(mnt_id, mnt_ns_id, mask, buf, STATMOUNT_BUFSIZE, 0);
   118		if (ret < 0) {
   119			perror("statmount");
   120			return 1;
   121		}
 > 122		printf("0x%lx 0x%lx %u:%u %s %s ", mnt_id, buf->mnt_parent_id,
   123					   buf->sb_dev_major, buf->sb_dev_minor,
   124					   &buf->str[buf->mnt_root],
   125					   &buf->str[buf->mnt_point]);
   126		show_mnt_attrs(buf->mnt_attr);
   127		show_propagation(buf);
   128	
   129		printf(" - %s", &buf->str[buf->fs_type]);
   130		if (buf->mask & STATMOUNT_FS_SUBTYPE)
   131			printf(".%s", &buf->str[buf->fs_subtype]);
   132		if (buf->mask & STATMOUNT_SB_SOURCE)
   133			printf(" %s", &buf->str[buf->sb_source]);
   134		else
   135			printf(":none");
   136	
   137		show_sb_flags(buf->sb_flags);
   138		printf(",%s\n", &buf->str[buf->mnt_opts]);
   139		return 0;
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

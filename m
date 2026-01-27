Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB0F2C08D9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769504593; cv=none; b=W1zNCGHThB/ycbzogJZ/A2b0Mkl76Q7NEXFI9F12LpBF5SeF+Bf8fZjRur+JgY330KnjN0VYiT8LVdnhxUFC+VdraB3UpyhiZUhwhyfUYQ65yy7II63XSaXW4thwOYLG7vKVp73+82HfqWdlhGz46Y/z7o3m9F63ssq6DjP+su4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769504593; c=relaxed/simple;
	bh=sNDrrvGFdWHuLiVDvOveydwhGs+6de68rXZ6wZxHrqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a7aFLwS3xJ9GVK5iWq6S3vkKrhOoTyV1XMyEWwxi1puEipsIaYYaEAO2lp943o64vyNuvsYt5b/XMWG6jNUCqitkL2s7ISVlgFtIkSSslvSRNenyNPv1U/xQ6l2yY4bz2IdMnagb59vfr41X+fwXhEOHS8gF7RK6vW5CzJ6YCjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyUYzMp1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyUYzMp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769504592; x=1801040592;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sNDrrvGFdWHuLiVDvOveydwhGs+6de68rXZ6wZxHrqM=;
  b=hyUYzMp1xb99liacm2tbKs3FFRXwBo+2gWiZlg6ZCH8CKK/rWhdTwA1X
   /mdfyOc4DPy9GjOw5YyFKv0DOYfQzJ2SdGmzkgk5SVuakm4gzFk8nfMlH
   51Dlvt0kDhea2wO66VYajZOUQ6F2fSJ3XrL1v56d8fAa8wIUzrTdqRBhB
   V65WrLpD9FcXldTcREnT0xUO6/50UU4PJRo5C7t7qhyy6R3W67lH7GR0o
   XdXgE9FsVTD64OuueD9ZFesCP1wUJZSkE3N7EDzxmyz3MOETbZO3V89wW
   VUtDr476hxztwddMYTPPiwLRwdmBz6cdEqFe3CJwJudUHTV7+H2cQIgCx
   g==;
X-CSE-ConnectionGUID: jljoZULeQGSZWfUc+xmLtQ==
X-CSE-MsgGUID: Oy5ReY3XQdyUu+hAAQ5B3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="80999158"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="80999158"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:03:11 -0800
X-CSE-ConnectionGUID: uj3PcHOZRqmDbRuMpbBkaA==
X-CSE-MsgGUID: MIjCUwjSR4esdRg4oOoFvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="239190547"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jan 2026 01:03:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkeyY-00000000YCh-3Hc7;
	Tue, 27 Jan 2026 09:03:06 +0000
Date: Tue, 27 Jan 2026 17:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 2/2]
 mm/hmm.c:595:21: error: implicit declaration of function
 'mmu_interval_check_retry'
Message-ID: <202601271651.hXu1COou-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

First bad commit (maybe !=3D root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline-des=
ktop
head:   8663a74982749ac972892661bc11ff2316bc0a29
commit: 5fea46daeca8ba4ba6148654ffb6b8c6c5d9b71d [2/2] ANDROID: GKI: x86: E=
nable HMM_MIRROR as DRM hidden
config: x86_64-randconfig-104-20260127 (https://download.01.org/0day-ci/arc=
hive/20260127/202601271651.hXu1COou-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260127/202601271651.hXu1COou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271651.hXu1COou-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   mm/hmm.c: In function 'hmm_range_fault':
>> mm/hmm.c:595:21: error: implicit declaration of function 'mmu_interval_c=
heck_retry' [-Wimplicit-function-declaration]
     595 |                 if (mmu_interval_check_retry(range->notifier,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=3Dy] && CAN_DEV [=3Dn] && CAN_NETLINK [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=3Dy]


vim +/mmu_interval_check_retry +595 mm/hmm.c

7b86ac3371b70c Christoph Hellwig 2019-08-28  562 =20
9a4903e49e495b Christoph Hellwig 2019-07-25  563  /**
9a4903e49e495b Christoph Hellwig 2019-07-25  564   * hmm_range_fault - try =
to fault some address in a virtual address range
f970b977e068aa Jason Gunthorpe   2020-03-27  565   * @range:	argument struc=
ture
9a4903e49e495b Christoph Hellwig 2019-07-25  566   *
be957c886d92aa Jason Gunthorpe   2020-05-01  567   * Returns 0 on success o=
r one of the following error codes:
73231612dc7c90 J=C3=A9r=C3=B4me Glisse     2019-05-13  568   *
9a4903e49e495b Christoph Hellwig 2019-07-25  569   * -EINVAL:	Invalid argum=
ents or mm or virtual address is in an invalid vma
9a4903e49e495b Christoph Hellwig 2019-07-25  570   *		(e.g., device file vm=
a).
73231612dc7c90 J=C3=A9r=C3=B4me Glisse     2019-05-13  571   * -ENOMEM:	Out=
 of memory.
9a4903e49e495b Christoph Hellwig 2019-07-25  572   * -EPERM:	Invalid permis=
sion (e.g., asking for write and range is read
9a4903e49e495b Christoph Hellwig 2019-07-25  573   *		only).
9a4903e49e495b Christoph Hellwig 2019-07-25  574   * -EBUSY:	The range has =
been invalidated and the caller needs to wait for
9a4903e49e495b Christoph Hellwig 2019-07-25  575   *		the invalidation to f=
inish.
f970b977e068aa Jason Gunthorpe   2020-03-27  576   * -EFAULT:     A page wa=
s requested to be valid and could not be made valid
f970b977e068aa Jason Gunthorpe   2020-03-27  577   *              ie it has=
 no backing VMA or it is illegal to access
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  578   *
f970b977e068aa Jason Gunthorpe   2020-03-27  579   * This is similar to get=
_user_pages(), except that it can read the page tables
f970b977e068aa Jason Gunthorpe   2020-03-27  580   * without mutating them =
(ie causing faults).
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  581   */
be957c886d92aa Jason Gunthorpe   2020-05-01  582  int hmm_range_fault(struc=
t hmm_range *range)
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  583  {
d28c2c9a487708 Ralph Campbell    2019-11-04  584  	struct hmm_vma_walk hmm_=
vma_walk =3D {
d28c2c9a487708 Ralph Campbell    2019-11-04  585  		.range =3D range,
d28c2c9a487708 Ralph Campbell    2019-11-04  586  		.last =3D range->start,
d28c2c9a487708 Ralph Campbell    2019-11-04  587  	};
a22dd506400d0f Jason Gunthorpe   2019-11-12  588  	struct mm_struct *mm =3D =
range->notifier->mm;
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  589  	int ret;
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  590 =20
42fc541404f249 Michel Lespinasse 2020-06-08  591  	mmap_assert_locked(mm);
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  592 =20
a3e0d41c2b1f86 J=C3=A9r=C3=B4me Glisse     2019-05-13  593  	do {
a3e0d41c2b1f86 J=C3=A9r=C3=B4me Glisse     2019-05-13  594  		/* If range i=
s no longer valid force retry. */
a22dd506400d0f Jason Gunthorpe   2019-11-12 @595  		if (mmu_interval_check_=
retry(range->notifier,

:::::: The code at line 595 was first introduced by commit
:::::: a22dd506400d0f4784ad596f073b9eb5ed7c6a2a mm/hmm: remove hmm_mirror a=
nd related

:::::: TO: Jason Gunthorpe <jgg@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

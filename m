Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D6D3D969E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 19:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783539025; cv=none; b=Op8uGd7l6I9ZxF2SV6AjuOTZYJXEarJwGpFaFenrtpTmdeE/O9+M2pruQ0DqMZGzeP1+BBlV0Auq3FNn9ndyLEu6f9upArIb7pJDfkWBWpaucTtftQQsnKgbi84kQdxrzkmK2VuWqr506wIuFIrMhhze0Wlced+AO7aGT9qjY3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783539025; c=relaxed/simple;
	bh=Zh8BPVOWPHeFnwq+2Tb/03A/z2T74CSg5uGaWLyH7Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NU6X1Ec6HxAHOvAK6lD6+5B04Mcjw2j+NbEKwDkBkbg9BY7eMlT/TYk6Pixt3/NZyp3uRK4bU8LoFte2V3RNESug4X6Va35Cv6yhDYh5hdYPS31JX2/7bQ1YWhaNNWqKF0og31I3WNh/nlD1XnWtXobdHp1dlKaJ0MtXv1QErfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJB0ZCP5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJB0ZCP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783539021; x=1815075021;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Zh8BPVOWPHeFnwq+2Tb/03A/z2T74CSg5uGaWLyH7Pk=;
  b=fJB0ZCP5F7sgcCrH4bgqzBnpwLkyyzx7f9a20OZ05nJaQbZY0CdW2ic3
   CJmrGECRN+upPNkCvmB15MyIkH9JX5Di6aqkGiC54YlNxtAVlPE/GreNQ
   6WuDQ1s4ratBdT5Hy9VBo2QAZ7Ox0Vgl02OioN9gOw+DlQ11I86wcybcC
   Fb/9YwCsl7nAqc5cLwEYvcOZSlyEkhfzHaCe32KnFyOPV6UirGt2V0G5u
   nPlnLqWQmpzMzuF5jYt7n2l0lF82R4+BqZsBSuAvM7CPQ7Xns8zmSkXqr
   ocoqLhhzBG3Vdvk2pVPilyztsc49ReF6MzsbpAF1DjBG7XL2RobdRYPIa
   g==;
X-CSE-ConnectionGUID: ECrVRossTQCQ8AvoZohPfg==
X-CSE-MsgGUID: 4R80ANkESPCAdvza1kOFtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94570583"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94570583"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:30:19 -0700
X-CSE-ConnectionGUID: sQ3vE6ioTbaXfPybP/lVPw==
X-CSE-MsgGUID: d7v6pJDpQi2KysHIhsDSZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="252626113"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Jul 2026 12:30:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whXyI-00000000Gmd-3LAq;
	Wed, 08 Jul 2026 19:30:14 +0000
Date: Thu, 09 Jul 2026 03:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 mm/hmm.c:667:7: error: implicit declaration of function
 'mmu_interval_check_retry'; did you mean 'vma_interval_tree_remove'?
Message-ID: <202607090325.KOVc9nta-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android-mainline-des=
ktop
head:   adf8bc5941e7beff5b8ba6f64385d50c6b4d32c5
commit: ad36ecd6081db9827f1ebaa41671b0b336fd83bf [1/1] ANDROID: GKI: Enable=
 HMM_MIRROR config for all arch
config: arm64-randconfig-004-20260709 (https://download.01.org/0day-ci/arch=
ive/20260709/202607090325.KOVc9nta-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260709/202607090325.KOVc9nta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090325.KOVc9nta-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   mm/hmm.c: In function 'hmm_range_fault':
>> mm/hmm.c:667:7: error: implicit declaration of function 'mmu_interval_ch=
eck_retry'; did you mean 'vma_interval_tree_remove'? [-Werror=3Dimplicit-fu=
nction-declaration]
      if (mmu_interval_check_retry(range->notifier,
          ^~~~~~~~~~~~~~~~~~~~~~~~
          vma_interval_tree_remove
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for INTERCONNECT_QCOM
   Depends on [n]: INTERCONNECT [=3Dn] && ARCH_QCOM [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=3Dy] && ARCH_QCOM [=3Dy]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=3Dy] && SND [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=3Dn] && CAN_DEV [=3Dn] && CAN_NETLINK [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=3Dy]


vim +667 mm/hmm.c

7b86ac3371b70c Christoph Hellwig 2019-08-28  634 =20
9a4903e49e495b Christoph Hellwig 2019-07-25  635  /**
9a4903e49e495b Christoph Hellwig 2019-07-25  636   * hmm_range_fault - try =
to fault some address in a virtual address range
f970b977e068aa Jason Gunthorpe   2020-03-27  637   * @range:	argument struc=
ture
9a4903e49e495b Christoph Hellwig 2019-07-25  638   *
be957c886d92aa Jason Gunthorpe   2020-05-01  639   * Returns 0 on success o=
r one of the following error codes:
73231612dc7c90 J=C3=A9r=C3=B4me Glisse     2019-05-13  640   *
9a4903e49e495b Christoph Hellwig 2019-07-25  641   * -EINVAL:	Invalid argum=
ents or mm or virtual address is in an invalid vma
9a4903e49e495b Christoph Hellwig 2019-07-25  642   *		(e.g., device file vm=
a).
73231612dc7c90 J=C3=A9r=C3=B4me Glisse     2019-05-13  643   * -ENOMEM:	Out=
 of memory.
9a4903e49e495b Christoph Hellwig 2019-07-25  644   * -EPERM:	Invalid permis=
sion (e.g., asking for write and range is read
9a4903e49e495b Christoph Hellwig 2019-07-25  645   *		only).
9a4903e49e495b Christoph Hellwig 2019-07-25  646   * -EBUSY:	The range has =
been invalidated and the caller needs to wait for
9a4903e49e495b Christoph Hellwig 2019-07-25  647   *		the invalidation to f=
inish.
f970b977e068aa Jason Gunthorpe   2020-03-27  648   * -EFAULT:     A page wa=
s requested to be valid and could not be made valid
f970b977e068aa Jason Gunthorpe   2020-03-27  649   *              ie it has=
 no backing VMA or it is illegal to access
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  650   *
f970b977e068aa Jason Gunthorpe   2020-03-27  651   * This is similar to get=
_user_pages(), except that it can read the page tables
f970b977e068aa Jason Gunthorpe   2020-03-27  652   * without mutating them =
(ie causing faults).
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  653   */
be957c886d92aa Jason Gunthorpe   2020-05-01  654  int hmm_range_fault(struc=
t hmm_range *range)
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  655  {
d28c2c9a487708 Ralph Campbell    2019-11-04  656  	struct hmm_vma_walk hmm_=
vma_walk =3D {
d28c2c9a487708 Ralph Campbell    2019-11-04  657  		.range =3D range,
d28c2c9a487708 Ralph Campbell    2019-11-04  658  		.last =3D range->start,
d28c2c9a487708 Ralph Campbell    2019-11-04  659  	};
a22dd506400d0f Jason Gunthorpe   2019-11-12  660  	struct mm_struct *mm =3D =
range->notifier->mm;
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  661  	int ret;
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  662 =20
42fc541404f249 Michel Lespinasse 2020-06-08  663  	mmap_assert_locked(mm);
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  664 =20
a3e0d41c2b1f86 J=C3=A9r=C3=B4me Glisse     2019-05-13  665  	do {
a3e0d41c2b1f86 J=C3=A9r=C3=B4me Glisse     2019-05-13  666  		/* If range i=
s no longer valid force retry. */
a22dd506400d0f Jason Gunthorpe   2019-11-12 @667  		if (mmu_interval_check_=
retry(range->notifier,
a22dd506400d0f Jason Gunthorpe   2019-11-12  668  					     range->notifier=
_seq))
2bcbeaefde2f03 Christoph Hellwig 2019-07-24  669  			return -EBUSY;
d28c2c9a487708 Ralph Campbell    2019-11-04  670  		ret =3D walk_page_range=
(mm, hmm_vma_walk.last, range->end,
7b86ac3371b70c Christoph Hellwig 2019-08-28  671  				      &hmm_walk_ops, =
&hmm_vma_walk);
be957c886d92aa Jason Gunthorpe   2020-05-01  672  		/*
be957c886d92aa Jason Gunthorpe   2020-05-01  673  		 * When -EBUSY is retur=
ned the loop restarts with
be957c886d92aa Jason Gunthorpe   2020-05-01  674  		 * hmm_vma_walk.last se=
t to an address that has not been stored
be957c886d92aa Jason Gunthorpe   2020-05-01  675  		 * in pfns. All entries=
 < last in the pfn array are set to their
be957c886d92aa Jason Gunthorpe   2020-05-01  676  		 * output, and all >=3D =
are still at their input values.
be957c886d92aa Jason Gunthorpe   2020-05-01  677  		 */
d28c2c9a487708 Ralph Campbell    2019-11-04  678  	} while (ret =3D=3D -EBU=
SY);
73231612dc7c90 J=C3=A9r=C3=B4me Glisse     2019-05-13  679  	return ret;
74eee180b935fc J=C3=A9r=C3=B4me Glisse     2017-09-08  680  }
73231612dc7c90 J=C3=A9r=C3=B4me Glisse     2019-05-13  681  EXPORT_SYMBOL(h=
mm_range_fault);
8cad4713056612 Leon Romanovsky   2025-04-28  682 =20

:::::: The code at line 667 was first introduced by commit
:::::: a22dd506400d0f4784ad596f073b9eb5ed7c6a2a mm/hmm: remove hmm_mirror a=
nd related

:::::: TO: Jason Gunthorpe <jgg@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

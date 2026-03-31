Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCAD3DEAD9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966965; cv=none; b=QgRbrLVTpxKfrYqflZF4OfkMX4+5jLn/1cX/cjr6sUrXXeD/dF99yJzv9eyZpkJ/dcXIBElKRZJd/si5EK66uF1BemB3qCSsYHjKRC7KSmZQIe47fyDr56PdYNeO7seW9nfeVetWQdk4LhpwnkI5wK+38slIJnEWlS0zklX8n9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966965; c=relaxed/simple;
	bh=JmC6t27+k0lrHyprx3KakD/gI5XtbW3ikJXd7Fv2ysk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Cj6o4pS+hhE7+i8X37ETURUG6jeYoxkSbyt8+y7q3XjO0bx6+cqKAeiUVgGMLqiqR2AtAPhCXML4UFtDdiFCx0hdFVvrQ0ZSmr63cyuuDEQC69C/IjLgaT83Um7Q76jc9f71l0Bl2JAOvKIkGfFQHUlJQzqpQ+eH30LNlBFIlps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+sJy1Ls; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+sJy1Ls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774966964; x=1806502964;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JmC6t27+k0lrHyprx3KakD/gI5XtbW3ikJXd7Fv2ysk=;
  b=A+sJy1LsNgZ8D9U5PJuU0q9SajC0KGJXdBM4mMw6pEpfLn7Zv9yrTktK
   VFXWHSOFfcun2/5NqLnBVLfWNBFkh/WBteOWpjvg3nkRkks5lK/WM2rHs
   l6HTwBtkxPUAcAl22LT3GLq9VdQd5gSqZgdUgDhmHlVZw+pXHIIsmvB46
   XUpnTYwBVDTlJ4WgYDSpNnOEyTrsysS5AhAqUZQj/+VMkQeRDFdxGCJzk
   f92/QBwKasRB2FfSen/YwANXOsC7FhyhjZUKoQq8CyT8am/WdZAd1sEHS
   2q1XYHprgK70My6pVcjQ0C+Boj1LWZhK1Ei+4aQVk14sr1jZtb/3EKDOv
   w==;
X-CSE-ConnectionGUID: RbVDpAEeTeeEphShAGNTVg==
X-CSE-MsgGUID: M93/3D5ASbSqBY09xUufxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76172927"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="76172927"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 07:22:44 -0700
X-CSE-ConnectionGUID: 6rPVxk/RTeyd8nu8FSP+dw==
X-CSE-MsgGUID: o3wpKERVTLalWh/jeE/YgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="223078701"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2026 07:22:41 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ZzK-000000002l5-3HiZ;
	Tue, 31 Mar 2026 14:22:38 +0000
Date: Tue, 31 Mar 2026 22:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 10288/10352]
 kernel/time/namespace_vdso.c:137:25: error: implicit declaration of function
 'zap_vma_pages'; did you mean 'zap_vma_range'?
Message-ID: <202603312208.QNLATFuj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   cf7c3c02fdd0dfccf4d6611714273dcb538af2cb
commit: e0aa1be6ed33eb71b3e2783e9b1f3204f4e42600 [10288/10352] Merge branch=
 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260331/2=
02603312208.QNLATFuj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260331/202603312208.QNLATFuj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312208.QNLATFuj-lkp@i=
ntel.com/

Note: the linux-next/master HEAD cf7c3c02fdd0dfccf4d6611714273dcb538af2cb b=
uilds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   kernel/time/namespace_vdso.c: In function 'vdso_join_timens':
>> kernel/time/namespace_vdso.c:137:25: error: implicit declaration of func=
tion 'zap_vma_pages'; did you mean 'zap_vma_range'? [-Wimplicit-function-de=
claration]
     137 |                         zap_vma_pages(vma);
         |                         ^~~~~~~~~~~~~
         |                         zap_vma_range


vim +137 kernel/time/namespace_vdso.c

5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  120 =20
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  121  /*
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  122   * The vvar page layo=
ut depends on whether a task belongs to the root or
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  123   * non-root time name=
space. Whenever a task changes its namespace, the VVAR
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  124   * page tables are cl=
eared and then they will be re-faulted with a
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  125   * corresponding layo=
ut.
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  126   * See also the comme=
nt near timens_setup_vdso_clock_data() for details.
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  127   */
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  128  static int vdso_join_=
timens(struct task_struct *task, struct time_namespace *ns)
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  129  {
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  130  	struct mm_struct *mm=
 =3D task->mm;
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  131  	struct vm_area_struc=
t *vma;
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  132  	VMA_ITERATOR(vmi, mm=
, 0);
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  133 =20
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  134  	guard(mmap_read_lock=
)(mm);
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  135  	for_each_vma(vmi, vm=
a) {
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  136  		if (vma_is_special_=
mapping(vma, &vdso_vvar_mapping))
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26 @137  			zap_vma_pages(vma);
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  138  	}
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  139  	return 0;
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  140  }
5dc9cf835aba73 Thomas Wei=C3=9Fschuh 2026-03-26  141 =20

:::::: The code at line 137 was first introduced by commit
:::::: 5dc9cf835aba73c882348aa4f99be83b6e45ad9b vdso/timens: Move functions=
 to new file

:::::: TO: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

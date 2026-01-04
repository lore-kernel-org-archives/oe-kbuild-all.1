Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E8E2701B1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767516571; cv=none; b=tMjgHwCMivmkT2tkerY/WSiHpMHJ3auyJMuHSuWav6NeE2bxEuvLE0SckpgrcuBmdwsOC+pYg0W+W4CEsaXBEYCkEqKJ3/JasTjyrZGqHG29/ye02iXGwbcL/21+DtZqXIsq4vD1GzcfwT5jSAtFSjKza1jq64oppoKd+HYSYRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767516571; c=relaxed/simple;
	bh=2RSXCyI+8NeZjvCdOWBDVRoIZJ5ohKFOer5VtizNnWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TKbg6j/Yn19rLbaohEFov7gzDPy3+334pzcY6wPkghK1Id9YOKYUEyN6zeON1KuRmVxU07y3PFYgIuWgxiylOjYPlqqAMWuLnEMQGV4tY8JKxmxBK0b609f9xEqRRzAMWCr8YYyeUzNojSaO5ODZCBCYDmmaou+hgcUEESqIfAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7Ks4/2D; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7Ks4/2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767516569; x=1799052569;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2RSXCyI+8NeZjvCdOWBDVRoIZJ5ohKFOer5VtizNnWA=;
  b=H7Ks4/2DVkQcqm3KYFLAH9stL/0fl1IhjNpSWqrH7pydUXwVskOy8kam
   QQUYKMMmPjyajIxPGdPVBGagRp+a/HTry2SDphNbvgWSoG/CMTpPC7T1z
   I4+//V5eLdggFkeDE9NUB7lw9lEapbGAC2gwEU0RQdcLdlXKKCT5XDBpm
   M/hYqijqTjJ+dwNHGp7f4DZHYqqjC2l9XvDmhMjwDfZGEEBMr4rrSWL2Y
   +vqG7AwYS0uMjNER5F0Tvysv/4mrJH4ZTfiTn/ZY0jHCT01sMLUgSzfzq
   MkU9JxD6mhE3g5s41E1Wc/SZX3oGpt46ckA5/KwQgSoQo8XGrB0qAqpwh
   Q==;
X-CSE-ConnectionGUID: gVKISu4uTpe/9UCzC5aseQ==
X-CSE-MsgGUID: K5cp9RBUSfGxMNM1aRu+aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68856339"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68856339"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 00:49:28 -0800
X-CSE-ConnectionGUID: 6jkKcX2qTZaf+N0AQVrSoA==
X-CSE-MsgGUID: 0UvSFRsGQ8SZAMcGBQe8ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="206275936"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Jan 2026 00:49:26 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcJng-000000000sj-0KHZ;
	Sun, 04 Jan 2026 08:49:24 +0000
Date: Sun, 04 Jan 2026 09:49:08 +0100
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sj:damon/next 110/118] htmldocs:
 Documentation/admin-guide/mm/damon/usage.rst:9: WARNING: Mismatch: both
 interpreted text role prefix and reference suffix. [docutils]
Message-ID: <202601040942.MWKEmMKA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/=
next
head:   28d3c5e02b31f08aa715cf01ead66c072a9c5d5a
commit: 5ff971ba3599d1e5d6a1721a85d50969a3c270ca [110/118] Docs/admin-guide=
/mm/damon/usage: suggest use of DAMON modules
reproduce: (https://download.01.org/0day-ci/archive/20260104/202601040942.M=
WKEmMKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601040942.MWKEmMKA-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/pci.h
   ERROR: Cannot find file ./include/linux/mod_devicetable.h
   WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
   ERROR: Cannot find file ./include/linux/bootconfig.h
   WARNING: No kernel-doc for file ./include/linux/bootconfig.h
>> Documentation/admin-guide/mm/damon/usage.rst:9: WARNING: Mismatch: both =
interpreted text role prefix and reference suffix. [docutils]
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   WARNING: No kernel-doc for file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_blk.h
   ERROR: Cannot find file ./include/linux/pstore_blk.h


vim +9 Documentation/admin-guide/mm/damon/usage.rst

     8=09
   > 9	- *Special-purpose DAMON modules.*
    10	  :ref:`This <damon_modules_special_purpose>`_ is for people who bui=
lding,
    11	  distributing, and/or administrating the kernel with special-purpos=
e DAMON
    12	  usages.  Using this, users can use DAMON's major features for the =
given
    13	  purposes in build, boot, or runtime in simple ways.
    14	- *DAMON user space tool.*
    15	  `This <https://github.com/damonitor/damo>`_ is for privileged peop=
le such as
    16	  system administrators who want a just-working human-friendly inter=
face.
    17	  Using this, users can use the DAMON=E2=80=99s major features in a =
human-friendly way.
    18	  It may not be highly tuned for special cases, though.  For more de=
tail,
    19	  please refer to its `usage document
    20	  <https://github.com/damonitor/damo/blob/next/USAGE.md>`_.
    21	- *sysfs interface.*
    22	  :ref:`This <sysfs_interface>` is for privileged user space program=
mers who
    23	  want more optimized use of DAMON.  Using this, users can use DAMON=
=E2=80=99s major
    24	  features by reading from and writing to special sysfs files.  Ther=
efore,
    25	  you can write and use your personalized DAMON sysfs wrapper progra=
ms that
    26	  reads/writes the sysfs files instead of you.  The `DAMON user spac=
e tool
    27	  <https://github.com/damonitor/damo>`_ is one example of such progr=
ams.
    28	- *Kernel Space Programming Interface.*
    29	  :doc:`This </mm/damon/api>` is for kernel space programmers.  Usin=
g this,
    30	  users can utilize every feature of DAMON most flexibly and efficie=
ntly by
    31	  writing kernel space DAMON application programs for you.  You can =
even extend
    32	  DAMON for various address spaces.  For detail, please refer to the=
 interface
    33	  :doc:`document </mm/damon/api>`.
    34=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

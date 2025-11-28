Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62F230F7FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 11:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764329938; cv=none; b=ihk5V3c1Cr7OGpjX0FfzKiuAIESZy1Cv8RcEesieDGOrPcKPTKfPd+Pg+l1B+pZUcoc8wRaXdQIqYerhWkVlGjoOYjjwPafanEH2ZUpl63j84ML2Zbc+Nag1mFPxfQotfXkmdyeDwX4qaC+dj96JYwcKuJlB/G9eeWhHCh4ZLX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764329938; c=relaxed/simple;
	bh=unwxJvDVj9wMgk5XyFUc6q5HoUmu/NFSt0CRTgSYc/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hh/ApL5fPoy3FWvGqcQVyBjxH7gOLzO+Z1Sb6zM5CJZWzENYAurlDnLALuC1tJ4nFu30N+qy27B4Vmd5e6jzkLGkyTmYlNYL3q9VUiv/lH0RjMCz9AvsGjdKrj4gxJrMlCMZHHf9XGnykYy4XPOSDqUBTwvYReFlt3TmQ38KREI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NH9eV9J6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NH9eV9J6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764329936; x=1795865936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=unwxJvDVj9wMgk5XyFUc6q5HoUmu/NFSt0CRTgSYc/I=;
  b=NH9eV9J6u7mI2ZZlYnTqskqVR8kZ/VEMTp1ho0deF0lT45PS4Cn4oB4o
   OOl4UKmEHZzAWD+2o4MYC2TxSVuREBXTYhf+9gK1saJyHMyYJgEA/7QbO
   gPSxfAMD57kcGYYu9rPDF6t7Ky+JpLc6DvjeLMSNXY2Auo7z/9d/1Zohd
   9Sze2ruPweltw7WrCMYFBrjybC/k+b/g8jDlVUhannxGOFR7aOpsB+ODJ
   QPRuAiwt8BVQU1WM+lcfERxCRtqddy4R8Vs1AVEzWZawHNqUVdVDQsfo9
   zzQvTNc/xUKeZNqfl5xrGe43vGJBIkANAjuQ39R9TuRadnWpgMtjEgld/
   w==;
X-CSE-ConnectionGUID: N3uDeh2RS9CM/sEkxDocVg==
X-CSE-MsgGUID: nj7KUTixRLOplfRlC0n06Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66393072"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66393072"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 03:38:55 -0800
X-CSE-ConnectionGUID: PreORS/rTtyWXPtpd178yQ==
X-CSE-MsgGUID: XvxExIHORwaOgXjaxZ0phQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198549530"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 28 Nov 2025 03:38:54 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOwoN-00000000217-3LEu;
	Fri, 28 Nov 2025 11:38:51 +0000
Date: Fri, 28 Nov 2025 12:37:55 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3406/3406] htmldocs:
 Documentation/admin-guide/perf/ummu-pmu.rst: WARNING: document isn't
 included in any toctree [toc.not_included]
Message-ID: <202511281229.1nZT8v8W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ae3faae9efa6dabe1e7613b5e5d3758ffaefb86a
commit: 3a2ebcdd4d6c72fcd64521ffcfe496b8950be8d0 [3406/3406] iommu/ummu: Add UMMU documentation description
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511281229.1nZT8v8W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281229.1nZT8v8W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ub_device_id ./include/linux/mod_devicetable.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fwctl.h' failed with return code 1
   Documentation/userspace-api/ummu_core.rst:73: ERROR: Unexpected indentation. [docutils]
   Documentation/userspace-api/ummu_core.rst:90: ERROR: Unexpected indentation. [docutils]
   Documentation/userspace-api/ummu_core.rst:103: ERROR: Unexpected indentation. [docutils]
>> Documentation/admin-guide/perf/ummu-pmu.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/arch/x86/hygon-secure-virtualization.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/misc-devices/zcopy.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/mm/dynamic_hugetlb.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/device_drivers/ethernet/nebula-matrix/m18120.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/hinic3.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/scsi/hisi_raid.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/scsi/sssraid.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/ub/ummu/index.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> Documentation/userspace-api/ummu_core.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/coco/csv-guest.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/kvm/arm/pvsched.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/kvm/arm/pvsgi.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/vm/memcg_memfs_info.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/ub/ubl.rst:63: WARNING: undefined label: 'documentation/networking/ub/unic.rst' [ref.ref]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

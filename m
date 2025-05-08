Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E195F80034
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 22:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746744477; cv=none; b=K5WMSxi9Sq0QJ7atVj1fC7ZDIAxbzvcCgI412l0FhceUKS6hU/kRw1LelbtTqvjVNHdPcUXG9l3RZgf0u/pZsH5x0MYWIpd9H5A8A11In5JjMn92eXdo2etPE1cjM+jRy50TniIW/YQzMPqol5xWmY+b3RE6T1KEOHNvhsa5Bok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746744477; c=relaxed/simple;
	bh=Ba0hBfeq+u+zqqSmwzVTHRUNgBiwoJXKxRtz7W7v0zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A8MuDjzq+DgHO7qMaSAVIy+c00VW/sipoYCUpZ/xUzPbrmXq5Vwiy7IZV4b0ao+V8fdhPK+4+tRDKY+9r8U0xMszWWFTiD3q2G7QUYlqNwxttZYZYwDCahDnXkwdUNgAB5W/+kLOpRG0DcQq72fetNX1MFeYzWfMX1il5eNTPgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQplTED4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQplTED4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746744476; x=1778280476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ba0hBfeq+u+zqqSmwzVTHRUNgBiwoJXKxRtz7W7v0zs=;
  b=GQplTED4/vRPzA+tpK9M7CWVKSfi7SiV3ECL0gxGSAa3NIhAoFyVDqKK
   ieAXexVjo00MrWRcUZ6oL22gEovUP6UPSo15mkP/iStQXt+dYwdMNilta
   AOhQmFBKm1vxLNaUmSgeIzF55rBjXSwyrj+YcVwJpWsoW2d6zeyNvRT7u
   xnqIsy1aZgYYZc2rkQSwg7R1wG0Nkc/IsGGVXhV0QgATIPb8/sfwYEeuJ
   NwzvdUSeeWMBeywjE2mLQZYMJi2Lua3dxEwHkqgLAxPJk1Jw8OmLhSHTp
   juD3SheA4ivdBPoUl4ptzLwCTgibdihePtmoipZq0zv4iy7DIET6KtO2d
   g==;
X-CSE-ConnectionGUID: LN0aBuvBTYmSBfFt13ncfQ==
X-CSE-MsgGUID: CpaCI37dTy+Kt6UQ0n6/bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59218454"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59218454"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:47:55 -0700
X-CSE-ConnectionGUID: xzPQ+XDmT6inq7BWlQVbxw==
X-CSE-MsgGUID: TbG2dgaPT2uH+e52hycbbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="159732376"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 May 2025 15:47:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDA1w-000BRH-1e;
	Thu, 08 May 2025 22:47:52 +0000
Date: Fri, 9 May 2025 06:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 9/9] kismet: WARNING:
 unmet direct dependencies detected for PARAVIRT_CLOCK when selected by
 VIRTIO_PVCLOCK
Message-ID: <202505090653.YSfD67Qm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   484ad6e74ab5cb9a755b356ef6ff0acebe4fe544
commit: 2b1ff8683a4370ea8c1b01d801f8369ebd777e19 [9/9] CHROMIUM: virtio_pvclock: port driver impl from Android
config: i386-kismet-CONFIG_PARAVIRT_CLOCK-CONFIG_VIRTIO_PVCLOCK-0-0 (https://download.01.org/0day-ci/archive/20250509/202505090653.YSfD67Qm-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250509/202505090653.YSfD67Qm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090653.YSfD67Qm-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PARAVIRT_CLOCK when selected by VIRTIO_PVCLOCK
   WARNING: unmet direct dependencies detected for PARAVIRT_CLOCK
     Depends on [n]: HYPERVISOR_GUEST [=n]
     Selected by [y]:
     - VIRTIO_PVCLOCK [=y] && VIRTIO_MENU [=y] && VIRTIO [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

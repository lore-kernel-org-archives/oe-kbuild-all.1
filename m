Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3B24BF95C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 19:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791399802; cv=none; b=PE0k0zj+ptEdiiDI5UhI4ypa2hg2HxYTCggWPSIMCGz/jeKG6zOOCIRMs1nmwZf8NCInXAb3JhLaPmLGeWZdCCYPSwY+I2fzQOuFo3GzO/O7h8k2JmoNNzmnnxNJULPQFRxiOfASsMNUoRY43wD8VE9NfGff5F1qpCOsdUbV76Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791399802; c=relaxed/simple;
	bh=TUu4Wd9kTbMYZ9rPIzFlPkpIdO9F4aBMFUsTL35U9OM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kfCszjXss5Wsqyn/UmFvS6cOeb+hvZC5iLn5XqkyeQ7t6C6oo1j/RzcAlVLIJ4tfBU7hI3uftw3kcHx/Sd6dXrnC8ome7dm3ceHwUQZdu+TScEYfeLZoZhk08znwCv89Fvnn3DjyQlxbzx2mFesvdUe9NwBkMC/5BJdsobfSaSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOIJhRIL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOIJhRIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791399801; x=1822935801;
  h=date:from:to:cc:subject:message-id;
  bh=TUu4Wd9kTbMYZ9rPIzFlPkpIdO9F4aBMFUsTL35U9OM=;
  b=aOIJhRIL50C1zcplh9/i60qbdFwehX1OMnFguFNHsC96FMsUzCuR3LEj
   KbkGyF6gn4l8CYWlGYD7g+KngcyUayf96jbA4GsaYkeRSwg61iuJ2tKZm
   i1OFUHfFbEKPospnWgXeT2VEcuk6qkkH4gPZxE8nYZKvvIeh0XNC3o6SG
   YiF8WipNgSb8pYEoo5kY0h56bcN5AnBYDqpZgTEaWWkzfhWVIH6g9E0IL
   Rwu/5oK5WwExCkCkdVYKn06sPkz1O8Gd+lEIRxegzTxwE1yg4ZXFhC2Z+
   87Dl/Abo9daNDZIbO/4nS0tXUjuXMaYmgOjr7KZdSIiZ9plEvIb1HZP8O
   w==;
X-CSE-ConnectionGUID: 7wz7z7yFQFeMwz3VJ8fYcw==
X-CSE-MsgGUID: tQIcojcfSZCSJ2DzR9YJbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="67807"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="67807"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 12:03:21 -0700
X-CSE-ConnectionGUID: 0lrrDnW5Q6SZnl0+TqVVUw==
X-CSE-MsgGUID: V5ACliirQPuxpvqyFRZn2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="121468"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 07 Oct 2026 12:03:19 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEWv7-000000003qt-0jz4;
	Wed, 07 Oct 2026 19:03:17 +0000
Date: Wed, 07 Oct 2026 21:02:44 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 5/5] kismet:
 WARNING: unmet direct dependencies detected for PARAVIRT_CLOCK when selected
 by VIRTIO_PVCLOCK
Message-ID: <202610072035.UOFCVoyF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   4307d952cdef0e45aa82ddde5f6e3b35d84623c6
commit: 2b1ff8683a4370ea8c1b01d801f8369ebd777e19 [5/5] CHROMIUM: virtio_pvclock: port driver impl from Android
config: x86_64-kismet-CONFIG_PARAVIRT_CLOCK-CONFIG_VIRTIO_PVCLOCK-0-0 (https://download.01.org/0day-ci/archive/20261007/202610072035.UOFCVoyF-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261007/202610072035.UOFCVoyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072035.UOFCVoyF-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PARAVIRT_CLOCK when selected by VIRTIO_PVCLOCK
   WARNING: unmet direct dependencies detected for PARAVIRT_CLOCK
     Depends on [n]: HYPERVISOR_GUEST [=n]
     Selected by [y]:
     - VIRTIO_PVCLOCK [=y] && VIRTIO_MENU [=y] && VIRTIO [=y] && X86 [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

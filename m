Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8584A3418
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649368; cv=none; b=VacaeLmvb0hRA3hWfrFdY7n5FKc0KP+LXqxQbMOOIdPKuRfvWqu6hEH4i5ee8bpQIGiHNdbF7oIoKcabQMhdfkuopeDXNmuLBvCF7qCCVn/ZjAgSpCtVWxhK+dkiP8/U+0z2xaiFLY6nJ8C1DhpqCi12cf1j/ImAmcQDFihCZwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649368; c=relaxed/simple;
	bh=MBWZib5l50WfG33f/b/qcsZdOZojhitXJDU75/edpMU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QvYmfdS4VzGvo7lrFSVLiCIp2DcNswS8Guj3DIPwX8K4B/WVfOnh8kL/53M2gqIWKIH00CTkP+TwPKAL+VuqbTjpff6vvVa3s2UaxiXG7Himlqh64ztLZPOYnwaMvCXaCRcFPSNPSQ+pXgDr4ALbQlbrtT8YOHVoWJ98JkWHUHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JT/Xm9a9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JT/Xm9a9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780649367; x=1812185367;
  h=date:from:to:cc:subject:message-id;
  bh=MBWZib5l50WfG33f/b/qcsZdOZojhitXJDU75/edpMU=;
  b=JT/Xm9a9c+vPVDjSTVTAobKWDsf4ZOyMBJKgZJnoOfgSMpSVumcAIA2g
   1d3xtGnFcd23VXwWgIQHCFHcnMwYCDxtPVy0aQfwfYQYlJbn75C2bOG1c
   zAAlegT1kvkrjpPZtoMOHGtXQgZbVGMj0N7kf8j/R4gDYRX19yOyJ/maj
   Q9oZNy5q4gBBWCyx7nnLgdH26N+7ptGz0Pdm53TIKsYcqS1vEz8kkjQp+
   Nuku2zjthlmyklL3GqJn9PBS9RKzlaNkOcEfE6pT+aEPQOpYYfF6AXZvS
   fSiaB6JMhbVBDcfPzqSMzLDvnYOjLP9p0rQhJ5HlFQyiX7cHCIYHfE4W2
   w==;
X-CSE-ConnectionGUID: CzNp+FODSrKQHBSedZoYGg==
X-CSE-MsgGUID: pmNSl44OSHu+Ah3K0mSMmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92968292"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="92968292"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 01:49:15 -0700
X-CSE-ConnectionGUID: SaGMq8PGRQOmi7sL9gQjYg==
X-CSE-MsgGUID: zMRhoDRdRb6Q3qs8ZcoQpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="242303454"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 01:49:13 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVQEo-000000002XL-2fyb;
	Fri, 05 Jun 2026 08:49:10 +0000
Date: Fri, 05 Jun 2026 10:48:29 +0200
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [sailus-media-tree:partial-reg 9/9] htmldocs: Warning:
 Documentation/userspace-api/media/mediactl/media-ioc-dqevent.rst references a
 file that doesn't exist: Documentation/media/uapi/fdl-appendix.rst
Message-ID: <202606051009.SvtAY0cZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git partial-reg
head:   b7d01dab7d47849d483b459ff2abf50497b52149
commit: b7d01dab7d47849d483b459ff2abf50497b52149 [9/9] Documentation: media: Add Media controller event documentation
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260605/202606051009.SvtAY0cZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051009.SvtAY0cZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
>> Warning: Documentation/userspace-api/media/mediactl/media-ioc-dqevent.rst references a file that doesn't exist: Documentation/media/uapi/fdl-appendix.rst
>> Warning: Documentation/userspace-api/media/mediactl/media-ioc-subscribe-event.rst references a file that doesn't exist: Documentation/media/uapi/fdl-appendix.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
--
   c:type:`MC.media_v2_entity` (from userspace-api/media/mediactl/media-ioc-g-topology)
   c:enum:`media_entity_type` (from driver-api/media/mc-core)
   c:struct:`media_entity_enum` (from driver-api/media/mc-core) [ref.missing]
   include/uapi/linux/media.h:390: WARNING: Invalid xref: c:type:`MC.media_event_subscription`. Possible alternatives:
   c:type:`media_event_subscription` (from userspace-api/media/mediactl/media-ioc-subscribe-event) [ref.missing]
>> Documentation/userspace-api/media/mediactl/media-ioc-subscribe-event.rst:76: WARNING: undefined label: 'media_subscribe_event' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

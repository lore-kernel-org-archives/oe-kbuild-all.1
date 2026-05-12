Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9262DE6E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 17:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606971; cv=none; b=M2AcX1CiEqrLhNlo+La3b932gWL/6sHK2h1tNyrYHFK9BEsWbL/q1UU708jDpOa9p/4ddd7PgdtFkjkhXYACojmZGVzJXH4fH0rC5o36zz4WabbKscJI+FiCpMFxnlC+spwq3sxf1uVLIU6XVifFLzdQK0xJUZSnTRPGkA/JwUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606971; c=relaxed/simple;
	bh=9Bbac65Fe1mZYGiV9lddtfmQKTqfMsu+2ocmTxb0MUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hV2zEPVE4emewhmBt0hyHARsI2lYlaQM5/nKnCMNmM+e8rO25EI4ijDxTugK23PE/d7g83tj5669l9bj9oQQV8zlznu1Hopj1efoopZluL9eFLIr56IcXXiR0XzrgT77i2SXlgU9XfQBwtLoyaTmt+UDAOxS3hcoUhCNPw9w6EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqTIloJP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqTIloJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778606970; x=1810142970;
  h=date:from:to:cc:subject:message-id;
  bh=9Bbac65Fe1mZYGiV9lddtfmQKTqfMsu+2ocmTxb0MUk=;
  b=jqTIloJPLP5nnc2U99kBlKZfqJc6YyLwZgCe0NlD9OngNMNp5zf+T8xo
   PXvGU3wdO6SASy9GUmyYeOwEqg9iiO7oFP5PQE2bM/VDts9k0d7C74xPp
   BjqrqHQdKntzhNlSHp4tLhLR6CEj3epV+TSgv/AbB2pASwOIK6W9dmNZw
   eStQWascRarawI+at2vJPFjVG6C9X4IR/MT9ml6LYchZtVcskCuTWisFH
   45S/KCZiEAMG9oZGBKqQ00zg0rL+S2Ka1Le1bq5GLb7LFUcW+4Ow4YAVl
   YToVPdDw55lzVL2BMgUo2dgQPw2hGttCT8Xnw7xmPB2nOtskoFCa5TV/g
   g==;
X-CSE-ConnectionGUID: oqDZ8I/LSTOMVlurGIS/4A==
X-CSE-MsgGUID: AXRO1utXTMyoGAULh9Vo9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="89825942"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="89825942"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 10:29:30 -0700
X-CSE-ConnectionGUID: k35GLjY8T0aVoM86YOXqCA==
X-CSE-MsgGUID: c/DKlNqvSUqGSvL1lLI6Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="236977499"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 12 May 2026 10:29:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMqv8-000000008JB-18WE;
	Tue, 12 May 2026 17:29:26 +0000
Date: Tue, 12 May 2026 19:28:44 +0200
From: kernel test robot <lkp@intel.com>
To: David Matlack <dmatlack@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Vipin Sharma <vipinsh@google.com>, linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/driver-api/vfio_pci_liveupdate:7:
 ./drivers/vfio/pci/vfio_pci_liveupdate.c:78: WARNING: unknown document:
 '/PCI/liveupdate' [ref.doc]
Message-ID: <202605121946.GDFPWf9X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vipin-Sharma/vfio-pci-Register-a-file-handler-with-Live-Update-Orchestrator/20260512-152829
head:   ebd50d810440364055692a3ed1d967cd7149d0dc
commit: 4ab988bdf43079ff3eb58904f591ec464f289db5 docs: liveupdate: Add documentation for VFIO PCI
date:   10 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260512/202605121946.GDFPWf9X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121946.GDFPWf9X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/driver-api/vfio_pci_liveupdate:7: ./drivers/vfio/pci/vfio_pci_liveupdate.c:78: WARNING: unknown document: '/PCI/liveupdate' [ref.doc]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

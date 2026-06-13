Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D9737AA94
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781340443; cv=none; b=QZRA16UqIHRr4r4yIZySSbb3b/i4Gs5TZjNUKRXDzKYnQrZHMx6CpON7QfjElbRCSlj9KSnSJNtRgAfu3Jh2g57pCrh7hCvP+OchYfOxu1o7DU8CdwXqTJB2pB5d8KPK+xy07POmsgy74lo98oyLAmlnxpNohVSEcWtEbEooU9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781340443; c=relaxed/simple;
	bh=Kgzsl0tncuHZeTuBwNzv6yFl+GswrXYwmaXTRoqwsag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JDGvW1km5zvQ5uD9Nw/VUkdO0aaBsppi2HCPK/3vEDM8WH3BgKwzYX8bQawh2uqBf5PiDtWKn6MEd1LuCNc1UkqyVySSNjTrPI/GuS8ruFWC0GZU6nQhlyHa4nSweZMpi7gFJ/aFHcdmz/VVIpku1JHybRg1epinvSJ6h1wDl1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eA85ulGo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eA85ulGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781340441; x=1812876441;
  h=date:from:to:cc:subject:message-id;
  bh=Kgzsl0tncuHZeTuBwNzv6yFl+GswrXYwmaXTRoqwsag=;
  b=eA85ulGov1kIGaZCkvVUWXOMnU0na7FNfQZckCmjxwceJkhcBVtq4CUd
   AibJef1npLvKywOyRGdfw0QzYSZ+fgjgJpSKIF5OrFdJBxWB2K/CPIIsn
   vW3a37hjzmGJEBIz45x+1UBdNasA5677nTdeghlZQsTE/YUQkCsy3j6JK
   MX73pCdoS8BMfJfnJEXSYiko2CPmrIt1sfO/TozHUWRI0x6NnrC+9hNxN
   74gZ9wT0H0tF0ZfyRqyh/yUOp8Ssoem9prp4E/kvLnR9A7Itv9ZF+L8mO
   /WlDFWf+etk7ufkNpWg1dmg2HsVXLeD4k0hsLQrxziAVoDhBh1bhoUDNq
   w==;
X-CSE-ConnectionGUID: ARJz+ei1RdKmErLzPFrv9Q==
X-CSE-MsgGUID: AjlMDbWNTYO3SL6i3wPBBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="84731367"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="84731367"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 01:47:20 -0700
X-CSE-ConnectionGUID: imk3Wj0iTzeRjOpt91OhAg==
X-CSE-MsgGUID: MD902VapTHyW2Hg3j5ozjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="247088685"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2026 01:47:19 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYK1M-000000004T1-2gmb;
	Sat, 13 Jun 2026 08:47:16 +0000
Date: Sat, 13 Jun 2026 10:46:51 +0200
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [cris:scmi_telemetry_unified_fs_V4 23/34] htmldocs:
 Documentation/filesystems/stlmfs.rst: WARNING: document isn't included in any
 toctree [toc.not_included]
Message-ID: <202606131001.iJbU6AyB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_unified_fs_V4
head:   ed28087005811783e972fe7a788446936878932f
commit: a4696bbff34cf8e311ab878fc616567844b576ee [23/34] fs/stlmfs: Document ARM SCMI Telemetry filesystem
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260613/202606131001.iJbU6AyB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131001.iJbU6AyB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/filesystems/stlmfs.rst: WARNING: document isn't included in any toctree [toc.not_included]
   WARNING: Documentation/ABI/testing/stlmfs not found
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

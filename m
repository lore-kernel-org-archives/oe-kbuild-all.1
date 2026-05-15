Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560C01DF261
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 22:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883740; cv=none; b=LKTLwaFPAtsvBD0JEzjETlvg74kKoXgN3bAl3Bl0koFDF/WH8lyfx4+aXJg5TYtrP5mUDt9p8nsfw0U+BQIpb9tSYrV5iEPSZJ71eKAnjHTYUlPAbCgLrYV9uNcZ/XO5wkMHd9YvMBtpsNy+iqRT4KhFsAPxzLFQUtUXJJUQ1jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883740; c=relaxed/simple;
	bh=5ZfaTQTgw3dt9FklhP4KRY4P9m022q9n1DA67WrzGH0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CrZxDI8wkhqX8gWgAEr0RLbvlWMhkyF6Ko51AuhBNSXtgQH2epQiIIbehOz9h6EintVbXnYm/Lk9AIxbJqE+vQmXZrMsBat2odula0BJ1K6DTZucXVAi8+GXZ8UvOpWwvz1wMrDQq1r1D9wMDmmPEgBRnBnkZjFJTlbA1lMqm8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYYkY4yi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYYkY4yi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778883738; x=1810419738;
  h=date:from:to:cc:subject:message-id;
  bh=5ZfaTQTgw3dt9FklhP4KRY4P9m022q9n1DA67WrzGH0=;
  b=CYYkY4yizYP+IBZtNluhhHlx45gmsM25kP5VzZW2VpungTs4Nu1A3asB
   LSLi0n9LWa00iC0y8V0BEBByW8Zea/Cn87EwT99dFnjd/ayR6Am1KI2P9
   PZC5KJ3DF+ywh+2E8qqlcWsLXGcasfbLqImXSV9MDdMHwK/FRbCfFfGSF
   zRjtPVxNQIh5BhbARBUqRTtyEp7B00OgahJ48PSEYZX6+SPgECL+TeBVg
   npVFOuZRthyMjlOgfakhtS/Cr29jVj0nLaov2sNaZBqEfKvd/PPFau4we
   S2IeG/fM18BeX05xh7RsE5s/Sfga5FkgQoLavrIdAIqG0fPmTz7MhBGLS
   Q==;
X-CSE-ConnectionGUID: AGAHoxzsTvW/LwN5qbhGUw==
X-CSE-MsgGUID: Y8NZgnY0REe2MqTXAdAQQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79885819"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="79885819"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 15:22:18 -0700
X-CSE-ConnectionGUID: ppw3iXtvQ1O4lmdEq/f+mg==
X-CSE-MsgGUID: eqvhWeKYRFqtq687LtaSZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="243143368"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 15 May 2026 15:22:17 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO0v8-00000000977-2ms0;
	Fri, 15 May 2026 22:22:14 +0000
Date: Sat, 16 May 2026 00:22:12 +0200
From: kernel test robot <lkp@intel.com>
To: Pengfei Li <lipengfei28@xiaomi.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/trace/ftrace-stackmap.rst: WARNING:
 document isn't included in any toctree [toc.not_included]
Message-ID: <202605160010.fakzGVVq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Li-Pengfei/trace-add-lock-free-stackmap-for-stack-trace-deduplication/20260515-165924
head:   b6694be533bbb2c164894843039c4156d2992e34
commit: b6694be533bbb2c164894843039c4156d2992e34 trace: add documentation, selftest and tooling for stackmap
date:   13 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260516/202605160010.fakzGVVq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160010.fakzGVVq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/trace/ftrace-stackmap.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

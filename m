Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0377C3FFAD9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777544801; cv=none; b=V0FyrgiEmWjv++JligA2usZ84/j188mERLtYl0e08JBAAY6R0MspV77usukI+zDhB64+ay47+xIPPIwEdEt2yRDjgZMIDlwaWr6ld7jXGOwPzgDsrgFbnEXxehaFC2FrwTPckfdv1Jpn8zmTaLDl5l+pS8U2eRiex3cssKbW6Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777544801; c=relaxed/simple;
	bh=mg3Q2SXECMgqemHLx9lkFQntiArxJAlTvDiMVbNAI2A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mGyyI/NDE7JNhPHKNxvYVGUlZZesnlnmi5KI4wM+dyXmeRCPTwHuzQ7H66RBp9dsxJo0YJI7YuZKIIrXrQcz8i7SwWoGrF7qINMVpHPC4HwCl54oUPqUrnRtr3nw/knqVlerCyg/1O6TMadVlqjRc35OgXIpQ+dCBcMvBAD5JuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgi3rMPB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgi3rMPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777544798; x=1809080798;
  h=date:from:to:cc:subject:message-id;
  bh=mg3Q2SXECMgqemHLx9lkFQntiArxJAlTvDiMVbNAI2A=;
  b=hgi3rMPBUNClDiODdmJCqqMkNl9G/TrLoF19oK1xGCrVxIEPN8Pa+a4P
   1HEJc0c1IqwIyPPJd8yMx+lLi130V9xz+4nGDa1m41JFvNE0NCjJXH+dE
   L3/EAA5RUO+5FhwufBuuCMC/MZwSJwlznQllJv5ES37V/vM6g8VXxREHG
   emUpZsgSmidSw7D+6YusEEtyLuMvTpGwxvjKfh+iYChmsEZmZ/zgqrINv
   XMl1P3FEWZCB9hRKb+LnpKxhdXn+CjRt5F9CgmkGw8s3/+FjmDObI8nPp
   EsACwkHCsemmIRNrxkt2Do70hSg0u0tzD/IggiZo1KmRM7yPStvP+NueO
   g==;
X-CSE-ConnectionGUID: x9hFwT83QSOLyblmAmnPZA==
X-CSE-MsgGUID: COMPq2xKRuCvQkwu7Ael6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78682545"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78682545"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 03:26:36 -0700
X-CSE-ConnectionGUID: DkbTkXdjQ8Ck04KiN/YLtQ==
X-CSE-MsgGUID: xmCG4aJrTGS8vy21vZxiGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="238519487"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 30 Apr 2026 03:26:35 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIObI-000000004nh-3NS6;
	Thu, 30 Apr 2026 10:26:32 +0000
Date: Thu, 30 Apr 2026 12:25:47 +0200
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [bcain:bcain/glink 54/56] htmldocs:
 Documentation/hexagon/qemu-glink.rst: WARNING: document isn't included in any
 toctree [toc.not_included]
Message-ID: <202604301208.e4oGQJcF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/glink
head:   5d897d0f6b0bbd170ef332eeae9a8329ec812a5e
commit: dd12099bfe857f1c7f5cd0915e38f655e8da5449 [54/56] Documentation: hexagon: add GLINK dual-QEMU testing guide
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260430/202604301208.e4oGQJcF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301208.e4oGQJcF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:550: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:168: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:559: ./include/uapi/linux/landlock.h:191: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/hexagon/qemu-glink.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

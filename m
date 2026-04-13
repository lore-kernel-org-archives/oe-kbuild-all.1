Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C50C33D4F8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 19:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776110213; cv=none; b=B7oORErrc24wXS3Kp7VFtLa2PD3jB+dfZ/Ll/IyZ063roIaVrCohF329GqirovyR8a6Ei95MTbg8qV5G8fP/SMVEEK5dw9zb0lGT22gJgBXyBwxkUU6V7cSxA2ZkeXlekcD1YN2PUPCxFf5E5Q6oWPIaKH8Q9O/0LC5DiZgr20E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776110213; c=relaxed/simple;
	bh=DE8j9lZdAJJJNS58z2mtSdSWi/z8pLO7tjOa7/37A0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uo8b/PNsyJjhlr+FD7v1Q0R7Ak7fk6HwD2OkKBEbSIxUpth1kHEAC8Eutgq5/DCzOTPGkXfB4AFu04a8w6HyC6psthw6oTuFer4h7nHhBuu0lMQ2iaSHtmEnWy+FvwEa1ItFdUpyF2Y4YozzWOiGRxJVjrFW8oi3dZCM8dKpK7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Shkeawkx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Shkeawkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776110211; x=1807646211;
  h=date:from:to:cc:subject:message-id;
  bh=DE8j9lZdAJJJNS58z2mtSdSWi/z8pLO7tjOa7/37A0c=;
  b=Shkeawkx93rr/epLe+8TemMZ4CIuELzyzaxqspCpKLl+IpwfSpEOukvc
   gaq2+2uORYt5yTm/L79lYvcpFogFMdKwL7LDeGTRx0j1tAARo681gqUqx
   luGOfJU7pRbJt9A+PkTSHha6l4PintbUWn4mBGccoepG4ZQyfuV7Tj4X9
   0BPYNgq7rJoUvTsJSQCC+cWAv7LZ0vUnRNAm76mMii1XAtQvOYSnyps3y
   BHLWcccMxP7XxzgdBB2o5Vsf1uGB4wo4biFQ+l7TGi8ylEkkxYj677Wjt
   v+J/Lw3824E126l7vzSkYBCdb1CRP7JKgvlSe4w/j1Q5MhtszlXdWxAfb
   A==;
X-CSE-ConnectionGUID: iKAxk4ymRASTuFI5ag+cAw==
X-CSE-MsgGUID: I0z7Fn9ESYSxUdSGtQ489w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="79640677"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="79640677"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:56:50 -0700
X-CSE-ConnectionGUID: +P7x4vkURsivz7rK4KaTIQ==
X-CSE-MsgGUID: /wCurEebSuCNwfnQu2/S2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="233907053"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 13 Apr 2026 12:56:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCNOo-0000000009B-1yZ9;
	Mon, 13 Apr 2026 19:56:46 +0000
Date: Mon, 13 Apr 2026 21:56:23 +0200
From: kernel test robot <lkp@intel.com>
To: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst:1: WARNING: Title
 overline too short.
Message-ID: <202604132146.Iz4XtlRm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Linlin-Zhang/block-export-blk-crypto-symbols-required-by-dm-inlinecrypt/20260413-212518
head:   9b0494c109a48c2e2a286f44e61f2f5dbf35b31d
commit: 9b0494c109a48c2e2a286f44e61f2f5dbf35b31d dm: add documentation for dm-inlinecrypt target
date:   6 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260413/202604132146.Iz4XtlRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604132146.Iz4XtlRm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,(Documentation/translations/[
   Using alabaster theme
>> Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst:1: WARNING: Title overline too short.
--
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:166: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:189: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]


vim +1 Documentation/admin-guide/device-mapper/dm-inlinecrypt.rst

   > 1	========
     2	dm-inlinecrypt
     3	========
     4	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

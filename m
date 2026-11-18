Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965503;
	b=Rw+gATVAxyWhTUyk8YQIsRleEB4zxdxjKViq5xf9Od1lz/hISWSTC9NHEuU8ItkJSUib
	 +F7MVtRD7bunvk8Yy1bVO3iG5Y6+il2qwJz9sPE2V+VwsU2ZnCWDBwz5hXgHslvWvRNzM
	 xWCvAIyTN1Q2lE8GonUX2sC03kd/PNMDJ+feOIMbNSB5wvCb0bKw+9Ec96Pzu3/AHIOfn
	 qVvMz96aS+lSVuqvLKbIFozho/40rpIOPtKmqUmT47BgvjCf7pxMhDL+lQAnKrcqL8QZa
	 FeJuwRCV1IsoxENZbveTsNnCdXPMyg4fThfWD4QYLyHgMlV/lROApWIjixEusA4GcFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965503;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zAkIjPRIUy+1ibZd/Ym2UtI/sxpiyDfTk20BZIJIObg=;
	b=BPHmk+yus/vhpQNmNjj81VlWmh32ciejKPV2hIgP3GfgvuSpqI9lwD152keQofrU3MgW
	 PqvInkOIwGShJXek6RbUcWOkUgBPzjz/gra2kUSrrqEuc15z8wxJL7IKW9Y9LTbqlOBJG
	 gbxB19ZEZfZfZQQ9IqzEI7omerhEagkCx0/ymOgm/+CyOpcQScFov0w4G9QRv5YeeKRp0
	 6p6Hcg791GuqSDIZPhr5Pa38n0xfNAQSM1e2q125wjLG/vzfNnYichNtlAeqzMWEmm9b3
	 i1qEW2aKiQ2XEKWYXxW6lx3di7CiyalmqbM9xv/aYsCD6BIBbuJqv+yQrVH4+8TRWLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l8AMW8Fj;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C93606A331
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 01:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C93606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l8AMW8Fj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794965502; x=1826501502;
  h=date:from:to:cc:subject:message-id;
  bh=RwRQLziripNf4YKGn/tlNGeuqGUG89PjV5qkMtUDkS8=;
  b=l8AMW8FjqSmjVy2w6N26iXu5lCr91sfdRoCe7kNaRUmrd1ey2aa5/5Pt
   HdFZuacJ4uMqksHsFI45MOrPp0oDcm7WeFCRCmvtLLLz05CbICYU/WgEc
   ePlq2AtNyA5sYhbKegg/hYtjr1DIEQbcPtkp7HGuXhDjWCAKyfJfH4VMT
   s06AjusfJWLYntnIsFrAa/QKLLRMxRnVVcFlW0Uc5UyjsOvZGwrwy2ygE
   HlfEraPZnqNh1wJ5Bs5x2YaM8QDYwyNL9kQKFVqWFq+xlPuzhW1fmevzA
   SqpDmmRTGvCvrCpJkpwdS7w1Xuq6WTNtq7IA1TZ2Bso/7KsM5Qq9h8JNY
   g==;
X-CSE-ConnectionGUID: NTtvvo4AQiCz+w7C32+Ulw==
X-CSE-MsgGUID: ink+h12SRSef1DKzqUR/8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3660279"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3660279"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 17:31:42 -0800
X-CSE-ConnectionGUID: NkoLg0pUQS2O6OeSSZ/X6g==
X-CSE-MsgGUID: qRpJMjONRIqj0EPmHlYtYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9909026"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2026 17:31:41 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTUWP-000000003HW-2paZ;
	Wed, 18 Nov 2026 01:31:37 +0000
Date: Wed, 18 Nov 2026 02:30:44 +0100
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [dhowells-fs:netfs-next-3 5/17] htmldocs:
 Documentation/core-api/bvecq:250: ./fs/netfs/bvecq.c:67: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <20261118022449.06BFWl7F-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-3
head:   e74086cfeb13e6550daa03bdc877b5bc8f3a9864
commit: dc8006b617d9c43da48d339b85cf3b4c78d2007d [5/17] iov_iter: Add an API document for the bvecq structure
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261118/20261118022449.06BFWl7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118022449.06BFWl7F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
   Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]
>> Documentation/core-api/bvecq:250: ./fs/netfs/bvecq.c:67: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/core-api/bvecq:250: ./fs/netfs/bvecq.c:141: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/core-api/bvecq:250: ./fs/netfs/bvecq.c:146: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/core-api/bvecq:250: ./fs/netfs/bvecq.c:198: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:387: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

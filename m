Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A404B2046
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050087; cv=none; b=Mg1mCKU2Cwf3SgMIa3UZh7BqD1buz8LXMPfjryr4dTi2UWwPBHEDo/FrOhCM+N9nEhmcl+EWoZJeLJQjdGIQ1TSJmo7eLzO6pnXaidL7zotwpditn0YxsrMrmtcC2c3KiOOj0QFtacnhEfK76hkNkqIVsPoRst9tfjsSNUw+PQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050087; c=relaxed/simple;
	bh=01tAgheeRXM47GQAs18chYtHGygW9anAU+onieFZtfg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VJrX89rLfwWuyKcNAUBe/b1JRUTKhPcsTmwuzRN+D5F51l2HfY6jynLZTTJhMS3VHb7Bdac3qGjGtwdvvFMxMjI7vI9cdxvV1s1ZgToFydvZYHetJOQyrK3G0VCyGT5QZSuluptns428asa9uZQ/7NT+eXE6h532/9uGjz8azAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfe6AZsM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfe6AZsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792050084; x=1823586084;
  h=date:from:to:cc:subject:message-id;
  bh=01tAgheeRXM47GQAs18chYtHGygW9anAU+onieFZtfg=;
  b=cfe6AZsMtZ3XwgTJoOz56rHCh2WcRRaVMa1sqO3YUYfA3gCtVNH/Uf03
   LmtWoAPDvyl8Sbyvvph0ijN3ovAxOuPd9MW23WlaWlZTJD4Q3vh5N5tLB
   boEC+FDkH/qv17JBjvNtwJlZ5+XzTGwbIWJw0SaghRGplbUeAvtUhdmFh
   WmPezQweDrByz4sr6zY+LGxwxUC5MjgZs6FuYoOsG3YPmXuBBOjjTPAGl
   88KOe3RvEHvXzoh4oBbrSaNc7gsf9fLgSvqtUC4E9vU9cTaTeqKYvOFyB
   S8SJ0zGJSO5v7qCOEeYGFbF3BbOlM8KZRTDCK65T7alA4Sk9kAlb2NUL8
   g==;
X-CSE-ConnectionGUID: jd9s6GPnRjaU2gkQIkIaTQ==
X-CSE-MsgGUID: 7KfhsvNfQ6iXCRc3oIMnuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="818430"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="818430"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 00:41:24 -0700
X-CSE-ConnectionGUID: f1LVQg8vT8KWa0dsCJ4Mzg==
X-CSE-MsgGUID: 0QXTZC0ZSW6Ojoesd9wwrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1535994"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 15 Oct 2026 00:41:22 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHG5X-00000000BeZ-499V;
	Thu, 15 Oct 2026 07:41:20 +0000
Date: Thu, 15 Oct 2026 09:41:08 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [dhowells-fs:netfs-next-3 13/13] htmldocs:
 Documentation/core-api/bvecq:228: ./include/linux/bvecq.h:72: WARNING: Inline
 literal start-string without end-string. [docutils]
Message-ID: <202610150909.x5EiZZWt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-3
head:   d43a7f2a38d9f9e2d1db0b79681d6b4bfe766738
commit: d43a7f2a38d9f9e2d1db0b79681d6b4bfe766738 [13/13] iov_iter: Add an API document for the bvecq structure
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261015/202610150909.x5EiZZWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150909.x5EiZZWt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Using alabaster theme
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>> Documentation/core-api/bvecq:228: ./include/linux/bvecq.h:72: WARNING: Inline literal start-string without end-string. [docutils]
   WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
   Documentation/driver-api/basics:42: ./kernel/time/time.c:387: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:410: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

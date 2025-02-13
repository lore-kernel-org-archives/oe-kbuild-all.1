Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F804207643
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 06:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739427407; cv=none; b=nCZIVPIa24Grb/BwVA9UxAk6YwUx93YyeHAamaAttQoqgjhVQ0vLiyTEP4iZlqdZI7WeABLYi25DPypETGpXFcN31FQebGshzWP8zl2nk85Syu0Z5IuoLbKVDS4m/SwN0yww6+fg1cxclM7S7P5NbSgPR7SPIL+L1htHhmAfcmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739427407; c=relaxed/simple;
	bh=qYEF1sbd3KqnXmwwVHc7IA+FC8Ojj6wKOxDq+v9IVSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvJwaaNebIsQKH9xDD53JLUGH/HxtrY16nUirqLu7XK8XKBI/+ENuaKp3ksQ11Xh/pr4sm5WvBm0jEKBz4Q3RQNqR10QyQdLDYMfaUZL/VX5q+42uPzjEzSu1Yyed/t8aoY+5VEaxPNI47WuoEMWrG+4b1MkjAmEVJ9IFr1B3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igvQVTgB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igvQVTgB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739427405; x=1770963405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qYEF1sbd3KqnXmwwVHc7IA+FC8Ojj6wKOxDq+v9IVSQ=;
  b=igvQVTgBE7AiqgOVVDwZaE58Uu7KXdwcbkUNCIDmVqwfO8M40/X+VnvE
   X6sCyxW7XLDz5vJfeRIsSEaQzuC616RE2+tsgaLyPEB0Ge3R2Bvtf1nzl
   JictzsQC2vQmXSrTLpg9NR281kHn7fl7vOBs5j36LHDlDe0K2AF3G+YrJ
   UtCqMw8Rx2penzFCHMl0RtAD4pfz/SBVktiFZ3gF2ycdeXt0PscxNlTeo
   BvkopRwlN06zqzGBuUEpKErJCKT8/2zVumY/4GxN1VZMZEcKaLgns0jc4
   gRyFMN7db465WKKts/x0z9hzjHcmRgJiECYrQyUBhe9F9RXpXFCjU783N
   A==;
X-CSE-ConnectionGUID: tmtNJTBESHmcNrh4qMX1Yg==
X-CSE-MsgGUID: x+xtWXHUTSm96A2YHG3RmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39344221"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="39344221"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 22:16:45 -0800
X-CSE-ConnectionGUID: crCsApoWQe6HG7gUMIP7UQ==
X-CSE-MsgGUID: OsTVMdmzSQ2vw+xH2j5LAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113530857"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Feb 2025 22:16:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiSWf-0016cx-1h;
	Thu, 13 Feb 2025 06:16:41 +0000
Date: Thu, 13 Feb 2025 14:15:41 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/str-enable-disable 21/36]
 drivers/hwmon/asus_atk0110.c: linux/string_choices.h is included more than
 once.
Message-ID: <202502131410.fCiqhcla-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/str-enable-disable
head:   6c9652f6b59a48e3ffc567fb41acbe262a9b0357
commit: 43fa20da7caf7fabdb52538b959be2d0ca992215 [21/36] hwmon
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131410.fCiqhcla-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/hwmon/asus_atk0110.c: linux/string_choices.h is included more than once.

vim +16 drivers/hwmon/asus_atk0110.c

     9	
    10	#include <linux/debugfs.h>
    11	#include <linux/kernel.h>
    12	#include <linux/hwmon.h>
    13	#include <linux/list.h>
    14	#include <linux/module.h>
    15	#include <linux/slab.h>
  > 16	#include <linux/string_choices.h>
    17	#include <linux/dmi.h>
    18	#include <linux/jiffies.h>
    19	#include <linux/err.h>
    20	#include <linux/acpi.h>
  > 21	#include <linux/string_choices.h>
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

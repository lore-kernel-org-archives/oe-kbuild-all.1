Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E61B210FB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715518980; cv=none; b=ZVCD6pGEm8WY+Go6zrZeEtCyOnSZqiD88YIwKS19uzBnHJ6l2mb9O2z6mpcbZpqWWHfR3pkgRzLt810KtutfuiYd9Vqdw8Jo6vtYGxL+7mupX+RMTj02F012VDDORafMVdUwOlJJZ6hAR6sRV/U9fnz8vaO9kVI0r7EEC8w4qE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715518980; c=relaxed/simple;
	bh=YKn5nTpj67pz97sUDoSNg27BrPyG590S9x3NFhIUFG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UE1nHvaB2eUa82GhhJM4U9k5lRqSH9WUW7+VZOdf6SUwgg1ASrfMmMY/oQ1JZfTwhVFpJxRNVCYzhigLXfY3cjzXK596hjODsPl9/1cmwFmWRZ7+9Od9Gr6hpAypchxedoMrAYQMHn44as7yymDVFhMgpoBbUkTvN010p6Jwm+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndilPnmp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndilPnmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715518977; x=1747054977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YKn5nTpj67pz97sUDoSNg27BrPyG590S9x3NFhIUFG4=;
  b=ndilPnmpSGbj7HbGTRbKNnYfvbLLYtpIbImdK/DVi9W7lHvzY96epDXW
   Zc+5iuEp5UqUq81vIiikIFj2jOpRF1cLmJiLDFJwKmFG4OjkI0pWtwv6u
   gDEy9YwvNUQOXLD0QiGSj4cmXsxKyYD7Mx6kI/8pFFhCVe47O5jKz3Gm1
   kXbju08aQrMMzWpGMlB+I+DEam0iBfEoVy1h8RGqp9haEzkF4AFgrPZKC
   I7AXiMnM6JQUql8to8OuA1Y2M1BD3Tt3rfGawmZ5ou49ujxyQycggYSxO
   IJZVQBT+M7kIQbz33Yenp90dDkfHhBR29ZCxC8uMN+2xp8sOhOFOSogiI
   w==;
X-CSE-ConnectionGUID: X0kOMzm9TSmVo1WJULcJuA==
X-CSE-MsgGUID: ZVAi7criQ8GlPvFNbVVzdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="33967737"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="33967737"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 06:02:57 -0700
X-CSE-ConnectionGUID: DEWUj7YcR+Sg30ctMAkYpQ==
X-CSE-MsgGUID: EzKHo5STSziYOKgdGvxzPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="30651927"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 May 2024 06:02:55 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s68qq-0008bf-22;
	Sun, 12 May 2024 13:02:52 +0000
Date: Sun, 12 May 2024 21:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, liwei <liwei728@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9545/9601] include/linux/entry-common.h:285:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202405122055.cg12BYVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   15bef328224e70041aba4aaa6b23977efba191a9
commit: d9ed39df777afd38fcbd4f4ca670cceb2f168124 [9545/9601] entry: Move exit to usermode functions to header file
config: loongarch-randconfig-r111-20240512 (https://download.01.org/0day-ci/archive/20240512/202405122055.cg12BYVn-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240512/202405122055.cg12BYVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405122055.cg12BYVn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:423:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:423:29: sparse:     expected void *ptr
   kernel/entry/common.c:423:29: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:423:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:423:29: sparse:     expected void *ptr
   kernel/entry/common.c:423:29: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:423:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:423:29: sparse:     expected void *ptr
   kernel/entry/common.c:423:29: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:423:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:423:29: sparse:     expected void *ptr
   kernel/entry/common.c:423:29: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c: note: in included file:
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *

vim +285 include/linux/entry-common.h

   264	
   265	/**
   266	 * exit_to_user_mode_loop - do any pending work before leaving to user space
   267	 */
   268	unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
   269					     unsigned long ti_work);
   270	
   271	/**
   272	 * exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
   273	 * @regs:	Pointer to pt_regs on entry stack
   274	 *
   275	 * 1) check that interrupts are disabled
   276	 * 2) call tick_nohz_user_enter_prepare()
   277	 * 3) call exit_to_user_mode_loop() if any flags from
   278	 *    EXIT_TO_USER_MODE_WORK are set
   279	 * 4) check that interrupts are still disabled
   280	 */
   281	static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
   282	{
   283		unsigned long ti_work;
   284	
 > 285		lockdep_assert_irqs_disabled();
   286	
   287		/* Flush pending rcuog wakeup before the last need_resched() check */
   288		tick_nohz_user_enter_prepare();
   289	
   290		ti_work = read_thread_flags();
   291		if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
   292			ti_work = exit_to_user_mode_loop(regs, ti_work);
   293	
   294		arch_exit_to_user_mode_prepare(regs, ti_work);
   295	
   296		/* Ensure that kernel state is sane for a return to userspace */
   297		kmap_assert_nomap();
   298		lockdep_assert_irqs_disabled();
   299		lockdep_sys_exit();
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

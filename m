Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3714A8F7D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 10:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712227370; cv=none; b=bm/a9AEbBk6Z4aXfcxDTAijcsFAiGLck2t30zMZ0Z+S3izT3MUDpKPu1qoEvpsN2gdoO5V3tyIlyuTb5OL77T3uTMdBz5TPFomRNBqGNe5A/oG7UX3UGllussIhxVjnsh/MyU7dNqDNBmdSWbmq7+1EENTUmEz5FCv2+DsJ2Cus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712227370; c=relaxed/simple;
	bh=CV7gj+XZ0oPSGQtIQ4WXYCwfeQ///Z3a48gWvO6HTsY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o2UThbm1DYRxt7N2eu1zO22MbOmAS4bnwUX7JsjY8cG/n04D5LtNAEMUIp0XopODoWXUFtFKbYBAof1JRJJ42b6XmuDK7ydTxMKsDBfQweWklynLHEc4DeTdMj5Ee4h9uabq3C2jBiRqArIT5V6Yee3R2k558jHdn5eauLKZOLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THTYHzJW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THTYHzJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712227365; x=1743763365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CV7gj+XZ0oPSGQtIQ4WXYCwfeQ///Z3a48gWvO6HTsY=;
  b=THTYHzJWQeHlC9FRNC4bzd2rRtn/tSLuIeu/bXTQwmzKMIT3OMVO29IZ
   zKVieOiDOITd2+j8HjlQQDwK2fZf1oMulV4KU9W6VTKlMe3zvG9ZgOjKp
   mrUnpsvXYkIEiE3gzwAjWXC5prLb3huUvn+xq+aoCICUbq06Z7L0AqTj5
   Bm8rhJtKcLM3yJvX8aDaYephyR4n3WG/dTk6GF5ocdWMC1pejl1plLZqb
   g2IGIkp9fQXjeUJMjxEfhZj9TXM11vBus42iquhO4EiiQtJYpojKNevtw
   t7cjjv5tFrEfjxPllOwE/sYBFH1f992ly46BvVYMzCk/2j23r/ly9AhA2
   g==;
X-CSE-ConnectionGUID: +nWFypNVQdGqutzoW9+XMA==
X-CSE-MsgGUID: EnHSVmldStur5O0yUr/WEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="29972658"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="29972658"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 03:37:44 -0700
X-CSE-ConnectionGUID: khYFBxsOQ5O3Yz9hg9Sdaw==
X-CSE-MsgGUID: luiP7FSDReOydeUAxCBPow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23431860"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Apr 2024 03:37:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsKTU-0000wO-2X;
	Thu, 04 Apr 2024 10:37:40 +0000
Date: Thu, 4 Apr 2024 18:37:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Yury Norov <yury.norov@gmail.com>
Subject: [linux-next:master 2530/3921] powerpc64-linux-ld: warning: orphan
 section `.bss..Lubsan_data249' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data249'
Message-ID: <202404041832.tMSAtKyB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
commit: b44759705f7dc95d539d145b4c2edcaf079e7c33 [2530/3921] bitmap: make bitmap_{get,set}_value8() use bitmap_{read,write}()
config: powerpc64-randconfig-r016-20220119 (https://download.01.org/0day-ci/archive/20240404/202404041832.tMSAtKyB-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041832.tMSAtKyB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041832.tMSAtKyB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data249' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data249'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data249' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data249'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data249' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data249'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

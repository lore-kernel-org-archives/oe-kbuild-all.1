Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C2D15E90
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Mar 2025 04:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741839761; cv=none; b=PhEeTMcD4CkMqIRzkhefhnjkygpWvpHWuTRu4ixoJMWtKDBUkcq5sQ0Edo0c04RPy7puh06COTDKvQQDT5CClFgkzmjQIqU+NgbqxQyBIu722cuK0wtPbP5G+nOAfFUcOkyBRO/sjxg85jIeC+pmxMlIs7w7j5/z51E5zohlAnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741839761; c=relaxed/simple;
	bh=VLvcixEln/nHVClwygr8HyPHnkNa4dTHcqhGwvSEJwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=os5/hA2vaB/pemIan7JQJm3ZIBvKrdxK65siaE/oPTPgFu2HKzLRkLMPtmCC3pBgoPybgAhMu1Cm0hQMgAiIE17IuJw7162rEMwpUpu56NppPW36VB0Z2tPeIn94Eq/61W3BSsvApDXYK6sursfmR1h4n+hJ3Wn11zn7qHhP5K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZHvQqFx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZHvQqFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741839760; x=1773375760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VLvcixEln/nHVClwygr8HyPHnkNa4dTHcqhGwvSEJwk=;
  b=BZHvQqFxqQR4BWw/RZPkoJH+ZFng5TkNtb7SkplpnG4aT7SzdXkAu2ew
   THG9WUjk01/YWBsWoHT9xpTPEThQrKx+gsSVa3ct7fM9jGfMWc0A7yHCJ
   GuNC9J2CmbFRuuxNUaY+5fzf8wLxRLrkcQfAJdJMPMlvsr57o+fB1vE0S
   pTJLqKV/dQQ+UQYiIMwyN499Ebm7eSW+4yK0GpTO2IZ+QImGqe8KmC3S5
   GFih2/mGryR4EbElseuXmHN1TtvLpDYPL8gZqjRVH7wCDx14ZpbSdM5dh
   bj0ifbS9lfQw+5IO2GlyCdns/fL/ewLMV0O6q7appAZ0dWrbvLMa6yTSj
   Q==;
X-CSE-ConnectionGUID: TWI1JaFUTUSNebdOS7WlaA==
X-CSE-MsgGUID: Hy2f9QOAQKuQSgla7lYvyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="30530365"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="30530365"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 21:22:39 -0700
X-CSE-ConnectionGUID: 3WnsgP8DTtS3rjJEqOvYLQ==
X-CSE-MsgGUID: gSgEgfpbTTyzd6FuBqgbpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="125910843"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 12 Mar 2025 21:22:38 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsa5b-00097U-2G;
	Thu, 13 Mar 2025 04:22:35 +0000
Date: Thu, 13 Mar 2025 12:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/283] vmlinux.o: warning:
 objtool: exc_page_fault+0xf4: call to _printk() leaves .noinstr.text section
Message-ID: <202503131218.xFLxjT7R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Idan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   7956f88f8a7a7881d9f2399b3e1b276a041dc59d
commit: c6e98994c1ab985f4c8a5cfab0ab692505be75e9 [0/283] ANDROID: Add kiwi_fault_logging kernel parameter
config: x86_64-buildonly-randconfig-006-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131218.xFLxjT7R-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503131218.xFLxjT7R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503131218.xFLxjT7R-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: xfs_da_grow_inode_int+0x346: stack state mismatch: reg1[12]=-2-48 reg2[12]=-1+0
>> vmlinux.o: warning: objtool: exc_page_fault+0xf4: call to _printk() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

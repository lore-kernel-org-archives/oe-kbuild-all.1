Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9646412DD9B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 05:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718946632; cv=none; b=PR0czfgeD8XuIl3FnALWWOxLt88cgHYJov8MkQ/D5n3FhjXlvI4Fj6JUezsQyVX42GylihPIXYIXwcQjH+xziRWY/BHty2kAebby0xDIYuL8VwPyHcotML4M7xUKy3SND96//InGimKl8HljPLyw1qSjxUFpOt+tPZDlkdInkWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718946632; c=relaxed/simple;
	bh=pKaiAEfFDU0H2ETeOoMNS0ELNWb0IhX0WT9weeitPT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h62mCtg8se6eV/gD5nsuB+0UDypu6Mss49s/qzv2jedDRWBhr0B6Zl8pJecHvRlCaJbDz7OOr0x/Pz064+PNSF0yZYteF2zLiyTX9RXPc41lvj1237XmN/XIVAaM8yivBkEabXqYprDi+vjhcPdspc0uisJ2jqkbrO8w5KDNuxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VT7N18Lt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VT7N18Lt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718946630; x=1750482630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pKaiAEfFDU0H2ETeOoMNS0ELNWb0IhX0WT9weeitPT0=;
  b=VT7N18Ltl3sgIvHUUtGTef4oazBVhc6LE4PyyLkiluyjibtDoEd0KAlP
   d/oE7GZcj/5a2G+I7TkTwBX3u+GptB09n8SXhSclZmjXT0/CPPJufGTR1
   WZPOODtLz+8+v6NouKLlXAl9bRn//jm3y1i1qHTCUY7K7+3JIV6pH9r0Y
   AXGzzBck7DQ2kFCofursrRGPPorxT7dcNInbai1UZXCPRaBqfJrMGqIed
   ZvZUj3KQ+4OItR5AUH/NvY2L5BPt1cKg+FEF5GxUgH/GvDGKfOq46ZvmW
   mwOZ4LlNdfUmNd4TO/XFt8LoBkC3kSJLgmVm2b+llze9i3aRnjepvFr+2
   A==;
X-CSE-ConnectionGUID: uAMK+j/kT4aFCbecS6Im1Q==
X-CSE-MsgGUID: 7uzJV+UvRmyYSOl3Of/mxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19846216"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="19846216"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 22:10:28 -0700
X-CSE-ConnectionGUID: qOomTsCCQdip5HSDmjW+lw==
X-CSE-MsgGUID: mtWOS9vGT/SDgcYn9K346A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="42294551"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jun 2024 22:10:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKWXY-0008Fg-38;
	Fri, 21 Jun 2024 05:10:24 +0000
Date: Fri, 21 Jun 2024 13:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lu Jialin <lujialin4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2514/10358] ld.lld: error: undefined symbol:
 sched_settag
Message-ID: <202406211329.ROMqS1XO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   79e1c0e468a9c6fa0ca8d1a329bbba9c40f4d84d
commit: 34239429b1253e3d19cebf15277f46916519b1c2 [2514/10358] sched: programmable: Add user interface of task tag
config: x86_64-randconfig-076-20240621 (https://download.01.org/0day-ci/archive/20240621/202406211329.ROMqS1XO-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211329.ROMqS1XO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211329.ROMqS1XO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sched_settag
   >>> referenced by base.c:3697 (fs/proc/base.c:3697)
   >>>               vmlinux.o:(pid_tag_write)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C4C14883C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 13:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712151309; cv=none; b=JfHw3uotKQSMLtqaDlSexirzpDSpGFG6OxhKF50ozhasHlvkORmI+Pm3Jb4B3pKBwxePLRCXVErm9OsC/zrbUwprKU6p+7yVn0ZPvRCeUkAvCv/Ofk4iGw6nFt5VUUmsZbI/y/vJurxoIYu51inrWkX18LwbBtACTD7jVdDy8v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712151309; c=relaxed/simple;
	bh=BRKRr6QrKt+56Ocm6lhMztYvuwLbAeqRLyWKNW7vspM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZTsd1kMlucWOKrY59K1jclBM2zyky/lHwOO/HUqt4k1G/NLKWHxakj6VzaS08YvPkC812jUpgnvXziRBA53LDpvd+TxS+daHRwE8khtHa+7xgLeE4B9GdQjepa6XdDzRkjWjoI7mGp510abckBRFUy+2B+RJywsuTJbcCS+78aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjnlHMuu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjnlHMuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712151308; x=1743687308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BRKRr6QrKt+56Ocm6lhMztYvuwLbAeqRLyWKNW7vspM=;
  b=NjnlHMuuqeBgPBsu7KaYL5sEaVHa7Ty4fj/hyZ5hmspDLUoOzJriJOJZ
   3Tk+tx20vgc8LoA5XeQPUNBV7tDdFP1J++TkYYIjdvEyh+PuGc1oTT5ZK
   QNY9ZTHnfs8ZQ3YH6q0SZlruG+tPjayiUxCIAFFFHSh74pt+fogjlw/YK
   f1rKThfsQAFoQBjpDBGRPXlKYhIJuvo0IPFQZHWFgzGzlvvXbyiQWCCD7
   773o34ym0eaRPQif4/T2QbrO8Dsx4y8wCVFGkleCavuGYLYyuozWrdmDX
   rg6h6aTIYXKg9DjvKYRFv27AzfNJVMd4TE6uYEy0H9VnYtvTc8mlm2Gs1
   g==;
X-CSE-ConnectionGUID: j0WS3u9RTci2opZffpSurQ==
X-CSE-MsgGUID: 7/yudI5RQcKT5w7TuUF4dQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7251887"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7251887"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 06:35:07 -0700
X-CSE-ConnectionGUID: T/019IrTRauMAn+cePh5nQ==
X-CSE-MsgGUID: c8tYUAMERp2GSPDc1+3Dbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18360859"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Apr 2024 06:35:07 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs0lb-0002Ej-19;
	Wed, 03 Apr 2024 13:35:03 +0000
Date: Wed, 3 Apr 2024 21:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3501/3504] riscv32-linux-ld: section .data LMA
 [001f9000,009465d7] overlaps section .text LMA [000a7e84,0177d68b]
Message-ID: <202404032101.sKzRXCWH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   727900b675b749c40ba1f6669c7ae5eb7eb8e837
commit: 68cd017e43dd5657fd2875b38da5933e1fa7660c [3501/3504] Merge branch 'slab/for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
config: riscv-randconfig-r032-20221115 (https://download.01.org/0day-ci/archive/20240403/202404032101.sKzRXCWH-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404032101.sKzRXCWH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404032101.sKzRXCWH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> riscv32-linux-ld: section .data LMA [001f9000,009465d7] overlaps section .text LMA [000a7e84,0177d68b]
   riscv32-linux-ld: section .pci_fixup VMA [c2167be0,c216a82f] overlaps section .data VMA [c2000000,c274d5d7]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

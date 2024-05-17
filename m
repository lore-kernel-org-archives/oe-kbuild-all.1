Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA3945007
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 19:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715975992; cv=none; b=S3zXht2hUREYWHW/Hz+46htE6Jjj51hFKUhwsF+LGTjhExGxQsjCPcgxilu0agEehWPjfIrfeNrDOUQGHUXqib++1/JD+nSTdGmDZr9D2FDglKyW/x1EAsHQrRRGqB6gu/56V57/ce0+9nUOmP1MnxuG4qUrTwrvNQIsWlzTW8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715975992; c=relaxed/simple;
	bh=Wk9o+OMkPnEAW6eqWTGfyqStd3deAk16C+AxvX/uDQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HGOxyJ/SVB5BZb6e5Ge9SRwx3Z0sibj60IMo2F1vyTcN7MT3kwXFvLNIjPiSu5daxTWJAE33rAKRkLJPYUOVmhyZx/FWF0w474pq/lw/7Y7+Nw7YSQrj/1U9zLsro0QlpZa9kS407cl/nkhm6SnBPhlveuF4lbrl7NmC73DZoug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3u2tUmc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3u2tUmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715975991; x=1747511991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wk9o+OMkPnEAW6eqWTGfyqStd3deAk16C+AxvX/uDQk=;
  b=R3u2tUmcgy7pBQQDDM1WdzCLRNSjiVDz0DRs9BNFtZB/d6/O9Wxff7cL
   3un+E3adAaYVWYkvpOEwgfjd54czIduaGQJrRwaI59eYPdSfJ7dzVMegX
   ImZnwNZe2hZzXYs/u3B71EfDLXb02ocnjrpxdV5tc45NK/8mFGp9CKP+l
   /oQS0+Y0kvHyHHhsv1k9eb1snncscsJhIlsXQY/F1MPBSI/oQQla+3nih
   CndxxK89XoK8SIsjSFmzqt84VrVeXoqkI7i2imEqTu1dvnz12hg6DNMgZ
   zW5LIdDdqyTfP/Ainhs6E/Vuf3nCZoduH7NHKOMetm2HK+Vmgp0lMqtV3
   g==;
X-CSE-ConnectionGUID: sW8iKjcSQu2sM9XqsiXIRw==
X-CSE-MsgGUID: SVObT9qAT5OUjJUc6L95EQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="16005519"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="16005519"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 12:59:50 -0700
X-CSE-ConnectionGUID: nXo3GmTzQAyd9rx9iqrzXQ==
X-CSE-MsgGUID: zDHKs2a7T2y+aRhj+Fjldg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="36314177"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 May 2024 12:59:48 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s83k2-00016I-0b;
	Fri, 17 May 2024 19:59:46 +0000
Date: Sat, 18 May 2024 03:59:08 +0800
From: kernel test robot <lkp@intel.com>
To: Srujana Challa <schalla@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Shijith Thotton <sthotton@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>
Subject: [linux-next:master 13118/13355] ERROR: modpost: "__udivdi3"
 [drivers/vdpa/octeon_ep/octep_vdpa.ko] undefined!
Message-ID: <202405180354.mxlv5DVG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Srujana,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c75962170e49f24399141276ae119e6a879f36dc
commit: c9d853a0540291d48ab10fcf4e5a75f1f4741da9 [13118/13355] virtio: vdpa: vDPA driver for Marvell OCTEON DPU devices
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240518/202405180354.mxlv5DVG-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405180354.mxlv5DVG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405180354.mxlv5DVG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/trace/preemptirq_delay_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ubsan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kmod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_ccmp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_tkip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_wep.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kmemleak/kmemleak-test.o
>> ERROR: modpost: "__udivdi3" [drivers/vdpa/octeon_ep/octep_vdpa.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

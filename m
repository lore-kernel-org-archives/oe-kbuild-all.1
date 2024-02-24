Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04E125575
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708774143; cv=none; b=rwR3aQeh4yNoGt6O4e8lldjX+HNPDDg5P+XFzEr3OEPxSWOWOgLE6q0ZpX/77PSym6ZlxHuHMAzwKvN35J80NBojUii9jSir1mIWtPLH9tfYWa6i9ycorTuusF0HmEN0HVXRyB9Fc00o8noggdbhEfPoFbjX3ALXT46RMgl3LZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708774143; c=relaxed/simple;
	bh=5EFDKmiNCnumRiQmhkAH9ClIR5hHDUt132Ij7MseqDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+odXxgg3yZscZzW4bgbeI+ZrvLHGnWFU2KxBlaQ0gsFnmK0if74LbrtSMzkszIOakLgpDnEgCh65gWxFJ0YnZfFbUAWfnbW5c/kdN2yPW2V/T8CVwJSd6+uA4yU9eZ/YuxJ8u0muvxGBT56QrEwjX2LtzqNbX5nlFL+/KvWTEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5yMLZxu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5yMLZxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708774139; x=1740310139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5EFDKmiNCnumRiQmhkAH9ClIR5hHDUt132Ij7MseqDI=;
  b=e5yMLZxu8FmZ73WjAoo7GCXsoKI5mbe6x7wfBhJmqWQTjz3/sw4hgvCC
   MJ6acWrDCLwS/qe0dUiuqfmDhtBLQrr2+Idv51lK+d73JPPLkJ8fSK4xh
   Sizzd3ETaCdCkXjLGgPmQibMBfagL0vymtm1mVA05AnGwtU03/8ovNavF
   /2CIypdfflCe7L4X60BN9P6ZCmythwGn0DV19La/HgbAFsDprqyufm3nF
   QRqCdIzIFzMABpyJmkCrNm2tIbGlg2Wtushhv3HDEfDcX4dRBGRkfD+pi
   4aXd21KDB87oCFGWVg7PXL7rFsNuq4lI7xBMVcbfwdtuT49omDjeT9hqK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20647074"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="20647074"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 03:28:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="10855843"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Feb 2024 03:28:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdqD7-0008Ul-24;
	Sat, 24 Feb 2024 11:28:53 +0000
Date: Sat, 24 Feb 2024 19:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <yi.zhang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:ext4-iomap-v3 32/40] inode.c:undefined reference to
 `__divdi3'
Message-ID: <202402241920.TsK4l80I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux ext4-iomap-v3
head:   9e716d325090913e86881adce749ee351757232e
commit: 1c02dbf66a9f0526f0f55e4230419ad652e6fbe5 [32/40] ext4: implement buffered write iomap path
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240224/202402241920.TsK4l80I-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241920.TsK4l80I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241920.TsK4l80I-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/ext4/inode.o: in function `ext4_iomap_punch_delalloc':
>> inode.c:(.text+0x9a4): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

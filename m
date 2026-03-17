Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44015367F28
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744228; cv=none; b=RsN/oWwSoN6i0IKJqiphkjZoFsOO1wUaQCM7E5tdD0kqsYJi791fK7Sdcbeb1YTpwslx0v6rDFZdNzb0X5CfsWcB9wFUYg5CXqNNH76ErtQ5ahZuECT7zuSphP19IOGwWjMIOHRz69/R6n3TW2Hghe3XgLEzCqm3srTtgyAqB+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744228; c=relaxed/simple;
	bh=t45V9Y4oNNXUjh7I/NXG44nqBwbFz3DB8f8avozjdUw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lmv4eIOqXDhQyC+AWRtYRt53FCxiWVB6WCtyRoG1l8vpp//tZ2gfnT3H8sBxhgRhmehalfNLj2MTCXG/XhpZVIbZr5Gx4eLdaOSL2qxmLBMsxlJbVfkEl7ljFsClUFVztUx+m5MujpCtVAjBDHT//8VfMsTIsvA6WkNxaMILSx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XrtPW1Zq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XrtPW1Zq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773744227; x=1805280227;
  h=date:from:to:cc:subject:message-id;
  bh=t45V9Y4oNNXUjh7I/NXG44nqBwbFz3DB8f8avozjdUw=;
  b=XrtPW1ZqYDQbns9oAuGoROXIKIShCQtpZRCJ6tIFNRiaAaPkUqxy1qRT
   qpPIaTcENkUPaY2vmcjpDLH0Jk9lw0SJBLewKb2PFMIJvg3L5kI9hm++D
   fUCjkNFBmenp/pW0EFFYmK/1cpC0D2wQu8YzL6vZ3COX1Ue7lgq1xuSpE
   jEwCzoSHO3oBXqvwZvk0qMkRWFl0ummJiNADO+r5SngMWh6faAhAPGNRu
   JXiZdBEgHmGJzBhuDTOGPqhfNdcJVGs1Ed5EmOUIlU4FA3PynpPTWsBk0
   Dp9KStkfRRB0A2xkHpyCnQiq06FU05wB4ow2A4grYJEx0LoF+9oDo5Iwm
   A==;
X-CSE-ConnectionGUID: 8BzFitUyTyqShwWPcQI49A==
X-CSE-MsgGUID: QRf/KY4MSuKK7WwDRVMc6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74687219"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74687219"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:43:46 -0700
X-CSE-ConnectionGUID: vRE34IqgSPKRB6SGm/iIPQ==
X-CSE-MsgGUID: dE7uNTi5SzmHrU8piCSP1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="260131766"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Mar 2026 03:43:46 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Rtm-000000000Fp-1Xol;
	Tue, 17 Mar 2026 10:43:42 +0000
Date: Tue, 17 Mar 2026 18:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 1/3] fs/f2fs/f2fs.h:5089:4: warning:
 variable 'stop_reason' is used uninitialized whenever switch default is taken
Message-ID: <202603171820.tjmYbWaU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   8b0a278150d8b381c33a881c61d439905cc90ccd
commit: 42d256b5f9f2e46beb837949272d4374e2a5e859 [1/3] f2fs: call f2fs_handle_critical_error() to set cp_error flag
config: arm64-randconfig-r062-20260317 (https://download.01.org/0day-ci/archive/20260317/202603171820.tjmYbWaU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project f46a5153850c1303d687233d4adf699b01041da8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171820.tjmYbWaU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171820.tjmYbWaU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:14:
>> fs/f2fs/f2fs.h:5089:4: warning: variable 'stop_reason' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    5089 |                         default:
         |                         ^~~~~~~
   fs/f2fs/f2fs.h:5092:36: note: uninitialized use occurs here
    5092 |                         f2fs_handle_critical_error(sbi, stop_reason);
         |                                                         ^~~~~~~~~~~
   fs/f2fs/f2fs.h:5077:4: note: variable 'stop_reason' is declared here
    5077 |                         enum stop_cp_reason stop_reason;
         |                         ^
   1 warning generated.


vim +/stop_reason +5089 fs/f2fs/f2fs.h

  5066	
  5067	static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi,
  5068					struct folio *folio, enum page_type type)
  5069	{
  5070		pgoff_t ofs = folio->index;
  5071	
  5072		if (unlikely(f2fs_cp_error(sbi)))
  5073			return;
  5074	
  5075		if (ofs == sbi->page_eio_ofs[type]) {
  5076			if (sbi->page_eio_cnt[type]++ == MAX_RETRY_PAGE_EIO) {
  5077				enum stop_cp_reason stop_reason;
  5078	
  5079				switch (type) {
  5080				case META:
  5081					stop_reason = STOP_CP_REASON_READ_META;
  5082					break;
  5083				case NODE:
  5084					stop_reason = STOP_CP_REASON_READ_NODE;
  5085					break;
  5086				case DATA:
  5087					stop_reason = STOP_CP_REASON_READ_DATA;
  5088					break;
> 5089				default:
  5090					f2fs_bug_on(sbi, 1);
  5091				}
  5092				f2fs_handle_critical_error(sbi, stop_reason);
  5093			}
  5094		} else {
  5095			sbi->page_eio_ofs[type] = ofs;
  5096			sbi->page_eio_cnt[type] = 0;
  5097		}
  5098	}
  5099	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

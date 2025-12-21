Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975A625C80E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 21:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766353451; cv=none; b=Dj8vZ8Zir/owfr/mCFKm3EQPrmIPXi/w7vlW2gcRw6eFpmMOg4rzKL7knx9Abpat4EDduxUVEOsZ2IIFau52E6QAGFZcNSP5Fh7LGvXmpOtgfugDUTCO6QXWX2XkUZobXbuSM4jLs6ov/C3awqhM3PN2ZjA+vwUk4gwmcbAdx/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766353451; c=relaxed/simple;
	bh=Binz2oepswkxQkSuwzWfCDGlIcR1fxMSZD2zdeulOKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BH0H5l6zNK1GopHB1ytB/hiNNnUvI62NZuX1Oj3AwO9wWIwMnib5ZThSFjNhnMydnN7xJjeC6DhM+6ZuRW2cL9GZvXKEmyEbgcuCazi4f+W/7OkhQky7DG9Fi5I9CD/4HwqVnfx+pn2KKdpfSrwlukGs/PRHJGxXSHBPBZsWXdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGQOrpTA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGQOrpTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766353450; x=1797889450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Binz2oepswkxQkSuwzWfCDGlIcR1fxMSZD2zdeulOKM=;
  b=QGQOrpTA/PX+sTiCcie2UgjvkM+lOd1NYKVAErYbK19b573APlgNySEA
   NWetI2V+fNSbV2rQotGIGurRbwLuv1fH531WMNZnvFK/kFWvDm2dUAb+s
   e9ODwl4QjUSrRMzpoa4uH08a+z90DEN2NEWQDlbcxI42wrptXtx0UBL00
   UcUTIL8wmEwRfZeAG0T4gQ8hHLu4dS7ogXqRFDOQr7jWaA3CgeE9VbdRU
   mNPPlNylV05eNeQDSAXPqGORyyErZnDTDFFznmgzFXZYTm8zey4z2FflW
   oz48MNysbzvip4h2KV17Qc6+8U5ZdxCpNXRnLxuhBnMslep2BABd9PIqX
   Q==;
X-CSE-ConnectionGUID: gI7kLdDARUWoXoz0n0u4eg==
X-CSE-MsgGUID: VamyfXzlQsOLYi/ZpxyHBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78540344"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78540344"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 13:44:09 -0800
X-CSE-ConnectionGUID: JI56aCYcTZm9JOO2lzmUng==
X-CSE-MsgGUID: tY44O6M9T+mrR69BIqrDDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="204308187"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 21 Dec 2025 13:44:08 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXRDi-000000005FY-1im3;
	Sun, 21 Dec 2025 21:44:06 +0000
Date: Sun, 21 Dec 2025 22:43:16 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 5/5] fs/f2fs/file.c:41:12: warning:
 no previous prototype for 'f2fs_filemap_fault'
Message-ID: <202512212253.HTasVESV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   54e1389bda8399711722cd321abe212a2327e9a3
commit: 5c1d7ef6718a61393212b8f7971d146d6e1c8e8f [5/5] ANDROID: 16K: Handle pgoff > file_size for shmem and file backed VMAs
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251221/202512212253.HTasVESV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212253.HTasVESV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212253.HTasVESV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/file.c:28:
   fs/f2fs/f2fs.h: In function 'f2fs_down_read':
   fs/f2fs/f2fs.h:2216:47: error: 'struct f2fs_rwsem' has no member named 'read_waiters'
    2216 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                               ^~
   fs/f2fs/file.c: At top level:
>> fs/f2fs/file.c:41:12: warning: no previous prototype for 'f2fs_filemap_fault' [-Wmissing-prototypes]
      41 | vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
         |            ^~~~~~~~~~~~~~~~~~


vim +/f2fs_filemap_fault +41 fs/f2fs/file.c

    27	
  > 28	#include "f2fs.h"
    29	#include "node.h"
    30	#include "segment.h"
    31	#include "xattr.h"
    32	#include "acl.h"
    33	#include "gc.h"
    34	#include "iostat.h"
    35	#include <trace/events/f2fs.h>
    36	#include <uapi/linux/f2fs.h>
    37	
    38	#undef CREATE_TRACE_POINTS
    39	#include <trace/hooks/fs.h>
    40	
  > 41	vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
    42	{
    43		struct inode *inode = file_inode(vmf->vma->vm_file);
    44		vm_flags_t flags = vmf->vma->vm_flags;
    45		vm_fault_t ret;
    46	
    47		ret = filemap_fault(vmf);
    48		if (ret & VM_FAULT_LOCKED)
    49			f2fs_update_iostat(F2FS_I_SB(inode), inode,
    50						APP_MAPPED_READ_IO, F2FS_BLKSIZE);
    51	
    52		trace_f2fs_filemap_fault(inode, vmf->pgoff, flags, ret);
    53	
    54		return ret;
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

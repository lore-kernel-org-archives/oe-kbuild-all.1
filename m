Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0078321883F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 15:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734707441; cv=none; b=mOFnTEh2hRwAhe++J9PTuikZYAxMOpppHGeplqi16ZkLq8AGYitg8qdvfwLthQBmSCaQqYIb/gLmnC+jKr/aZmGaWsGlN/yhW93fchL47zey3oCrbUf97F8x/UAAVkh4RFolkrZkHysnlwcg11KvohkBhNWkuqY9g77BCNj0/KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734707441; c=relaxed/simple;
	bh=TZ42FgXfxRUPdMVqYHO+5Rk2wizCUxSEOkwaRV3RkkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fM9CpxldmtuTcSL7juCaVrP7B49PgMzg0Lc5QTyYxg+NuVw7AleYTcttpDhAWExwGPuObh55Ra2ETxGMkfHhCSb7uJMzCMEZM7MKEQlBOPoiKFhWWXJdVAo90xdMKwbslyUVmG+DCkc2VfR/iCCZ9Qloh6cV0s+K0OktoKh7YtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CS9fwfG0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CS9fwfG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734707439; x=1766243439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TZ42FgXfxRUPdMVqYHO+5Rk2wizCUxSEOkwaRV3RkkM=;
  b=CS9fwfG0ls06dVTKmW0s2M4yw+mHZ98HfpxW1wverMNXoTpyoUKYRswZ
   /M18p/vxP0tsP/7jtRHg6O+r1G+8l/RhSpA+fAzMoiJ3TRybSI2AquQUm
   9oOM+BUiq6fYb7Uh+CW9mSjydwf0u6gGaedGolgIpdt5+3OxlZm5QxExG
   a44XLdfhp0oJEvLB5v+KqYlgA8mIEjsMeEhwirSrFX3i/xet29cNHWaYi
   +eSxnuDLhvlRaoxutBC1eBlOocPbYOiTqdq32STz+ODwlWj11oTYoj1IB
   WxAbyRtWGm/DQZkTzVufToOOt0tPz0Y15G1ii/VmjNxHkJd4sH11C4TO7
   g==;
X-CSE-ConnectionGUID: lVONqi52S1C4WT2mSCRpxw==
X-CSE-MsgGUID: 0E0ojOPCQXmCF93NWo/19g==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34540329"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="34540329"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 07:10:38 -0800
X-CSE-ConnectionGUID: fzdnPqr8Q1ab30Oc2AOxwQ==
X-CSE-MsgGUID: nWPG5a1nTP+KM7fQFFOSgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="129347295"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Dec 2024 07:10:37 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOeeA-0001Ir-2G;
	Fri, 20 Dec 2024 15:10:34 +0000
Date: Fri, 20 Dec 2024 23:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1334/1334] fs/ext4/inode.o: warning:
 objtool: ext4_map_blocks()+0x9ea: unreachable instruction
Message-ID: <202412202311.0ETgmhXR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   02951ceaa6d546dfa0f741f52f6d47e0fb0ac7b4
commit: 5d5f0e49572a1948fa42fd082aaa8238757614bd [1334/1334] ext4: Check journal inode extents more carefully
config: x86_64-randconfig-102-20241218 (https://download.01.org/0day-ci/archive/20241220/202412202311.0ETgmhXR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202311.0ETgmhXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202311.0ETgmhXR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/ext4/inode.c:25:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> fs/ext4/inode.o: warning: objtool: ext4_map_blocks()+0x9ea: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

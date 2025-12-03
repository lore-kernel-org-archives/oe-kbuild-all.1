Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCE32DF147
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 22:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764799372; cv=none; b=XpvSFSv6U8hr/WX/QE75ruZhBVUoMyO+GFB3dGn7s13YWNEVXX+w6f0nVvj8OJlxSjSq/rfQMr56uv5/baPyk+nD5G/JTvHKaez+pQ85Lejk5Tuq/FltPpS1QBAFPnuaY2v5kmwsvf4s9gKwAMvvhJ7nRJljgbqiGjA4HIVMhww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764799372; c=relaxed/simple;
	bh=akbpkqUunDR2bW1tKQLF5s9MY5KKKFj78wDO98/9ec0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qr1A9nYLg1NROdzCok039Xo2PjB9gmGpx5jgBYRBrPEXEPgrjwG+2BD5tKovRcjzog0bwhd/e8NSuNEOlQgyTSfdb7bFnEQqMvgMDr47PeeXwhxo1LAxssQAUkkEOxoR3PBh8mgtCIlZAvN35h4BBLqM2tgLg4VQ96WierzwmWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0epfgyO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0epfgyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764799369; x=1796335369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=akbpkqUunDR2bW1tKQLF5s9MY5KKKFj78wDO98/9ec0=;
  b=n0epfgyOzp3qqME1d1FUJ/FmKdCu/D2df8QTqZXx4zf0wc8LWseRQ+fi
   N3oQceT1nOvVO5twoSdO0xgKXZXB/i5WC318O1cAF9dz8MYHI470ltinc
   FycXktKmFbOyQqcNePUtMASCv7w/zXqSARLBwY3nPOYj7EhqcdbIwgydS
   aXiaqYlakAHn+XkmTD+Rc2cUqqOqGof/WZuwTJ3gx6QyomVqMawMzlIDD
   /XsTj5sxeGE0bjeqlC8XENolVFBixyAYxCyA97vSqlLP5SCupzyutqDrF
   tU8DrCbZZxtV0MXklv9TVUDzWQZc3/nPacw5uEgzqKwPDhjHQruaYYb3w
   Q==;
X-CSE-ConnectionGUID: 2netr7crT5SG8Bfka9jKpQ==
X-CSE-MsgGUID: oLezuGQMTg+3dM6I7lr+9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66701739"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="66701739"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 14:02:39 -0800
X-CSE-ConnectionGUID: D2ieUZHSR2KQzV/D2CdvaA==
X-CSE-MsgGUID: BuDATEfUQ9WBwT1cgEEZqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="194090039"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 03 Dec 2025 14:02:37 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQuvh-000000000Yt-2qZ6;
	Wed, 03 Dec 2025 22:02:33 +0000
Date: Wed, 3 Dec 2025 23:02:28 +0100
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>
Subject: iommufd_utils.h:804:37: warning: array subscript 'struct
 iommu_test_hw_info[0]' is partly outside array bounds of 'struct
 iommu_test_hw_info_buffer_smaller[1]'
Message-ID: <202512032344.kaAcKFIM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 6d9500bb1ff8c7f9c3ce199521c41aa41e8fd994 iommufd/selftest: Add coverage for reporting max_pasid_log2 via IOMMU_HW_INFO
date:   8 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251203/202512032344.kaAcKFIM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512032344.kaAcKFIM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512032344.kaAcKFIM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from iommufd_utils.h:11,
                    from iommufd.c:12:
   In function '_test_cmd_get_hw_info',
       inlined from 'iommufd_ioas_get_hw_info' at iommufd.c:779:3,
       inlined from 'wrapper_iommufd_ioas_get_hw_info' at iommufd.c:752:1:
>> iommufd_utils.h:804:37: warning: array subscript 'struct iommu_test_hw_info[0]' is partly outside array bounds of 'struct iommu_test_hw_info_buffer_smaller[1]' [-Warray-bounds=]
     804 |                         assert(!info->flags);
         |                                 ~~~~^~~~~~~
   iommufd.c: In function 'wrapper_iommufd_ioas_get_hw_info':
   iommufd.c:761:11: note: object 'buffer_smaller' of size 4
     761 |         } buffer_smaller;
         |           ^~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

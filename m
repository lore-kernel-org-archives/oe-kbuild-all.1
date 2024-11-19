Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812F311CA0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 00:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731976968; cv=none; b=td9Dimf/s92EF+xmLEyivYcoJ2lmQcfYGI3fIV8RXHFvP7ExBX26tSQ1CJiLT4OS4H1XB4IfENj99a8zPVtxQpx2KE41P46BnT+rmPfiZCBCu4uVPmhvf8V2/xr0giOugxsc1/SLYKkifibWJyiHpTGNRgrHoD95d1Q5n8AGwkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731976968; c=relaxed/simple;
	bh=pbFJF6MNLHo5IAt7/ArJ5bmzsNPp8KVG6YUCdyp+fnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tJyZ4tbtnklgnazOdS8E6HG++P8TmgdXMQ0VJToAnJLXbFiwoOzzdnHakwTgQXFjdptLl77rXyIzoBhl3m9HK3Bgnv3cuQcKoUqqwNJWn7yaw6XPq71MO4mAC6ysupEiBPh4mlFV9oMMySqciqd0f3CAs1OrPyJraTVLCU2YDiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vx2rQVlS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vx2rQVlS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731976967; x=1763512967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pbFJF6MNLHo5IAt7/ArJ5bmzsNPp8KVG6YUCdyp+fnA=;
  b=Vx2rQVlSzeCOOQ8p2ea31HQcCySLXlZ22dvUcfU5SDvoyDVpAHNopHOG
   z4DOygkezjSz8V+bjwUj9MpM1lvZbnwYcWZO1AunE5LexE0mQ5euN8J+P
   EMa2CtWk1sf2YFhzWDawtzMpBLXndzrZl3rsjGbkBiXxEc7b8Y0OaUKHZ
   daAS8eHuk0c0amC3Kubl4xxNhxGFT04BK6lIoq8LQ65XonR/F85winmTv
   5uUWuLYb9KqHV9OLauTubnxsoroBPlnaaVAB1CQmJIVCYJN8scEKok1/s
   lbJYKU8K97RB2oTpwE/AoZ7Ga7kvDwd/AojyT4ibKUHRKCgDTd5os/7ST
   w==;
X-CSE-ConnectionGUID: iCZXs2hwSZW3xcpP5mJPDA==
X-CSE-MsgGUID: CQyZPZadTiO/YP/v9CWudw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42588034"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="42588034"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 16:42:46 -0800
X-CSE-ConnectionGUID: lQ3VRm7uRVumYlqAl7qCNg==
X-CSE-MsgGUID: 4b9Bf5GcTyqKkgE5edm+RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="112698696"
Received: from lkp-server01.sh.intel.com (HELO 64fdafcea91b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Nov 2024 16:42:45 -0800
Received: from kbuild by 64fdafcea91b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDCKA-00002N-0I;
	Tue, 19 Nov 2024 00:42:34 +0000
Date: Tue, 19 Nov 2024 08:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1298/1298] fs/ext4/inode.o: warning:
 objtool: ext4_map_blocks()+0x9ea: unreachable instruction
Message-ID: <202411190810.m9d4nNAz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0a813b20347c3788a30544ad2cec470b11cc197d
commit: 5d5f0e49572a1948fa42fd082aaa8238757614bd [1298/1298] ext4: Check journal inode extents more carefully
config: x86_64-randconfig-015-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190810.m9d4nNAz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190810.m9d4nNAz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190810.m9d4nNAz-lkp@intel.com/

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

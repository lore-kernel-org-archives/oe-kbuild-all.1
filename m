Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DBF1534E6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712185039; cv=none; b=ka3v6ZYBaX7CFknhp9gTemaKVf+Ujx6xW+Seg4K6dgUw9RaVU9B1Ui2mvejzF+/cjxRVGo5mhGYNx5DW1aLTy/SztxaHVzVPXP3D60JymtITpfJiObnoNDDzrB/GMUHsQklesgR6B0bRN1qImJCtLu7Ppw+u22Jw1UiwFIMcqCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712185039; c=relaxed/simple;
	bh=k43/AQGBFLFx19/n+o/B3rFKWoNx3ZT8HnHbkjWNRqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TX7tg9YZGEC5dw62rrJJR6EOou3m2D0QLUHfoO7MtovQJ7d3ar2UkyAg6U2KERPwqjwnChWqgmODCueVDcQbfQsNh8OuNqstYsXgrbUgER4phEOGD/910DdVisQ5/xzT83A7Uo/ttNSlQ23aQcU28ZzNU+lc3/aWC+K5g8KTqBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aq0+fsj1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aq0+fsj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712185038; x=1743721038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k43/AQGBFLFx19/n+o/B3rFKWoNx3ZT8HnHbkjWNRqQ=;
  b=aq0+fsj1tm7s/1hB3RfIv6NP4vGbtsaBZ5UoyUEC7h6hf52kDkMlHpFZ
   B/ULB8J+XZ4E2rORt+QQAuLJQYetvd9lxkU4FYAq2F2nFKB9YKOlubEFh
   6oKMossfS91V87Jzpo+cM0oX3PuxaNZq8jN3/JAkz4vSlesSO5+dAnRT9
   AsAiXUXFDLuBWT3INZJbkOEDHzJ3TAueouwO7b0VLrrM9OfKIoDCw9nNc
   aXQOu5J2t7QI71bLqeT+EFrtlmRDUwiCoWrBjEONjRsA2+CsJLwAyuXu0
   PmNxE1kev/c4zaN1T+HAqYndoLXcDqyfv4VdTt9gzhFJZJxQ2lAa8v7df
   Q==;
X-CSE-ConnectionGUID: rF9QYwlLQPqiZVnvCTNPdw==
X-CSE-MsgGUID: 70/qy5OOStSXyKEC27ZXww==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7314412"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7314412"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 15:57:17 -0700
X-CSE-ConnectionGUID: o4qFXwN5Q62oU9eshiuQ4A==
X-CSE-MsgGUID: zHNrBZmRQr6clb0sbUO1og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="41758365"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2024 15:57:16 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs9Xd-0000Kv-2C;
	Wed, 03 Apr 2024 22:57:13 +0000
Date: Thu, 4 Apr 2024 06:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 9/12] fs/tracefs/inode.c:56:16: error: implicit
 declaration of function 'iov_iter_count'
Message-ID: <202404040602.6i2z4YlT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8b68c0bba37e427ceb23ae39861ba6816fdec1f9
commit: bb285b16cf180b4178bb9a45a8ffbf1ca5d9a701 [9/12] fs: convert remaining users of ->read and ->write to iterator variants
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240404/202404040602.6i2z4YlT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040602.6i2z4YlT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040602.6i2z4YlT-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/tracefs/inode.c: In function 'default_write_file_iter':
>> fs/tracefs/inode.c:56:16: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
      56 |         return iov_iter_count(from);
         |                ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/iov_iter_count +56 fs/tracefs/inode.c

    53	
    54	static ssize_t default_write_file_iter(struct kiocb *iocb, struct iov_iter *from)
    55	{
  > 56		return iov_iter_count(from);
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

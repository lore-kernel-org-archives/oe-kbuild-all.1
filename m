Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0D1634
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 01:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691630454; x=1723166454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5jHH1Ptw3Mz53E7TNWsbxztoigekS/sYiZRJ6z71Y3Y=;
  b=S5gmCjSe7NVLE/MLdMsR4eW2HKiQsLu05qReSV9d3z84I10b5v5XMWTN
   Du/adJLDnU1j6dfswCph28KxH8CE7oVI9aFNSE8ibfPi/Nc6XUrIE0FCT
   ODpMGX5y52V/1Yy/oAes3cg5QHJQFx43kOBUvgUr3l4zxuvs7Xb8xZ0/Z
   5ThYV6VbejA1EjDZFq63pJlsj1/EZBPXLzmV1FaoRre+Rt62akajidaZ7
   5IQGOSSF06G7BKHZn8v3YuF734q8eIeXqMYmfrtyZ/dwJOixmtp0YbVj0
   cWQa6yupj+IC3S3LSkd0ULtUDjs+IVJEWiKAAXR0gyl/gFI/2omlv06Df
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="361403041"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="361403041"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 18:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="875491306"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2023 18:20:55 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTuM7-0006a2-25;
	Thu, 10 Aug 2023 01:20:51 +0000
Date: Thu, 10 Aug 2023 09:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Ming Lei <ming.lei@redhat.com>
Subject: [axboe-block:for-6.6/block 36/41] drivers/block/ublk_drv.c:445:16:
 warning: unsigned conversion from 'int' to 'blk_status_t' {aka 'unsigned
 char'} changes value from '-223' to '33'
Message-ID: <202308100945.f4QvM4UT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.6/block
head:   0ece1d649b6dd615925a72bc1824d6b9fa5b998a
commit: 29802d7ca33bc0a75c9da2a143eeed4f9e99fca4 [36/41] ublk: enable zoned storage support
config: parisc-randconfig-r035-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100945.f4QvM4UT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100945.f4QvM4UT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100945.f4QvM4UT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/ublk_drv.c: In function 'ublk_setup_iod_zoned':
>> drivers/block/ublk_drv.c:445:16: warning: unsigned conversion from 'int' to 'blk_status_t' {aka 'unsigned char'} changes value from '-223' to '33' [-Woverflow]
     445 |         return -EOPNOTSUPP;
         |                ^


vim +445 drivers/block/ublk_drv.c

   441	
   442	static blk_status_t ublk_setup_iod_zoned(struct ublk_queue *ubq,
   443						 struct request *req)
   444	{
 > 445		return -EOPNOTSUPP;
   446	}
   447	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

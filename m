Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D665690
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 09:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzIoNFtz"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696497445; x=1728033445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r6v4RpgPM/Y1p+6W3plmXO8YwUK3wJb0g/dQfpxNLYY=;
  b=YzIoNFtzIHlcr+9Mo077XgmeBGg0KAvNSnKwfXRmzStbaMgtvzxAB62o
   kF0QS86BXJmOLvLxkp0cLbql1Yxigbrk4COFZ6GJj7c87cagS3mObLPQo
   KufOtrKd30aaUu79ddsYEoEf1afBTQjy8+OPLc/5u5G93IOR8TtOhwZI6
   hL8Al+ZnD3R2l2LMP5RYvUjJ1mMm5+KF4SZucTCMn3wRmpmsO+4t8T4Nb
   tl1W61yWPSfbZaNJI2F4VxXbjpHrpxwd9XcVxc0f5ESlTnE0bZmlvJ9nZ
   kX0v2fmko2eZyATysyehPVsWmSqzesWM0Vi8YCi9sXDZ4nJCb+yIOnLuf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383353958"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="383353958"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="875498859"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="875498859"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Oct 2023 02:17:23 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoKTv-000LEi-0p;
	Thu, 05 Oct 2023 09:17:19 +0000
Date: Thu, 5 Oct 2023 17:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:xfs-atomic-write-v1 20/21]
 drivers/scsi/scsi_debug.c:4874: undefined reference to `__umoddi3'
Message-ID: <202310051746.4AYc542i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux xfs-atomic-write-v1
head:   6e46c5eac75533f8ca2e7446bddedc9560a032fc
commit: f1dbf32f10c097c2a0be71ca6c30d8884aaa64d8 [20/21] scsi: scsi_debug: Atomic write support
config: i386-randconfig-001-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051746.4AYc542i-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051746.4AYc542i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051746.4AYc542i-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_iomap.o: in function `xfs_direct_write_iomap_begin':
   fs/xfs/xfs_iomap.c:828: undefined reference to `__moddi3'
   ld: fs/xfs/xfs_iomap.c:829: undefined reference to `__moddi3'
   ld: fs/xfs/xfs_iomap.c:847: undefined reference to `__umoddi3'
   ld: block/fops.o: in function `blkdev_atomic_write_valid':
   block/fops.c:54: undefined reference to `__moddi3'
   ld: block/fops.c:62: undefined reference to `__moddi3'
   ld: block/blk-merge.o: in function `bio_straddles_atomic_write_boundary':
   block/blk-merge.c:27: undefined reference to `__moddi3'
   ld: block/blk-merge.c:28: undefined reference to `__moddi3'
   ld: block/blk-merge.c:27: undefined reference to `__moddi3'
   ld: block/blk-merge.o:block/blk-merge.c:28: more undefined references to `__moddi3' follow
   ld: drivers/scsi/scsi_debug.o: in function `resp_atomic_write':
>> drivers/scsi/scsi_debug.c:4874: undefined reference to `__umoddi3'


vim +4874 drivers/scsi/scsi_debug.c

  4853	
  4854	static int resp_atomic_write(struct scsi_cmnd *scp,
  4855				     struct sdebug_dev_info *devip)
  4856	{
  4857		struct sdeb_store_info *sip;
  4858		u8 *cmd = scp->cmnd;
  4859		u16 boundary, len;
  4860		u64 lba;
  4861		int ret;
  4862	
  4863		if (!scsi_debug_atomic_write()) {
  4864			mk_sense_invalid_opcode(scp);
  4865			return check_condition_result;
  4866		}
  4867	
  4868		sip = devip2sip(devip, true);
  4869	
  4870		lba = get_unaligned_be64(cmd + 2);
  4871		boundary = get_unaligned_be16(cmd + 10);
  4872		len = get_unaligned_be16(cmd + 12);
  4873	
> 4874		if (sdebug_atomic_alignment_blks && lba % sdebug_atomic_alignment_blks) {
  4875			/* Does not meet alignment requirement */
  4876			mk_sense_buffer(scp, ILLEGAL_REQUEST, INVALID_FIELD_IN_CDB, 0);
  4877			return check_condition_result;
  4878		}
  4879	
  4880		if (sdebug_atomic_granularity_blks && len % sdebug_atomic_granularity_blks) {
  4881			/* Does not meet alignment requirement */
  4882			mk_sense_buffer(scp, ILLEGAL_REQUEST, INVALID_FIELD_IN_CDB, 0);
  4883			return check_condition_result;
  4884		}
  4885	
  4886		if (boundary > 0) {
  4887			if (boundary > sdebug_atomic_max_boundary_blks) {
  4888				mk_sense_invalid_fld(scp, SDEB_IN_CDB, 12, -1);
  4889				return check_condition_result;
  4890			}
  4891	
  4892			if (len > sdebug_atomic_max_size_with_boundary_blks) {
  4893				mk_sense_invalid_fld(scp, SDEB_IN_CDB, 12, -1);
  4894				return check_condition_result;
  4895			}
  4896		} else {
  4897			if (len > sdebug_atomic_max_size_blks) {
  4898				mk_sense_invalid_fld(scp, SDEB_IN_CDB, 12, -1);
  4899				return check_condition_result;
  4900			}
  4901		}
  4902	
  4903		ret = do_device_access(sip, scp, 0, lba, len, true, true);
  4904		if (unlikely(ret == -1))
  4905			return DID_ERROR << 16;
  4906		if (unlikely(ret != len * sdebug_sector_size))
  4907			return DID_ERROR << 16;
  4908		return 0;
  4909	}
  4910	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

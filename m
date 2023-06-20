Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891102AB25
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 16:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687279650; x=1718815650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5QZ3s914oi4ucxaLZ9r1COy3ZWKW6pIPXwuFz0lqUtE=;
  b=WoZsqk5KV3ZaQ2DrofPrHd4yr32f3kvdfPXhGPP5VruQqwc1Md6GhIAd
   xw/uqepfQejZlp8u3cze+uME5cZLC4cDeFfqChL1lrEj6KSV1EvWknwdE
   QM7Kl/Fkmo5y2SvhmgwkXOdoiM5jiUeUla4vbcC/XLP7bJEH/hd/7d+uq
   Zj0Bq1LeF7Lu0lu3R4+xCcWCBlQWJYZM0QhULnGEtG5S1KXJXQRbR2s2p
   eOPDi+Tx/KKf5m56GWk96TYNcpEq4SJS5og3DSN0fUXdwHKxMGiM85XN3
   FMLbcQ+UZ1Vlb7Q7XEGyD6ktuly6VpOzb7IDVTkIx+s8IuDdicQUAEK/L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="357409266"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="357409266"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 09:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="1044355415"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="1044355415"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jun 2023 09:47:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBeVr-000644-1E;
	Tue, 20 Jun 2023 16:47:27 +0000
Date: Wed, 21 Jun 2023 00:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [stable:linux-5.4.y 294/9999] drivers/ata/libata-scsi.c:2406:51:
 error: 'SECTOR_SHIFT' undeclared; did you mean 'SOFTIRQ_SHIFT'?
Message-ID: <202306210040.PDqtOSpO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   61a2f83e4762ee0c766f86944e612305f5888bcb
commit: f7880745e91b77633da7f4428edf0ea3e50c4f4b [294/9999] libata: implement ATA_HORKAGE_MAX_TRIM_128M and apply to Sandisks
config: powerpc-randconfig-r023-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210040.PDqtOSpO-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210040.PDqtOSpO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210040.PDqtOSpO-lkp@intel.com/

All errors (new ones prefixed by >>):

     123 | typedef blk_status_t (queue_rq_fn)(struct blk_mq_hw_ctx *,
         |         ^~~~~~~~~~~~
   include/linux/blk_types.h:78:48: error: type defaults to 'int' in declaration of 'error' [-Werror=implicit-int]
      78 | static inline bool blk_path_error(blk_status_t error)
         |                                                ^~~~~
   include/linux/blk_types.h: In function 'blk_path_error':
   include/linux/blk_types.h:81:9: error: type defaults to 'int' in type name [-Werror=implicit-int]
      81 |         case BLK_STS_NOTSUPP:
         |         ^~~~
   include/linux/blk_types.h:82:9: error: type defaults to 'int' in type name [-Werror=implicit-int]
      82 |         case BLK_STS_NOSPC:
         |         ^~~~
   include/linux/blk_types.h:83:9: error: type defaults to 'int' in type name [-Werror=implicit-int]
      83 |         case BLK_STS_TARGET:
         |         ^~~~
   include/linux/blk_types.h:84:9: error: type defaults to 'int' in type name [-Werror=implicit-int]
      84 |         case BLK_STS_NEXUS:
         |         ^~~~
   include/linux/blk_types.h:85:9: error: type defaults to 'int' in type name [-Werror=implicit-int]
      85 |         case BLK_STS_MEDIUM:
         |         ^~~~
   include/linux/blk_types.h:86:9: error: type defaults to 'int' in type name [-Werror=implicit-int]
      86 |         case BLK_STS_PROTECTION:
         |         ^~~~
   include/linux/blk_types.h: At top level:
   include/linux/blk_types.h:154:33: error: type defaults to 'int' in declaration of 'bi_status' [-Werror=implicit-int]
     154 |         blk_status_t            bi_status;
         |                                 ^~~~~~~~~
   drivers/ata/libata-scsi.c: In function 'ata_scsi_qc_new':
   drivers/ata/libata-scsi.c:848:47: error: invalid use of undefined type 'struct request'
     848 |         qc = ata_qc_new_init(dev, cmd->request->tag);
         |                                               ^~
   drivers/ata/libata-scsi.c:856:33: error: invalid use of undefined type 'struct request'
     856 |                 if (cmd->request->rq_flags & RQF_QUIET)
         |                                 ^~
   drivers/ata/libata-scsi.c:856:46: error: 'RQF_QUIET' undeclared (first use in this function); did you mean 'BIO_QUIET'?
     856 |                 if (cmd->request->rq_flags & RQF_QUIET)
         |                                              ^~~~~~~~~
         |                                              BIO_QUIET
   drivers/ata/libata-scsi.c: In function 'ata_qc_set_pc_nbytes':
   drivers/ata/libata-scsi.c:870:39: error: invalid use of undefined type 'struct request'
     870 |         qc->extrabytes = scmd->request->extra_len;
         |                                       ^~
   In file included from include/asm-generic/bug.h:5:
   drivers/ata/libata-scsi.c: In function 'atapi_drain_needed':
   drivers/ata/libata-scsi.c:1240:21: error: implicit declaration of function 'blk_rq_is_passthrough' [-Werror=implicit-function-declaration]
    1240 |         if (likely(!blk_rq_is_passthrough(rq)))
         |                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/ata/libata-scsi.c:1243:14: error: implicit declaration of function 'blk_rq_bytes' [-Werror=implicit-function-declaration]
    1243 |         if (!blk_rq_bytes(rq) || op_is_write(req_op(rq)))
         |              ^~~~~~~~~~~~
   include/linux/blk_types.h:381:15: error: invalid use of undefined type 'struct request'
     381 |         ((req)->cmd_flags & REQ_OP_MASK)
         |               ^~
   drivers/ata/libata-scsi.c:1243:46: note: in expansion of macro 'req_op'
    1243 |         if (!blk_rq_bytes(rq) || op_is_write(req_op(rq)))
         |                                              ^~~~~~
   drivers/ata/libata-scsi.c: In function 'ata_scsi_dev_config':
   drivers/ata/libata-scsi.c:1258:9: error: implicit declaration of function 'blk_queue_max_hw_sectors' [-Werror=implicit-function-declaration]
    1258 |         blk_queue_max_hw_sectors(q, dev->max_sectors);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-scsi.c:1266:17: error: implicit declaration of function 'blk_queue_update_dma_pad' [-Werror=implicit-function-declaration]
    1266 |                 blk_queue_update_dma_pad(q, ATA_DMA_PAD_SZ - 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-scsi.c:1269:49: error: invalid use of undefined type 'struct request_queue'
    1269 |                 buf = kmalloc(ATAPI_MAX_DRAIN, q->bounce_gfp | GFP_KERNEL);
         |                                                 ^~
   drivers/ata/libata-scsi.c:1275:17: error: implicit declaration of function 'blk_queue_dma_drain' [-Werror=implicit-function-declaration]
    1275 |                 blk_queue_dma_drain(q, atapi_drain_needed, buf, ATAPI_MAX_DRAIN);
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-scsi.c:1293:9: error: implicit declaration of function 'blk_queue_update_dma_alignment' [-Werror=implicit-function-declaration]
    1293 |         blk_queue_update_dma_alignment(q, sdev->sector_size - 1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-scsi.c: In function 'ata_scsi_slave_destroy':
   drivers/ata/libata-scsi.c:1373:16: error: invalid use of undefined type 'struct request_queue'
    1373 |         kfree(q->dma_drain_buffer);
         |                ^~
   drivers/ata/libata-scsi.c:1374:10: error: invalid use of undefined type 'struct request_queue'
    1374 |         q->dma_drain_buffer = NULL;
         |          ^~
   drivers/ata/libata-scsi.c:1375:10: error: invalid use of undefined type 'struct request_queue'
    1375 |         q->dma_drain_size = 0;
         |          ^~
   In file included from include/linux/fs.h:39,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:587,
                    from include/linux/scatterlist.h:8,
                    from include/scsi/scsi.h:10,
                    from drivers/ata/libata-scsi.c:25:
   drivers/ata/libata-scsi.c: In function 'ata_scsi_rw_xlat':
   drivers/ata/libata-scsi.c:1827:39: error: implicit declaration of function 'req_get_ioprio' [-Werror=implicit-function-declaration]
    1827 |         int class = IOPRIO_PRIO_CLASS(req_get_ioprio(rq));
         |                                       ^~~~~~~~~~~~~~
   include/linux/ioprio.h:15:35: note: in definition of macro 'IOPRIO_PRIO_CLASS'
      15 | #define IOPRIO_PRIO_CLASS(mask) ((mask) >> IOPRIO_CLASS_SHIFT)
         |                                   ^~~~
   drivers/ata/libata-scsi.c: In function 'ata_scsiop_inq_b0':
>> drivers/ata/libata-scsi.c:2406:51: error: 'SECTOR_SHIFT' undeclared (first use in this function); did you mean 'SOFTIRQ_SHIFT'?
    2406 |                         max_blocks = 128 << (20 - SECTOR_SHIFT);
         |                                                   ^~~~~~~~~~~~
         |                                                   SOFTIRQ_SHIFT
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ATA
   Depends on [n]: HAS_IOMEM [=y] && BLOCK [=n]
   Selected by [y]:
   - AKEBONO [=y] && PPC_47x [=y]


vim +2406 drivers/ata/libata-scsi.c

  2374	
  2375	static unsigned int ata_scsiop_inq_b0(struct ata_scsi_args *args, u8 *rbuf)
  2376	{
  2377		struct ata_device *dev = args->dev;
  2378		u16 min_io_sectors;
  2379	
  2380		rbuf[1] = 0xb0;
  2381		rbuf[3] = 0x3c;		/* required VPD size with unmap support */
  2382	
  2383		/*
  2384		 * Optimal transfer length granularity.
  2385		 *
  2386		 * This is always one physical block, but for disks with a smaller
  2387		 * logical than physical sector size we need to figure out what the
  2388		 * latter is.
  2389		 */
  2390		min_io_sectors = 1 << ata_id_log2_per_physical_sector(args->id);
  2391		put_unaligned_be16(min_io_sectors, &rbuf[6]);
  2392	
  2393		/*
  2394		 * Optimal unmap granularity.
  2395		 *
  2396		 * The ATA spec doesn't even know about a granularity or alignment
  2397		 * for the TRIM command.  We can leave away most of the unmap related
  2398		 * VPD page entries, but we have specifify a granularity to signal
  2399		 * that we support some form of unmap - in thise case via WRITE SAME
  2400		 * with the unmap bit set.
  2401		 */
  2402		if (ata_id_has_trim(args->id)) {
  2403			u64 max_blocks = 65535 * ATA_MAX_TRIM_RNUM;
  2404	
  2405			if (dev->horkage & ATA_HORKAGE_MAX_TRIM_128M)
> 2406				max_blocks = 128 << (20 - SECTOR_SHIFT);
  2407	
  2408			put_unaligned_be64(max_blocks, &rbuf[36]);
  2409			put_unaligned_be32(1, &rbuf[28]);
  2410		}
  2411	
  2412		return 0;
  2413	}
  2414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

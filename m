Content-Type: multipart/mixed; boundary="===============6905880472697635386=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-stable-rc:linux-5.4.y 1581/2438] drivers/ata/libata-scsi.c:2406:30: error: 'SECTOR_SHIFT' undeclared; did you mean
Date: Sat, 24 Oct 2020 03:18:01 +0800
Message-ID: <202010240354.nHtDRrLN-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6905880472697635386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.4.y
head:   5d35a1803455f87d7209e825d761855f892fc6ff
commit: f7880745e91b77633da7f4428edf0ea3e50c4f4b [1581/2438] libata: implem=
ent ATA_HORKAGE_MAX_TRIM_128M and apply to Sandisks
config: powerpc64-randconfig-r011-20201022 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git/commit/?id=3Df7880745e91b77633da7f4428edf0ea3e50c4f4b
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux=
/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.4.y
        git checkout f7880745e91b77633da7f4428edf0ea3e50c4f4b
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   include/linux/t10-pi.h: In function 't10_pi_ref_tag':
   include/linux/t10-pi.h:42:29: error: implicit declaration of function 'q=
ueue_logical_block_size' [-Werror=3Dimplicit-function-declaration]
      42 |  unsigned int shift =3D ilog2(queue_logical_block_size(rq->q));
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:158:23: note: in definition of macro 'ilog2'
     158 |  __builtin_constant_p(n) ? \
         |                       ^
   In file included from include/scsi/scsi_cmnd.h:7,
                    from drivers/ata/libata-scsi.c:27:
   include/linux/t10-pi.h:48:9: error: implicit declaration of function 'bl=
k_rq_pos' [-Werror=3Dimplicit-function-declaration]
      48 |  return blk_rq_pos(rq) >> (shift - SECTOR_SHIFT) & 0xffffffff;
         |         ^~~~~~~~~~
   include/linux/t10-pi.h:48:36: error: 'SECTOR_SHIFT' undeclared (first us=
e in this function); did you mean 'SOFTIRQ_SHIFT'?
      48 |  return blk_rq_pos(rq) >> (shift - SECTOR_SHIFT) & 0xffffffff;
         |                                    ^~~~~~~~~~~~
         |                                    SOFTIRQ_SHIFT
   In file included from include/scsi/scsi_cmnd.h:12,
                    from drivers/ata/libata-scsi.c:27:
   include/scsi/scsi_device.h: At top level:
   include/scsi/scsi_device.h:435:4: error: unknown type name 'req_flags_t'=
; did you mean 'vm_flags_t'?
     435 |    req_flags_t rq_flags, int *resid);
         |    ^~~~~~~~~~~
         |    vm_flags_t
   include/scsi/scsi_device.h: In function 'scsi_execute_req':
   include/scsi/scsi_device.h:442:2: error: implicit declaration of functio=
n '__scsi_execute'; did you mean 'scsi_execute'? [-Werror=3Dimplicit-functi=
on-declaration]
     442 |  __scsi_execute(sdev, cmd, data_direction, buffer, bufflen, \
         |  ^~~~~~~~~~~~~~
   include/scsi/scsi_device.h:451:9: note: in expansion of macro 'scsi_exec=
ute'
     451 |  return scsi_execute(sdev, cmd, data_direction, buffer,
         |         ^~~~~~~~~~~~
   In file included from drivers/ata/libata-scsi.c:27:
   include/scsi/scsi_cmnd.h: At top level:
   include/scsi/scsi_cmnd.h:168:21: error: 'scsi_init_io' declared as funct=
ion returning a function
     168 | extern blk_status_t scsi_init_io(struct scsi_cmnd *cmd);
         |                     ^~~~~~~~~~~~
   In file included from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:22,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from drivers/ata/libata-scsi.c:35:
   include/linux/blk_types.h:29:22: error: conflicting types for 'blk_statu=
s_t'
      29 | typedef u8 __bitwise blk_status_t;
         |                      ^~~~~~~~~~~~
   In file included from include/scsi/scsi_host.h:11,
                    from drivers/ata/libata-scsi.c:26:
   include/linux/blk-mq.h:123:9: note: previous declaration of 'blk_status_=
t' was here
     123 | typedef blk_status_t (queue_rq_fn)(struct blk_mq_hw_ctx *,
         |         ^~~~~~~~~~~~
   drivers/ata/libata-scsi.c: In function 'ata_scsi_qc_new':
   drivers/ata/libata-scsi.c:856:32: error: 'RQF_QUIET' undeclared (first u=
se in this function); did you mean 'BIO_QUIET'?
     856 |   if (cmd->request->rq_flags & RQF_QUIET)
         |                                ^~~~~~~~~
         |                                BIO_QUIET
   In file included from include/asm-generic/bug.h:5,
                    from arch/powerpc/include/asm/bug.h:120,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/ata/libata-scsi.c:20:
   drivers/ata/libata-scsi.c: In function 'atapi_drain_needed':
   drivers/ata/libata-scsi.c:1240:14: error: implicit declaration of functi=
on 'blk_rq_is_passthrough' [-Werror=3Dimplicit-function-declaration]
    1240 |  if (likely(!blk_rq_is_passthrough(rq)))
         |              ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: in definition of macro 'likely'
      77 | # define likely(x) __builtin_expect(!!(x), 1)
         |                                        ^
   drivers/ata/libata-scsi.c:1243:7: error: implicit declaration of functio=
n 'blk_rq_bytes' [-Werror=3Dimplicit-function-declaration]
    1243 |  if (!blk_rq_bytes(rq) || op_is_write(req_op(rq)))
         |       ^~~~~~~~~~~~
   drivers/ata/libata-scsi.c: In function 'ata_scsi_dev_config':
   drivers/ata/libata-scsi.c:1258:2: error: implicit declaration of functio=
n 'blk_queue_max_hw_sectors' [-Werror=3Dimplicit-function-declaration]
    1258 |  blk_queue_max_hw_sectors(q, dev->max_sectors);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-scsi.c:1266:3: error: implicit declaration of functio=
n 'blk_queue_update_dma_pad' [-Werror=3Dimplicit-function-declaration]
    1266 |   blk_queue_update_dma_pad(q, ATA_DMA_PAD_SZ - 1);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-scsi.c:1269:35: error: dereferencing pointer to incom=
plete type 'struct request_queue'
    1269 |   buf =3D kmalloc(ATAPI_MAX_DRAIN, q->bounce_gfp | GFP_KERNEL);
         |                                   ^~
   drivers/ata/libata-scsi.c:1275:3: error: implicit declaration of functio=
n 'blk_queue_dma_drain' [-Werror=3Dimplicit-function-declaration]
    1275 |   blk_queue_dma_drain(q, atapi_drain_needed, buf, ATAPI_MAX_DRAI=
N);
         |   ^~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-scsi.c:1293:2: error: implicit declaration of functio=
n 'blk_queue_update_dma_alignment' [-Werror=3Dimplicit-function-declaration]
    1293 |  blk_queue_update_dma_alignment(q, sdev->sector_size - 1);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/fs.h:39,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:587,
                    from include/linux/scatterlist.h:8,
                    from include/scsi/scsi.h:10,
                    from drivers/ata/libata-scsi.c:25:
   drivers/ata/libata-scsi.c: In function 'ata_scsi_rw_xlat':
   drivers/ata/libata-scsi.c:1827:32: error: implicit declaration of functi=
on 'req_get_ioprio' [-Werror=3Dimplicit-function-declaration]
    1827 |  int class =3D IOPRIO_PRIO_CLASS(req_get_ioprio(rq));
         |                                ^~~~~~~~~~~~~~
   include/linux/ioprio.h:15:35: note: in definition of macro 'IOPRIO_PRIO_=
CLASS'
      15 | #define IOPRIO_PRIO_CLASS(mask) ((mask) >> IOPRIO_CLASS_SHIFT)
         |                                   ^~~~
   drivers/ata/libata-scsi.c: In function 'ata_scsiop_inq_b0':
>> drivers/ata/libata-scsi.c:2406:30: error: 'SECTOR_SHIFT' undeclared (fir=
st use in this function); did you mean 'SOFTIRQ_SHIFT'?
    2406 |    max_blocks =3D 128 << (20 - SECTOR_SHIFT);
         |                              ^~~~~~~~~~~~
         |                              SOFTIRQ_SHIFT
   cc1: some warnings being treated as errors

vim +2406 drivers/ata/libata-scsi.c

  2374	=

  2375	static unsigned int ata_scsiop_inq_b0(struct ata_scsi_args *args, u8=
 *rbuf)
  2376	{
  2377		struct ata_device *dev =3D args->dev;
  2378		u16 min_io_sectors;
  2379	=

  2380		rbuf[1] =3D 0xb0;
  2381		rbuf[3] =3D 0x3c;		/* required VPD size with unmap support */
  2382	=

  2383		/*
  2384		 * Optimal transfer length granularity.
  2385		 *
  2386		 * This is always one physical block, but for disks with a smaller
  2387		 * logical than physical sector size we need to figure out what the
  2388		 * latter is.
  2389		 */
  2390		min_io_sectors =3D 1 << ata_id_log2_per_physical_sector(args->id);
  2391		put_unaligned_be16(min_io_sectors, &rbuf[6]);
  2392	=

  2393		/*
  2394		 * Optimal unmap granularity.
  2395		 *
  2396		 * The ATA spec doesn't even know about a granularity or alignment
  2397		 * for the TRIM command.  We can leave away most of the unmap relat=
ed
  2398		 * VPD page entries, but we have specifify a granularity to signal
  2399		 * that we support some form of unmap - in thise case via WRITE SAME
  2400		 * with the unmap bit set.
  2401		 */
  2402		if (ata_id_has_trim(args->id)) {
  2403			u64 max_blocks =3D 65535 * ATA_MAX_TRIM_RNUM;
  2404	=

  2405			if (dev->horkage & ATA_HORKAGE_MAX_TRIM_128M)
> 2406				max_blocks =3D 128 << (20 - SECTOR_SHIFT);
  2407	=

  2408			put_unaligned_be64(max_blocks, &rbuf[36]);
  2409			put_unaligned_be32(1, &rbuf[28]);
  2410		}
  2411	=

  2412		return 0;
  2413	}
  2414	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============6905880472697635386==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
+R8ELAhD4QMCAA==
--===============6905880472697635386==--


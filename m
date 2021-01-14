Content-Type: multipart/mixed; boundary="===============1174181545663436260=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-stable-rc:linux-4.19.y 974/2851] drivers/ata/libata-scsi.c:2423:30: error: 'SECTOR_SHIFT' undeclared; did you mean
Date: Thu, 14 Jan 2021 18:46:07 +0800
Message-ID: <202101141855.ZTv66Css-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1174181545663436260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-4.19.y
head:   675cc038067f0e530471c56a7442935f84669d95
commit: a8bb7740aa313994bfa4c21cba399f65985a8a35 [974/2851] libata: impleme=
nt ATA_HORKAGE_MAX_TRIM_128M and apply to Sandisks
config: powerpc64-randconfig-r032-20210113 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git/commit/?id=3Da8bb7740aa313994bfa4c21cba399f65985a8a35
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux=
/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-4.19.y
        git checkout a8bb7740aa313994bfa4c21cba399f65985a8a35
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   include/linux/log2.h:162:23: note: in definition of macro 'ilog2'
     162 |  __builtin_constant_p(n) ? \
         |                       ^
   In file included from include/scsi/scsi_cmnd.h:7,
                    from drivers/ata/libata-scsi.c:43:
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
                    from drivers/ata/libata-scsi.c:43:
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
   In file included from drivers/ata/libata-scsi.c:43:
   include/scsi/scsi_cmnd.h: In function 'scsi_bidi_cmnd':
   include/scsi/scsi_cmnd.h:214:9: error: implicit declaration of function =
'blk_bidi_rq' [-Werror=3Dimplicit-function-declaration]
     214 |  return blk_bidi_rq(cmd->request) &&
         |         ^~~~~~~~~~~
   In file included from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:31,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from drivers/ata/libata-scsi.c:51:
   include/linux/blk_types.h: At top level:
   include/linux/blk_types.h:29:22: error: conflicting types for 'blk_statu=
s_t'
      29 | typedef u8 __bitwise blk_status_t;
         |                      ^~~~~~~~~~~~
   In file included from include/scsi/scsi_host.h:11,
                    from drivers/ata/libata-scsi.c:42:
   include/linux/blk-mq.h:100:9: note: previous declaration of 'blk_status_=
t' was here
     100 | typedef blk_status_t (queue_rq_fn)(struct blk_mq_hw_ctx *,
         |         ^~~~~~~~~~~~
   drivers/ata/libata-scsi.c: In function 'ata_scsi_qc_new':
   drivers/ata/libata-scsi.c:871:32: error: 'RQF_QUIET' undeclared (first u=
se in this function); did you mean 'BIO_QUIET'?
     871 |   if (cmd->request->rq_flags & RQF_QUIET)
         |                                ^~~~~~~~~
         |                                BIO_QUIET
   In file included from include/asm-generic/bug.h:5,
                    from arch/powerpc/include/asm/bug.h:128,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/ata/libata-scsi.c:36:
   drivers/ata/libata-scsi.c: In function 'atapi_drain_needed':
   drivers/ata/libata-scsi.c:1255:14: error: implicit declaration of functi=
on 'blk_rq_is_passthrough' [-Werror=3Dimplicit-function-declaration]
    1255 |  if (likely(!blk_rq_is_passthrough(rq)))
         |              ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:40: note: in definition of macro 'likely'
      76 | # define likely(x) __builtin_expect(!!(x), 1)
         |                                        ^
   drivers/ata/libata-scsi.c:1258:7: error: implicit declaration of functio=
n 'blk_rq_bytes' [-Werror=3Dimplicit-function-declaration]
    1258 |  if (!blk_rq_bytes(rq) || op_is_write(req_op(rq)))
         |       ^~~~~~~~~~~~
   drivers/ata/libata-scsi.c: In function 'ata_scsi_dev_config':
   drivers/ata/libata-scsi.c:1273:2: error: implicit declaration of functio=
n 'blk_queue_max_hw_sectors' [-Werror=3Dimplicit-function-declaration]
    1273 |  blk_queue_max_hw_sectors(q, dev->max_sectors);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-scsi.c:1281:3: error: implicit declaration of functio=
n 'blk_queue_update_dma_pad' [-Werror=3Dimplicit-function-declaration]
    1281 |   blk_queue_update_dma_pad(q, ATA_DMA_PAD_SZ - 1);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-scsi.c:1284:35: error: dereferencing pointer to incom=
plete type 'struct request_queue'
    1284 |   buf =3D kmalloc(ATAPI_MAX_DRAIN, q->bounce_gfp | GFP_KERNEL);
         |                                   ^~
   drivers/ata/libata-scsi.c:1290:3: error: implicit declaration of functio=
n 'blk_queue_dma_drain' [-Werror=3Dimplicit-function-declaration]
    1290 |   blk_queue_dma_drain(q, atapi_drain_needed, buf, ATAPI_MAX_DRAI=
N);
         |   ^~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-scsi.c:1308:2: error: implicit declaration of functio=
n 'blk_queue_update_dma_alignment' [-Werror=3Dimplicit-function-declaration]
    1308 |  blk_queue_update_dma_alignment(q, sdev->sector_size - 1);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-scsi.c:1321:2: error: implicit declaration of functio=
n 'blk_queue_flush_queueable' [-Werror=3Dimplicit-function-declaration]
    1321 |  blk_queue_flush_queueable(q, false);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/fs.h:39,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:499,
                    from include/linux/scatterlist.h:8,
                    from include/scsi/scsi.h:10,
                    from drivers/ata/libata-scsi.c:41:
   drivers/ata/libata-scsi.c: In function 'ata_scsi_rw_xlat':
   drivers/ata/libata-scsi.c:1844:32: error: implicit declaration of functi=
on 'req_get_ioprio' [-Werror=3Dimplicit-function-declaration]
    1844 |  int class =3D IOPRIO_PRIO_CLASS(req_get_ioprio(rq));
         |                                ^~~~~~~~~~~~~~
   include/linux/ioprio.h:15:35: note: in definition of macro 'IOPRIO_PRIO_=
CLASS'
      15 | #define IOPRIO_PRIO_CLASS(mask) ((mask) >> IOPRIO_CLASS_SHIFT)
         |                                   ^~~~
   drivers/ata/libata-scsi.c: In function 'ata_scsiop_inq_b0':
>> drivers/ata/libata-scsi.c:2423:30: error: 'SECTOR_SHIFT' undeclared (fir=
st use in this function); did you mean 'SOFTIRQ_SHIFT'?
    2423 |    max_blocks =3D 128 << (20 - SECTOR_SHIFT);
         |                              ^~~~~~~~~~~~
         |                              SOFTIRQ_SHIFT
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ATA
   Depends on HAS_IOMEM && BLOCK
   Selected by
   - AKEBONO && PPC_47x
   WARNING: unmet direct dependencies detected for NETDEVICES
   Depends on NET
   Selected by
   - AKEBONO && PPC_47x
   WARNING: unmet direct dependencies detected for ETHERNET
   Depends on NETDEVICES && NET
   Selected by
   - AKEBONO && PPC_47x
   WARNING: unmet direct dependencies detected for GRO_CELLS
   Depends on NET
   Selected by
   - RMNET && NETDEVICES && ETHERNET && NET_VENDOR_QUALCOMM
   WARNING: unmet direct dependencies detected for FAILOVER
   Depends on NET
   Selected by
   - NET_FAILOVER && NETDEVICES


vim +2423 drivers/ata/libata-scsi.c

  2391	=

  2392	static unsigned int ata_scsiop_inq_b0(struct ata_scsi_args *args, u8=
 *rbuf)
  2393	{
  2394		struct ata_device *dev =3D args->dev;
  2395		u16 min_io_sectors;
  2396	=

  2397		rbuf[1] =3D 0xb0;
  2398		rbuf[3] =3D 0x3c;		/* required VPD size with unmap support */
  2399	=

  2400		/*
  2401		 * Optimal transfer length granularity.
  2402		 *
  2403		 * This is always one physical block, but for disks with a smaller
  2404		 * logical than physical sector size we need to figure out what the
  2405		 * latter is.
  2406		 */
  2407		min_io_sectors =3D 1 << ata_id_log2_per_physical_sector(args->id);
  2408		put_unaligned_be16(min_io_sectors, &rbuf[6]);
  2409	=

  2410		/*
  2411		 * Optimal unmap granularity.
  2412		 *
  2413		 * The ATA spec doesn't even know about a granularity or alignment
  2414		 * for the TRIM command.  We can leave away most of the unmap relat=
ed
  2415		 * VPD page entries, but we have specifify a granularity to signal
  2416		 * that we support some form of unmap - in thise case via WRITE SAME
  2417		 * with the unmap bit set.
  2418		 */
  2419		if (ata_id_has_trim(args->id)) {
  2420			u64 max_blocks =3D 65535 * ATA_MAX_TRIM_RNUM;
  2421	=

  2422			if (dev->horkage & ATA_HORKAGE_MAX_TRIM_128M)
> 2423				max_blocks =3D 128 << (20 - SECTOR_SHIFT);
  2424	=

  2425			put_unaligned_be64(max_blocks, &rbuf[36]);
  2426			put_unaligned_be32(1, &rbuf[28]);
  2427		}
  2428	=

  2429		return 0;
  2430	}
  2431	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============1174181545663436260==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICJ4SAGAAAy5jb25maWcAlDtrc+M2kt/zK1RJ1VVSW8nqZY99V/4AgqCIiCQ4BKmHv6C0tmbi
Wo/sleTE+ffXDZJig4I8d1tJ1uxuNIBGo19o/fTDTwP2dnz5tjk+PWyen/8efN3utvvNcfs4+PL0
vP2fQagGmSoHIpTlb0CcPO3e3v/5+vLXdv/6MJj+Nrr9bTSdDObb/W77POAvuy9PX99g/NPL7oef
foB/fgLgt1dgtf/vQTPs12dk8uvXh4fBzzPOfxnc/jb5bQi0XGWRnBnOjdQGMHd/tyD4MAtRaKmy
u9vhZDg80SYsm51QQ8IiZtownZqZKlXHSBafzVIV8w4SVDIJS5kKI1YlCxJhtCpKwNvFz6w4ngeH
7fHttVtiUKi5yIzKjE5zwj2TpRHZwrBiZhKZyvJuMkYRNKtSaS5hglLocvB0GOxejsi4HZ0ozpJ2
Kz/+2I2jCMOqUnkG220YzZIShzbAmC2EmYsiE4mZ3UuyUi8wFBGrktLESpcZS8Xdjz/vXnbbX8hS
9FovZM49C+CF0tqkIlXF2rCyZDwGzqeBlRaJDDzj7BpZwWPYGSgZTACbTVr5w3kNDm//Ovx9OG6/
dfKfiUwUktvj1LFaEk3pYUwiFiJxFSBUKZOZC9MyPWeSaolIlzJSBRehKeNCsFBmsw6rc1Zo0Yw4
7ZyuKBRBNYu0RwwtldXERSeFHpqDLsxhR1mpPchUaVPlIStFK7/y6dt2f/CJsJR8DgosQEhlxypT
Jr5HRU1VRjcBwBzmUKH0nX09SoaJ6HHqPmM5i00htN1goSnvvBAizUsYkQkP8xa9UEmVlaxYe8bS
YbXRyat/lpvDvwdHEMBgs3scHI6b42GweXh4edsdn3ZfO0ksZFEaGGAY5wqmqM/0NIUVlIv2rNLD
xGSslAtBeQU6hCUrLuCqAOH5ugteDbTvsLK1ARzlBZ9gsuBUfLZE18R0eA/E9FwbB1SbkEBmY2J5
5bz+o4PwWaGq3DlBuPXcEUpn8iyx0TwWoc9o1Ohchg6/BlyEKfuIawSHfy+Ky3xDsZBceDjDQfXF
31uRKCLPuCCPPlqQvd5eAjSnYB7g4H1zxoLPcyWzEm9IqQpnyVZ21uzbSXyHvdaRhsnhMnC4+6Ez
uoczi7GHQyEStiaakMxRdtafFaHr3wqWAkOtKrCCxNUUYetMOgUFZQKQd77QJPcp61Gv7i+REg9u
v6dEHblRORgVeS/QNNuTU0XKst7B98g0/HHJG8EtCMG2gxkMhQFryoxAZ47X2bWKHxJ6uDMwcSBE
oCbWG219mcBV5iLHcQZEzIkhBZ3rPuoL332n4K8l+NaC8JuJMoXbbTon0tOGBuFZYBSzzLHiudJy
5bXZoK1zbxxCTIVIIpBNQTfDwEFGlbuqqCrFysNL5Ir6QC1nGUsiR73tyqLQe+esm4x8ZkfHYLE6
xkwS/WLhQsIaGxmRc4IhASsKSWU9R5J1qs8hxnHfJ6jdP962xjN0Z2zOfD4eqw3IInIFbaSEsW23
HIPDAsbnZBkQhzhBiLVMFuqTcxqIMBRkFnsN8CaZU6zRHT0fDadnjqvJAPLt/svL/ttm97AdiD+3
O3C5DJwvR6cLgUjn0S4wX6Q10FgnCkrnN7cQSLMSonCfBuqEBY7OJ1Xg5aIT5QtIcTxIt5iJNiAm
Kog4dDuJ1GCs4bKo1L0WKpKJP0Kw19paeVecOb8+F2e+f3nYHg4vewjdXl9f9sc6qjkNMYFS84k2
k7F3a0hxc/X+fhl5ATcdvnuWPp2+0yWL8XD4QQgLzpUYEJgsooDp+zvRe9gFtTalMNfTQBKJ5/Fa
n8GAZ5pWEDDCRXCyDMjGfLFZqNVkTFwGhGkB7iMLJcscvpRsMnZmhRl71zBNGQQpGcZMJVxItrob
ffqIAHKO0chP0Gr09xg5dA6/rMAMQ99djcYnbYUkbG7VzugqzxV1HDUYRkQJm+lzPOYZEDWcI4ql
FqlZ8XjGQghLkpkqZBl7kqd4KSDmLz2mC8I6owXe8VgUeNnRXTnHQFwIK5J1424ICcuaXElV5d3o
ZtifPFtAnELurY2hFCTkcHshFDP2HlJLXouZrRvTB0obclfjqjCYmdH11dWQjMKU1Y4937/jCdvU
upIpm4m+TGQA6bgNGtDhahkkfRJd6RzU1YPGpYW86JINF37Gxx6nbhxCDosB56H4JbIKLFpAoxVk
Cy6ydShidhEnGdd3Uz8uRNz4Am7xAY5xtLpUgvmsrtrYPN8dCKYGTlJi0ARxtbtQxMVwQTDH71kW
SPrhfsGNa5Po/HlzRK9GbDGhn35yjGPAUrBqXuMaJBWG994sVwQqIxG4Zul0OhROPA3Ou1KS+VwL
kzpmTmg6Z7AD6YunGUTxVvNPtEtW+MwmaoJw8zKWrVWWgNvzljASxnucCxEulfKFYGAbXNK1Arsi
S+GVnNR6+u7zTLyCEKisOLENkc6JEWdzlCytAHI3hl+hv17Z/F2sQObd/VWs8K0clWf6jgWjPHFS
jEarZrn0H3+DVzz1utj6tLvPWbFyv3toF6vzLfm+HoqV86np56frKBf9byOKYnpN5BTUGmjhRKBz
CNFmqMfERucsh8SLFQylSDxmLrn7BZdrVrTXCtzwINpv//O23T38PTg8bJ6dsgx6aQi1SPWthZiZ
WmCJsUAvcgF9XsI6oeHWl/6wsqVorTUyIvmkT/+8Q9QSIlfmln68lBji27LA/309KgsFrMaf8nhH
AA6mWVj/8PGo/8d+v7/Pi/vzEba7unia3Rao+nzpq8/gcf/0Z51o0BXVMvGWCeXj87YZdXqxAM4I
7jGxBU7PRlRkipI+VoisAXSm2xqLM9NAM6eXV3w0cRaONVNI87xnFt+bkTcKB8TYhiiUdOKS9rj4
2dwBGzd+igushZIbzcoYkscqaQsjXvhZut9Dx0tTZVY+KcSC3jKhjUlEZv1888IQqzJPaIR1ii6X
LJk3VD3sGYcC/qIx01ysBDlIyNMVZza8IHpZQM5hwoq++1juEEiXwLqZhRjSJBEzlrQhp1kwCAPu
hkQ5yjCQWVXKxOdVbYgxt5FaP2+EaLRBXMzzrqffoxhf+Zi0gYV95DA6lhGE2adgzj6BYJ5i7iGa
UUUIrhwyke6ypCE4VYHpna/KJFaQfUDQAik25MJdDbEJckkU1ES9TaH3HKHnElKUdUZD9RSydOFG
TgDD+qmF+0ScgtLM8bBpCYVCm8e8Uffw6GBnzvwOCxu39tcSLtC8hh/Ui4EKXwnbjfoXbfdzmqGD
82TufLcRTf3u5WjR8nNtxY2IIgnRGyRjjevwT9ljdRL1ZQpFqpdSM5v8sVy2Vjx4OxDT19ChViHh
eVLVcHAjdgl5fCF4icH+WZDP6YEgQNNsJ9KJSYJepoc5A4+VpFVYlzUQdMIkQE/JFcACc6mg8t5u
GORmIAD4XMli3uPcP2WcrKwCFyI4S3tzG6kWfg0DHKTVl3FMS5/eNYbXFQgBgsAtpvMxBKdj9+24
Tq+4HDy87I77l+fn7Z548NoXbh63WE0Eqi0hO3iSMZA0pCih6JX+Kdy+bfvPoaPpGQ9Yd1TCf/3+
FtHItIs4+4hGdx2MaPKO9hqE28PT191ys7cbHfAX+EOfNngSk9g9vr487dxNYx3LOpeeMjRQU8Oi
nkKJPLIm5pTkAvvDX0/Hhz/8h+HIQy/hH1nyuBT8ggZxf/ZUwN0Pab29AZhQ6q6iMxn20Y3vLlam
XBlbm3DyzJYJGBeRzWTmD3RPZH27ezZZlWKpnh5ai+NxSmuGLTjFNRkeikUr0GLz+vQI8Z6uhdpJ
sjey1PLq08q3G55rs1p9uBMcfH3zwVaQByjg2Me/WFncxPuin2GaBBa37hRpN8Ue/8Ta/uOpIebE
9OTUlH3F0mfXPNx+2bw9WwC+vx8GX172g03L74G2DrUeYYD34e2wfeyklqglBln4fHc3fIe41v6v
qwvOBHicCPPC4ftDD9s0vcDGCh8aS80SzPeJYNgjKO2rWj1zfzBmvhVL5P3ZI+Gitg62PaauOBsM
CPn6TEJts9Fm//DH03H7cHzbb3993L5ud2ACj+dusg5F3Qc2G8L2YLakqeq3CQL+HWJYk7BAuE+E
7bGvwbuLJLrQrHRWGLSTdFFElYEwZhm+XHPuFN9ssAyJoe03KGVmAr1keY+RhA1gzRtmKXuouXfm
eSFKP6KGYq9W1HtZtfgslT2IXaAljZUikVQbg2gQG6aCTXTsSUEgPi5ltG5fyV32WDM1DINXLM83
4mlCIodO09qHBTmBXfdG51ZhOzhm380sbr7SbdPRAXcbtWyMZhFMnOZY8e/RLAWbY5Ik8FGTcQxb
+nXrJQNdkBhT2daotrvNsxItOD5uGNBRpzDftPLZbaA2QJynCtsr1OPib+PpHw3GZ6CUQIe+pq91
xee6AcvHwlKkKmyWmwsuI6e+pcIqAUVD1caHb3zl9fAXK1miMtqmM9yUZ5F2uH1cRGPjEZbzsNRj
4OK6ByKeYFSN78RLcM1klMLGQTk7y74aOONudm8nqY082MrGphbLlU/YJdyX0qUhhqaHvJT4Iyf7
DFiqJvYn9eXIHpStMZzbU64Wv/5rA/5j8O+6yPK6f/ny1JQZuwY9IGuW8dESLFljRN3XfQxvwY6h
nef87sev//iH24GJ3as1DW3ac4BkMS3Y8DW3730JqszaGwYQ6oSVaHfh30Ll36UG4Ve8hJvre0En
dKiFNa1v5QTd67tpz6c0KTZ3UKtsWyB0ihIkRZDm9nhW096rshAC3L+aV054HmAK7js3nY26SatM
ZrYkoXNYdpXhoJ7Cnt68WAn3jpsiJW2lXQXCao543z68HTf/et7aNumB7Xk4EtccyCxKS7zIpEye
RLzX24Xf1jafCrZ49WPwKr3WB5et5oXMS0cKNSKFINpXaoVpGg9gl59uv73s/x6km93m6/abN7Zo
qllEAgAw2LqE9TOTnnls7EdxpeqAm6Fnw1qnOqsIJlNYOnLn13kChjMvLTMw3+Rt0T6K96xUKmdF
ryxpbQgLw8KU/Y4C6zvAvECSTkIpTaZvz8da1xR0CBndTYe316dFC/ArObbjgA+ak6EcrlnGGY/d
o099L3n3uVLEstwHFTHI95MIbDJlcm/vkfLnYDZGsRExBjNzf1dK/Ry+sF7VyXpFgfvAaND71ofN
kJAsQzJU+DwYdnJYF8mc4DITvlhyVkCeIpxmq4jJRC1oHFAHQNgo9bs8Ja3h9s+nh+0gdEsGNo5+
emjAA3VeWa/qJqNYJLnbP0oaphZlmkf+uilIJQtZoi6kmXlRs48k2BBW1JFueOaeoqf9t78ww3l+
2Tza14d280uwc2gCiO2wJdOWIamZnmjraK/eERW5lwDkW7eMedePKrW0DaCt4bggIvskX8jFRRla
ArEovIa9RtsyZ83E9OvxpKPIFnBtKE9MguLujYVA2LEw9beRY34GW47OQGnq1CWasbT93zauxHAA
EFxVUeQKGpGRrR/Z3OHsuLHS+Wj1lZjZ5mEoT92NzDLd+wJKiOjhBHs3yuKqYNWgvOeQlr5KTEjf
rGiVVkXoLsvSeeMFIHoAdMIOsO7P8aLmKvjdAYTrjKXSmdWaUSc9BJgjc/jOhLuQ1Ckg4fObwNdB
OBXHY9QIlSzcZaFZcbqdcWVwdq2Fb7uS+mE1NjOduoMgnXHboi4BTO48BHZQuMyR74c8hAIiEvzN
xTlPtrq5+XR77WM8Gt9MP+CaqWZFViWzRSr6Zcb06fDg0VORaVXgO4ieJIvhmGa94dX4amXCnGbq
BOheP7Am6do94TyGJNHto9QzLFxz304gsU579Q0L+rRakSstub6djPV0SGBwNxOlK7DHqC2SO6UC
uOkJ7QLOQ317Mxwz6pSkTsa3w+GkDxmTjrBWUCVgrtx32BYVxKNPn3yl5JbATn47JBlVnPLryRXp
wgj16PrGKepVOmhqsibS7HZ643/x1eDvL9b8TyXjC0UfDC8hptdOHsfHqFln5k4IsNapr321xkCY
Pfadb4OtS2Tk8GpwylbXN5+uzuC3E766PoPKsDQ3t3EuaPsLDz6Nhj0NqmG9NxYChGxCgxu0hc32
8pTb981hIHeH4/7tm+10PvwB3vxxcNxvdgfc9AAyze3gES7U0yv+6b9Ozf0g3rcU4OshxsjPU1q5
O0IaC0Z08F+D/fbZ/lDz4F7gjgQ9Tuh0NmguIw94oXIPtGMUvxyOF5F8s3/0TXOR/uX11Nysj7AD
mof8zJVOf+kHdLi+E7v2iHlM7utJM3vvUrbqEp56RjTXsjFu5+9HiMRsk1iBkjkfWL8KlLa9Um64
rBGbu4FS8+vX7sXqr6fjH4Dd/aqjaLDbHGFDgyfsi/+yeaDKgbxYTPdhQakKsPSQQLCQq0TC7Rie
DYHEnJWYh5N1I5iLhVM4scDPqpCf/VYC+clM8tH12FeXqefDJ552oe5QLRP3cncTIzaKfJlI5ZYG
62/bZaBn4g4cGwlqa1yiZrNeWlMrmxBiMJrcTgc/Q5C9XcK/v/gsEcTTYgn/+lbToMBjaucXhynj
YCEV9oDYoNUX2ULAUv/0jP58RJLzzGz3s1sLsJ7RZxA/23cFmg3g8FLQBucWgvor8OfJLOSMxm8u
QaGqLIRgmv4KtkfR/rbBi8VseyEwgXDSdocGs46AJW5BCKS3SNxOVQDpC6+IwBD+ghDuwnMe6IA3
oSyrzCysjO2rC330WIiS9Gpj3i+VG2BmSa9xEMK/3jS1DjEwcp2tP3vfg4mwpkj7IZ24FdcHaWKo
CjPhVNQLha2oJLxZ57FSmXckCxmk2q7/qEH2FSvyKzdlMBOuGopyNBn57jwdlDBeSJjE/fEF2CQQ
96WT7AaXwv11XN/1lfp7i07Z/SWBpNR+p+HNaDQy9ZmTUAcGTHy/S6SM4NplpXSsJkUXF1X2RIIK
oC7YhxNRBZ6Eehn7bbLg5mY49O6wvtxuvBxMfaFUwFPMoIkGBtmK/g4mo8lYKWcqm1CuNcTEy/TC
eSE7r3tY61KkTT7kEw3sAZstvifBpiHjYwlytpBV6hUVj0Wi6Z1rAKYc+WBmNPOApz7YIvJPCGEI
mU44AqZ0+ECYOf1NKbhbj80IXdvUsQjdW29tb5VIX38bHZXIjNTrwmRMvjQ4hf7vZluYrY58zBtb
OqndCsTYVT77XavTGRT+zwNz1LGBWo/i+9F3g9fzdcyW8wuaJ+55/D0hxc4DQ5yPLnTP0iEVWwrf
zy0IjQyIlsIHCIzxc4gpVoGNdvrwEuDX0zMw/kjWNL+1mow93EDb8rV9rNYx1o/HV9c+Kj0P7MtD
ocC2kJeZE82lrpkTwb0T43S8Z354yWIPFP8zvXB42EDrL3H9nn7XmKSsWAjvr54pEVCwTBEtTpNV
tPTeQEhmCvpuPtc3N1cjGODA7m9upr2spMfD/vCFxL2CJdnKS52x0qU9B+ibyc3Y7zjgTywn/S9h
19LdNo6s/4qXM4u+zTepRS8gkrIZkyJDQBKdjY4n8e3kTBLnJO6Zvv/+ogCQxKNALXIc1VcAingW
gKqCNvZopE+O50n3q4Jf8xGt8BW07BrNjMf+2N9uguONEVLEu8AsI3qEqttOdTw3VaPNpTJAi7Xm
a/z9I271yFP0aHSTNenANd6aKRMzw+aC99oHYx/0VMMp+qHBV04tz/d8F9PcKBe2AGBfuJb4viR5
oGsIinA9EXPVfc/TiUGFGYl1coLGxBqrGzKNNahr2vJR8B1XOZi/Wd/r+SvS1eciNeNcga+v7NJw
NQKb6We2Iox2dvbCbIFPZ3AmjLv5jEWY7W61ysgVJ0puKrMjhOPBRNR4KOn4KqrHCZru9/XV2Ijo
7LVu96MDfcs1+pboB1f0YPqZHMprV1ZwjIH3u4UB2TprLAfobkdPz+Cbe3KzV9PmhuJLO6q7+Q5N
GQbmcSln2IXoVkRASRT4BOxL2BlO2NZQZ2Ni9jXKZJ1Yg9jDze873a6Cp2M/cFX4Fh+rH04Mn5J0
rpsc5waPlqOxXJoP+I5Z41kMkxWkHCRhCmkbVjsA1z6Yqckcqkpbkqr6MBkHxoLg6JNrGzweMP2s
k4a7Z8MqXxCNmzNJKTvhU6QLJYGG7YkZ3mnO4tqdJr/vpsEFoo81NnYEG2TilPDQ0IYv7fg8LDh4
ny7hlEj3H3l4ahvNxp9eOGX9CYZsbGzu+Rb+KgF5g9M0d/znfM6JmHDzfTEkwKxm1K5X5bemkDdO
ezuZdq5XBPHkyZW3Rz5Nk50pJxf5tJFIdMulEtZ0agfsFaZs+M6RePJVe6+rUZUV30SqHDXiAMpU
ZIsNZFYWYegpQCRLCiSvLDeJh2aqKzv7phzaE/XkLTTg63QhT2ZOfFsKJzdBGJYWMDG7AKUIe0qY
0TC4N3OS6q6TGUyhsKXyZbfgLHTzE6qvSZZxEEhrUt9rjJr1n9BAPCWrFdzMB9brWVptXPGxZ2fO
VY8wmLCZCM6oeMdsSmqnOfP5kdLaI5CaL2E3FM17ovVMytq6r8DgXirU34Xp2eVLR6a7fxxf3v77
+vPf4P2qzLj+eff2yrlf7t4+z1zILHAhWIwqGHKa9Y26vPnx15v33qQ5Didtmy9+wtxEbdrhABf0
rXHdLxHYw0rXCYMsAyo+GjYdEukIn/imRy1Iw+nXy8+vEOhvuVH5ZYnIlaITrZFiZvp1oOQ0eVHK
+399vE5/hEGUbPM8/ZFnhcnyrn9Ciq7PKFHeQ2p17xg6GQke6ycRrUDbdyrKlVRDmhaF3tUsbId0
gpWFPe4rNPF7Ptugt9gaRxRmASKTOIS6Vs2YFSmad/vIS93KWi2xGFn0pRqrClaSLAkztESOFUlY
oCNwYZKdbpun7Yo4wjxqDI44RuTjwzSP0x2GlBSVuhvGMAq3BTrWF4YGo1s4+qE+wmUURUpe9y5u
zpT1F8JXou3yeXKrMV2eno9j7AB7bZ4uurL+VD5wCirLxG70mJIMfC8xIZ/I9QysyhlfVwxjJW2k
a4sY/OTzRoSQrqQdKEbfP1UYGc4B+N/BOH1cYb6dIAOsOriC6vLxZQ13Ol15yycrMs4KCZtRy61w
RWu+BbTvf1zUlQCTF7z+2wa/TtHkEc3f4Fv6le0AsZKhbO93LzZ0BrV8IgNxvwa+BAw0vLmdKVds
CbGzMycoVfDSMJbFx7JAUIivgH6gZBGhCLDtm4KhiuQKtJatEcF7AcJHNvpQ13FS5VzL38JMYy4D
H/myGG7grOPaYzexG/CVxbmH5QQHR1PZjDi+P0VcATZvsGw4wlY7nQuUQ/CTacpjEYcFXlL5VJSs
uw/DwIczRgfnhh9hwbuWy5jYJm8Ih7fqwe5yGHscfCDdQB8aX+Y1V3R93wBhLQi+HrpsWwaqBvdU
xnhIEp3rcHrXMHrCZb7v+6qZPJ/bVEbEAh3j+jnvIp6ENKNPeRZ6SjwdP/gq8JEdojDKvZXYomq4
yeJpuwuBPeulCISZI5q9ZLndzbjyEYZF4Pk+roCkxmmzAXY0DBMPVrcHCFbaDIlPwk78uCFe003Z
qb0yWvqyaY71hN5QGmU95mHkmRvrYweuZN52qvgGhqVTkN0oQ/x/NEMfOvil8UzRrLmSLo7TSX0r
JunGHHipmDhS8c4FF659hp4u3pVhnBfxhtgNV+l9ON9CU2WujFYgZ4iCADXpdbg8K8DYXU2/f2OA
Nm1NMB3QZKL+uqEsjOLImz/rDqgvjME0FVnqGQtsoFka5J7K/1CzLIo8lftB3Gn5JBv7h04tb9jO
QymuDUWUDr6qhwl2xK5gsSpz3VkUZ+vC+46EejRMtXuNp4BLw5h+06hkkB3sOlxGD0PHt2Gm1bQE
7ocIc5eaQTic5dO6biOnQVUNAbpHN9fHib3DFAKJjvU9xKiC232ht7npRYtGYbF+0IbyRqYhCiY+
z2Deiiq/S5sFSXA9N3vdJkiCJ/ScZSBtB4dcWo1a5Q7lIQ2ymNd6d/KWzJmKNE/s3MfHIkghc7nv
cqt27OFFBjCt7yu39iuyC9L02h+tbduKZrFEvYLJ+erqdhVSTW2cOKc1ioyr2GVHbN3C4uDaAd8H
VGDLVtV7gvs1qcMp4X0Edc5135H4P6Eaz1HGW172IopUBDBk6cywnVGWaxmZjQXGzlynREbX2DWJ
o44KIq4ZCIhv3qwcDrrvw0xZZn2dHlXKxt3mD0OHEtmUOHAoiU1JXUo6H5k9PP/8JBzrmt/7Ozir
NBxZDGER1x6LQ/y8NkWgB8GUxIGM1umYopewj8fuLQXcNnvjwEBSR3KxSerAeBqoOmGwylHmkltl
cawzI5jLlGN5RWQgwx4tSJ6rocWcrOq6J11tG/7NtOuRpikWrGZhaBM3J7ArC4PHEM3x0HGd1TXN
/fz88/njG8QvWhyZ1pXT40tf1WdfsEUOPVqYVj+kFb6SxjWkCFitT4jtIIJY9mboZvPwd+iaq3yA
wVyrgD6IiNfCrxSbH4BFXo6KK6LxQEx1QTBQzJBGIrQ5OOwXwsqHqkdNvoRIEDiuPxgJHy7Kchy7
WTBjcpNhAINhw46VlfzfgCXmH2f61/HB0T4ZdT5TRHwthNwbkkoxr2w8URE2xOlEMDO6dx3G2ziR
ihLcHA+9SZZx2i3aA2c1GpwTu9MSA6z76+vblx9fX/7m/RYKLz9/+YF5LUAyMu7lqOSZtm19vPfE
TZYlOPfaDtwZ9x6K3LIyiQPjwHyGhpLs0gQ/ejZ58HcGFp7mWLIRM8qbObgWZkpW1VpCTLauncqh
xY+cgUe5QHseUgMOcWw5Nws0Bfn65+vPL2+fv/0yuoIIf28EEpiJXJ/CiETPdFmmwPXqlx3s7Y4L
wemfwfUKDchmZN6EaZzalSHIGbolmNEptsTsqjzNHBpY0ZvExjgrEBRq7BA4ZWiaKTFJR7GRiUwi
35Sl6c4Rn5OzGDsIUuAus/rsWbcCVAR57rUOaPGw1t2/wBdb1uTdP77xKv76f3cv3/718unTy6e7
3xXXb6/ff/vIx+A/7cFXwmyyMaSqGp6qEZ7/ts5lwbO31u2MrKCKgNZdfcaf/wB0Qz6wtW2s/UwE
Ib+6rWHTDZ4wExzrxf2Rpzje7XW3NCPh+Biju0/Rwp3l2QJUqRO5N+J/89X++/NXaOTf5ch5/vT8
4803YlZ3bSP32U26BY3QKaR/+yynZlWC1ovM3A96RE/xLS3RvdAXknJUdXsImN1CnXo7hnBK5XMK
ntR360IH3IqM8vUcBR5QnWEwn3/jP13jcDmNDfTu49cv0jvWfTyBXstWRIt7FO842XkqUDUKLsfM
pC5cllLVO6avP92plQ1cpteP/7YBZVUh7Y3Em4HHmsFjoWDPIeKCUUa6AawmNfOK50+fvoDRBe97
Itdf/6N94bJIzXqrCmihgOvylN6awFiJNX5Y2Q6nYzn7IGtF8P/hRRiAevHDXTdnYcQBBW4Yu7B0
aChihXblEMU0KEzpAKG80gzNd6ZPYaofuC85kSnPM92OfUbkeQcmvjir2JIOgqAQN8eSJnkbay7l
0JUMsztFuB4IZQMEL5fRoLWXdvqDdeM3J2nG93CjZLeCyyyfZrNoa+RYPWzTt+cfP/gyJSZ4Z/oR
6fJEGVgae6Zh2TKibSyPyi58D4jt0AA8MPgT6LdeupiI77GER+RzH9pL5UjX7YuM5tiCIOH6+EHe
pBjUvrRCgs31WXrO4wTuWUhASRA1+/L3Dz4FuHWLGNTodGhxn/ykOrpyCqsP/D2tBY4m+5sl1Yyj
IXfpoHTHk1OMom+JJ88A7aLY0JRRIdpcdsJDtV1B+2qX5mF3OVsZycNAi/iOHD/wHXlrkaUqYhHb
Id4lsUMs8tiWGYhpZpe1TABuA8Bc462WecbRiWOZsrSInczkGX+B3RGteKTfK6/knTOw1HmwRV2u
cMyigZx6v4Kju13yhxbsebsRWTHZtSqiiYOlsmlDNWO1BD1+/7LWqjKOUIt+EY5JiBb+9t8vak/U
Pf8yHw28hPBUGDyiAKZYupfWilQ0SooIR8JLhwG67qCKp1+f//NiliwVNnDQNDORdGqEHlrIIE1g
7GxMCDsNMzhMewYzMdbLDI7Im9haKvEC4vBWAbodmwVcy7H0gQUO5EXgA0Lvh9TolaLJEhq37/LB
A3JG4/ELTPgOuUkE2bexslnEU76WL5bO07Iy2qXYkarOtWaCgHKJ28L0MzrFNNYQWlGEaFiJihvF
ZK4QHbN9wqnO4wRgew+41pryGseOGKHIM/PawmIuk3TUApsyuwQ4XQNHCFiHA91OY08YH+RPELOi
2CUpcRHoYbqhqk4vjMtIA8FPvwwWrHlnBrqnrvQGsSNHshKdEvbvI/Cq2CiCL7lhin4AmHvkfGnZ
SKxYIrdeBBLpVgSz+PNdo17kjPFUxS7ATqNmDli2dfVuppvq45qfqB2sKD624izFZq+Zo6pVIGn4
liRLM4/EXDPYbYnM2yAJU6QmBGB6s+pQlOY3cs3N8zwNSnk1biSm3T5OciytVE42Eyv9JHcb/Z6c
7ms5ayXI6BpZGuDtPjI+6rCNmRUIQPy8npvKJqnTELmNknHrZOwkZ/OzBFCr8iQ0DI4MBFt0V4YO
7Bi1qdEAUjxTgDJ0OjB58N21wRPj04rGs4vQcbtysHzSVUkdSEI0JJ2EsAFjcGSRJ9fcn2uONf3C
QUuueodoYjrU6GNgCwObBjRlRS1tHuEIs2jra5e9ipO0SR+vpPM8KK14Dnka5ymmXswcsyEM0R+Z
XZIzrpWeGGHGK/EKvG/TsKAdJhqHooDit5SKgy9zBMkzzyI0Q7HpR80TZ5aH5iELY7T1m31HPPep
GsuAvvw+M7wrE6TL8ZV/DKMILRWCfBPPbdjCIyYxXAE2eHbb3Qjux0J0mdE5ohDtSAKK8Jt7jSNJ
3e8XQIaMcAmggwLWuSzItgajYAl3brYCyApftrt8s5YgZGPm8VIxeOLt2VHwJFsVJjhSpF4EsMtR
IA7zHZakHOIAn5lYmaXYnmNphS6L0RbvckyV0GC8o3Q5pitocIH0hK7AhwdXrDczK7D+1hVI3bUd
Vm+cioxYTo1Rahrppj0GkCCLsAQQEY+slFvzhlqBzBeOknFlfqv7AMcuQMQ5DsJ/GZmI4MRsZ3SS
wevxMieiDyzcnns4x+bqxPH4b1caTi7RDqvuVzdyrPmClARIE3EgCgO0O3Mou0TB9sAGz9ok78Id
flG5sDFG882ZlHZdliENz1fQMCqqIkSnJ8JX+iDc1EAqyrdpyAgi/PMKTBFsjiQKkFkS6Fgn4fQ4
8s0k+dZEwh66EpvOWDdwXdJDR9tKILh3o8aS3GhMYNnsmOeGZEWGaBhnVkQxUpeXIs7z+B4TGaAi
xK+jdZ5duKUkCg49WrUBIB1e0NF5WCKgD9kWKxhrmxcpai1u8mRGXJgZsmz0dbreH8SEZ4aDVyT5
ihf1WJPOTHVX8x3asXxajon4XqslfINP19CyM7O1W5vJplHVTL2MjfBVg/AUAz4dzqz6S9Vc7x2u
l4bi6huW4kCaUYbk3/hO+8Xtq3iSGpPbecVbvIVQghH4Rv6mIG4dGZ+GwxCV5KpCkyDwttQ3pF13
5MNpTrNZwcvbzMg3z7clWOcT8YSxEuTTgeXQ3DVHFifBBDfnP789f3W38LPRoXZGqCiWB9xCPvYX
8tSfjIPWBZTmlOI1GfWEJDZbLOzzJawQ+PL89vHzp9c/Xef7dcD3B7ZlJ6kM4LWPWm1KpfX7RmJ5
b+PUh0GWBszNsWH2u7NwWRpku60C1OkrUuXy+BUTW9kkY7kuPB+aRtiibzLN1uob8s3vsaLVd7mR
/TFlWVhsZQ+7gnjCvn/p5C5E2qbLuU4BnlYrtcniIKjp3qTKW0xFW49g+/6xBiIqdweOrlFo4/Ot
nXrObOmaEHxdGz1geV4i7VkxaT9m9uvh58vbl28vr3+93d2/8q79/dUOEKI62TDW6mVWmGuwRY1/
+tBT2hgvn3Oq8QPEE49haqzrUFpxTwG0avrN5DODJ716ZMY8Td6XHUFEB7LFJIuGEOtI8QYHdqi+
4Mbz04Ks5LIs/AREDy2hmG+knvAeQpaV3RHPFvnc+bpmtTr+37++fxQPrzoxo+Zueais+Rco2pXK
2oGBTuM8xHXJGY7wDQGEXJCmFJ4jPJGesKjIA8dAzmQSrmuHtp5K1Bp95XloS/0YDgBeTeku0LV5
QXUtG0QuwrELo5nm4kC3jZBWmsu7GiYZHybIBb6DXHDPyZWoXlh5YtxtG9KLNSvyBT2YGRyxxHqG
ba8XMDY/b7mc0quiDPmMPKFE26ULoIcm4zsS8VnYBQMrxTPmpbEnAirPyjJ1VWALz8nrdsxAMAyb
oVhhtVJ2vRHPHYDFbsWQsiiGrkBNfFbUqU9BzgJ/O4mbqxQ9G1LwbEJnJ+N01EJlhXcxmqxI4i1x
il2AHwUueOTvtgL3HCWuOHZ1I1CWxbvcEbo+HqJw33lii3AOvrBhTpEAaXeZy+qqPCnlsf06qma6
xzRAFCRNX8zuslya6bTFskgnPha6WaUgSQXHJFLn7WdBbZI8mzCgS83IAQtx61Po41PBe17kJkQf
nyT7KQ0CxxKe7OMwuDGHU9YN2MZOYJbxA9AM53liT+qL/ZhRBlw6F/jRiMqyRf1mRRexTMPg9jQM
9OtgeeVqxAlxvMBFMcpuDKPuAoRq3NHOglq2cBrZsIbTMins6hD0IsMuZRZ4FzqziqI7y4bNxKdB
zwUnu7RJELsdYoWFa7TbiS9tGOUxArRdnMZOe7MyToud7/vOU+EubWRsPvRHsvltfMuUeKd4+0Bn
pbmrvn3Is9JQXmnUp88LIhhAlYeGAd+82zJrafFwR0i2Uc8KyKiV575l5B7LTLyqciKtcHg8dTWa
O5xoiAONTS6+CN4XupvPCoHuWei92oRstVRDqzTe4QNeYzryP1jwR43FUvtWxNUeNcxpGQ1y1Eut
NSzrWRPRdSsDicyhamHYWa7WzuSYxileqLmrWOkNbXexqcwYYBblIRbIYWWCWToPsbwFEuFZC9Mh
bFCbLKZhtImluG5iMaE3qBqPnF48pYBZUo5pXisPaHVpkeEZYKbKOFuRJVhgC4tHv0M2oZ3+2KAF
5WhnwxRHDZUGD7cE51zFDttEaDxc0wvR/gFI5Ctf6Ic3ipfL+WbprlKoYYfThzoM0DodzkUR4NUt
oMIzTAWIWmytPI7GqEFKb0RyVvrjds6WfroiNOoGEqDNABDFW4imXZFnOS7QrFZuSkQ5T6DfMK0Q
1y7SMIs9E8Ssmm3mDkxRnHnaQmpj0a1OPCt4N0sy9T0b26GdRWBhjA5OVy90sMKLGc4H2lJu+q+t
gK3SmEiKZmarK6WzWwHKsWfNoTENO8fSpxd2ddUQYYcs3TnXM61vL5++PN99fP2JhCyWqUrSiZc2
l8QGylWAtueK59nHUDX3DeNqjp9jJOAR4QFpNWqQdgAsRKvLGfR+NP/BRgh2OyLpF+xanTGHrnNT
1SKe/iqWJJ2TNuJF7yGkBRkaDLZppDov2uIih4Skrtg1R5hNyPG+xi8DJTMcrtLHuq3xgLWSCZ4G
0XRFIW5XdxH/Z30OIOL8VATKL/n/qCX5/nQA5zWEKl761rRfXolWVwVKZ0SmFhQyqQf4RvpHmGn3
FRxU71/L6kBfRAcmEd6Ab+SZfOES3i/sLUlObW0d4oq+7p7air4gqtUaIHJsPP94+wsbHrKmad/2
mWFJqlrgwhWUxKVmBUbLJrTQ35+/P399/fOOnX3FP9RT8/+MXVlz27iy/it6OpXUOXMjkqKWWzUP
FElJjLmZoGQ6LyyPrSSqsa2U7dyT/PvbDXDB0pDnYSZWf42FWBtAL/usi4ym59yBhRrPSGBZszYH
YlR7jirhWev06fvvv15OD2rVtOzCxvWXFqW2rvWCYOF4tDGUxDGfWer0cPp2ert7xFrgk0IgrNmV
9xkcCsFh4Ti0QIjweh9tu1ijdh43dLuL8tLyfIFsZbqvC1cdiKUcSE8QPJWQo3GoSoqidZVEWwu1
zVgiXmqVTpylg3nphcCryDYsBoLLGB3DWsEd5aTam3rXNbv2EO/pvpulwv6EqIXSrP+gurgF6Gz9
bOnCsh8fJlkWfsKnrd6jgazwnjH+6oWuweTDfsStTbtlSKPjbaB8bhW+FlTayKnanw2VFRDxSX1u
spvIMbe5ev7idFgyE/4XJTBxjjoO/MV8ZibtgLapA8qFTFcuTLPFdL7T61PHG1idXJ0srpP+tAb5
Rnz5a7LJuuV28oHVE/4q+9GQL4oM7RcKNW74/fnpCV/aROouYoO2+MEW5Gr7zUgntmBOh1FdlMQW
5/LdDCWCZEvml3G1EVtCpicSC9dsbiG3B2ko8gGaBDl0c1Qf1J3g7vn+9Ph49/J7dMXy9vMZ/v0P
dOLz6xn/OLn38OvH6T+Try/n57fj88Or0cworFQH7s+HgfAQDrtc8PPhdJ48HO/PDzzXIe74K/fu
8HT6pUymbs+KgtVyZm56MQYP8PVWEnR3sI6uIjYUOEQvPz0czzLVbDVn2CQFM1bvTqm9mtnxWaWG
d0/Hl7uu2SSnZxzcPN69fteJIp/TE7TJ/4nQ6+jqZoB5030STDBgf7xAu+H7sMIEy9eE95hKzk6v
90fo2OfjGR0YHR9/6BxMdO/kJ+oyQK6v5/v2XnzCgxbmXXSxJvRJRHQTU8ov9zIGfbl0letzHVTu
4VXQAdSxoqulrBOtgHxRsqXkoCVlVrvqm7OKOZ4l0yZ0p7IKq4qpjptVbGbFsnA2Y0tZJdhsHtlz
o5K2Sb2pU21o9DpzIiecKpaFBr6Gig3W6vw49/oGk+Lu5WHy4fXuDYbX6e34cVwUxgGDWy+rD3B+
llSkB6IszXbEOchPJutc8XjFRfsm9ZvGUqd77jrm3xPYnmGqvL2c7h6ttYuq5krNuh9toRtFfQFA
/4NZP3ZgqWHR/AdlYgnQoo3ZJJ48Gvkxp4nc5cwZo/9gMWH3iUQtgpoBmoOs8n0SwBw+3d89f7qC
Y/fdM2yfQ9U+hbyJYBewVjLdgpTuTYc2Tlh0+QNHLrWl/vV+UrltQlR4cIfP7QRvKSmsUY+/xVL3
+qlMUzV9yRXvxMIWh72ztn7BnXyFFZl3pvax+Xrn+mrTA610B08IoRAUkj6e0eRDnPtT13U+XnQI
1/fhdLUapJjz+fEVnRZBnY6P5x+T5+N/raNzn2W37Sbu025f7n58P90T/puCreLN5LAN0C0hdXqQ
PSbAD3QHn7QRU/SdkB6VsIs3vaNEWrJGNm4QmpFuIgcYRIENyulqyVcgjwj/fyZ9sx4hpbwNvwwh
tWIVvrQIohZWsqjdJFV2Qysld98ZxqFag7rWGgkOvi3XGrNU14YdtHxYuIuHVQWfMDvhYQLjUtuc
pVTCYeViqrp/7BGWpNrJ1WDJm5Lvk6sldRNqcMk3hgiCMB6r3qxHKn88LGtKJRuZgizalns1O0Fr
zSHXAWFCx12RWP5Joe02qGoxAEc94iAsJx+ELBqey14G/Qg/nr+evv18ucMTgNr6GKAxCMtxSXr9
8Xj3exI/fzs9H99LqCqniNlwhWHl01aN6Stql0WT9PTXC8rhL+efb1CANBRgKjIlyA8ncPMC+uTb
4d3kszRWXuwPcSB1UUdo03gbhLdtWDfmrWnPIy6+fJLcK/D/6Y01UhmyjD7WS9XiXioMD4DyDNvG
mT6ODjAl7SPI2hLZNti6U23sh0lV7Vl7DSuOMQHCoELd512Ukfc0PUt6iJie9rqhDsmIrItwZ7Dj
Kz73/UxpvyBDGeRxqg/REsT+R/WWqmeF3QFyjSsGq2hqWxoFJ1V9gQhx39rSginBQLVX+A+I6Q6l
lCTx5nmRokPZ6WL1JQzUnhAsnzFecj1dTLN4qkrTI09RJSzmMa+KGpX9VgFdf/h/wAr05Xw4NM50
M/VmOak3MiapAlau46q6hU2TDPEks95GeC9aZfOlMay6BhQR3Vo2j71d4L7DMvc+Txv5FEByLYNg
aumuOLkq2pl3c9g4tKK+xAvbftmm1w6cHRzWWIzRDH42nXm1k8ZTSpuBj279tnHIYUCUITwKXOuX
08O3ozGaxctQ0sAfzWJJemDh0zjKGSnl7LM1l5aigNYn4rIEzIA+rIKVKcPlcpeUaEAZlQ0qyW7j
dr30pwev3dzYVl/Yc8s692ZzY4Dg/tqWbDl3Xb3WsOXDf8mS9pQmOJLVVHZV1xOFja+SW71LMML7
Lpx78KUYUNOSaV2wXbIOhNqWcnLmKMyITak5tehliyA6LHxSx4V3YhWWW2N95WGaoUCLyihv9IZt
aP8Pokb5bUQ69OW9yvc37RuiTWMs845Layh1e4a1B5iat+IRmXMEh4CeC7CAxXnNBdz2ep9UV1pW
6M1S+Ezv58vm5e7pOPnr59evIEJGw/VSlwak6TDDSJ9SaUDjr7tyCGTlraaXm7kUTXwkZgr/bZI0
rcRFnwqERXkLyQMDSDL47HWaqEnYLaPzQoDMCwE5r7HmUKuiipNtDrM2SkinGX2Jyi3tBp/8NrC8
x1GrOuwEBD1xdUI+LV0AD26mWJsaHdPq0p3SR997h+NEMGBsJy522IopM9piAxPewvbk2gKrAEOx
sSat577vWxMGsOpAW9KmUrxbWW0FYYl1aKc8WKU+6KmNgTkRNzuw4fkhgW62oVVysGLJYmb9YOHX
0JorP/5YG6u+tS0bArV+Kq3SgghfLqxoYm29PC5gliT0Kgr41W1V2DAPFkRrnxZFVBS0ZIBwDfuT
9Wtq2O5j+2AKKvoMyAe/NVOQtjNY5KxthNr01pGwhmN+U898+9TpdGmt4yWG8ZIXmbV8dKnr2kfx
uiqCiO3i2NoqFwRuRBnMEovVB//6hUP7wOtOWG0aRuZRD4lcX6OLaSKviohdcJs/5qxlYOCjc2Wz
Uobm+IiV2XI1c9ob2pJ45DO9tI5YEJXL5Zzuc42LDLEt1YZwuKd8h+ZVx2ChjDlGtFcpu5hFpwtM
lX/w3ekipfSoR6Z1NHemC6obQERrwjynoE6fXXuNk7fLEcKzsjKCii311syKfS47isCfLarfqO+w
Kh1NY2GgJdKdG1NyyaO2920vkcpQTYAPrXG+RZnYgFh8bYxipFfBTQZbkEr8DC1kUvr4YbJ6FBNf
gbeacuMgOUuauEKQaiVRe0T1ZB0ZFUXgSy4lJlpkVxFEVWFKxVDTCtbeiP3puWo9uuWkLdIINdgs
9TjE1brAoNEYqelK/xYjnIHaIXu0S6/0RLyn8Pr8vYRU62HirhH6Wyx7Ni32vIgGZQ6WblSo33NB
WUX0itJOXDLcRX/wW0tJ3QQ7Cp27gliMKgOwOXyJ/5zPlP4tQ61KhUkYXMZfGvdFKN2DEkD4BU7Q
C9dZZc1q6fkLGBKyoabGWtX+fOYTPMII2KilFHslcY3eUiKzZEbTsXPYaR/g68/m5Xh8vb97PE7C
cj++2YvnnZG1UwUhkvyv2gX4VRuWgnRcEU2LCAsSC8BsQBmpIcBkMIb8rEMHmZKsaYN9lO1JZ37A
BE2IxrquM6VaU2Rhnl5YnZ3uX87Hx+P928v5GV+hgOS5E0jQ6UcYr1J9fk29KbeBXtqXBs7bpIvE
vhp4cYB/l4O/BLyDCakz0zDCwtWiFVz2jIMo2Ld7OKyRX4+osyCvsFSWxiFGOEfmFxDVdExGF9Op
S1boajYjY/VJDL4chFGiz1WlMRmh/fcNDL6nmr5ICB05cGBIQ38uR8/tgXXkLmkAZJ+wMOkh8/xU
VrBXAfLLBES68lI4fCrXmZvOyOIA8Ik+7QDdHF6FLzWz4Jhbcl4QbYXA3FL5xdRCt1R9cbHmTbO0
eB6QuDzHowv1ZiuK7nsplUBsHiY9Zqi4S9UQEHd2aY7GDIR+cgQj4r73bds6m0+JdsM3CgyVNfWI
XgNBiG9/AVUsB33SRb7CIl+sKsDKtSHegpwLIjvSQXHPweAI5czbGzjJdTYUZhGwqzpz1e2/DC2W
q3faknOtGjpnAOglEUHF4FQDbGMXYOj4pWEjbLL5jvuLzB4BulJVOhfe84xiUahxKINCmcEjRpSQ
hkw629ap+sQ1IL36rkHfZkHECBmtR9ACSBhKGPUXlwsgopUpt/m5KGSwpNqglIFRL/XN1mRGeeYy
B8tcj4wYJXPMp8Ta3AF0bwE486n5xOpARPIxqwIIGbplZEhApiMlhzpgru9b3GuOPJagNDLHwiG6
lwMuMR4AgN2cEABqWFdn1Lpab4LVckEB6cFzp0ESUvu0BNLtPTB4TkN9wAC7DVVbGX6vACp75gWu
u4gpRGxoFsQnd5ibbOlbzDlkFssdp8Jyac1HBs1B8IgsaEfwEoPiL1WiUysNpxOzAekzclFD5OJs
4AzEUEH6gtx9ESGDcUgMyykxPATdtuqjQSMZ0UJmmBOTh9OJhQXpC9vAWC0uScDIsCRW9C/8ZLaa
ly5RHm7WC5+YkmgvTQmfebBf+jNy5CC0fGfscp6LI7MuA3QoH+iVFRsFXvgMhygaNqomIBbuOWyt
nthYtlVQ7v45I5WruDtJIvNoulNiWyTRGAqmruJ8W+8UVAkIvxdph4pg6u4OxTw1/zjeo9Iq1sHQ
DsWEwQwVVfTsgrAij+8cK0vVHosT2Z665OPQHm+I9ATrOL1KqIdRBMMdqrjoScJdAr/olyuOF/tt
QOnkIVhWRZRcxbfMyJXrm9sqcltWsWwqikTojW2RV8J/q/Qa31PbzcaSXYyapRs1N7RSKTKN9gVq
qpK2cbZOKrPfN+TLB0KQBdcQ0pNc3VL6VojcBGldlFq5txXXA9BzSdAhp7UrktpWxudgLfu8Q1J9
k+S7IFeJV3GOgULrQqOnoREgipPJFxiB5MWhMPgLOGvAwLck4u+VWbGXXfQK+i23IlapVSw6Xy8k
S8KqQLewtlIKtDqMjYGe7dM64X1nSZjXiVqDoqrjK5VUBjl6302LSlpoJKIxEMsYDl+3eaPXpoRZ
l4b0GsjxNED78pz2Ly3mXgKbi54vC1Axz5KkUygz0mAcmDTJrcnqONDmEpDilMHiGBtTH0ooU4uW
A+9XWyBknBeodhcw68rBsqCqPxe3WIC0P0lU0QFKpnVyoF/COViUTIuCo+I7mC90jBUBV3tWiyiH
VqY97jRtySg5hq8QSZIVtTYpmiTPCpX0Ja4K9ct7ijHsvtxGsNvo01y4OW93+7XRaQIJ4WOKrPtl
/Z4gVT2OD3rv6p48pMEb3x2pbbRn67bYhUmL2jUgQwjFHrlyyEG4aRjxG8oeIstU94E3FT7bxJlF
6azDzYf4Mbu2s3QQpkncXliYDO/Or2+oL95bi0SGi4As1D19IYlFuzAhSC0aFoch7I/Kg9yIa15s
EQAZpdi12teZCdN6k1E5FnDorwImbxYqWK8cCxTjX3p1BhRDEF+sEvBEN2HGbHl0/qkv5rHBf+Xb
xxGSbVOQerNmkUqpkw0Md40YrheOlt+BuxMRw0oi76GcZF4V6dTokhgDQV9ZrP15Kdc7syd7ZUx7
sqy+oj61gQ2Z7j/Fg0YGwlKdhMprbE+zRJgXMbHZ2+n+b8r/RZd2n7NgE2NozH026PvKSd+fJ31W
vE8yZla6/cz3/rz1lg35AZVPurYa8bFTxtzz+AYFHak8/KV7MxlpbS+rjOoOiK0rVJvIYd62uxs0
0si3sXlqQYmKeOfiOQRB7bikJyoBM2+uudwTBYfZ3HOpg+sI+0vtS7j+zZQiekYBqONCvioN6Eq9
dBvoU4dWi+IMwpmYLVsRTdvVathRDYUYDlocqoraoGfSmf69QPT1ItLS95um8yxAYHLAmpHoEcS5
mfVS8wbbk22qSuNH+xdaEhnmFn/TnKHzhIk2ReSBcmDy9SEh+6/Uhl3kasGetK+qPZ8M7Ck6X3ir
00qrwwAdexll1WnorxyLjp3Izx5IdBja/i+tuKs6cucrvZcS5jmb1HPklw0ZcEcT5XE2c5WCvx5P
z39/cD5OQGiZVNv1pDs//cT439SlweTDKGJKThdE+6JAnhlNIZzyWps1baDHjERoWEcuRfXL6ds3
ZRUW7Q1r2VbR8JLJunKRghWwAu6K2uzCDo8SRh0zFJ5dDPL8Og7suVyyH1MYw3JvzSQI4WSQWJR2
FU59ZbF8WhfaRu0e3tanH29om/06eRMNPo6K/Pj29fT4hiai3OZw8gH75e3u5dvxTR8SQ/tXQY4u
fGpLHwiva9bvhuNqQrqR5lJnskbbLumeJIaTBIiABaqJsbDarzXI0C2t6hBtGVQChj+bL52lifQb
7VBZJO5CkIRu6UMk4oDVcHAgvgJRw1UaEvNDFpt6RIBMTr05krInY5okrzciZI2lJM4gtP7MhGjT
vE9ibtdsq2l1UE4WeIrCKhmCVs8crNf+l5h5eoECa5YWd/Y9S8R0ZWKCYTFTe2ikq9FXJGy+cE36
7jZb+orj3A7AuDArxY3nCHDX+Sai+WcfyMwPParshKWOS6UQgGp9pWGk/9iOpQEG38yVxyl0iU/l
wJRqBI54VsQKLKkGnTm15uBUQfRgNxrT+tpzr4jieufrRq69Q8sLeZo+UzuAgZC5koPk9sAm87RA
t0NeMK4vF9ZAuzjE8ICEakTpHokzb+pemggV+oWlqu8P5lmsTOyTlVBzQ370O/TuJI8YSMbkCBWI
CBV3caLDUHGddz4QWmAVEnNHIEM8Ol738vHuDWScp8sVD7OCHC+wQrjk67jE4DuOJanvU3KdvPos
MWpglqS3lhzmlmguCgvpznlkWLhLciQhNHs//8XyH/DMaIF6ZHFnpKbRwGAEjpGR+aVmZPWVs6gD
YsXMZsta85ctId7lr0IW/1LLZiybuzNiFK6vZ8spNTpLP5wScx0HLbGlGG50JbpP8FP2Hj325Ta/
zkpDhjg//wFy5uWZYdjCDKteDX8p8SuGlhlC9RgVYfnBJpHwlEaslqHxFp6qAju8pQqPYdpHjO9w
GEIJLSTMi1+A1vuN6WaP3eYh2n6qQcRuOJ0cMsG+gdNBmQa0RF6iES11h6xeBexReSmh3goRKbu+
SKrrscERiNBj5QAouQUWRSjE4GAVFuTFPi8tTMyORyCP60alcCXwdB3CWSPM9BooIE/sO6QCKi+0
2qvyNBKzzdy1eUqtSE+bEqw2cOe1IovzvTEWuDL56/nr22T3+8fx5Y/D5NvP4+sb9SjA6mCr2dN2
SJheoeScFsXVXn43RYMkwNA2ogwUn9bCCyRgf6qOncLH8/3fwkL3v+eXvyWnK0MKwooMqTsWUcdU
KZ0pqqrgaibrikiY4TFewljiez5tzKhyOdQuoLLI110qIisUS0gYhfFC9UakobboUjIbQzNlOHe/
+xHCiT3NBngXjubyZ+rhgSToECr74O4GpK88LcIrY9CKUcLOP1/IuHxBkq4LabYOHlqznXK3gFfL
VdBm64IMfSOyaVWHWQnUd6+7jt4en9HH24SDk/Lu25FfHvT+aseqidSaL6Tq+HR+O6IjTmodr2J8
aSyrwlRqqX48vX4jNrAyk/2T8p/tNTR0u8UbqjYPalg7LjAAQUeHRUWIxVCZD+z369vxaVLApP1+
+vFx8oq3ZV+hFcZ3AuFM6enx/A3IaNTzoELrl/Pdw/35icLypvw0Wvxcn1+Sa42tqyAutdt9PTTn
6X+yhsrw+ufdI/qZpXPhelaD3N+cHk/PvzTOoUu6eK+HkHabVHKn65sqviZGVdzU4Sijx7/e7mHV
swfTFey2i/IOhbXL8+SYNCPdCD/SQdawHh1e1RjTJCBSssz3LbfIHQc+AFvv39Ahb0WLC4klSV7T
rkUOWdyuLWoL5Y15cQSCAvfqZiqhAYIuY8YGRK9M2+T/GzuW5bhx3K+45rSH3al0+xH7kAMlUd2M
9TJFuW1fVB6n1+maiZ3yozbz9wuQeoAk5JpDymkA4hMEAZAE7F3AvtJfVqSRDb4dXapWy9ZGFh8T
DbBEeRkv5WZ7C9Lij1e7puaGjU8CAT03LgGN4hJzb8FAr30U/OibG9Gvz6sSdkSqxHgo/JLOrb1L
lAruUXKZEu8f/PCP4hBQ2NeNrhv7FzQ575+Am2E7P7yBfspoElrESql4+vbyfPhGQilWma79G34D
qE9UlUkNc8GGsRJE9FsXoqdWD0m/JIrUmEe2u6O3l/uHw9MjrwHx90owanrRmy0/3Q0bmyanrw7h
hz3VRC2qqjNPAUecu66yJAYIxZY6exHeepfqLCSRucppkk68ZtUU8mYOb2ojuf78a//LC6Y5L+IO
MzpsPl+suZ4h1s+FhZCypJBW0Q0af+GaCj5rC1Um3rUhALiNakjB4uK5HGCDcCvH2xYwKTEGpEoL
Khlx385bX7A5WJ+gstHXDScX0SzqEa8qLyl2leFZ2+0CPrfxqvRtY7ycDHkbhvzJQoByAHsQRD4U
Id1VVxvimbMvtx2w3wldKf/umEMsPeS+ykvTX3s+HQfiDBdbVGrI2GKw8bw96fM2hHmgvMOroVQF
7PwbpPU1piCAIY2FRHr/8N33+edtKtKtjAXq6/792/PRf4E3ZtaY5Z22r3iZblkMbAZFpmk4OYwV
SdtsTxjmn6Zsop8c+znEjTDGi9xtUxRrKYxnIuGfcezmpadaZ6PjeYosuS5U9CY4/JgCQP52eH0+
Pz+9+M/qN4rGh0ON2Mj+5NjzQHi4z8d8QBOf6DP3dMgjOacenACzXsScLrbr/PQftIt/exeQrJZq
P1tsF/X4B5iT5Raf8SZZQMT5XgOSi8U6Lo75IE8+0UKMqaAkbvH7JPSFqd9Eei6FGNXWyID9+cIH
q/UiewAqmCHRpkrx5a948DocsBHBPx2iFLwrhlIssf6IP1uqfJmBRwrOG+t193ipbNbr4BGc+kN1
WavzXofFWSgX8xSRpUh70KX8W6AjIpWgXHBq2kwAylOna78ZFqNrsFTpHccJc6tVUVDtdsRshHTw
qCF4UZmPZTVSKGgr7OcftFVVnR/hzut+EOAuIjKdvlQtryQiTWfy82gfa/cP7y+Ht79jb+3wiGPc
t6RuFewIsPsDArSAjbdtJMMHnMXnFBSZ9eGzEPjdZ1sMC+fePiyESpFpp5W5RYdsa00gAyYLf/d3
pGWaMaLoPmodiDbweQXN66zrtrntbZwVP0VvRPQBCrSooki8oEAxDcqctqHMl4OSiBpZW3faD7+F
t7RUar/FaEsu2BJnmQzXTeYREzTgeYD98tu0S9sJmrwv6cvfP9+eXRa/KV451W4cOWgJrCY7YEWx
8VLZeeB1DJciY4ExaVJcpqrZUr01xMQfbb3XJAQYk2qqYc8wlnDSfaKmL7ZELLX+smliagDGJYCF
wpDqVkSwzA8k7oAyzbgXLwMWJA3wZty8Ab5mChxQeJULk4hZl+YHrLHJV+tzFwPLR1RdwQPjzu5q
fXnVyU5GGPsn41rpMB+wbGe2IK3GdSDe377vn94OD/eYEUw+PeC6wIQ8/ztg2o3X1+eHg0Vl92/3
5CRhaAaNrTR2nIGlW7AvxPpTUxe3qyCN87QMNqpdCjMZ0PBRCynR+pTX3cZRqnXXni1Ey6Q0UBnr
i3ckrbxS11FnJXRVVWpKSpVYR/uP529e/PthYJI0Hqw8iWEm5tXUtEzdCTO2heZCNg/IhmvDjWmZ
cmAv22kRnwRvMQ/U2MHwo7QUnOoySqdSMLVzTbp2lGMqlf3rWzyaOj32H1RTxHIjAG1Wn1ycqoCZ
WZFK2DjgmeyEgXHsDlCMaPYhAypgJFng3+Wm6zJb0VfzBEzfh8/g9ekZ0xxAHC+k/x55fSsWTq1m
fNijiGJNowPN4NNVLPsAfBwDyxhmNnp1wcjOxpXqOPLw87t3UjHJCo7NAdob/rXeSFF1yUKM2pFC
p+xZ5biH17tcMZw1IqKL+COnilKC0h7vgalozfJHrYl5FaEcK2Tyg10tt3850bAVd+KDbacVRSvW
MUeOOwNTZPhAMcTqxt0Fjr4reTtz5BfJ+VtH5K5m52WAzyM8nrePCewi1gKdqfB9UYMsvqsj2PlJ
zL/F3QnTN4Cy138H9F1rpow8+v7p2/OPo+r9xx/7F3e6OuZ1idm5VX3aaP5ewtAfnWzs7YdY/UIM
K8cdhpOgFsNtaoiIgF8VhjOQeCBEjRKi4IJVmdfMeG25jU+0tyXGNwZzA60zc9uQaSLIpkuKgabt
Ep/s5vTTBZjdaM0oMKMk5jjwvMzNZdp+hgFrW3S8TFg3+vuXNzzlBcXKRWV8PTw+3duUyQ/f9w9/
Hp4e6YUi9FH2Bl/cOvtSe+7xGN8Sq2fAyhujBW1v9H1E4WJwnny6OCPWZV1lQt8yjZntOFdcUti3
Cu1kSTPzkKgKC7Pu9nwcm+WUQYkyWuJ9HXrsbm1qGudrPO0DA7pK0U7VdRkcAFCSQlYL2MY+SvWe
EaaYLj4FZvRAqzOfIlYl0l6Zrve/Ol4HP2liMcLGFgNsKJPbJd2YkCxJPksi9E6wsRQcPlF+C888
XSb1f5HAO4VKJsVrJiA6yc2NLwNctge/xwMKJCHK2CBQBkIzGcPvMHcErHxf0FpoJH5B7jIlI5Qr
GeQsS33CtwPELkNuwRz9zR2Cw9/9Db1WNcDsoXLj6bQDRokzTsMYsIKmxpthZtuVCVNYCwKK21cG
dJJ+jUoLcuBN3ew3d/QWAEEUd6VYQNQLcMJ047pkHFc24fa1KEAuSU+Ut3Wq7EUd6LsWnj+rxcUt
yxBkAzx7ix7hGW14BXpJ39rLoRgQxAuvY3GIgCKsS4s2R6dbixNZpnvTn514Kw4xmcKMIb2Xx6Pd
qdoUxCRsN0UfJFbeFHXi/2LW1jSA9lGTt7qLu94IanXWOvM9wNBkhj2UvkJjiIjfslHeUyf4kdPH
M7UNcQIWutE0WUtdmfhFlYWe/6Ly1YK8hMx0cHGqYGKs/U3Gy8BWlMmmJuQYRUT2FSwG770fel0x
89Q8dnZPuty/PO3/Ovp+P27NFvrz5fD09qd92vDtx/71MfYuw5+2tkfamwJ2rmJypH1epLjqlDRf
TqbhHPSHqISTWQM9/LX/z9vhx6A7uBTUDw5O04DPU2nz1aHCxF9Aqqx7q+zQoNjKlLsQmmuwQ+zZ
+JdzML7o8DWw7ErQAkr/RYQUmS0WkPyt4gp24Qy/S+qCPVPGYah3Xrpm1xPP2Q31wIy6hoeEoL/Y
LESlakthvHDdAcZ2ra8r/2XFUF2tU+i7FJd4XoBPLfk7Whj1B7Uhzd1go8kTv3hhA46y/R/vj4+e
Cmj7DgoahjGi9p0rBbGjPAjaOqHGWWUCwJOb5qio1gqzyLH62lwmzGceNqNOvkrPJeWBubSpHj53
ojvowIi1b285tvDJ0GG6VIFOO8sey5XAdKaYsrPuKrNw9kDJ/SGl99sGdisEF6TFnscM8w8bUAGM
FDdpxCw2wgo10Fxd0q3g62t+jQ2JKu3lQVj/ig0lNbfOVoH3SPKi3sWVeGhOqUydPBZVWl/j490U
Q9oz5WyVv0Schw9XwVHx/PDn+08n0rb3T49+lPQ6N3hZqGugJANTUvNzhqh+ixkFjWg99nBnRRPK
clndwVSuP01GR10bTF9XErIGXxLP5SyS9KCSdBIYYyDcXYFcAemS1cR8c5Qge2pv1/fAU0Fz3zH3
7sAEssoWBbUbYuzXpZSNM9WcmYU+6UnUHP3r9efhCf3Ur/8++vH+tv+1h//s3x5+//13+hy7HsOl
bOw2OW3Y9E7Q9XSFi2mPLQH1onCVotbVGXkjIwEyXmAP4TN5wFC7ncPBAqx3jTDcMZCjtK0JVCmE
gbIQ1jaDg9rGJ+IFjO+HFeGIiUZNgtBruW0JMLDptDtZYoqa+xWJUre6YB2B0bPx9BlgEIucYXZr
g05j7BrQVmU2Z98LhZCTdIu9gn9DspNotJRvxg47h7KIZZm2CcuxF/WUp6I5RKolZtxSophfAKQd
t3fSQfU0EtgOQODnS6ON+OBbivHHFEHyqo1f4A8ceTVoDTrSF0a7YehoL7WuNQjnr04jIQKh5ImI
ap3DtvxReUSNtoKP1jLfBRSqCHcuD+kUALtqOM3QL5lR0WwZLlbUVRdMSvj1zL94XY/flKu6cdPh
3WQAKZR3lSvlY6wLuMrSjGmC8mC6XQGuXaVVF+zI0+CIlgSjluBKs5SgWVVUPXI12tvxQfGu4NQX
etYwSbo8p620iXosvecShD8gJwyajqjMhn0jRdl53AEhtXjB+JZlY9C4W2y5V99oWYYVDYSMZRf0
OJ6qmSW4eeL117nZdlw4dRGQoDbkTD1uR42LH+dzVwjDNc9N1jDTXJXDPLeVaIYQMTxitCaCyUhA
OsMcwsZqb0dXdeUpfCNcVLDkBfpk3QfsIY7TF8JZ6qCMRA5jRipu8gjGU0bLJJ68oZncyC6so2iE
jQBh3ETieqLborN5DOHDUszM3CcSxqhcSsxIF8g/p1xqobeqJbqp0Dk0PBEOVoob2uAKv/UZweYZ
7y4UAdsn30QYVnR2YLOwivAF62ivyjLcIq2xAyJcGIEeId3ZG/j8nTTMtMDynBWE1jtzucmIYyj+
1Uda0QzFdqCezVRgiS69wrJkUu6dkfbl068VxaKAVFWHgb1BXcdjpS1o9JPSPzmTugTMFzRhlFF3
dtMjyyZpg5idETHv6bBkolCbqgyShobVZxJf3vSqdWJa0uC7TTrdRNrZTd5zbqE7zS520FnNFjOp
zRIDvsTQPFZYoCq+cI6NKQ8bNFeoR4wl/dqVTQ8qgyz6XAqrMVl7hH0CYjSw/g0sE+64o2wVHkNY
5ylTI+kBSnk0APHNzmW8Mm5KNlqYs12o8EsyNWyTnlTFMRK6uI2fefi6kHusyjexMRkMDBT7f+d2
9PsNRQEA
--===============1174181545663436260==--


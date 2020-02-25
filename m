Content-Type: multipart/mixed; boundary="===============6103226205421187976=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [scsi:misc 53/68] drivers/scsi/qla2xxx/qla_tmpl.c:873:32: sparse: sparse: incorrect type in assignment (different base types)
Date: Wed, 26 Feb 2020 05:09:49 +0800
Message-ID: <202002260548.sgLT96UJ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6103226205421187976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git misc
head:   162e250031cc6caca35738813720e4ed83f1b1bb
commit: a31056ddc6651b457d72d8d71d32143764df86d2 [53/68] scsi: qla2xxx: Use=
 endian macros to assign static fields in fwdump header
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout a31056ddc6651b457d72d8d71d32143764df86d2
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/scsi/qla2xxx/qla_tmpl.c:873:32: sparse: sparse: incorrect type i=
n assignment (different base types)
>> drivers/scsi/qla2xxx/qla_tmpl.c:873:32: sparse:    expected unsigned int=
 [usertype] capture_timestamp
>> drivers/scsi/qla2xxx/qla_tmpl.c:873:32: sparse:    got restricted __le32=
 [usertype]
   drivers/scsi/qla2xxx/qla_tmpl.c:885:29: sparse: sparse: incorrect type i=
n assignment (different base types)
>> drivers/scsi/qla2xxx/qla_tmpl.c:885:29: sparse:    expected unsigned int
   drivers/scsi/qla2xxx/qla_tmpl.c:885:29: sparse:    got restricted __le32=
 [usertype]
   drivers/scsi/qla2xxx/qla_tmpl.c:887:29: sparse: sparse: incorrect type i=
n assignment (different base types)
   drivers/scsi/qla2xxx/qla_tmpl.c:887:29: sparse:    expected unsigned int
   drivers/scsi/qla2xxx/qla_tmpl.c:887:29: sparse:    got restricted __le32=
 [usertype]
   drivers/scsi/qla2xxx/qla_tmpl.c:888:29: sparse: sparse: incorrect type i=
n assignment (different base types)
   drivers/scsi/qla2xxx/qla_tmpl.c:888:29: sparse:    expected unsigned int
   drivers/scsi/qla2xxx/qla_tmpl.c:888:29: sparse:    got restricted __le32=
 [usertype]
   drivers/scsi/qla2xxx/qla_tmpl.c:898:34: sparse: sparse: incorrect type i=
n assignment (different base types)
   drivers/scsi/qla2xxx/qla_tmpl.c:898:34: sparse:    expected unsigned int
   drivers/scsi/qla2xxx/qla_tmpl.c:898:34: sparse:    got restricted __le32=
 [usertype]
   drivers/scsi/qla2xxx/qla_tmpl.c:900:34: sparse: sparse: incorrect type i=
n assignment (different base types)
   drivers/scsi/qla2xxx/qla_tmpl.c:900:34: sparse:    expected unsigned int
   drivers/scsi/qla2xxx/qla_tmpl.c:900:34: sparse:    got restricted __le32=
 [usertype]

vim +873 drivers/scsi/qla2xxx/qla_tmpl.c

   869	=

   870	static void
   871	qla27xx_time_stamp(struct qla27xx_fwdt_template *tmp)
   872	{
 > 873		tmp->capture_timestamp =3D cpu_to_le32(jiffies);
   874	}
   875	=

   876	static void
   877	qla27xx_driver_info(struct qla27xx_fwdt_template *tmp)
   878	{
   879		uint8_t v[] =3D { 0, 0, 0, 0, 0, 0 };
   880	=

   881		WARN_ON_ONCE(sscanf(qla2x00_version_str,
   882				    "%hhu.%hhu.%hhu.%hhu.%hhu.%hhu",
   883				    v+0, v+1, v+2, v+3, v+4, v+5) !=3D 6);
   884	=

 > 885		tmp->driver_info[0] =3D cpu_to_le32(
   886			v[3] << 24 | v[2] << 16 | v[1] << 8 | v[0]);
   887		tmp->driver_info[1] =3D cpu_to_le32(v[5] << 8 | v[4]);
   888		tmp->driver_info[2] =3D __constant_cpu_to_le32(0x12345678);
   889	}
   890	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6103226205421187976==--


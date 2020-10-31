Content-Type: multipart/mixed; boundary="===============6504703220410346766=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v11 09/10] fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile
Date: Sat, 31 Oct 2020 09:23:27 +0800
Message-ID: <202010310907.5Rxaxtib-lkp@intel.com>
In-Reply-To: <20201030150239.3957156-10-almaz.alexandrovich@paragon-software.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6504703220410346766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.10-rc1 next-20201030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Konstantin-Komarov/NTFS-re=
ad-write-driver-GPL-implementation-by-Paragon-Software/20201030-230756
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
07e0887302450a62f51dba72df6afb5fabb23d1c
config: h8300-randconfig-s031-20201030 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-68-g49c98aa3-dirty
        # https://github.com/0day-ci/linux/commit/7c34316b6c7f9af2046f8343d=
3b010c37340ef1d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Konstantin-Komarov/NTFS-read-write=
-driver-GPL-implementation-by-Paragon-Software/20201030-230756
        git checkout 7c34316b6c7f9af2046f8343d3b010c37340ef1d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dh8300 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> fs/ntfs3/frecord.c:569:33: sparse: sparse: cast to restricted __le32
>> fs/ntfs3/frecord.c:569:33: sparse: sparse: cast from restricted __le64
>> fs/ntfs3/frecord.c:569:33: sparse: sparse: cast to restricted __le32
>> fs/ntfs3/frecord.c:569:33: sparse: sparse: cast from restricted __le64
>> fs/ntfs3/frecord.c:569:33: sparse: sparse: cast to restricted __le32
>> fs/ntfs3/frecord.c:569:33: sparse: sparse: cast from restricted __le64
>> fs/ntfs3/frecord.c:569:33: sparse: sparse: cast to restricted __le32
>> fs/ntfs3/frecord.c:569:33: sparse: sparse: cast from restricted __le64
>> fs/ntfs3/frecord.c:569:33: sparse: sparse: cast to restricted __le32
>> fs/ntfs3/frecord.c:569:33: sparse: sparse: cast from restricted __le64
>> fs/ntfs3/frecord.c:569:33: sparse: sparse: cast to restricted __le32
>> fs/ntfs3/frecord.c:569:33: sparse: sparse: cast from restricted __le64

vim +569 fs/ntfs3/frecord.c

cbd4257e6d85149 Konstantin Komarov 2020-10-30  532  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  533  /*
cbd4257e6d85149 Konstantin Komarov 2020-10-30  534   * random write access =
to sparsed or compressed file may result to
cbd4257e6d85149 Konstantin Komarov 2020-10-30  535   * not optimized packed=
 runs.
cbd4257e6d85149 Konstantin Komarov 2020-10-30  536   * Here it is the place=
 to optimize it
cbd4257e6d85149 Konstantin Komarov 2020-10-30  537   */
cbd4257e6d85149 Konstantin Komarov 2020-10-30  538  static int ni_repack(st=
ruct ntfs_inode *ni)
cbd4257e6d85149 Konstantin Komarov 2020-10-30  539  {
cbd4257e6d85149 Konstantin Komarov 2020-10-30  540  	int err =3D 0;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  541  	struct ntfs_sb_info *s=
bi =3D ni->mi.sbi;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  542  	struct mft_inode *mi, =
*mi_p =3D NULL;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  543  	struct ATTRIB *attr =
=3D NULL, *attr_p;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  544  	struct ATTR_LIST_ENTRY=
 *le =3D NULL, *le_p;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  545  	CLST alloc =3D 0;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  546  	u8 cluster_bits =3D sb=
i->cluster_bits;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  547  	CLST svcn, evcn =3D 0,=
 svcn_p, evcn_p, next_svcn;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  548  	u32 roff, rs =3D sbi->=
record_size;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  549  	struct runs_tree run;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  550  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  551  	run_init(&run);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  552  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  553  	while ((attr =3D ni_en=
um_attr_ex(ni, attr, &le))) {
cbd4257e6d85149 Konstantin Komarov 2020-10-30  554  		if (!attr->non_res)
cbd4257e6d85149 Konstantin Komarov 2020-10-30  555  			continue;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  556  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  557  		if (ni_load_mi(ni, le=
, &mi)) {
cbd4257e6d85149 Konstantin Komarov 2020-10-30  558  			err =3D -EINVAL;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  559  			break;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  560  		}
cbd4257e6d85149 Konstantin Komarov 2020-10-30  561  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  562  		svcn =3D le64_to_cpu(=
attr->nres.svcn);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  563  		if (svcn !=3D le64_to=
_cpu(le->vcn)) {
cbd4257e6d85149 Konstantin Komarov 2020-10-30  564  			err =3D -EINVAL;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  565  			break;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  566  		}
cbd4257e6d85149 Konstantin Komarov 2020-10-30  567  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  568  		if (!svcn) {
cbd4257e6d85149 Konstantin Komarov 2020-10-30 @569  			alloc =3D le32_to_cp=
u(attr->nres.alloc_size) >>
cbd4257e6d85149 Konstantin Komarov 2020-10-30  570  				cluster_bits;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  571  			mi_p =3D NULL;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  572  		} else if (svcn !=3D =
evcn + 1) {
cbd4257e6d85149 Konstantin Komarov 2020-10-30  573  			err =3D -EINVAL;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  574  			break;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  575  		}
cbd4257e6d85149 Konstantin Komarov 2020-10-30  576  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  577  		evcn =3D le64_to_cpu(=
attr->nres.evcn);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  578  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  579  		if (svcn > evcn + 1) {
cbd4257e6d85149 Konstantin Komarov 2020-10-30  580  			err =3D -EINVAL;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  581  			break;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  582  		}
cbd4257e6d85149 Konstantin Komarov 2020-10-30  583  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  584  		if (!mi_p) {
cbd4257e6d85149 Konstantin Komarov 2020-10-30  585  			/* do not try if too=
 little free space */
cbd4257e6d85149 Konstantin Komarov 2020-10-30  586  			if (le32_to_cpu(mi->=
mrec->used) + 8 >=3D rs)
cbd4257e6d85149 Konstantin Komarov 2020-10-30  587  				continue;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  588  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  589  			/* do not try if las=
t attribute segment */
cbd4257e6d85149 Konstantin Komarov 2020-10-30  590  			if (evcn + 1 =3D=3D =
alloc)
cbd4257e6d85149 Konstantin Komarov 2020-10-30  591  				continue;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  592  			run_close(&run);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  593  		}
cbd4257e6d85149 Konstantin Komarov 2020-10-30  594  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  595  		roff =3D le16_to_cpu(=
attr->nres.run_off);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  596  		err =3D run_unpack(&r=
un, sbi, ni->mi.rno, svcn, evcn, svcn,
cbd4257e6d85149 Konstantin Komarov 2020-10-30  597  				 Add2Ptr(attr, roff=
),
cbd4257e6d85149 Konstantin Komarov 2020-10-30  598  				 le32_to_cpu(attr->=
size) - roff);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  599  		if (err < 0)
cbd4257e6d85149 Konstantin Komarov 2020-10-30  600  			break;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  601  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  602  		if (!mi_p) {
cbd4257e6d85149 Konstantin Komarov 2020-10-30  603  			mi_p =3D mi;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  604  			attr_p =3D attr;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  605  			svcn_p =3D svcn;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  606  			evcn_p =3D evcn;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  607  			le_p =3D le;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  608  			continue;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  609  		}
cbd4257e6d85149 Konstantin Komarov 2020-10-30  610  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  611  		/*
cbd4257e6d85149 Konstantin Komarov 2020-10-30  612  		 * run contains data =
from two records: mi_p and mi
cbd4257e6d85149 Konstantin Komarov 2020-10-30  613  		 * try to pack in one
cbd4257e6d85149 Konstantin Komarov 2020-10-30  614  		 */
cbd4257e6d85149 Konstantin Komarov 2020-10-30  615  		err =3D mi_pack_runs(=
mi_p, attr_p, &run, evcn + 1 - svcn_p);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  616  		if (err)
cbd4257e6d85149 Konstantin Komarov 2020-10-30  617  			break;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  618  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  619  		next_svcn =3D le64_to=
_cpu(attr_p->nres.evcn) + 1;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  620  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  621  		if (next_svcn >=3D ev=
cn + 1) {
cbd4257e6d85149 Konstantin Komarov 2020-10-30  622  			/* we can remove thi=
s attribute segment */
cbd4257e6d85149 Konstantin Komarov 2020-10-30  623  			al_remove_le(ni, le);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  624  			mi_remove_attr(mi, a=
ttr);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  625  			le =3D le_p;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  626  			continue;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  627  		}
cbd4257e6d85149 Konstantin Komarov 2020-10-30  628  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  629  		attr->nres.svcn =3D l=
e->vcn =3D cpu_to_le64(next_svcn);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  630  		mi->dirty =3D true;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  631  		ni->attr_list.dirty =
=3D true;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  632  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  633  		if (evcn + 1 =3D=3D a=
lloc) {
cbd4257e6d85149 Konstantin Komarov 2020-10-30  634  			err =3D mi_pack_runs=
(mi, attr, &run,
cbd4257e6d85149 Konstantin Komarov 2020-10-30  635  					   evcn + 1 - next=
_svcn);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  636  			if (err)
cbd4257e6d85149 Konstantin Komarov 2020-10-30  637  				break;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  638  			mi_p =3D NULL;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  639  		} else {
cbd4257e6d85149 Konstantin Komarov 2020-10-30  640  			mi_p =3D mi;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  641  			attr_p =3D attr;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  642  			svcn_p =3D next_svcn;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  643  			evcn_p =3D evcn;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  644  			le_p =3D le;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  645  			run_truncate_head(&r=
un, next_svcn);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  646  		}
cbd4257e6d85149 Konstantin Komarov 2020-10-30  647  	}
cbd4257e6d85149 Konstantin Komarov 2020-10-30  648  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  649  	if (err) {
cbd4257e6d85149 Konstantin Komarov 2020-10-30  650  		ntfs_inode_warn(&ni->=
vfs_inode, "there is a problem");
cbd4257e6d85149 Konstantin Komarov 2020-10-30  651  		ntfs_set_state(sbi, N=
TFS_DIRTY_ERROR);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  652  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  653  		/* Pack loaded but no=
t packed runs */
cbd4257e6d85149 Konstantin Komarov 2020-10-30  654  		if (mi_p)
cbd4257e6d85149 Konstantin Komarov 2020-10-30  655  			mi_pack_runs(mi_p, a=
ttr_p, &run, evcn_p + 1 - svcn_p);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  656  	}
cbd4257e6d85149 Konstantin Komarov 2020-10-30  657  =

cbd4257e6d85149 Konstantin Komarov 2020-10-30  658  	run_close(&run);
cbd4257e6d85149 Konstantin Komarov 2020-10-30  659  	return err;
cbd4257e6d85149 Konstantin Komarov 2020-10-30  660  }
cbd4257e6d85149 Konstantin Komarov 2020-10-30  661  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6504703220410346766==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
aqklDqVNIe/s2WNZZwtt7f8Ai90hRHYFAQA=
--===============6504703220410346766==--


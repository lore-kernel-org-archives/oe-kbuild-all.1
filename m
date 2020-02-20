Content-Type: multipart/mixed; boundary="===============0620067437939627952=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [ext4:fix-bz-206443 5/6] fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
Date: Fri, 21 Feb 2020 06:41:05 +0800
Message-ID: <202002210600.Z8rZrCyX%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0620067437939627952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git fix-=
bz-206443
head:   c20bac9bf82cd6560d269aa1e885e036d9e418b3
commit: 08999c46de7867f694b25689f2432f0861f4d33f [5/6] ext4: fix potential =
race between s_group_info online resizing and access
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout 08999c46de7867f694b25689f2432f0861f4d33f
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
--
   fs/ext4/balloc.c:284:16: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/ext4/balloc.c:284:16: sparse:    struct buffer_head *[noderef] <asn:4=
> *
   fs/ext4/balloc.c:284:16: sparse:    struct buffer_head **
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
--
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
--
>> fs/ext4/mballoc.c:2377:9: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
>> fs/ext4/mballoc.c:2377:9: sparse:    struct ext4_group_info **[noderef] =
<asn:4> *
>> fs/ext4/mballoc.c:2377:9: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
>> fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
>> fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***

vim +3002 fs/ext4/ext4.h

  2992	=

  2993	static inline
  2994	struct ext4_group_info *ext4_get_group_info(struct super_block *sb,
  2995						    ext4_group_t group)
  2996	{
  2997		 struct ext4_group_info **grp_info;
  2998		 long indexv, indexh;
  2999		 BUG_ON(group >=3D EXT4_SB(sb)->s_groups_count);
  3000		 indexv =3D group >> (EXT4_DESC_PER_BLOCK_BITS(sb));
  3001		 indexh =3D group & ((EXT4_DESC_PER_BLOCK(sb)) - 1);
> 3002		 grp_info =3D sbi_array_rcu_deref(EXT4_SB(sb), s_group_info, indexv=
);
  3003		 return grp_info[indexh];
  3004	}
  3005	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0620067437939627952==--


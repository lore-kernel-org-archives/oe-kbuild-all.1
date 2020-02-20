Content-Type: multipart/mixed; boundary="===============0014646297785443763=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [ext4:fix-bz-206443 3/6] fs/ext4/balloc.c:285:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
Date: Fri, 21 Feb 2020 01:31:32 +0800
Message-ID: <202002210111.FeIR4Px6%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0014646297785443763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git fix-=
bz-206443
head:   c20bac9bf82cd6560d269aa1e885e036d9e418b3
commit: cd19e90e29ccc914b52eeb53afef676edaac911c [3/6] ext4: fix potential =
race between online resizing and write operations
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout cd19e90e29ccc914b52eeb53afef676edaac911c
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/ext4/balloc.c:285:16: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
>> fs/ext4/balloc.c:285:16: sparse:    struct buffer_head *[noderef] <asn:4=
> *
>> fs/ext4/balloc.c:285:16: sparse:    struct buffer_head **
--
>> fs/ext4/resize.c:894:9: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/resize.c:894:9: sparse:    struct buffer_head *[noderef] <asn:4>=
 *
>> fs/ext4/resize.c:894:9: sparse:    struct buffer_head **
   fs/ext4/resize.c:952:9: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/resize.c:952:9: sparse:    struct buffer_head *[noderef] <asn:4>=
 *
   fs/ext4/resize.c:952:9: sparse:    struct buffer_head **

vim +285 fs/ext4/balloc.c

   245	=

   246	/*
   247	 * The free blocks are managed by bitmaps.  A file system contains s=
everal
   248	 * blocks groups.  Each group contains 1 bitmap block for blocks, 1 =
bitmap
   249	 * block for inodes, N blocks for the inode table and data blocks.
   250	 *
   251	 * The file system contains group descriptors which are located afte=
r the
   252	 * super block.  Each descriptor contains the number of the bitmap b=
lock and
   253	 * the free blocks count in the block.  The descriptors are loaded i=
n memory
   254	 * when a file system is mounted (see ext4_fill_super).
   255	 */
   256	=

   257	/**
   258	 * ext4_get_group_desc() -- load group descriptor from disk
   259	 * @sb:			super block
   260	 * @block_group:	given block group
   261	 * @bh:			pointer to the buffer head to store the block
   262	 *			group descriptor
   263	 */
   264	struct ext4_group_desc * ext4_get_group_desc(struct super_block *sb,
   265						     ext4_group_t block_group,
   266						     struct buffer_head **bh)
   267	{
   268		unsigned int group_desc;
   269		unsigned int offset;
   270		ext4_group_t ngroups =3D ext4_get_groups_count(sb);
   271		struct ext4_group_desc *desc;
   272		struct ext4_sb_info *sbi =3D EXT4_SB(sb);
   273		struct buffer_head *bh_p;
   274	=

   275		if (block_group >=3D ngroups) {
   276			ext4_error(sb, "block_group >=3D groups_count - block_group =3D %u=
,"
   277				   " groups_count =3D %u", block_group, ngroups);
   278	=

   279			return NULL;
   280		}
   281	=

   282		group_desc =3D block_group >> EXT4_DESC_PER_BLOCK_BITS(sb);
   283		offset =3D block_group & (EXT4_DESC_PER_BLOCK(sb) - 1);
   284		rcu_read_lock();
 > 285		bh_p =3D rcu_dereference(sbi->s_group_desc)[group_desc];
   286		/*
   287		 * We can unlock here since the pointer being dereferenced won't be
   288		 * dereferenced again. By looking at the usage in add_new_gdb() the
   289		 * value isn't modified, just the pointer, and so it remains valid.
   290		 */
   291		rcu_read_unlock();
   292		if (!bh_p) {
   293			ext4_error(sb, "Group descriptor not loaded - "
   294				   "block_group =3D %u, group_desc =3D %u, desc =3D %u",
   295				   block_group, group_desc, offset);
   296			return NULL;
   297		}
   298	=

   299		desc =3D (struct ext4_group_desc *)(
   300			(__u8 *)bh_p->b_data +
   301			offset * EXT4_DESC_SIZE(sb));
   302		if (bh)
   303			*bh =3D bh_p;
   304		return desc;
   305	}
   306	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0014646297785443763==--


Content-Type: multipart/mixed; boundary="===============0575570486921214626=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [ext4:fix-bz-206443 6/6] fs/ext4/ialloc.c:333:29: sparse: sparse: incompatible types in comparison expression (different address spaces):
Date: Fri, 21 Feb 2020 07:38:48 +0800
Message-ID: <202002210743.YkEaPRvg%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0575570486921214626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git fix-=
bz-206443
head:   c20bac9bf82cd6560d269aa1e885e036d9e418b3
commit: c20bac9bf82cd6560d269aa1e885e036d9e418b3 [6/6] ext4: fix potential =
race between s_flex_groups online resizing and access
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout c20bac9bf82cd6560d269aa1e885e036d9e418b3
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/ext4/ialloc.c:333:29: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
>> fs/ext4/ialloc.c:333:29: sparse:    struct flex_groups *[noderef] <asn:4=
> *
>> fs/ext4/ialloc.c:333:29: sparse:    struct flex_groups **
   fs/ext4/ialloc.c:336:37: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/ext4/ialloc.c:336:37: sparse:    struct flex_groups *[noderef] <asn:4=
> *
   fs/ext4/ialloc.c:336:37: sparse:    struct flex_groups **
   fs/ext4/ialloc.c:373:42: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
   fs/ext4/ialloc.c:373:42: sparse:    struct flex_groups *[noderef] <asn:4=
> *
   fs/ext4/ialloc.c:373:42: sparse:    struct flex_groups **
   fs/ext4/ialloc.c:1060:37: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/ext4/ialloc.c:1060:37: sparse:    struct flex_groups *[noderef] <asn:=
4> *
   fs/ext4/ialloc.c:1060:37: sparse:    struct flex_groups **
   fs/ext4/ialloc.c:1084:29: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/ext4/ialloc.c:1084:29: sparse:    struct flex_groups *[noderef] <asn:=
4> *
   fs/ext4/ialloc.c:1084:29: sparse:    struct flex_groups **
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
--
   fs/ext4/mballoc.c:2377:9: sparse: sparse: incompatible types in comparis=
on expression (different address spaces):
   fs/ext4/mballoc.c:2377:9: sparse:    struct ext4_group_info **[noderef] =
<asn:4> *
   fs/ext4/mballoc.c:2377:9: sparse:    struct ext4_group_info ***
   fs/ext4/mballoc.c:3025:31: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
>> fs/ext4/mballoc.c:3025:31: sparse:    struct flex_groups *[noderef] <asn=
:4> *
>> fs/ext4/mballoc.c:3025:31: sparse:    struct flex_groups **
   fs/ext4/mballoc.c:4924:31: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/ext4/mballoc.c:4924:31: sparse:    struct flex_groups *[noderef] <asn=
:4> *
   fs/ext4/mballoc.c:4924:31: sparse:    struct flex_groups **
   fs/ext4/mballoc.c:5082:31: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   fs/ext4/mballoc.c:5082:31: sparse:    struct flex_groups *[noderef] <asn=
:4> *
   fs/ext4/mballoc.c:5082:31: sparse:    struct flex_groups **
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***
--
>> fs/ext4/super.c:2422:9: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
>> fs/ext4/super.c:2422:9: sparse:    struct flex_groups *[noderef] <asn:4>=
 *
>> fs/ext4/super.c:2422:9: sparse:    struct flex_groups **
   fs/ext4/ext4.h:3002:21: sparse: sparse: incompatible types in comparison=
 expression (different address spaces):
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info **[noderef] <a=
sn:4> *
   fs/ext4/ext4.h:3002:21: sparse:    struct ext4_group_info ***

vim +333 fs/ext4/ialloc.c

   217	=

   218	/*
   219	 * NOTE! When we get the inode, we're the only people
   220	 * that have access to it, and as such there are no
   221	 * race conditions we have to worry about. The inode
   222	 * is not on the hash-lists, and it cannot be reached
   223	 * through the filesystem because the directory entry
   224	 * has been deleted earlier.
   225	 *
   226	 * HOWEVER: we must make sure that we get no aliases,
   227	 * which means that we have to call "clear_inode()"
   228	 * _before_ we mark the inode not in use in the inode
   229	 * bitmaps. Otherwise a newly created file might use
   230	 * the same inode number (not actually the same pointer
   231	 * though), and then we'd have two inodes sharing the
   232	 * same inode number and space on the harddisk.
   233	 */
   234	void ext4_free_inode(handle_t *handle, struct inode *inode)
   235	{
   236		struct super_block *sb =3D inode->i_sb;
   237		int is_directory;
   238		unsigned long ino;
   239		struct buffer_head *bitmap_bh =3D NULL;
   240		struct buffer_head *bh2;
   241		ext4_group_t block_group;
   242		unsigned long bit;
   243		struct ext4_group_desc *gdp;
   244		struct ext4_super_block *es;
   245		struct ext4_sb_info *sbi;
   246		int fatal =3D 0, err, count, cleared;
   247		struct ext4_group_info *grp;
   248	=

   249		if (!sb) {
   250			printk(KERN_ERR "EXT4-fs: %s:%d: inode on "
   251			       "nonexistent device\n", __func__, __LINE__);
   252			return;
   253		}
   254		if (atomic_read(&inode->i_count) > 1) {
   255			ext4_msg(sb, KERN_ERR, "%s:%d: inode #%lu: count=3D%d",
   256				 __func__, __LINE__, inode->i_ino,
   257				 atomic_read(&inode->i_count));
   258			return;
   259		}
   260		if (inode->i_nlink) {
   261			ext4_msg(sb, KERN_ERR, "%s:%d: inode #%lu: nlink=3D%d\n",
   262				 __func__, __LINE__, inode->i_ino, inode->i_nlink);
   263			return;
   264		}
   265		sbi =3D EXT4_SB(sb);
   266	=

   267		ino =3D inode->i_ino;
   268		ext4_debug("freeing inode %lu\n", ino);
   269		trace_ext4_free_inode(inode);
   270	=

   271		dquot_initialize(inode);
   272		dquot_free_inode(inode);
   273	=

   274		is_directory =3D S_ISDIR(inode->i_mode);
   275	=

   276		/* Do this BEFORE marking the inode not in use or returning an erro=
r */
   277		ext4_clear_inode(inode);
   278	=

   279		es =3D sbi->s_es;
   280		if (ino < EXT4_FIRST_INO(sb) || ino > le32_to_cpu(es->s_inodes_coun=
t)) {
   281			ext4_error(sb, "reserved or nonexistent inode %lu", ino);
   282			goto error_return;
   283		}
   284		block_group =3D (ino - 1) / EXT4_INODES_PER_GROUP(sb);
   285		bit =3D (ino - 1) % EXT4_INODES_PER_GROUP(sb);
   286		bitmap_bh =3D ext4_read_inode_bitmap(sb, block_group);
   287		/* Don't bother if the inode bitmap is corrupt. */
   288		grp =3D ext4_get_group_info(sb, block_group);
   289		if (IS_ERR(bitmap_bh)) {
   290			fatal =3D PTR_ERR(bitmap_bh);
   291			bitmap_bh =3D NULL;
   292			goto error_return;
   293		}
   294		if (unlikely(EXT4_MB_GRP_IBITMAP_CORRUPT(grp))) {
   295			fatal =3D -EFSCORRUPTED;
   296			goto error_return;
   297		}
   298	=

   299		BUFFER_TRACE(bitmap_bh, "get_write_access");
   300		fatal =3D ext4_journal_get_write_access(handle, bitmap_bh);
   301		if (fatal)
   302			goto error_return;
   303	=

   304		fatal =3D -ESRCH;
   305		gdp =3D ext4_get_group_desc(sb, block_group, &bh2);
   306		if (gdp) {
   307			BUFFER_TRACE(bh2, "get_write_access");
   308			fatal =3D ext4_journal_get_write_access(handle, bh2);
   309		}
   310		ext4_lock_group(sb, block_group);
   311		cleared =3D ext4_test_and_clear_bit(bit, bitmap_bh->b_data);
   312		if (fatal || !cleared) {
   313			ext4_unlock_group(sb, block_group);
   314			goto out;
   315		}
   316	=

   317		count =3D ext4_free_inodes_count(sb, gdp) + 1;
   318		ext4_free_inodes_set(sb, gdp, count);
   319		if (is_directory) {
   320			count =3D ext4_used_dirs_count(sb, gdp) - 1;
   321			ext4_used_dirs_set(sb, gdp, count);
   322			percpu_counter_dec(&sbi->s_dirs_counter);
   323		}
   324		ext4_inode_bitmap_csum_set(sb, block_group, gdp, bitmap_bh,
   325					   EXT4_INODES_PER_GROUP(sb) / 8);
   326		ext4_group_desc_csum_set(sb, block_group, gdp);
   327		ext4_unlock_group(sb, block_group);
   328	=

   329		percpu_counter_inc(&sbi->s_freeinodes_counter);
   330		if (sbi->s_log_groups_per_flex) {
   331			ext4_group_t f =3D ext4_flex_group(sbi, block_group);
   332	=

 > 333			atomic_inc(&sbi_array_rcu_deref(sbi, s_flex_groups,
   334							f)->free_inodes);
   335			if (is_directory)
   336				atomic_dec(&sbi_array_rcu_deref(sbi, s_flex_groups,
   337								f)->used_dirs);
   338		}
   339		BUFFER_TRACE(bh2, "call ext4_handle_dirty_metadata");
   340		fatal =3D ext4_handle_dirty_metadata(handle, NULL, bh2);
   341	out:
   342		if (cleared) {
   343			BUFFER_TRACE(bitmap_bh, "call ext4_handle_dirty_metadata");
   344			err =3D ext4_handle_dirty_metadata(handle, NULL, bitmap_bh);
   345			if (!fatal)
   346				fatal =3D err;
   347		} else {
   348			ext4_error(sb, "bit already cleared for inode %lu", ino);
   349			ext4_mark_group_bitmap_corrupted(sb, block_group,
   350						EXT4_GROUP_INFO_IBITMAP_CORRUPT);
   351		}
   352	=

   353	error_return:
   354		brelse(bitmap_bh);
   355		ext4_std_error(sb, fatal);
   356	}
   357	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0575570486921214626==--


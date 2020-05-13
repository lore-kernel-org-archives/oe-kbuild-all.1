Content-Type: multipart/mixed; boundary="===============2227480498020261264=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [android-common:android-mainline 1/1] fs/incfs/data_mgmt.c:428 validate_hash_tree() warn: unsigned 'read_res' is never less than zero.
Date: Wed, 13 May 2020 21:41:03 +0800
Message-ID: <202005132100.iKnYfj3u%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2227480498020261264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   ab185e45f637ba0b0239268f1130890c8837981d
commit: ab185e45f637ba0b0239268f1130890c8837981d [1/1] ANDROID: Incremental=
 fs: Avoid continually recalculating hashes

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

New smatch warnings:
fs/incfs/data_mgmt.c:428 validate_hash_tree() warn: unsigned 'read_res' is =
never less than zero.

Old smatch warnings:
fs/incfs/data_mgmt.c:172 incfs_open_data_file() error: we previously assume=
d 'df' could be null (see line 141)
fs/incfs/data_mgmt.h:315 get_incfs_node() warn: always true condition '(ino=
de->i_sb->s_magic !=3D (357661101641)) =3D> (0-u32max !=3D 357661101641)'
fs/incfs/data_mgmt.c:1101 incfs_process_new_hash_block() error: double unlo=
cked 'bfc->bc_mutex' (orig line 1096)

vim +/read_res +428 fs/incfs/data_mgmt.c

c6819dd77861f2 Eugene Zemtsov 2019-11-18  368  =

c6819dd77861f2 Eugene Zemtsov 2019-11-18  369  static int validate_hash_tre=
e(struct file *bf, struct data_file *df,
ab185e45f637ba Paul Lawrence  2020-05-07  370  			      int block_index, st=
ruct mem_range data,
ab185e45f637ba Paul Lawrence  2020-05-07  371  			      u8 *tmp_buf)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  372  {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  373  	u8 digest[INCFS_MAX_HASH_SI=
ZE] =3D {};
c6819dd77861f2 Eugene Zemtsov 2019-11-18  374  	struct mtree *tree =3D NULL;
bc6a70e849cccf Paul Lawrence  2020-03-13  375  	struct incfs_df_signature *=
sig =3D NULL;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  376  	struct mem_range calc_diges=
t_rng;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  377  	struct mem_range saved_dige=
st_rng;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  378  	struct mem_range root_hash_=
rng;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  379  	int digest_size;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  380  	int hash_block_index =3D bl=
ock_index;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  381  	int hash_per_block;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  382  	int lvl =3D 0;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  383  	int res;
ab185e45f637ba Paul Lawrence  2020-05-07  384  	struct page *saved_page =3D=
 NULL;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  385  =

c6819dd77861f2 Eugene Zemtsov 2019-11-18  386  	tree =3D df->df_hash_tree;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  387  	sig =3D df->df_signature;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  388  	if (!tree || !sig)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  389  		return 0;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  390  =

c6819dd77861f2 Eugene Zemtsov 2019-11-18  391  	digest_size =3D tree->alg->=
digest_size;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  392  	hash_per_block =3D INCFS_DA=
TA_FILE_BLOCK_SIZE / digest_size;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  393  	calc_digest_rng =3D range(d=
igest, digest_size);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  394  	res =3D incfs_calc_digest(t=
ree->alg, data, calc_digest_rng);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  395  	if (res)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  396  		return res;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  397  =

c6819dd77861f2 Eugene Zemtsov 2019-11-18  398  	for (lvl =3D 0; lvl < tree-=
>depth; lvl++) {
bc6a70e849cccf Paul Lawrence  2020-03-13  399  		loff_t lvl_off =3D
bc6a70e849cccf Paul Lawrence  2020-03-13  400  			tree->hash_level_suboffse=
t[lvl] + sig->hash_offset;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  401  		loff_t hash_block_off =3D =
lvl_off +
c6819dd77861f2 Eugene Zemtsov 2019-11-18  402  			round_down(hash_block_ind=
ex * digest_size,
c6819dd77861f2 Eugene Zemtsov 2019-11-18  403  				INCFS_DATA_FILE_BLOCK_SI=
ZE);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  404  		size_t hash_off_in_block =
=3D hash_block_index * digest_size
c6819dd77861f2 Eugene Zemtsov 2019-11-18  405  			% INCFS_DATA_FILE_BLOCK_S=
IZE;
ab185e45f637ba Paul Lawrence  2020-05-07  406  		struct mem_range buf_range;
ab185e45f637ba Paul Lawrence  2020-05-07  407  		struct page *page =3D NULL;
ab185e45f637ba Paul Lawrence  2020-05-07  408  		bool aligned =3D (hash_blo=
ck_off &
ab185e45f637ba Paul Lawrence  2020-05-07  409  				(INCFS_DATA_FILE_BLOCK_S=
IZE - 1)) =3D=3D 0;
ab185e45f637ba Paul Lawrence  2020-05-07  410  		u8 *actual_buf;
ab185e45f637ba Paul Lawrence  2020-05-07  411  =

ab185e45f637ba Paul Lawrence  2020-05-07  412  		if (aligned) {
ab185e45f637ba Paul Lawrence  2020-05-07  413  			page =3D read_mapping_pag=
e(
ab185e45f637ba Paul Lawrence  2020-05-07  414  				bf->f_inode->i_mapping,
ab185e45f637ba Paul Lawrence  2020-05-07  415  				hash_block_off / INCFS_D=
ATA_FILE_BLOCK_SIZE,
ab185e45f637ba Paul Lawrence  2020-05-07  416  				NULL);
ab185e45f637ba Paul Lawrence  2020-05-07  417  =

ab185e45f637ba Paul Lawrence  2020-05-07  418  			if (IS_ERR(page))
ab185e45f637ba Paul Lawrence  2020-05-07  419  				return PTR_ERR(page);
ab185e45f637ba Paul Lawrence  2020-05-07  420  =

ab185e45f637ba Paul Lawrence  2020-05-07  421  			actual_buf =3D page_addre=
ss(page);
ab185e45f637ba Paul Lawrence  2020-05-07  422  		} else {
ab185e45f637ba Paul Lawrence  2020-05-07  423  			size_t read_res =3D
ab185e45f637ba Paul Lawrence  2020-05-07  424  				incfs_kread(bf, tmp_buf,
ab185e45f637ba Paul Lawrence  2020-05-07  425  					    INCFS_DATA_FILE_BLO=
CK_SIZE,
ab185e45f637ba Paul Lawrence  2020-05-07  426  					    hash_block_off);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  427  =

c6819dd77861f2 Eugene Zemtsov 2019-11-18 @428  			if (read_res < 0)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  429  				return read_res;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  430  			if (read_res !=3D INCFS_D=
ATA_FILE_BLOCK_SIZE)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  431  				return -EIO;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  432  =

ab185e45f637ba Paul Lawrence  2020-05-07  433  			actual_buf =3D tmp_buf;
ab185e45f637ba Paul Lawrence  2020-05-07  434  		}
ab185e45f637ba Paul Lawrence  2020-05-07  435  =

ab185e45f637ba Paul Lawrence  2020-05-07  436  		buf_range =3D range(actual=
_buf, INCFS_DATA_FILE_BLOCK_SIZE);
ab185e45f637ba Paul Lawrence  2020-05-07  437  		saved_digest_rng =3D
ab185e45f637ba Paul Lawrence  2020-05-07  438  			range(actual_buf + hash_o=
ff_in_block, digest_size);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  439  		if (!incfs_equal_ranges(ca=
lc_digest_rng, saved_digest_rng)) {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  440  			int i;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  441  			bool zero =3D true;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  442  =

c6819dd77861f2 Eugene Zemtsov 2019-11-18  443  			pr_debug("incfs: Hash mis=
match lvl:%d blk:%d\n",
c6819dd77861f2 Eugene Zemtsov 2019-11-18  444  				lvl, block_index);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  445  			for (i =3D 0; i < saved_d=
igest_rng.len; ++i)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  446  				if (saved_digest_rng.dat=
a[i]) {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  447  					zero =3D false;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  448  					break;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  449  				}
c6819dd77861f2 Eugene Zemtsov 2019-11-18  450  =

c6819dd77861f2 Eugene Zemtsov 2019-11-18  451  			if (zero)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  452  				pr_debug("incfs: Note sa=
ved_digest all zero - did you forget to load the hashes?\n");
ab185e45f637ba Paul Lawrence  2020-05-07  453  =

ab185e45f637ba Paul Lawrence  2020-05-07  454  			if (saved_page)
ab185e45f637ba Paul Lawrence  2020-05-07  455  				put_page(saved_page);
ab185e45f637ba Paul Lawrence  2020-05-07  456  			if (page)
ab185e45f637ba Paul Lawrence  2020-05-07  457  				put_page(page);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  458  			return -EBADMSG;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  459  		}
c6819dd77861f2 Eugene Zemtsov 2019-11-18  460  =

ab185e45f637ba Paul Lawrence  2020-05-07  461  		if (saved_page) {
ab185e45f637ba Paul Lawrence  2020-05-07  462  			/*
ab185e45f637ba Paul Lawrence  2020-05-07  463  			 * This is something of a=
 kludge. The PageChecked flag
ab185e45f637ba Paul Lawrence  2020-05-07  464  			 * is reserved for the fi=
le system, but we are setting
ab185e45f637ba Paul Lawrence  2020-05-07  465  			 * this on the pages belo=
nging to the underlying file
ab185e45f637ba Paul Lawrence  2020-05-07  466  			 * system. incfs is only =
going to be used on f2fs and
ab185e45f637ba Paul Lawrence  2020-05-07  467  			 * ext4 which only use th=
is flag when fs-verity is being
ab185e45f637ba Paul Lawrence  2020-05-07  468  			 * used, so this is safe =
for now, however a better
ab185e45f637ba Paul Lawrence  2020-05-07  469  			 * mechanism needs to be =
found.
ab185e45f637ba Paul Lawrence  2020-05-07  470  			 */
ab185e45f637ba Paul Lawrence  2020-05-07  471  			SetPageChecked(saved_page=
);
ab185e45f637ba Paul Lawrence  2020-05-07  472  			put_page(saved_page);
ab185e45f637ba Paul Lawrence  2020-05-07  473  			saved_page =3D NULL;
ab185e45f637ba Paul Lawrence  2020-05-07  474  		}
ab185e45f637ba Paul Lawrence  2020-05-07  475  =

ab185e45f637ba Paul Lawrence  2020-05-07  476  		if (page && PageChecked(pa=
ge)) {
ab185e45f637ba Paul Lawrence  2020-05-07  477  			put_page(page);
ab185e45f637ba Paul Lawrence  2020-05-07  478  			return 0;
ab185e45f637ba Paul Lawrence  2020-05-07  479  		}
ab185e45f637ba Paul Lawrence  2020-05-07  480  =

ab185e45f637ba Paul Lawrence  2020-05-07  481  		saved_page =3D page;
ab185e45f637ba Paul Lawrence  2020-05-07  482  		page =3D NULL;
ab185e45f637ba Paul Lawrence  2020-05-07  483  =

c6819dd77861f2 Eugene Zemtsov 2019-11-18  484  		res =3D incfs_calc_digest(=
tree->alg, buf_range, calc_digest_rng);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  485  		if (res)
c6819dd77861f2 Eugene Zemtsov 2019-11-18  486  			return res;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  487  		hash_block_index /=3D hash=
_per_block;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  488  	}
c6819dd77861f2 Eugene Zemtsov 2019-11-18  489  =

c6819dd77861f2 Eugene Zemtsov 2019-11-18  490  	root_hash_rng =3D range(tre=
e->root_hash, digest_size);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  491  	if (!incfs_equal_ranges(cal=
c_digest_rng, root_hash_rng)) {
c6819dd77861f2 Eugene Zemtsov 2019-11-18  492  		pr_debug("incfs: Root hash=
 mismatch blk:%d\n", block_index);
ab185e45f637ba Paul Lawrence  2020-05-07  493  		if (saved_page)
ab185e45f637ba Paul Lawrence  2020-05-07  494  			put_page(saved_page);
c6819dd77861f2 Eugene Zemtsov 2019-11-18  495  		return -EBADMSG;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  496  	}
ab185e45f637ba Paul Lawrence  2020-05-07  497  =

ab185e45f637ba Paul Lawrence  2020-05-07  498  	if (saved_page) {
ab185e45f637ba Paul Lawrence  2020-05-07  499  		SetPageChecked(saved_page);
ab185e45f637ba Paul Lawrence  2020-05-07  500  		put_page(saved_page);
ab185e45f637ba Paul Lawrence  2020-05-07  501  	}
c6819dd77861f2 Eugene Zemtsov 2019-11-18  502  	return 0;
c6819dd77861f2 Eugene Zemtsov 2019-11-18  503  }
c6819dd77861f2 Eugene Zemtsov 2019-11-18  504  =


:::::: The code at line 428 was first introduced by commit
:::::: c6819dd77861f22858a4371f755c7d5422920eeb ANDROID: Initial commit of =
Incremental FS

:::::: TO: Eugene Zemtsov <ezemtsov@google.com>
:::::: CC: Alistair Delva <adelva@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2227480498020261264==--


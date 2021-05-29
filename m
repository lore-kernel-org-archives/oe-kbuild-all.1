Content-Type: multipart/mixed; boundary="===============5361218461752841957=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: fs/ext4/dir.c:126:12: warning: stack frame size of 2096 bytes in function 'ext4_readdir'
Date: Sat, 29 May 2021 14:15:19 +0800
Message-ID: <202105291411.ygMZz3Hl-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5361218461752841957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6799d4f2da496cab9b3fd26283a8ce3639b1a88d
commit: 471fbbea7ff7061b2d6474665cb5a2ceb4fd6500 ext4: handle casefolding w=
ith encryption
date:   8 weeks ago
config: powerpc64-randconfig-r036-20210529 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project bc6799=
f2f79f0ae87e9f1ebf9d25ba799fbd25a9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D471fbbea7ff7061b2d6474665cb5a2ceb4fd6500
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 471fbbea7ff7061b2d6474665cb5a2ceb4fd6500
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:199:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_in=
sw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/ext4/dir.c:26:
   In file included from include/linux/buffer_head.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:201:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_in=
sl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/ext4/dir.c:26:
   In file included from include/linux/buffer_head.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:203:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_ou=
tsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/ext4/dir.c:26:
   In file included from include/linux/buffer_head.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:205:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_ou=
tsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/ext4/dir.c:26:
   In file included from include/linux/buffer_head.h:14:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:207:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_ou=
tsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> fs/ext4/dir.c:126:12: warning: stack frame size of 2096 bytes in functio=
n 'ext4_readdir' [-Wframe-larger-than=3D]
   static int ext4_readdir(struct file *file, struct dir_context *ctx)
              ^
   14 warnings generated.


vim +/ext4_readdir +126 fs/ext4/dir.c

ac27a0ec112a08 Dave Kleikamp       2006-10-11  125  =

725bebb27882ae Al Viro             2013-05-17 @126  static int ext4_readdir=
(struct file *file, struct dir_context *ctx)
ac27a0ec112a08 Dave Kleikamp       2006-10-11  127  {
498e5f24158da7 Theodore Ts'o       2008-11-05  128  	unsigned int offset;
aa13d5f67c6f5f Giedrius Rekasius   2014-05-27  129  	int i;
617ba13b31fbf5 Mingming Cao        2006-10-11  130  	struct ext4_dir_entry_=
2 *de;
ac27a0ec112a08 Dave Kleikamp       2006-10-11  131  	int err;
725bebb27882ae Al Viro             2013-05-17  132  	struct inode *inode =
=3D file_inode(file);
d1f5273e9adb40 Fan Yong            2012-03-18  133  	struct super_block *sb=
 =3D inode->i_sb;
4461471107b79b Michael Halcrow     2015-04-12  134  	struct buffer_head *bh=
 =3D NULL;
a7550b30ab709f Jaegeuk Kim         2016-07-10  135  	struct fscrypt_str fst=
r =3D FSTR_INIT(NULL, 0);
ac27a0ec112a08 Dave Kleikamp       2006-10-11  136  =

ec0caa974cd092 Eric Biggers        2020-12-02  137  	err =3D fscrypt_prepar=
e_readdir(inode);
3b1ada55b905f3 Eric Biggers        2019-12-09  138  	if (err)
28b4c263961c47 Theodore Ts'o       2016-02-07  139  		return err;
28b4c263961c47 Theodore Ts'o       2016-02-07  140  =

d1f5273e9adb40 Fan Yong            2012-03-18  141  	if (is_dx_dir(inode)) {
725bebb27882ae Al Viro             2013-05-17  142  		err =3D ext4_dx_readd=
ir(file, ctx);
400086d7c11327 Milan Djurovic      2021-03-15  143  		if (err !=3D ERR_BAD_=
DX_DIR)
725bebb27882ae Al Viro             2013-05-17  144  			return err;
400086d7c11327 Milan Djurovic      2021-03-15  145  =

48a34311953d92 Jan Kara            2020-02-10  146  		/* Can we just clear =
INDEX flag to ignore htree information? */
48a34311953d92 Jan Kara            2020-02-10  147  		if (!ext4_has_metadat=
a_csum(sb)) {
ac27a0ec112a08 Dave Kleikamp       2006-10-11  148  			/*
ac27a0ec112a08 Dave Kleikamp       2006-10-11  149  			 * We don't set the =
inode dirty flag since it's not
48a34311953d92 Jan Kara            2020-02-10  150  			 * critical that it =
gets flushed back to the disk.
ac27a0ec112a08 Dave Kleikamp       2006-10-11  151  			 */
48a34311953d92 Jan Kara            2020-02-10  152  			ext4_clear_inode_fla=
g(inode, EXT4_INODE_INDEX);
48a34311953d92 Jan Kara            2020-02-10  153  		}
ac27a0ec112a08 Dave Kleikamp       2006-10-11  154  	}
8af0f082279770 Tao Ma              2013-04-19  155  =

8af0f082279770 Tao Ma              2013-04-19  156  	if (ext4_has_inline_da=
ta(inode)) {
8af0f082279770 Tao Ma              2013-04-19  157  		int has_inline_data =
=3D 1;
4461471107b79b Michael Halcrow     2015-04-12  158  		err =3D ext4_read_inl=
ine_dir(file, ctx,
8af0f082279770 Tao Ma              2013-04-19  159  					   &has_inline_dat=
a);
8af0f082279770 Tao Ma              2013-04-19  160  		if (has_inline_data)
4461471107b79b Michael Halcrow     2015-04-12  161  			return err;
4461471107b79b Michael Halcrow     2015-04-12  162  	}
4461471107b79b Michael Halcrow     2015-04-12  163  =

592ddec7578a33 Chandan Rajendra    2018-12-12  164  	if (IS_ENCRYPTED(inode=
)) {
8b10fe68985278 Jeff Layton         2020-08-10  165  		err =3D fscrypt_fname=
_alloc_buffer(EXT4_NAME_LEN, &fstr);
b7236e21d55ff9 Theodore Ts'o       2015-05-18  166  		if (err < 0)
4461471107b79b Michael Halcrow     2015-04-12  167  			return err;
4461471107b79b Michael Halcrow     2015-04-12  168  	}
8af0f082279770 Tao Ma              2013-04-19  169  =

725bebb27882ae Al Viro             2013-05-17  170  	while (ctx->pos < inod=
e->i_size) {
2ed886852adfcb Theodore Ts'o       2010-05-16  171  		struct ext4_map_block=
s map;
ac27a0ec112a08 Dave Kleikamp       2006-10-11  172  =

1f60fbe7274918 Theodore Ts'o       2016-04-23  173  		if (fatal_signal_pend=
ing(current)) {
1f60fbe7274918 Theodore Ts'o       2016-04-23  174  			err =3D -ERESTARTSYS;
1f60fbe7274918 Theodore Ts'o       2016-04-23  175  			goto errout;
1f60fbe7274918 Theodore Ts'o       2016-04-23  176  		}
1f60fbe7274918 Theodore Ts'o       2016-04-23  177  		cond_resched();
4e19d6b65fb4fc Theodore Ts'o       2019-06-20  178  		offset =3D ctx->pos &=
 (sb->s_blocksize - 1);
725bebb27882ae Al Viro             2013-05-17  179  		map.m_lblk =3D ctx->p=
os >> EXT4_BLOCK_SIZE_BITS(sb);
2ed886852adfcb Theodore Ts'o       2010-05-16  180  		map.m_len =3D 1;
2ed886852adfcb Theodore Ts'o       2010-05-16  181  		err =3D ext4_map_bloc=
ks(NULL, inode, &map, 0);
4e19d6b65fb4fc Theodore Ts'o       2019-06-20  182  		if (err =3D=3D 0) {
4e19d6b65fb4fc Theodore Ts'o       2019-06-20  183  			/* m_len should neve=
r be zero but let's avoid
4e19d6b65fb4fc Theodore Ts'o       2019-06-20  184  			 * an infinite loop =
if it somehow is */
4e19d6b65fb4fc Theodore Ts'o       2019-06-20  185  			if (map.m_len =3D=3D=
 0)
4e19d6b65fb4fc Theodore Ts'o       2019-06-20  186  				map.m_len =3D 1;
4e19d6b65fb4fc Theodore Ts'o       2019-06-20  187  			ctx->pos +=3D map.m_=
len * sb->s_blocksize;
4e19d6b65fb4fc Theodore Ts'o       2019-06-20  188  			continue;
4e19d6b65fb4fc Theodore Ts'o       2019-06-20  189  		}
ac27a0ec112a08 Dave Kleikamp       2006-10-11  190  		if (err > 0) {
2ed886852adfcb Theodore Ts'o       2010-05-16  191  			pgoff_t index =3D ma=
p.m_pblk >>
09cbfeaf1a5a67 Kirill A. Shutemov  2016-04-01  192  					(PAGE_SHIFT - inod=
e->i_blkbits);
725bebb27882ae Al Viro             2013-05-17  193  			if (!ra_has_index(&f=
ile->f_ra, index))
cf914a7d656e62 Rusty Russell       2007-07-19  194  				page_cache_sync_rea=
dahead(
dc7868fcb9a739 Fengguang Wu        2007-07-19  195  					sb->s_bdev->bd_ino=
de->i_mapping,
725bebb27882ae Al Viro             2013-05-17  196  					&file->f_ra, file,
cf914a7d656e62 Rusty Russell       2007-07-19  197  					index, 1);
09cbfeaf1a5a67 Kirill A. Shutemov  2016-04-01  198  			file->f_ra.prev_pos =
=3D (loff_t)index << PAGE_SHIFT;
1c2150283cae89 Theodore Ts'o       2014-08-29  199  			bh =3D ext4_bread(NU=
LL, inode, map.m_lblk, 0);
c906f38e8853cf Kirill Tkhai        2016-02-16  200  			if (IS_ERR(bh)) {
c906f38e8853cf Kirill Tkhai        2016-02-16  201  				err =3D PTR_ERR(bh);
c906f38e8853cf Kirill Tkhai        2016-02-16  202  				bh =3D NULL;
c906f38e8853cf Kirill Tkhai        2016-02-16  203  				goto errout;
c906f38e8853cf Kirill Tkhai        2016-02-16  204  			}
ac27a0ec112a08 Dave Kleikamp       2006-10-11  205  		}
ac27a0ec112a08 Dave Kleikamp       2006-10-11  206  =

ac27a0ec112a08 Dave Kleikamp       2006-10-11  207  		if (!bh) {
e6c4021190c828 Eric Sandeen        2006-12-06  208  			/* corrupt size?  Ma=
ybe no more blocks to read */
725bebb27882ae Al Viro             2013-05-17  209  			if (ctx->pos > inode=
->i_blocks << 9)
e6c4021190c828 Eric Sandeen        2006-12-06  210  				break;
725bebb27882ae Al Viro             2013-05-17  211  			ctx->pos +=3D sb->s_=
blocksize - offset;
ac27a0ec112a08 Dave Kleikamp       2006-10-11  212  			continue;
ac27a0ec112a08 Dave Kleikamp       2006-10-11  213  		}
ac27a0ec112a08 Dave Kleikamp       2006-10-11  214  =

b0336e8d2108e6 Darrick J. Wong     2012-04-29  215  		/* Check the checksum=
 */
b0336e8d2108e6 Darrick J. Wong     2012-04-29  216  		if (!buffer_verified(=
bh) &&
f036adb3997646 Theodore Ts'o       2019-06-21  217  		    !ext4_dirblock_cs=
um_verify(inode, bh)) {
725bebb27882ae Al Viro             2013-05-17  218  			EXT4_ERROR_FILE(file=
, 0, "directory fails checksum "
b0336e8d2108e6 Darrick J. Wong     2012-04-29  219  					"at offset %llu",
725bebb27882ae Al Viro             2013-05-17  220  					(unsigned long lon=
g)ctx->pos);
725bebb27882ae Al Viro             2013-05-17  221  			ctx->pos +=3D sb->s_=
blocksize - offset;
d5ac7773051602 Guo Chao            2013-01-28  222  			brelse(bh);
4461471107b79b Michael Halcrow     2015-04-12  223  			bh =3D NULL;
b0336e8d2108e6 Darrick J. Wong     2012-04-29  224  			continue;
b0336e8d2108e6 Darrick J. Wong     2012-04-29  225  		}
b0336e8d2108e6 Darrick J. Wong     2012-04-29  226  		set_buffer_verified(b=
h);
b0336e8d2108e6 Darrick J. Wong     2012-04-29  227  =

ac27a0ec112a08 Dave Kleikamp       2006-10-11  228  		/* If the dir block h=
as changed since the last call to
ac27a0ec112a08 Dave Kleikamp       2006-10-11  229  		 * readdir(2), then w=
e might be pointing to an invalid
ac27a0ec112a08 Dave Kleikamp       2006-10-11  230  		 * dirent right now. =
 Scan from the start of the block
ac27a0ec112a08 Dave Kleikamp       2006-10-11  231  		 * to make sure. */
c472c07bfed9c8 Goffredo Baroncelli 2018-02-01  232  		if (!inode_eq_iversio=
n(inode, file->f_version)) {
ac27a0ec112a08 Dave Kleikamp       2006-10-11  233  			for (i =3D 0; i < sb=
->s_blocksize && i < offset; ) {
617ba13b31fbf5 Mingming Cao        2006-10-11  234  				de =3D (struct ext4=
_dir_entry_2 *)
ac27a0ec112a08 Dave Kleikamp       2006-10-11  235  					(bh->b_data + i);
ac27a0ec112a08 Dave Kleikamp       2006-10-11  236  				/* It's too expensi=
ve to do a full
ac27a0ec112a08 Dave Kleikamp       2006-10-11  237  				 * dirent test each=
 time round this
ac27a0ec112a08 Dave Kleikamp       2006-10-11  238  				 * loop, but we do =
have to test at
ac27a0ec112a08 Dave Kleikamp       2006-10-11  239  				 * least that it is=
 non-zero.  A
ac27a0ec112a08 Dave Kleikamp       2006-10-11  240  				 * failure will be =
detected in the
ac27a0ec112a08 Dave Kleikamp       2006-10-11  241  				 * dirent test belo=
w. */
3d0518f4758eca Wei Yongjun         2009-02-14  242  				if (ext4_rec_len_fr=
om_disk(de->rec_len,
471fbbea7ff706 Daniel Rosenberg    2021-03-19  243  					sb->s_blocksize) <=
 ext4_dir_rec_len(1,
471fbbea7ff706 Daniel Rosenberg    2021-03-19  244  									inode))
ac27a0ec112a08 Dave Kleikamp       2006-10-11  245  					break;
3d0518f4758eca Wei Yongjun         2009-02-14  246  				i +=3D ext4_rec_len=
_from_disk(de->rec_len,
3d0518f4758eca Wei Yongjun         2009-02-14  247  							    sb->s_blocks=
ize);
ac27a0ec112a08 Dave Kleikamp       2006-10-11  248  			}
ac27a0ec112a08 Dave Kleikamp       2006-10-11  249  			offset =3D i;
725bebb27882ae Al Viro             2013-05-17  250  			ctx->pos =3D (ctx->p=
os & ~(sb->s_blocksize - 1))
ac27a0ec112a08 Dave Kleikamp       2006-10-11  251  				| offset;
ee73f9a52a3437 Jeff Layton         2018-01-09  252  			file->f_version =3D =
inode_query_iversion(inode);
ac27a0ec112a08 Dave Kleikamp       2006-10-11  253  		}
ac27a0ec112a08 Dave Kleikamp       2006-10-11  254  =

725bebb27882ae Al Viro             2013-05-17  255  		while (ctx->pos < ino=
de->i_size
ac27a0ec112a08 Dave Kleikamp       2006-10-11  256  		       && offset < sb=
->s_blocksize) {
617ba13b31fbf5 Mingming Cao        2006-10-11  257  			de =3D (struct ext4_=
dir_entry_2 *) (bh->b_data + offset);
725bebb27882ae Al Viro             2013-05-17  258  			if (ext4_check_dir_e=
ntry(inode, file, de, bh,
226ba972b08637 Tao Ma              2012-12-10  259  						 bh->b_data, bh->=
b_size,
226ba972b08637 Tao Ma              2012-12-10  260  						 offset)) {
63f5793351d821 Andrew Morton       2006-10-11  261  				/*
725bebb27882ae Al Viro             2013-05-17  262  				 * On error, skip t=
o the next block
63f5793351d821 Andrew Morton       2006-10-11  263  				 */
725bebb27882ae Al Viro             2013-05-17  264  				ctx->pos =3D (ctx->=
pos |
ac27a0ec112a08 Dave Kleikamp       2006-10-11  265  						(sb->s_blocksize =
- 1)) + 1;
725bebb27882ae Al Viro             2013-05-17  266  				break;
ac27a0ec112a08 Dave Kleikamp       2006-10-11  267  			}
3d0518f4758eca Wei Yongjun         2009-02-14  268  			offset +=3D ext4_rec=
_len_from_disk(de->rec_len,
3d0518f4758eca Wei Yongjun         2009-02-14  269  					sb->s_blocksize);
ac27a0ec112a08 Dave Kleikamp       2006-10-11  270  			if (le32_to_cpu(de->=
inode)) {
592ddec7578a33 Chandan Rajendra    2018-12-12  271  				if (!IS_ENCRYPTED(i=
node)) {
725bebb27882ae Al Viro             2013-05-17  272  					if (!dir_emit(ctx,=
 de->name,
ac27a0ec112a08 Dave Kleikamp       2006-10-11  273  					    de->name_len,
ac27a0ec112a08 Dave Kleikamp       2006-10-11  274  					    le32_to_cpu(de=
->inode),
4461471107b79b Michael Halcrow     2015-04-12  275  					    get_dtype(sb, =
de->file_type)))
4461471107b79b Michael Halcrow     2015-04-12  276  						goto done;
4461471107b79b Michael Halcrow     2015-04-12  277  				} else {
a7550b30ab709f Jaegeuk Kim         2016-07-10  278  					int save_len =3D f=
str.len;
a7550b30ab709f Jaegeuk Kim         2016-07-10  279  					struct fscrypt_str=
 de_name =3D
a7550b30ab709f Jaegeuk Kim         2016-07-10  280  							FSTR_INIT(de->na=
me,
a7550b30ab709f Jaegeuk Kim         2016-07-10  281  								de->name_len);
d229959072eba4 Theodore Ts'o       2015-05-18  282  =

4461471107b79b Michael Halcrow     2015-04-12  283  					/* Directory is en=
crypted */
a7550b30ab709f Jaegeuk Kim         2016-07-10  284  					err =3D fscrypt_fn=
ame_disk_to_usr(inode,
471fbbea7ff706 Daniel Rosenberg    2021-03-19  285  						EXT4_DIRENT_HASH(=
de),
471fbbea7ff706 Daniel Rosenberg    2021-03-19  286  						EXT4_DIRENT_MINOR=
_HASH(de),
471fbbea7ff706 Daniel Rosenberg    2021-03-19  287  						&de_name, &fstr);
ef1eb3aa50930f Eric Biggers        2016-09-15  288  					de_name =3D fstr;
a7550b30ab709f Jaegeuk Kim         2016-07-10  289  					fstr.len =3D save_=
len;
ef1eb3aa50930f Eric Biggers        2016-09-15  290  					if (err)
4461471107b79b Michael Halcrow     2015-04-12  291  						goto errout;
4461471107b79b Michael Halcrow     2015-04-12  292  					if (!dir_emit(ctx,
ef1eb3aa50930f Eric Biggers        2016-09-15  293  					    de_name.name, =
de_name.len,
4461471107b79b Michael Halcrow     2015-04-12  294  					    le32_to_cpu(de=
->inode),
4461471107b79b Michael Halcrow     2015-04-12  295  					    get_dtype(sb, =
de->file_type)))
4461471107b79b Michael Halcrow     2015-04-12  296  						goto done;
725bebb27882ae Al Viro             2013-05-17  297  				}
ac27a0ec112a08 Dave Kleikamp       2006-10-11  298  			}
725bebb27882ae Al Viro             2013-05-17  299  			ctx->pos +=3D ext4_r=
ec_len_from_disk(de->rec_len,
3d0518f4758eca Wei Yongjun         2009-02-14  300  						sb->s_blocksize);
ac27a0ec112a08 Dave Kleikamp       2006-10-11  301  		}
ae05327a00fd47 Al Viro             2016-05-12  302  		if ((ctx->pos < inode=
->i_size) && !dir_relax_shared(inode))
4461471107b79b Michael Halcrow     2015-04-12  303  			goto done;
ac27a0ec112a08 Dave Kleikamp       2006-10-11  304  		brelse(bh);
4461471107b79b Michael Halcrow     2015-04-12  305  		bh =3D NULL;
4461471107b79b Michael Halcrow     2015-04-12  306  		offset =3D 0;
725bebb27882ae Al Viro             2013-05-17  307  	}
4461471107b79b Michael Halcrow     2015-04-12  308  done:
4461471107b79b Michael Halcrow     2015-04-12  309  	err =3D 0;
4461471107b79b Michael Halcrow     2015-04-12  310  errout:
a7550b30ab709f Jaegeuk Kim         2016-07-10  311  	fscrypt_fname_free_buf=
fer(&fstr);
4461471107b79b Michael Halcrow     2015-04-12  312  	brelse(bh);
4461471107b79b Michael Halcrow     2015-04-12  313  	return err;
ac27a0ec112a08 Dave Kleikamp       2006-10-11  314  }
ac27a0ec112a08 Dave Kleikamp       2006-10-11  315  =


:::::: The code at line 126 was first introduced by commit
:::::: 725bebb27882ae617d50776cc8b6cacd84481c91 [readdir] convert ext4

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5361218461752841957==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5361218461752841957==--


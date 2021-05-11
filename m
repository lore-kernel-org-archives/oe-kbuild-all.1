Content-Type: multipart/mixed; boundary="===============9212437871796885267=="
MIME-Version: 1.0
From: Chao Yu <yuchao0@huawei.com>
To: kbuild-all@lists.01.org
Subject: Re: [f2fs:dev-test 12/12] fs/f2fs/super.c:4194:31: error: implicit declaration of function 'COMPRESS_MAPPING'
Date: Tue, 11 May 2021 14:44:51 +0800
Message-ID: <09581936-5fe8-fd69-df5b-835b6db089ac@huawei.com>
In-Reply-To: <202105111323.jd5vYmHN-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9212437871796885267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Thanks for the report.

On 2021/5/11 13:41, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git =
dev-test
> head:   55b45e3a3bbcbc02828c32e3ba3f413634046fd2
> commit: 55b45e3a3bbcbc02828c32e3ba3f413634046fd2 [12/12] f2fs: compress: =
add compress_inode to cache compressed blocks
> config: x86_64-randconfig-a003-20210511 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a0fe=
d635fe1701470062495a6ffee1c608f3f1bc)
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install x86_64 cross compiling tool for clang build
>          # apt-get install binutils-x86-64-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.g=
it/commit/?id=3D55b45e3a3bbcbc02828c32e3ba3f413634046fd2
>          git remote add f2fs https://git.kernel.org/pub/scm/linux/kernel/=
git/jaegeuk/f2fs.git
>          git fetch --no-tags f2fs dev-test
>          git checkout 55b45e3a3bbcbc02828c32e3ba3f413634046fd2
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Dx86_64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All error/warnings (new ones prefixed by >>):
> =

>>> fs/f2fs/super.c:4194:31: error: implicit declaration of function 'COMPR=
ESS_MAPPING' [-Werror,-Wimplicit-function-declaration]
>                             truncate_inode_pages_final(COMPRESS_MAPPING(s=
bi));
>                                                        ^
>>> fs/f2fs/super.c:4194:31: warning: incompatible integer to pointer conve=
rsion passing 'int' to parameter of type 'struct address_space *' [-Wint-co=
nversion]
>                             truncate_inode_pages_final(COMPRESS_MAPPING(s=
bi));
>                                                        ^~~~~~~~~~~~~~~~~~=
~~~
>     include/linux/mm.h:2651:62: note: passing argument to parameter here
>     extern void truncate_inode_pages_final(struct address_space *);
>                                                                  ^
>     1 warning and 1 error generated.

I have fixed this in my repo:

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=3D=
dev&id=3Dc2c4e40ae1815d4a6f4143a5af4a38c4a76ba9f7

@@ -4162,6 +4186,15 @@ static void kill_f2fs_super(struct super_block *sb)
  		f2fs_stop_gc_thread(sbi);
  		f2fs_stop_discard_thread(sbi);

+#ifdef CONFIG_F2FS_FS_COMPRESSION
+		/*
+		 * latter evict_inode() can bypass checking and invalidating
+		 * compress inode cache.
+		 */
+		if (test_opt(sbi, COMPRESS_CACHE))
+			truncate_inode_pages_final(COMPRESS_MAPPING(sbi));
+#endif

Thanks,

> =

> =

> vim +/COMPRESS_MAPPING +4194 fs/f2fs/super.c
> =

>    4179	=

>    4180	static void kill_f2fs_super(struct super_block *sb)
>    4181	{
>    4182		if (sb->s_root) {
>    4183			struct f2fs_sb_info *sbi =3D F2FS_SB(sb);
>    4184	=

>    4185			set_sbi_flag(sbi, SBI_IS_CLOSE);
>    4186			f2fs_stop_gc_thread(sbi);
>    4187			f2fs_stop_discard_thread(sbi);
>    4188	=

>    4189			/*
>    4190			 * latter evict_inode() can bypass checking and invalidating
>    4191			 * compress inode cache.
>    4192			 */
>    4193			if (test_opt(sbi, COMPRESS_CACHE))
>> 4194				truncate_inode_pages_final(COMPRESS_MAPPING(sbi));
>    4195	=

>    4196			if (is_sbi_flag_set(sbi, SBI_IS_DIRTY) ||
>    4197					!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
>    4198				struct cp_control cpc =3D {
>    4199					.reason =3D CP_UMOUNT,
>    4200				};
>    4201				f2fs_write_checkpoint(sbi, &cpc);
>    4202			}
>    4203	=

>    4204			if (is_sbi_flag_set(sbi, SBI_IS_RECOVERED) && f2fs_readonly(sb))
>    4205				sb->s_flags &=3D ~SB_RDONLY;
>    4206		}
>    4207		kill_block_super(sb);
>    4208	}
>    4209	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20
--===============9212437871796885267==--


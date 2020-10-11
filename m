Content-Type: multipart/mixed; boundary="===============2756695122652855739=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 5/5] ovl: impement containerized syncfs for overlayfs
Date: Sun, 11 Oct 2020 21:08:49 +0800
Message-ID: <202010112125.jLWQvLTt-lkp@intel.com>
In-Reply-To: <20201010142355.741645-6-cgxu519@mykernel.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2756695122652855739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Chengguang,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on miklos-vfs/overlayfs-next]
[also build test WARNING on next-20201009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Chengguang-Xu/implement-co=
ntainerized-syncfs-for-overlayfs/20201011-071405
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git ov=
erlayfs-next
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
        ^
>> fs/overlayfs/super.c:293:9: warning: Uninitialized variable: ret [uninit=
var]
    return ret;
           ^

vim +293 fs/overlayfs/super.c

a9075cdb467dd3b Miklos Szeredi        2017-11-10  259  =

e8d4bfe3a715372 Chengguang Xu         2017-11-29  260  /* Sync real dirty i=
nodes in upper filesystem (if it exists) */
e593b2bf513dd4d Amir Goldstein        2017-01-23  261  static int ovl_sync_=
fs(struct super_block *sb, int wait)
e593b2bf513dd4d Amir Goldstein        2017-01-23  262  {
ad204488d3046b3 Miklos Szeredi        2017-11-10  263  	struct ovl_fs *ofs =
=3D sb->s_fs_info;
e593b2bf513dd4d Amir Goldstein        2017-01-23  264  	struct super_block =
*upper_sb;
e593b2bf513dd4d Amir Goldstein        2017-01-23  265  	int ret;
e593b2bf513dd4d Amir Goldstein        2017-01-23  266  =

08f4c7c86d4cf12 Miklos Szeredi        2020-06-04  267  	if (!ovl_upper_mnt(=
ofs))
e593b2bf513dd4d Amir Goldstein        2017-01-23  268  		return 0;
e8d4bfe3a715372 Chengguang Xu         2017-11-29  269  =

c86243b090bc25f Vivek Goyal           2020-08-31  270  	if (!ovl_should_syn=
c(ofs))
c86243b090bc25f Vivek Goyal           2020-08-31  271  		return 0;
e8d4bfe3a715372 Chengguang Xu         2017-11-29  272  	/*
32b1924b210a70d Konstantin Khlebnikov 2020-04-09  273  	 * Not called for s=
ync(2) call or an emergency sync (SB_I_SKIP_SYNC).
32b1924b210a70d Konstantin Khlebnikov 2020-04-09  274  	 * All the super bl=
ocks will be iterated, including upper_sb.
e8d4bfe3a715372 Chengguang Xu         2017-11-29  275  	 *
e8d4bfe3a715372 Chengguang Xu         2017-11-29  276  	 * If this is a syn=
cfs(2) call, then we do need to call
e8d4bfe3a715372 Chengguang Xu         2017-11-29  277  	 * sync_filesystem(=
) on upper_sb, but enough if we do it when being
e8d4bfe3a715372 Chengguang Xu         2017-11-29  278  	 * called with wait=
 =3D=3D 1.
e8d4bfe3a715372 Chengguang Xu         2017-11-29  279  	 */
e8d4bfe3a715372 Chengguang Xu         2017-11-29  280  	if (!wait)
e593b2bf513dd4d Amir Goldstein        2017-01-23  281  		return 0;
e593b2bf513dd4d Amir Goldstein        2017-01-23  282  =

08f4c7c86d4cf12 Miklos Szeredi        2020-06-04  283  	upper_sb =3D ovl_up=
per_mnt(ofs)->mnt_sb;
e8d4bfe3a715372 Chengguang Xu         2017-11-29  284  =

12d938a37e0a31d Chengguang Xu         2020-10-10  285  	if (upper_sb->s_op-=
>sync_fs) {
e593b2bf513dd4d Amir Goldstein        2017-01-23  286  		down_read(&upper_s=
b->s_umount);
12d938a37e0a31d Chengguang Xu         2020-10-10  287  		ret =3D upper_sb->=
s_op->sync_fs(upper_sb, wait);
12d938a37e0a31d Chengguang Xu         2020-10-10  288  		if (!ret)
12d938a37e0a31d Chengguang Xu         2020-10-10  289  			ret =3D sync_bloc=
kdev(upper_sb->s_bdev);
e593b2bf513dd4d Amir Goldstein        2017-01-23  290  		up_read(&upper_sb-=
>s_umount);
12d938a37e0a31d Chengguang Xu         2020-10-10  291  	}
e8d4bfe3a715372 Chengguang Xu         2017-11-29  292  =

e593b2bf513dd4d Amir Goldstein        2017-01-23 @293  	return ret;
e593b2bf513dd4d Amir Goldstein        2017-01-23  294  }
e593b2bf513dd4d Amir Goldstein        2017-01-23  295  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2756695122652855739==--


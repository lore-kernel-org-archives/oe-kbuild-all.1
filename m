Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF9A3205
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jan 2023 14:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EB6C433EF;
	Mon,  9 Jan 2023 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673275848;
	bh=+PPVcZeb2GnOV6uGn3FGk2dNSIeqRNIeHZFsZHBb/fw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=p3wVNN/QF/7TPPB3CFpY+3XKkzjvYZoZrRqfmAFQyU/6f8TarfSnIPR2MaHtNxNC9
	 rL3n1CANYDCiz2edgBtERkSrlMjbYK/iGf7WFE+CL9r8SbM48b1wRvPcYEeVhx987Q
	 DnDgsqufKAfkpUlzuQ1JlRQ9bY0a0vWuyJJnYx+e3+hwfBpUM082AYWZ6638hrU4Mh
	 Nqimt54f32P5+uKkoofzUK2aRhgPifmOQZj1tOk6VBg23LDqvU143rVemLD7lQ0BL1
	 9u92Z9Z14t91BX7/X5KR0Dch+vlNyhysl3VsiznWP3Se1e/MF/TJp5ssmWadgIyE3f
	 YEDKwdR3zyaEA==
Message-ID: <94681ed8c4d8c7b566527b195e7a212063d31522.camel@kernel.org>
Subject: Re: [jlayton:locks-next 1/1] fs/ceph/caps.c:2916:21: error:
 implicit declaration of function 'vfs_inode_has_locks'
From: Jeff Layton <jlayton@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Xiubo Li <xiubli@redhat.com>, "Christian
	Brauner (Microsoft)"
	 <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, David Howells
	 <dhowells@redhat.com>
Date: Mon, 09 Jan 2023 09:50:46 -0500
In-Reply-To: <202301092214.cdaeoQaw-lkp@intel.com>
References: <202301092214.cdaeoQaw-lkp@intel.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-01-09 at 22:27 +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git=
 locks-next
> head:   94188bd995060ccc14ac0f9e83858fcab8aac951
> commit: 94188bd995060ccc14ac0f9e83858fcab8aac951 [1/1] filelock: move fil=
e locking definitions to separate header file
> config: m68k-allmodconfig
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.g=
it/commit/?id=3D94188bd995060ccc14ac0f9e83858fcab8aac951
>         git remote add jlayton https://git.kernel.org/pub/scm/linux/kerne=
l/git/jlayton/linux.git
>         git fetch --no-tags jlayton locks-next
>         git checkout 94188bd995060ccc14ac0f9e83858fcab8aac951
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dm68k olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dm68k SHELL=3D/bin/bash fs/ceph/
>=20
> If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>    fs/ceph/caps.c: In function 'ceph_get_caps':
> > > fs/ceph/caps.c:2916:21: error: implicit declaration of function 'vfs_=
inode_has_locks' [-Werror=3Dimplicit-function-declaration]
>     2916 |                 if (vfs_inode_has_locks(inode))
>          |                     ^~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
>=20
>=20
> vim +/vfs_inode_has_locks +2916 fs/ceph/caps.c
>=20
> 2b1ac852eb67a6 Yan, Zheng         2016-10-25  2890 =20
> a8599bd821d084 Sage Weil          2009-10-06  2891  /*
> a8599bd821d084 Sage Weil          2009-10-06  2892   * Wait for caps, and=
 take cap references.  If we can't get a WR cap
> a8599bd821d084 Sage Weil          2009-10-06  2893   * due to a small max=
_size, make sure we check_max_size (and possibly
> a8599bd821d084 Sage Weil          2009-10-06  2894   * ask the mds) so we=
 don't get hung up indefinitely.
> a8599bd821d084 Sage Weil          2009-10-06  2895   */
> e72968e15b297a Jeff Layton        2021-04-05  2896  int ceph_get_caps(str=
uct file *filp, int need, int want, loff_t endoff, int *got)
> a8599bd821d084 Sage Weil          2009-10-06  2897  {
> ff5d913dfc7142 Yan, Zheng         2019-07-25  2898  	struct ceph_file_inf=
o *fi =3D filp->private_data;
> 5e3ded1bb642f2 Yan, Zheng         2019-07-25  2899  	struct inode *inode =
=3D file_inode(filp);
> 5e3ded1bb642f2 Yan, Zheng         2019-07-25  2900  	struct ceph_inode_in=
fo *ci =3D ceph_inode(inode);
> 81f148a910045c Yan, Zheng         2019-07-25  2901  	struct ceph_fs_clien=
t *fsc =3D ceph_inode_to_client(inode);
> ff5d913dfc7142 Yan, Zheng         2019-07-25  2902  	int ret, _got, flags=
;
> a8599bd821d084 Sage Weil          2009-10-06  2903 =20
> 5e3ded1bb642f2 Yan, Zheng         2019-07-25  2904  	ret =3D ceph_pool_pe=
rm_check(inode, need);
> 10183a69551f76 Yan, Zheng         2015-04-27  2905  	if (ret < 0)
> 10183a69551f76 Yan, Zheng         2015-04-27  2906  		return ret;
> 10183a69551f76 Yan, Zheng         2015-04-27  2907 =20
> 81f148a910045c Yan, Zheng         2019-07-25  2908  	if ((fi->fmode & CEP=
H_FILE_MODE_WR) &&
> 81f148a910045c Yan, Zheng         2019-07-25  2909  	    fi->filp_gen !=
=3D READ_ONCE(fsc->filp_gen))
> 81f148a910045c Yan, Zheng         2019-07-25  2910  		return -EBADF;
> 81f148a910045c Yan, Zheng         2019-07-25  2911 =20
> 719a2514e9bf31 Yan, Zheng         2020-03-05  2912  	flags =3D get_used_f=
mode(need | want);
> 719a2514e9bf31 Yan, Zheng         2020-03-05  2913 =20
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  2914  	while (true) {
> 719a2514e9bf31 Yan, Zheng         2020-03-05  2915  		flags &=3D CEPH_FIL=
E_MODE_MASK;
> 461ab10ef7e6ea Xiubo Li           2022-11-17 @2916  		if (vfs_inode_has_l=
ocks(inode))
> 719a2514e9bf31 Yan, Zheng         2020-03-05  2917  			flags |=3D CHECK_F=
ILELOCK;
> c4d4a582c538e8 Yan, Zheng         2015-01-09  2918  		_got =3D 0;
> 5e3ded1bb642f2 Yan, Zheng         2019-07-25  2919  		ret =3D try_get_cap=
_refs(inode, need, want, endoff,
> ff5d913dfc7142 Yan, Zheng         2019-07-25  2920  				       flags, &_g=
ot);
> 546d402085d6ea Yan, Zheng         2020-03-10  2921  		WARN_ON_ONCE(ret =
=3D=3D -EAGAIN);
> 7b2f936fc8282a Yan, Zheng         2019-05-20  2922  		if (!ret) {
> 3a3430affce5de Jeff Layton        2019-11-20  2923  			struct ceph_mds_cl=
ient *mdsc =3D fsc->mdsc;
> 3a3430affce5de Jeff Layton        2019-11-20  2924  			struct cap_wait cw=
;
> 5c341ee32881c5 Nikolay Borisov    2016-10-11  2925  			DEFINE_WAIT_FUNC(w=
ait, woken_wake_function);
> 3a3430affce5de Jeff Layton        2019-11-20  2926 =20
> ebce3eb2f7ef9f Jeff Layton        2020-08-18  2927  			cw.ino =3D ceph_in=
o(inode);
> 3a3430affce5de Jeff Layton        2019-11-20  2928  			cw.tgid =3D curren=
t->tgid;
> 3a3430affce5de Jeff Layton        2019-11-20  2929  			cw.need =3D need;
> 3a3430affce5de Jeff Layton        2019-11-20  2930  			cw.want =3D want;
> 3a3430affce5de Jeff Layton        2019-11-20  2931 =20
> 3a3430affce5de Jeff Layton        2019-11-20  2932  			spin_lock(&mdsc->c=
aps_list_lock);
> 3a3430affce5de Jeff Layton        2019-11-20  2933  			list_add(&cw.list,=
 &mdsc->cap_wait_list);
> 3a3430affce5de Jeff Layton        2019-11-20  2934  			spin_unlock(&mdsc-=
>caps_list_lock);
> 3a3430affce5de Jeff Layton        2019-11-20  2935 =20
> 719a2514e9bf31 Yan, Zheng         2020-03-05  2936  			/* make sure used =
fmode not timeout */
> 719a2514e9bf31 Yan, Zheng         2020-03-05  2937  			ceph_get_fmode(ci,=
 flags, FMODE_WAIT_BIAS);
> 5c341ee32881c5 Nikolay Borisov    2016-10-11  2938  			add_wait_queue(&ci=
->i_cap_wq, &wait);
> 5c341ee32881c5 Nikolay Borisov    2016-10-11  2939 =20
> ff5d913dfc7142 Yan, Zheng         2019-07-25  2940  			flags |=3D NON_BLO=
CKING;
> 5e3ded1bb642f2 Yan, Zheng         2019-07-25  2941  			while (!(ret =3D t=
ry_get_cap_refs(inode, need, want,
> ff5d913dfc7142 Yan, Zheng         2019-07-25  2942  							endoff, flags,=
 &_got))) {
> 6e09d0fb64402c Yan, Zheng         2016-12-22  2943  				if (signal_pendin=
g(current)) {
> 6e09d0fb64402c Yan, Zheng         2016-12-22  2944  					ret =3D -ERESTAR=
TSYS;
> 6e09d0fb64402c Yan, Zheng         2016-12-22  2945  					break;
> 6e09d0fb64402c Yan, Zheng         2016-12-22  2946  				}
> 5c341ee32881c5 Nikolay Borisov    2016-10-11  2947  				wait_woken(&wait,=
 TASK_INTERRUPTIBLE, MAX_SCHEDULE_TIMEOUT);
> 6e09d0fb64402c Yan, Zheng         2016-12-22  2948  			}
> 5c341ee32881c5 Nikolay Borisov    2016-10-11  2949 =20
> 5c341ee32881c5 Nikolay Borisov    2016-10-11  2950  			remove_wait_queue(=
&ci->i_cap_wq, &wait);
> 719a2514e9bf31 Yan, Zheng         2020-03-05  2951  			ceph_put_fmode(ci,=
 flags, FMODE_WAIT_BIAS);
> 3a3430affce5de Jeff Layton        2019-11-20  2952 =20
> 3a3430affce5de Jeff Layton        2019-11-20  2953  			spin_lock(&mdsc->c=
aps_list_lock);
> 3a3430affce5de Jeff Layton        2019-11-20  2954  			list_del(&cw.list)=
;
> 3a3430affce5de Jeff Layton        2019-11-20  2955  			spin_unlock(&mdsc-=
>caps_list_lock);
> 3a3430affce5de Jeff Layton        2019-11-20  2956 =20
> 7b2f936fc8282a Yan, Zheng         2019-05-20  2957  			if (ret =3D=3D -EA=
GAIN)
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  2958  				continue;
> 77310320c299b0 Yan, Zheng         2016-04-08  2959  		}
> 81f148a910045c Yan, Zheng         2019-07-25  2960 =20
> 81f148a910045c Yan, Zheng         2019-07-25  2961  		if ((fi->fmode & CE=
PH_FILE_MODE_WR) &&
> 81f148a910045c Yan, Zheng         2019-07-25  2962  		    fi->filp_gen !=
=3D READ_ONCE(fsc->filp_gen)) {
> 81f148a910045c Yan, Zheng         2019-07-25  2963  			if (ret >=3D 0 && =
_got)
> 81f148a910045c Yan, Zheng         2019-07-25  2964  				ceph_put_cap_refs=
(ci, _got);
> 81f148a910045c Yan, Zheng         2019-07-25  2965  			return -EBADF;
> 81f148a910045c Yan, Zheng         2019-07-25  2966  		}
> 81f148a910045c Yan, Zheng         2019-07-25  2967 =20
> 7b2f936fc8282a Yan, Zheng         2019-05-20  2968  		if (ret < 0) {
> 8006daff5f94b1 Jeff Layton        2021-09-07  2969  			if (ret =3D=3D -EF=
BIG || ret =3D=3D -EUCLEAN) {
> 9bccb76574ad9b Yan, Zheng         2020-03-10  2970  				int ret2 =3D ceph=
_wait_on_async_create(inode);
> 9bccb76574ad9b Yan, Zheng         2020-03-10  2971  				if (ret2 < 0)
> 9bccb76574ad9b Yan, Zheng         2020-03-10  2972  					return ret2;
> 9bccb76574ad9b Yan, Zheng         2020-03-10  2973  			}
> 546d402085d6ea Yan, Zheng         2020-03-10  2974  			if (ret =3D=3D -EF=
BIG) {
> 546d402085d6ea Yan, Zheng         2020-03-10  2975  				check_max_size(in=
ode, endoff);
> 546d402085d6ea Yan, Zheng         2020-03-10  2976  				continue;
> 546d402085d6ea Yan, Zheng         2020-03-10  2977  			}
> 8006daff5f94b1 Jeff Layton        2021-09-07  2978  			if (ret =3D=3D -EU=
CLEAN) {
> 77310320c299b0 Yan, Zheng         2016-04-08  2979  				/* session was ki=
lled, try renew caps */
> 719a2514e9bf31 Yan, Zheng         2020-03-05  2980  				ret =3D ceph_rene=
w_caps(inode, flags);
> 77310320c299b0 Yan, Zheng         2016-04-08  2981  				if (ret =3D=3D 0)
> 77310320c299b0 Yan, Zheng         2016-04-08  2982  					continue;
> 7b2f936fc8282a Yan, Zheng         2019-05-20  2983  			}
> c4d4a582c538e8 Yan, Zheng         2015-01-09  2984  			return ret;
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  2985  		}
> c4d4a582c538e8 Yan, Zheng         2015-01-09  2986 =20
> 874c8ca1e60b2c David Howells      2022-06-09  2987  		if (S_ISREG(ci->net=
fs.inode.i_mode) &&
> 4849077604f012 Xiubo Li           2022-06-07  2988  		    ceph_has_inline=
_data(ci) &&
> c4d4a582c538e8 Yan, Zheng         2015-01-09  2989  		    (_got & (CEPH_C=
AP_FILE_CACHE|CEPH_CAP_FILE_LAZYIO)) &&
> 5e3ded1bb642f2 Yan, Zheng         2019-07-25  2990  		    i_size_read(ino=
de) > 0) {
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  2991  			struct page *page =
=3D
> 5e3ded1bb642f2 Yan, Zheng         2019-07-25  2992  				find_get_page(ino=
de->i_mapping, 0);
> c4d4a582c538e8 Yan, Zheng         2015-01-09  2993  			if (page) {
> e72968e15b297a Jeff Layton        2021-04-05  2994  				bool uptodate =3D=
 PageUptodate(page);
> e72968e15b297a Jeff Layton        2021-04-05  2995 =20
> 09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  2996  				put_page(page);
> e72968e15b297a Jeff Layton        2021-04-05  2997  				if (uptodate)
> e72968e15b297a Jeff Layton        2021-04-05  2998  					break;
> c4d4a582c538e8 Yan, Zheng         2015-01-09  2999  			}
> c4d4a582c538e8 Yan, Zheng         2015-01-09  3000  			/*
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  3001  			 * drop cap refs f=
irst because getattr while
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  3002  			 * holding * caps =
refs can cause deadlock.
> c4d4a582c538e8 Yan, Zheng         2015-01-09  3003  			 */
> c4d4a582c538e8 Yan, Zheng         2015-01-09  3004  			ceph_put_cap_refs(=
ci, _got);
> c4d4a582c538e8 Yan, Zheng         2015-01-09  3005  			_got =3D 0;
> c4d4a582c538e8 Yan, Zheng         2015-01-09  3006 =20
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  3007  			/*
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  3008  			 * getattr request=
 will bring inline data into
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  3009  			 * page cache
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  3010  			 */
> 5e3ded1bb642f2 Yan, Zheng         2019-07-25  3011  			ret =3D __ceph_do_=
getattr(inode, NULL,
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  3012  						CEPH_STAT_CAP_I=
NLINE_DATA,
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  3013  						true);
> c4d4a582c538e8 Yan, Zheng         2015-01-09  3014  			if (ret < 0)
> a8599bd821d084 Sage Weil          2009-10-06  3015  				return ret;
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  3016  			continue;
> c4d4a582c538e8 Yan, Zheng         2015-01-09  3017  		}
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  3018  		break;
> 5dda377cf0a6bd Yan, Zheng         2015-04-30  3019  	}
> c4d4a582c538e8 Yan, Zheng         2015-01-09  3020  	*got =3D _got;
> c4d4a582c538e8 Yan, Zheng         2015-01-09  3021  	return 0;
> a8599bd821d084 Sage Weil          2009-10-06  3022  }
> a8599bd821d084 Sage Weil          2009-10-06  3023 =20
>=20
> :::::: The code at line 2916 was first introduced by commit
> :::::: 461ab10ef7e6ea9b41a0571a7fc6a72af9549a3c ceph: switch to vfs_inode=
_has_locks() to fix file lock bug
>=20
> :::::: TO: Xiubo Li <xiubli@redhat.com>
> :::::: CC: Ilya Dryomov <idryomov@gmail.com>
>=20

Thanks KTR! I missed adding a #include to fs/ceph/caps.c:

diff --git b/fs/ceph/caps.c a/fs/ceph/caps.c
index f75ad432f375..2ce6cc443b48 100644
--- b/fs/ceph/caps.c
+++ a/fs/ceph/caps.c
@@ -9,6 +9,7 @@
 #include <linux/wait.h>
 #include <linux/writeback.h>
 #include <linux/iversion.h>
+#include <linux/filelock.h>
=20
 #include "super.h"
 #include "mds_client.h"


I've pushed a revised patch to the locks-next branch.
--=20
Jeff Layton <jlayton@kernel.org>

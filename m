Content-Type: multipart/mixed; boundary="===============4393473222777693791=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] debugfs: Check module state before warning in {full/open}_proxy_open()
Date: Thu, 06 Feb 2020 09:39:09 +0800
Message-ID: <202002060953.7V3nl6kD%lkp@intel.com>
In-Reply-To: <20200205122724.1307-1-ap420073@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4393473222777693791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Taehee,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on v5.5 next-20200204]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Taehee-Yoo/debugfs-Check-m=
odule-state-before-warning-in-full-open-_proxy_open/20200206-045726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.=
git 6992ca0dd017ebaa2bf8e9dcc49f1c3b7033b082
config: arm-mps2_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Darm =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/debugfs/file.c: In function 'open_proxy_open':
>> fs/debugfs/file.c:180:23: error: dereferencing pointer to incomplete typ=
e 'struct module'
          real_fops->owner->state =3D=3D MODULE_STATE_GOING)
                          ^~
>> fs/debugfs/file.c:180:34: error: 'MODULE_STATE_GOING' undeclared (first =
use in this function); did you mean 'DL_STATE_NONE'?
          real_fops->owner->state =3D=3D MODULE_STATE_GOING)
                                     ^~~~~~~~~~~~~~~~~~
                                     DL_STATE_NONE
   fs/debugfs/file.c:180:34: note: each undeclared identifier is reported o=
nly once for each function it appears in
   fs/debugfs/file.c: In function 'full_proxy_open':
   fs/debugfs/file.c:313:34: error: 'MODULE_STATE_GOING' undeclared (first =
use in this function); did you mean 'DL_STATE_NONE'?
          real_fops->owner->state =3D=3D MODULE_STATE_GOING)
                                     ^~~~~~~~~~~~~~~~~~
                                     DL_STATE_NONE

vim +180 fs/debugfs/file.c

   161	=

   162	static int open_proxy_open(struct inode *inode, struct file *filp)
   163	{
   164		struct dentry *dentry =3D F_DENTRY(filp);
   165		const struct file_operations *real_fops =3D NULL;
   166		int r;
   167	=

   168		r =3D debugfs_file_get(dentry);
   169		if (r)
   170			return r =3D=3D -EIO ? -ENOENT : r;
   171	=

   172		real_fops =3D debugfs_real_fops(filp);
   173	=

   174		r =3D debugfs_locked_down(inode, filp, real_fops);
   175		if (r)
   176			goto out;
   177	=

   178		if (!fops_get(real_fops)) {
   179			if (real_fops->owner &&
 > 180			    real_fops->owner->state =3D=3D MODULE_STATE_GOING)
   181				goto out;
   182	=

   183			/* Huh? Module did not clean up after itself at exit? */
   184			WARN(1, "debugfs file owner did not clean up at exit: %pd",
   185				dentry);
   186			r =3D -ENXIO;
   187			goto out;
   188		}
   189		replace_fops(filp, real_fops);
   190	=

   191		if (real_fops->open)
   192			r =3D real_fops->open(inode, filp);
   193	=

   194	out:
   195		debugfs_file_put(dentry);
   196		return r;
   197	}
   198	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============4393473222777693791==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4393473222777693791==--


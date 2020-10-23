Content-Type: multipart/mixed; boundary="===============0081473338644572363=="
MIME-Version: 1.0
From: Jason Wang <jasowang@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH V3 2/3] vhost: vdpa: report iova range
Date: Fri, 23 Oct 2020 16:46:27 +0800
Message-ID: <2c52262f-c54e-dbb0-c906-e4339595e53b@redhat.com>
In-Reply-To: <202010231319.Ix8DqCWr-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0081473338644572363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 2020/10/23 =E4=B8=8B=E5=8D=881:28, kernel test robot wrote:
> Hi Jason,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on vhost/linux-next]
> [also build test WARNING on linus/master v5.9 next-20201023]
> [cannot apply to linux/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Jason-Wang/vDPA-API-for-=
reporting-IOVA-range/20201023-102708
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git lin=
ux-next
> config: m68k-randconfig-r034-20201022 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/0day-ci/linux/commit/446e7b97838ebf87f1acd6=
1580137716fdad104a
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Jason-Wang/vDPA-API-for-reporti=
ng-IOVA-range/20201023-102708
>          git checkout 446e7b97838ebf87f1acd61580137716fdad104a
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss ARCH=3Dm68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>     drivers/vhost/vdpa.c: In function 'vhost_vdpa_setup_vq_irq':
>     drivers/vhost/vdpa.c:94:6: warning: variable 'ret' set but not used [=
-Wunused-but-set-variable]
>        94 |  int ret, irq;
>           |      ^~~
>     drivers/vhost/vdpa.c: In function 'vhost_vdpa_unlocked_ioctl':


This looks like another issue that needs to be fixed.


>>> drivers/vhost/vdpa.c:483:5: warning: this statement may fall through [-=
Wimplicit-fallthrough=3D]
>       483 |   r =3D copy_to_user(featurep, &features, sizeof(features));
>           |   ~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/vhost/vdpa.c:484:2: note: here
>       484 |  case VHOST_VDPA_GET_IOVA_RANGE:
>           |  ^~~~
>
> vim +483 drivers/vhost/vdpa.c


My bad. V4 is on the road.

Thanks


>
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  426
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  427  static long vhost_vdpa_unlo=
cked_ioctl(struct file *filep,
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  428  				      unsigned int cmd,=
 unsigned long arg)
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  429  {
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  430  	struct vhost_vdpa *v =3D f=
ilep->private_data;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  431  	struct vhost_dev *d =3D &v=
->vdev;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  432  	void __user *argp =3D (voi=
d __user *)arg;
> a127c5bbb6a8eee Jason Wang   2020-09-07  433  	u64 __user *featurep =3D a=
rgp;
> a127c5bbb6a8eee Jason Wang   2020-09-07  434  	u64 features;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  435  	long r;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  436
> a127c5bbb6a8eee Jason Wang   2020-09-07  437  	if (cmd =3D=3D VHOST_SET_B=
ACKEND_FEATURES) {
> a127c5bbb6a8eee Jason Wang   2020-09-07  438  		r =3D copy_from_user(&fea=
tures, featurep, sizeof(features));
> a127c5bbb6a8eee Jason Wang   2020-09-07  439  		if (r)
> a127c5bbb6a8eee Jason Wang   2020-09-07  440  			return r;
> a127c5bbb6a8eee Jason Wang   2020-09-07  441  		if (features & ~VHOST_VDP=
A_BACKEND_FEATURES)
> a127c5bbb6a8eee Jason Wang   2020-09-07  442  			return -EOPNOTSUPP;
> a127c5bbb6a8eee Jason Wang   2020-09-07  443  		vhost_set_backend_feature=
s(&v->vdev, features);
> a127c5bbb6a8eee Jason Wang   2020-09-07  444  		return 0;
> a127c5bbb6a8eee Jason Wang   2020-09-07  445  	}
> a127c5bbb6a8eee Jason Wang   2020-09-07  446
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  447  	mutex_lock(&d->mutex);
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  448
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  449  	switch (cmd) {
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  450  	case VHOST_VDPA_GET_DEVICE=
_ID:
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  451  		r =3D vhost_vdpa_get_devi=
ce_id(v, argp);
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  452  		break;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  453  	case VHOST_VDPA_GET_STATUS:
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  454  		r =3D vhost_vdpa_get_stat=
us(v, argp);
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  455  		break;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  456  	case VHOST_VDPA_SET_STATUS:
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  457  		r =3D vhost_vdpa_set_stat=
us(v, argp);
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  458  		break;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  459  	case VHOST_VDPA_GET_CONFIG:
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  460  		r =3D vhost_vdpa_get_conf=
ig(v, argp);
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  461  		break;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  462  	case VHOST_VDPA_SET_CONFIG:
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  463  		r =3D vhost_vdpa_set_conf=
ig(v, argp);
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  464  		break;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  465  	case VHOST_GET_FEATURES:
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  466  		r =3D vhost_vdpa_get_feat=
ures(v, argp);
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  467  		break;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  468  	case VHOST_SET_FEATURES:
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  469  		r =3D vhost_vdpa_set_feat=
ures(v, argp);
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  470  		break;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  471  	case VHOST_VDPA_GET_VRING_=
NUM:
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  472  		r =3D vhost_vdpa_get_vrin=
g_num(v, argp);
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  473  		break;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  474  	case VHOST_SET_LOG_BASE:
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  475  	case VHOST_SET_LOG_FD:
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  476  		r =3D -ENOIOCTLCMD;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  477  		break;
> 776f395004d829b Zhu Lingshan 2020-06-05  478  	case VHOST_VDPA_SET_CONFIG=
_CALL:
> 776f395004d829b Zhu Lingshan 2020-06-05  479  		r =3D vhost_vdpa_set_conf=
ig_call(v, argp);
> 776f395004d829b Zhu Lingshan 2020-06-05  480  		break;
> a127c5bbb6a8eee Jason Wang   2020-09-07  481  	case VHOST_GET_BACKEND_FEA=
TURES:
> a127c5bbb6a8eee Jason Wang   2020-09-07  482  		features =3D VHOST_VDPA_B=
ACKEND_FEATURES;
> a127c5bbb6a8eee Jason Wang   2020-09-07 @483  		r =3D copy_to_user(featur=
ep, &features, sizeof(features));
> 446e7b97838ebf8 Jason Wang   2020-10-23  484  	case VHOST_VDPA_GET_IOVA_R=
ANGE:
> 446e7b97838ebf8 Jason Wang   2020-10-23  485  		r =3D vhost_vdpa_get_iova=
_range(v, argp);
> a127c5bbb6a8eee Jason Wang   2020-09-07  486  		break;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  487  	default:
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  488  		r =3D vhost_dev_ioctl(&v-=
>vdev, cmd, argp);
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  489  		if (r =3D=3D -ENOIOCTLCMD)
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  490  			r =3D vhost_vdpa_vring_i=
octl(v, cmd, argp);
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  491  		break;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  492  	}
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  493
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  494  	mutex_unlock(&d->mutex);
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  495  	return r;
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  496  }
> 4c8cf31885f69e8 Tiwei Bie    2020-03-26  497
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0081473338644572363==--


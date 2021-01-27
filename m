Content-Type: multipart/mixed; boundary="===============3715480763093138170=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH -next] scsi: gdth: Remove unused including <linux/version.h>
Date: Wed, 27 Jan 2021 11:39:42 +0800
Message-ID: <202101271143.u7ihLVoE-lkp@intel.com>
In-Reply-To: <1611578062-42802-1-git-send-email-zou_wei@huawei.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3715480763093138170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Zou,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20210125]

url:    https://github.com/0day-ci/linux/commits/Zou-Wei/scsi-gdth-Remove-u=
nused-including-linux-version-h/20210126-144114
base:    59fa6a163ffabc1bf25c5e0e33899e268a96d3cc
config: x86_64-randconfig-a006-20210126 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 925ae8=
c790c7e354f12ec14a6cac6aa49fc75b29)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://github.com/0day-ci/linux/commit/708189b9daeabee85678f76fe=
62b77125dead7fe
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zou-Wei/scsi-gdth-Remove-unused-in=
cluding-linux-version-h/20210126-144114
        git checkout 708189b9daeabee85678f76fe62b77125dead7fe
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/scsi/gdth.c:3832:23: error: use of undeclared identifier 'LINUX_=
VERSION_MAJOR'
           osv.version =3D LINUX_VERSION_MAJOR;
                         ^
>> drivers/scsi/gdth.c:3833:26: error: use of undeclared identifier 'LINUX_=
VERSION_PATCHLEVEL'
           osv.subversion =3D LINUX_VERSION_PATCHLEVEL;
                            ^
>> drivers/scsi/gdth.c:3834:24: error: use of undeclared identifier 'LINUX_=
VERSION_SUBLEVEL'
           osv.revision =3D LINUX_VERSION_SUBLEVEL;
                          ^
>> drivers/scsi/gdth.c:4097:33: warning: shift count >=3D width of type [-W=
shift-count-overflow]
                   if (!dma_set_mask(&pdev->dev, DMA_BIT_MASK(64))) {
                                                 ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 3 errors generated.


vim +/LINUX_VERSION_MAJOR +3832 drivers/scsi/gdth.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  3668  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3669  static int ioc_rescan(v=
oid __user *arg, char *cmnd)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3670  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3671      gdth_ioctl_rescan *=
rsc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3672      gdth_cmd_str *cmd;
1fe6dbf4d0afba Dave Jones         2010-01-04  3673      u16 i, status, hdr_=
cnt;
1fe6dbf4d0afba Dave Jones         2010-01-04  3674      u32 info;
45f1a41b2b2e02 Boaz Harrosh       2007-10-02  3675      int cyls, hds, secs;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3676      int rc =3D -ENOMEM;
1fe6dbf4d0afba Dave Jones         2010-01-04  3677      unsigned long flags;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3678      gdth_ha_str *ha; =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3679  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3680      rsc =3D kmalloc(siz=
eof(*rsc), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3681      cmd =3D kmalloc(siz=
eof(*cmd), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3682      if (!cmd || !rsc)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3683          goto free_fail;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3684  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3685      if (copy_from_user(=
rsc, arg, sizeof(gdth_ioctl_rescan)) ||
884f7fba096467 Boaz Harrosh       2007-10-02  3686          (NULL =3D=3D (h=
a =3D gdth_find_ha(rsc->ionode)))) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3687          rc =3D -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3688          goto free_fail;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3689      }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3690      memset(cmd, 0, size=
of(gdth_cmd_str));
^1da177e4c3f41 Linus Torvalds     2005-04-16  3691  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3692      if (rsc->flag =3D=
=3D 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3693          /* old method: =
re-init. cache service */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3694          cmd->Service =
=3D CACHESERVICE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3695          if (ha->cache_f=
eat & GDT_64BIT) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3696              cmd->OpCode=
 =3D GDT_X_INIT_HOST;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3697              cmd->u.cach=
e64.DeviceNo =3D LINUX_OS;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3698          } else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3699              cmd->OpCode=
 =3D GDT_INIT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3700              cmd->u.cach=
e.DeviceNo =3D LINUX_OS;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3701          }
cbd5f69b98bb5d Leubner, Achim     2006-06-09  3702  =

cbd5f69b98bb5d Leubner, Achim     2006-06-09  3703          status =3D __gd=
th_execute(ha->sdev, cmd, cmnd, 30, &info);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3704          i =3D 0;
1fe6dbf4d0afba Dave Jones         2010-01-04  3705          hdr_cnt =3D (st=
atus =3D=3D S_OK ? (u16)info : 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3706      } else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3707          i =3D rsc->hdr_=
no;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3708          hdr_cnt =3D i +=
 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3709      }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3710  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3711      for (; i < hdr_cnt =
&& i < MAX_HDRIVES; ++i) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3712          cmd->Service =
=3D CACHESERVICE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3713          cmd->OpCode =3D=
 GDT_INFO;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3714          if (ha->cache_f=
eat & GDT_64BIT) =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3715              cmd->u.cach=
e64.DeviceNo =3D i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3716          else =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3717              cmd->u.cach=
e.DeviceNo =3D i;
cbd5f69b98bb5d Leubner, Achim     2006-06-09  3718  =

cbd5f69b98bb5d Leubner, Achim     2006-06-09  3719          status =3D __gd=
th_execute(ha->sdev, cmd, cmnd, 30, &info);
cbd5f69b98bb5d Leubner, Achim     2006-06-09  3720  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3721          spin_lock_irqsa=
ve(&ha->smp_lock, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3722          rsc->hdr_list[i=
].bus =3D ha->virt_bus;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3723          rsc->hdr_list[i=
].target =3D i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3724          rsc->hdr_list[i=
].lun =3D 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3725          if (status !=3D=
 S_OK) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3726              ha->hdr[i].=
present =3D FALSE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3727          } else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3728              ha->hdr[i].=
present =3D TRUE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3729              ha->hdr[i].=
size =3D info;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3730              /* evaluate=
 mapping */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3731              ha->hdr[i].=
size &=3D ~SECS32;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3732              gdth_eval_m=
apping(ha->hdr[i].size,&cyls,&hds,&secs); =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3733              ha->hdr[i].=
heads =3D hds;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3734              ha->hdr[i].=
secs =3D secs;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3735              /* round si=
ze */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3736              ha->hdr[i].=
size =3D cyls * hds * secs;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3737          }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3738          spin_unlock_irq=
restore(&ha->smp_lock, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3739          if (status !=3D=
 S_OK)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3740              continue; =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3741          =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3742          /* extended inf=
o, if GDT_64BIT, for drives > 2 TB */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3743          /* but we need =
ha->info2, not yet stored in scp->SCp */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3744  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3745          /* devtype, clu=
ster info, R/W attribs */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3746          cmd->Service =
=3D CACHESERVICE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3747          cmd->OpCode =3D=
 GDT_DEVTYPE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3748          if (ha->cache_f=
eat & GDT_64BIT) =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3749              cmd->u.cach=
e64.DeviceNo =3D i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3750          else
^1da177e4c3f41 Linus Torvalds     2005-04-16  3751              cmd->u.cach=
e.DeviceNo =3D i;
cbd5f69b98bb5d Leubner, Achim     2006-06-09  3752  =

cbd5f69b98bb5d Leubner, Achim     2006-06-09  3753          status =3D __gd=
th_execute(ha->sdev, cmd, cmnd, 30, &info);
cbd5f69b98bb5d Leubner, Achim     2006-06-09  3754  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3755          spin_lock_irqsa=
ve(&ha->smp_lock, flags);
1fe6dbf4d0afba Dave Jones         2010-01-04  3756          ha->hdr[i].devt=
ype =3D (status =3D=3D S_OK ? (u16)info : 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3757          spin_unlock_irq=
restore(&ha->smp_lock, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3758  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3759          cmd->Service =
=3D CACHESERVICE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3760          cmd->OpCode =3D=
 GDT_CLUST_INFO;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3761          if (ha->cache_f=
eat & GDT_64BIT) =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3762              cmd->u.cach=
e64.DeviceNo =3D i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3763          else
^1da177e4c3f41 Linus Torvalds     2005-04-16  3764              cmd->u.cach=
e.DeviceNo =3D i;
cbd5f69b98bb5d Leubner, Achim     2006-06-09  3765  =

cbd5f69b98bb5d Leubner, Achim     2006-06-09  3766          status =3D __gd=
th_execute(ha->sdev, cmd, cmnd, 30, &info);
cbd5f69b98bb5d Leubner, Achim     2006-06-09  3767  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3768          spin_lock_irqsa=
ve(&ha->smp_lock, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3769          ha->hdr[i].clus=
ter_type =3D =

1fe6dbf4d0afba Dave Jones         2010-01-04  3770              ((status =
=3D=3D S_OK && !shared_access) ? (u16)info : 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3771          spin_unlock_irq=
restore(&ha->smp_lock, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3772          rsc->hdr_list[i=
].cluster_type =3D ha->hdr[i].cluster_type;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3773  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3774          cmd->Service =
=3D CACHESERVICE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3775          cmd->OpCode =3D=
 GDT_RW_ATTRIBS;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3776          if (ha->cache_f=
eat & GDT_64BIT) =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3777              cmd->u.cach=
e64.DeviceNo =3D i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3778          else
^1da177e4c3f41 Linus Torvalds     2005-04-16  3779              cmd->u.cach=
e.DeviceNo =3D i;
cbd5f69b98bb5d Leubner, Achim     2006-06-09  3780  =

cbd5f69b98bb5d Leubner, Achim     2006-06-09  3781          status =3D __gd=
th_execute(ha->sdev, cmd, cmnd, 30, &info);
cbd5f69b98bb5d Leubner, Achim     2006-06-09  3782  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3783          spin_lock_irqsa=
ve(&ha->smp_lock, flags);
1fe6dbf4d0afba Dave Jones         2010-01-04  3784          ha->hdr[i].rw_a=
ttribs =3D (status =3D=3D S_OK ? (u16)info : 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3785          spin_unlock_irq=
restore(&ha->smp_lock, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3786      }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3787   =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3788      if (copy_to_user(ar=
g, rsc, sizeof(gdth_ioctl_rescan)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  3789          rc =3D -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3790      else
^1da177e4c3f41 Linus Torvalds     2005-04-16  3791          rc =3D 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3792  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3793  free_fail:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3794      kfree(rsc);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3795      kfree(cmd);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3796      return rc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3797  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3798    =

f4927c45beda9a Arnd Bergmann      2010-04-27  3799  static int gdth_ioctl(s=
truct file *filep, unsigned int cmd, unsigned long arg)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3800  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3801      gdth_ha_str *ha; =

91ebc1facd7797 Johannes Thumshirn 2018-06-13  3802      struct scsi_cmnd *s=
cp;
1fe6dbf4d0afba Dave Jones         2010-01-04  3803      unsigned long flags;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3804      char cmnd[MAX_COMMA=
ND_SIZE];   =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3805      void __user *argp =
=3D (void __user *)arg;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3806  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3807      memset(cmnd, 0xff, =
12);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3808      =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3809      TRACE(("gdth_ioctl(=
) cmd 0x%x\n", cmd));
^1da177e4c3f41 Linus Torvalds     2005-04-16  3810   =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3811      switch (cmd) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3812        case GDTIOCTL_CTR=
CNT:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3813        { =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3814          int cnt =3D gdt=
h_ctr_count;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3815          if (put_user(cn=
t, (int __user *)argp))
^1da177e4c3f41 Linus Torvalds     2005-04-16  3816                  return =
-EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3817          break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3818        }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3819  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3820        case GDTIOCTL_DRV=
ERS:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3821        { =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3822          int ver =3D (GD=
TH_VERSION<<8) | GDTH_SUBVERSION;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3823          if (put_user(ve=
r, (int __user *)argp))
^1da177e4c3f41 Linus Torvalds     2005-04-16  3824                  return =
-EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3825          break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3826        }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3827        =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3828        case GDTIOCTL_OSV=
ERS:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3829        { =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3830          gdth_ioctl_osve=
rs osv; =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3831  =

537896fabed11f Sasha Levin        2021-01-18 @3832          osv.version =3D=
 LINUX_VERSION_MAJOR;
537896fabed11f Sasha Levin        2021-01-18 @3833          osv.subversion =
=3D LINUX_VERSION_PATCHLEVEL;
537896fabed11f Sasha Levin        2021-01-18 @3834          osv.revision =
=3D LINUX_VERSION_SUBLEVEL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3835          if (copy_to_use=
r(argp, &osv, sizeof(gdth_ioctl_osvers)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  3836                  return =
-EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3837          break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3838        }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3839  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3840        case GDTIOCTL_CTR=
TYPE:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3841        { =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3842          gdth_ioctl_ctrt=
ype ctrt;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3843          =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3844          if (copy_from_u=
ser(&ctrt, argp, sizeof(gdth_ioctl_ctrtype)) ||
884f7fba096467 Boaz Harrosh       2007-10-02  3845              (NULL =3D=
=3D (ha =3D gdth_find_ha(ctrt.ionode))))
^1da177e4c3f41 Linus Torvalds     2005-04-16  3846              return -EFA=
ULT;
884f7fba096467 Boaz Harrosh       2007-10-02  3847  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3848          if (ha->type !=
=3D GDT_PCIMPR) {
1fe6dbf4d0afba Dave Jones         2010-01-04  3849  	    ctrt.type =3D (u8)=
((ha->stype<<4) + 6);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3850          } else {
314814552a0adf Christoph Hellwig  2018-12-12  3851              ctrt.type =
=3D  (ha->oem_id =3D=3D OEM_ID_INTEL ? 0xfd : 0xfe);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3852              if (ha->sty=
pe >=3D 0x300)
8e9a8a0d56c5d9 Jeff Garzik        2007-07-17  3853                  ctrt.ex=
t_type =3D 0x6000 | ha->pdev->subsystem_device;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3854              else
^1da177e4c3f41 Linus Torvalds     2005-04-16  3855                  ctrt.ex=
t_type =3D 0x6000 | ha->stype;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3856          }
8e9a8a0d56c5d9 Jeff Garzik        2007-07-17  3857          ctrt.device_id =
=3D ha->pdev->device;
8e9a8a0d56c5d9 Jeff Garzik        2007-07-17  3858          ctrt.sub_device=
_id =3D ha->pdev->subsystem_device;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3859          ctrt.info =3D h=
a->brd_phys;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3860          ctrt.oem_id =3D=
 ha->oem_id;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3861          if (copy_to_use=
r(argp, &ctrt, sizeof(gdth_ioctl_ctrtype)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  3862              return -EFA=
ULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3863          break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3864        }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3865          =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3866        case GDTIOCTL_GEN=
ERAL:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3867          return ioc_gene=
ral(argp, cmnd);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3868  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3869        case GDTIOCTL_EVE=
NT:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3870          return ioc_even=
t(argp);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3871  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3872        case GDTIOCTL_LOC=
KDRV:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3873          return ioc_lock=
drv(argp);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3874  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3875        case GDTIOCTL_LOC=
KCHN:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3876        {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3877          gdth_ioctl_lock=
chn lchn;
1fe6dbf4d0afba Dave Jones         2010-01-04  3878          u8 i, j;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3879  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3880          if (copy_from_u=
ser(&lchn, argp, sizeof(gdth_ioctl_lockchn)) ||
884f7fba096467 Boaz Harrosh       2007-10-02  3881              (NULL =3D=
=3D (ha =3D gdth_find_ha(lchn.ionode))))
^1da177e4c3f41 Linus Torvalds     2005-04-16  3882              return -EFA=
ULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3883  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3884          i =3D lchn.chan=
nel;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3885          if (i < ha->bus=
_cnt) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3886              if (lchn.lo=
ck) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3887                  spin_lo=
ck_irqsave(&ha->smp_lock, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3888                  ha->raw=
[i].lock =3D 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3889                  spin_un=
lock_irqrestore(&ha->smp_lock, flags);
242f9dcb8ba6f6 Jens Axboe         2008-09-14  3890  		for (j =3D 0; j < ha-=
>tid_cnt; ++j)
45f1a41b2b2e02 Boaz Harrosh       2007-10-02  3891                      gdt=
h_wait_completion(ha, i, j);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3892              } else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3893                  spin_lo=
ck_irqsave(&ha->smp_lock, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3894                  ha->raw=
[i].lock =3D 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3895                  spin_un=
lock_irqrestore(&ha->smp_lock, flags);
242f9dcb8ba6f6 Jens Axboe         2008-09-14  3896  		for (j =3D 0; j < ha-=
>tid_cnt; ++j)
45f1a41b2b2e02 Boaz Harrosh       2007-10-02  3897                      gdt=
h_next(ha);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3898              }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3899          } =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3900          break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3901        }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3902  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3903        case GDTIOCTL_RES=
CAN:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3904          return ioc_resc=
an(argp, cmnd);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3905  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3906        case GDTIOCTL_HDR=
LIST:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3907          return ioc_hdrl=
ist(argp, cmnd);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3908  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3909        case GDTIOCTL_RES=
ET_BUS:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3910        {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3911          gdth_ioctl_rese=
t res;
45f1a41b2b2e02 Boaz Harrosh       2007-10-02  3912          int rval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3913  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3914          if (copy_from_u=
ser(&res, argp, sizeof(gdth_ioctl_reset)) ||
884f7fba096467 Boaz Harrosh       2007-10-02  3915              (NULL =3D=
=3D (ha =3D gdth_find_ha(res.ionode))))
^1da177e4c3f41 Linus Torvalds     2005-04-16  3916              return -EFA=
ULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3917  =

bbfbbbc1182f8b Mariusz Kozlowski  2007-08-11  3918          scp  =3D kzallo=
c(sizeof(*scp), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3919          if (!scp)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3920              return -ENO=
MEM;
cbd5f69b98bb5d Leubner, Achim     2006-06-09  3921          scp->device =3D=
 ha->sdev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3922          scp->cmd_len =
=3D 12;
52759e6abc88fe Christoph Hellwig  2007-10-02  3923          scp->device->ch=
annel =3D res.number;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3924          rval =3D gdth_e=
h_bus_reset(scp);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3925          res.status =3D =
(rval =3D=3D SUCCESS ? S_OK : S_GENERR);
cbd5f69b98bb5d Leubner, Achim     2006-06-09  3926          kfree(scp);
8d7a5da4fc95cb Jeff Garzik        2007-10-02  3927  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3928          if (copy_to_use=
r(argp, &res, sizeof(gdth_ioctl_reset)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  3929              return -EFA=
ULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3930          break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3931        }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3932  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3933        case GDTIOCTL_RES=
ET_DRV:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3934          return ioc_rese=
tdrv(argp, cmnd);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3935  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3936        default:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3937          break; =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3938      }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3939      return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3940  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3941  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3715480763093138170==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
LE5kkOxBebP8HyxUj9GwHwIA
--===============3715480763093138170==--


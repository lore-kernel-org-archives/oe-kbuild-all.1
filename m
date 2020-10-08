Content-Type: multipart/mixed; boundary="===============4545584999947730205=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [kdave-btrfs-devel:misc-next 160/161] fs/btrfs/volumes.c:888:50: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Fri, 09 Oct 2020 05:25:05 +0800
Message-ID: <202010090553.3IkXoI35-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4545584999947730205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   1fd4033dd011a3525bacddf37ab9eac425d25c4f
commit: 8d1a7aae89dc0c41ffb76fe1007dbba59d13881b [160/161] btrfs: annotate =
device name rcu_string with __rcu
config: sh-randconfig-s031-20201008 (attached as .config)
compiler: sh4-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-218-gc0e96d6d-dirty
        # https://github.com/kdave/btrfs-devel/commit/8d1a7aae89dc0c41ffb76=
fe1007dbba59d13881b
        git remote add kdave-btrfs-devel https://github.com/kdave/btrfs-dev=
el.git
        git fetch --no-tags kdave-btrfs-devel misc-next
        git checkout 8d1a7aae89dc0c41ffb76fe1007dbba59d13881b
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dsh =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

echo
echo "sparse warnings: (new ones prefixed by >>)"
echo
   fs/btrfs/volumes.c:374:31: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct rcu_string *str @@     go=
t struct rcu_string [noderef] __rcu *name @@
   fs/btrfs/volumes.c:374:31: sparse:     expected struct rcu_string *str
   fs/btrfs/volumes.c:374:31: sparse:     got struct rcu_string [noderef] _=
_rcu *name
   fs/btrfs/volumes.c:631:43: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected char const *device_path @@     g=
ot char [noderef] __rcu * @@
   fs/btrfs/volumes.c:631:43: sparse:     expected char const *device_path
   fs/btrfs/volumes.c:631:43: sparse:     got char [noderef] __rcu *
>> fs/btrfs/volumes.c:888:50: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected char const *__cs @@     got char=
 [noderef] __rcu * @@
>> fs/btrfs/volumes.c:888:50: sparse:     expected char const *__cs
   fs/btrfs/volumes.c:888:50: sparse:     got char [noderef] __rcu *
   fs/btrfs/volumes.c:963:39: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected struct rcu_string *str @@     go=
t struct rcu_string [noderef] __rcu *name @@
   fs/btrfs/volumes.c:963:39: sparse:     expected struct rcu_string *str
   fs/btrfs/volumes.c:963:39: sparse:     got struct rcu_string [noderef] _=
_rcu *name
   fs/btrfs/volumes.c:1018:58: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected char const *src @@     got char=
 [noderef] __rcu * @@
   fs/btrfs/volumes.c:1018:58: sparse:     expected char const *src
   fs/btrfs/volumes.c:1018:58: sparse:     got char [noderef] __rcu *
   fs/btrfs/volumes.c:2165:49: sparse: sparse: incorrect type in argument 3=
 (different address spaces) @@     expected char const *device_path @@     =
got char [noderef] __rcu * @@
   fs/btrfs/volumes.c:2165:49: sparse:     expected char const *device_path
   fs/btrfs/volumes.c:2165:49: sparse:     got char [noderef] __rcu *
   fs/btrfs/volumes.c:2273:41: sparse: sparse: incorrect type in argument 3=
 (different address spaces) @@     expected char const *device_path @@     =
got char [noderef] __rcu * @@
   fs/btrfs/volumes.c:2273:41: sparse:     expected char const *device_path
   fs/btrfs/volumes.c:2273:41: sparse:     got char [noderef] __rcu *

vim +888 fs/btrfs/volumes.c

1362089d2ad7e2 Nikolay Borisov           2020-01-10  745  =

1362089d2ad7e2 Nikolay Borisov           2020-01-10  746  static struct btr=
fs_fs_devices *find_fsid_reverted_metadata(
1362089d2ad7e2 Nikolay Borisov           2020-01-10  747  				struct btrfs_=
super_block *disk_super)
1362089d2ad7e2 Nikolay Borisov           2020-01-10  748  {
1362089d2ad7e2 Nikolay Borisov           2020-01-10  749  	struct btrfs_fs_=
devices *fs_devices;
1362089d2ad7e2 Nikolay Borisov           2020-01-10  750  =

1362089d2ad7e2 Nikolay Borisov           2020-01-10  751  	/*
1362089d2ad7e2 Nikolay Borisov           2020-01-10  752  	 * Handle the ca=
se where the scanned device is part of an fs whose last
1362089d2ad7e2 Nikolay Borisov           2020-01-10  753  	 * metadata UUID=
 change reverted it to the original FSID. At the same
1362089d2ad7e2 Nikolay Borisov           2020-01-10  754  	 * time * fs_dev=
ices was first created by another constitutent device
1362089d2ad7e2 Nikolay Borisov           2020-01-10  755  	 * which didn't =
fully observe the operation. This results in an
1362089d2ad7e2 Nikolay Borisov           2020-01-10  756  	 * btrfs_fs_devi=
ces created with metadata/fsid different AND
1362089d2ad7e2 Nikolay Borisov           2020-01-10  757  	 * btrfs_fs_devi=
ces::fsid_change set AND the metadata_uuid of the
1362089d2ad7e2 Nikolay Borisov           2020-01-10  758  	 * fs_devices eq=
ual to the FSID of the disk.
1362089d2ad7e2 Nikolay Borisov           2020-01-10  759  	 */
1362089d2ad7e2 Nikolay Borisov           2020-01-10  760  	list_for_each_en=
try(fs_devices, &fs_uuids, fs_list) {
1362089d2ad7e2 Nikolay Borisov           2020-01-10  761  		if (memcmp(fs_d=
evices->fsid, fs_devices->metadata_uuid,
1362089d2ad7e2 Nikolay Borisov           2020-01-10  762  			   BTRFS_FSID_=
SIZE) !=3D 0 &&
1362089d2ad7e2 Nikolay Borisov           2020-01-10  763  		    memcmp(fs_d=
evices->metadata_uuid, disk_super->fsid,
1362089d2ad7e2 Nikolay Borisov           2020-01-10  764  			   BTRFS_FSID_=
SIZE) =3D=3D 0 &&
1362089d2ad7e2 Nikolay Borisov           2020-01-10  765  		    fs_devices-=
>fsid_change)
1362089d2ad7e2 Nikolay Borisov           2020-01-10  766  			return fs_devi=
ces;
1362089d2ad7e2 Nikolay Borisov           2020-01-10  767  	}
1362089d2ad7e2 Nikolay Borisov           2020-01-10  768  =

1362089d2ad7e2 Nikolay Borisov           2020-01-10  769  	return NULL;
1362089d2ad7e2 Nikolay Borisov           2020-01-10  770  }
60999ca4b4033e David Sterba              2014-03-26  771  /*
60999ca4b4033e David Sterba              2014-03-26  772   * Add new device=
 to list of registered devices
60999ca4b4033e David Sterba              2014-03-26  773   *
60999ca4b4033e David Sterba              2014-03-26  774   * Returns:
e124ece53edf3a Anand Jain                2018-01-18  775   * device pointer=
 which was just added or updated when successful
e124ece53edf3a Anand Jain                2018-01-18  776   * error pointer =
when failed
60999ca4b4033e David Sterba              2014-03-26  777   */
e124ece53edf3a Anand Jain                2018-01-18  778  static noinline s=
truct btrfs_device *device_list_add(const char *path,
4306a97449f9a0 Anand Jain                2018-05-29  779  			   struct btrf=
s_super_block *disk_super,
4306a97449f9a0 Anand Jain                2018-05-29  780  			   bool *new_d=
evice_added)
8a4b83cc8bd75f Chris Mason               2008-03-24  781  {
8a4b83cc8bd75f Chris Mason               2008-03-24  782  	struct btrfs_dev=
ice *device;
7a62d0f07377b5 Nikolay Borisov           2018-10-30  783  	struct btrfs_fs_=
devices *fs_devices =3D NULL;
606686eeac4550 Josef Bacik               2012-06-04  784  	struct rcu_strin=
g *name;
8a4b83cc8bd75f Chris Mason               2008-03-24  785  	u64 found_transi=
d =3D btrfs_super_generation(disk_super);
3acbcbfc8f06d4 Anand Jain                2018-01-18  786  	u64 devid =3D bt=
rfs_stack_device_id(&disk_super->dev_item);
7239ff4b2be8ec Nikolay Borisov           2018-10-30  787  	bool has_metadat=
a_uuid =3D (btrfs_super_incompat_flags(disk_super) &
7239ff4b2be8ec Nikolay Borisov           2018-10-30  788  		BTRFS_FEATURE_I=
NCOMPAT_METADATA_UUID);
d1a63002829a4d Nikolay Borisov           2018-10-30  789  	bool fsid_change=
_in_progress =3D (btrfs_super_flags(disk_super) &
d1a63002829a4d Nikolay Borisov           2018-10-30  790  					BTRFS_SUPER_=
FLAG_CHANGING_FSID_V2);
7239ff4b2be8ec Nikolay Borisov           2018-10-30  791  =

cc5de4e70256cb Nikolay Borisov           2018-10-30  792  	if (fsid_change_=
in_progress) {
c0d81c7cb23678 Su Yue                    2020-01-10  793  		if (!has_metada=
ta_uuid)
7a62d0f07377b5 Nikolay Borisov           2018-10-30  794  			fs_devices =3D=
 find_fsid_inprogress(disk_super);
c0d81c7cb23678 Su Yue                    2020-01-10  795  		else
cc5de4e70256cb Nikolay Borisov           2018-10-30  796  			fs_devices =3D=
 find_fsid_changed(disk_super);
7a62d0f07377b5 Nikolay Borisov           2018-10-30  797  	} else if (has_m=
etadata_uuid) {
c6730a0e5778bf Su Yue                    2020-01-10  798  		fs_devices =3D =
find_fsid_with_metadata_uuid(disk_super);
7a62d0f07377b5 Nikolay Borisov           2018-10-30  799  	} else {
1362089d2ad7e2 Nikolay Borisov           2020-01-10  800  		fs_devices =3D =
find_fsid_reverted_metadata(disk_super);
1362089d2ad7e2 Nikolay Borisov           2020-01-10  801  		if (!fs_devices)
7a62d0f07377b5 Nikolay Borisov           2018-10-30  802  			fs_devices =3D=
 find_fsid(disk_super->fsid, NULL);
7a62d0f07377b5 Nikolay Borisov           2018-10-30  803  	}
7a62d0f07377b5 Nikolay Borisov           2018-10-30  804  =

7a62d0f07377b5 Nikolay Borisov           2018-10-30  805  =

8a4b83cc8bd75f Chris Mason               2008-03-24  806  	if (!fs_devices)=
 {
7239ff4b2be8ec Nikolay Borisov           2018-10-30  807  		if (has_metadat=
a_uuid)
7239ff4b2be8ec Nikolay Borisov           2018-10-30  808  			fs_devices =3D=
 alloc_fs_devices(disk_super->fsid,
7239ff4b2be8ec Nikolay Borisov           2018-10-30  809  						      disk_=
super->metadata_uuid);
7239ff4b2be8ec Nikolay Borisov           2018-10-30  810  		else
7239ff4b2be8ec Nikolay Borisov           2018-10-30  811  			fs_devices =3D=
 alloc_fs_devices(disk_super->fsid, NULL);
7239ff4b2be8ec Nikolay Borisov           2018-10-30  812  =

2208a378f35fea Ilya Dryomov              2013-08-12  813  		if (IS_ERR(fs_d=
evices))
e124ece53edf3a Anand Jain                2018-01-18  814  			return ERR_CAS=
T(fs_devices);
2208a378f35fea Ilya Dryomov              2013-08-12  815  =

92900e5160a544 Al Viro                   2019-01-27  816  		fs_devices->fsi=
d_change =3D fsid_change_in_progress;
92900e5160a544 Al Viro                   2019-01-27  817  =

9c6d173ea6e4c8 Anand Jain                2018-05-29  818  		mutex_lock(&fs_=
devices->device_list_mutex);
c4babc5e38e94e Anand Jain                2018-04-12  819  		list_add(&fs_de=
vices->fs_list, &fs_uuids);
2208a378f35fea Ilya Dryomov              2013-08-12  820  =

8a4b83cc8bd75f Chris Mason               2008-03-24  821  		device =3D NULL;
8a4b83cc8bd75f Chris Mason               2008-03-24  822  	} else {
9c6d173ea6e4c8 Anand Jain                2018-05-29  823  		mutex_lock(&fs_=
devices->device_list_mutex);
09ba3bc9dd1504 Anand Jain                2019-01-19  824  		device =3D btrf=
s_find_device(fs_devices, devid,
09ba3bc9dd1504 Anand Jain                2019-01-19  825  				disk_super->d=
ev_item.uuid, NULL, false);
7a62d0f07377b5 Nikolay Borisov           2018-10-30  826  =

7a62d0f07377b5 Nikolay Borisov           2018-10-30  827  		/*
7a62d0f07377b5 Nikolay Borisov           2018-10-30  828  		 * If this disk=
 has been pulled into an fs devices created by
7a62d0f07377b5 Nikolay Borisov           2018-10-30  829  		 * a device whi=
ch had the CHANGING_FSID_V2 flag then replace the
7a62d0f07377b5 Nikolay Borisov           2018-10-30  830  		 * metadata_uui=
d/fsid values of the fs_devices.
7a62d0f07377b5 Nikolay Borisov           2018-10-30  831  		 */
1362089d2ad7e2 Nikolay Borisov           2020-01-10  832  		if (fs_devices-=
>fsid_change &&
7a62d0f07377b5 Nikolay Borisov           2018-10-30  833  		    found_trans=
id > fs_devices->latest_generation) {
7a62d0f07377b5 Nikolay Borisov           2018-10-30  834  			memcpy(fs_devi=
ces->fsid, disk_super->fsid,
7a62d0f07377b5 Nikolay Borisov           2018-10-30  835  					BTRFS_FSID_S=
IZE);
1362089d2ad7e2 Nikolay Borisov           2020-01-10  836  =

1362089d2ad7e2 Nikolay Borisov           2020-01-10  837  			if (has_metada=
ta_uuid)
1362089d2ad7e2 Nikolay Borisov           2020-01-10  838  				memcpy(fs_dev=
ices->metadata_uuid,
1362089d2ad7e2 Nikolay Borisov           2020-01-10  839  				       disk_s=
uper->metadata_uuid,
1362089d2ad7e2 Nikolay Borisov           2020-01-10  840  				       BTRFS_=
FSID_SIZE);
1362089d2ad7e2 Nikolay Borisov           2020-01-10  841  			else
7a62d0f07377b5 Nikolay Borisov           2018-10-30  842  				memcpy(fs_dev=
ices->metadata_uuid,
1362089d2ad7e2 Nikolay Borisov           2020-01-10  843  				       disk_s=
uper->fsid, BTRFS_FSID_SIZE);
7a62d0f07377b5 Nikolay Borisov           2018-10-30  844  =

7a62d0f07377b5 Nikolay Borisov           2018-10-30  845  			fs_devices->fs=
id_change =3D false;
7a62d0f07377b5 Nikolay Borisov           2018-10-30  846  		}
8a4b83cc8bd75f Chris Mason               2008-03-24  847  	}
443f24fee73170 Miao Xie                  2014-07-24  848  =

8a4b83cc8bd75f Chris Mason               2008-03-24  849  	if (!device) {
9c6d173ea6e4c8 Anand Jain                2018-05-29  850  		if (fs_devices-=
>opened) {
9c6d173ea6e4c8 Anand Jain                2018-05-29  851  			mutex_unlock(&=
fs_devices->device_list_mutex);
e124ece53edf3a Anand Jain                2018-01-18  852  			return ERR_PTR=
(-EBUSY);
9c6d173ea6e4c8 Anand Jain                2018-05-29  853  		}
2b82032c34ec40 Yan Zheng                 2008-11-17  854  =

12bd2fc0d2f589 Ilya Dryomov              2013-08-23  855  		device =3D btrf=
s_alloc_device(NULL, &devid,
12bd2fc0d2f589 Ilya Dryomov              2013-08-23  856  					    disk_sup=
er->dev_item.uuid);
12bd2fc0d2f589 Ilya Dryomov              2013-08-23  857  		if (IS_ERR(devi=
ce)) {
9c6d173ea6e4c8 Anand Jain                2018-05-29  858  			mutex_unlock(&=
fs_devices->device_list_mutex);
8a4b83cc8bd75f Chris Mason               2008-03-24  859  			/* we can safe=
ly leave the fs_devices entry around */
e124ece53edf3a Anand Jain                2018-01-18  860  			return device;
8a4b83cc8bd75f Chris Mason               2008-03-24  861  		}
606686eeac4550 Josef Bacik               2012-06-04  862  =

606686eeac4550 Josef Bacik               2012-06-04  863  		name =3D rcu_st=
ring_strdup(path, GFP_NOFS);
606686eeac4550 Josef Bacik               2012-06-04  864  		if (!name) {
a425f9d4755a14 David Sterba              2018-03-20  865  			btrfs_free_dev=
ice(device);
9c6d173ea6e4c8 Anand Jain                2018-05-29  866  			mutex_unlock(&=
fs_devices->device_list_mutex);
e124ece53edf3a Anand Jain                2018-01-18  867  			return ERR_PTR=
(-ENOMEM);
8a4b83cc8bd75f Chris Mason               2008-03-24  868  		}
606686eeac4550 Josef Bacik               2012-06-04  869  		rcu_assign_poin=
ter(device->name, name);
90519d66abbccc Arne Jansen               2011-05-23  870  =

1f78160ce1b1b8 Xiao Guangrong            2011-04-20  871  		list_add_rcu(&d=
evice->dev_list, &fs_devices->devices);
f71717502460c5 Filipe David Borba Manana 2013-08-12  872  		fs_devices->num=
_devices++;
e5e9a5206a171b Chris Mason               2009-06-10  873  =

2b82032c34ec40 Yan Zheng                 2008-11-17  874  		device->fs_devi=
ces =3D fs_devices;
4306a97449f9a0 Anand Jain                2018-05-29  875  		*new_device_add=
ed =3D true;
327f18cc7f44bc Anand Jain                2018-01-18  876  =

327f18cc7f44bc Anand Jain                2018-01-18  877  		if (disk_super-=
>label[0])
aa6c0df73e3b3f Anand Jain                2019-10-02  878  			pr_info(
aa6c0df73e3b3f Anand Jain                2019-10-02  879  	"BTRFS: device l=
abel %s devid %llu transid %llu %s scanned by %s (%d)\n",
aa6c0df73e3b3f Anand Jain                2019-10-02  880  				disk_super->l=
abel, devid, found_transid, path,
aa6c0df73e3b3f Anand Jain                2019-10-02  881  				current->comm=
, task_pid_nr(current));
327f18cc7f44bc Anand Jain                2018-01-18  882  		else
aa6c0df73e3b3f Anand Jain                2019-10-02  883  			pr_info(
aa6c0df73e3b3f Anand Jain                2019-10-02  884  	"BTRFS: device f=
sid %pU devid %llu transid %llu %s scanned by %s (%d)\n",
aa6c0df73e3b3f Anand Jain                2019-10-02  885  				disk_super->f=
sid, devid, found_transid, path,
aa6c0df73e3b3f Anand Jain                2019-10-02  886  				current->comm=
, task_pid_nr(current));
327f18cc7f44bc Anand Jain                2018-01-18  887  =

606686eeac4550 Josef Bacik               2012-06-04 @888  	} else if (!devi=
ce->name || strcmp(device->name->str, path)) {
b96de000bc8bc9 Anand Jain                2014-07-03  889  		/*
b96de000bc8bc9 Anand Jain                2014-07-03  890  		 * When FS is a=
lready mounted.
b96de000bc8bc9 Anand Jain                2014-07-03  891  		 * 1. If you ar=
e here and if the device->name is NULL that
b96de000bc8bc9 Anand Jain                2014-07-03  892  		 *    means thi=
s device was missing at time of FS mount.
b96de000bc8bc9 Anand Jain                2014-07-03  893  		 * 2. If you ar=
e here and if the device->name is different
b96de000bc8bc9 Anand Jain                2014-07-03  894  		 *    from 'pat=
h' that means either
b96de000bc8bc9 Anand Jain                2014-07-03  895  		 *      a. The =
same device disappeared and reappeared with
b96de000bc8bc9 Anand Jain                2014-07-03  896  		 *         diff=
erent name. or
b96de000bc8bc9 Anand Jain                2014-07-03  897  		 *      b. The =
missing-disk-which-was-replaced, has
b96de000bc8bc9 Anand Jain                2014-07-03  898  		 *         reap=
peared now.
b96de000bc8bc9 Anand Jain                2014-07-03  899  		 *
b96de000bc8bc9 Anand Jain                2014-07-03  900  		 * We must allo=
w 1 and 2a above. But 2b would be a spurious
b96de000bc8bc9 Anand Jain                2014-07-03  901  		 * and unintent=
ional.
b96de000bc8bc9 Anand Jain                2014-07-03  902  		 *
b96de000bc8bc9 Anand Jain                2014-07-03  903  		 * Further in c=
ase of 1 and 2a above, the disk at 'path'
b96de000bc8bc9 Anand Jain                2014-07-03  904  		 * would have m=
issed some transaction when it was away and
b96de000bc8bc9 Anand Jain                2014-07-03  905  		 * in case of 2=
a the stale bdev has to be updated as well.
b96de000bc8bc9 Anand Jain                2014-07-03  906  		 * 2b must not =
be allowed at all time.
b96de000bc8bc9 Anand Jain                2014-07-03  907  		 */
b96de000bc8bc9 Anand Jain                2014-07-03  908  =

b96de000bc8bc9 Anand Jain                2014-07-03  909  		/*
0f23ae74f58930 Chris Mason               2014-09-18  910  		 * For now, we =
do allow update to btrfs_fs_device through the
0f23ae74f58930 Chris Mason               2014-09-18  911  		 * btrfs dev sc=
an cli after FS has been mounted.  We're still
0f23ae74f58930 Chris Mason               2014-09-18  912  		 * tracking a p=
roblem where systems fail mount by subvolume id
0f23ae74f58930 Chris Mason               2014-09-18  913  		 * when we reje=
ct replacement on a mounted FS.
b96de000bc8bc9 Anand Jain                2014-07-03  914  		 */
0f23ae74f58930 Chris Mason               2014-09-18  915  		if (!fs_devices=
->opened && found_transid < device->generation) {
77bdae4d136e16 Anand Jain                2014-07-03  916  			/*
77bdae4d136e16 Anand Jain                2014-07-03  917  			 * That is if =
the FS is _not_ mounted and if you
77bdae4d136e16 Anand Jain                2014-07-03  918  			 * are here, t=
hat means there is more than one
77bdae4d136e16 Anand Jain                2014-07-03  919  			 * disk with s=
ame uuid and devid.We keep the one
77bdae4d136e16 Anand Jain                2014-07-03  920  			 * with larger=
 generation number or the last-in if
77bdae4d136e16 Anand Jain                2014-07-03  921  			 * generation =
are equal.
77bdae4d136e16 Anand Jain                2014-07-03  922  			 */
9c6d173ea6e4c8 Anand Jain                2018-05-29  923  			mutex_unlock(&=
fs_devices->device_list_mutex);
e124ece53edf3a Anand Jain                2018-01-18  924  			return ERR_PTR=
(-EEXIST);
77bdae4d136e16 Anand Jain                2014-07-03  925  		}
b96de000bc8bc9 Anand Jain                2014-07-03  926  =

a9261d4125c97c Anand Jain                2018-10-15  927  		/*
a9261d4125c97c Anand Jain                2018-10-15  928  		 * We are going=
 to replace the device path for a given devid,
a9261d4125c97c Anand Jain                2018-10-15  929  		 * make sure it=
's the same device if the device is mounted
a9261d4125c97c Anand Jain                2018-10-15  930  		 */
a9261d4125c97c Anand Jain                2018-10-15  931  		if (device->bde=
v) {
a9261d4125c97c Anand Jain                2018-10-15  932  			struct block_d=
evice *path_bdev;
a9261d4125c97c Anand Jain                2018-10-15  933  =

a9261d4125c97c Anand Jain                2018-10-15  934  			path_bdev =3D =
lookup_bdev(path);
a9261d4125c97c Anand Jain                2018-10-15  935  			if (IS_ERR(pat=
h_bdev)) {
a9261d4125c97c Anand Jain                2018-10-15  936  				mutex_unlock(=
&fs_devices->device_list_mutex);
a9261d4125c97c Anand Jain                2018-10-15  937  				return ERR_CA=
ST(path_bdev);
a9261d4125c97c Anand Jain                2018-10-15  938  			}
a9261d4125c97c Anand Jain                2018-10-15  939  =

a9261d4125c97c Anand Jain                2018-10-15  940  			if (device->bd=
ev !=3D path_bdev) {
a9261d4125c97c Anand Jain                2018-10-15  941  				bdput(path_bd=
ev);
a9261d4125c97c Anand Jain                2018-10-15  942  				mutex_unlock(=
&fs_devices->device_list_mutex);
a9261d4125c97c Anand Jain                2018-10-15  943  				btrfs_warn_in=
_rcu(device->fs_info,
79dae17d8d44b2 Anand Jain                2020-09-03  944  	"duplicate devic=
e %s devid %llu generation %llu scanned by %s (%d)",
79dae17d8d44b2 Anand Jain                2020-09-03  945  						  path, dev=
id, found_transid,
79dae17d8d44b2 Anand Jain                2020-09-03  946  						  current->=
comm,
79dae17d8d44b2 Anand Jain                2020-09-03  947  						  task_pid_=
nr(current));
a9261d4125c97c Anand Jain                2018-10-15  948  				return ERR_PT=
R(-EEXIST);
a9261d4125c97c Anand Jain                2018-10-15  949  			}
a9261d4125c97c Anand Jain                2018-10-15  950  			bdput(path_bde=
v);
a9261d4125c97c Anand Jain                2018-10-15  951  			btrfs_info_in_=
rcu(device->fs_info,
79dae17d8d44b2 Anand Jain                2020-09-03  952  	"devid %llu devi=
ce path %s changed to %s scanned by %s (%d)",
79dae17d8d44b2 Anand Jain                2020-09-03  953  					  devid, rcu=
_str_deref(device->name),
79dae17d8d44b2 Anand Jain                2020-09-03  954  					  path, curr=
ent->comm,
79dae17d8d44b2 Anand Jain                2020-09-03  955  					  task_pid_n=
r(current));
a9261d4125c97c Anand Jain                2018-10-15  956  		}
a9261d4125c97c Anand Jain                2018-10-15  957  =

606686eeac4550 Josef Bacik               2012-06-04  958  		name =3D rcu_st=
ring_strdup(path, GFP_NOFS);
9c6d173ea6e4c8 Anand Jain                2018-05-29  959  		if (!name) {
9c6d173ea6e4c8 Anand Jain                2018-05-29  960  			mutex_unlock(&=
fs_devices->device_list_mutex);
e124ece53edf3a Anand Jain                2018-01-18  961  			return ERR_PTR=
(-ENOMEM);
9c6d173ea6e4c8 Anand Jain                2018-05-29  962  		}
606686eeac4550 Josef Bacik               2012-06-04  963  		rcu_string_free=
(device->name);
606686eeac4550 Josef Bacik               2012-06-04  964  		rcu_assign_poin=
ter(device->name, name);
e6e674bd4d54fe Anand Jain                2017-12-04  965  		if (test_bit(BT=
RFS_DEV_STATE_MISSING, &device->dev_state)) {
cd02dca56442e1 Chris Mason               2010-12-13  966  			fs_devices->mi=
ssing_devices--;
e6e674bd4d54fe Anand Jain                2017-12-04  967  			clear_bit(BTRF=
S_DEV_STATE_MISSING, &device->dev_state);
cd02dca56442e1 Chris Mason               2010-12-13  968  		}
8a4b83cc8bd75f Chris Mason               2008-03-24  969  	}
8a4b83cc8bd75f Chris Mason               2008-03-24  970  =

77bdae4d136e16 Anand Jain                2014-07-03  971  	/*
77bdae4d136e16 Anand Jain                2014-07-03  972  	 * Unmount does =
not free the btrfs_device struct but would zero
77bdae4d136e16 Anand Jain                2014-07-03  973  	 * generation al=
ong with most of the other members. So just update
77bdae4d136e16 Anand Jain                2014-07-03  974  	 * it back. We n=
eed it to pick the disk with largest generation
77bdae4d136e16 Anand Jain                2014-07-03  975  	 * (as above).
77bdae4d136e16 Anand Jain                2014-07-03  976  	 */
d1a63002829a4d Nikolay Borisov           2018-10-30  977  	if (!fs_devices-=
>opened) {
77bdae4d136e16 Anand Jain                2014-07-03  978  		device->generat=
ion =3D found_transid;
d1a63002829a4d Nikolay Borisov           2018-10-30  979  		fs_devices->lat=
est_generation =3D max_t(u64, found_transid,
d1a63002829a4d Nikolay Borisov           2018-10-30  980  						fs_devices-=
>latest_generation);
d1a63002829a4d Nikolay Borisov           2018-10-30  981  	}
77bdae4d136e16 Anand Jain                2014-07-03  982  =

f2788d2f76cafe Anand Jain                2018-01-18  983  	fs_devices->tota=
l_devices =3D btrfs_super_num_devices(disk_super);
f2788d2f76cafe Anand Jain                2018-01-18  984  =

9c6d173ea6e4c8 Anand Jain                2018-05-29  985  	mutex_unlock(&fs=
_devices->device_list_mutex);
e124ece53edf3a Anand Jain                2018-01-18  986  	return device;
8a4b83cc8bd75f Chris Mason               2008-03-24  987  }
8a4b83cc8bd75f Chris Mason               2008-03-24  988  =


:::::: The code at line 888 was first introduced by commit
:::::: 606686eeac4550d2212bf3d621a810407ef5e9bf Btrfs: use rcu to protect d=
evice->name

:::::: TO: Josef Bacik <josef@redhat.com>
:::::: CC: Chris Mason <chris.mason@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4545584999947730205==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
5wZJAkBbfHxlhpIugqM0Jr4t/ge5TPztn4QBAA==
--===============4545584999947730205==--


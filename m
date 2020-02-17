Content-Type: multipart/mixed; boundary="===============5689280987409578624=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [brauner:fsid_mappings_v3_v1 4/21] kernel/user_namespace.c:1387:32: error: 'struct user_namespace' has no member named 'fsuid_map'; did you mean 'uid_map'?
Date: Tue, 18 Feb 2020 01:03:21 +0800
Message-ID: <202002180119.5fb67DvA%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5689280987409578624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git f=
sid_mappings_v3_v1
head:   49bef2381d5d8e71b4612898c7087563ea068447
commit: 7d87f90cbe112621e8f48eea8d20fba3376a94f4 [4/21] fsuidgid: add fsid =
mapping helpers
config: nds32-defconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 7d87f90cbe112621e8f48eea8d20fba3376a94f4
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Dnds32 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   kernel/user_namespace.c: In function 'proc_uid_map_write':
>> kernel/user_namespace.c:1387:32: error: 'struct user_namespace' has no m=
ember named 'fsuid_map'; did you mean 'uid_map'?
    1387 |     &ns->parent->uid_map, &ns->fsuid_map,
         |                                ^~~~~~~~~
         |                                uid_map
   kernel/user_namespace.c:1388:18: error: 'struct user_namespace' has no m=
ember named 'fsuid_map'; did you mean 'uid_map'?
    1388 |     &ns->parent->fsuid_map);
         |                  ^~~~~~~~~
         |                  uid_map
   kernel/user_namespace.c: In function 'proc_gid_map_write':
>> kernel/user_namespace.c:1405:32: error: 'struct user_namespace' has no m=
ember named 'fsgid_map'; did you mean 'gid_map'?
    1405 |     &ns->parent->gid_map, &ns->fsgid_map,
         |                                ^~~~~~~~~
         |                                gid_map
   kernel/user_namespace.c:1406:18: error: 'struct user_namespace' has no m=
ember named 'fsgid_map'; did you mean 'gid_map'?
    1406 |     &ns->parent->fsgid_map);
         |                  ^~~~~~~~~
         |                  gid_map
   kernel/user_namespace.c: In function 'new_idmap_permitted':
>> kernel/user_namespace.c:1483:17: error: 'map_fsid' undeclared (first use=
 in this function)
    1483 |    kuid_t uid =3D map_fsid ? make_kfsuid(ns->parent, id) :
         |                 ^~~~~~~~
   kernel/user_namespace.c:1483:17: note: each undeclared identifier is rep=
orted only once for each function it appears in
   kernel/user_namespace.c: In function 'proc_uid_map_write':
>> kernel/user_namespace.c:1389:1: warning: control reaches end of non-void=
 function [-Wreturn-type]
    1389 | }
         | ^
   kernel/user_namespace.c: In function 'proc_gid_map_write':
   kernel/user_namespace.c:1407:1: warning: control reaches end of non-void=
 function [-Wreturn-type]
    1407 | }
         | ^

vim +1387 kernel/user_namespace.c

  1372	=

  1373	ssize_t proc_uid_map_write(struct file *file, const char __user *buf,
  1374				   size_t size, loff_t *ppos)
  1375	{
  1376		struct seq_file *seq =3D file->private_data;
  1377		struct user_namespace *ns =3D seq->private;
  1378		struct user_namespace *seq_ns =3D seq_user_ns(seq);
  1379	=

  1380		if (!ns->parent)
  1381			return -EPERM;
  1382	=

  1383		if ((seq_ns !=3D ns) && (seq_ns !=3D ns->parent))
  1384			return -EPERM;
  1385	=

  1386		return map_write(file, buf, size, ppos, CAP_SETUID, &ns->uid_map,
> 1387				 &ns->parent->uid_map, &ns->fsuid_map,
  1388				 &ns->parent->fsuid_map);
> 1389	}
  1390	=

  1391	ssize_t proc_gid_map_write(struct file *file, const char __user *buf,
  1392				   size_t size, loff_t *ppos)
  1393	{
  1394		struct seq_file *seq =3D file->private_data;
  1395		struct user_namespace *ns =3D seq->private;
  1396		struct user_namespace *seq_ns =3D seq_user_ns(seq);
  1397	=

  1398		if (!ns->parent)
  1399			return -EPERM;
  1400	=

  1401		if ((seq_ns !=3D ns) && (seq_ns !=3D ns->parent))
  1402			return -EPERM;
  1403	=

  1404		return map_write(file, buf, size, ppos, CAP_SETGID, &ns->gid_map,
> 1405				 &ns->parent->gid_map, &ns->fsgid_map,
  1406				 &ns->parent->fsgid_map);
  1407	}
  1408	=

  1409	ssize_t proc_projid_map_write(struct file *file, const char __user *=
buf,
  1410				      size_t size, loff_t *ppos)
  1411	{
  1412		struct seq_file *seq =3D file->private_data;
  1413		struct user_namespace *ns =3D seq->private;
  1414		struct user_namespace *seq_ns =3D seq_user_ns(seq);
  1415	=

  1416		if (!ns->parent)
  1417			return -EPERM;
  1418	=

  1419		if ((seq_ns !=3D ns) && (seq_ns !=3D ns->parent))
  1420			return -EPERM;
  1421	=

  1422		/* Anyone can set any valid project id no capability needed */
  1423		return map_write(file, buf, size, ppos, -1, &ns->projid_map,
  1424				 &ns->parent->projid_map, NULL, NULL);
  1425	}
  1426	=

  1427	#ifdef CONFIG_USER_NS_FSID
  1428	ssize_t proc_fsuid_map_write(struct file *file, const char __user *b=
uf,
  1429				     size_t size, loff_t *ppos)
  1430	{
  1431		struct seq_file *seq =3D file->private_data;
  1432		struct user_namespace *ns =3D seq->private;
  1433		struct user_namespace *seq_ns =3D seq_user_ns(seq);
  1434	=

  1435		if (!ns->parent)
  1436			return -EPERM;
  1437	=

  1438		if ((seq_ns !=3D ns) && (seq_ns !=3D ns->parent))
  1439			return -EPERM;
  1440	=

  1441		return map_write(file, buf, size, ppos, CAP_SETUID, &ns->fsuid_map,
  1442				 &ns->parent->fsuid_map, NULL, NULL);
  1443	}
  1444	=

  1445	ssize_t proc_fsgid_map_write(struct file *file, const char __user *b=
uf,
  1446				     size_t size, loff_t *ppos)
  1447	{
  1448		struct seq_file *seq =3D file->private_data;
  1449		struct user_namespace *ns =3D seq->private;
  1450		struct user_namespace *seq_ns =3D seq_user_ns(seq);
  1451	=

  1452		if (!ns->parent)
  1453			return -EPERM;
  1454	=

  1455		if ((seq_ns !=3D ns) && (seq_ns !=3D ns->parent))
  1456			return -EPERM;
  1457	=

  1458		return map_write(file, buf, size, ppos, CAP_SETGID, &ns->fsgid_map,
  1459				 &ns->parent->fsgid_map, NULL, NULL);
  1460	}
  1461	#endif
  1462	=

  1463	static bool new_idmap_permitted(const struct file *file,
  1464					struct user_namespace *ns, int cap_setid,
  1465					struct uid_gid_map *new_map,
  1466					struct uid_gid_map *fsid_map)
  1467	{
  1468		const struct cred *cred =3D file->f_cred;
  1469	=

  1470		if (cap_setid =3D=3D CAP_SETUID && !fsid_map && idmap_exists(&ns->u=
id_map))
  1471			return false;
  1472	=

  1473		if (cap_setid =3D=3D CAP_SETGID && !fsid_map && idmap_exists(&ns->g=
id_map))
  1474			return false;
  1475	=

  1476		/* Don't allow mappings that would allow anything that wouldn't
  1477		 * be allowed without the establishment of unprivileged mappings.
  1478		 */
  1479		if ((new_map->nr_extents =3D=3D 1) && (new_map->extent[0].count =3D=
=3D 1) &&
  1480		    uid_eq(ns->owner, cred->euid)) {
  1481			u32 id =3D new_map->extent[0].lower_first;
  1482			if (cap_setid =3D=3D CAP_SETUID) {
> 1483				kuid_t uid =3D map_fsid ? make_kfsuid(ns->parent, id) :
  1484							make_kuid(ns->parent, id);
  1485				if (uid_eq(uid, cred->euid))
  1486					return true;
  1487			} else if (cap_setid =3D=3D CAP_SETGID) {
  1488				kgid_t gid =3D map_fsid ? make_kfsgid(ns->parent, id) :
  1489							make_kgid(ns->parent, id);
  1490				if (!(ns->flags & USERNS_SETGROUPS_ALLOWED) &&
  1491				    gid_eq(gid, cred->egid))
  1492					return true;
  1493			}
  1494		}
  1495	=

  1496		/* Allow anyone to set a mapping that doesn't require privilege */
  1497		if (!cap_valid(cap_setid))
  1498			return true;
  1499	=

  1500		/* Allow the specified ids if we have the appropriate capability
  1501		 * (CAP_SETUID or CAP_SETGID) over the parent user namespace.
  1502		 * And the opener of the id file also had the approprpiate capabili=
ty.
  1503		 */
  1504		if (ns_capable(ns->parent, cap_setid) &&
  1505		    file_ns_capable(file, ns->parent, cap_setid))
  1506			return true;
  1507	=

  1508		return false;
  1509	}
  1510	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5689280987409578624==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5689280987409578624==--


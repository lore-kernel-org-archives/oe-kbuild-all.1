Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974718;
	b=Hxnhv1AHGVio0IkivCKkl6JGMEEOe+VH4yeO6+ig5fa58I6hVheCcNRVco4NcZkOLn7j
	 fxy0mD/tTJ1AA4y/dXA2Za/0uVgEbyRacRm9OlYsP30tOZpSpW1uFVJWvQSQqEmc5xuhA
	 HNr3cfxRO2AxrGXiN3NUekNc+QXTCBlQ7KniecvuukpSOX+2kJjtCwdpsfBCRY4EbSuSX
	 c9fgrOd7lnt+q9uFYZv5SR59648OwbBZQsIh05fML1Umqss2PlMs3GOdTLYO920/q7yPH
	 Oiorpy0hflitZwRK2VA9WsHfSgV8GbLnWbdYBBF7hxzZhPAmGdlzBX6cYk/o1KuBrXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974718;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=z8AyVLqxzw0RjJtpixgN8sfg9NBBnTB2Xqmw3dFhLHw=;
	b=W0arv+Id2YAJrDA/Gkwpi1TZ/brkNCR95CsR40VUSOuJx+KW7F7MUuLRB8tNUcErP9SA
	 79LTpptwBSXDqzEAtFOkBy3ML+7arYGD2LFfi+85SDCP/I8IOP3A0uxSKXqo3hUebyEoV
	 I7A0a+bMIbZvM/UWpb58nLxWyyScYLvNKlvKZAZ2E/pZn279iM7rE1AheH4q06cmYBfet
	 KlblSfE6iI0+jdTiAWPHstxDhA3cbWjCE7US/LBQsUfrGsfh9Q8fLfroG8G3qjnT5KHdE
	 0e2BFq7bFfpZzs2DdzCN7nK2TfqOhAyC9gLyfv4a0TWueA6Aouu/rpO2uRBTofUcd5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BFDwDSux;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0712A606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 00:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0712A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BFDwDSux
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792974717; x=1824510717;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8AncecGmITwTjoAgfLFcvqUWC366u3u9qOXdep1P9MU=;
  b=BFDwDSuxW1webxQd7JPQ7Uee4T40POj6vkhTbOb4mIR63vctfQ5n/LyP
   3TaC7+Gb1/xujln6/Q26+4qIx6y/koRcNm9R5Vo2oBU/gE6z/NJ5jpO7W
   e21ffLfuzzr8u44bW1cbgZiT3N4LgnEjZVyZmTdNkMXlDvdBGaoFys0Va
   VlxDOsdck+E0Z6+1eZMR2Mr3/CK4mzyXJxwgkTy7/3aIHPoQY9EzGP/ic
   nXuOwhPH9vMnrsAY2JB0aykPkmX+vAciLYE45wK5YoAIuwFqinUccsdPz
   PzN+uQKw6kxoIKgDnj5er8g0XNuY+lZJ+ZkHrflmkcWseXw2h3N/xlVn9
   g==;
X-CSE-ConnectionGUID: nihFP+OcSoC2TIsE49rshw==
X-CSE-MsgGUID: KZWv/Pg2THSgIEqyWQvHuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1534397"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1534397"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 17:31:56 -0700
X-CSE-ConnectionGUID: ckREdX1dQ6mRFJMUDHHBcg==
X-CSE-MsgGUID: Puj00DfjSBSrcevwZv+Naw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4071078"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 25 Oct 2026 17:31:55 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL8cy-000000003uJ-2KZi;
	Mon, 26 Oct 2026 00:31:52 +0000
Date: Mon, 26 Oct 2026 01:31:26 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-lts 6/6]
 security/smack/smack_lsm.c:1261: warning: Excess function parameter
 'mnt_userns' description in 'smack_inode_setxattr'
Message-ID: <202610260105.HlEhbjTV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android13-5.10-lts
head:   f61a392235e085addf6e809b78c6e6114320e6e7
commit: 665f9113e0d21ab27c56d99180e45790fda6e15f [6/6] Smack: fix W=3D1 bui=
ld warnings
config: i386-randconfig-2000-20261025 (https://download.01.org/0day-ci/arch=
ive/20261026/202610260105.HlEhbjTV-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261026/202610260105.HlEhbjTV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610260105.HlEhbjTV-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> security/smack/smack_lsm.c:1261: warning: Excess function parameter 'mnt=
_userns' description in 'smack_inode_setxattr'
>> security/smack/smack_lsm.c:1384: warning: Excess function parameter 'mnt=
_userns' description in 'smack_inode_removexattr'
>> security/smack/smack_lsm.c:1445: warning: Excess function parameter 'mnt=
_userns' description in 'smack_inode_getsecurity'


vim +1261 security/smack/smack_lsm.c

e114e473771c84 Casey Schaufler       2008-02-04  1245 =20
e114e473771c84 Casey Schaufler       2008-02-04  1246  /**
e114e473771c84 Casey Schaufler       2008-02-04  1247   * smack_inode_setxa=
ttr - Smack check for setting xattrs
665f9113e0d21a Casey Schaufler       2021-10-13  1248   * @mnt_userns: acti=
ve user namespace
e114e473771c84 Casey Schaufler       2008-02-04  1249   * @dentry: the obje=
ct
e114e473771c84 Casey Schaufler       2008-02-04  1250   * @name: name of th=
e attribute
e95ef49b7f8f49 Lukasz Pawelczyk      2014-08-29  1251   * @value: value of =
the attribute
e95ef49b7f8f49 Lukasz Pawelczyk      2014-08-29  1252   * @size: size of th=
e value
e114e473771c84 Casey Schaufler       2008-02-04  1253   * @flags: unused
e114e473771c84 Casey Schaufler       2008-02-04  1254   *
e114e473771c84 Casey Schaufler       2008-02-04  1255   * This protects the=
 Smack attribute explicitly.
e114e473771c84 Casey Schaufler       2008-02-04  1256   *
e114e473771c84 Casey Schaufler       2008-02-04  1257   * Returns 0 if acce=
ss is permitted, an error code otherwise
e114e473771c84 Casey Schaufler       2008-02-04  1258   */
8f0cfa52a1d4ff David Howells         2008-04-29  1259  static int smack_ino=
de_setxattr(struct dentry *dentry, const char *name,
8f0cfa52a1d4ff David Howells         2008-04-29  1260  				const void *valu=
e, size_t size, int flags)
e114e473771c84 Casey Schaufler       2008-02-04 @1261  {
ecfcc53fef3c35 Etienne Basset        2009-04-08  1262  	struct smk_audit_in=
fo ad;
19760ad03cc639 Casey Schaufler       2013-12-16  1263  	struct smack_known =
*skp;
19760ad03cc639 Casey Schaufler       2013-12-16  1264  	int check_priv =3D =
0;
19760ad03cc639 Casey Schaufler       2013-12-16  1265  	int check_import =
=3D 0;
19760ad03cc639 Casey Schaufler       2013-12-16  1266  	int check_star =3D =
0;
bcdca225bfa016 Casey Schaufler       2008-02-23  1267  	int rc =3D 0;
bcdca225bfa016 Casey Schaufler       2008-02-23  1268 =20
19760ad03cc639 Casey Schaufler       2013-12-16  1269  	/*
19760ad03cc639 Casey Schaufler       2013-12-16  1270  	 * Check label vali=
dity here so import won't fail in post_setxattr
19760ad03cc639 Casey Schaufler       2013-12-16  1271  	 */
e114e473771c84 Casey Schaufler       2008-02-04  1272  	if (strcmp(name, XA=
TTR_NAME_SMACK) =3D=3D 0 ||
e114e473771c84 Casey Schaufler       2008-02-04  1273  	    strcmp(name, XA=
TTR_NAME_SMACKIPIN) =3D=3D 0 ||
19760ad03cc639 Casey Schaufler       2013-12-16  1274  	    strcmp(name, XA=
TTR_NAME_SMACKIPOUT) =3D=3D 0) {
19760ad03cc639 Casey Schaufler       2013-12-16  1275  		check_priv =3D 1;
19760ad03cc639 Casey Schaufler       2013-12-16  1276  		check_import =3D 1;
19760ad03cc639 Casey Schaufler       2013-12-16  1277  	} else if (strcmp(n=
ame, XATTR_NAME_SMACKEXEC) =3D=3D 0 ||
7898e1f8e9eb1b Casey Schaufler       2011-01-17  1278  		   strcmp(name, XA=
TTR_NAME_SMACKMMAP) =3D=3D 0) {
19760ad03cc639 Casey Schaufler       2013-12-16  1279  		check_priv =3D 1;
19760ad03cc639 Casey Schaufler       2013-12-16  1280  		check_import =3D 1;
19760ad03cc639 Casey Schaufler       2013-12-16  1281  		check_star =3D 1;
5c6d1125f8dbd1 Jarkko Sakkinen       2010-12-07  1282  	} else if (strcmp(n=
ame, XATTR_NAME_SMACKTRANSMUTE) =3D=3D 0) {
19760ad03cc639 Casey Schaufler       2013-12-16  1283  		check_priv =3D 1;
a354d9e3b66c1e Roberto Sassu         2023-11-16  1284  		if (!S_ISDIR(d_bac=
king_inode(dentry)->i_mode) ||
a354d9e3b66c1e Roberto Sassu         2023-11-16  1285  		    size !=3D TRAN=
S_TRUE_SIZE ||
5c6d1125f8dbd1 Jarkko Sakkinen       2010-12-07  1286  		    strncmp(value,=
 TRANS_TRUE, TRANS_TRUE_SIZE) !=3D 0)
5c6d1125f8dbd1 Jarkko Sakkinen       2010-12-07  1287  			rc =3D -EINVAL;
bcdca225bfa016 Casey Schaufler       2008-02-23  1288  	} else
bcdca225bfa016 Casey Schaufler       2008-02-23  1289  		rc =3D cap_inode_s=
etxattr(dentry, name, value, size, flags);
e114e473771c84 Casey Schaufler       2008-02-04  1290 =20
19760ad03cc639 Casey Schaufler       2013-12-16  1291  	if (check_priv && !=
smack_privileged(CAP_MAC_ADMIN))
19760ad03cc639 Casey Schaufler       2013-12-16  1292  		rc =3D -EPERM;
19760ad03cc639 Casey Schaufler       2013-12-16  1293 =20
19760ad03cc639 Casey Schaufler       2013-12-16  1294  	if (rc =3D=3D 0 && =
check_import) {
b862e561bad637 Konstantin Khlebnikov 2014-08-07  1295  		skp =3D size ? smk=
_import_entry(value, size) : NULL;
e774ad683f425a Lukasz Pawelczyk      2015-04-20  1296  		if (IS_ERR(skp))
e774ad683f425a Lukasz Pawelczyk      2015-04-20  1297  			rc =3D PTR_ERR(sk=
p);
e774ad683f425a Lukasz Pawelczyk      2015-04-20  1298  		else if (skp =3D=
=3D NULL || (check_star &&
19760ad03cc639 Casey Schaufler       2013-12-16  1299  		    (skp =3D=3D &s=
mack_known_star || skp =3D=3D &smack_known_web)))
19760ad03cc639 Casey Schaufler       2013-12-16  1300  			rc =3D -EINVAL;
19760ad03cc639 Casey Schaufler       2013-12-16  1301  	}
19760ad03cc639 Casey Schaufler       2013-12-16  1302 =20
a269434d2fb48a Eric Paris            2011-04-25  1303  	smk_ad_init(&ad, __=
func__, LSM_AUDIT_DATA_DENTRY);
ecfcc53fef3c35 Etienne Basset        2009-04-08  1304  	smk_ad_setfield_u_f=
s_path_dentry(&ad, dentry);
ecfcc53fef3c35 Etienne Basset        2009-04-08  1305 =20
d166c8024d620d Casey Schaufler       2014-08-27  1306  	if (rc =3D=3D 0) {
c6f493d631c4d4 David Howells         2015-03-17  1307  		rc =3D smk_curacc(=
smk_of_inode(d_backing_inode(dentry)), MAY_WRITE, &ad);
c6f493d631c4d4 David Howells         2015-03-17  1308  		rc =3D smk_bu_inod=
e(d_backing_inode(dentry), MAY_WRITE, rc);
d166c8024d620d Casey Schaufler       2014-08-27  1309  	}
bcdca225bfa016 Casey Schaufler       2008-02-23  1310 =20
bcdca225bfa016 Casey Schaufler       2008-02-23  1311  	return rc;
e114e473771c84 Casey Schaufler       2008-02-04  1312  }
e114e473771c84 Casey Schaufler       2008-02-04  1313 =20
e114e473771c84 Casey Schaufler       2008-02-04  1314  /**
e114e473771c84 Casey Schaufler       2008-02-04  1315   * smack_inode_post_=
setxattr - Apply the Smack update approved above
e114e473771c84 Casey Schaufler       2008-02-04  1316   * @dentry: object
e114e473771c84 Casey Schaufler       2008-02-04  1317   * @name: attribute =
name
e114e473771c84 Casey Schaufler       2008-02-04  1318   * @value: attribute=
 value
e114e473771c84 Casey Schaufler       2008-02-04  1319   * @size: attribute =
size
e114e473771c84 Casey Schaufler       2008-02-04  1320   * @flags: unused
e114e473771c84 Casey Schaufler       2008-02-04  1321   *
e114e473771c84 Casey Schaufler       2008-02-04  1322   * Set the pointer i=
n the inode blob to the entry found
e114e473771c84 Casey Schaufler       2008-02-04  1323   * in the master lab=
el list.
e114e473771c84 Casey Schaufler       2008-02-04  1324   */
8f0cfa52a1d4ff David Howells         2008-04-29  1325  static void smack_in=
ode_post_setxattr(struct dentry *dentry, const char *name,
8f0cfa52a1d4ff David Howells         2008-04-29  1326  				      const void=
 *value, size_t size, int flags)
e114e473771c84 Casey Schaufler       2008-02-04  1327  {
2f823ff8bec03a Casey Schaufler       2013-05-22  1328  	struct smack_known =
*skp;
fb4021b6fb5818 Casey Schaufler       2018-11-12  1329  	struct inode_smack =
*isp =3D smack_inode(d_backing_inode(dentry));
676dac4b1bee04 Casey Schaufler       2010-12-02  1330 =20
2f823ff8bec03a Casey Schaufler       2013-05-22  1331  	if (strcmp(name, XA=
TTR_NAME_SMACKTRANSMUTE) =3D=3D 0) {
2f823ff8bec03a Casey Schaufler       2013-05-22  1332  		isp->smk_flags |=
=3D SMK_INODE_TRANSMUTE;
2f823ff8bec03a Casey Schaufler       2013-05-22  1333  		return;
2f823ff8bec03a Casey Schaufler       2013-05-22  1334  	}
2f823ff8bec03a Casey Schaufler       2013-05-22  1335 =20
676dac4b1bee04 Casey Schaufler       2010-12-02  1336  	if (strcmp(name, XA=
TTR_NAME_SMACK) =3D=3D 0) {
9598f4c9e7069a Jos=C3=A9 Bollo            2014-04-03  1337  		skp =3D smk_i=
mport_entry(value, size);
e774ad683f425a Lukasz Pawelczyk      2015-04-20  1338  		if (!IS_ERR(skp))
21c7eae21a2100 Lukasz Pawelczyk      2014-08-29  1339  			isp->smk_inode =
=3D skp;
5c6d1125f8dbd1 Jarkko Sakkinen       2010-12-07  1340  	} else if (strcmp(n=
ame, XATTR_NAME_SMACKEXEC) =3D=3D 0) {
9598f4c9e7069a Jos=C3=A9 Bollo            2014-04-03  1341  		skp =3D smk_i=
mport_entry(value, size);
e774ad683f425a Lukasz Pawelczyk      2015-04-20  1342  		if (!IS_ERR(skp))
2f823ff8bec03a Casey Schaufler       2013-05-22  1343  			isp->smk_task =3D =
skp;
7898e1f8e9eb1b Casey Schaufler       2011-01-17  1344  	} else if (strcmp(n=
ame, XATTR_NAME_SMACKMMAP) =3D=3D 0) {
9598f4c9e7069a Jos=C3=A9 Bollo            2014-04-03  1345  		skp =3D smk_i=
mport_entry(value, size);
e774ad683f425a Lukasz Pawelczyk      2015-04-20  1346  		if (!IS_ERR(skp))
2f823ff8bec03a Casey Schaufler       2013-05-22  1347  			isp->smk_mmap =3D =
skp;
2f823ff8bec03a Casey Schaufler       2013-05-22  1348  	}
e114e473771c84 Casey Schaufler       2008-02-04  1349 =20
e114e473771c84 Casey Schaufler       2008-02-04  1350  	return;
e114e473771c84 Casey Schaufler       2008-02-04  1351  }
e114e473771c84 Casey Schaufler       2008-02-04  1352 =20
ce8a432197d989 Casey Schaufler       2011-09-29  1353  /**
e114e473771c84 Casey Schaufler       2008-02-04  1354   * smack_inode_getxa=
ttr - Smack check on getxattr
e114e473771c84 Casey Schaufler       2008-02-04  1355   * @dentry: the obje=
ct
e114e473771c84 Casey Schaufler       2008-02-04  1356   * @name: unused
e114e473771c84 Casey Schaufler       2008-02-04  1357   *
e114e473771c84 Casey Schaufler       2008-02-04  1358   * Returns 0 if acce=
ss is permitted, an error code otherwise
e114e473771c84 Casey Schaufler       2008-02-04  1359   */
8f0cfa52a1d4ff David Howells         2008-04-29  1360  static int smack_ino=
de_getxattr(struct dentry *dentry, const char *name)
e114e473771c84 Casey Schaufler       2008-02-04  1361  {
ecfcc53fef3c35 Etienne Basset        2009-04-08  1362  	struct smk_audit_in=
fo ad;
d166c8024d620d Casey Schaufler       2014-08-27  1363  	int rc;
ecfcc53fef3c35 Etienne Basset        2009-04-08  1364 =20
a269434d2fb48a Eric Paris            2011-04-25  1365  	smk_ad_init(&ad, __=
func__, LSM_AUDIT_DATA_DENTRY);
ecfcc53fef3c35 Etienne Basset        2009-04-08  1366  	smk_ad_setfield_u_f=
s_path_dentry(&ad, dentry);
ecfcc53fef3c35 Etienne Basset        2009-04-08  1367 =20
c6f493d631c4d4 David Howells         2015-03-17  1368  	rc =3D smk_curacc(s=
mk_of_inode(d_backing_inode(dentry)), MAY_READ, &ad);
c6f493d631c4d4 David Howells         2015-03-17  1369  	rc =3D smk_bu_inode=
(d_backing_inode(dentry), MAY_READ, rc);
d166c8024d620d Casey Schaufler       2014-08-27  1370  	return rc;
e114e473771c84 Casey Schaufler       2008-02-04  1371  }
e114e473771c84 Casey Schaufler       2008-02-04  1372 =20
ce8a432197d989 Casey Schaufler       2011-09-29  1373  /**
e114e473771c84 Casey Schaufler       2008-02-04  1374   * smack_inode_remov=
exattr - Smack check on removexattr
665f9113e0d21a Casey Schaufler       2021-10-13  1375   * @mnt_userns: acti=
ve user namespace
e114e473771c84 Casey Schaufler       2008-02-04  1376   * @dentry: the obje=
ct
e114e473771c84 Casey Schaufler       2008-02-04  1377   * @name: name of th=
e attribute
e114e473771c84 Casey Schaufler       2008-02-04  1378   *
e114e473771c84 Casey Schaufler       2008-02-04  1379   * Removing the Smac=
k attribute requires CAP_MAC_ADMIN
e114e473771c84 Casey Schaufler       2008-02-04  1380   *
e114e473771c84 Casey Schaufler       2008-02-04  1381   * Returns 0 if acce=
ss is permitted, an error code otherwise
e114e473771c84 Casey Schaufler       2008-02-04  1382   */
8f0cfa52a1d4ff David Howells         2008-04-29  1383  static int smack_ino=
de_removexattr(struct dentry *dentry, const char *name)
e114e473771c84 Casey Schaufler       2008-02-04 @1384  {
676dac4b1bee04 Casey Schaufler       2010-12-02  1385  	struct inode_smack =
*isp;
ecfcc53fef3c35 Etienne Basset        2009-04-08  1386  	struct smk_audit_in=
fo ad;
bcdca225bfa016 Casey Schaufler       2008-02-23  1387  	int rc =3D 0;
e114e473771c84 Casey Schaufler       2008-02-04  1388 =20
bcdca225bfa016 Casey Schaufler       2008-02-23  1389  	if (strcmp(name, XA=
TTR_NAME_SMACK) =3D=3D 0 ||
bcdca225bfa016 Casey Schaufler       2008-02-23  1390  	    strcmp(name, XA=
TTR_NAME_SMACKIPIN) =3D=3D 0 ||
676dac4b1bee04 Casey Schaufler       2010-12-02  1391  	    strcmp(name, XA=
TTR_NAME_SMACKIPOUT) =3D=3D 0 ||
5c6d1125f8dbd1 Jarkko Sakkinen       2010-12-07  1392  	    strcmp(name, XA=
TTR_NAME_SMACKEXEC) =3D=3D 0 ||
7898e1f8e9eb1b Casey Schaufler       2011-01-17  1393  	    strcmp(name, XA=
TTR_NAME_SMACKTRANSMUTE) =3D=3D 0 ||
5e9ab593c2da30 Pankaj Kumar          2013-12-13  1394  	    strcmp(name, XA=
TTR_NAME_SMACKMMAP) =3D=3D 0) {
1880eff77e7a7c Casey Schaufler       2012-06-05  1395  		if (!smack_privile=
ged(CAP_MAC_ADMIN))
bcdca225bfa016 Casey Schaufler       2008-02-23  1396  			rc =3D -EPERM;
bcdca225bfa016 Casey Schaufler       2008-02-23  1397  	} else
bcdca225bfa016 Casey Schaufler       2008-02-23  1398  		rc =3D cap_inode_r=
emovexattr(dentry, name);
bcdca225bfa016 Casey Schaufler       2008-02-23  1399 =20
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1400  	if (rc !=3D 0)
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1401  		return rc;
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1402 =20
a269434d2fb48a Eric Paris            2011-04-25  1403  	smk_ad_init(&ad, __=
func__, LSM_AUDIT_DATA_DENTRY);
ecfcc53fef3c35 Etienne Basset        2009-04-08  1404  	smk_ad_setfield_u_f=
s_path_dentry(&ad, dentry);
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1405 =20
c6f493d631c4d4 David Howells         2015-03-17  1406  	rc =3D smk_curacc(s=
mk_of_inode(d_backing_inode(dentry)), MAY_WRITE, &ad);
c6f493d631c4d4 David Howells         2015-03-17  1407  	rc =3D smk_bu_inode=
(d_backing_inode(dentry), MAY_WRITE, rc);
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1408  	if (rc !=3D 0)
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1409  		return rc;
bcdca225bfa016 Casey Schaufler       2008-02-23  1410 =20
fb4021b6fb5818 Casey Schaufler       2018-11-12  1411  	isp =3D smack_inode=
(d_backing_inode(dentry));
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1412  	/*
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1413  	 * Don't do anythin=
g special for these.
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1414  	 *	XATTR_NAME_SMACK=
IPIN
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1415  	 *	XATTR_NAME_SMACK=
IPOUT
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1416  	 */
8012495e177bbf Jos=C3=A9 Bollo            2016-01-12  1417  	if (strcmp(nam=
e, XATTR_NAME_SMACK) =3D=3D 0) {
fc64005c93090c Al Viro               2016-04-10  1418  		struct super_block=
 *sbp =3D dentry->d_sb;
8012495e177bbf Jos=C3=A9 Bollo            2016-01-12  1419  		struct superb=
lock_smack *sbsp =3D sbp->s_security;
8012495e177bbf Jos=C3=A9 Bollo            2016-01-12  1420 =20
8012495e177bbf Jos=C3=A9 Bollo            2016-01-12  1421  		isp->smk_inod=
e =3D sbsp->smk_default;
8012495e177bbf Jos=C3=A9 Bollo            2016-01-12  1422  	} else if (str=
cmp(name, XATTR_NAME_SMACKEXEC) =3D=3D 0)
676dac4b1bee04 Casey Schaufler       2010-12-02  1423  		isp->smk_task =3D =
NULL;
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1424  	else if (strcmp(nam=
e, XATTR_NAME_SMACKMMAP) =3D=3D 0)
7898e1f8e9eb1b Casey Schaufler       2011-01-17  1425  		isp->smk_mmap =3D =
NULL;
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1426  	else if (strcmp(nam=
e, XATTR_NAME_SMACKTRANSMUTE) =3D=3D 0)
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1427  		isp->smk_flags &=
=3D ~SMK_INODE_TRANSMUTE;
676dac4b1bee04 Casey Schaufler       2010-12-02  1428 =20
f59bdfba3e2b0b Casey Schaufler       2014-04-10  1429  	return 0;
e114e473771c84 Casey Schaufler       2008-02-04  1430  }
e114e473771c84 Casey Schaufler       2008-02-04  1431 =20
e114e473771c84 Casey Schaufler       2008-02-04  1432  /**
e114e473771c84 Casey Schaufler       2008-02-04  1433   * smack_inode_getse=
curity - get smack xattrs
665f9113e0d21a Casey Schaufler       2021-10-13  1434   * @mnt_userns: acti=
ve user namespace
e114e473771c84 Casey Schaufler       2008-02-04  1435   * @inode: the object
e114e473771c84 Casey Schaufler       2008-02-04  1436   * @name: attribute =
name
e114e473771c84 Casey Schaufler       2008-02-04  1437   * @buffer: where to=
 put the result
57e7ba04d422c3 Casey Schaufler       2017-09-19  1438   * @alloc: duplicate=
 memory
e114e473771c84 Casey Schaufler       2008-02-04  1439   *
e114e473771c84 Casey Schaufler       2008-02-04  1440   * Returns the size =
of the attribute or an error code
e114e473771c84 Casey Schaufler       2008-02-04  1441   */
ea861dfd9e0e7e Andreas Gruenbacher   2015-12-24  1442  static int smack_ino=
de_getsecurity(struct inode *inode,
e114e473771c84 Casey Schaufler       2008-02-04  1443  				   const char *n=
ame, void **buffer,
e114e473771c84 Casey Schaufler       2008-02-04  1444  				   bool alloc)
e114e473771c84 Casey Schaufler       2008-02-04 @1445  {
e114e473771c84 Casey Schaufler       2008-02-04  1446  	struct socket_smack=
 *ssp;
e114e473771c84 Casey Schaufler       2008-02-04  1447  	struct socket *sock;
e114e473771c84 Casey Schaufler       2008-02-04  1448  	struct super_block =
*sbp;
e114e473771c84 Casey Schaufler       2008-02-04  1449  	struct inode *ip =
=3D (struct inode *)inode;
21c7eae21a2100 Lukasz Pawelczyk      2014-08-29  1450  	struct smack_known =
*isp;
297c51c63fe156 Roberto Sassu         2023-05-08  1451  	struct inode_smack =
*ispp;
297c51c63fe156 Roberto Sassu         2023-05-08  1452  	size_t label_len;
297c51c63fe156 Roberto Sassu         2023-05-08  1453  	char *label =3D NUL=
L;
e114e473771c84 Casey Schaufler       2008-02-04  1454 =20
297c51c63fe156 Roberto Sassu         2023-05-08  1455  	if (strcmp(name, XA=
TTR_SMACK_SUFFIX) =3D=3D 0) {
e114e473771c84 Casey Schaufler       2008-02-04  1456  		isp =3D smk_of_ino=
de(inode);
297c51c63fe156 Roberto Sassu         2023-05-08  1457  	} else if (strcmp(n=
ame, XATTR_SMACK_TRANSMUTE) =3D=3D 0) {
297c51c63fe156 Roberto Sassu         2023-05-08  1458  		ispp =3D smack_ino=
de(inode);
297c51c63fe156 Roberto Sassu         2023-05-08  1459  		if (ispp->smk_flag=
s & SMK_INODE_TRANSMUTE)
297c51c63fe156 Roberto Sassu         2023-05-08  1460  			label =3D TRANS_T=
RUE;
297c51c63fe156 Roberto Sassu         2023-05-08  1461  		else
297c51c63fe156 Roberto Sassu         2023-05-08  1462  			label =3D "";
297c51c63fe156 Roberto Sassu         2023-05-08  1463  	} else {
e114e473771c84 Casey Schaufler       2008-02-04  1464  		/*
e114e473771c84 Casey Schaufler       2008-02-04  1465  		 * The rest of the=
 Smack xattrs are only on sockets.
e114e473771c84 Casey Schaufler       2008-02-04  1466  		 */
e114e473771c84 Casey Schaufler       2008-02-04  1467  		sbp =3D ip->i_sb;
e114e473771c84 Casey Schaufler       2008-02-04  1468  		if (sbp->s_magic !=
=3D SOCKFS_MAGIC)
e114e473771c84 Casey Schaufler       2008-02-04  1469  			return -EOPNOTSUP=
P;
e114e473771c84 Casey Schaufler       2008-02-04  1470 =20
e114e473771c84 Casey Schaufler       2008-02-04  1471  		sock =3D SOCKET_I(=
ip);
2e1d146a19f294 Ahmed S. Darwish      2008-02-13  1472  		if (sock =3D=3D NU=
LL || sock->sk =3D=3D NULL)
e114e473771c84 Casey Schaufler       2008-02-04  1473  			return -EOPNOTSUP=
P;
e114e473771c84 Casey Schaufler       2008-02-04  1474 =20
3628f8be466567 Casey Schaufler       2026-07-23  1475  		ssp =3D smack_sock=
(sock->sk);
e114e473771c84 Casey Schaufler       2008-02-04  1476 =20
e114e473771c84 Casey Schaufler       2008-02-04  1477  		if (strcmp(name, X=
ATTR_SMACK_IPIN) =3D=3D 0)
21c7eae21a2100 Lukasz Pawelczyk      2014-08-29  1478  			isp =3D ssp->smk_=
in;
e114e473771c84 Casey Schaufler       2008-02-04  1479  		else if (strcmp(na=
me, XATTR_SMACK_IPOUT) =3D=3D 0)
21c7eae21a2100 Lukasz Pawelczyk      2014-08-29  1480  			isp =3D ssp->smk_=
out;
e114e473771c84 Casey Schaufler       2008-02-04  1481  		else
e114e473771c84 Casey Schaufler       2008-02-04  1482  			return -EOPNOTSUP=
P;
57e7ba04d422c3 Casey Schaufler       2017-09-19  1483  	}
e114e473771c84 Casey Schaufler       2008-02-04  1484 =20
297c51c63fe156 Roberto Sassu         2023-05-08  1485  	if (!label)
297c51c63fe156 Roberto Sassu         2023-05-08  1486  		label =3D isp->smk=
_known;
297c51c63fe156 Roberto Sassu         2023-05-08  1487 =20
297c51c63fe156 Roberto Sassu         2023-05-08  1488  	label_len =3D strle=
n(label);
297c51c63fe156 Roberto Sassu         2023-05-08  1489 =20
57e7ba04d422c3 Casey Schaufler       2017-09-19  1490  	if (alloc) {
297c51c63fe156 Roberto Sassu         2023-05-08  1491  		*buffer =3D kstrdu=
p(label, GFP_KERNEL);
57e7ba04d422c3 Casey Schaufler       2017-09-19  1492  		if (*buffer =3D=3D =
NULL)
57e7ba04d422c3 Casey Schaufler       2017-09-19  1493  			return -ENOMEM;
e114e473771c84 Casey Schaufler       2008-02-04  1494  	}
e114e473771c84 Casey Schaufler       2008-02-04  1495 =20
297c51c63fe156 Roberto Sassu         2023-05-08  1496  	return label_len;
e114e473771c84 Casey Schaufler       2008-02-04  1497  }
e114e473771c84 Casey Schaufler       2008-02-04  1498 =20

:::::: The code at line 1261 was first introduced by commit
:::::: e114e473771c848c3cfec05f0123e70f1cdbdc99 Smack: Simplified Mandatory=
 Access Control Kernel

:::::: TO: Casey Schaufler <casey@schaufler-ca.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

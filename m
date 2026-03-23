Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085523C5DC4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 19:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774295577; cv=none; b=Hw48BdgJwY5Rl13m+DPhm328ya+3WIEUtsfrwkfXyyEtZAz6Z0ZieNXDBvbYZJ5BAui+gcm1a0OJjmJj7Onq/SqAhosdOKxjrA2hJiWVlOe2ITgkDVEAElYhr1mFnKC3WmZ1Sv7czT7WktclChuC3/JIr96muWvBj2l4om+Ew4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774295577; c=relaxed/simple;
	bh=OmEjNIEdFIimVWFQVb453RrhMJXtoULLFX3j+T43K+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gpErI38J/fbO8z2qRI6gW6TNikOYx8A/7qBSE+8XQ+oIjU2CVZKT4BCV1s04MZ2kDv+bakyhaxYkrJeyBqWi7mEddaoD7sPatgxvGY/b51XLeCC8dJWnD1h9xuIS5Pczm//7QFRmYuY7wZ2MKEOb4G9SMXD9374aVozb/lj5upI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+sB+sqS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+sB+sqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774295575; x=1805831575;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OmEjNIEdFIimVWFQVb453RrhMJXtoULLFX3j+T43K+k=;
  b=f+sB+sqS6OLgrYX/FpoBlOzyeMFAuZ1IfSLARiX0CDlezzQpYm/50xBY
   kUyyWNdMcHPu8y5GbgYOplr3JRB/191bI1hJryJnLpyLCHBOh7J7z+JHR
   fo2k26TDYEkvFuv6aFZVpL2dpPRaeLRmeKRLf0X7GmpLYMeANPiTkuI6f
   N9Jb9EQBttGZuvneded8JWIZNdXXNaSIYrwZo3obLZCRrSjMryi1Inshq
   Sw0lch/PO1MOz60asPogzTPq3djEaZ4a1Le7Q7isk5kh9lnTf4Qn4XxD+
   dtlkZtzjO/iFyq4loSnTr7tMzbADnxVEtWzuVMsbzzrks8MlJBEG6bnuo
   w==;
X-CSE-ConnectionGUID: s52CXINIRySez9u0T0Y02Q==
X-CSE-MsgGUID: gF59YR28TD+a1fm7AZ32Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75424000"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75424000"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 12:52:54 -0700
X-CSE-ConnectionGUID: jjTivFuYQ+iIxzL/x/L7Rw==
X-CSE-MsgGUID: chjRz7nvTzuLh4wMB7hTKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228191212"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Mar 2026 12:52:51 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4lKU-00000000397-0tpE;
	Mon, 23 Mar 2026 19:52:50 +0000
Date: Tue, 24 Mar 2026 03:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:setattr-cleanups 5/7] fs/namei.c:4279:25: error:
 too many arguments to function 'do_truncate'
Message-ID: <202603240356.UOqGNK8L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/hch/misc.git setattr-cleanups
head:   e22469ce880a705f47908e2f012a7f0fdeab826b
commit: fc6ce49614e5951db7205c96f4926fa8ad518a45 [5/7] fs: simplify do_trun=
cate
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260324/=
202603240356.UOqGNK8L-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260324/202603240356.UOqGNK8L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240356.UOqGNK8L-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from fs/namei.c:22:
   fs/namei.c: In function 'handle_truncate':
   include/linux/fs.h:228:25: error: passing argument 4 of 'do_truncate' ma=
kes pointer from integer without a cast [-Wint-conversion]
     228 | #define ATTR_MTIME      (1 << 5)
         |                         ^
         |                         |
         |                         int
   fs/namei.c:4280:37: note: in expansion of macro 'ATTR_MTIME'
    4280 |                                     ATTR_MTIME|ATTR_CTIME|ATTR_O=
PEN,
         |                                     ^~~~~~~~~~
   In file included from fs/namei.c:46:
   fs/internal.h:202:30: note: expected 'struct file *' but argument is of =
type 'int'
     202 |                 struct file *file);
         |                 ~~~~~~~~~~~~~^~~~
>> fs/namei.c:4279:25: error: too many arguments to function 'do_truncate'
    4279 |                 error =3D do_truncate(idmap, path->dentry, 0,
         |                         ^~~~~~~~~~~
   fs/internal.h:201:5: note: declared here
     201 | int do_truncate(struct mnt_idmap *idmap, struct dentry *dentry, =
loff_t new_size,
         |     ^~~~~~~~~~~


vim +/do_truncate +4279 fs/namei.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  4268 =20
abf08576afe315 Christian Brauner 2023-01-13  4269  static int handle_trunca=
te(struct mnt_idmap *idmap, struct file *filp)
7715b521222b6e Al Viro           2009-12-16  4270  {
f0bb5aaf2c5126 Al Viro           2016-11-20  4271  	const struct path *path=
 =3D &filp->f_path;
7715b521222b6e Al Viro           2009-12-16  4272  	struct inode *inode =3D =
path->dentry->d_inode;
7715b521222b6e Al Viro           2009-12-16  4273  	int error =3D get_write=
_access(inode);
7715b521222b6e Al Viro           2009-12-16  4274  	if (error)
7715b521222b6e Al Viro           2009-12-16  4275  		return error;
482e00075d660a Jeff Layton       2021-10-26  4276 =20
3350607dc5637b G=C3=BCnther Noack     2022-10-18  4277  	error =3D security=
_file_truncate(filp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  4278  	if (!error) {
abf08576afe315 Christian Brauner 2023-01-13 @4279  		error =3D do_truncate(=
idmap, path->dentry, 0,
d139d7ffd0c1e8 Miklos Szeredi    2007-10-18  4280  				    ATTR_MTIME|ATTR_=
CTIME|ATTR_OPEN,
e1181ee6575d79 Jeff Layton       2010-12-07  4281  				    filp);
^1da177e4c3f41 Linus Torvalds    2005-04-16  4282  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  4283  	put_write_access(inode);
acd0c935178649 Mimi Zohar        2009-09-04  4284  	return error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  4285  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  4286 =20

:::::: The code at line 4279 was first introduced by commit
:::::: abf08576afe31506b812c8c1be9714f78613f300 fs: port vfs_*() helpers to=
 struct mnt_idmap

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner (Microsoft) <brauner@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

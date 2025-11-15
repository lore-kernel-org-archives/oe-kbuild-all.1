Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC32246768
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763195322; cv=none; b=PZxhcqRA1Aa1Wum/vyZ7gSA+Wsr/d4xF1yEvLRBHHMmXxhf4h7sbuBXIBzHjNOs8H8KyNPqrSM7kK04BAHVqmRKBtGOszaJCTAQNfvrh105dtFQkQuTD257thyg6EwIKbkgEqmziU5ym6srvZxvkIYtiNQMoDWAi8cPp0d6qiik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763195322; c=relaxed/simple;
	bh=Q77t69jxbOebmhiLIELZOiYvI0KHAkw1Wr9WqFIRmoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJDh/EeKJaSoU8WBqf6nOgtplNCl+3HzRaBXyONJVsY8QSZlOAGifcl9c7bOf50haMTFG9U+GlwUSMmgNhQar9t8fRd7l50ZLUK0+JknIr1BNzfMU15HRObXN8LHPIXhSP3mbR8pF01Swa1hKY+n9VV1kKqSJpXdTzlHsLvsABc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSEFblUw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSEFblUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763195321; x=1794731321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q77t69jxbOebmhiLIELZOiYvI0KHAkw1Wr9WqFIRmoE=;
  b=KSEFblUw21/hdHRNCgLwrkn3b3mB8RqG3aoQrt+rAy+crgKqTfWDKPWe
   rsn6oJDOiDOcPLFJmCYgK8eI2cem+kDCKjb4YZBV1Kc9lqKmazhbC9TiJ
   or9HS1RKikbLON6gqlifAmgOqCRVQt4bo1eQDAS5XcZ23tx+CRg0UC5P0
   TFz1iuWAAaC6VR3+raicIgPti9OZBG4oxulSgkwLgfkXdnU7aA29cSKa8
   ws/ga5I6x7roLWMwU7JtSlFvI8V926gY6Jhj9PQEtnrmXK85EW1aFNDWg
   Coxu6+bdfGKtefFMQwweBWTDjzkkKusDoN2KTu7hMVC/dgNsKtGv2cK0b
   g==;
X-CSE-ConnectionGUID: MIcRQUnQR8SqeSTCTdoj4A==
X-CSE-MsgGUID: L0tEj1lzRwmkgK8KLZc4Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="64988396"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="64988396"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 00:28:40 -0800
X-CSE-ConnectionGUID: Evz2bVTJR9WRXE7Q93ZKQA==
X-CSE-MsgGUID: XUECKxxaTIib3O2VfsRCHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="189296891"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Nov 2025 00:28:39 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKBe8-0007oh-1h;
	Sat, 15 Nov 2025 08:28:36 +0000
Date: Sat, 15 Nov 2025 16:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:pdirops 19/19] fs/overlayfs/dir.c:1266:23: warning:
 variable 'trap' is uninitialized when used here
Message-ID: <202511151626.NzCkSQxG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux pdirops
head:   1f9ca4be39b5ed6123133a60ffb59174cba969ad
commit: 1f9ca4be39b5ed6123133a60ffb59174cba969ad [19/19] Merge branch 'work.ovl.cred.guard' into pdirops
config: arm-randconfig-001-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151626.NzCkSQxG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511151626.NzCkSQxG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511151626.NzCkSQxG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/overlayfs/dir.c:1266:23: warning: variable 'trap' is uninitialized when used here [-Wuninitialized]
    1266 |         if (rd.old_dentry == trap)
         |                              ^~~~
   fs/overlayfs/dir.c:1198:21: note: initialize the variable 'trap' to silence this warning
    1198 |         struct dentry *trap, *de;
         |                            ^
         |                             = NULL
   1 warning generated.


vim +/trap +1266 fs/overlayfs/dir.c

  1185	
  1186	static int ovl_rename_upper(struct ovl_renamedata *ovlrd, struct list_head *list)
  1187	{
  1188		struct dentry *old = ovlrd->old_dentry;
  1189		struct dentry *new = ovlrd->new_dentry;
  1190		struct ovl_fs *ofs = OVL_FS(old->d_sb);
  1191		unsigned int flags = ovlrd->flags;
  1192		struct renamedata rd = {};
  1193		struct dentry *old_upperdir = ovl_dentry_upper(ovlrd->old_parent);
  1194		struct dentry *new_upperdir = ovl_dentry_upper(ovlrd->new_parent);
  1195		bool samedir = ovlrd->old_parent == ovlrd->new_parent;
  1196		bool is_dir = d_is_dir(old);
  1197		bool new_is_dir = d_is_dir(new);
  1198		struct dentry *trap, *de;
  1199		struct dentry *whiteout = NULL;
  1200		bool old_opaque, new_opaque;
  1201		int err;
  1202	
  1203		if (!list_empty(list)) {
  1204			de = ovl_clear_empty(new, list);
  1205			if (IS_ERR(de))
  1206				return PTR_ERR(de);
  1207			ovlrd->opaquedir = de;
  1208		}
  1209	
  1210		if (!samedir) {
  1211			/*
  1212			 * When moving a merge dir or non-dir with copy up origin into
  1213			 * a new parent, we are marking the new parent dir "impure".
  1214			 * When ovl_iterate() iterates an "impure" upper dir, it will
  1215			 * lookup the origin inodes of the entries to fill d_ino.
  1216			 */
  1217			if (ovl_type_origin(old)) {
  1218				err = ovl_set_impure(ovlrd->new_parent, new_upperdir);
  1219				if (err)
  1220					return err;
  1221			}
  1222			if (!ovlrd->overwrite && ovl_type_origin(new)) {
  1223				err = ovl_set_impure(ovlrd->old_parent, old_upperdir);
  1224				if (err)
  1225					return err;
  1226			}
  1227		}
  1228	
  1229		rd.mnt_idmap = ovl_upper_mnt_idmap(ofs);
  1230		rd.old_parent = old_upperdir;
  1231		rd.new_parent = new_upperdir;
  1232		rd.flags = flags;
  1233	
  1234		err = start_renaming(&rd, 0,
  1235				     &QSTR_LEN(old->d_name.name, old->d_name.len),
  1236				     &QSTR_LEN(new->d_name.name, new->d_name.len));
  1237		if (err)
  1238			return err;
  1239	
  1240		err = -ESTALE;
  1241		if (!ovl_matches_upper(old, rd.old_dentry))
  1242			goto out_unlock;
  1243	
  1244		old_opaque = ovl_dentry_is_opaque(old);
  1245		new_opaque = ovl_dentry_is_opaque(new);
  1246	
  1247		err = -ESTALE;
  1248		if (d_inode(new) && ovl_dentry_upper(new)) {
  1249			if (ovlrd->opaquedir) {
  1250				if (rd.new_dentry != ovlrd->opaquedir)
  1251					goto out_unlock;
  1252			} else {
  1253				if (!ovl_matches_upper(new, rd.new_dentry))
  1254					goto out_unlock;
  1255			}
  1256		} else {
  1257			if (!d_is_negative(rd.new_dentry)) {
  1258				if (!new_opaque || !ovl_upper_is_whiteout(ofs, rd.new_dentry))
  1259					goto out_unlock;
  1260			} else {
  1261				if (flags & RENAME_EXCHANGE)
  1262					goto out_unlock;
  1263			}
  1264		}
  1265	
> 1266		if (rd.old_dentry == trap)
  1267			goto out_unlock;
  1268		if (rd.new_dentry == trap)
  1269			goto out_unlock;
  1270	
  1271		if (rd.old_dentry->d_inode == rd.new_dentry->d_inode)
  1272			goto out_unlock;
  1273	
  1274		err = 0;
  1275		if (ovl_type_merge_or_lower(old))
  1276			err = ovl_set_redirect(old, samedir);
  1277		else if (is_dir && !old_opaque && ovl_type_merge(ovlrd->new_parent))
  1278			err = ovl_set_opaque_xerr(old, rd.old_dentry, -EXDEV);
  1279		if (err)
  1280			goto out_unlock;
  1281	
  1282		if (!ovlrd->overwrite && ovl_type_merge_or_lower(new))
  1283			err = ovl_set_redirect(new, samedir);
  1284		else if (!ovlrd->overwrite && new_is_dir && !new_opaque &&
  1285			 ovl_type_merge(ovlrd->old_parent))
  1286			err = ovl_set_opaque_xerr(new, rd.new_dentry, -EXDEV);
  1287		if (err)
  1288			goto out_unlock;
  1289	
  1290		err = ovl_do_rename_rd(&rd);
  1291	
  1292		if (!err && ovlrd->cleanup_whiteout)
  1293			whiteout = dget(rd.new_dentry);
  1294	
  1295	out_unlock:
  1296		end_renaming(&rd);
  1297		if (err)
  1298			return err;
  1299	
  1300		if (whiteout) {
  1301			ovl_cleanup(ofs, old_upperdir, whiteout);
  1302			dput(whiteout);
  1303		}
  1304	
  1305		if (ovlrd->overwrite && d_inode(new)) {
  1306			if (new_is_dir)
  1307				clear_nlink(d_inode(new));
  1308			else
  1309				ovl_drop_nlink(new);
  1310		}
  1311	
  1312		ovl_dir_modified(ovlrd->old_parent, ovl_type_origin(old) ||
  1313				 (!ovlrd->overwrite && ovl_type_origin(new)));
  1314		ovl_dir_modified(ovlrd->new_parent, ovl_type_origin(old) ||
  1315				 (d_inode(new) && ovl_type_origin(new)));
  1316	
  1317		/* copy ctime: */
  1318		ovl_copyattr(d_inode(old));
  1319		if (d_inode(new) && ovl_dentry_upper(new))
  1320			ovl_copyattr(d_inode(new));
  1321	
  1322		return err;
  1323	}
  1324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

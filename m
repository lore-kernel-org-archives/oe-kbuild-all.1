Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D0E192B69
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 20:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719433761; cv=none; b=f0tJ/nsiLmna2vJMgMNszLgHNbY4fZmkh+zhJwh8LtJ9CFWQIVaSksLUI0/xFnmesTEREvCWpMArHDvj5OlUTSdPKOI8JJwmrkOCVWbZMwfDdMTkKXZwYsAe7ssa6U0Gvi5Pn7z62ZAdTNoWpqEHBf8aku2Mv24JGm9PVkEb3pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719433761; c=relaxed/simple;
	bh=pX/sZCZwhMTVjmUOne7H8mN7YDU4lcvQlXclJX6z7vw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KVHsG84OAeif4mdB61/rlgusmqqFJiKl0UjuF8ysDO9XyzbCexY6FMaAx1FognFYbdOLJT9pJtJcGEE4pVGKqYPCMUwJzZXNA5ns9cHULhMGbmSXcMCh0S5bNaHlfyAC0xxM4UbLqTuegUSshY/SJ8GhMaKzwd5+TSMJ0jzCIag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcftjZQE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcftjZQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719433760; x=1750969760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pX/sZCZwhMTVjmUOne7H8mN7YDU4lcvQlXclJX6z7vw=;
  b=VcftjZQEALb32pBOvJ2Vn1mk6CwV1+K0Kzmri2+IB/Fc0IdyBESgNoww
   FdQjQv5tJvUkbLExIcVSBLvQGQ8AxCGlpxRTrtVrUQ9K1NpEZCgR+zTUJ
   Dxh+pxf2nBWWwVfh+Y8VYLooz+CUZJW7uLDqfRbeZ6bMH7b3u67utukbZ
   +i4UClxQmi4JSjUANuideiFjV6m7CP3dBbnTPvD5nNfs5XegUZKqDDFtJ
   XduJqw3T3Piw0Cr2oWV21z5jHwAKQhxRobF6c2K8tZyF/bOaN2FRR0wpK
   ToF8zKhEvuIr2AHh/2uPH6n7HAyvnz/zSC3yLU4f3epehqlbug7WmjqOR
   g==;
X-CSE-ConnectionGUID: 2qA8L45OQZaOW3GbM9FUuA==
X-CSE-MsgGUID: K0S1iLzKQOastb7Aw/Eaeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27154324"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="27154324"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 13:29:19 -0700
X-CSE-ConnectionGUID: yNS3V1NkRluxHJHLQdM1JA==
X-CSE-MsgGUID: aoH1hT+oRdK26GvJCV1usg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="44227482"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jun 2024 13:29:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMZGV-000FXG-1u;
	Wed, 26 Jun 2024 20:29:15 +0000
Date: Thu, 27 Jun 2024 04:28:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Jan Kara <jack@suse.cz>
Subject: [brauner-vfs:vfs.misc 22/25] fs/namei.c:1248:13: warning: unused
 variable 'ret'
Message-ID: <202406270449.04t8Px4T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc
head:   9e6717bfa0c9bd6e5e2647b64a5c6693eb0a9f32
commit: 509e4c1542f400d9d5488e14e0040698c33e6bfd [22/25] fs: reflow may_create_in_sticky()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240627/202406270449.04t8Px4T-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406270449.04t8Px4T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270449.04t8Px4T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/namei.c: In function 'may_create_in_sticky':
>> fs/namei.c:1248:13: warning: unused variable 'ret' [-Wunused-variable]
    1248 |         int ret;
         |             ^~~


vim +/ret +1248 fs/namei.c

  1215	
  1216	/**
  1217	 * may_create_in_sticky - Check whether an O_CREAT open in a sticky directory
  1218	 *			  should be allowed, or not, on files that already
  1219	 *			  exist.
  1220	 * @idmap: idmap of the mount the inode was found from
  1221	 * @nd: nameidata pathwalk data
  1222	 * @inode: the inode of the file to open
  1223	 *
  1224	 * Block an O_CREAT open of a FIFO (or a regular file) when:
  1225	 *   - sysctl_protected_fifos (or sysctl_protected_regular) is enabled
  1226	 *   - the file already exists
  1227	 *   - we are in a sticky directory
  1228	 *   - we don't own the file
  1229	 *   - the owner of the directory doesn't own the file
  1230	 *   - the directory is world writable
  1231	 * If the sysctl_protected_fifos (or sysctl_protected_regular) is set to 2
  1232	 * the directory doesn't have to be world writable: being group writable will
  1233	 * be enough.
  1234	 *
  1235	 * If the inode has been found through an idmapped mount the idmap of
  1236	 * the vfsmount must be passed through @idmap. This function will then take
  1237	 * care to map the inode according to @idmap before checking permissions.
  1238	 * On non-idmapped mounts or if permission checking is to be performed on the
  1239	 * raw inode simply pass @nop_mnt_idmap.
  1240	 *
  1241	 * Returns 0 if the open is allowed, -ve on error.
  1242	 */
  1243	static int may_create_in_sticky(struct mnt_idmap *idmap, struct nameidata *nd,
  1244					struct inode *const inode)
  1245	{
  1246		umode_t dir_mode = nd->dir_mode;
  1247		vfsuid_t dir_vfsuid = nd->dir_vfsuid, i_vfsuid;
> 1248		int ret;
  1249	
  1250		if (likely(!(dir_mode & S_ISVTX)))
  1251			return 0;
  1252	
  1253		if (S_ISREG(inode->i_mode) && !sysctl_protected_regular)
  1254			return 0;
  1255	
  1256		if (S_ISFIFO(inode->i_mode) && !sysctl_protected_fifos)
  1257			return 0;
  1258	
  1259		i_vfsuid = i_uid_into_vfsuid(idmap, inode);
  1260	
  1261		if (vfsuid_eq(i_vfsuid, dir_vfsuid))
  1262			return 0;
  1263	
  1264		if (vfsuid_eq_kuid(i_vfsuid, current_fsuid()))
  1265			return 0;
  1266	
  1267		if (likely(dir_mode & 0002)) {
  1268			audit_log_path_denied(AUDIT_ANOM_CREAT, "sticky_create");
  1269			return -EACCES;
  1270		}
  1271	
  1272		if (dir_mode & 0020) {
  1273			if (sysctl_protected_fifos >= 2 && S_ISFIFO(inode->i_mode)) {
  1274				audit_log_path_denied(AUDIT_ANOM_CREAT,
  1275						      "sticky_create_fifo");
  1276				return -EACCES;
  1277			}
  1278	
  1279			if (sysctl_protected_regular >= 2 && S_ISREG(inode->i_mode)) {
  1280				audit_log_path_denied(AUDIT_ANOM_CREAT,
  1281						      "sticky_create_regular");
  1282				return -EACCES;
  1283			}
  1284		}
  1285	
  1286		return 0;
  1287	}
  1288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

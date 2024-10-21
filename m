Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4EB1F8EF0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518509; cv=none; b=GS+rg5nr6svHMPupcCtEg6mpBiLgqJyGmpz0MQmU7OMLtJkdCw66F+6pY+KniTLt+KStmInViq+7g1sTcQN+Tn8Rl1iynbgKTIAny9i0nV1WqUkxh9/gnygZ18NDOcuM7bSVOCTECNu8GFnX0aiVtP1Jc1O3w1lTsJe3y6caKYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518509; c=relaxed/simple;
	bh=PlMJK8Omy+uXRcLlNBZFIADbVL16nXhKt2564NhHeo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kamGGayAhFWJAj/5Rib9kL9nEtX1xXm5Hn+DsToSrp6xQLjBZAchNLugBHEo2I9hPYCARBn8CfSYdjgWRCEXGh714ymwdmoUXw/3cyVQUFkrnrSdithTU8mSuw+Apgrrj4t/MEiJpFP87BbiJ/RcYzn/cBorLGJSuU2JPYRoJGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9/I4ZH2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9/I4ZH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729518507; x=1761054507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PlMJK8Omy+uXRcLlNBZFIADbVL16nXhKt2564NhHeo0=;
  b=Y9/I4ZH2XjKbR6eov2uXCGf9BDAT0TKrBddhlrrIf8p7hYK5MuI/pvhZ
   u3e3KcmzqatZt18p4rbKgjWr2+O/PP/bm7hq5ZOmv1bziE8fiYSePYgrF
   khp9LLir69IxW8pV918pd5M1Bw3Ca0dLaDkW4UXnQsvCH0K1nMwIKk6qf
   qwtH1o3rNZEiMn+2JAwp3nC6fPYtnXKY3rvj4roCqUbn3M7REJFU4F6Ru
   Ri4okGkUMxyteBLA8bJ4weWGMKjKhPIQc7L/f7iiv+A5tjvFVUt3ZoBqy
   uGYM0pnzs9rHZAaoHLYwY0If6Y3+FMhIDBz/D6eBpe4PixP2VD1QJh5i5
   w==;
X-CSE-ConnectionGUID: 6OiQNmVNS3ST/H36XvDS+w==
X-CSE-MsgGUID: PSyeLyszQcGiFHHXJA4T9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29121125"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="29121125"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 06:48:27 -0700
X-CSE-ConnectionGUID: FWPGs4IOSCuS/oAPaQs03w==
X-CSE-MsgGUID: gOpqU1cwRc+4+Aoby5BzHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79933256"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2024 06:48:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2slj-000SDS-0d;
	Mon, 21 Oct 2024 13:48:23 +0000
Date: Mon, 21 Oct 2024 21:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sandeen:mount-api 1/1] fs/ufs/super.c:1258:22: warning: variable
 'ufstype' set but not used
Message-ID: <202410212133.0ugj8Rxm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git mount-api
head:   af0a8e5ab96dba92a0402ca56407a9e5f656403c
commit: af0a8e5ab96dba92a0402ca56407a9e5f656403c [1/1] fs: convert ufs to the new mount API
config: i386-buildonly-randconfig-002-20241021 (https://download.01.org/0day-ci/archive/20241021/202410212133.0ugj8Rxm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410212133.0ugj8Rxm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410212133.0ugj8Rxm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ufs/super.c: In function 'ufs_reconfigure':
>> fs/ufs/super.c:1258:22: warning: variable 'ufstype' set but not used [-Wunused-but-set-variable]
    1258 |         unsigned int ufstype;
         |                      ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/ufstype +1258 fs/ufs/super.c

  1249	
  1250	static int ufs_reconfigure(struct fs_context *fc)
  1251	{
  1252		struct ufs_sb_private_info * uspi;
  1253		struct ufs_super_block_first * usb1;
  1254		struct ufs_super_block_third * usb3;
  1255		struct ufs_fs_context *ctx = fc->fs_private;
  1256		struct super_block *sb = fc->root->d_sb;
  1257		unsigned int new_mount_opt;
> 1258		unsigned int ufstype;
  1259		unsigned int flags;
  1260	
  1261		sync_filesystem(sb);
  1262		mutex_lock(&UFS_SB(sb)->s_lock);
  1263		uspi = UFS_SB(sb)->s_uspi;
  1264		flags = UFS_SB(sb)->s_flags;
  1265		usb1 = ubh_get_usb_first(uspi);
  1266		usb3 = ubh_get_usb_third(uspi);
  1267	
  1268		new_mount_opt = ctx->mount_options;
  1269		ufstype = UFS_SB(sb)->s_mount_opt & UFS_MOUNT_UFSTYPE;
  1270	
  1271		if ((bool)(fc->sb_flags & SB_RDONLY) == sb_rdonly(sb)) {
  1272			UFS_SB(sb)->s_mount_opt = new_mount_opt;
  1273			mutex_unlock(&UFS_SB(sb)->s_lock);
  1274			return 0;
  1275		}
  1276		
  1277		/*
  1278		 * fs was mouted as rw, remounting ro
  1279		 */
  1280		if (fc->sb_flags & SB_RDONLY) {
  1281			ufs_put_super_internal(sb);
  1282			usb1->fs_time = ufs_get_seconds(sb);
  1283			if ((flags & UFS_ST_MASK) == UFS_ST_SUN
  1284			  || (flags & UFS_ST_MASK) == UFS_ST_SUNOS
  1285			  || (flags & UFS_ST_MASK) == UFS_ST_SUNx86) 
  1286				ufs_set_fs_state(sb, usb1, usb3,
  1287					UFS_FSOK - fs32_to_cpu(sb, usb1->fs_time));
  1288			ubh_mark_buffer_dirty (USPI_UBH(uspi));
  1289			sb->s_flags |= SB_RDONLY;
  1290		} else {
  1291		/*
  1292		 * fs was mounted as ro, remounting rw
  1293		 */
  1294	#ifndef CONFIG_UFS_FS_WRITE
  1295			pr_err("ufs was compiled with read-only support, can't be mounted as read-write\n");
  1296			mutex_unlock(&UFS_SB(sb)->s_lock);
  1297			return -EINVAL;
  1298	#else
  1299			if (ufstype != UFS_MOUNT_UFSTYPE_SUN && 
  1300			    ufstype != UFS_MOUNT_UFSTYPE_SUNOS &&
  1301			    ufstype != UFS_MOUNT_UFSTYPE_44BSD &&
  1302			    ufstype != UFS_MOUNT_UFSTYPE_SUNx86 &&
  1303			    ufstype != UFS_MOUNT_UFSTYPE_UFS2) {
  1304				pr_err("this ufstype is read-only supported\n");
  1305				mutex_unlock(&UFS_SB(sb)->s_lock);
  1306				return -EINVAL;
  1307			}
  1308			if (!ufs_read_cylinder_structures(sb)) {
  1309				pr_err("failed during remounting\n");
  1310				mutex_unlock(&UFS_SB(sb)->s_lock);
  1311				return -EPERM;
  1312			}
  1313			sb->s_flags &= ~SB_RDONLY;
  1314	#endif
  1315		}
  1316		UFS_SB(sb)->s_mount_opt = new_mount_opt;
  1317		mutex_unlock(&UFS_SB(sb)->s_lock);
  1318		return 0;
  1319	}
  1320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5A0111BE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 20:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yaw2ZYVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697400635; x=1728936635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W4kAabbhK1zktYGktVoeFFioQcq5TzWEu05wN1EOsWY=;
  b=Yaw2ZYVDKjg0+fG2AVv3c1wuLABF0qhZXxVvIwcPjK12PXZtsCHjPpFl
   esxnw5QGLSvqU6Avr1NbgioSKXF9Mo9pACgkQqFWq0btmkfYktv/iPdWW
   se5Mon7wQS9pUpCsBgKfdTYHT5UtcZ5LICUA+z2FYnfuyHTuSxjbZZ4X4
   Wap7p+Y+pvcyRM+jS6q2lctW9npXwUj1yicJ0nOibCVO2EJIukZb2a+85
   uc37qiIa0rOfo4AiGqAsyKRTcMgZIEjkPqk6NF2u2jOWxmGgJcuhqQD/G
   FkeC5Z2la4Tz+qFXbjHGKVxYvAywBJfRc4xu/1e/25tGklgub7sk1TOLG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="449618020"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="449618020"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 13:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="929118107"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="929118107"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Oct 2023 13:10:33 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs7RW-0007l3-32;
	Sun, 15 Oct 2023 20:10:30 +0000
Date: Mon, 16 Oct 2023 04:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 8/30] checkpatch: WARNING: Missing a blank
 line after declarations
Message-ID: <202310160438.BxdCdzHN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   a0ba52a923559bf03cf408db6ff1b0cc0318421b
commit: c2dc68c10dc4980e464c0c17b278884f0a2b5a62 [8/30] ovl: split ovl_want_write() into two helpers
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160438.BxdCdzHN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160438.BxdCdzHN-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#46: FILE: fs/overlayfs/util.c:24:
+	struct ovl_fs *ofs = OVL_FS(dentry->d_sb);
+	return mnt_get_write_access(ovl_upper_mnt(ofs));

WARNING:LINE_SPACING: Missing a blank line after declarations
#53: FILE: fs/overlayfs/util.c:31:
+	struct ovl_fs *ofs = OVL_FS(dentry->d_sb);
+	sb_start_write(ovl_upper_mnt(ofs)->mnt_sb);

WARNING:LINE_SPACING: Missing a blank line after declarations
#65: FILE: fs/overlayfs/util.c:43:
+	struct ovl_fs *ofs = OVL_FS(dentry->d_sb);
+	mnt_put_write_access(ovl_upper_mnt(ofs));

WARNING:LINE_SPACING: Missing a blank line after declarations
#71: FILE: fs/overlayfs/util.c:49:
+	struct ovl_fs *ofs = OVL_FS(dentry->d_sb);
+	sb_end_write(ovl_upper_mnt(ofs)->mnt_sb);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

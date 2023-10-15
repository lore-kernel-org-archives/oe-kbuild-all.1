Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34C315BE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 02:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXk+4x89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697338344; x=1728874344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8p3vP5McDEfhD1BNkamdqwcwE7Z/zZKFUOuYevhRCQ4=;
  b=JXk+4x89CDMXtaDqjBIU+zsZX4RCHlMaNVwaR8p7T25QNcaZdT0TdMkX
   g7Veo3cPLeWjcIZc4nf9tYJOCCXVzGKajB4CgiNLjLpQDV/Kc2F3+1nFy
   5y4SjlonJSU4ds82LNkvfmEEED0ZNGm6PRv4noc8spYJO40QSflhrqCIR
   D1ZoQe/GWAWg9vxfEsOyKy8qmQYes0QEis32NK1J/ffKSA3AyXEoSptKf
   sfNsADa0HxCy8uxAEb5iz2JDpjz1yvcYscuQWgnk51ZAhD68cQsPCt3vd
   3Z9W79LGQY+ixqOgc1QSWP2ETg8h7QEJX9D6ja5/k1O156IooYqDferrf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389220930"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389220930"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 19:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="705144332"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="705144332"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Oct 2023 19:52:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrrEn-0006xG-17;
	Sun, 15 Oct 2023 02:52:17 +0000
Date: Sun, 15 Oct 2023 10:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:backing_file 8/22] checkpatch: WARNING: Missing a blank
 line after declarations
Message-ID: <202310151050.ObFZrq00-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux backing_file
head:   3f6f4728c87b06cbb4d7917bf25bcf95b3ee4973
commit: c2dc68c10dc4980e464c0c17b278884f0a2b5a62 [8/22] ovl: split ovl_want_write() into two helpers
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310151050.ObFZrq00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151050.ObFZrq00-lkp@intel.com/

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

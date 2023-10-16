Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C86C241FF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dgk9Mgpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697457992; x=1728993992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JyXlL52lgLd8wS8O1UWq3aSm1cwBm0Zl+oBDJ/jbssk=;
  b=Dgk9Mgpx2xyEuSvUoGYi/+JPZ/4b9dOhBeyCQF5jzDbbKiNXPnIdlcAH
   TW1YtXP2pbmJ571nFRTe+J7Az92F5YVcXIZSsHHybXm0QglOOB+wWEb0r
   dDDOE/FUDgJuL7FV1T0dqgFVJeNkZKVr8duUGQqQg0Z2/41thsI4q8QVt
   x03GfauLXRosKZHeYp/6GjnwJYdHO8g6sivdsMGk3Qlp3WWriQvQg7Ndz
   rUYurSRGReI+OcPCsCFElkk8dhZ2ldIE/5K7dbCk3ihsCQT2eqc44U1ZC
   n9zATtX2wSGi/GIwUKETw9az+dbibImwiVA8blR684Edy0ktoMPs5+l8m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416579903"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="416579903"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 05:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="3516374"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Oct 2023 05:05:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsMMd-0008MJ-2x;
	Mon, 16 Oct 2023 12:06:27 +0000
Date: Mon, 16 Oct 2023 20:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:backing_file 8/21] checkpatch: WARNING: Missing a blank
 line after declarations
Message-ID: <202310161911.1VYKgSiu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux backing_file
head:   d25adf128a9821b19c3ee85d5a812cba70beed1c
commit: d8d9363c152c31158f112e63aa869c564109ecf9 [8/21] ovl: split ovl_want_write() into two helpers
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161911.1VYKgSiu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161911.1VYKgSiu-lkp@intel.com/

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

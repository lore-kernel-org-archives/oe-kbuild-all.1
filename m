Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB94210F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cbKbL1w5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697454568; x=1728990568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AKNStMDYDkJDa3Ifp9wo/RR2BGNqjiJY+bOo36Bao1o=;
  b=cbKbL1w5bXhA6+s/RgXsGPbtaxdK4E0ivudnanjHOKKSq8Vnq+gj/5nH
   iyNKQmT1nmwzifEqwupn3f3rHB1axZyxS2QOAmGyVr529RZUzwFsxOSZn
   sUKlsJUEz8DSwRWK0Wjgy05MX6DxcYEkDU6IJm7kdqGUFPCYLHCKJATDz
   sfPT89JSaS5T1cUzjrCvynRD+uBsYuGMDluySvnnS86zMl8OTrxBYv/Lg
   0C3TfiMs0zKicJ06hgLCvni0keHBPllG0tACui2LQxsUsh3GDfEMudPQi
   DihhFwqGW2Ncn9pSIn6763SU2soXxuNEWF8Eh5oo78jWKMFkYbeyokhmN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="471725235"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="471725235"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 04:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="929305405"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="929305405"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Oct 2023 04:09:25 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsLTP-0008Jd-1h;
	Mon, 16 Oct 2023 11:09:23 +0000
Date: Mon, 16 Oct 2023 19:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 8/29] checkpatch: WARNING: Missing a blank
 line after declarations
Message-ID: <202310161916.agX24HXD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   f03ede00336ef2e0770b7b634af07815c476250c
commit: d8d9363c152c31158f112e63aa869c564109ecf9 [8/29] ovl: split ovl_want_write() into two helpers
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161916.agX24HXD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161916.agX24HXD-lkp@intel.com/

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

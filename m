Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29EC189917
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 22:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724798003; cv=none; b=uC051WwrbNtCIrIitKWBtuIsbdvhWNEcpSjgqNtC6FSZ2o4lUB/QYJfVwP654FFKbWjb6yWsjw2NyJ00+eOovQ0Boam2h1ORMxrIaGKFpFHUiXcUF3tykD60BP3tMkWG+uwPbvmdlz8mASfLk7xlvLU4j2lS4Ni/BxXYbPtCeHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724798003; c=relaxed/simple;
	bh=Rqhenk+ug1yGCD3gZA61c1wUPY4X79az26VbsrV5Abo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QDLNb2B0QIsz8XUieEc+oV09iL+4a6k5uyM31RpEHl05olDXKY4gFMYTRN3n4XNbfsiB1WTvIae+88HOwcT9IeQ5d0JH+QzFBFYqaxab39rYpEvF8XRhHZbmMD/jAHijTuvfL5yQMpqHcRD5yDexvYQ5C8VGZUkl+ULtpDpv9f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ciStEWE7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ciStEWE7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724798002; x=1756334002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rqhenk+ug1yGCD3gZA61c1wUPY4X79az26VbsrV5Abo=;
  b=ciStEWE7g0Mahgp1TXgB7izB+Rf7IPPfjMYvhFPg0GCSd6cKVD1zt2XG
   z254cC8Wirx+sm1y52jIB88PNzncA2WMnaRdy5SE2w4VZTRrN6YCc+Hk6
   e6YtMttIkzvm7TGlgGw6Df83Ptpk334oTxyIRVO1x5Sz7hgCZs9ToX8Dt
   B1jUHwurzLsB0v13Xzvsi1paDlOP68EyE+PfvBdFRaY3TFgr0saRbhkmO
   DA8PbMb8NDgXyFblhgF4o3x49v6P/Zebtzr8q73l1+6V4K01OzDdnlH2z
   HFk93GAtz9djuL4yWQkL8kDrJ8TN8dFdr5EYxgOOmNZBUTJHrWvu7kUWb
   A==;
X-CSE-ConnectionGUID: T3lRmsUoSciWfhPgYGaz+A==
X-CSE-MsgGUID: dUiSUtSiROqb3A9pMEJY0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="22828612"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="22828612"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 15:33:21 -0700
X-CSE-ConnectionGUID: G2rNz1ThTB6zgGE5OJVXPg==
X-CSE-MsgGUID: EpD+TBaPRZe89mNsllnK0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="62975991"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Aug 2024 15:33:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj4kX-000K9y-23;
	Tue, 27 Aug 2024 22:33:17 +0000
Date: Wed, 28 Aug 2024 06:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, wangyigen <ygw111@yeah.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26811/30000] include/linux/backing-dev.h:418:49:
 warning: 'struct cgroup_subsys' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202408280630.Xx6ILcbO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b32a887db4e5c4c061e61977efabbc1d5e867aa7
commit: 13e5c52d7cec7621f78bce452b78785e689ed0b2 [26811/30000] cgroup_writeback: bind blkcg and memcg
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240828/202408280630.Xx6ILcbO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280630.Xx6ILcbO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280630.Xx6ILcbO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/nfs_fs_sb.h:6,
                    from include/linux/nfs_fs.h:39,
                    from init/do_mounts.c:23:
>> include/linux/backing-dev.h:418:49: warning: 'struct cgroup_subsys' declared inside parameter list will not be visible outside of this definition or declaration
     418 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^~~~~~~~~~~~~


vim +418 include/linux/backing-dev.h

   417	
 > 418	static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
   419						   struct css_set *cset)
   420	{
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

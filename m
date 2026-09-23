Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140174570F4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157507; cv=none; b=hCnK+CRhpnyb+x7HdxwCas36RBap0mAnANVkyDeGBVKdreZ259WkFTpKMf9aaku0nNQTiG2v8jwVGMgHOfC+zkxdSZa6Rh3w71f740JGCqjKqoz5LJJw2qvj4X6LEIdNTj7SVs7JUflVVwuI0AGn0m0ALt3hWLezC9tFA+cTRsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157507; c=relaxed/simple;
	bh=PCHeQrPzY+P6C3ER9FlGXD892zxhqUUBCloBQqY+WHY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CdRryEdTkA/7T1IR45vFUxpqfIQXRFHCApvedG2ZfYQHwPqmOxMJLryjqxwF76B+gh2GrIssLaDyK/HS4P48WV+EcFMaw2Zeoavkp/OPRuE1Ghrc9RHjlvJ9Y9J2kn6Ysp3RxZXZFfk9cDAEZLJgMdJrBOZ974mM9DaVFFBJz4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJEb0v4U; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJEb0v4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790157506; x=1821693506;
  h=date:from:to:cc:subject:message-id;
  bh=PCHeQrPzY+P6C3ER9FlGXD892zxhqUUBCloBQqY+WHY=;
  b=RJEb0v4U257Nvm0Gq1KkpSNkBVuDGWwxWp5orsoL22QY0OF2hech09O7
   JR+5BuB76uJVLPBQOVrbq0i/TsiKofQ51nC3adBAKnkAtb9/r4iPsWwU/
   E5zCLCnjRqHjg4tXpMppdSlYJIkOit9wr8VMdztk6jV5x5KHgdOUi6HAp
   qrNRHFakTfgJn8dExchBRHItNQ9Mqhd7Zj4vR4Lw27H0mcxfIJLIYQPyg
   b8nRl+5B1KQii/qyvDoLT1BOvWqSl8zesAsKF2QYpU5wX8XJzYhC/NA56
   WmdjZzo8bjE6VT8EPRYuynbu1uXFzEXEJMJIzrW14g2mvxv4zrQf+R/aw
   g==;
X-CSE-ConnectionGUID: p2P3XX59Thej7+KX7VPStQ==
X-CSE-MsgGUID: zrMn8X1sTcqS3brkGCafSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="93335841"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="93335841"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 02:58:26 -0700
X-CSE-ConnectionGUID: NlSPm0HzTEmKpmJM4csQuQ==
X-CSE-MsgGUID: VA1wt91ERoqCn+oRcAG3UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4627413"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 23 Sep 2026 02:58:25 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Jk6-000000000c9-1zOU;
	Wed, 23 Sep 2026 09:58:22 +0000
Date: Wed, 23 Sep 2026 11:58:00 +0200
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [song:vfs-mount-lsm 3/8] security/apparmor/mount.c:369:13:
 warning: the address of 'dev_name' will always evaluate as 'true'
Message-ID: <202609231157.iljVwagM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/song/linux.git vfs-mount-lsm
head:   8ad7b1df9b9f7aad03a05ff62ec0f4b056a5bdb0
commit: 29d4e9aed0d3c9b01889fef51d01f9983796a30c [3/8] apparmor: Convert from sb_mount to granular mount hooks
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260923/202609231157.iljVwagM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231157.iljVwagM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231157.iljVwagM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/mount.c: In function 'aa_bind_mount':
>> security/apparmor/mount.c:369:13: warning: the address of 'dev_name' will always evaluate as 'true' [-Waddress]
     369 |         if (!dev_name || !*dev_name)
         |             ^
>> security/apparmor/mount.c:369:26: warning: the comparison will always evaluate as 'true' for the address of 'dev_name' will never be NULL [-Waddress]
     369 |         if (!dev_name || !*dev_name)
         |                          ^
   In file included from include/linux/dma-mapping.h:5,
                    from include/linux/skbuff.h:28,
                    from include/linux/lsm_audit.h:24,
                    from security/apparmor/include/audit.h:16,
                    from security/apparmor/mount.c:17:
   include/linux/device.h:931:27: note: 'dev_name' declared here
     931 | static inline const char *dev_name(const struct device *dev)
         |                           ^~~~~~~~


vim +369 security/apparmor/mount.c

2ea3ffb7782a84 John Johansen             2017-07-18  354  
90c436a64a6e20 John Johansen             2022-09-19  355  int aa_bind_mount(const struct cred *subj_cred,
90c436a64a6e20 John Johansen             2022-09-19  356  		       struct aa_label *label, const struct path *path,
29d4e9aed0d3c9 Song Liu                  2026-07-06  357  		       const struct path *old_path, bool recurse)
2ea3ffb7782a84 John Johansen             2017-07-18  358  {
2ea3ffb7782a84 John Johansen             2017-07-18  359  	struct aa_profile *profile;
2ea3ffb7782a84 John Johansen             2017-07-18  360  	char *buffer = NULL, *old_buffer = NULL;
29d4e9aed0d3c9 Song Liu                  2026-07-06  361  	unsigned long flags = MS_BIND | (recurse ? MS_REC : 0);
2ea3ffb7782a84 John Johansen             2017-07-18  362  	int error;
6c27cd23bd43c8 John Johansen             2026-07-27  363  	DEFINE_AUDIT_MOUNT(ad, OP_MOUNT, subj_cred);
2ea3ffb7782a84 John Johansen             2017-07-18  364  
2ea3ffb7782a84 John Johansen             2017-07-18  365  	AA_BUG(!label);
2ea3ffb7782a84 John Johansen             2017-07-18  366  	AA_BUG(!path);
29d4e9aed0d3c9 Song Liu                  2026-07-06  367  	AA_BUG(!old_path);
2ea3ffb7782a84 John Johansen             2017-07-18  368  
2ea3ffb7782a84 John Johansen             2017-07-18 @369  	if (!dev_name || !*dev_name)
2ea3ffb7782a84 John Johansen             2017-07-18  370  		return -EINVAL;
2ea3ffb7782a84 John Johansen             2017-07-18  371  
2ea3ffb7782a84 John Johansen             2017-07-18  372  	flags &= MS_REC | MS_BIND;
6c27cd23bd43c8 John Johansen             2026-07-27  373  	ad.mnt.flags = flags;
2ea3ffb7782a84 John Johansen             2017-07-18  374  
2ea3ffb7782a84 John Johansen             2017-07-18  375  
341c1fda5e1715 John Johansen             2019-09-14  376  	buffer = aa_get_buffer(false);
341c1fda5e1715 John Johansen             2019-09-14  377  	old_buffer = aa_get_buffer(false);
df323337e507a0 Sebastian Andrzej Siewior 2019-05-03  378  	error = -ENOMEM;
9c95a278ba7ca3 Patrick Steinhardt        2019-12-11  379  	if (!buffer || !old_buffer)
df323337e507a0 Sebastian Andrzej Siewior 2019-05-03  380  		goto out;
df323337e507a0 Sebastian Andrzej Siewior 2019-05-03  381  
ecafacef162fc7 John Johansen             2026-07-28  382  	error = fn_for_each(label, profile,
29d4e9aed0d3c9 Song Liu                  2026-07-06  383  			match_mnt(profile, path, buffer, old_path,
6c27cd23bd43c8 John Johansen             2026-07-27  384  				  old_buffer, NULL, flags, NULL, false, &ad));
df323337e507a0 Sebastian Andrzej Siewior 2019-05-03  385  out:
df323337e507a0 Sebastian Andrzej Siewior 2019-05-03  386  	aa_put_buffer(buffer);
df323337e507a0 Sebastian Andrzej Siewior 2019-05-03  387  	aa_put_buffer(old_buffer);
2ea3ffb7782a84 John Johansen             2017-07-18  388  
2ea3ffb7782a84 John Johansen             2017-07-18  389  	return error;
2ea3ffb7782a84 John Johansen             2017-07-18  390  }
2ea3ffb7782a84 John Johansen             2017-07-18  391  

:::::: The code at line 369 was first introduced by commit
:::::: 2ea3ffb7782a84da33a8382f13ebd016da50079b apparmor: add mount mediation

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

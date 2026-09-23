Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B745247FB04
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158788; cv=none; b=KdbV/bPm8gtjrVxVYSCyO4pwbzdlGKlAJrIq0tr5QBGLlGj24b2I2QJqrou0MG30EEr4p2Wjadz9nihn2SxomTBQldpGA3sDLwNv693r5kODD5ox5f+ZBAkjNNM1y/LI9rFbjuqbRbCod3xDsqu9x7kgtt42QquRAXA3rykXUsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158788; c=relaxed/simple;
	bh=f2us68J+sbkxQsSAGYHwTaPYsNmsETc3pTj5CbTishQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lzcO85/32lbyEU6EYEvPYdV/L2HRiVzBr4suYDY/s00okuspyA6iqCM7ypOYf10xuAuwfPR8/uzzVqHWwf8BTtKVoIBcocafLTgchI0gqI4Q8La+3Kol9m+SnAnwAaA+0FG2iPFuX4i27/osd09hehpgk4q732m+2eyErkYhwzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=io1C5YZ9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="io1C5YZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790158784; x=1821694784;
  h=date:from:to:cc:subject:message-id;
  bh=f2us68J+sbkxQsSAGYHwTaPYsNmsETc3pTj5CbTishQ=;
  b=io1C5YZ98E7vZyiyo7wSmxDPBJMXY3kO33ck8Xd0u7YvApQ3xNBrDBsO
   XR3EmhJtFai43rtbbwWcVZjFq173nKndgRULOjjfu5uPgCadZRHuIOtZr
   y9vDmbuGgQ6Xqf8T8Coc5FgECz+IHNI+eq/4ERlZFj4B580/CR58JG7Qc
   YgZg60Ld3fVzTY4O3wXbPIOg8zwu5WuFpzFUrC9kFH8q3SyOWP1jQSHgm
   prSu+p+2lJ9SF6PIQ4INdxOZUkVQi60kqhd4IFhUCjYdbU6ZdSFDw44WC
   XlIDJmZAhdEfxq3nOLVXHFJa5xJkfVXZF0K3LujCGzv1aFYiJsKsLu8mg
   g==;
X-CSE-ConnectionGUID: vo3Gm+llQRS02Xn6TbkWbQ==
X-CSE-MsgGUID: vvy4lLNTTLWi05NVbkicYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90858864"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90858864"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 03:19:39 -0700
X-CSE-ConnectionGUID: +ROS0HCXQNqCgmt1vwIf7A==
X-CSE-MsgGUID: 1D+fLwVZSZCq6OICKS2upg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="270066079"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 03:19:37 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9K4c-000000000cV-11vE;
	Wed, 23 Sep 2026 10:19:34 +0000
Date: Wed, 23 Sep 2026 12:18:38 +0200
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [song:vfs-mount-lsm 3/8] security/apparmor/mount.c:369:7:
 warning: address of function 'dev_name' will always evaluate to 'true'
Message-ID: <202609231243.dBmfdEyG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/song/linux.git vfs-mount-lsm
head:   8ad7b1df9b9f7aad03a05ff62ec0f4b056a5bdb0
commit: 29d4e9aed0d3c9b01889fef51d01f9983796a30c [3/8] apparmor: Convert from sb_mount to granular mount hooks
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260923/202609231243.dBmfdEyG-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231243.dBmfdEyG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231243.dBmfdEyG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/mount.c:369:7: warning: address of function 'dev_name' will always evaluate to 'true' [-Wpointer-bool-conversion]
     369 |         if (!dev_name || !*dev_name)
         |             ~^~~~~~~~
   security/apparmor/mount.c:369:7: note: prefix with the address-of operator to silence this warning
     369 |         if (!dev_name || !*dev_name)
         |              ^
         |              &
   1 warning generated.


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

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959652C9D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 00:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737245603; cv=none; b=NgMHreLbjYqgveVhiWMOn2jeO2Y9dJ81gQW2RFL+4oFEX+MVhZEBfhR5I9UVeKV5wIfKLr2+otyXYtSUt5iTHW4JUZ99wseYoJ/H90okUawGPvM1r16nDOoBlVLbL0F3onmOm1ECL3ExhJYVCyGjFudQaSfC0GAJJXwOai/FsUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737245603; c=relaxed/simple;
	bh=x9fcsw2qUTjEgxVrKXOtVkvS09FC84D5H901fci/DHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LSSGQ4bmkWOGtGN48hxqNvy4T4pdv/pfZ9zWXlC4oGW9I0aLfDfsWL+hJLX/WSHB7r72b3GQFDTRw9zm2firk+jPC51Hx7tArRUtlWatTiiVBMn9zNtq5uk5kVfKABDcymhalku1gPhosb8qK67aDU5TY3HqPevGxYctW0wwCG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwolWoDB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwolWoDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737245602; x=1768781602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x9fcsw2qUTjEgxVrKXOtVkvS09FC84D5H901fci/DHc=;
  b=AwolWoDBDJRny0ImLBQpwMEw8EUNe48EM8eerOKdnEh4e9Lkl42VGSv0
   V2P1QHp+iHYn/tp//o2lHiigsiNrG3PdvWLcz0S9wbUrzXXlagl68eVmB
   hsIKzEfdCfG77JnTNPMGikm0ZMRB2iloSX/GXV3/pZiNLrEWp/gO6m2az
   JLAPpzn80tJos6l3JRYnGiaDwytZO8KLYE3Gdlge2PBkqjON+1svgNw9/
   xz3YsXlxnlbNM+prWTe6Z0zBPwgwZ+pzqz1jv8qAoOx4Xw/1u9nC4xWVR
   RS5UxDL9wBqZ/jeso4naV72Y0mtbFGaqxn4tMmMjcxMfaIaHZH5AIawX+
   w==;
X-CSE-ConnectionGUID: QfwmTwfMSdC34+phXVtbHg==
X-CSE-MsgGUID: PLSu7ycTQjiwdT/FcBSiHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="25244959"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="25244959"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 16:13:21 -0800
X-CSE-ConnectionGUID: DIHyBi5QThGTkaU0gPikOA==
X-CSE-MsgGUID: 0jqgthrWQViP3lk4f4G8qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="106088861"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Jan 2025 16:13:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZIwH-000UxD-2c;
	Sun, 19 Jan 2025 00:13:17 +0000
Date: Sun, 19 Jan 2025 08:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Deven Bowers <deven.desai@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	Fan Wu <wufan@linux.microsoft.com>
Subject: security/ipe/policy_fs.c:21: warning: cannot understand function
 prototype: 'struct ipefs_file '
Message-ID: <202501190816.IQ5G26HR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   595523945be0a5a2f12a1c04772383293fbc04a1
commit: 2261306f4a3cea362fc40285e750a801dc0cfbe3 ipe: add userspace interface
date:   5 months ago
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250119/202501190816.IQ5G26HR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190816.IQ5G26HR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190816.IQ5G26HR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/ipe/policy_fs.c:21: warning: cannot understand function prototype: 'struct ipefs_file '
>> security/ipe/policy_fs.c:407: warning: cannot understand function prototype: 'const struct ipefs_file policy_subdir[] = '


vim +21 security/ipe/policy_fs.c

    17	
    18	/**
    19	 * ipefs_file - defines a file in securityfs.
    20	 */
  > 21	struct ipefs_file {
    22		const char *name;
    23		umode_t access;
    24		const struct file_operations *fops;
    25	};
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE62722AE7A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 07:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764140918; cv=none; b=ugPVT3f3gdeafYlKJNZM2n9NGfbTv2DcwDm8RSI8J42eXSCriOo6QEGKE1QD9oijkWBI+F2M+WWwup5NSwnOXiw4I1iUf3w8QebhnzpHDtL+uQVm3dx7dRN+YZrbZQe/wlB2daay4Y/6mmO9oQnPy5GrjMTP5wVNQwbePa/koEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764140918; c=relaxed/simple;
	bh=C9+oxih0Sh+OxPUVcvOPu19j9oA63UraWrX125pF47g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uPlJt4mG1+/jJOG39n1+/elCjVqyq5MKkXbSnL9zQqUD07Vv3A+qQqpn38vQwncLEG+eje6U3d6L94CBCGtxLT3Mo3hrQPnPQKzKkHFeGDoID7ZGWg3P6Wq4nISaBDnUM5fZYlSjXSHeZ1FRnRMk/aEBe+c429ShLNtNEbhWyJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gf7QDoaK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gf7QDoaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764140917; x=1795676917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C9+oxih0Sh+OxPUVcvOPu19j9oA63UraWrX125pF47g=;
  b=Gf7QDoaKHIh8KAnj0mMKWWkdndQlCYVxuVqymX3opasV0gh30KVtUOVI
   F0l/qWwucnDQNt79+CW2Gcx/1XEAvylJBOem0HBoHH9axuxy3tJGTGyjU
   HQbj/BeEqOtb3K7lYRNmNwsLTwjhYJox2RC+ylDbvxHYyecyrSsVMdmjB
   2Dai4toCdj5uzPmNtYDjj9wuOShDnPB5TpSaKEk34PlgTcL59ykO9teb7
   INwF/g1Az3w1YDr8XC6nLUTCOsLh19N4wW2rHEgQhsbgrJ+praferQitB
   KPXltGf54puk7r+j91B6acSiLNTXMGDEEJWAgy9aErBSAv6ToZSTYNme6
   A==;
X-CSE-ConnectionGUID: RA576627TlO+83sXaXARuA==
X-CSE-MsgGUID: Efusc0avTj+AyxA1KVioNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="68759079"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="68759079"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 23:08:36 -0800
X-CSE-ConnectionGUID: js5FA1h5Rniv9wpuT5dpHw==
X-CSE-MsgGUID: SOhbOAa7TOy1QCIEJqvULw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="193094649"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Nov 2025 23:08:35 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO9dg-000000002aF-47Wk;
	Wed, 26 Nov 2025 07:08:32 +0000
Date: Wed, 26 Nov 2025 15:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 18/25] fs/fsuevent.c:85
 format_uevent_strings() warn: unsigned 'buflen' is never less than zero.
Message-ID: <202511261401.aud2BrPN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   dc427bc7b2db9a19cb1a7c2380e44fcda6314504
commit: dcd8e3104f632fb72cd8b0d00bf0cc791dfdb9a7 [18/25] fs: send uevents for filesystem mount events
config: csky-randconfig-r072-20251126 (https://download.01.org/0day-ci/archive/20251126/202511261401.aud2BrPN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511261401.aud2BrPN-lkp@intel.com/

smatch warnings:
fs/fsuevent.c:85 format_uevent_strings() warn: unsigned 'buflen' is never less than zero.

vim +/buflen +85 fs/fsuevent.c

    33	
    34	#define ADVANCE_ENV(envp, buf, buflen, written) \
    35		do { \
    36			ssize_t __written = (written); \
    37			*(envp) = (buf); \
    38			(envp)++; \
    39			(buf) += (__written) + 1; \
    40			(buflen) -= (__written) + 1; \
    41		} while (0)
    42	
    43	static char **format_uevent_strings(struct super_block *sb, const char *source)
    44	{
    45		unsigned int envlen = 0;
    46		size_t buflen = fs_uevent_bufsize(sb, source, &envlen);
    47		char *buf;
    48		char **env, **envp;
    49		ssize_t written;
    50	
    51		buf = kzalloc(buflen, GFP_KERNEL);
    52		if (!buf)
    53			return NULL;
    54		env = kcalloc(envlen, sizeof(char *), GFP_KERNEL);
    55		if (!env) {
    56			kfree(buf);
    57			return NULL;
    58		}
    59	
    60		envp = env;
    61		written = snprintf(buf, buflen, "TYPE=filesystem");
    62		if (written >= buflen)
    63			goto bad;
    64		ADVANCE_ENV(envp, buf, buflen, written);
    65	
    66		written = snprintf(buf, buflen, "SID=%s", sb->s_id);
    67		if (written >= buflen)
    68			goto bad;
    69		ADVANCE_ENV(envp, buf, buflen, written);
    70	
    71		if (source) {
    72			written = snprintf(buf, buflen, "SOURCE=%s", source);
    73			if (written >= buflen)
    74				goto bad;
    75			ADVANCE_ENV(envp, buf, buflen, written);
    76		}
    77	
    78		if (sb->s_uuid_len == sizeof(sb->s_uuid)) {
    79			written = snprintf(buf, buflen, "UUID=%pU", &sb->s_uuid);
    80			if (written >= buflen)
    81				goto bad;
    82			ADVANCE_ENV(envp, buf, buflen, written);
    83		}
    84	
  > 85		WARN_ON(buflen < 0);
    86		return env;
    87	bad:
    88		kfree(env);
    89		kfree(buf);
    90		return NULL;
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

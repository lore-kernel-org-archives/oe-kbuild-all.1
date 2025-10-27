Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB3835B149
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 22:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761605407; cv=none; b=eMV7oWIlRPUMTWx5oVQnGKpbqY/EHDExLByuz4+J48X/0TBMZZZfsY3Mt8XmXPsEPu2hKgp40lZtNTg+/PKxn5kdqKkXStCVCycogWkieBk/q3mrP4zqiangyISzpF/ttv1QRj0j0+mbghG/bIuWqFJoqGOI9B/XhgqByl/KlP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761605407; c=relaxed/simple;
	bh=RnNep036q4iv8opqBbw/a6jxnMQVl22UjrqnHKvIkWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iDZ5+7eXq+s//WVqlzhsUqtcZNeyapUXrSJzPSoUPi8L9cvYMomMqcogRIQP7ARCO7u244UjgvrBdZeQ37y7KpkWpMlLNraTwQrhkepZuIo93tMV0FmVCX6LSeoFe1RwNsmHUkH5UKXAIzPd6FN1TBIX98kMJ69hitQc6itIM0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FsXMBlYw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FsXMBlYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761605406; x=1793141406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RnNep036q4iv8opqBbw/a6jxnMQVl22UjrqnHKvIkWA=;
  b=FsXMBlYw19tVEL3W16kg5sY1h5lbqUT23rSQhD2qR1CxDuvLnO1YhdeB
   MTsFRlw4RkXExYYwQ0+ynmMWG8oq56eji23KSyCLuean+gmhb8zm5mmIB
   05a+33fPa4uXtTTVwLs7eqw/kzoNKyjQcwkyFSJK3Zpd/cmjpez86Kyk+
   d1ABpKLJ2K69pzM8PEhGy4hyEdwxGXTU3j9cU4h/6tW1tQnSsj9Ifvicr
   D5XDJoBklM1gGLXg4zGASuF6NWk6vFsuofwvHmln8anJ9M0czcqhZICqn
   FdGXju3JzePxFImG6vy+SX7Rz9Bxci4EKAQOs2DM/drgqtvPV3Ef75FIP
   g==;
X-CSE-ConnectionGUID: S9eLULsrT7yf2tHKz8Q6gQ==
X-CSE-MsgGUID: QooNPEoBTfeMGMaXSQSsDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62903104"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="62903104"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 15:50:05 -0700
X-CSE-ConnectionGUID: uwfwvx+8T9GBih0CIqMQCA==
X-CSE-MsgGUID: 3uH8RvU1TcGts9P2uJBz0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="185933760"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Oct 2025 15:50:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDW2H-000IXx-0W;
	Mon, 27 Oct 2025 22:49:58 +0000
Date: Tue, 28 Oct 2025 06:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3944/4376] net/core/dev.c:13167:31: warning:
 '__find_trim' defined but not used
Message-ID: <202510280634.g0xVebXG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
commit: 626d6c55975359931f6feabc9f60304bc67e5f25 [3944/4376] net: update dev_put()/dev_hold() debugging
config: arm-randconfig-004-20251028 (https://download.01.org/0day-ci/archive/20251028/202510280634.g0xVebXG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280634.g0xVebXG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280634.g0xVebXG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/dev.c:13167:31: warning: '__find_trim' defined but not used [-Wunused-function]
    static noinline unsigned long __find_trim(unsigned long *entries, int nr_entries, const char *name)
                                  ^~~~~~~~~~~


vim +/__find_trim +13167 net/core/dev.c

 13166	
 13167	static noinline unsigned long __find_trim(unsigned long *entries, int nr_entries, const char *name)
 13168	{
 13169		int i;
 13170		char buffer[KSYM_SYMBOL_LEN];
 13171		const int len = strlen(name);
 13172	
 13173		for (i = 0; i < nr_entries; i++) {
 13174			snprintf(buffer, sizeof(buffer), "%pS", (void *)entries[i]);
 13175			if (!strncmp(buffer, name, len))
 13176				return entries[i];
 13177		}
 13178		return 0;
 13179	}
 13180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

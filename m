Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003C1171B0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 18:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720981348; cv=none; b=ahzOye908YcLH8pVmGTZj0CSsK7vxeav+giEoTYgkZjOJ1z4dRqSqXhLrZTeLzh7/QP+voEfFvvkOWmnOH1SIQRDObm7eBYng8YjpVyx+A5ahV/gjDjhImg3A0oG3TycLa58x3OafgX/Gva15S7o9r5OoOPmr16jJ8QJlevHTbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720981348; c=relaxed/simple;
	bh=azphbRs1y25gD2L18uxi41DkmogwEWzQ6xlQ8Z4vrIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QvMJC5WUE27WuoiUCWfTZ6f/x7VZZx4eUK/wj72bgnCXRQWDCHrvlRTt4WVgYPopfLN7+cfhqntiPcFzwNaqpK+eUfKWsExx6+vqcTKqVnGBsOkmRgV4eu5QuhnW6g7I+kw9gYkzRlk36DnX4UpDalTNWMuGvsKTvwse2o6t06w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVwSyztO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVwSyztO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720981346; x=1752517346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=azphbRs1y25gD2L18uxi41DkmogwEWzQ6xlQ8Z4vrIA=;
  b=IVwSyztO+NXAU3GhvB+gbBL1nQLEuhjciAKRFKknaKsoTCTcDDlqHHkc
   xSOnyE6+lvxd2xcsjb/dFputxLc60WndZTVZAcht/YniJJH7QTKFVg37K
   p+ingXto1/uGa3+Ixx4ykCFK9w12Gy1etgKUvANIgbOR8XlwFmg3jRt/u
   oE4Y+C+y96r1bIR0o9yn+JX5iBR+c3CDn8gbA9CTP9p8VrIB137l4G7lz
   MNVntU1FubaQQQcArLJdcQ5nMg3gIXNXe1b1Ikr/zu2jux5/plH/SmUeg
   ugbyl47k+H/rl3ZoyPM3WIRT0TQIDHZyS3xl3tLq5r8Bni1orniOWEClX
   w==;
X-CSE-ConnectionGUID: 94lvhzoETAKv+bCB7nLMiA==
X-CSE-MsgGUID: 8BbqMkKHRNaHtb1fRPqDZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="22123026"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="22123026"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 11:22:25 -0700
X-CSE-ConnectionGUID: hX606dAzRb+Q/6tqVAxD4g==
X-CSE-MsgGUID: mad5FF6ZRy+fm9rAne12Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="50038049"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jul 2024 11:22:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sT3ra-000deo-0c;
	Sun, 14 Jul 2024 18:22:22 +0000
Date: Mon, 15 Jul 2024 02:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 4/4]
 fs/smb/server/vfs_cache.c:39:27: warning: 'dh_task' defined but not used
Message-ID: <202407150202.o5Gf9rN4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   c11a5805413bdbe0a22e94458aeeda3bac9b63a7
commit: c11a5805413bdbe0a22e94458aeeda3bac9b63a7 [4/4] ksmbd: add durable scavenger timer
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240715/202407150202.o5Gf9rN4-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240715/202407150202.o5Gf9rN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407150202.o5Gf9rN4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/vfs_cache.c:39:27: warning: 'dh_task' defined but not used [-Wunused-variable]
      39 | static struct task_struc *dh_task;
         |                           ^~~~~~~


vim +/dh_task +39 fs/smb/server/vfs_cache.c

    36	
    37	static bool durable_scavenger_running;
    38	static DEFINE_MUTEX(durable_scavenger_lock);
  > 39	static struct task_struc *dh_task;
    40	static wait_queue_head_t dh_wq;
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F5F23BB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709469112; cv=none; b=doNf/WFeLWuHnEEKhreejzc3a+8L4LKXUu59CjsppaAEfCe3cVSCdQSeiNMRFAZMQyL3YZnIfQfQEjtodYXXxsmv2Fgvb5zkLeaBN5U+ItX7F9OTiolK3PPJ+6ZPpB2sHMtSpGPIaAjzFBMcRCon5Pi7KAGqocFld0RS3q7E6hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709469112; c=relaxed/simple;
	bh=gBjzT2281GiA7dT1megECICmgYVHp+/aJod803Azu+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M15NyJxmoiJeJy3l79WM6omBaAmlRKf+NbQ2e3QxFSQnNeDaZdBQz8mhbIVOIyY+Z0oS1TPIma5YhG79g4RKAQm/Js/lshoMm1lpeyiJ1RaQRSwi4kx/erPmMABXUm4VyyNY308RkK6OoLJCu+4IdGtz/4EBShxV0B4aZY7oTWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOA0aFSU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOA0aFSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709469110; x=1741005110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gBjzT2281GiA7dT1megECICmgYVHp+/aJod803Azu+Y=;
  b=JOA0aFSUCnv0p2stEkd7vyRF8BheGelBrjYjMAlSwrPN25uf5Hfj0+Gf
   82Yx/TUY2FE20nvWbB0OYMpdFDr9EfHG9KL895pQg8Hyh8iqCLK77N24p
   X+mUavlY9EN1Uib5y5X00LqUjYbAEQ6RE4Ezfaoh4erB8QUeyA1sSjlyU
   AgIF3qi40yh8ugMkUx8Ov7/KQGMrvB+SBbuFtwuZ+Sysu49i6EtfRmZG2
   xJT4eVR7DxxSOvdi2mZoiwL+OzeGH4A8NUmObZl2PqcUViOUWRdpgSz3G
   EDCnzo24fBfo2g5buVm3s8ml3t3nfD8ckHyZ0mhO4OfWemfzGw/4haXDy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14610410"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="14610410"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 04:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8629150"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Mar 2024 04:31:48 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgl0L-0001lG-0R;
	Sun, 03 Mar 2024 12:31:45 +0000
Date: Sun, 3 Mar 2024 20:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@elte.hu>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [cip:linux-4.19.y-cip-rt-rebase 56/29558]
 kernel/printk/printk.c:415:17: warning: function 'early_vprintk' might be a
 candidate for 'gnu_printf' format attribute
Message-ID: <202403032052.mSj2Th1w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ingo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   dce1701e767e33da39db64fe691cd4783ec7dbbf
commit: 29cc071417024b2c660e4286ba533e1a5b954864 [56/29558] printk: Add a printk kill switch
config: i386-buildonly-randconfig-003-20240303 (https://download.01.org/0day-ci/archive/20240303/202403032052.mSj2Th1w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403032052.mSj2Th1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032052.mSj2Th1w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/printk/printk.c: In function 'early_vprintk':
>> kernel/printk/printk.c:415:17: warning: function 'early_vprintk' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     415 |                 int n = vscnprintf(buf, sizeof(buf), fmt, ap);
         |                 ^~~


vim +415 kernel/printk/printk.c

   410	
   411	static void early_vprintk(const char *fmt, va_list ap)
   412	{
   413		if (early_console) {
   414			char buf[512];
 > 415			int n = vscnprintf(buf, sizeof(buf), fmt, ap);
   416	
   417			early_console->write(early_console, buf, n);
   418		}
   419	}
   420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

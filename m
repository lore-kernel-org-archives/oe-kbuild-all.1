Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792863149;
	b=VTheaLREp0cEscN/+Rkt5ZmM5rbDcxpj9llM6WEV2dgkn7DuU89AIk9GhA5oE1FKpTg+
	 kmIOyZrEvmJwvf9lftrp3c5Il5jefJ0y7R1+up1n98MzdtxSoTiN582XNaiivyqPpkEtv
	 zUDy+1sKweFQcCq9R8gDfhSCIKYjHzbabddKtNrzhv4exMshzeAXEQ6R+xhHowu3EzTkk
	 STpZ9Q/uqcTVC7SMzjal11kb/dGiJSovy6itZczm8g6fSbUHohznZqZHsxAewpoJMXe7n
	 Gl+NomX1E6ZuJWYGouB4dvzvPGwrtpIUDnSUbMpgAd7UZrAMJ+HKKwxTD+80tZYjxeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792863149;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AvZIMTn6Xp1OODwuwJdnK9+sZYtTGfDg09lb7OOiQnY=;
	b=r2zD343cp55jk6irhed7CjB4FTv/+Vu1xxqEgL9wrFUrsDKsQhPR6o3EpX6YH7QiEtnc
	 5AHxz5dsahIRavN5aAm3GZ+FPYaEFbdZPwuGeOrjl9XjMN0XWoYEtv535qXyx5uNucRql
	 9BaDUO8sLaGliMbuiVQ1dmWe6Z1XVRz7r/WbHtoXKqeD9cPVta0uck4hVfbAcvWXDOo5H
	 GwsNbPTQgGBpcRDmQlc3yMEjenEOiu/bDV6ena7glyeEctrTVouyK8yRzmTDZOWUSicEd
	 hJun8bPFp2Iy9CmHCd6cotM225oZwBoJjltw+mp7UvNhB1M1TwIMBJYtpyNRjbfxEJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bVN6Txwj;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C8E606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 17:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C8E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bVN6Txwj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792863148; x=1824399148;
  h=date:from:to:cc:subject:message-id;
  bh=gdJPNrN6Pgh24cSJTI6+tjFbJ7pa9+B4drreqFoDGpk=;
  b=bVN6TxwjpeLzOnSyqMp2kdM/+GzC/wE97oNWU2CKRGNEbQe1jfd5X8Nk
   +qGhjJj379MzD3sE/tH28P0fR+lSaSv4IoTT3LMZAnZ1MQTJ1rZPLuVT4
   6b1Dg9YeR9BXn6IBYmJUppisOAazN70fbi87QzP9fHCRKlYTFobZMgRX9
   I4M+BPnd2dMElsqcv812yQHyojbCoC4c4/adni7MeBdYwTduiRnAwSyzB
   ve+rJgMONntyfOtVc+9vDL5Uw8KEszTkh5kzQItdikh5WFjRuab2KzoyP
   YZ75BZTNKgnaUMIhWpFu3AVp8KIwOI0QFwEZSVU80EtuRb9HVogvE3HU+
   w==;
X-CSE-ConnectionGUID: LlVycXjUSjSKelPEBMTZ+g==
X-CSE-MsgGUID: 4QonQJWsRKmKkmpOiFXWLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1476547"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1476547"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 10:32:28 -0700
X-CSE-ConnectionGUID: 3V+NpseaRKSdnSdG1QFSuA==
X-CSE-MsgGUID: hb+b7peMQiKC7/QcGpMKhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="4019591"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2026 10:32:27 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKfbU-00000000U6I-2Fxm;
	Sat, 24 Oct 2026 17:32:24 +0000
Date: Sun, 25 Oct 2026 01:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/base/power/wakeup.c:1219:5: warning: no previous prototype for
 'wakeup_sources_stats_open'
Message-ID: <202610250109.I5tYNwcI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Bo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   32521e28daaacb02caff14090988d91503e61978
commit: 5df128deb8f2e04a46acb77df6aec44b1d343583 [2/2] ANDROID: Allow vendor modules to get wakeup sources data.
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20261025/202610250109.I5tYNwcI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610250109.I5tYNwcI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610250109.I5tYNwcI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/wakeup.c:1219:5: warning: no previous prototype for 'wakeup_sources_stats_open' [-Wmissing-prototypes]
    1219 | int wakeup_sources_stats_open(struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/wakeup_sources_stats_open +1219 drivers/base/power/wakeup.c

  1218	
> 1219	int wakeup_sources_stats_open(struct inode *inode, struct file *file)
  1220	{
  1221		return seq_open_private(file, &wakeup_sources_stats_seq_ops, sizeof(int));
  1222	}
  1223	EXPORT_SYMBOL_GPL(wakeup_sources_stats_open);
  1224	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

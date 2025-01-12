Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991361957FF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736678594; cv=none; b=DbKxOOgMTVAh12VvuMIfRI9tYzxUy7WLwbNNe8/mmU0sTvzCQZ9GG7RadnyGYxhmV8vr9jTRTL0YcAQnCFi8Hs38bR2U7YOZoFuQQH1XZP/j+5SCheDHGk4IkbsK1h46Gfn8fs7sO8hGWibxEELUkinELW9819SzYv1EIAtJ74Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736678594; c=relaxed/simple;
	bh=KSv1S4kJHF5lsyL/+4mWXWxCeMXrJ4EBqkzvQ9XCWe8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c2/+DtiuezzyoJvgkeYFnnyIQKJyax69Dh6/PNcBpL/0hspLw1Bt9JRlKfR+eW5wQMkPHSzKzQS/GOiVGbHAuDD5PI5Mujbp8n50VVC8f+p/k0pemk+gorxxeKT9TCSuP3evJH3nKwinEb6EK2CE7Jx+u4Y3j1e8CViIeshNzRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEdYrUsb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEdYrUsb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736678592; x=1768214592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KSv1S4kJHF5lsyL/+4mWXWxCeMXrJ4EBqkzvQ9XCWe8=;
  b=gEdYrUsbTv4ocduxy+MrQX8z6CXneFcKUls0Y8Mq1+mzvOHRRbGXeh1O
   OWErgxxSg1eCqn3ZqSNkuMSYyPgOwXd2RxYen+g55VkJXWoUUa4XgRNoL
   gZ0+wXbyJ4qMiBF660jm4wpD3B7AULqt2fxCIPNxybpTtLLM7p1Zi+uKP
   TmvazpXaP9/B7nIA8yISpDCI9OLK+bnKQ1Q7YTemeuZ3JUOX/F/qmONX3
   ia2HbMO7AnYNNb/732Iw/Rf0AtuwHN0/aFDewOxGRpzT6IH/wyLzErBJ6
   PDHgRvTgsane0hB3Nn4nYvurryk2eLvv83KANvCXFX0/ka9yOxzx7BkVx
   g==;
X-CSE-ConnectionGUID: F73uykw3RZ+4v9uwSF1itw==
X-CSE-MsgGUID: An/ev+hhROO5MYuQKiCy+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47913240"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="47913240"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 02:43:12 -0800
X-CSE-ConnectionGUID: 2Mdl5Md+Swuu7S2BgMNALQ==
X-CSE-MsgGUID: CtkEhj0WRFqhnBlZo2hLIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="109198563"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jan 2025 02:43:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWvQx-000LoJ-0o;
	Sun, 12 Jan 2025 10:43:07 +0000
Date: Sun, 12 Jan 2025 18:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: Vikas Gupta <vikas.gupta@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Edwin Peer <edwin.peer@broadcom.com>,
	Michael Chan <michael.chan@broadcom.com>
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2883:32: warning:
 '%s' directive output may be truncated writing up to 31 bytes into a region
 of size 26
Message-ID: <202501121803.OAjkdvn9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b62cef9a5c673f1b8083159f5dc03c1c5daced2f
commit: 63185eb3aa267f2844580bbd8c9c1c97516f5dbb bnxt_en: Provide stored devlink "fw" version on older firmware
date:   3 years, 2 months ago
config: powerpc64-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20250112/202501121803.OAjkdvn9-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121803.OAjkdvn9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121803.OAjkdvn9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c: In function 'bnxt_ethtool_init':
>> drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2883:32: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size 26 [-Wformat-truncation=]
    2883 |                          "/pkg %s", buf);
         |                                ^~   ~~~
   In function 'bnxt_get_pkgver',
       inlined from 'bnxt_ethtool_init' at drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:3723:3:
   drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2882:17: note: 'snprintf' output between 6 and 37 bytes into a destination of size 31
    2882 |                 snprintf(bp->fw_ver_str + len, FW_VER_STR_LEN - len - 1,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2883 |                          "/pkg %s", buf);
         |                          ~~~~~~~~~~~~~~~


vim +2883 drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c

  2873	
  2874	static void bnxt_get_pkgver(struct net_device *dev)
  2875	{
  2876		struct bnxt *bp = netdev_priv(dev);
  2877		char buf[FW_VER_STR_LEN];
  2878		int len;
  2879	
  2880		if (!bnxt_get_pkginfo(dev, buf, sizeof(buf))) {
  2881			len = strlen(bp->fw_ver_str);
  2882			snprintf(bp->fw_ver_str + len, FW_VER_STR_LEN - len - 1,
> 2883				 "/pkg %s", buf);
  2884		}
  2885	}
  2886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

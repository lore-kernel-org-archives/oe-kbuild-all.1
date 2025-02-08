Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582DF14D2A0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 08:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002830; cv=none; b=NpS/7XT7G9fkzLf7RwC1w5tqD7soNctqTotbFx775iOzmMT05p9TI8VnJKxBOCF7AmDS/HI3XSzOXy4f4PAWBeuwPuLdYRoPGqTrg2bX5dh2z26nONH6x79VD4z0EEUFhnPBJfqKG9Y0wtk4TAO+5nVVdqhGJ03novKECWDHXQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002830; c=relaxed/simple;
	bh=0Swt1ZlGkTThdksPE/Bv4C1QdGg8QJOF14eYS9G6FeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDec6sgk5yTs7LOskAL66yPLU++X4U1YYOVLjeC337zWRsKWGCPGc8dBWlycfDwDm0wD6sdQvGADX0hpnqXpO9RLnaCheGY+kSJUHqwMv5GT/JmHqUp9h4VbHgVgY66vAEfUwRcyMcKY1KFPjFU4LCe3paWdwr2KBH82p8uM+14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gowsds7s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gowsds7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739002828; x=1770538828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Swt1ZlGkTThdksPE/Bv4C1QdGg8QJOF14eYS9G6FeU=;
  b=Gowsds7seqe7JtSW46bwXYysLEhYqd5SJXPFFCKwxvQ+N/U6hxGUBOqF
   BQcr4QRKlHRsANKVC6Uiax3OmCQNeuRuqom6INkbC5TdYIvxuNa1/uQ0u
   8d9G5bL18LefRDVyKtwh70JT7B8CW+fYPSjNkSE0lTUH5JYM4yDyLDL9B
   HUM+a4kgb5HgIbiU4+ATFfy4/tx3cvnAAczTTiFGzdcjlptSOyvsfKRid
   VDYnWIveG0giyWWzPvP+9VVvQqIE0b4cd2XUr3KbbLL6Z67ikWO3CNjdw
   dHObP9AVOksON5Ik/i7VTwamnrdjPCnoUU/URia7C5RsIdJkvHfVtKg0L
   w==;
X-CSE-ConnectionGUID: r0ntlpesQ3OQDVzWuekKxg==
X-CSE-MsgGUID: /AQgssS6RyuqMS8gEZwGtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50271539"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="50271539"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 00:20:27 -0800
X-CSE-ConnectionGUID: XS3bosKmQ4ey/q/SFd2OEA==
X-CSE-MsgGUID: TIwCsZISRhiI/3Z8ovocLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="111680258"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Feb 2025 00:20:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgg4c-000zkB-0H;
	Sat, 08 Feb 2025 08:20:22 +0000
Date: Sat, 8 Feb 2025 16:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Xu <lizhi.xu@windriver.com>,
	syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com
Cc: oe-kbuild-all@lists.linux.dev, eadavis@qq.com, johan.hedberg@gmail.com,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	luiz.dentz@gmail.com, luiz.von.dentz@intel.com, marcel@holtmann.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH next] Bluetooth: l2cap: protect conn refcnt under hci dev
 lock
Message-ID: <202502081633.z7O9VFNy-lkp@intel.com>
References: <20250207140216.3076952-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207140216.3076952-1-lizhi.xu@windriver.com>

Hi Lizhi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250207]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhi-Xu/Bluetooth-l2cap-protect-conn-refcnt-under-hci-dev-lock/20250207-221142
base:   next-20250207
patch link:    https://lore.kernel.org/r/20250207140216.3076952-1-lizhi.xu%40windriver.com
patch subject: [PATCH next] Bluetooth: l2cap: protect conn refcnt under hci dev lock
config: i386-buildonly-randconfig-001-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081633.z7O9VFNy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081633.z7O9VFNy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081633.z7O9VFNy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/bluetooth/l2cap_core.c:7477:27: warning: 'l2cap_conn_hold_unless_zero' defined but not used [-Wunused-function]
    7477 | static struct l2cap_conn *l2cap_conn_hold_unless_zero(struct l2cap_conn *c)
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/l2cap_conn_hold_unless_zero +7477 net/bluetooth/l2cap_core.c

4d7ea8ee90e42f Luiz Augusto von Dentz 2021-01-13  7476  
6ab54a71718943 Luiz Augusto von Dentz 2025-01-16 @7477  static struct l2cap_conn *l2cap_conn_hold_unless_zero(struct l2cap_conn *c)
6ab54a71718943 Luiz Augusto von Dentz 2025-01-16  7478  {
6ab54a71718943 Luiz Augusto von Dentz 2025-01-16  7479  	BT_DBG("conn %p orig refcnt %u", c, kref_read(&c->ref));
6ab54a71718943 Luiz Augusto von Dentz 2025-01-16  7480  
6ab54a71718943 Luiz Augusto von Dentz 2025-01-16  7481  	if (!kref_get_unless_zero(&c->ref))
6ab54a71718943 Luiz Augusto von Dentz 2025-01-16  7482  		return NULL;
6ab54a71718943 Luiz Augusto von Dentz 2025-01-16  7483  
6ab54a71718943 Luiz Augusto von Dentz 2025-01-16  7484  	return c;
6ab54a71718943 Luiz Augusto von Dentz 2025-01-16  7485  }
6ab54a71718943 Luiz Augusto von Dentz 2025-01-16  7486  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

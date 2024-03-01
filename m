Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD7917BA4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 18:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709316576; cv=none; b=DewQbHO5v6oFZwzuRDHcCAcZguufQ7iFgPASBmkM5nlqrYTnkmC/pXCcCn1Q2Y/NK2HhZQRm/XRAkxeoRqvAy+w247vWoLYupSmmB+9zOzC9im52SCAUB+emVj80Xa92APIO+F43rGPkEWij7JMQzVqMjCl5aVc+CgPkEtlsGeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709316576; c=relaxed/simple;
	bh=sC+2dTlA9LMt3gouORb2uYP1jJTT6Wj/2ZS9cjxNrbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tbx7kWWThNy817mw/MnVLSMdh8oJjZQWbW0QXYmouaVU5XfmmznLKkiNm4p2DwMk5kxoYQhauB2QZOe0QCnxlA5Vfq5wZR2zxikT4pZzejwgk4ZIeJxLX9mmvxXWbNGv8uUG+rRVkHvZKL0lKXZQRvTkuCjXCMHQSrTenIZb42o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+uQzzBJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+uQzzBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709316575; x=1740852575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sC+2dTlA9LMt3gouORb2uYP1jJTT6Wj/2ZS9cjxNrbw=;
  b=G+uQzzBJyVUnJnArVxp/b4ljjhLX6r3EhLgPD+0git5sfX8UbvCLxqwL
   N2sz1EkukHgrYiI+m3GpAaOn4kReKpcdDvZv61Jb0CCQFmrg4P39U+QcP
   wVSI+zNnrna2bv8UV15msVMyImGY52i24q+/7jdpdBnkWM+SQ+v5ymmTw
   A+3C5lLJGL2kfQjCFuau+krUV4YZQJbdU/SzmsA0qnLUHu6vwo+7OXBxA
   IFdKDO5gg4+/bWplinnY/8JlARM1hrTCHaadCENqaKxWZSviMTiBO2RlO
   bxYKj/v3RK3JzK5MxAJ1+WEUZbkzRmgpD5w0AJAFy/Q27ZHXMbowN9uhj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="7680702"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="7680702"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 10:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8654831"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Mar 2024 10:09:30 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg7Jv-000E1d-34;
	Fri, 01 Mar 2024 18:09:22 +0000
Date: Sat, 2 Mar 2024 02:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: net/netfilter/ipvs/ip_vs_conn.c:827:13: warning: 'ip_vs_conn_del'
 defined but not used
Message-ID: <202403020145.sBIfPoyd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 17af31ba1e41411828b96431040a21b51193e015 ipvs: queue delayed work to expire no destination connections if expire_nodest_conn=1
date:   11 months ago
config: arm64-randconfig-003-20240301 (https://download.01.org/0day-ci/archive/20240302/202403020145.sBIfPoyd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020145.sBIfPoyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020145.sBIfPoyd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/ipvs/ip_vs_conn.c:827:13: warning: 'ip_vs_conn_del' defined but not used [-Wunused-function]
     827 | static void ip_vs_conn_del(struct ip_vs_conn *cp)
         |             ^~~~~~~~~~~~~~


vim +/ip_vs_conn_del +827 net/netfilter/ipvs/ip_vs_conn.c

   825	
   826	/* Try to delete connection while not holding reference */
 > 827	static void ip_vs_conn_del(struct ip_vs_conn *cp)
   828	{
   829		if (del_timer(&cp->timer)) {
   830			/* Drop cp->control chain too */
   831			if (cp->control)
   832				cp->timeout = 0;
   833			ip_vs_conn_expire(&cp->timer);
   834		}
   835	}
   836	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

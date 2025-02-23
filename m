Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1392A1096F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 03:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740282922; cv=none; b=SiXqs95LgFBg5vXPwGpv26JJcUc5/AmY9tTmAApqcsdVtiPedshTn+vS6+0Lcqg6sNQDlvxDMyqlVr3vL1Piwjh0+V48Xq8580IbSnz4p7IhejtF7LrUrsVA7sPOQiuPgDXvMSrtT5cznFL8rwO+KSFIBB00lqU+7RQusjd1c6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740282922; c=relaxed/simple;
	bh=KZmy1ZrMdi6IZfiQLvvrJ2OWInxac7xHUdX79uoP820=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZhxT7yYw2wC9i2XSAI8a8lxhFLUdWvNWOrBO9fKyaDLXzqng1KGLzLf9sI9NvPEAs6hdtKsPV31lxA+byafmGiQ1OsFWrI20biWFv4P4sKRqTgmXKlWUQq1a/47xQXZf68Zd+1wrCz3W3GWbCqEv9z1nk3eXPq1HOS42ASfNCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIXZlGLH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIXZlGLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740282920; x=1771818920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KZmy1ZrMdi6IZfiQLvvrJ2OWInxac7xHUdX79uoP820=;
  b=kIXZlGLHAzmIeGYdWXUV6Z5RCEWmdJeMrwZED3VkxiXZmw6RfO7JY0/j
   sXuMwicEl+hiDkhmFkqSeSPu4JlweIYB7ZINSfECbaUj2bbB0ntWDcCg3
   OrbKG3Rzh3iZ/m84dcTo9JHc2HC936NPU+M2IU890B1uf06l2kfyCAQKe
   sIdCh+bLSZfQU0MJahs36iZGnS3qP+DdmQ6O7cYZgrHfY1LKCiGv7UXE6
   eUwZlt8J24ATzIjTxfeWcHLEAPTQ++DvMpV5ZFPVt7iH4I0b/z2QQPBhH
   /CcDxFTcggeDw4qoM1eSIW0g/UbRXRFVKWQICCcMW6uwSYODOyOQzcM+v
   Q==;
X-CSE-ConnectionGUID: gymvroqJR0qKDQzJnFR+IQ==
X-CSE-MsgGUID: /Hf2yixnSbSnNtONmP7M0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="66435528"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="66435528"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 19:55:19 -0800
X-CSE-ConnectionGUID: sW2ChistRr6UJyrpFEb2mg==
X-CSE-MsgGUID: U5J2pGQyTfegku1bDw0isQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="116374500"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Feb 2025 19:55:18 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm35H-000779-1v;
	Sun, 23 Feb 2025 03:55:15 +0000
Date: Sun, 23 Feb 2025 11:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v9 4/6] memcg: Use trylock to access memcg
 stock_lock.
Message-ID: <202502231159.uI2OsAAB-lkp@intel.com>
References: <20250222024427.30294-5-alexei.starovoitov@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222024427.30294-5-alexei.starovoitov@gmail.com>

Hi Alexei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov/locking-local_lock-Introduce-localtry_lock_t/20250222-104619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250222024427.30294-5-alexei.starovoitov%40gmail.com
patch subject: [PATCH bpf-next v9 4/6] memcg: Use trylock to access memcg stock_lock.
config: x86_64-buildonly-randconfig-003-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231159.uI2OsAAB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231159.uI2OsAAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231159.uI2OsAAB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:1778: warning: Function parameter or struct member 'gfp_mask' not described in 'consume_stock'


vim +1778 mm/memcontrol.c

cdec2e4265dfa09 KAMEZAWA Hiroyuki         2009-12-15  1760  
567511462387230 Sebastian Andrzej Siewior 2022-03-22  1761  static struct obj_cgroup *drain_obj_stock(struct memcg_stock_pcp *stock);
bf4f059954dcb22 Roman Gushchin            2020-08-06  1762  static bool obj_stock_flush_required(struct memcg_stock_pcp *stock,
bf4f059954dcb22 Roman Gushchin            2020-08-06  1763  				     struct mem_cgroup *root_memcg);
bf4f059954dcb22 Roman Gushchin            2020-08-06  1764  
a0956d54492eb72 Suleiman Souhlal          2012-12-18  1765  /**
a0956d54492eb72 Suleiman Souhlal          2012-12-18  1766   * consume_stock: Try to consume stocked charge on this cpu.
a0956d54492eb72 Suleiman Souhlal          2012-12-18  1767   * @memcg: memcg to consume from.
a0956d54492eb72 Suleiman Souhlal          2012-12-18  1768   * @nr_pages: how many pages to charge.
a0956d54492eb72 Suleiman Souhlal          2012-12-18  1769   *
a0956d54492eb72 Suleiman Souhlal          2012-12-18  1770   * The charges will only happen if @memcg matches the current cpu's memcg
a0956d54492eb72 Suleiman Souhlal          2012-12-18  1771   * stock, and at least @nr_pages are available in that stock.  Failure to
a0956d54492eb72 Suleiman Souhlal          2012-12-18  1772   * service an allocation will refill the stock.
a0956d54492eb72 Suleiman Souhlal          2012-12-18  1773   *
a0956d54492eb72 Suleiman Souhlal          2012-12-18  1774   * returns true if successful, false otherwise.
cdec2e4265dfa09 KAMEZAWA Hiroyuki         2009-12-15  1775   */
416c592ed9773a3 Alexei Starovoitov        2025-02-21  1776  static bool consume_stock(struct mem_cgroup *memcg, unsigned int nr_pages,
416c592ed9773a3 Alexei Starovoitov        2025-02-21  1777  			  gfp_t gfp_mask)
cdec2e4265dfa09 KAMEZAWA Hiroyuki         2009-12-15 @1778  {
cdec2e4265dfa09 KAMEZAWA Hiroyuki         2009-12-15  1779  	struct memcg_stock_pcp *stock;
1872b3bcd5874b5 Breno Leitao              2024-05-01  1780  	unsigned int stock_pages;
db2ba40c277dc54 Johannes Weiner           2016-09-19  1781  	unsigned long flags;
3e32cb2e0a12b69 Johannes Weiner           2014-12-10  1782  	bool ret = false;
cdec2e4265dfa09 KAMEZAWA Hiroyuki         2009-12-15  1783  
a983b5ebee57209 Johannes Weiner           2018-01-31  1784  	if (nr_pages > MEMCG_CHARGE_BATCH)
3e32cb2e0a12b69 Johannes Weiner           2014-12-10  1785  		return ret;
a0956d54492eb72 Suleiman Souhlal          2012-12-18  1786  
416c592ed9773a3 Alexei Starovoitov        2025-02-21  1787  	if (!localtry_trylock_irqsave(&memcg_stock.stock_lock, flags)) {
416c592ed9773a3 Alexei Starovoitov        2025-02-21  1788  		if (!gfpflags_allow_spinning(gfp_mask))
416c592ed9773a3 Alexei Starovoitov        2025-02-21  1789  			return ret;
416c592ed9773a3 Alexei Starovoitov        2025-02-21  1790  		localtry_lock_irqsave(&memcg_stock.stock_lock, flags);
416c592ed9773a3 Alexei Starovoitov        2025-02-21  1791  	}
db2ba40c277dc54 Johannes Weiner           2016-09-19  1792  
db2ba40c277dc54 Johannes Weiner           2016-09-19  1793  	stock = this_cpu_ptr(&memcg_stock);
1872b3bcd5874b5 Breno Leitao              2024-05-01  1794  	stock_pages = READ_ONCE(stock->nr_pages);
1872b3bcd5874b5 Breno Leitao              2024-05-01  1795  	if (memcg == READ_ONCE(stock->cached) && stock_pages >= nr_pages) {
1872b3bcd5874b5 Breno Leitao              2024-05-01  1796  		WRITE_ONCE(stock->nr_pages, stock_pages - nr_pages);
3e32cb2e0a12b69 Johannes Weiner           2014-12-10  1797  		ret = true;
3e32cb2e0a12b69 Johannes Weiner           2014-12-10  1798  	}
db2ba40c277dc54 Johannes Weiner           2016-09-19  1799  
416c592ed9773a3 Alexei Starovoitov        2025-02-21  1800  	localtry_unlock_irqrestore(&memcg_stock.stock_lock, flags);
db2ba40c277dc54 Johannes Weiner           2016-09-19  1801  
cdec2e4265dfa09 KAMEZAWA Hiroyuki         2009-12-15  1802  	return ret;
cdec2e4265dfa09 KAMEZAWA Hiroyuki         2009-12-15  1803  }
cdec2e4265dfa09 KAMEZAWA Hiroyuki         2009-12-15  1804  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

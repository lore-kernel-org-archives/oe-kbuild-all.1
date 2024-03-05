Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E691126F1F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 15:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709652893; cv=none; b=l9wBwngj1h9vYDGZEKV0p4IPvsDy7R9vlPQL5q3oWcLzp8JtLX8z5DLn4c8moamnLPFX17OoMloKv/yLtrWhbXvjX1WUQJgTB7JqVeocX182JcJd9vtBaWm5nA4B3i87lvijCIDBHBqfv52NY9p8TRexyLf08MrWcIx5HyLL0kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709652893; c=relaxed/simple;
	bh=UZa4qLwK1HmcNZ+U/qpwCpzioJbn2XFW9oFRu+VSzYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qOcg+Fm2fo8a4bt/wbctu9K6oezuNmiXTccr0TfHEHRsO+b31lHc3PcGkqLg4jLPRjWWx3NO9trpUhYo0HSchBhbLO2lbzad9Nt0QUde0h4CkzCVdzm1UkesmVk9sl1wc0uEdpVb33Iil6sLI9sMORBQGi+98GkKKuP0gWj8THQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWKiQ8GP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWKiQ8GP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709652891; x=1741188891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZa4qLwK1HmcNZ+U/qpwCpzioJbn2XFW9oFRu+VSzYs=;
  b=DWKiQ8GPzAuog24bJPrMHh8Xyq+CGnF+8R7GomWS4ZB/iVBx7dQCyu0v
   iqgodk8ZWcLdEhLExI+3PezrtHy2kYF/M5o32x93hYh+u0NXhaEEglwNG
   kqDDbkGn/5P59OQ5NFP6eurSAaEdEEiOywrQtCD7Kj801wWopu7QQPli2
   FtgpeuIyPSqRrBS7MytrG1awEe2hL8IXIfhKO/uMu/n2mYQQxNrtvl2M3
   3qw7DDaoj+fE8neiq32GIz1Ab2I4FemKL8BvjapJjxO8IN8+Y/R2ufuEP
   kPYMHFPJ7cfJ35QDuS/VZP+eIV2fXNHcVRxsZRcR1NRYJGLfJKbuwz+Kj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="8030927"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="8030927"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 07:34:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9315704"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Mar 2024 07:34:47 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhWoW-0003P7-20;
	Tue, 05 Mar 2024 15:34:44 +0000
Date: Tue, 5 Mar 2024 23:33:58 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 25792/27434] net/ipv4/raw_diag.c:59:28:
 warning: variable 'hlist' set but not used
Message-ID: <202403052311.M8Ehex6y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 8f5ed2f767960a36919e93bbe47921afb277e09c [25792/27434] raw: use more conventional iterators
config: arm64-randconfig-004-20240305 (https://download.01.org/0day-ci/archive/20240305/202403052311.M8Ehex6y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403052311.M8Ehex6y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403052311.M8Ehex6y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/raw_diag.c: In function 'raw_sock_get':
>> net/ipv4/raw_diag.c:59:28: warning: variable 'hlist' set but not used [-Wunused-but-set-variable]
      59 |         struct hlist_head *hlist;
         |                            ^~~~~


vim +/hlist +59 net/ipv4/raw_diag.c

432490f9d455fb Cyrill Gorcunov 2016-10-21  55  
432490f9d455fb Cyrill Gorcunov 2016-10-21  56  static struct sock *raw_sock_get(struct net *net, const struct inet_diag_req_v2 *r)
432490f9d455fb Cyrill Gorcunov 2016-10-21  57  {
432490f9d455fb Cyrill Gorcunov 2016-10-21  58  	struct raw_hashinfo *hashinfo = raw_get_hashinfo(r);
9d2bd06b0c4075 kaicliu         2023-06-08 @59  	struct hlist_head *hlist;
8f5ed2f767960a Jason Xing      2023-07-24  60  	struct sock *sk;
432490f9d455fb Cyrill Gorcunov 2016-10-21  61  	int slot;
432490f9d455fb Cyrill Gorcunov 2016-10-21  62  
432490f9d455fb Cyrill Gorcunov 2016-10-21  63  	if (IS_ERR(hashinfo))
432490f9d455fb Cyrill Gorcunov 2016-10-21  64  		return ERR_CAST(hashinfo);
432490f9d455fb Cyrill Gorcunov 2016-10-21  65  
724420bf69cdfb liuchun         2022-11-02  66  	rcu_read_lock();
432490f9d455fb Cyrill Gorcunov 2016-10-21  67  	for (slot = 0; slot < RAW_HTABLE_SIZE; slot++) {
724420bf69cdfb liuchun         2022-11-02  68  		hlist = &hashinfo->ht[slot];
8f5ed2f767960a Jason Xing      2023-07-24  69  		sk_for_each_rcu(sk, &hashinfo->ht[slot]) {
8f5ed2f767960a Jason Xing      2023-07-24  70  			if (raw_lookup(net, sk, r)) {
432490f9d455fb Cyrill Gorcunov 2016-10-21  71  				/*
432490f9d455fb Cyrill Gorcunov 2016-10-21  72  				 * Grab it and keep until we fill
432490f9d455fb Cyrill Gorcunov 2016-10-21  73  				 * diag meaage to be reported, so
432490f9d455fb Cyrill Gorcunov 2016-10-21  74  				 * caller should call sock_put then.
432490f9d455fb Cyrill Gorcunov 2016-10-21  75  				 * We can do that because we're keeping
432490f9d455fb Cyrill Gorcunov 2016-10-21  76  				 * hashinfo->lock here.
432490f9d455fb Cyrill Gorcunov 2016-10-21  77  				 */
724420bf69cdfb liuchun         2022-11-02  78  				if (refcount_inc_not_zero(&sk->sk_refcnt))
9999370faed945 Cyrill Gorcunov 2016-11-02  79  					goto out_unlock;
432490f9d455fb Cyrill Gorcunov 2016-10-21  80  			}
432490f9d455fb Cyrill Gorcunov 2016-10-21  81  		}
432490f9d455fb Cyrill Gorcunov 2016-10-21  82  	}
8f5ed2f767960a Jason Xing      2023-07-24  83  	sk = ERR_PTR(-ENOENT);
9999370faed945 Cyrill Gorcunov 2016-11-02  84  out_unlock:
724420bf69cdfb liuchun         2022-11-02  85  	rcu_read_unlock();
432490f9d455fb Cyrill Gorcunov 2016-10-21  86  
8f5ed2f767960a Jason Xing      2023-07-24  87  	return sk;
432490f9d455fb Cyrill Gorcunov 2016-10-21  88  }
432490f9d455fb Cyrill Gorcunov 2016-10-21  89  

:::::: The code at line 59 was first introduced by commit
:::::: 9d2bd06b0c40753df9d060f023fb44045939c51f raw: Fix NULL deref in raw_get_next()

:::::: TO: kaicliu <kaicliu@tencent.com>
:::::: CC: Menglong Dong <imagedong@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

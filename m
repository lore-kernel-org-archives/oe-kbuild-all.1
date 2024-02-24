Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85879125A7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 05:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708751643; cv=none; b=t2kRey69SsKabtEvH26AW5TJm+NgRgZO8kAbpq+8e+rH6FgpSk+EXnRa4M+mo2waP0ld6hc+qadRIfJN+kNEtWtA75LM8HL1rocPTKXml7/ovED1oRggYmTBnZm+tMnJ6Mg41GcWpcwJmMWUahBsmUaNwiVtpRuF8w5pRioBnu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708751643; c=relaxed/simple;
	bh=FbcmjUlUFCh6eGAMkJOxY/+Wyl1mruYmrKUucf8hI5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OmCoRqArmEzmAKUsvrgXANlukOvja9Pu594WgWSkAqQfoKivp7xeS3coNdchycbqj8z3WJz4gZzrnx3OBzQjnfm0b5pQXxpvhNeROXyaYcKOq/bA6g8SO8l2YMSKMjzqkTt4zRD9RzNuSNdUao+Dx9mmEYLrWE1iU1t+LZjmddU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvoxtrL2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvoxtrL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708751640; x=1740287640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FbcmjUlUFCh6eGAMkJOxY/+Wyl1mruYmrKUucf8hI5k=;
  b=IvoxtrL2+reVK6mDI3Xg+OWanEufhfPYXI6XqOVwMVoj0BTwbv7i7ECp
   vIML2P02lbvi0lnp97BZzdpH3MlmOEmsVtpQScwqNBcUFNHVRhqAHQMfb
   9KPODgWWw9/nP2oxQHM3ALUfmqGwpaYMVvn4t9ii/PYTpLbdbs7KSu4Um
   kfJrw3CSbZGFy1LJJsQrqadbFi4h3PyNnLWa3bbrWvseQyHOyLqhSHryy
   ycUfAJYPDzAUMexCqpg3qVOm0XxVHUGVSKfssTtyJZwa+HscMDw55bHVF
   NORF3MwupbsVkcyezrNpj531PzsKhV3O1uu0bEMV2cuTNRxWz7G2ogRmA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20536988"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="20536988"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 21:14:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="10686759"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Feb 2024 21:13:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdkME-0008F6-21;
	Sat, 24 Feb 2024 05:13:54 +0000
Date: Sat, 24 Feb 2024 13:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: net/ipv4/raw_diag.c:73:25: warning: variable 's' is uninitialized
 when used here
Message-ID: <202402241348.OmIb2v1Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liuchun,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 302fd47008c3206fafe08fd3beba73076563ab04 raw: convert raw sockets to RCU
date:   1 year, 4 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240224/202402241348.OmIb2v1Y-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241348.OmIb2v1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241348.OmIb2v1Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/raw_diag.c:73:25: warning: variable 's' is uninitialized when used here [-Wuninitialized]
      73 |                         sk = raw_lookup(net, s, r);
         |                                              ^
   net/ipv4/raw_diag.c:63:28: note: initialize the variable 's' to silence this warning
      63 |         struct sock *sk = NULL, *s;
         |                                   ^
         |                                    = NULL
   1 warning generated.


vim +/s +73 net/ipv4/raw_diag.c

^590eaf1fec755 Kaixu Xia 2021-03-16  57  
^590eaf1fec755 Kaixu Xia 2021-03-16  58  static struct sock *raw_sock_get(struct net *net, const struct inet_diag_req_v2 *r)
^590eaf1fec755 Kaixu Xia 2021-03-16  59  {
^590eaf1fec755 Kaixu Xia 2021-03-16  60  	struct raw_hashinfo *hashinfo = raw_get_hashinfo(r);
302fd47008c320 liuchun   2022-11-02  61  	struct hlist_nulls_head *hlist;
302fd47008c320 liuchun   2022-11-02  62  	struct hlist_nulls_node *hnode;
^590eaf1fec755 Kaixu Xia 2021-03-16  63  	struct sock *sk = NULL, *s;
^590eaf1fec755 Kaixu Xia 2021-03-16  64  	int slot;
^590eaf1fec755 Kaixu Xia 2021-03-16  65  
^590eaf1fec755 Kaixu Xia 2021-03-16  66  	if (IS_ERR(hashinfo))
^590eaf1fec755 Kaixu Xia 2021-03-16  67  		return ERR_CAST(hashinfo);
^590eaf1fec755 Kaixu Xia 2021-03-16  68  
302fd47008c320 liuchun   2022-11-02  69  	rcu_read_lock();
^590eaf1fec755 Kaixu Xia 2021-03-16  70  	for (slot = 0; slot < RAW_HTABLE_SIZE; slot++) {
302fd47008c320 liuchun   2022-11-02  71  		hlist = &hashinfo->ht[slot];
302fd47008c320 liuchun   2022-11-02  72  		hlist_nulls_for_each_entry(sk, hnode, hlist, sk_nulls_node) {
^590eaf1fec755 Kaixu Xia 2021-03-16 @73  			sk = raw_lookup(net, s, r);
^590eaf1fec755 Kaixu Xia 2021-03-16  74  			if (sk) {
^590eaf1fec755 Kaixu Xia 2021-03-16  75  				/*
^590eaf1fec755 Kaixu Xia 2021-03-16  76  				 * Grab it and keep until we fill
^590eaf1fec755 Kaixu Xia 2021-03-16  77  				 * diag meaage to be reported, so
^590eaf1fec755 Kaixu Xia 2021-03-16  78  				 * caller should call sock_put then.
^590eaf1fec755 Kaixu Xia 2021-03-16  79  				 * We can do that because we're keeping
^590eaf1fec755 Kaixu Xia 2021-03-16  80  				 * hashinfo->lock here.
^590eaf1fec755 Kaixu Xia 2021-03-16  81  				 */
302fd47008c320 liuchun   2022-11-02  82  				if (refcount_inc_not_zero(&sk->sk_refcnt))
^590eaf1fec755 Kaixu Xia 2021-03-16  83  					goto out_unlock;
^590eaf1fec755 Kaixu Xia 2021-03-16  84  			}
^590eaf1fec755 Kaixu Xia 2021-03-16  85  		}
^590eaf1fec755 Kaixu Xia 2021-03-16  86  	}
^590eaf1fec755 Kaixu Xia 2021-03-16  87  out_unlock:
302fd47008c320 liuchun   2022-11-02  88  	rcu_read_unlock();
^590eaf1fec755 Kaixu Xia 2021-03-16  89  
^590eaf1fec755 Kaixu Xia 2021-03-16  90  	return sk ? sk : ERR_PTR(-ENOENT);
^590eaf1fec755 Kaixu Xia 2021-03-16  91  }
^590eaf1fec755 Kaixu Xia 2021-03-16  92  

:::::: The code at line 73 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

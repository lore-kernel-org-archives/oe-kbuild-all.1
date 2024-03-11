Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953AA1860
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 03:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710128597; cv=none; b=KlAJ9RB6IG+pRwsYT4084yI+061x1wJdlnz+ILlwNYJH7bM1ghzwpjKGDkQkxiC2+wwPcJvab4gmeXlZ7KBrOxe+K9rdGTmk0pB07ph3dtlZpC/vqltjoZGCmt0ecV2kXcvdLOITxCz9ofD03zi3hi01y6rOBJZsxckQV/TAYdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710128597; c=relaxed/simple;
	bh=ulTp8x9YI3mcf/CGMUhdmIYZxZ9750rq5Lnns4ZUFJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/WnzSmHH/u4r8zmFv23ZZ7hPahpFhy5tGZRbOjEO8IQWiSDt8IghiHxrMLkKUFoON89JJomaD3awDv+VilwC7ldROmaNvTS0unhQAekdZWC1Tadr22siVL1TTTTM/zTcaxsH1i6Xv5aXDFaDrm1v+KhYTL3qgCS0LKYWRlCy/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4iXfukg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4iXfukg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710128595; x=1741664595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ulTp8x9YI3mcf/CGMUhdmIYZxZ9750rq5Lnns4ZUFJg=;
  b=R4iXfukgNJUJrlTSe96PBZy3ZxnGRi8a2B6XsfqodkBNKASM9+RBaOAy
   KNPKQQfPIx+NunzWB2WTi5KzrSHbQ1I+ZDpVHTXdynwT2PRD/SH+/RcMu
   IWydazLqfnNX8PdoNaB65cEPDYUgYB5Q2Y1j6kaKHzaT/qUlA5fzh9Tni
   ffA6JbSDzLIBDsyhcB9ptoGBD6A54gk5JrljJm5fPzZifMI0uy/eVi32r
   lpGfacAm310oqzzJK8r2aM2CEfybxQ8BKmKY6tDQAPhwG8iI6a29//Q89
   2JGIiPos1qJbWtV4lisNAQF7BfnhdxI5QCY4B+m1+l56n4kJqnZdyvUGc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8593502"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="8593502"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 20:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15529184"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Mar 2024 20:43:11 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjWZB-0008s1-0x;
	Mon, 11 Mar 2024 03:43:09 +0000
Date: Mon, 11 Mar 2024 11:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 25792/27506] net/ipv4/raw.c:264:6:
 warning: mixing declarations and code is a C99 extension
Message-ID: <202403111154.mYJHBfde-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   3ba333344123321f5f312e69966bbc8e5533561f
commit: 8f5ed2f767960a36919e93bbe47921afb277e09c [25792/27506] raw: use more conventional iterators
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240311/202403111154.mYJHBfde-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111154.mYJHBfde-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111154.mYJHBfde-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/raw.c:264:6: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     264 |         int dif = skb->dev->ifindex;
         |             ^
   1 warning generated.


vim +264 net/ipv4/raw.c

   260	
   261	void raw_icmp_error(struct sk_buff *skb, int protocol, u32 info)
   262	{
   263		struct net *net = dev_net(skb->dev);;
 > 264		int dif = skb->dev->ifindex;
   265		int sdif = inet_sdif(skb);
   266		struct hlist_head *head;
   267		const struct iphdr *iph;
   268		struct sock *sk;
   269		int hash;
   270	
   271		hash = protocol & (RAW_HTABLE_SIZE - 1);
   272		head = &raw_v4_hashinfo.ht[hash];
   273	
   274		rcu_read_lock();
   275		sk_for_each(sk, head) {
   276			iph = (const struct iphdr *)skb->data;
   277	
   278			if (!raw_v4_match(net, sk, iph->protocol,
   279					  iph->saddr, iph->daddr, dif, sdif))
   280				continue;
   281			raw_err(sk, skb, info);
   282		}
   283		rcu_read_unlock();
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

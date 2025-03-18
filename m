Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83446207670
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742292639; cv=none; b=GC0G2sdgxHe0+JpZ53fxQw02EWAGyuWlBkskZJwRCoGFByaVHV7GU8Q/kxVRwYh1GsxAsVuj3LX706NbN03n941Ky8zVvmddD9KMtCe7cXNLFCIW4y7Y+1+wYWu2mG1LIOAzFSTv87kQOrfeZ/nLNujK5Z4WRHZbVi5bkmzwojw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742292639; c=relaxed/simple;
	bh=hwItOk5gGjEUAk6HgiLXNp+iq8NFujAKvtTaQdMv0PA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VAAW1NT7XUNvsPZr7oiFgzCgakfGggoR3U21tyov68asVV4lMP4nh7hOCS4+bka1+M8U3yi9Zd5jtmTaaUQmkQIMQeaevCg7JPKuwfbE/KaWdvbKHO4RYQqcdWZqzmyqkV3+3QbVZ567tv765GQxlb2WR36Dw/dJ5xuNzynLsDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3/zPMLM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3/zPMLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742292637; x=1773828637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hwItOk5gGjEUAk6HgiLXNp+iq8NFujAKvtTaQdMv0PA=;
  b=Z3/zPMLMt4HkvQhetYevAyaLne93AKQW/tkG/GZQXLJrnPSurwwFp5j3
   xwrojZLVwsywksS/I2H3Jj/zt91ityL46dvajOx5UP5kitOIY4HLVPOK3
   tn2c1w7ZWd+PnItBOUdJchPe/g2hDQ9wWYY6DidFPTvKdw0KI2KcDn70F
   y/yC158k1cTuaKgskGmO0UzkseqSCcGW8WRoPpZdx/5QCLUeBr7uodfvg
   uF0lXabvvSpceTYh2T0PtkzJvGLVY3Lso3Cx2XeXJ5FU/Tpx2xyrAh1jq
   SsUUxpVVDgwqGXujDVhjPoa01jNnHqOXZi2eiQH0nzwV89+5oQu8Xb23O
   Q==;
X-CSE-ConnectionGUID: 5mWxaf6SToesLRPycR05bw==
X-CSE-MsgGUID: Xg0GNwgaRvGDYxUJ72Q87A==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="42600173"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="42600173"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:10:22 -0700
X-CSE-ConnectionGUID: gpNrtY+qQ4ykaJPJGASpIQ==
X-CSE-MsgGUID: VJUoubPYTfGI5GEkaZeO6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="153199315"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2025 03:10:21 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuTtr-000Deu-0A;
	Tue, 18 Mar 2025 10:10:19 +0000
Date: Tue, 18 Mar 2025 18:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geliang Tang <tanggeliang@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, matttbe@kernel.org,
	Mat Martineau <martineau@kernel.org>
Subject: [matttbe-net-next:master 2/7] net/mptcp/bpf.c:36:1: warning:
 'retain' attribute ignored
Message-ID: <202503181843.dC7AJ8p4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matttbe/net-next.git master
head:   c29fa6c671907078d5c9a5b65581c1fc959d44c3
commit: 12cb71cbc372b584cd0f99a8b3d968a98f89aec1 [2/7] bpf: Register mptcp common kfunc set
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20250318/202503181843.dC7AJ8p4-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181843.dC7AJ8p4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503181843.dC7AJ8p4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/mptcp/bpf.c:36:1: warning: 'retain' attribute ignored [-Wattributes]
      36 | {
         | ^


vim +/retain +36 net/mptcp/bpf.c

    33	
    34	__bpf_kfunc static struct mptcp_subflow_context *
    35	bpf_mptcp_subflow_ctx(const struct sock *sk)
  > 36	{
    37		if (sk && sk_fullsock(sk) &&
    38		    sk->sk_protocol == IPPROTO_TCP && sk_is_mptcp(sk))
    39			return mptcp_subflow_ctx(sk);
    40	
    41		return NULL;
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

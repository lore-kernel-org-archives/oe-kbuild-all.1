Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF591F4706
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 03:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728616192; cv=none; b=g1YNnNAcFOfeIYqPWLG9cJ/50D7VlyvVTHDsqfq4iTajfBVMLLEgwTRzwjm5SGb9yGnEyqr95ELqLDqC897kl7GyGZbIpXWg8FMbiGAPaH5zHRds31NUYamhQZIwnfAE7XEpaGWRflFU66V94290S3c3dAbgSpY1IpIaia7A2Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728616192; c=relaxed/simple;
	bh=NV9tpMB8Y6NKxKHuz01ijoJakXNkMoBF3Xsw/O0GznI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EHhTz4ErcYi5t4OlPxYlgVIIcga3wKmFg9PAGDhPHa2qLZjpSTGmhbj2RcqzmfaBMcnYwFgc1doZIHC9FHgoZpip+HzDvCp/6TvwneSEfYZwszvb5w7Ywy2IGmXZOaZtHN2nvZRgswTHs7J2dY5qMmGaMnH8ltwUukslRfWr4Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbbcchUY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbbcchUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728616190; x=1760152190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NV9tpMB8Y6NKxKHuz01ijoJakXNkMoBF3Xsw/O0GznI=;
  b=XbbcchUYG/jQd94Hk9UL/auDc20VDcly7z7DQ0cpaPz71NGxuHtnkP1S
   CDBx64lTOOK5UKAOJAvHpbz8dMPu1XuYBVfz0N6McXM1W1ZWXMWN3CamA
   ONmd1Mig/fgG0BchgV9uPRSa6H3HaChkvryNIHLCH8bhmexyTmh9DV2oq
   hEn833l7uX3iUgdqZZPanzdTZXTPgrQJsEHTNrCuS8qDOEjExq9Uw0v7W
   c7aBulEqjuoifh9ZvuRSwASQQl8O8oFPThcZk1GHl3j0afu2KUQN34phJ
   3wz14KprHRTzd2d2QGrd3dvvnAjcpABCUf7S0l7F236e9bKJXBgMZscJH
   w==;
X-CSE-ConnectionGUID: 4QpyY9t+R/anabbOd9B9fg==
X-CSE-MsgGUID: fX8TxHj6QCG0gwHr//qYDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="30880486"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="30880486"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 20:09:50 -0700
X-CSE-ConnectionGUID: qQhJALKwSvGPT6WrcKmlOw==
X-CSE-MsgGUID: 7j19XDthRNOPyffkt8nPtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="81589766"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Oct 2024 20:09:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz62E-000BfJ-1m;
	Fri, 11 Oct 2024 03:09:46 +0000
Date: Fri, 11 Oct 2024 11:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 19/22] drivers/net/veth.c:1152:7: warning:
 variable 'nr' set but not used
Message-ID: <202410111108.6xBvpLMD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   098709b7d2604bd220e92052936027ed92fcde54
commit: 3cf71f993cbe997b9c05292e0cb322ce1dd70a32 [19/22] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241011/202410111108.6xBvpLMD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111108.6xBvpLMD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111108.6xBvpLMD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/veth.c:1152:7: warning: variable 'nr' set but not used [-Wunused-but-set-variable]
    1152 |                 int nr = 0;
         |                     ^
   1 warning generated.


vim +/nr +1152 drivers/net/veth.c

  1134	
  1135	static void veth_napi_del_range(struct net_device *dev, int start, int end)
  1136	{
  1137		struct veth_priv *priv = netdev_priv(dev);
  1138		int i;
  1139	
  1140		for (i = start; i < end; i++) {
  1141			struct veth_rq *rq = &priv->rq[i];
  1142	
  1143			rcu_assign_pointer(priv->rq[i].napi, NULL);
  1144			napi_disable(&rq->xdp_napi);
  1145			__netif_napi_del(&rq->xdp_napi);
  1146		}
  1147		synchronize_net();
  1148	
  1149		for (i = start; i < end; i++) {
  1150			struct veth_rq *rq = &priv->rq[i];
  1151			void *ptr;
> 1152			int nr = 0;
  1153	
  1154			rq->rx_notify_masked = false;
  1155	
  1156			while ((ptr = ptr_ring_consume(&rq->xdp_ring))) {
  1157				veth_ptr_free(ptr);
  1158				nr++;
  1159			}
  1160	
  1161			ptr_ring_cleanup(&rq->xdp_ring, NULL);
  1162		}
  1163	
  1164		for (i = start; i < end; i++) {
  1165			page_pool_destroy(priv->rq[i].page_pool);
  1166			priv->rq[i].page_pool = NULL;
  1167		}
  1168	}
  1169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

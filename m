Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D712F57867
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706609130; cv=none; b=fvNoZx7XR5vSCjaeE0buMpXyQHpwPKQiNyAcelk6DpdoYv5aFp75SMNOQUsopjCjwWodXmiT7/9gzABH4lztKO7e3keeeVPDkCrvznLUm0TgTHI6tLlhBCEm1g6XwBA8niu03JEO+mHA0WLfiQEvn6jjtkBQw2W9gIIn9FQM0bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706609130; c=relaxed/simple;
	bh=bKeuYEQz4FjNBD5WhUWC1z/IP73+tYe9VF8c9ePfxRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DDEybvbiN5rbUTLiQBESzoR0wyadA/2zmPFrEvglN2t3ZlvxiAIN1MWeX9XE6Av+hoZhwu4b68ww8sXlymmIJQ4Zri3XR+v+OcIG/zhrWGhSNSqOXblaQTJl5OlF2ft55F9X1MuovBQ2mnJRYKBB0Da4EJL8zmtmePp66gXRKOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKETnens; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKETnens"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706609129; x=1738145129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bKeuYEQz4FjNBD5WhUWC1z/IP73+tYe9VF8c9ePfxRg=;
  b=TKETnenskiYWOV2AZkoqgcxrZpJEsBg8GA+iLmDwisJtZ8wdX6VW7hNA
   DC7mLhS0pkJPcT+ds+xaebYljyRN0XtmdHD4/Utf/GsBAk2ZgaIZD40ny
   ovZOnub2v/3KTBfLozjCXGvgzwXfgMOd/Ox58dmtFxewTOPAT/VBLqDB0
   YzknT4riamJ7vbiIn6ZHXTXOXWenQnX9PZ/fxnpXHmBgSnfH1MjpuhmC4
   lWbb1RPH1x17+DPdonmf4dIEcOd6eRgTWMwYqqPUdU8CLwPRe7TqkCsXQ
   9WKTy3UgRBF+Lb/ySXQ/b/gMb6jEEg/SYkN97ipwecDyYcPGaHWWJeVcP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="9868533"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="9868533"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 02:05:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="788156419"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="788156419"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2024 02:05:27 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUkzd-0000BI-03;
	Tue, 30 Jan 2024 10:05:25 +0000
Date: Tue, 30 Jan 2024 18:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 22/22]
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:2656:34: warning: comparison
 between 'enum pkt_hash_types' and 'enum <anonymous>'
Message-ID: <202401301733.Vm0IPTrO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   001088a7cb427528b6de7c2b879ad817e5515281
commit: 001088a7cb427528b6de7c2b879ad817e5515281 [22/22] idpf: reuse libie's definitions of parsed ptype structures
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240130/202401301733.Vm0IPTrO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401301733.Vm0IPTrO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401301733.Vm0IPTrO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/div64.h:27,
                    from ./arch/loongarch/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/jiffies.h:7,
                    from include/net/pkt_sched.h:5,
                    from drivers/net/ethernet/intel/idpf/idpf.h:12,
                    from drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:4:
   include/net/libeth/rx.h: In function 'libeth_rx_pt_has_hash':
   include/net/libeth/rx.h:199:40: warning: comparison between 'enum pkt_hash_types' and 'enum <anonymous>' [-Wenum-compare]
     199 |         return likely(pt.payload_layer > LIBETH_RX_PT_PAYLOAD_NONE &&
         |                                        ^
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/net/ethernet/intel/idpf/idpf_virtchnl.c: In function 'idpf_finalize_ptype_lookup':
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:2656:34: warning: comparison between 'enum pkt_hash_types' and 'enum <anonymous>' [-Wenum-compare]
    2656 |         if (ptype->payload_layer == LIBETH_RX_PT_PAYLOAD_L2 &&
         |                                  ^~
   drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:2659:39: warning: comparison between 'enum pkt_hash_types' and 'enum <anonymous>' [-Wenum-compare]
    2659 |         else if (ptype->payload_layer == LIBETH_RX_PT_PAYLOAD_L2 &&
         |                                       ^~


vim +2656 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c

  2653	
  2654	static void idpf_finalize_ptype_lookup(struct libeth_rx_pt *ptype)
  2655	{
> 2656		if (ptype->payload_layer == LIBETH_RX_PT_PAYLOAD_L2 &&
  2657		    ptype->inner_prot)
  2658			ptype->payload_layer = LIBETH_RX_PT_PAYLOAD_L4;
  2659		else if (ptype->payload_layer == LIBETH_RX_PT_PAYLOAD_L2 &&
  2660			 ptype->outer_ip)
  2661			ptype->payload_layer = LIBETH_RX_PT_PAYLOAD_L3;
  2662		else if (ptype->outer_ip == LIBETH_RX_PT_OUTER_L2)
  2663			ptype->payload_layer = LIBETH_RX_PT_PAYLOAD_L2;
  2664		else
  2665			ptype->payload_layer = LIBETH_RX_PT_PAYLOAD_NONE;
  2666	
  2667		libeth_rx_pt_gen_hash_type(ptype);
  2668	}
  2669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

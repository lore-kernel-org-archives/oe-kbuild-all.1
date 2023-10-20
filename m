Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7458D11189
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ho4Jsfq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697792701; x=1729328701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kdmV1jPLCmN1iBmTgxE1XbvnbBt+DYMDDn6hgPdx+oM=;
  b=ho4Jsfq1fdnQYvRosBfnXtpLaaFfdsl1ICpNhn40HfgbwI6HqotHnGcF
   +wwxKjk8crQrl2dkC84eW58evwq/0H+qI95oWnGzO6m4yfXuoeUMA245f
   VMVeFG8mzJzkM2FWm+F8KTNf64SjTDb/ldgeAb85LSRdLDspHnlI8+JeL
   nIbr7Rgri9vE0kEuzvSVchTwwtdqrGlbSOfdODZBMfflu+9eT4GEO8yV1
   mJpWGAmYuWXRa86f3b08uEKFUK3MANZsyE1HoQuRdBsgHRUyOp1PM05gX
   RAZ1snE4sgS45dMep1z11tnEqBsJDjHxZBCV7G9ciku3EI6WjO/OTTzh7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386274992"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="386274992"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 02:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="848024903"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="848024903"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Oct 2023 02:04:59 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtlRB-0003Ik-0X;
	Fri, 20 Oct 2023 09:04:57 +0000
Date: Fri, 20 Oct 2023 17:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/veth2 12/16] zc_rx.c:undefined reference to
 `tcp_read_sock'
Message-ID: <202310201702.8Bu3r8QV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth2
head:   731b7375c43d08e971bcafcd9e90c1c0c8250678
commit: 3370a0fe2135834d92ab82d8cb490cd6b5188f78 [12/16] io_uring: add io_recvzc request
config: csky-randconfig-001-20231020 (https://download.01.org/0day-ci/archive/20231020/202310201702.8Bu3r8QV-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201702.8Bu3r8QV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201702.8Bu3r8QV-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_tcp_recvmsg.isra.0':
>> zc_rx.c:(.text+0x4da): undefined reference to `tcp_read_sock'
   csky-linux-ld: zc_rx.c:(.text+0x588): undefined reference to `tcp_read_sock'
   csky-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_recv':
>> zc_rx.c:(.text+0xdd4): undefined reference to `tcp_recvmsg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

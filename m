Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A2077112
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724860703; cv=none; b=dzX6V+U1kz6KibF4czZA0jiYnjsCPd1rna9ImaZJvxcX/u53LmlFYl8icONFCo6akd33jXRQGVHnjWjFjLCt6cTb0lEgPJKJXY2IBhKPclbWD1fA/EM8qEWdL8wmQVtxEHD9yRPz78BCvJh7AueOAW17vY1LJoJ3k5Xk6S/NlAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724860703; c=relaxed/simple;
	bh=vNxeR0GNYI8cPsLw/0NgaSNqFim22/qR2C517aSXJNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fv5XG0eImbMHZxHtuEvYwQx9Q6lCs/RI5LUO8/wLwIaU4zcnnB6Qwn+84LL7oR5DpTCw3NnTokghQbT8jTOAi6+IJ/XCz+Sck1xLDvMw+EMAQZYvwwaj7R2OUN0M6uwGYsl+msgeIaVwxIT7EVjlXKXnxSkvvPDXBsbtnfiBWis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YK0mHDid; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YK0mHDid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724860701; x=1756396701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vNxeR0GNYI8cPsLw/0NgaSNqFim22/qR2C517aSXJNQ=;
  b=YK0mHDid+wCx9y9qyrWiHn+9s7Tc3ikaN3U3RiehF79lJdYllc1dTotW
   eJFczyvLdXivlLuv1znp4ehkJ0ceDMhW7zfazhjZ1tzQnrbVlrVJNnpgP
   w1hRPe8hdnAE49nCxoMFOArFwMk/MHdkbqcGooQZou6+O1j/ChnN+NfiP
   QGHx+s73MAzX5NhwXPxaSjWZnGgk4fbv+pPxLyEV98qjtQqI39jiwMjEw
   /KlzUvteHAMaUR8u5bHYUtEjXpmPOV7FibwtqB/NPcBn259aYwDQ8FpWH
   wyxxQDinwS9g1odeSXBsfu5tVtiVT6JsBvPlLrIgwl5rIB7yhKZqNmaXI
   w==;
X-CSE-ConnectionGUID: l+bElem/Qly96LJ1deFDUg==
X-CSE-MsgGUID: 0Ahgm9elQDS1HNgV1dmsPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="33970601"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="33970601"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 08:58:20 -0700
X-CSE-ConnectionGUID: vkqrG9wISHyF3dd6mKOfzw==
X-CSE-MsgGUID: eA/9czFdRDWTxuI66ASyzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63323787"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2024 08:58:19 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjL3o-000L7E-2h;
	Wed, 28 Aug 2024 15:58:16 +0000
Date: Wed, 28 Aug 2024 23:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19673/23581] net/bpf/.tmp_test_run.o:
 warning: objtool: bpf_prog_test_run_skb()+0x3b2: unreachable instruction
Message-ID: <202408282340.JcOrudl8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   46d28312ab3cc0cfe7e8dea2f41d22fe4ac35e67
commit: 47e8d3acb59547baba8a14b65b4c11aef372e263 [19673/23581] bpf: Don't redirect packets with invalid pkt_len
config: x86_64-buildonly-randconfig-004-20240825 (https://download.01.org/0day-ci/archive/20240828/202408282340.JcOrudl8-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408282340.JcOrudl8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408282340.JcOrudl8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/bpf/.tmp_test_run.o: warning: objtool: bpf_prog_test_run_skb()+0x3b2: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

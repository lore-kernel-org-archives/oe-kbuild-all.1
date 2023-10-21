Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44AD10788
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 17:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgpHMUpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697909479; x=1729445479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1eEYvEfXXl5vaA5UN/qnTHlaBPq+eFv6t8c4gyyJXZg=;
  b=KgpHMUpwu2JFWDHgrpOrYu8x6HEXbXdu4oIbzpoWCTHLWNx/kaw56K5K
   KsWrgzNATB23APO0h6GDhRKd6WWfjGWv1zSqKfwjspTU9y+OqIFEHEmbd
   gKUmGyJp7ee3Qw8X3HQ9M8y1fKkuWUHlqg8OR0O4P18FUkihG/xEv5ta8
   1Axw2ybA0QCV/Myfr9hm2j0K6/Gj1+TVrcnD84hpCAR2QgyMpxvZnP1ij
   27fRU6mZWW3uAg2Y9JU2fN53rkQh1V8WBQaAnVlbkqSnhDYz1v8vh5psv
   5eW5Vwi2TnZQtAvZQrvA06j6CJy7nQWgulRI1FVU3Y3xWpXkDOzcDoGsa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383849360"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="383849360"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 10:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="5663652"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Oct 2023 10:31:16 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quFoh-00055X-0w;
	Sat, 21 Oct 2023 17:31:15 +0000
Date: Sun, 22 Oct 2023 01:31:11 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13811/13906] csky-linux-ld:
 drivers/crypto/qcom-rng.c:225:undefined reference to `devm_hwrng_register'
Message-ID: <202310220134.PPX4opJm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2030579113a1b1b5bfd7ff24c0852847836d8fd1
commit: f0e71646e0658342476447b75e2619a75891c954 [13811/13906] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
config: csky-randconfig-r004-20230117 (https://download.01.org/0day-ci/archive/20231022/202310220134.PPX4opJm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220134.PPX4opJm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220134.PPX4opJm-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/crypto/qcom-rng.o: in function `qcom_rng_probe':
   drivers/crypto/qcom-rng.c:213:(.text+0x2f2): undefined reference to `devm_hwrng_register'
>> csky-linux-ld: drivers/crypto/qcom-rng.c:225:(.text+0x3d4): undefined reference to `devm_hwrng_register'
   net/ipv4/tcp_output.o: in function `__tcp_transmit_skb':
   net/ipv4/tcp_output.c:1251:(.text+0x65da): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_output.c:1251:(.text+0x65de): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_output.c:1251:(.text+0x65e2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_output.c:1384:(.text+0x65ee): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_output.c:1278:(.text+0x6600): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_output.c:1279:(.text+0x6612): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_output.o: in function `__refcount_add':
   include/linux/refcount.h:198:(.text+0x661a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   include/linux/refcount.h:199:(.text+0x662a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_output.o: in function `__tcp_transmit_skb':
   net/ipv4/tcp_output.c:1342:(.text+0x663e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_output.c:1342:(.text+0x6642): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_output.c:1342:(.text+0x6646): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

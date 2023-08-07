Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B3C15ACD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 19:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691438235; x=1722974235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=swpT7IxQTQyaIFlil2mPaZPXO/L8bix1K5MCiPCKu6E=;
  b=KFAPf3KQUpXblAn5hWFJ2dvLg16yN7SdbfA4xSF0Oy9b6VPsfD8MBJd1
   YLZgz7kZFHUpfH3IyDHW1XAmvxhmuV8/v2M5Eoj1kXlbI+BPJV/XX1eXG
   dF3s32SP+c9vrg1RHQPy55t5LIQE2xYU68MW7zqbMGioCy5JsI8NBiZbc
   WCE1wda0nSpakDv7YilBCRVAAu8qkbq1ENkxnwFwu+KoVfklyOw2eKPCJ
   Ei4jN2iUEeI5gTopekSY7UxGcYDMHPnJAFb9ZxgJP0WJkZ6wdwlxA1vKc
   hocoWrK8OSRBmkeGqDcZ3fO33A4thiIo+oCiNYVYpFMoXMDhw/KO4ijer
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369537709"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="369537709"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 12:57:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="707990774"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="707990774"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Aug 2023 12:57:11 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qT6Lm-0004qr-30;
	Mon, 07 Aug 2023 19:57:10 +0000
Date: Tue, 8 Aug 2023 03:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Albert Huang <huangjie.albert@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 Optimizing veth xsk performance 8/9] veth: af_xdp tx
 batch support for ipv4 udp
Message-ID: <202308080304.u66eWK14-lkp@intel.com>
References: <20230807122617.85882-1-huangjie.albert@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807122617.85882-1-huangjie.albert@bytedance.com>

Hi Albert,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230807]
[cannot apply to linus/master v6.5-rc5 v6.5-rc4 v6.5-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Albert-Huang/xsk-add-dma_check_skip-for-skipping-dma-check/20230807-211548
base:   next-20230807
patch link:    https://lore.kernel.org/r/20230807122617.85882-1-huangjie.albert%40bytedance.com
patch subject: [RFC v2 Optimizing veth xsk performance 8/9] veth: af_xdp tx batch support for ipv4 udp
config: openrisc-randconfig-r026-20230807 (https://download.01.org/0day-ci/archive/20230808/202308080304.u66eWK14-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308080304.u66eWK14-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308080304.u66eWK14-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/net/veth.o: in function `veth_xsk_tx_xmit':
>> veth.c:(.text+0x4e50): undefined reference to `ip_send_check'
   veth.c:(.text+0x4e50): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ip_send_check'
>> or1k-linux-ld: veth.c:(.text+0x4e70): undefined reference to `udp4_hwcsum'
   veth.c:(.text+0x4e70): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `udp4_hwcsum'
>> or1k-linux-ld: veth.c:(.text+0x4f04): undefined reference to `ip_send_check'
   veth.c:(.text+0x4f04): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ip_send_check'
   or1k-linux-ld: veth.c:(.text+0x4f20): undefined reference to `udp4_hwcsum'
   veth.c:(.text+0x4f20): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `udp4_hwcsum'
   or1k-linux-ld: veth.c:(.text+0x5218): undefined reference to `ip_send_check'
   veth.c:(.text+0x5218): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `ip_send_check'
   or1k-linux-ld: veth.c:(.text+0x5238): undefined reference to `udp4_hwcsum'
   veth.c:(.text+0x5238): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `udp4_hwcsum'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

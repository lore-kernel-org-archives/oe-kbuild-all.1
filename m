Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A80A1AA95
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 20:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691182068; x=1722718068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a1uWk8Y9SCjJDMv4g5KqLTqkFer8k/SXc3ATyoUbOGI=;
  b=apoasLLYhWwhPhKnv+p9FuoeMCyXsDiytnxSd+8WULxEpxz0He25F7h8
   Vrm0bA3QKFVBlX6Ja97x2caI9uNjLBkdof0DyF2vpyAQSPkK0aAKYvBfd
   L1XGB24sr53Xl8VXZO3BFzviUbg3grWpbFysDv7tc8E/ah+QBOxz74jnJ
   365Q3JZwUsted6a7iw36L0HB6k9Wjylmm0zf2d3lfTHb8/689s5OFqOmf
   arYKrQsGcAuytG0cnd6TtaCEDOluKO1ZEvYM1g/gvNxD2QwekIJiFPj4F
   Ydux40slfdMAh4M6Zdi7vR6SeB8AFQHWkyuApAVIbN9wznCBPiCm6Bxx4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="360304933"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="360304933"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 13:47:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="733410022"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="733410022"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Aug 2023 13:47:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS1i5-00035v-33;
	Fri, 04 Aug 2023 20:47:45 +0000
Date: Sat, 5 Aug 2023 04:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/4] clk: rockchip: add support for gate link
Message-ID: <202308050426.tBDiKWUz-lkp@intel.com>
References: <20230802072038.29996-3-zhangqing@rock-chips.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802072038.29996-3-zhangqing@rock-chips.com>

Hi Elaine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on clk/clk-next linus/master v6.5-rc4 next-20230804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elaine-Zhang/clk-gate-export-clk_gate_endisable/20230802-152225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20230802072038.29996-3-zhangqing%40rock-chips.com
patch subject: [PATCH v3 2/4] clk: rockchip: add support for gate link
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230805/202308050426.tBDiKWUz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050426.tBDiKWUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050426.tBDiKWUz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/rockchip/clk-gate-link.c:50:5: warning: no previous prototype for 'clk_gate_link_prepare' [-Wmissing-prototypes]
      50 | int clk_gate_link_prepare(struct clk_hw *hw)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/rockchip/clk-gate-link.c:57:6: warning: no previous prototype for 'clk_gate_link_unprepare' [-Wmissing-prototypes]
      57 | void clk_gate_link_unprepare(struct clk_hw *hw)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/clk_gate_link_prepare +50 drivers/clk/rockchip/clk-gate-link.c

    49	
  > 50	int clk_gate_link_prepare(struct clk_hw *hw)
    51	{
    52		struct clk_gate_link *gate = to_clk_gate_link(to_clk_gate(hw));
    53	
    54		return clk_prepare(gate->link);
    55	}
    56	
  > 57	void clk_gate_link_unprepare(struct clk_hw *hw)
    58	{
    59		struct clk_gate_link *gate = to_clk_gate_link(to_clk_gate(hw));
    60	
    61		clk_unprepare(gate->link);
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

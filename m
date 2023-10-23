Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EF61E536
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 18:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1ExYlTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698087492; x=1729623492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jfRzDBKygKvxCl+MnO+GjTDOLBtOdkySu7nZa6XOIwI=;
  b=R1ExYlTXWggRm0W5OmIQofU7Km9CdpSqQCe61w37PS+F9uRvtU7JwbLz
   Woozl+AUgNYiApMoVjd7PrMi7sHUAFORCTkJ7nw9oVd0nsHmxs8AGNm0J
   datqp7b6kvF8M3q6vyaHIEdE4/HGrenW44kVdA9IwSyawGtJpgPD522Oy
   fAGd/wlVEQRcjhjZ5S1QA82YKSVUa9qYdYMNmLwaT+FItnxEsN4by5Kgx
   ZbnxKpUW3CRT/rTZ9XP09YbGlvP7Cywk+O3DZ0G8wMxg8b2nXA4QuLtnZ
   gHWMPmSg+keGw+SnXRVjdMuu3AU0JgTwOoz4ABPhIqRbt46iDpTJKEvuT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="390791173"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="390791173"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 11:58:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="931781013"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="931781013"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Oct 2023 11:58:07 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv07p-0007AX-0n;
	Mon, 23 Oct 2023 18:58:05 +0000
Date: Tue, 24 Oct 2023 02:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>, mschmidt@redhat.com,
	dacampbe@redhat.com, poros@redhat.com
Subject: Re: [PATCH iwl-next 2/3] i40e: Add other helpers to check version of
 running firmware and AQ API
Message-ID: <202310240231.6eF5YKB4-lkp@intel.com>
References: <20231023162928.245583-3-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023162928.245583-3-ivecera@redhat.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Vecera/i40e-Move-i40e_is_aq_api_ver_ge-helper/20231024-003221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20231023162928.245583-3-ivecera%40redhat.com
patch subject: [PATCH iwl-next 2/3] i40e: Add other helpers to check version of running firmware and AQ API
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231024/202310240231.6eF5YKB4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310240231.6eF5YKB4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240231.6eF5YKB4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/i40e/i40e_dcb.h:7,
                    from drivers/net/ethernet/intel/i40e/i40e.h:15,
                    from drivers/net/ethernet/intel/i40e/i40e_main.c:13:
>> drivers/net/ethernet/intel/i40e/i40e_type.h:632:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     632 | static bool inline i40e_is_fw_ver_ge(struct i40e_hw *hw, u16 maj, u16 min)
         | ^~~~~~
   drivers/net/ethernet/intel/i40e/i40e_type.h:646:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     646 | static bool inline i40e_is_fw_ver_lt(struct i40e_hw *hw, u16 maj, u16 min)
         | ^~~~~~
   drivers/net/ethernet/intel/i40e/i40e_type.h:659:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     659 | static bool inline i40e_is_fw_ver_eq(struct i40e_hw *hw, u16 maj, u16 min)
         | ^~~~~~
--
   In file included from drivers/net/ethernet/intel/i40e/i40e_dcb.h:7,
                    from drivers/net/ethernet/intel/i40e/i40e.h:15,
                    from drivers/net/ethernet/intel/i40e/i40e_ptp.c:6:
>> drivers/net/ethernet/intel/i40e/i40e_type.h:632:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     632 | static bool inline i40e_is_fw_ver_ge(struct i40e_hw *hw, u16 maj, u16 min)
         | ^~~~~~
   drivers/net/ethernet/intel/i40e/i40e_type.h:646:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     646 | static bool inline i40e_is_fw_ver_lt(struct i40e_hw *hw, u16 maj, u16 min)
         | ^~~~~~
   drivers/net/ethernet/intel/i40e/i40e_type.h:659:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     659 | static bool inline i40e_is_fw_ver_eq(struct i40e_hw *hw, u16 maj, u16 min)
         | ^~~~~~
   drivers/net/ethernet/intel/i40e/i40e_ptp.c: In function 'i40e_ptp_init':
   drivers/net/ethernet/intel/i40e/i40e_ptp.c:1353:27: warning: '%s' directive output may be truncated writing up to 287 bytes into a region of size 64 [-Wformat-truncation=]
    1353 |                          "%s", sdp_desc[i].name);
         |                           ^~
   In function 'i40e_init_pin_config',
       inlined from 'i40e_ptp_create_clock' at drivers/net/ethernet/intel/i40e/i40e_ptp.c:1392:13,
       inlined from 'i40e_ptp_init' at drivers/net/ethernet/intel/i40e/i40e_ptp.c:1497:8:
   drivers/net/ethernet/intel/i40e/i40e_ptp.c:1351:17: note: 'snprintf' output between 1 and 288 bytes into a destination of size 64
    1351 |                 snprintf(pf->ptp_caps.pin_config[i].name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1352 |                          sizeof(pf->ptp_caps.pin_config[i].name),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1353 |                          "%s", sdp_desc[i].name);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~


vim +/inline +632 drivers/net/ethernet/intel/i40e/i40e_type.h

   623	
   624	/**
   625	 * i40e_is_fw_ver_ge
   626	 * @hw: pointer to i40e_hw structure
   627	 * @maj: API major value to compare
   628	 * @min: API minor value to compare
   629	 *
   630	 * Assert whether current firmware version is greater/equal than provided.
   631	 **/
 > 632	static bool inline i40e_is_fw_ver_ge(struct i40e_hw *hw, u16 maj, u16 min)
   633	{
   634	        return (hw->aq.fw_maj_ver > maj ||
   635	                (hw->aq.fw_maj_ver == maj && hw->aq.fw_min_ver >= min));
   636	}
   637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

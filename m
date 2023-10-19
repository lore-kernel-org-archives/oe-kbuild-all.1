Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882CA354E5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 17:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZnmVWdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697737364; x=1729273364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GAZ/ntXwX8sch4QzPysb/t4/t9c2pm8umFLxLplMyf0=;
  b=UZnmVWdhKErl3QQKcdYpTY0fXe13zjp9NZwUgMjmo+zB0NV91yaYokn7
   0tQWRkD3is3LuTZ9rZ9qITiHBWvb2Q7N0MrlI6p/KxqLbD1lqxAeCU/GY
   UZmpaLTl8l2Gwaw2c3mtrhg+d9/bBqdUOwKxXOgWF0AdupLUoZXbodT8j
   IIagSJmoR+afyPOg0YMMPeJxAZigqnmarJ8H3nGq52tCFu8Kt4Y67dn6C
   5f2MxWpP8PUTPAOnrVpNQGz/Zxq4xa2pEZDRW/1N/AUXmpz8cPUGB/p3w
   MLd8z2TMeE5GaCQY//T02CzukbiHeWyFrF4vZ75kpbuDtPo1RyvC6BCpX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="371391038"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="371391038"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 10:42:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="4824738"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Oct 2023 10:41:08 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtX2F-0002IQ-04;
	Thu, 19 Oct 2023 17:42:15 +0000
Date: Fri, 20 Oct 2023 01:41:57 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:master 1000/1123]
 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_crypt.c:147:1: warning: the frame size
 of 1536 bytes is larger than 1024 bytes
Message-ID: <202310200100.hbreEaMs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: f5e31866859a5b682c6668e40f17b5f760dca9c1 [1000/1123] drm: xlnx: Add HDCP2X TX support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20231020/202310200100.hbreEaMs-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200100.hbreEaMs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200100.hbreEaMs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_crypt.c: In function 'xlnx_hdcp2x_tx_rsa_encrypt':
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_crypt.c:147:1: warning: the frame size of 1536 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     147 | }
         | ^


vim +147 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_crypt.c

   127	
   128	static int xlnx_hdcp2x_tx_rsa_encrypt(const u8 *rsa_public_key, int public_key_size,
   129					      const u8 *exponent_key, int exponent_key_size,
   130					      const u8 *msg, int msg_size, u8 *encrypted_msg)
   131	{
   132		unsigned int n[BD_MAX_MOD_SIZE], e[BD_MAX_MOD_SIZE],
   133				m[BD_MAX_MOD_SIZE], s[BD_MAX_MOD_SIZE];
   134		unsigned int mod_size = public_key_size / sizeof(unsigned int);
   135	
   136		if (msg_size != public_key_size)
   137			return -EINVAL;
   138	
   139		mp_conv_from_octets(n, mod_size, rsa_public_key, public_key_size);
   140		mp_conv_from_octets(e, mod_size, exponent_key, exponent_key_size);
   141	
   142		mp_conv_from_octets(m, mod_size, msg, msg_size);
   143		mp_mod_exp(s, m, e, n, mod_size);
   144		mp_conv_to_octets(s, mod_size, encrypted_msg, msg_size);
   145	
   146		return 0;
 > 147	}
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

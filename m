Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A12420E0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 04:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695183845; x=1726719845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xUVqJeU+OdzqdYJUGqZnfzHUjctZrNdF1pOPhQE0CpU=;
  b=HLSoM+jFxY2t/5at7COr87YUkbWTJ7Hleh+4R6tIZns77wlKYSB6FWyH
   0t4Vh8eSZu2mAqAqncARjQo6ZK4doktpPXYkuj0iPdUeL/kYtR6xnGPao
   rewQC8hTvC/ravp3GuMkBNXCG3s2jjhyhhayt4Q7wPs+oOQiWZQuWrcWH
   VTggD+Db8OR7VmdZw9VYWYNkV6/rNdoRjXIoKDfecUC6RUZ87sFY01qa4
   VwdB6CAp+97XyHawAzRMHwxnyCUOrpJxx0P+5wVXCU4NM6L6xIqzJCmCx
   +gi3KNpcfvAzvdzskeqasqDRYMuaX9I0o7oFA1ix68NVQfdeb1qoXfjz/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="359507854"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="359507854"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 21:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870212703"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="870212703"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Sep 2023 21:24:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiokp-0008HI-2d;
	Wed, 20 Sep 2023 04:23:59 +0000
Date: Wed, 20 Sep 2023 12:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 947/1363]
 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_crypt.c:147:1: warning: the frame size
 of 1536 bytes is larger than 1024 bytes
Message-ID: <202309201253.z1e9Ncnf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: fc17295f8f45aaabf0830b50523638fd4542c318 [947/1363] drm: xlnx: Add HDCP2X TX support
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309201253.z1e9Ncnf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201253.z1e9Ncnf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201253.z1e9Ncnf-lkp@intel.com/

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

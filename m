Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ABA22EED
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 20:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695672529; x=1727208529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HzIhxBTNSYlbP2I+Cxq/BOvGYCQSrcCmmT5sugzlN7A=;
  b=avTrxjXDc0KIOhf3mY6B7pcW3gKcxLUHcxIbgfcvxQIgARwHv1iADG+4
   zKu+9fCnhkYZFpLkS8Zt23Kh+E8F6N9P8C6TzEe50jhH69t6ahwqCWVyf
   lRN8EpPbI88cddKOca5l8CWuuFLPzLLFH+N7pJNDvJ9biknrHNW5MuO3W
   qNeghAVRzdw3WfIGtOorcA0h04v278frxcEY1Fk8GTe4qbjew9NKVfErT
   OSDKo0ArpCEBXFMLNZ2mHDAQs1vNOGpKWOrPYeogOYRF10R5DUfYhW2m/
   Fcn0Zl/5lSAr12AvekzogPGUlYv2PasMqpTG6ebxvOcEYMmxMXIlPZ3/j
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380239579"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="380239579"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 13:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="814121319"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="814121319"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2023 13:08:47 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkrsr-0001zR-1V;
	Mon, 25 Sep 2023 20:08:45 +0000
Date: Tue, 26 Sep 2023 04:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/186 2/2] drivers/gpu/drm/apple/dcp.c:452:17: warning:
 suggest explicit braces to avoid ambiguous 'else'
Message-ID: <202309260409.ICpXTKXF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/186
head:   c9f888a04befbdc1e8b3b32dbdf41ffeb3f8ecaa
commit: c9f888a04befbdc1e8b3b32dbdf41ffeb3f8ecaa [2/2] drm: apple: Update supported firmware versions to 12.3 and 13.5
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230926/202309260409.ICpXTKXF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260409.ICpXTKXF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260409.ICpXTKXF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/apple/dcp.c: In function 'dcp_crtc_atomic_check':
   drivers/gpu/drm/apple/dcp.c:208:45: warning: variable 'old_state' set but not used [-Wunused-but-set-variable]
     208 |         struct drm_plane_state *new_state, *old_state;
         |                                             ^~~~~~~~~
   drivers/gpu/drm/apple/dcp.c: In function 'dcp_check_firmware_version':
>> drivers/gpu/drm/apple/dcp.c:452:17: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
     452 |         else if (strncmp(compat_str, "13.3.0", sizeof(compat_str)) == 0)
         |                 ^


vim +/else +452 drivers/gpu/drm/apple/dcp.c

   427	
   428	static enum dcp_firmware_version dcp_check_firmware_version(struct device *dev)
   429	{
   430		char compat_str[DCP_FW_VERSION_STR_LEN];
   431		char fw_str[DCP_FW_VERSION_STR_LEN];
   432		int ret;
   433	
   434		/* firmware version is just informative */
   435		dcp_read_fw_version(dev, "apple,firmware-version", fw_str);
   436	
   437		ret = dcp_read_fw_version(dev, "apple,firmware-compat", compat_str);
   438		if (ret < 0) {
   439			dev_err(dev, "Could not read 'apple,firmware-compat': %d\n", ret);
   440			return DCP_FIRMWARE_UNKNOWN;
   441		}
   442	
   443		if (strncmp(compat_str, "12.3.0", sizeof(compat_str)) == 0)
   444			return DCP_FIRMWARE_V_12_3;
   445		/*
   446		 * m1n1 reports firmware version 13.5 as compatible with 13.3. This is
   447		 * only true for the iomfb endpoint. The interface for the dptx-port
   448		 * endpoint changed between 13.3 and 13.5. The driver will only support
   449		 * firmware 13.5. Check the actual firmware version for compat version
   450		 * 13.3 until m1n1 reports 13.5 as "firmware-compat".
   451		 */
 > 452		else if (strncmp(compat_str, "13.3.0", sizeof(compat_str)) == 0)
   453			if (strncmp(fw_str, "13.5.0", sizeof(compat_str)) == 0)
   454				return DCP_FIRMWARE_V_13_5;
   455		else if (strncmp(compat_str, "13.5.0", sizeof(compat_str)) == 0)
   456			return DCP_FIRMWARE_V_13_5;
   457	
   458		dev_err(dev, "DCP firmware-compat %s (FW: %s) is not supported\n",
   459			compat_str, fw_str);
   460	
   461		return DCP_FIRMWARE_UNKNOWN;
   462	}
   463	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3374819BAF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 13:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjdgViTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704287641; x=1735823641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W3ljKEtiiB87AHoTjiThEAfMxi1X+EiqaO4pUF2GXW4=;
  b=TjdgViTCa14u6aqyv0jEUF9LP+s4pjgGNUbYErbB+HC873kkX3UX8fvz
   s4N3ys7VwE+pr+3LJEqXfE1ZoBlJsI8+7bh0Bxzvs5L8NCd74/y37ywlT
   Zptf/9/90sG4Yu3j4TDtxj+k7o+dAtcCwVqVEpHX0M4WVe8suEBI/M3kk
   ViCxfYn5BtdKNvhvlMb2ky9xaGoWervYLoCbXSwUpVq6jJ4xA2ADEeBQO
   rwCBJgln1J6YGewBOe4XaQsvS/JfgKY6p9iMYyLJoFzBrPERPZa5ZSjrm
   KR5JPldJoehjyQVhVtZx6Y1m6dodOE6PtxcXw/0Rn1zP/KLbXiwq4LDTY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="18531638"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="18531638"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 05:14:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="1111357903"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="1111357903"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 03 Jan 2024 05:13:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL14H-000M6j-00;
	Wed, 03 Jan 2024 13:13:57 +0000
Date: Wed, 3 Jan 2024 21:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 7/11]
 drivers/gpu/drm/evdi/evdi_connector.c:54:6: warning: no previous prototype
 for 'is_lowest_frequency_mode_of_given_resolution'
Message-ID: <202401032025.mIl05C7f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   ecb90153e40bc3749afc87d10ad81e15978a574d
commit: 350ced6ff13d0f43fb3ee0de43f7d3eae197bda2 [7/11] CHROMIUM: drm/evdi: Fix 2k monitor is not supported regression
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240103/202401032025.mIl05C7f-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401032025.mIl05C7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401032025.mIl05C7f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: include/uapi/drm: No such file or directory [-Wmissing-include-dirs]
>> drivers/gpu/drm/evdi/evdi_connector.c:54:6: warning: no previous prototype for 'is_lowest_frequency_mode_of_given_resolution' [-Wmissing-prototypes]
      54 | bool is_lowest_frequency_mode_of_given_resolution(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/is_lowest_frequency_mode_of_given_resolution +54 drivers/gpu/drm/evdi/evdi_connector.c

    53	
  > 54	bool is_lowest_frequency_mode_of_given_resolution(
    55		struct drm_connector *connector, struct drm_display_mode *mode)
    56	{
    57		struct drm_display_mode *modeptr;
    58	
    59		list_for_each_entry(modeptr, &(connector->modes), head) {
    60			if (modeptr->hdisplay == mode->hdisplay &&
    61				modeptr->vdisplay == mode->vdisplay &&
    62				drm_mode_vrefresh(modeptr) < drm_mode_vrefresh(mode)) {
    63				return false;
    64			}
    65		}
    66		return true;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF07DDD1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLP08LnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697093953; x=1728629953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JEQtMyPEUMT8YzBgRZ5JST75BtIEg2mXzghTJIME9sA=;
  b=BLP08LnABpHhoiLwC+mMyJQWoQz9bRjBEdYiPOIEn68i7nCNHBFqWkvZ
   p8M70q4Q/CVBIcQpnIOh6mFlvF/jTdPsEAVEzNj+puD/F5QvqdAXFA62R
   kSWqPKbP4bZvfbWKkjvwyWiQyGwL8zyJ72dKb56hQImhiiMWjpHgPYIqt
   1tpjTizE/f1Za+YSwTNl10YMBSKffMWUe6Qzi5LaKQzUwkAHt9dFpq34I
   TVb1sPICuCPmT4MF+2zxlY3K8a78HcI+8pAjApYpxstjwHe38DbTQ77rS
   jTnOvEGVZ/JvtNs+9krhw/lroJFVJJevP5vNv/9gcM+2nT4Yiwn5IWdZ0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471104294"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="471104294"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 23:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897969016"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="897969016"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2023 23:57:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqpev-0003Ht-2n;
	Thu, 12 Oct 2023 06:59:02 +0000
Date: Thu, 12 Oct 2023 14:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	hns@goldelico.com, krzysztof.kozlowski+dt@linaro.org,
	matthew.brost@intel.com, corbet@lwn.net, luben.tuikov@amd.com,
	dakr@redhat.com, donald.robson@imgtec.com,
	devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
	Matt Coster <matt.coster@imgtec.com>, robh+dt@kernel.org,
	faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org,
	afd@ti.com, boris.brezillon@collabora.com, tzimmermann@suse.de,
	christian.koenig@amd.com
Subject: Re: [PATCH v7 10/20] drm/imagination: Add GPU ID parsing and
 firmware loading
Message-ID: <202310121406.jT1fEThj-lkp@intel.com>
References: <20231010133738.35274-11-sarah.walker@imgtec.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010133738.35274-11-sarah.walker@imgtec.com>

Hi Sarah,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-intel/for-linux-next drm-tip/drm-tip next-20231011]
[cannot apply to drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes linus/master v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarah-Walker/sizes-h-Add-entries-between-SZ_32G-and-SZ_64T/20231010-221057
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231010133738.35274-11-sarah.walker%40imgtec.com
patch subject: [PATCH v7 10/20] drm/imagination: Add GPU ID parsing and firmware loading
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231012/202310121406.jT1fEThj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310121406.jT1fEThj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121406.jT1fEThj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imagination/pvr_device_info.c:106: warning: Function parameter or member 'enhancements' not described in 'pvr_device_info_set_enhancements'
>> drivers/gpu/drm/imagination/pvr_device_info.c:106: warning: Function parameter or member 'enhancements_size' not described in 'pvr_device_info_set_enhancements'
>> drivers/gpu/drm/imagination/pvr_device_info.c:106: warning: Excess function parameter 'quirks' description in 'pvr_device_info_set_enhancements'
>> drivers/gpu/drm/imagination/pvr_device_info.c:106: warning: Excess function parameter 'quirks_size' description in 'pvr_device_info_set_enhancements'


vim +106 drivers/gpu/drm/imagination/pvr_device_info.c

    97	
    98	/**
    99	 * pvr_device_info_set_enhancements() - Set device enhancements from device information in firmware
   100	 * @pvr_dev: Device pointer.
   101	 * @quirks: Pointer to enhancements mask in device information.
   102	 * @quirks_size: Size of enhancements mask, in u64s.
   103	 */
   104	void pvr_device_info_set_enhancements(struct pvr_device *pvr_dev, const u64 *enhancements,
   105					      u32 enhancements_size)
 > 106	{
   107		BUILD_BUG_ON(ARRAY_SIZE(enhancements_mapping) != PVR_FW_HAS_ERN_MAX);
   108	
   109		pvr_device_info_set_common(pvr_dev, enhancements, enhancements_size,
   110					   enhancements_mapping, ARRAY_SIZE(enhancements_mapping));
   111	}
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

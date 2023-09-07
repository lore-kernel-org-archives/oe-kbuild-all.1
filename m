Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED36F568E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 11:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694087404; x=1725623404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NdN0QnTFqQ9uYJNKrkIE/wSntQdOUZt3P4X9JlFV0gk=;
  b=EYikkr99a/XmzcVRnAPvaEEl6P+gINa5LtAUYPYdcvahYCal4YQI+A3E
   bOIcaOH6qh6e1K5rtSp/we3Rysc9K9K4H7RfFB1MqTmQFXZY9A8CU0rbo
   BQk9c1NaYpYHiHF5lRQC3L6pleV+otU23xX+XCbOTjyUyrsgxLC/qa/Ix
   mdlMG+o0IUWzZ7x73+MsXWAG5/SEc0HUv4+mdbqPWmnyVLSiqxOHZyDCy
   RGzKIroaUG/EWWb2QMXZgdrme9lxgn/VusYd8ta3p4MRvqEuIdGr0Zk8Z
   t5Rxq7Gf9x6pE1spI/BD8JzdejebCrbccGMyIseJ/x0IF9fvZWtBZghQf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443715176"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="443715176"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 04:50:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="771243817"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="771243817"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2023 04:50:02 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeDWK-0001Bb-0b;
	Thu, 07 Sep 2023 11:50:00 +0000
Date: Thu, 7 Sep 2023 19:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com,
	intel-gfx@lists.freedesktop.org,
	Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: Re: [PATCH 5/6] drm/edid: add helpers to get/set struct cea_sad
 from/to 3-byte sad
Message-ID: <202309071934.AzntzCVc-lkp@intel.com>
References: <eba53a0904126fb904a5190750002695350f44eb.1694078430.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eba53a0904126fb904a5190750002695350f44eb.1694078430.git.jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-edid-split-out-drm_eld-h-from-drm_edid-h/20230907-173011
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/eba53a0904126fb904a5190750002695350f44eb.1694078430.git.jani.nikula%40intel.com
patch subject: [PATCH 5/6] drm/edid: add helpers to get/set struct cea_sad from/to 3-byte sad
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230907/202309071934.AzntzCVc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309071934.AzntzCVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309071934.AzntzCVc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_edid.c:5505:6: warning: no previous prototype for 'drm_edid_cta_sad_get' [-Wmissing-prototypes]
    5505 | void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_edid.c:5515:6: warning: no previous prototype for 'drm_edid_cta_sad_set' [-Wmissing-prototypes]
    5515 | void drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/drm_edid_cta_sad_get +5505 drivers/gpu/drm/drm_edid.c

  5501	
  5502	/*
  5503	 * Get 3-byte SAD buf from struct cea_sad.
  5504	 */
> 5505	void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad)
  5506	{
  5507		sad[0] = cta_sad->format << 3 | cta_sad->channels;
  5508		sad[1] = cta_sad->freq;
  5509		sad[2] = cta_sad->byte2;
  5510	}
  5511	
  5512	/*
  5513	 * Set struct cea_sad from 3-byte SAD buf.
  5514	 */
> 5515	void drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad)
  5516	{
  5517		cta_sad->format = (sad[0] & 0x78) >> 3;
  5518		cta_sad->channels = sad[0] & 0x07;
  5519		cta_sad->freq = sad[1] & 0x7f;
  5520		cta_sad->byte2 = sad[2];
  5521	}
  5522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

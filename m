Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081A5623
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 02:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677551778; x=1709087778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sr+SAEJdFL6BDFeEPyHtx8CDcCGgGwaSz+A/++KUZNE=;
  b=HS8oGP2MDx7Uzp4aKizr+2/i/6jPEXPOJi6e3BTXIQiac+auUEeOrmT6
   D7rPgfI+75Mu1IGIbgNqfJnDXi7LQoKunK1QptYH6sm22OWpF2GRhC6Yg
   eQucbk8fFaHTjqhWYSrh/O3CyDRIIvrZf3bLrhhDD5VZPWDxayU6g6Y12
   fO6oIGW/r0STjx9gwByUOzF11nIegYBgsSl/2YsUEdNw6l8SmiBAEMvpW
   lBSGBWZxsDz6biMx1dahRCEmg2uD1lVBelWAkwsZRrWuqFqkDhYbyzAx1
   rPTtBG7kouoAOLHNRMOStC6j8RUwYvrDP3l7dLUn+XOR90eawVBUIy1LK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313703424"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="313703424"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 18:36:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="676131682"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="676131682"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Feb 2023 18:36:13 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWpqe-00050n-2y;
	Tue, 28 Feb 2023 02:36:12 +0000
Date: Tue, 28 Feb 2023 10:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jude Shih <shenshih@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 4439/9999] htmldocs:
 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:633: warning: expecting
 prototype for dmub_aux_setconfig_reply_callback(). Prototype was for
 dmub_aux_setconfig_callback() instead
Message-ID: <202302281017.9qcgLAZi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jude,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   d383d0f28ecac0f3375bdfb9a0c4bfac979f6f8f
commit: 734d5ce02cb069cccedc993d8f1dc0ea41cfa3dd [4439/9999] drm/amd/display: Support for DMUB HPD interrupt handling
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=734d5ce02cb069cccedc993d8f1dc0ea41cfa3dd
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 734d5ce02cb069cccedc993d8f1dc0ea41cfa3dd
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302281017.9qcgLAZi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:633: warning: expecting prototype for dmub_aux_setconfig_reply_callback(). Prototype was for dmub_aux_setconfig_callback() instead

vim +633 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

   622	
   623	/**
   624	 * dmub_aux_setconfig_reply_callback - Callback for AUX or SET_CONFIG command.
   625	 * @adev: amdgpu_device pointer
   626	 * @notify: dmub notification structure
   627	 *
   628	 * Dmub AUX or SET_CONFIG command completion processing callback
   629	 * Copies dmub notification to DM which is to be read by AUX command.
   630	 * issuing thread and also signals the event to wake up the thread.
   631	 */
   632	void dmub_aux_setconfig_callback(struct amdgpu_device *adev, struct dmub_notification *notify)
 > 633	{
   634		if (adev->dm.dmub_notify)
   635			memcpy(adev->dm.dmub_notify, notify, sizeof(struct dmub_notification));
   636		if (notify->type == DMUB_NOTIFICATION_AUX_REPLY)
   637			complete(&adev->dm.dmub_aux_transfer_done);
   638	}
   639	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

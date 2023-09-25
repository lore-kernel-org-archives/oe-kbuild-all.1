Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B4C10E2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 02:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695608120; x=1727144120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7aZdRRkcWeWfFBEMkV187rRMQuRi3J4u3B++Qpol+2Q=;
  b=mz9Ak2JWVI+PAlNCvsAlnsSwDNhPPUsgPR0TRgqg30acTjKf8sQ+GXv+
   T9Ib8ltTgTGkbZxMnqbiuajAyKB4C+EGObonsMRPhVo2U9Xe83Vdc+pnT
   vO7qXulqBZZSD+DVCZo3mo8JhDvkgC+eQ6m/Jq9hFu931HZbY718c9F4A
   YprHkrLNFWwys/9JrF39ho7f3kC/LkO2VkFXrAPE2fg/VsrnEC4/ekx60
   NELzYiBvoedjP7DIwjfHsDZWUK1nxm+iP4pB+8W7mtSlDy5zeI/Lb/22+
   eFRLcv/KhSIMOSnvJ5K1IPblHwye5cNgw8RTi3Ka0X7BqPqePvxPAxFIp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366206040"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="366206040"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 19:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="697828919"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="697828919"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 24 Sep 2023 19:15:15 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkb7w-0000m1-2c;
	Mon, 25 Sep 2023 02:15:12 +0000
Date: Mon, 25 Sep 2023 10:14:20 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
	markgross@kernel.org, basavaraj.natikar@amd.com, jikos@kernel.org,
	benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
	christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
	daniel@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Patil.Reddy@amd.com,
	linux-input@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH 10/15] platform/x86/amd/pmf: Add capability to sideload
 of policy binary
Message-ID: <202309251031.awDDkRgS-lkp@intel.com>
References: <20230922175056.244940-11-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922175056.244940-11-Shyam-sundar.S-k@amd.com>

Hi Shyam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.6-rc3 next-20230921]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/platform-x86-amd-pmf-Add-PMF-TEE-interface/20230923-015418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20230922175056.244940-11-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH 10/15] platform/x86/amd/pmf: Add capability to sideload of policy binary
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230925/202309251031.awDDkRgS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309251031.awDDkRgS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309251031.awDDkRgS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/amd/pmf/tee-if.c:305:5: warning: no previous prototype for 'amd_pmf_open_pb' [-Wmissing-prototypes]
     305 | int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
         |     ^~~~~~~~~~~~~~~


vim +/amd_pmf_open_pb +305 drivers/platform/x86/amd/pmf/tee-if.c

   304	
 > 305	int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
   306	{
   307		struct dentry *file = NULL;
   308	
   309		dev->esbin = debugfs_create_dir("pb", debugfs_root);
   310		if (IS_ERR(dev->esbin))
   311			return -EINVAL;
   312	
   313		file = debugfs_create_file("update_policy", 0644, dev->esbin, dev, &pb_fops);
   314		if (!file)
   315			return -EINVAL;
   316	
   317		return 0;
   318	}
   319	#endif
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

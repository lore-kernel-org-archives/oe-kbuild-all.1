Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D683A179
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680308407; x=1711844407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i+fMdauhfahN1aZCfVPkPAeQqjT40gdgL5LTsfvPY/s=;
  b=VA1klyks5vqdtxtOi9Q1JJa4sZtZfH++z4BVaOeG7hC+cz1cLd3HEVIO
   hvzpp+XVDm3G0ZxTgihzdpY6YgwI6/ugxZzvGrFn6XUsqAfLDg1ruxZBb
   F/7evqGRksmjxRI60kCFvsP6LUzVGHqVhiJv/Via7eBkIg8sN4/Z7RceV
   2TjS85LmXa6FQNg9McvYKZUt8+OVEX1OWny8JBmpGxYn1nb6TSmxU1sA1
   uimCxVcBLn7lSqgYokC9DfRYo0NzRM5rrOXQyH4JD9KSKlwpEjZIuYDWU
   RZI04T/tZqUWCsoeHUe6G4o6q9FX3GNynG55YDdz0KkqW0YfS2vZGCupT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="344128908"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="344128908"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 17:20:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="662581327"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="662581327"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 Mar 2023 17:20:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piOyQ-000MIf-2t;
	Sat, 01 Apr 2023 00:20:02 +0000
Date: Sat, 1 Apr 2023 08:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, seanpaul@chromium.org,
	suraj.kandpal@intel.com, dianders@chromium.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>,
	Mark Yacoub <markyacoub@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 04/10] drm/hdcp: Expand HDCP helper library for
 enable/disable/check
Message-ID: <202304010815.5iVFI5nv-lkp@intel.com>
References: <20230331221213.1691997-5-markyacoub@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331221213.1691997-5-markyacoub@google.com>

Hi Mark,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next-fixes]
[also build test WARNING on drm/drm-next linus/master v6.3-rc4 next-20230331]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230401-061425
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20230331221213.1691997-5-markyacoub%40google.com
patch subject: [PATCH v8 04/10] drm/hdcp: Expand HDCP helper library for enable/disable/check
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230401/202304010815.5iVFI5nv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/82a092e7e090cdeb3ff18498e6ad671906268631
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230401-061425
        git checkout 82a092e7e090cdeb3ff18498e6ad671906268631
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/display/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304010815.5iVFI5nv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_hdcp_helper.c:719: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Check if the sink is capable of HDCP 1.x. DisplayPort has a dedicated bit
   drivers/gpu/drm/display/drm_hdcp_helper.c:742: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Check if the sink is capable of HDCP 1.x. HDMI spec states that transmitters
   drivers/gpu/drm/display/drm_hdcp_helper.c:1633: warning: Function parameter or member 'aux' not described in 'drm_hdcp_helper_initialize_dp'


vim +719 drivers/gpu/drm/display/drm_hdcp_helper.c

   717	
   718	/**
 > 719	 * Check if the sink is capable of HDCP 1.x. DisplayPort has a dedicated bit
   720	 * for this in DPCD.
   721	 *
   722	 * @data: pointer to the HDCP helper data.
   723	 * @capable: pointer to a bool which will contain true if the sink is capable.
   724	 *
   725	 * Returns:
   726	 * -errno if the transacation between source and sink fails.
   727	 */
   728	int drm_hdcp_helper_hdcp1_capable_dp(struct drm_hdcp_helper_data *data,
   729					     bool *capable)
   730	{
   731		int ret;
   732		u8 bcaps;
   733	
   734		ret = data->funcs->remote_read(data, data->hdcp1_lut->bcaps, &bcaps, 1);
   735		*capable = !ret && (bcaps & DP_BCAPS_HDCP_CAPABLE);
   736	
   737		return 0;
   738	}
   739	EXPORT_SYMBOL(drm_hdcp_helper_hdcp1_capable_dp);
   740	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

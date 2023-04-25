Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4037B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 04:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682395697; x=1713931697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KQLaDiXU7PdOXO16N+PpE1eYrNmJ47x5ayrs63G2tRE=;
  b=maEnraA4Hc+fCTerGWpD8C7f/z3Fskwupj3deTOQkh18W7YjsC3NalB8
   U2s7qf4cF0uUtd7ZpK6ZyrHXVLn8oIhlf9+s7wBj2lFSkAA3IlPBv2kbI
   /yFJVJ2RywNqNrIpnFKQ2QAu7tFJS9m2uuqRE/VyLP0jLxoI2Kj2NqfrZ
   X3Db5s3lfsC3GlXezVTFwaio9OMs6+CksDcU/gxwUOpyqEQDe3E9+0Y8q
   UU9d3TJbKTAq0t+RnGmjdfwN0E0NEepN3+TA9F6dXfjwQ7LUFrpjDh34l
   Jm7vn812xKlF5fJ1EX0Ar+FSI25+ILQC3CEayFK/DstyGeQXNRh8eTs0y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="432905184"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="432905184"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 21:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="939599906"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="939599906"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Apr 2023 21:08:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr9yQ-000iwu-30;
	Tue, 25 Apr 2023 04:08:14 +0000
Date: Tue, 25 Apr 2023 12:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: Hersen Wu <hersenxs.wu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Chao-kai Wang <Stylon.Wang@amd.com>
Subject: [agd5f:drm-next 113/143]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6379:21:
 warning: variable 'count' set but not used
Message-ID: <202304251205.J3zhnojK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   6d3435e2e3031a3541f5e23bba4d54eff78eb9fa
commit: 550e5d23f14784e2a625c25fe0c9d498589c9256 [113/143] drm/amd/display: assign edid_blob_ptr with edid from debugfs
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230425/202304251205.J3zhnojK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 550e5d23f14784e2a625c25fe0c9d498589c9256
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251205.J3zhnojK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'create_eml_sink':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6379:21: warning: variable 'count' set but not used [-Wunused-but-set-variable]
    6379 |                 int count;
         |                     ^~~~~


vim +/count +6379 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

  6366	
  6367	static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
  6368	{
  6369		struct dc_sink_init_data init_params = {
  6370				.link = aconnector->dc_link,
  6371				.sink_signal = SIGNAL_TYPE_VIRTUAL
  6372		};
  6373		struct edid *edid;
  6374	
  6375		if (!aconnector->base.edid_blob_ptr) {
  6376			/* if connector->edid_override valid, pass
  6377			 * it to edid_override to edid_blob_ptr
  6378			 */
> 6379			int count;
  6380	
  6381			count = drm_edid_override_connector_update(&aconnector->base);
  6382	
  6383			if (!aconnector->base.edid_blob_ptr) {
  6384				DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",
  6385						aconnector->base.name);
  6386	
  6387				aconnector->base.force = DRM_FORCE_OFF;
  6388				return;
  6389			}
  6390		}
  6391	
  6392		edid = (struct edid *) aconnector->base.edid_blob_ptr->data;
  6393	
  6394		aconnector->edid = edid;
  6395	
  6396		aconnector->dc_em_sink = dc_link_add_remote_sink(
  6397			aconnector->dc_link,
  6398			(uint8_t *)edid,
  6399			(edid->extensions + 1) * EDID_LENGTH,
  6400			&init_params);
  6401	
  6402		if (aconnector->base.force == DRM_FORCE_ON) {
  6403			aconnector->dc_sink = aconnector->dc_link->local_sink ?
  6404			aconnector->dc_link->local_sink :
  6405			aconnector->dc_em_sink;
  6406			dc_sink_retain(aconnector->dc_sink);
  6407		}
  6408	}
  6409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

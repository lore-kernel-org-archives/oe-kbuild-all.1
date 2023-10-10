Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E60632186
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 19:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="hkY/tE7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z8h/YA2EMhyeAz65IrW2oPc7YgAABCXyyPKgxPEBWJU=;
  b=hkY/tE7QaFRIhDsJxEp72ay7slLKNDwklo7WKlQkxKm7W2fLlshVkBEx
   PopnZzNLGlGtFl8yUROWR+RnzO3+Xr5c8e7DgewKPFwar3s7XzbVM7Wa8
   YGg2yJ9CUQ2SDEXZWpCvF4FMujuDfCBsKiWS4PWCkomaSJmVq3anIpGqs
   E=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,213,1694728800"; 
   d="scan'208";a="68323581"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 21:24:40 +0200
Date: Tue, 10 Oct 2023 21:24:38 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, 
    Alex Deucher <alexander.deucher@amd.com>, 
    Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
cc: Linux Memory Management List <linux-mm@kvack.org>, 
    oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6935/11192] drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:538:25-29:
 ERROR: aconnector is NULL but dereferenced. (fwd)
Message-ID: <alpine.DEB.2.22.394.2310102123460.3328@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

See line 538.

julia

---------- Forwarded message ----------
Date: Wed, 11 Oct 2023 01:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 6935/11192]
    drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:538:25-29: ERROR:
    aconnector is NULL but dereferenced.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Hamza Mahfooz <hamza.mahfooz@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0a6edb636cba9c0d1db966a54d910a02e52e4be
commit: 5d72e247e58c966f4e50cffebf0d414de7fc90ed [6935/11192] drm/amd/display: switch DC over to the new DRM logging macros
:::::: branch date: 12 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-104-20231010 (https://download.01.org/0day-ci/archive/20231011/202310110104.H593hwLd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310110104.H593hwLd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310110104.H593hwLd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:538:25-29: ERROR: aconnector is NULL but dereferenced.

vim +538 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c

4562236b3bc0a28 Harry Wentland 2017-09-12  534
c84dec2fe8837fa Harry Wentland 2017-09-05  535  	struct amdgpu_dm_connector *aconnector = link->priv;
4562236b3bc0a28 Harry Wentland 2017-09-12  536
4562236b3bc0a28 Harry Wentland 2017-09-12  537  	if (!aconnector) {
5d72e247e58c966 Hamza Mahfooz  2023-09-20 @538  		drm_dbg_dp(aconnector->base.dev,
5d72e247e58c966 Hamza Mahfooz  2023-09-20  539  			   "Failed to find connector for link!\n");
4562236b3bc0a28 Harry Wentland 2017-09-12  540  		return false;
4562236b3bc0a28 Harry Wentland 2017-09-12  541  	}
4562236b3bc0a28 Harry Wentland 2017-09-12  542
4648cf5fc8c78d7 Hamza Mahfooz  2023-03-08  543  	return drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address, data,
4648cf5fc8c78d7 Hamza Mahfooz  2023-03-08  544  				size) == size;
4562236b3bc0a28 Harry Wentland 2017-09-12  545  }
4562236b3bc0a28 Harry Wentland 2017-09-12  546

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

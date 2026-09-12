Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CF215A85A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 03:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789184951; cv=none; b=M5c7V6V5aLyGdHwz51L/7Zw/thdYmyRbooyCBXv5o998ve55YZYxFfJXxoylY0Q2Tx/ae/ZRnjMg+3uMLh/t8IkKhp9MCjHlzAyc61qRDxtGdOi4b11q3isFUoIReLtZcXQK/vaXvnn0+oItyvZPoHAm66ZPd9JGJ5cITPUXxLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789184951; c=relaxed/simple;
	bh=qXzpUlL7OFtqY4tfMmTOuYJ87crFhopT0gG4MgNt6IE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KZUogcRu6M1q+Os4MYUkljjv98sBRvRldB7H2Pqq5dj6Tjr6ncDDIqZnCwBAIIhtjsx6cAUBs381xvPxJb5YUcqsm39NbHuDnAEijscCjabpVfRagL8dIMe6L+CeXh++oBvVJuUO1anerSXSxWtEY91PbSZI4B7Cbw6c/jOvT9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwYXJ5st; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwYXJ5st"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789184949; x=1820720949;
  h=date:from:to:cc:subject:message-id;
  bh=qXzpUlL7OFtqY4tfMmTOuYJ87crFhopT0gG4MgNt6IE=;
  b=VwYXJ5stu66YNamnv5VEKEcI1kbAIxdzVhRr4pHIpaYcIodTrQhJmrkg
   GHex9a3vJdvBERuE5lOHteIc+YW/VuTN+TC8sJvfY9Z464N9OikjRmyB5
   nIuYH4MGlyrkwvZW4MaeJ4LnJaQK5O0Cy14VPeFa9LpJ75XYr4vIIyW1r
   C7TLeRhK8mr5LTF5L+H4QO0vH8GABle3ANP+B2JCKkfxZu52rFt290gif
   K8sGJvaFvNWApSyt1sObj46mEHSzZNayOlkrX2npY96M0lmY+ig4aiNcH
   2kUv6oKfV8QtEWTPrjGn5cFl0fDsQOgp+o0xveD3rQihkMQ3TMxRegTKX
   Q==;
X-CSE-ConnectionGUID: fjvowXTzQ0CGkg8e0owotg==
X-CSE-MsgGUID: 3gIm7TGjQd6C4D9RttyPrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89655991"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89655991"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 20:49:09 -0700
X-CSE-ConnectionGUID: JXgmEIhkTbWQjaxmMu92vQ==
X-CSE-MsgGUID: Fw0fEDqVRGS/L5QMKH4/ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="295590059"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Sep 2026 20:49:07 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5Ejh-000000002ap-0VTB;
	Sat, 12 Sep 2026 03:49:05 +0000
Date: Sat, 12 Sep 2026 11:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [clangbuiltlinux:question_mark_operator 5/5]
 drivers/gpu/drm/drm_atomic.c:1305:1: warning: control reaches end of non-void
 function
Message-ID: <202609121119.nj8F5jyV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/ClangBuiltLinux/linux question_mark_operator
head:   532a7ac2d57bb5674f5feffb4ba378f8a32f3bcf
commit: 532a7ac2d57bb5674f5feffb4ba378f8a32f3bcf [5/5] drm: atomic: use try operator ('?') and member access chaining
config: i386-randconfig-r132-20260912 (https://download.01.org/0day-ci/archive/20260912/202609121119.nj8F5jyV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121119.nj8F5jyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121119.nj8F5jyV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_atomic.c: In function 'drm_atomic_get_old_crtc_for_encoder':
   drivers/gpu/drm/drm_atomic.c:1302:78: error: expected expression before ';' token
    1302 |         connector = drm_atomic_get_old_connector_for_encoder(state, encoder)?;
         |                                                                              ^
   drivers/gpu/drm/drm_atomic.c:1304:69: error: expected expression before '->' token
    1304 |         return drm_atomic_get_old_connector_state(state, connector)?->crtc;
         |                                                                     ^~
   drivers/gpu/drm/drm_atomic.c: In function 'drm_atomic_get_new_crtc_for_encoder':
   drivers/gpu/drm/drm_atomic.c:1325:78: error: expected expression before ';' token
    1325 |         connector = drm_atomic_get_new_connector_for_encoder(state, encoder)?;
         |                                                                              ^
   drivers/gpu/drm/drm_atomic.c:1327:69: error: expected expression before '->' token
    1327 |         return drm_atomic_get_new_connector_state(state, connector)?->crtc;
         |                                                                     ^~
   drivers/gpu/drm/drm_atomic.c: In function 'drm_atomic_get_old_crtc_for_encoder':
>> drivers/gpu/drm/drm_atomic.c:1305:1: warning: control reaches end of non-void function [-Wreturn-type]
    1305 | }
         | ^
   drivers/gpu/drm/drm_atomic.c: In function 'drm_atomic_get_new_crtc_for_encoder':
   drivers/gpu/drm/drm_atomic.c:1328:1: warning: control reaches end of non-void function [-Wreturn-type]
    1328 | }
         | ^


vim +1305 drivers/gpu/drm/drm_atomic.c

a7e4886e06f723 Maxime Ripard    2025-03-13  1283  
a7e4886e06f723 Maxime Ripard    2025-03-13  1284  
7b9a9e35e45def Vinod Polimera   2023-03-02  1285  /**
7b9a9e35e45def Vinod Polimera   2023-03-02  1286   * drm_atomic_get_old_crtc_for_encoder - Get old crtc for an encoder
7b9a9e35e45def Vinod Polimera   2023-03-02  1287   * @state: Atomic state
7b9a9e35e45def Vinod Polimera   2023-03-02  1288   * @encoder: The encoder to fetch the crtc state for
7b9a9e35e45def Vinod Polimera   2023-03-02  1289   *
7b9a9e35e45def Vinod Polimera   2023-03-02  1290   * This function finds and returns the crtc that was connected to @encoder
7b9a9e35e45def Vinod Polimera   2023-03-02  1291   * as specified by the @state.
7b9a9e35e45def Vinod Polimera   2023-03-02  1292   *
7b9a9e35e45def Vinod Polimera   2023-03-02  1293   * Returns: The old crtc connected to @encoder, or NULL if the encoder is
7b9a9e35e45def Vinod Polimera   2023-03-02  1294   * not connected.
7b9a9e35e45def Vinod Polimera   2023-03-02  1295   */
7b9a9e35e45def Vinod Polimera   2023-03-02  1296  struct drm_crtc *
5164f7e7ff8ec7 Maxime Ripard    2026-04-27  1297  drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_commit *state,
7b9a9e35e45def Vinod Polimera   2023-03-02  1298  				    struct drm_encoder *encoder)
7b9a9e35e45def Vinod Polimera   2023-03-02  1299  {
7b9a9e35e45def Vinod Polimera   2023-03-02  1300  	struct drm_connector *connector;
7b9a9e35e45def Vinod Polimera   2023-03-02  1301  
532a7ac2d57bb5 Nick Desaulniers 2026-09-10  1302  	connector = drm_atomic_get_old_connector_for_encoder(state, encoder)?;
7b9a9e35e45def Vinod Polimera   2023-03-02  1303  
532a7ac2d57bb5 Nick Desaulniers 2026-09-10  1304  	return drm_atomic_get_old_connector_state(state, connector)?->crtc;
7b9a9e35e45def Vinod Polimera   2023-03-02 @1305  }
7b9a9e35e45def Vinod Polimera   2023-03-02  1306  EXPORT_SYMBOL(drm_atomic_get_old_crtc_for_encoder);
7b9a9e35e45def Vinod Polimera   2023-03-02  1307  

:::::: The code at line 1305 was first introduced by commit
:::::: 7b9a9e35e45def496b0a5b3f206bb4efa712ea4a drm: add helper functions to retrieve old and new crtc

:::::: TO: Vinod Polimera <quic_vpolimer@quicinc.com>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30BE747B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZHlWI4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699091166; x=1730627166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YNtvn1DmTisFhFGj0OO/Toy64uKtTivrQ9GZ+Hxvuww=;
  b=jZHlWI4KVAhl4tQPNF/+PiUPXg/AdQiMSKfMnDjPy400ISHm1UqU5T0m
   xaH5b92CqLMtxnWbrYso2UOXjiSnWFUwbLXPBoPE7a8c9mSbEhfH6RUk+
   vxtqnGGfGjQ0pGfiMPgpl3WQYcRlGe4evYsQbrYhcwM7k/doBSW3XcIqV
   tjP0upkcE9UQakZLB1vtT4wACj0kuBZy7SXTEmG0Hir2RQY/r7eZYdYqs
   oWx4d0AqKrIyAgzInvaHtBI/2VZoaytUv3idrtvyJwWCRCs0OQcNCDLwI
   vRM1yVOvcIjcDv4FQB6JJZJ5ceOURRRff1d9HYR/TVrk+cQyE+9MiofhO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="392965032"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="392965032"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 02:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="791005607"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="791005607"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Nov 2023 02:46:05 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzDEB-0003kG-01;
	Sat, 04 Nov 2023 09:46:03 +0000
Date: Sat, 4 Nov 2023 17:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:hdmi-dbg 32/33] loongarch64-linux-ld:
 drm_atomic_state_helper.c:undefined reference to
 `drm_hdmi_avi_infoframe_content_type'
Message-ID: <202311041700.YYVGpMSf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   8e65f28447c830fe113ba037c2ba210d781d4420
commit: 2dcf59aabfaca94ec1cb4c42cd534440edbebb9c [32/33] vc4: add content type support
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20231104/202311041700.YYVGpMSf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041700.YYVGpMSf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041700.YYVGpMSf-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `.L445':
   drm_atomic_state_helper.c:(.text+0x1834): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
   loongarch64-linux-ld: drm_atomic_state_helper.c:(.text+0x1840): undefined reference to `drm_hdmi_avi_infoframe_bars'
>> loongarch64-linux-ld: drm_atomic_state_helper.c:(.text+0x184c): undefined reference to `drm_hdmi_avi_infoframe_content_type'
   loongarch64-linux-ld: drm_atomic_state_helper.c:(.text+0x1894): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

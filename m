Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680F2361
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 00:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678150726; x=1709686726;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JWXs6hZLzHGbEnkTfKffCj7uOW6n/HYikaESKRN65xI=;
  b=jeaHzBOKJaCs64f0VEulM8Ut5lQS4IomLuo/LYazVlWACXX3z/gnRqwo
   +cRu59OLjBC5Ag6igzID+8uCEON81IRR+QslH+X8sa5cuzJ4MolMc0R9N
   2/reEc2JfhZrTkY0vqaEuYrd34oq0Kyh2V1HuyeP1khgV9khsnpAEasAr
   QMHi1NZa6Qzu4W0tiTT07rwWOoEF6/dr8G18y6CJvnp7JqmwecI8fN239
   xIgzkMcVW/mXR0Fu650RBbIm0QxnunLFNNg4oLTrXRGlDBhK6xh5OVkhn
   IczTWXITeROMDdaVJVM7ogGwqoNSYdb4A26VFiVSC0qZGv0QRB2TsrRYy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337244795"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="337244795"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 16:58:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676378234"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="676378234"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Mar 2023 16:58:44 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZLfA-0000ou-10;
	Tue, 07 Mar 2023 00:58:44 +0000
Date: Tue, 7 Mar 2023 08:57:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:5.10/yocto 11602/30000] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
Message-ID: <202303070838.5aDdXwOv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jagan,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   abd42491338c1d15ac7f00baaa8490063545737e
commit: 8ed099ef505c7b81ef9821dd18e03a1406ccfb46 [11602/30000] drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB bridge
reproduce:
        # https://github.com/intel/linux-intel-lts/commit/8ed099ef505c7b81ef9821dd18e03a1406ccfb46
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 8ed099ef505c7b81ef9821dd18e03a1406ccfb46
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070838.5aDdXwOv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

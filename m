Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6328863E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 05:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678168676; x=1709704676;
  h=date:from:cc:subject:message-id:mime-version;
  bh=9IrqcEBNMqnQyqC2g4DDHDDeEHsVPvncxERM861UOBw=;
  b=MwZpWW4+C8yzUyW/nmlP8346OMokENjp4NtM3u3zLxK96B40CXCOgo9z
   MDiYhBWb+heALjp0TN7g30DN7R7sabAyN+zsXbd4TqBxr0WaPAjd0oKhz
   QtD02uGrVtyE6wFC4twOkGcle2Ut4i3B3pYbiqgAY5z2YjIwEK+EfoGc+
   MxZ9gr2TDxSHjhCmibQWl/X/lDOEBa0kxR9wBoUpveUkF7EIQFKQ1tLDZ
   h83x3ez+TTKsbU9/Rf3WbZt8tWPDjRTVmbKzXFLxFDUq3nQJF6hCpQaHy
   Il07PoF/aEvonJ1GojNXBmWrF4+M8YDzMOcUQOPC5jl5w5qrtVy9uQIxW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422043093"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="422043093"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 21:57:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="850573980"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="850573980"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Mar 2023 21:57:52 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZQKe-00011B-01;
	Tue, 07 Mar 2023 05:57:52 +0000
Date: Tue, 7 Mar 2023 13:57:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:5.10/yocto 11608/30000] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
Message-ID: <202303071314.efJd0yRK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Adrien,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   abd42491338c1d15ac7f00baaa8490063545737e
commit: b47a8854c8e7a90b4d0156b5c94861b30f538bbf [11608/30000] drm/bridge: Introduce LT8912B DSI to HDMI bridge
reproduce:
        # https://github.com/intel/linux-intel-lts/commit/b47a8854c8e7a90b4d0156b5c94861b30f538bbf
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout b47a8854c8e7a90b4d0156b5c94861b30f538bbf
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071314.efJd0yRK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

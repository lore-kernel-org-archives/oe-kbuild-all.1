Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACC328EE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 15:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681225757; x=1712761757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SV3G2m3uKXrIo3IebGAnDrvbFcpeQIDFkVWmLK1r+aA=;
  b=mbl0hZjx6nUydavtoCMdffxKhttEjVIvvdZrgxlEaLx6ZqP1vKVpOacc
   3gAlXny6tXiAB+pAs/MKpiL3NXrNgItkO/vWexrdMuHRxdrxIVgdWsnhC
   U2wHo/P0ekzBwenD1sihsSWqCXV5gka0bOKc81fWTYcfCpOVuxBhrU0Zf
   5UDLVuwCXREtDonWdmFcSW5w0WQ8fTy/4xElt53jAoTf0F4+mzVJxIct1
   wiBZenER0N651+9Ov1vggyQV/gJqxOa2665HA4mUf3pVgLxE0ZXjwfJmv
   GzR+MOJGSpdhJPuUOX29t/o4b/e3VRCneQFWaAE3GaQtZs356dwYABX2q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="342403544"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="342403544"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 08:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="812597110"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="812597110"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Apr 2023 08:09:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmFcQ-000WQD-0q;
	Tue, 11 Apr 2023 15:09:14 +0000
Date: Tue, 11 Apr 2023 23:08:19 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 90/150] htmldocs: Warning: MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
Message-ID: <202304112308.pib6myKS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   50deb21d3cedfc0532a79c819cde73e09f9395fd
commit: a728054125491c7c3653f4caf1cf6cb544d9b64c [90/150] dt-bindings: net: Convert ATH10K to YAML
reproduce:
        # https://github.com/krzk/linux/commit/a728054125491c7c3653f4caf1cf6cb544d9b64c
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
        git checkout a728054125491c7c3653f4caf1cf6cb544d9b64c
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304112308.pib6myKS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

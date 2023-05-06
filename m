Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064167E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 04:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683347268; x=1714883268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XFX6hRGYBhNAUAU5DgLTaL9sD9PFKHc051PSQ5XK6EE=;
  b=R0h3xOKfvphMpeic7o7xmfedLKbXO/VcUJpdTIGqpAlMJJa62KGPIBDr
   +EQ3drWsauodaLMIOvVe2EniInQDxEHzfgiGI6TZy5gMZ8TuYRCOM70BR
   whOelH48a4XotBFXuIg7dteBXNu3MolpkDIpneyPXEGCjxzN+IDi6tVLS
   cE8JH1ugkX5GTGGp8EVCfFSS2suDlpJXAN0dFDgSKi0OmtZ936RlTcPy9
   6aVgiUry7oQ0rkUteOAz9W+UIA36aUatp/4/Xz42eAIeFZd8c+YxvSCQV
   WuwgZPRTttxvOaf3B67p36VSaIilKy6gS1aKgcwbxLR7zx7ouxpnyBq2A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="377424747"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="377424747"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 21:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="944156863"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="944156863"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 May 2023 21:27:38 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv9WD-00019G-1c;
	Sat, 06 May 2023 04:27:37 +0000
Date: Sat, 6 May 2023 12:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 7/200] htmldocs: Warning:
 Documentation/devicetree/bindings/power/wakeup-source.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
Message-ID: <202305061244.0scOmlxb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   37cac42f7369b5677b2c378d885c6c9b342cae57
commit: d54f9ff29b4a490bd67fcfc4aa58858ccdb0b6ef [7/200] dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
reproduce:
        # https://github.com/krzk/linux/commit/d54f9ff29b4a490bd67fcfc4aa58858ccdb0b6ef
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
        git checkout d54f9ff29b4a490bd67fcfc4aa58858ccdb0b6ef
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061244.0scOmlxb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

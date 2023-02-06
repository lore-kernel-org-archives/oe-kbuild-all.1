Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE26515BE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 03:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675653769; x=1707189769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NNYE48udwDYPSGQmVpFONzY1Wy5ysNVfWoVW8XST16o=;
  b=VXfRWaAEInDZGJufYhP+HRaxMKk4sTvypgsTWhPvq0c5AqWJNufpQrKV
   7DxWQ38W9fKCPHDs7VmoauG77pM8sI+cTu3EDA3IGr+nhrq6svqmppK+n
   H5b8cGZsCc1UFPnNnmTTOpxy8tLrCucrumgfWr41qGMUUwHEWWmM1BzT8
   pvE0dI2CMWRPwp8rI1sA6hPfjq9BrmXAkwsHnFT6mdj1W5NIYL+sVIEaf
   7U7d8XdpS/3T7Y74zrB3TvwWGu3AIb+C0A7dCbHuoLm6Yel4LP/jIu8XI
   2xK2YnUPq7AkmDppHD8eMudwU+Mq5SyRXt3ZHYQFngGy0iuqSaWZ+SZW8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309457032"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="309457032"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 19:22:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="734974688"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="734974688"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Feb 2023 19:22:47 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOs5e-0002MM-2k;
	Mon, 06 Feb 2023 03:22:46 +0000
Date: Mon, 6 Feb 2023 11:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: htmldocs: Warning: MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/bindings/display/ste,mcde.txt
Message-ID: <202302061113.92AlVGhG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core62-50-1
head:   aa035fb1ea0a81817398b02a7ca3914558fe23a5
commit: 40369bc3f67648f1d1e47a4e51c1e0bf7098a044 UPSTREAM: dt-bindings: display: mcde: Convert to YAML schema
date:   1 year, 9 months ago
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=40369bc3f67648f1d1e47a4e51c1e0bf7098a044
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core62-50-1
        git checkout 40369bc3f67648f1d1e47a4e51c1e0bf7098a044
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/ste,mcde.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

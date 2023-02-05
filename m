Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3D72F21
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 20:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675627352; x=1707163352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7d4o/KaukK892+ShFQ3rf/E+7ffmb0+scJdpnIUfW1Y=;
  b=G5Nu/0Yz4vDQUVJsoZOOg3YLXJWZB0ZDV9FykBs49k7uNv1+2icHF8CN
   Y/WgMgkKdZTM7f+AKtiE4zrhnjAC473VtazavAy20GicBhLlP+Q/Z9m7a
   ZmL1cw4QWANOrXZMu1TXfCRqWXx7qZrAlgN+1ihy0zm1iIK9y8qxtKjIp
   R96NhqGzWkl42pvbHyO4ATiVozM76+X363ofVzK59vAyBAuQHdkDLfsXc
   EdB8a0hDx8/uQOD8/4V2R+mN0IB89cN80Jr3B0vnzXN/2VuxJ3r+YbUqO
   +F4VX53QbMAn1QCNNt0znD+ef6jnFHDS1oU6tQrt3peZjswbIALGORh/q
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="393680749"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="393680749"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 12:02:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="808921598"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="808921598"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2023 12:02:30 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOlDZ-0002Bo-2M;
	Sun, 05 Feb 2023 20:02:29 +0000
Date: Mon, 6 Feb 2023 04:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: htmldocs: Documentation/output/videodev2.h.rst:6: WARNING: undefined
 label: v4l2-pix-fmt-nv12-ubwc (if the link has no caption the label must
 precede a section header)
Message-ID: <202302060352.tOsh1CkJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mansur,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 3c22b18e6af3014eabd5ceb072918754755aafed HACK: CHROMIUM: vidc: vdec: changes to enable UBWC on sc7180
date:   2 years, 2 months ago
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=3c22b18e6af3014eabd5ceb072918754755aafed
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 3c22b18e6af3014eabd5ceb072918754755aafed
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-nv12-ubwc (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5451C7E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 09:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678093438; x=1709629438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3LbQwIIjyN9c1dZ2SdZn8IITsS/h63xL8SVKUQuunvk=;
  b=K7fDZCP5l27ZG0uCMExfoyMPXNqVDKfgfc3OcQxAb/n7u0MUkqTBg5OD
   UwQci2qYN6KnPd8N5yZ+Dmdit2cCUQjW+936tBobJ8wspPiMounaNJDXW
   nSn2TNQzshog1HajPiIIKMpJl9agqNhx8AX8gxBYkhgYNfkJRvaQr+UK/
   z0yInK2+FylM/wF7g+d9ryHmbR3TAdQ577r2tdP0c+eYStIeZI6G+5C6O
   f8ZOfjlrFHm0IdW4Yz84yqe5/OMm0FIyqtXKJXAfkLfXJE7CuTeO+1p+e
   YBarsNhp+hHxmCsvjG8SI/Jjln15vNnqCbnIbacWPsS9DLK3eOrj23OhC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="334222088"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="334222088"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 01:03:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="744982758"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="744982758"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2023 01:03:56 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ6l9-0000BV-1N;
	Mon, 06 Mar 2023 09:03:55 +0000
Date: Mon, 6 Mar 2023 17:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: Wanhui Sun <wanhui.sun@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Chen Meng J <meng.j.chen@intel.com>, Meng Wei <wei.meng@intel.com>
Subject: [intel-lts:5.10/yocto 10445/30000] htmldocs:
 Documentation/output/media.h.rst:6: WARNING: undefined label:
 media-pad-fl-multiplex (if the link has no caption the label must precede a
 section header)
Message-ID: <202303061649.jE1mPxoA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wanhui,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   abd42491338c1d15ac7f00baaa8490063545737e
commit: f13978177f8c57c155d53df5f2df60f519e82e4a [10445/30000] v4l: subdev: Add support for sub-streams
reproduce:
        # https://github.com/intel/linux-intel-lts/commit/f13978177f8c57c155d53df5f2df60f519e82e4a
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout f13978177f8c57c155d53df5f2df60f519e82e4a
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061649.jE1mPxoA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/media.h.rst:6: WARNING: undefined label: media-pad-fl-multiplex (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/media.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

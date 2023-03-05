Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B762F26
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Mar 2023 18:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678039239; x=1709575239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9LC6nZjfLNEx+WMvS97iXWjdVGPP/G3pnZXX/V+n09Q=;
  b=lYa16o1875XJpUw3Mnxjb9AnVbJ/q/z6+zmCSvxnDdYsL8wgF7mkSLo6
   trtgOKNAgISk1ZpsXjVaigv3F0swaxR3T3MbfTpsTO+S6DDeYwo3RlI9D
   0tgapLW3AXDezVlJuz5XzSB3t+T9aNfuVR4ffF5WIZkmLLAj4mguNwFFt
   6vyeP00C9AryjnhlZduoQzPK5ACo6Ah2Lgohony9ZDfD+r84JFtLe+Xox
   ocqWsef05XbvTX/XRFyYU+9UQ4r1rmDYdL3Gq38clfupcdV7CTgyFZp/t
   cMbsr/lKGhnuz2nXbxumARul7VtyH+f2dUxq6caqL10RGYqYc/Ytc+xFq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="421681516"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="421681516"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 10:00:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="675928400"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="675928400"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Mar 2023 10:00:36 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYsey-0002x2-0W;
	Sun, 05 Mar 2023 18:00:36 +0000
Date: Mon, 6 Mar 2023 02:00:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: htmldocs: Documentation/ABI/testing/sysfs-bus-thunderbolt:91:
 WARNING: Malformed table.
Message-ID: <202303060151.uzghu2dP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mika,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/KMB-yocto
head:   637413c0a333ec390d7ec23cd882f1b35d9cd82a
commit: 76632f626bd087e892f11095d51cd805144436c5 thunderbolt: Add support for de-authorizing devices
date:   2 years, 3 months ago
reproduce:
        # https://github.com/intel/linux-intel-lts/commit/76632f626bd087e892f11095d51cd805144436c5
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/KMB-yocto
        git checkout 76632f626bd087e892f11095d51cd805144436c5
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303060151.uzghu2dP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-bus-thunderbolt:91: WARNING: Malformed table.

vim +91 Documentation/ABI/testing/sysfs-bus-thunderbolt

f67cf491175a31 Mika Westerberg       2017-06-06  @91  Date:		Sep 2017
f67cf491175a31 Mika Westerberg       2017-06-06   92  KernelVersion:	4.13
f67cf491175a31 Mika Westerberg       2017-06-06   93  Contact:	thunderbolt-software@lists.01.org
f67cf491175a31 Mika Westerberg       2017-06-06   94  Description:	This attribute is used to authorize Thunderbolt devices
f67cf491175a31 Mika Westerberg       2017-06-06   95  		after they have been connected. If the device is not
76632f626bd087 Mika Westerberg       2020-11-10   96  		authorized, no PCIe devices are available to the system
76632f626bd087 Mika Westerberg       2020-11-10   97  		(there is no PCIe tunnel to the device).
f67cf491175a31 Mika Westerberg       2017-06-06   98  
f67cf491175a31 Mika Westerberg       2017-06-06   99  		Contents of this attribute will be 0 when the device is not
f67cf491175a31 Mika Westerberg       2017-06-06  100  		yet authorized.
f67cf491175a31 Mika Westerberg       2017-06-06  101  
f67cf491175a31 Mika Westerberg       2017-06-06  102  		Possible values are supported:
34433332841de2 Mauro Carvalho Chehab 2020-10-30  103  
76632f626bd087 Mika Westerberg       2020-11-10  104  		==  ===================================================
76632f626bd087 Mika Westerberg       2020-11-10  105  		0   The device will be de-authorized (only for software
76632f626bd087 Mika Westerberg       2020-11-10  106  		    based connection manager)
34433332841de2 Mauro Carvalho Chehab 2020-10-30  107  		1   The device will be authorized and connected
76632f626bd087 Mika Westerberg       2020-11-10  108  		==  ==================================================
f67cf491175a31 Mika Westerberg       2017-06-06  109  
f67cf491175a31 Mika Westerberg       2017-06-06  110  		When key attribute contains 32 byte hex string the possible
f67cf491175a31 Mika Westerberg       2017-06-06  111  		values are:
34433332841de2 Mauro Carvalho Chehab 2020-10-30  112  
34433332841de2 Mauro Carvalho Chehab 2020-10-30  113  		==  ========================================================
34433332841de2 Mauro Carvalho Chehab 2020-10-30  114  		1   The 32 byte hex string is added to the device NVM and
f67cf491175a31 Mika Westerberg       2017-06-06  115  		    the device is authorized.
34433332841de2 Mauro Carvalho Chehab 2020-10-30  116  		2   Send a challenge based on the 32 byte hex string. If the
f67cf491175a31 Mika Westerberg       2017-06-06  117  		    challenge response from device is valid, the device is
f67cf491175a31 Mika Westerberg       2017-06-06  118  		    authorized. In case of failure errno will be ENOKEY if
f67cf491175a31 Mika Westerberg       2017-06-06  119  		    the device did not contain a key at all, and
f67cf491175a31 Mika Westerberg       2017-06-06  120  		    EKEYREJECTED if the challenge response did not match.
34433332841de2 Mauro Carvalho Chehab 2020-10-30  121  		==  ========================================================
f67cf491175a31 Mika Westerberg       2017-06-06  122  

:::::: The code at line 91 was first introduced by commit
:::::: f67cf491175a315ca86c9b349708bfed7b1f40c1 thunderbolt: Add support for Internal Connection Manager (ICM)

:::::: TO: Mika Westerberg <mika.westerberg@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

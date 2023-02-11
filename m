Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6500210E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 09:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676106605; x=1707642605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aK0z6N7lTTxU3cmnDN19N6ZfmrExfyVGshQoMHbKY8o=;
  b=cVrSBMExgKJJZ1LaZaZQMllx6rUyltgIoOEOlNBCsDb1KhjS8CJss38n
   MimH7pJF4RN90qAtu78npJ8OJdGihXzY8odcXizFMyZJynTztChh+yVa3
   gewIInT7Y1j4jw0gP+r3Sb7zGhtgwxGOgLX8ULz42M1YlIe6ROLXVWIPy
   r1itCsvyXMLJdQB6hR21TFC1F0DURJO9u7pT7Ze1xoy2wLbZePz/Yz/Oy
   1h+9AuiaW6uKuQdyPCDG9xBGeXeWKbScGcjKc0ESNEotMP/xlsGAUXRyk
   ysd6Di4OYqE+QZAw+OMAtetPzaPCbfaK+1w6tF25aBwHax13BHfh/Iyss
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="328293323"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="328293323"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 01:10:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="618128115"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="618128115"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Feb 2023 01:10:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQltS-0006Nd-2w;
	Sat, 11 Feb 2023 09:10:02 +0000
Date: Sat, 11 Feb 2023 17:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/explicit-sync 379/554]
 ./usr/include/drm/asahi_drm.h:284:39: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202302111736.JwqdSmZl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Asahi,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux gpu/explicit-sync
head:   4e22161bdf43a03196f70f50d0794c60fc89a9b8
commit: de76c82a4aa0c44d537b4f77ac09e36c0524c37f [379/554] drm/asahi: Add initial compute UAPI
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230211/202302111736.JwqdSmZl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/AsahiLinux/linux/commit/de76c82a4aa0c44d537b4f77ac09e36c0524c37f
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/explicit-sync
        git checkout de76c82a4aa0c44d537b4f77ac09e36c0524c37f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111736.JwqdSmZl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/drm/asahi_drm.h:284:39: error: C++ style comments are not allowed in ISO C90
     284 |         __u32 buffer_descriptor_size; // ?
         |                                       ^
   ./usr/include/drm/asahi_drm.h:284:39: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

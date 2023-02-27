Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22991746B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677514095; x=1709050095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xNmLkRnJvhwTmhWxtpJxQ+heftaNsH5fhjf/WiPeD44=;
  b=dmXg1BeZ6yRzTYvLy8DMLkVKgi8Fbj5AkXTF4gs38jWaXlmWwuYW4so3
   sQQGmIaKlRwdTnREfjbkTxQFkJzg5NJy5CyzZUamqDsvUTXNcxmT0CJfn
   nZ1697QRISoDQgywFvXT16j4wWIDJidG7oh3wL1VEsTaqKhR7kGPMiwnb
   qC6uQ+f3knPymW7dOR0eOaCNUj7/GbdWxgCXVsFuyrffKBcmSDYZ2GzRo
   olQE9wp72YU0bPWXsMFlmOv7095YXuOt4FGZcs0eDqDALaZrTMTLKLlxN
   fne1Im62iK0lVZkNyXDQq+U/FhU+uUUbk5uHbgYbGZKd/SWjpy5kJDPP7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="420156132"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="420156132"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 08:07:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="706236105"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="706236105"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Feb 2023 08:07:50 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWg2X-0004Zr-1u;
	Mon, 27 Feb 2023 16:07:49 +0000
Date: Tue, 28 Feb 2023 00:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>, mst@redhat.com,
	jasowang@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, stefanha@redhat.com, sgarzare@redhat.com,
	arei.gonglei@huawei.com, yechuan@huawei.com,
	huangzhichao@huawei.com, virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, eperezma@redhat.com,
	Longpeng <longpeng2@huawei.com>
Subject: Re: [PATCH v4 2/2] vdpasim: support doorbell mapping
Message-ID: <202302272338.vXR8d1Bb-lkp@intel.com>
References: <20230227091857.2406-3-longpeng2@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227091857.2406-3-longpeng2@huawei.com>

Hi Longpeng(Mike),

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v6.2]
[cannot apply to mst-vhost/linux-next linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Longpeng-Mike/vdpa-support-specify-the-pgprot-of-vq-notification-area/20230227-172516
patch link:    https://lore.kernel.org/r/20230227091857.2406-3-longpeng2%40huawei.com
patch subject: [PATCH v4 2/2] vdpasim: support doorbell mapping
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230227/202302272338.vXR8d1Bb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a472c7ad92f68b5b596fd68e1936b2d47fe2ea0b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Longpeng-Mike/vdpa-support-specify-the-pgprot-of-vq-notification-area/20230227-172516
        git checkout a472c7ad92f68b5b596fd68e1936b2d47fe2ea0b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272338.vXR8d1Bb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__bad_xchg" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FBCDA96
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 19:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678475309; x=1710011309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sj89mkIxbdQ4VKaoPz17QlIBDrLJBxmyjmVCcpHbqlg=;
  b=X4FlwlkzQ1Pye1dFYSuTE1pk3gxBJrNltuCFrg+HGoIA8B8H9kW4C2b4
   PYWglKFfNjmYNooT6AkBIvJLARGfoHT3LxXBa8swYo1Vy5rmQz3/MCnN+
   E290B4qZwMf0TbdzJpUs8F38LsImfDmrQr3TqtxZfdKeumvPvHWHa3Vmw
   VZ8uo6bD1pENvAKswMmxd4rF7q39Db19cicIIgPT5EyMQEgxkIklTHJbF
   pV+NoChwNx4aqXGlPu4UjPp9EpV0rCxGrTNmGbihToyM+x4FazFFcSBA7
   Utm3FsYXsusz2CtBeQVni9VnS64IJgQ4TQmZqDGliCgXqCv/6WAuPhnZ/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="325162144"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="325162144"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 11:08:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="1007230595"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="1007230595"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Mar 2023 11:08:27 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pai6M-00043u-2K;
	Fri, 10 Mar 2023 19:08:26 +0000
Date: Sat, 11 Mar 2023 03:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Yangtao Li <frank.li@vivo.com>, tytso@mit.edu, adilger.kernel@dilger.ca
Cc: oe-kbuild-all@lists.linux.dev, linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
	Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH] ext4: convert to DIV_ROUND_UP() in
 mpage_process_page_bufs()
Message-ID: <202303110211.LXeNm5uw-lkp@intel.com>
References: <20230310060734.8780-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310060734.8780-1-frank.li@vivo.com>

Hi Yangtao,

I love your patch! Yet something to improve:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on linus/master v6.3-rc1 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yangtao-Li/ext4-convert-to-DIV_ROUND_UP-in-mpage_process_page_bufs/20230310-140903
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20230310060734.8780-1-frank.li%40vivo.com
patch subject: [PATCH] ext4: convert to DIV_ROUND_UP() in mpage_process_page_bufs()
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230311/202303110211.LXeNm5uw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/f4d2db5f59592a5688be6e4d2d3dd6f3f94d4f96
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yangtao-Li/ext4-convert-to-DIV_ROUND_UP-in-mpage_process_page_bufs/20230310-140903
        git checkout f4d2db5f59592a5688be6e4d2d3dd6f3f94d4f96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110211.LXeNm5uw-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/ext4/inode.o: in function `mpage_process_page_bufs':
>> inode.c:(.text+0xbda): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

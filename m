Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9347E1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 00:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678407945; x=1709943945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QzXoO3BQZutFN9U9HIvmC02QF+kBA0Ol3geLV6CDoec=;
  b=MWmxGDm8oeLdkZMAvo5ja8Ku80y85YpZ5nxXLfEx8cUMA32P3xs+wYZI
   dBruj07vxg3zOUOzxWvjp5Y+xXIZORJ1fsHup28CDbt4OvUhWJ+ifh3u8
   bpvxQpXMjP+PKOOAIzv7PUAx+KbD4JKHYNfg+31xQgWSNHVbGLgs+t1De
   jasc5OhRvVWJQ8uPajPOnx1eCE+FPM+qfZH0n11Rlvf9OG69Bfc1lXhZ+
   WOerDdj858uu5+oipg5MimouAwtA2Qpl/N6U+6BYTbwbkpSoOAwZmfSzC
   GPhouRKFZSi0yQ+E8fE0C1YOTvwfTlROcB/dRY5wJimRUd7UPOeOPbpmU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="316263064"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="316263064"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 16:25:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="787805569"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="787805569"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2023 16:25:44 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paQZr-0003JT-0n;
	Fri, 10 Mar 2023 00:25:43 +0000
Date: Fri, 10 Mar 2023 08:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.15-arcvm
 11/16] virtio_video_enc.c:undefined reference to `__udivdi3'
Message-ID: <202303100835.9UwdSFfJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.15-arcvm
head:   9591ea7f0c71852cb0d31a1b30afcbe04e81f44e
commit: d12a3174c5d0a6a0f498d6ba2abf6caee3844082 [11/16] Convert nsec to usec in encoder buffer timestamps
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230310/202303100835.9UwdSFfJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/d12a3174c5d0a6a0f498d6ba2abf6caee3844082
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.15-arcvm
        git checkout d12a3174c5d0a6a0f498d6ba2abf6caee3844082
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100835.9UwdSFfJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/virtio/virtio_video_enc.o: in function `virtio_video_enc_buf_queue':
>> virtio_video_enc.c:(.text+0x32f): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

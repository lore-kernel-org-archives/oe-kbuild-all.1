Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC7EE4DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 22:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678488874; x=1710024874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=56yOBI3w3pyxe1haT14qBRShBk6LDKjF0BUgZAwclbM=;
  b=PjrfXCXUt/0CrdnJIh3HP0ArYhJG2S2tPB+fv2izxW1gF65peabk1s8s
   BHRVKCOBzQkvAKoQnHZuMlZ8LQPAJbNXniEUHafrwfjISZmLMFz9s12BO
   JwS2KvjeGx7/bW06Ao9Ygp5wa1LHsFjLEK4eaHkwyzMITa3Kgt/1jlRzf
   P0vYCR1j2yXATDdvaYVjdkzkTDanLClAmH6D3MNjEjxQZhwNlbJxkW/DK
   l8TqIHVmKquKoc1d0Q5Dvzugh9K2bbRSTixn//Zux0ZRxgtaSjh9V3reo
   75/RYSSCLtaJ69jDB480VqjMJzsrzS8vjTKh5Kb9UhCiny+H/flitcQyT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="335542876"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="335542876"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 14:54:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="788205770"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="788205770"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2023 14:54:31 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pald8-000493-1v;
	Fri, 10 Mar 2023 22:54:30 +0000
Date: Sat, 11 Mar 2023 06:53:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/pipe-list 29/30] undefined
 reference to `sock_from_file'
Message-ID: <202303110639.Bzzde3iK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/pipe-list
head:   e76345d9b0b65f673fbee4ce5c3ef8450e89638e
commit: d90688969d42de17ae7edb2b32ddf8c9a821ff71 [29/30] splice, net: Use sendmsg(MSG_SPLICE_PAGES) rather than ->sendpage()
config: parisc-randconfig-r021-20230310 (https://download.01.org/0day-ci/archive/20230311/202303110639.Bzzde3iK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/d90688969d42de17ae7edb2b32ddf8c9a821ff71
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/pipe-list
        git checkout d90688969d42de17ae7edb2b32ddf8c9a821ff71
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110639.Bzzde3iK-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: fs/splice.o: in function `pipe_to_sendmsg':
>> (.text+0x12c): undefined reference to `sock_from_file'
>> hppa-linux-ld: (.text+0x1b4): undefined reference to `sock_sendmsg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

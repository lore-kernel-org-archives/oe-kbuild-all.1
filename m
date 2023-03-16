Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5753C00
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 15:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678981237; x=1710517237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3SaVor5XllpgUtenRGiYapesMAxutxF02Xx2eGPaAyQ=;
  b=e3K4wEpcRLh/UjldBI700pcFSB3Uow0pb7iGU9dhBdawoDhS4K/FF1p+
   5ZFzE3HVs19PoNbI3sjbBAv5CCekarBYEXH0hKA4A2BF1apDLmRsYA1Zc
   gldfe2uT7cNaXOb8O/S9bvqG9XfSkS8JOL3o85YqU/DCWf6q+MkkpRVok
   aHwRq9tK9beuYOWITLCMyfwdS+oTAGJDX5GxezxOvdr0X9n8JWvJjMpQG
   YCP+3vZM8OIqklAMLS3D1H69dcxx0tNFHDLbzE4btLefbJ6AeXzpiTe9w
   wLx4/n+F/TyYYIv0wPbqvSJaV0CWo6lwy1p4dDE2qosv6dbrfgC5d0oeo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="339571415"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="339571415"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 08:40:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="1009267578"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="1009267578"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Mar 2023 08:40:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcpiU-0008ba-0g;
	Thu, 16 Mar 2023 15:40:34 +0000
Date: Thu, 16 Mar 2023 23:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:pipe-list 48/48] kernel/trace/trace.c:8284:10: error:
 'const struct pipe_buf_operations' has no member named 'get'
Message-ID: <202303162321.nLq248W7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pipe-list
head:   b678626289708f1a3b1f2a46671bf3e0f00282e5
commit: b678626289708f1a3b1f2a46671bf3e0f00282e5 [48/48] pipe: Use a linked-list instead of a ring buffer
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230316/202303162321.nLq248W7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=b678626289708f1a3b1f2a46671bf3e0f00282e5
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs pipe-list
        git checkout b678626289708f1a3b1f2a46671bf3e0f00282e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303162321.nLq248W7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/splice.h:12,
                    from kernel/trace/trace.c:33:
   include/linux/pipe_fs_i.h: In function 'pipe_buf_get':
   include/linux/pipe_fs_i.h:109:24: error: 'const struct pipe_buf_operations' has no member named 'get'
     109 |         return buf->ops->get(pipe, buf);
         |                        ^~
   kernel/trace/trace.c: At top level:
>> kernel/trace/trace.c:8284:10: error: 'const struct pipe_buf_operations' has no member named 'get'
    8284 |         .get                    = buffer_pipe_buf_get,
         |          ^~~


vim +8284 kernel/trace/trace.c

2cadf9135eb3b6 Steven Rostedt  2008-12-01  8280  
2cadf9135eb3b6 Steven Rostedt  2008-12-01  8281  /* Pipe buffer operations for a buffer. */
28dfef8febe48f Alexey Dobriyan 2009-12-15  8282  static const struct pipe_buf_operations buffer_pipe_buf_ops = {
2cadf9135eb3b6 Steven Rostedt  2008-12-01  8283  	.release		= buffer_pipe_buf_release,
2cadf9135eb3b6 Steven Rostedt  2008-12-01 @8284  	.get			= buffer_pipe_buf_get,
2cadf9135eb3b6 Steven Rostedt  2008-12-01  8285  };
2cadf9135eb3b6 Steven Rostedt  2008-12-01  8286  

:::::: The code at line 8284 was first introduced by commit
:::::: 2cadf9135eb3b6d84b6427314be827ddd443c308 tracing: add binary buffer files for use with splice

:::::: TO: Steven Rostedt <srostedt@redhat.com>
:::::: CC: Steven Rostedt <srostedt@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

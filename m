Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998E16D22
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680617442; x=1712153442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TqPM0czQCghP4FNBlWIjEOBtKdTF/I8NKZbNaN31xnk=;
  b=ZDITgUoK3fcWrZPxivGvFYMU4SJaCl1J87BYLdP94ODh6hM9L3RA1Ff2
   52uMUC+Kus5TMmf+r/j6HS0Mwg3bo0A1/661HfTrgZQSWJPhAt4J6yi8B
   sEbdVZSu7hZkjF6owm8R0jcy50JRw3e6go6AJ3iYom/s/Ds+8yXgayIAG
   s1i2G2g84xmumeWRmbcUufppc6bZkvw40inyrIbHGsnympUq2AIoPfxUk
   TJxUkd+Y6YoZWG1wkZa7cTxepKOtWcQd5l7D9cumlczBRn92RDoB8+uWU
   Kt2Qr0dSREEeNDyk6ZF52fNJ57WaJZwnBc+DDekmoaW1BR5se7IzrUdrv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="321850043"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="321850043"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 07:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="750932593"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="750932593"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Apr 2023 07:05:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjhHs-000Pkk-19;
	Tue, 04 Apr 2023 14:05:28 +0000
Date: Tue, 4 Apr 2023 22:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoyan Li <lixiaoyan@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>
Subject: [linux-next:master 5025/9010] tcp_mmap.c:211:61: warning: 'lu' may
 be used uninitialized in this function
Message-ID: <202304042104.UFIuevBp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a53bda3aaf3de5edeea27d0b1d8781d067640b6
commit: 5c5945dc695c54f2b55a934a10b6c4e220f9c140 [5025/9010] selftests/net: Add SHA256 computation over data sent in tcp_mmap
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5c5945dc695c54f2b55a934a10b6c4e220f9c140
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 5c5945dc695c54f2b55a934a10b6c4e220f9c140
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304042104.UFIuevBp-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   tcp_mmap.c: In function 'child_thread':
>> tcp_mmap.c:211:61: warning: 'lu' may be used uninitialized in this function [-Wmaybe-uninitialized]
     211 |                         zc.length = min(chunk_size, FILE_SZ - lu);
         |                                                             ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

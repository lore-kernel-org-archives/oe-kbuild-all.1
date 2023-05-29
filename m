Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05677C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 08:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685350364; x=1716886364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dg7TBqwLNamkVazVaVfKvCUcxlfTX0Kfh3Qy2HhITnI=;
  b=C9ipG2FIz3jiwi9/JFzoU6WhugGJ1leQKMxY2IXrNMASLgahwY63sHkV
   82ogFqWVz4v8SSVQCPun5HJE6eRi7AqEQfkfQ33UqKNnua7PfJNYxcgkf
   8puu0zFoO3q6I6ogi3SbDETr4+cwA5yxNNId9xUu8vLVZaom+HYpLGo82
   lazItnRUX/2/80WQm83vHRc0TgWTkE98k4gGEXsCySQsi2IANMg5Rj/W+
   /RX7/TtY2g3GfM27LMpppm0FzDnwTsH8hcZVBwF/lBiKEAnzPBtJ4CDME
   vHMpZHVFrFHM787nXMrvs6xI0pcBVe8NHu1WBj6C0J6d0MmpPBOPlwcIZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="357909594"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="357909594"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 01:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="771081115"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="771081115"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 May 2023 01:52:42 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3YcM-000Kww-0O;
	Mon, 29 May 2023 08:52:42 +0000
Date: Mon, 29 May 2023 16:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/new-api-tcx3 23/25] net.c:454:13: warning: the comparison
 will always evaluate as 'true' for the address of 'name' will never be NULL
Message-ID: <202305291627.YnLWJR6N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/new-api-tcx3
head:   6865ace8f33b356094d15b6d02d7a33696855ea5
commit: cfdf908205b1289036141d37d0cdce8dd5c8f456 [23/25] bpftool: Add support for tc fd-based attach types
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # https://github.com/cilium/linux/commit/cfdf908205b1289036141d37d0cdce8dd5c8f456
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/new-api-tcx3
        git checkout cfdf908205b1289036141d37d0cdce8dd5c8f456
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305291627.YnLWJR6N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net.c: In function '__show_dev_tc_bpf_name':
>> net.c:454:13: warning: the comparison will always evaluate as 'true' for the address of 'name' will never be NULL [-Waddress]
     454 |         if (info.name) {
         |             ^~~~
   In file included from /tools/include/bpf/bpf.h:26,
                    from net.c:13:
   tools/include/uapi/linux/bpf.h:6354:14: note: 'name' declared here
    6354 |         char name[BPF_OBJ_NAME_LEN];
         |              ^~~~
--
   net.c: In function '__show_dev_tc_bpf_name':
>> net.c:454:13: warning: the comparison will always evaluate as 'true' for the address of 'name' will never be NULL [-Waddress]
     454 |         if (info.name) {
         |             ^~~~
   In file included from tools/bpf/bpftool/libbpf/include/bpf/bpf.h:26,
                    from net.c:13:
   tools/include/uapi/linux/bpf.h:6354:14: note: 'name' declared here
    6354 |         char name[BPF_OBJ_NAME_LEN];
         |              ^~~~
   libbpf: failed to find '.BTF' ELF section in vmlinux
   Error: failed to load BTF from vmlinux: No data available
   make[3]: *** [Makefile:78: tools/bpf/runqslower//vmlinux.h] Error 195
   make[3]: *** Deleting file 'tools/bpf/runqslower//vmlinux.h'
   make[2]: *** [Makefile:122: runqslower] Error 2
   make[2]: *** Waiting for unfinished jobs....
   libbpf: failed to find '.BTF' ELF section in vmlinux
   Error: failed to load BTF from vmlinux: No data available
   make[3]: *** [Makefile:208: tools/bpf/bpftool/vmlinux.h] Error 195
   make[3]: *** Deleting file 'tools/bpf/bpftool/vmlinux.h'
   make[2]: *** [Makefile:113: bpftool] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

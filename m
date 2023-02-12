Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231251399
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 09:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676194785; x=1707730785;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8hlLBCRN5zly9nBM7q1jjb/72y+BV0FCXjtFK8pg7wo=;
  b=QCNqepBuNAAr0t4sGPuh5KzYf6Xy+2jaqgaQl4BCsgQLj7DzDCj9esLO
   FP0fo0WdB4zZJ4azFe7ymPDjwZU4c0YlDTfJNzpldxFaofD7CGmzl9kRq
   YuVPT4Zp+Hd9gEtbNrAxoE4YTJJ6J/8ETs0zEnK0y43ze0Ao0ZmH36pnE
   FQVI7WRn6ARAfTdBA/7jSHQg0jUGGGqwgMcRKx2+byFqrY5J7mJoZTYs0
   V/g4/AK4fMFxBQKRrHLvSG4X63GS2g7I1oj49Yp8QsjHP9jS3xXzL6/jR
   dNJ5C9B1HIJ2T7TpIT6w92bvHLanuyk/tq+uxNGvgurWUJnxNLbwR0pxi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="332010855"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="332010855"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 01:39:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="698873800"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="698873800"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Feb 2023 01:39:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pR8ph-0007Af-1O;
	Sun, 12 Feb 2023 09:39:41 +0000
Date: Sun, 12 Feb 2023 17:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/admin-guide/index.rst:62: WARNING: toctree
 contains reference to nonexisting document 'admin-guide/thermal'
Message-ID: <202302121759.MmJgDTxc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/bleeding-edge
head:   a6f8eedce38d194452c40540af6cc9cc2a035133
commit: 707bf8e1dfd51dd0cafe92da24f5276702edebe5 Documentation: admin-guide: Move intel_powerclamp documentation
date:   3 days ago
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/commit/?id=707bf8e1dfd51dd0cafe92da24f5276702edebe5
        git remote add thermal git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git
        git fetch --no-tags thermal thermal/bleeding-edge
        git checkout 707bf8e1dfd51dd0cafe92da24f5276702edebe5
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302121759.MmJgDTxc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/index.rst:62: WARNING: toctree contains reference to nonexisting document 'admin-guide/thermal'
>> Documentation/admin-guide/thermal/intel_powerclamp.rst: WARNING: document isn't included in any toctree

vim +62 Documentation/admin-guide/index.rst

7358bb2f329346 Jonathan Corbet         2016-10-26   61  
7358bb2f329346 Jonathan Corbet         2016-10-26  @62  .. toctree::
7358bb2f329346 Jonathan Corbet         2016-10-26   63     :maxdepth: 1
7358bb2f329346 Jonathan Corbet         2016-10-26   64  
680e6ffa15103a Changbin Du             2019-04-25   65     acpi/index
83bbf6e103544d Mauro Carvalho Chehab   2019-06-27   66     aoe/index
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12   67     auxdisplay/index
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12   68     bcache
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12   69     binderfs
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12   70     binfmt-misc
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12   71     blockdev/index
7b9b816f4b9a35 Masami Hiramatsu        2020-01-11   72     bootconfig
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12   73     braille-console
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27   74     btmrvl
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12   75     cgroup-v1/index
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12   76     cgroup-v2
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12   77     cifs/index
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27   78     clearing-warn-once
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27   79     cpu-load
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27   80     cputopology
d4300c4e4fd439 Jonathan Neuschäfer     2019-10-12   81     dell_rbu
6cf2a73cb2bc42 Mauro Carvalho Chehab   2019-06-18   82     device-mapper/index
320bfd91a985f2 Jonathan Neuschäfer     2020-02-14   83     edid
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27   84     efi-stub
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12   85     ext4
c0baf9ac0b05d5 Gabriel Krisman Bertazi 2021-10-25   86     filesystem-monitoring
2f123b9a359650 Daniel W. S. Almeida    2020-01-10   87     nfs/index
c2746a1eb74175 Mauro Carvalho Chehab   2019-06-28   88     gpio/index
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27   89     highuid
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27   90     hw_random
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12   91     initrd
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27   92     iostats
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12   93     java
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12   94     jfs
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27   95     kernel-per-CPU-kthreads
9e1cbede267916 Mauro Carvalho Chehab   2019-06-13   96     laptops/index
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27   97     lcd-panel-cgram
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27   98     ldm
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27   99     lockup-watchdogs
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  100     LSM/index
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  101     md
32e2eae23f8fd1 Mauro Carvalho Chehab   2020-03-04  102     media/index
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  103     mm/index
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  104     module-signing
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  105     mono
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  106     namespaces/index
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27  107     numastat
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  108     parport
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  109     perf-security
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  110     pm/index
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27  111     pnp
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  112     rapidio
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  113     ras
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27  114     rtc
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  115     serial-console
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27  116     svga
a4452e671c6770 Gabriel Krisman Bertazi 2020-11-27  117     syscall-user-dispatch
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  118     sysrq
707bf8e1dfd51d Srinivas Pandruvada     2023-02-07  119     thermal
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  120     thunderbolt
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  121     ufs
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  122     unicode
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  123     vga-softcursor
4f4cfa6c560c93 Mauro Carvalho Chehab   2019-06-27  124     video-output
2c1d7ffdf4fe34 Jonathan Neuschäfer     2019-10-12  125     xfs
6f2ec3a9d5489e Markus Heiser           2016-10-26  126  

:::::: The code at line 62 was first introduced by commit
:::::: 7358bb2f3293461737a61850c56523695f5b2219 docs: Clean up and organize the admin guide a bit

:::::: TO: Jonathan Corbet <corbet@lwn.net>
:::::: CC: Jonathan Corbet <corbet@lwn.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE006208AF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 18:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695493379; x=1727029379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/0Jd+aUd+BdFfHHU0bMJSsnfRoo9mTHJg2oWei3NyXw=;
  b=TRBWSUHI1JMFTFInrDWgjv4HPNov1Mj0hIaiFu/PuvtXxbCIeulpTf6y
   /kcDjAnIcvwFG3/AHWqbb2gp8FAcHoHPtHaeYMpMCBHzSDGOHyrG3hVzb
   mMlJdFaDL70884CvQqNeFGOZ0eEUsY7wFNsrcvDvqo7lX90vZf/9W70hZ
   2myyO1UTT8qtdskRL9adLK3Lx0rS/o6Czil4xC+inIALctkLSzw+j064F
   FJUhDXWbccnei5L5weck3OjGfImim8Fvdy5cRRtYrJFQoyirOiFZmeqZU
   Xe99kwuzsbKWgkIczLA+Wj5OYkbVk1tq114zRhVa4sgYp7AvwCTkSUodX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="366102399"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="366102399"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 11:22:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="813467115"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="813467115"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2023 11:22:57 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk7HL-0002ii-1W;
	Sat, 23 Sep 2023 18:22:55 +0000
Date: Sun, 24 Sep 2023 02:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 29/61] drivers/tty/hvc/hvc_opal.c:143:22: error:
 initialization of 'int (*)(uint32_t,  u8 *, int)' {aka 'int (*)(unsigned
 int,  unsigned char *, int)'} from incompatible pointer type 'int
 (*)(uint32_t,  char *, int)' {aka 'int (*)(unsigned int,  char *, int)'}
Message-ID: <202309240250.Nt89a15v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiri,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   8ff6341a460853d462833279b07bd7ab7819fb24
commit: 6774708fe949d97ed3408f6745411fd72149cf5b [29/61] hvc: use u8
config: powerpc64-randconfig-001-20230923 (https://download.01.org/0day-ci/archive/20230924/202309240250.Nt89a15v-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240250.Nt89a15v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240250.Nt89a15v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/hvc/hvc_opal.c:143:22: error: initialization of 'int (*)(uint32_t,  u8 *, int)' {aka 'int (*)(unsigned int,  unsigned char *, int)'} from incompatible pointer type 'int (*)(uint32_t,  char *, int)' {aka 'int (*)(unsigned int,  char *, int)'} [-Werror=incompatible-pointer-types]
     143 |         .get_chars = hvc_opal_hvsi_get_chars,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/hvc/hvc_opal.c:143:22: note: (near initialization for 'hvc_opal_hvsi_ops.get_chars')
>> drivers/tty/hvc/hvc_opal.c:144:22: error: initialization of 'int (*)(uint32_t,  const u8 *, int)' {aka 'int (*)(unsigned int,  const unsigned char *, int)'} from incompatible pointer type 'int (*)(uint32_t,  const char *, int)' {aka 'int (*)(unsigned int,  const char *, int)'} [-Werror=incompatible-pointer-types]
     144 |         .put_chars = hvc_opal_hvsi_put_chars,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/hvc/hvc_opal.c:144:22: note: (near initialization for 'hvc_opal_hvsi_ops.put_chars')
   cc1: some warnings being treated as errors


vim +143 drivers/tty/hvc/hvc_opal.c

daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  141  
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  142  static const struct hv_ops hvc_opal_hvsi_ops = {
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19 @143  	.get_chars = hvc_opal_hvsi_get_chars,
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19 @144  	.put_chars = hvc_opal_hvsi_put_chars,
95b861a76c1ded Nicholas Piggin        2018-05-01  145  	.flush = opal_flush_chars,
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  146  	.notifier_add = hvc_opal_hvsi_open,
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  147  	.notifier_del = hvc_opal_hvsi_close,
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  148  	.notifier_hangup = hvc_opal_hvsi_hangup,
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  149  	.tiocmget = hvc_opal_hvsi_tiocmget,
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  150  	.tiocmset = hvc_opal_hvsi_tiocmset,
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  151  };
daea1175a9f0f7 Benjamin Herrenschmidt 2011-09-19  152  

:::::: The code at line 143 was first introduced by commit
:::::: daea1175a9f0f70eab5b33e2827d57ba8c686816 powerpc/powernv: Support for OPAL console

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DDE1548D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693308130; x=1724844130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zkDkclzueS6l6eQevHCyYzRZcOnG8PoLaR99RmbkANw=;
  b=Ujxw8soKK+JSvbD7NN+OnrVDBXdTodbldOF42xrG+621a+5BcnUdT+hw
   aSL2ZSBDq4AtOcdR2MV7ExCjFrlRukNYn0agIJ+mQRBDqi4Ffi/g0eSR2
   uGlHqBFqqm6o4K/yN4XIxNsrPnjckRsM5o/4EfByITE7C/4b6ySqEBr4D
   kGO0aBk2q8s6WEyy2ETG4Q91oRp8cdGhIOn3mYt7kxe4UgRADzK6uKffs
   fFaeIzoidMhhAfFiqNyc2ZmJAUYjOENdNYYLEsYZF3lcSvBdBayQHGMKG
   rDhQOhPnyE6JcnWarGsXZOKfmw6vkiuFZwnMrKea0QNoTY4xqjYe1u7Oi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="406336458"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="406336458"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 04:22:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="804074967"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="804074967"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2023 04:22:06 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qawnO-0008gh-00;
	Tue, 29 Aug 2023 11:22:06 +0000
Date: Tue, 29 Aug 2023 19:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 1/4] nvmet-trace: avoid dereferencing pointer too early
Message-ID: <202308291952.LKh4QF9k-lkp@intel.com>
References: <20230829091350.16156-2-dwagner@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829091350.16156-2-dwagner@suse.de>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on hch-configfs/for-next]
[also build test WARNING on linus/master v6.5 next-20230829]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Wagner/nvmet-trace-avoid-dereferencing-pointer-too-early/20230829-171734
base:   git://git.infradead.org/users/hch/configfs.git for-next
patch link:    https://lore.kernel.org/r/20230829091350.16156-2-dwagner%40suse.de
patch subject: [RFC v1 1/4] nvmet-trace: avoid dereferencing pointer too early
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230829/202308291952.LKh4QF9k-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291952.LKh4QF9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291952.LKh4QF9k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/target/trace.c:214:13: warning: no previous prototype for 'nvmet_trace_ctrl_name' [-Wmissing-prototypes]
     214 | const char *nvmet_trace_ctrl_name(struct trace_seq *p, struct nvmet_ctrl *ctrl)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/nvmet_trace_ctrl_name +214 drivers/nvme/target/trace.c

a5448fdc469d67 Minwoo Im 2019-06-12  213  
a5448fdc469d67 Minwoo Im 2019-06-12 @214  const char *nvmet_trace_ctrl_name(struct trace_seq *p, struct nvmet_ctrl *ctrl)
a5448fdc469d67 Minwoo Im 2019-06-12  215  {
a5448fdc469d67 Minwoo Im 2019-06-12  216  	const char *ret = trace_seq_buffer_ptr(p);
a5448fdc469d67 Minwoo Im 2019-06-12  217  
a5448fdc469d67 Minwoo Im 2019-06-12  218  	/*
a5448fdc469d67 Minwoo Im 2019-06-12  219  	 * XXX: We don't know the controller instance before executing the
a5448fdc469d67 Minwoo Im 2019-06-12  220  	 * connect command itself because the connect command for the admin
a5448fdc469d67 Minwoo Im 2019-06-12  221  	 * queue will not provide the cntlid which will be allocated in this
a5448fdc469d67 Minwoo Im 2019-06-12  222  	 * command.  In case of io queues, the controller instance will be
a5448fdc469d67 Minwoo Im 2019-06-12  223  	 * mapped by the extra data of the connect command.
a5448fdc469d67 Minwoo Im 2019-06-12  224  	 * If we can know the extra data of the connect command in this stage,
a5448fdc469d67 Minwoo Im 2019-06-12  225  	 * we can update this print statement later.
a5448fdc469d67 Minwoo Im 2019-06-12  226  	 */
a5448fdc469d67 Minwoo Im 2019-06-12  227  	if (ctrl)
a5448fdc469d67 Minwoo Im 2019-06-12  228  		trace_seq_printf(p, "%d", ctrl->cntlid);
a5448fdc469d67 Minwoo Im 2019-06-12  229  	else
a5448fdc469d67 Minwoo Im 2019-06-12  230  		trace_seq_printf(p, "_");
a5448fdc469d67 Minwoo Im 2019-06-12  231  	trace_seq_putc(p, 0);
a5448fdc469d67 Minwoo Im 2019-06-12  232  
a5448fdc469d67 Minwoo Im 2019-06-12  233  	return ret;
a5448fdc469d67 Minwoo Im 2019-06-12  234  }
a5448fdc469d67 Minwoo Im 2019-06-12  235  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

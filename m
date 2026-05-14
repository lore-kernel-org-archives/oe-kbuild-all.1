Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F8F3C9453
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 21:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793840; cv=none; b=p+dFoQ1PgmB8qNm6U/XUmHn/nJxpXhi6aAs+6/sChn5X3TY8P9/8TT9+rZkbfYKmp21CDl9xjwT3Bat84VKtivTAhyZwY1r8kUJAok0OAEdf/Q8tj16QIQis/CSRq4bzV2qrmDiEuEFC4vHtOihuFpy+vPCGYnJV/+b7dK813Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793840; c=relaxed/simple;
	bh=XaHBRgXVHL+fP/Xs/C96bJL6IiRPq1lht1sMUxRle04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+/P1YaphLwYFPX+/KS9PqUSpppx8Kom7xxM/N2o+u4y/Qjaf+uI+mhA0tBe0qQ6ivIeerGPjK/trChN4acjZmVOiklUqbyFOhOEYXPwBJjjpOxU3blhQE1+mSx1mpi0DladUzWge4PP3PS6Yv7u4sbDiErg3eXQG4WuXFi5Ptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bD3Z0atE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bD3Z0atE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778793838; x=1810329838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XaHBRgXVHL+fP/Xs/C96bJL6IiRPq1lht1sMUxRle04=;
  b=bD3Z0atEB/WQC3tXfwXxerq4Zvb63QWdr0q2beDTYeICHtKl/iqOw1g/
   APGWWxrGX+gfJPu76cW1uEJuCBQUpKLU5ZyYJ5jeSwJ4P3XJGEC3ZeR6c
   ELrrV66Uz8IHMpdfzXlwO08EDaVdIqYAS2VbxNBm4l6+ln9gCio1VTsPf
   apt+mW1pCRWvAbIP1fGiG6nITMJmVyfbwuU3Sdnm4J4p8uh034yU0J5+s
   GWb4q39IUIpK6KPhsSCxbq1SgM6ElJt8428S6OStJBTkTwW0RKdemjxfF
   uRrPzRsHO+VulVW/9Jxp+4SiHLRXQcqOChfWdh0tyoGnqh5hGPDTYpyYe
   g==;
X-CSE-ConnectionGUID: Kt3Cz7iRRdWxIa8PvCVTkw==
X-CSE-MsgGUID: 2CgdVLLtS2m1NgrngN56mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79603430"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79603430"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 14:23:53 -0700
X-CSE-ConnectionGUID: uDi3XdyRSYOKsoe/IcjnZg==
X-CSE-MsgGUID: Q/g3AHWWSJeGSZaeYh4qwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235458898"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 14:23:50 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNdX2-00000000015-0Rj6;
	Thu, 14 May 2026 21:23:48 +0000
Date: Fri, 15 May 2026 04:42:01 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Chavan <roheetchavan@gmail.com>, kbusch@kernel.org,
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rohit Chavan <roheetchavan@gmail.com>
Subject: Re: [PATCH] nvme: use str_enabled_disabled() for digest mismatch
 messages
Message-ID: <202605150416.4egCVwkx-lkp@intel.com>
References: <20260504123555.1741525-1-roheetchavan@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504123555.1741525-1-roheetchavan@gmail.com>

Hi Rohit,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[cannot apply to linux-nvme/for-next hch-configfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rohit-Chavan/nvme-use-str_enabled_disabled-for-digest-mismatch-messages/20260514-220734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260504123555.1741525-1-roheetchavan%40gmail.com
patch subject: [PATCH] nvme: use str_enabled_disabled() for digest mismatch messages
config: arm64-randconfig-004-20260515 (https://download.01.org/0day-ci/archive/20260515/202605150416.4egCVwkx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150416.4egCVwkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150416.4egCVwkx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/nvme/host/tcp.c: In function 'nvme_tcp_init_connection':
>> drivers/nvme/host/tcp.c:3089:26: error: unterminated argument list invoking macro "pr_err"
    3089 | MODULE_ALIAS("nvme-tcp");
         |                          ^
>> drivers/nvme/host/tcp.c:1576:17: error: 'pr_err' undeclared (first use in this function); did you mean 'xa_err'?
    1576 |                 pr_err("queue %d: header digest mismatch host: %s ctrl: %s\n",
         |                 ^~~~~~
         |                 xa_err
   drivers/nvme/host/tcp.c:1576:17: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/nvme/host/tcp.c:1576:23: error: expected ';' at end of input
    1576 |                 pr_err("queue %d: header digest mismatch host: %s ctrl: %s\n",
         |                       ^
         |                       ;
   ......
>> drivers/nvme/host/tcp.c:1576:17: error: expected declaration or statement at end of input
    1576 |                 pr_err("queue %d: header digest mismatch host: %s ctrl: %s\n",
         |                 ^~~~~~
>> drivers/nvme/host/tcp.c:1576:17: error: expected declaration or statement at end of input
>> drivers/nvme/host/tcp.c:1570:17: error: label 'free_icresp' used but not defined
    1570 |                 goto free_icresp;
         |                 ^~~~
>> drivers/nvme/host/tcp.c:1493:17: error: label 'free_icreq' used but not defined
    1493 |                 goto free_icreq;
         |                 ^~~~
>> drivers/nvme/host/tcp.c:1483:13: warning: unused variable 'maxh2cdata' [-Wunused-variable]
    1483 |         u32 maxh2cdata;
         |             ^~~~~~~~~~
   At top level:
>> drivers/nvme/host/tcp.c:1474:12: warning: 'nvme_tcp_init_connection' defined but not used [-Wunused-function]
    1474 | static int nvme_tcp_init_connection(struct nvme_tcp_queue *queue)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/tcp.c:1438:13: warning: 'nvme_tcp_free_queue' defined but not used [-Wunused-function]
    1438 | static void nvme_tcp_free_queue(struct nvme_ctrl *nctrl, int qid)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/tcp.c:1422:12: warning: 'nvme_tcp_alloc_async_req' defined but not used [-Wunused-function]
    1422 | static int nvme_tcp_alloc_async_req(struct nvme_tcp_ctrl *ctrl)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/tcp.c:1415:13: warning: 'nvme_tcp_free_async_req' defined but not used [-Wunused-function]
    1415 | static void nvme_tcp_free_async_req(struct nvme_tcp_ctrl *ctrl)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/tcp.c:1377:13: warning: 'nvme_tcp_io_work' defined but not used [-Wunused-function]
    1377 | static void nvme_tcp_io_work(struct work_struct *w)
         |             ^~~~~~~~~~~~~~~~
>> drivers/nvme/host/tcp.c:1094:13: warning: 'nvme_tcp_state_change' defined but not used [-Wunused-function]
    1094 | static void nvme_tcp_state_change(struct sock *sk)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/tcp.c:1078:13: warning: 'nvme_tcp_write_space' defined but not used [-Wunused-function]
    1078 | static void nvme_tcp_write_space(struct sock *sk)
         |             ^~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/tcp.c:1064:13: warning: 'nvme_tcp_data_ready' defined but not used [-Wunused-function]
    1064 | static void nvme_tcp_data_ready(struct sock *sk)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/tcp.c:587:12: warning: 'nvme_tcp_init_admin_hctx' defined but not used [-Wunused-function]
     587 | static int nvme_tcp_init_admin_hctx(struct blk_mq_hw_ctx *hctx, void *data,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/tcp.c:577:12: warning: 'nvme_tcp_init_hctx' defined but not used [-Wunused-function]
     577 | static int nvme_tcp_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/tcp.c:550:12: warning: 'nvme_tcp_init_request' defined but not used [-Wunused-function]
     550 | static int nvme_tcp_init_request(struct blk_mq_tag_set *set,
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/tcp.c:542:13: warning: 'nvme_tcp_exit_request' defined but not used [-Wunused-function]
     542 | static void nvme_tcp_exit_request(struct blk_mq_tag_set *set,
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:208:32: warning: 'nvme_tcp_admin_mq_ops' defined but not used [-Wunused-const-variable=]
     208 | static const struct blk_mq_ops nvme_tcp_admin_mq_ops;
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:207:32: warning: 'nvme_tcp_mq_ops' defined but not used [-Wunused-const-variable=]
     207 | static const struct blk_mq_ops nvme_tcp_mq_ops;
         |                                ^~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:70:13: warning: 'nvme_tcp_reclassify_socket' defined but not used [-Wunused-function]
      70 | static void nvme_tcp_reclassify_socket(struct socket *sock)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:58:17: warning: 'nvme_tcp_cpu_queues' defined but not used [-Wunused-variable]
      58 | static atomic_t nvme_tcp_cpu_queues[NR_CPUS];
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:51:12: warning: 'tls_handshake_timeout' defined but not used [-Wunused-variable]
      51 | static int tls_handshake_timeout = 10;
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/pr_err +3089 drivers/nvme/host/tcp.c

3f2304f8c6d6ed Sagi Grimberg      2018-12-03  3086  
92b0b0ff0ba32e Chaitanya Kulkarni 2024-01-23  3087  MODULE_DESCRIPTION("NVMe host TCP transport driver");
3f2304f8c6d6ed Sagi Grimberg      2018-12-03  3088  MODULE_LICENSE("GPL v2");
723277b15ed971 Geliang Tang       2026-03-31 @3089  MODULE_ALIAS("nvme-tcp");

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

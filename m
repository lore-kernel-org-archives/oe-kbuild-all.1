Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489603C3BF7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 21:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793839; cv=none; b=gTPDlLQnv9eVF4sl2gQUo1kaj2D6piDbjuDUvYD8CwQ8UUGAuFrB7NY3CEg3PV4FMVohVbhYnFw7Hrv0ojUQIyla0XOg3L6PMAJKR2kIBcWIKMI46N8yZb3VdQCZv6wJYokRZpfTFA8a1dcOKCeiyO3dvOGvtaXMigRnxasMzwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793839; c=relaxed/simple;
	bh=0vTmSUvIn9x/CcPFXAKAy9pKtnnMg1I+WS1UKjBO+Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oz+Mrrrs9h6ZYE/r3ps0Bg4uSWoQpHXXo9hKyqRw32WfvOyQpOXB0uo3ocsZyUas5qoNCRVo1wv8ri7xnudUEHvgoZ6hKGJQcv+7p1qMSbPs/IzitfSgahrC9TKdzROjqXusH3Jh6k0jmQaqof0KSA1QkRXzMY49IO5F6tEGvXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGoCX/wi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGoCX/wi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778793837; x=1810329837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0vTmSUvIn9x/CcPFXAKAy9pKtnnMg1I+WS1UKjBO+Zc=;
  b=TGoCX/wichV/V0R00KrSbBkRvsreGw9q4sFHKlvfISvW7IY0EAfM0x5F
   W5ZA5p3y4lWW2eWocfMeWhT9N2SSNylrMgfCadxRSRRMh4W6243aHg7Lh
   x+JliyphmYrMzQZvuyNziAqSG/1iU/C8YczLQ3psOmQcXoU+2TQ9bwORq
   eqq+0DhynicXyfWidN+CealI/bcRx6FcxAzoEROwJjOP+jcWwC5lmZjzh
   SpfRGAAm4gPbctU8XvYFa6IjfmL7vx7xNHcchxgtCek1UmOh6KWHrT29o
   jl1AjRkmemKS01ifLCtQl9Qj51xGdTOGsOQE+0KPa15vOldRkj0WQmKMN
   A==;
X-CSE-ConnectionGUID: iytpt6niSx2t/B53X5fPXg==
X-CSE-MsgGUID: ulhtaM84RwixXH82iKkpgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79603416"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79603416"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 14:23:53 -0700
X-CSE-ConnectionGUID: yn7ihXaWQOuY/dLmp7hUow==
X-CSE-MsgGUID: iWj2PQ3fQ6+Ap86UUZQvRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235458897"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 14:23:50 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNdX1-00000000013-3a1z;
	Thu, 14 May 2026 21:23:47 +0000
Date: Fri, 15 May 2026 04:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Chavan <roheetchavan@gmail.com>, kbusch@kernel.org,
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rohit Chavan <roheetchavan@gmail.com>
Subject: Re: [PATCH] nvme: use str_enabled_disabled() for digest mismatch
 messages
Message-ID: <202605150441.5HXklwvg-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe/for-next]
[also build test WARNING on linus/master v7.1-rc3 next-20260508]
[cannot apply to linux-nvme/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rohit-Chavan/nvme-use-str_enabled_disabled-for-digest-mismatch-messages/20260514-220734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260504123555.1741525-1-roheetchavan%40gmail.com
patch subject: [PATCH] nvme: use str_enabled_disabled() for digest mismatch messages
config: powerpc64-randconfig-001-20260515 (https://download.01.org/0day-ci/archive/20260515/202605150441.5HXklwvg-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150441.5HXklwvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150441.5HXklwvg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/host/tcp.c: In function 'nvme_tcp_init_connection':
   drivers/nvme/host/tcp.c:3089:26: error: unterminated argument list invoking macro "pr_err"
    3089 | MODULE_ALIAS("nvme-tcp");
         |                          ^
   drivers/nvme/host/tcp.c:1576:17: error: 'pr_err' undeclared (first use in this function); did you mean 'xa_err'?
    1576 |                 pr_err("queue %d: header digest mismatch host: %s ctrl: %s\n",
         |                 ^~~~~~
         |                 xa_err
   drivers/nvme/host/tcp.c:1576:17: note: each undeclared identifier is reported only once for each function it appears in
   drivers/nvme/host/tcp.c:1576:23: error: expected ';' at end of input
    1576 |                 pr_err("queue %d: header digest mismatch host: %s ctrl: %s\n",
         |                       ^
         |                       ;
   ......
   drivers/nvme/host/tcp.c:1576:17: error: expected declaration or statement at end of input
    1576 |                 pr_err("queue %d: header digest mismatch host: %s ctrl: %s\n",
         |                 ^~~~~~
   drivers/nvme/host/tcp.c:1576:17: error: expected declaration or statement at end of input
   drivers/nvme/host/tcp.c:1570:17: error: label 'free_icresp' used but not defined
    1570 |                 goto free_icresp;
         |                 ^~~~
   drivers/nvme/host/tcp.c:1493:17: error: label 'free_icreq' used but not defined
    1493 |                 goto free_icreq;
         |                 ^~~~
   drivers/nvme/host/tcp.c:1483:13: warning: unused variable 'maxh2cdata' [-Wunused-variable]
    1483 |         u32 maxh2cdata;
         |             ^~~~~~~~~~
   drivers/nvme/host/tcp.c: At top level:
   drivers/nvme/host/tcp.c:1474:12: warning: 'nvme_tcp_init_connection' defined but not used [-Wunused-function]
    1474 | static int nvme_tcp_init_connection(struct nvme_tcp_queue *queue)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1438:13: warning: 'nvme_tcp_free_queue' defined but not used [-Wunused-function]
    1438 | static void nvme_tcp_free_queue(struct nvme_ctrl *nctrl, int qid)
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1422:12: warning: 'nvme_tcp_alloc_async_req' defined but not used [-Wunused-function]
    1422 | static int nvme_tcp_alloc_async_req(struct nvme_tcp_ctrl *ctrl)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1415:13: warning: 'nvme_tcp_free_async_req' defined but not used [-Wunused-function]
    1415 | static void nvme_tcp_free_async_req(struct nvme_tcp_ctrl *ctrl)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1377:13: warning: 'nvme_tcp_io_work' defined but not used [-Wunused-function]
    1377 | static void nvme_tcp_io_work(struct work_struct *w)
         |             ^~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1094:13: warning: 'nvme_tcp_state_change' defined but not used [-Wunused-function]
    1094 | static void nvme_tcp_state_change(struct sock *sk)
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1078:13: warning: 'nvme_tcp_write_space' defined but not used [-Wunused-function]
    1078 | static void nvme_tcp_write_space(struct sock *sk)
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1064:13: warning: 'nvme_tcp_data_ready' defined but not used [-Wunused-function]
    1064 | static void nvme_tcp_data_ready(struct sock *sk)
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:587:12: warning: 'nvme_tcp_init_admin_hctx' defined but not used [-Wunused-function]
     587 | static int nvme_tcp_init_admin_hctx(struct blk_mq_hw_ctx *hctx, void *data,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:577:12: warning: 'nvme_tcp_init_hctx' defined but not used [-Wunused-function]
     577 | static int nvme_tcp_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
         |            ^~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:550:12: warning: 'nvme_tcp_init_request' defined but not used [-Wunused-function]
     550 | static int nvme_tcp_init_request(struct blk_mq_tag_set *set,
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:542:13: warning: 'nvme_tcp_exit_request' defined but not used [-Wunused-function]
     542 | static void nvme_tcp_exit_request(struct blk_mq_tag_set *set,
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:208:32: warning: 'nvme_tcp_admin_mq_ops' defined but not used [-Wunused-const-variable=]
     208 | static const struct blk_mq_ops nvme_tcp_admin_mq_ops;
         |                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:207:32: warning: 'nvme_tcp_mq_ops' defined but not used [-Wunused-const-variable=]
     207 | static const struct blk_mq_ops nvme_tcp_mq_ops;
         |                                ^~~~~~~~~~~~~~~
   In file included from include/linux/seqlock.h:20,
                    from include/linux/mmzone.h:17,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/nvme/host/tcp.c:7:
>> drivers/nvme/host/tcp.c:205:21: warning: 'nvme_tcp_ctrl_mutex' defined but not used [-Wunused-variable]
     205 | static DEFINE_MUTEX(nvme_tcp_ctrl_mutex);
         |                     ^~~~~~~~~~~~~~~~~~~
   include/linux/mutex.h:87:22: note: in definition of macro 'DEFINE_MUTEX'
      87 |         struct mutex mutexname = __MUTEX_INITIALIZER(mutexname)
         |                      ^~~~~~~~~
   drivers/nvme/host/tcp.c:95:13: warning: 'nvme_tcp_reclassify_socket' defined but not used [-Wunused-function]
      95 | static void nvme_tcp_reclassify_socket(struct socket *sock) { }
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:58:17: warning: 'nvme_tcp_cpu_queues' defined but not used [-Wunused-variable]
      58 | static atomic_t nvme_tcp_cpu_queues[NR_CPUS];
         |                 ^~~~~~~~~~~~~~~~~~~


vim +/nvme_tcp_ctrl_mutex +205 drivers/nvme/host/tcp.c

3f2304f8c6d6ed Sagi Grimberg    2018-12-03  203  
3f2304f8c6d6ed Sagi Grimberg    2018-12-03  204  static LIST_HEAD(nvme_tcp_ctrl_list);
3f2304f8c6d6ed Sagi Grimberg    2018-12-03 @205  static DEFINE_MUTEX(nvme_tcp_ctrl_mutex);
3f2304f8c6d6ed Sagi Grimberg    2018-12-03  206  static struct workqueue_struct *nvme_tcp_wq;
6acbd9619b153f Rikard Falkeborn 2020-05-29  207  static const struct blk_mq_ops nvme_tcp_mq_ops;
6acbd9619b153f Rikard Falkeborn 2020-05-29  208  static const struct blk_mq_ops nvme_tcp_admin_mq_ops;
db5ad6b7f8cdd6 Sagi Grimberg    2020-05-01  209  static int nvme_tcp_try_send(struct nvme_tcp_queue *queue);
3f2304f8c6d6ed Sagi Grimberg    2018-12-03  210  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

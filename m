Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C28182DE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 19:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxUqwXdC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697310269; x=1728846269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JVh4beN/PGmczxg/mcIGLXxPeOZgNEZ/gXdMdVDkf2U=;
  b=VxUqwXdCMRQdWYmRE6qF8hPNBxaeLZXF4Htx4a2hgkrhrIVC4rw6LE8p
   Q33saa7lGtXyzA/U5F3VB/EExYhxUX8yW8ENdP9vCgOz9U1SSUiDEpnU7
   qg1L7HjEtmkxvmxrD+rgnmYRK+gVKy1HxnLE40adl7Av79ZPaCI9shqy4
   qJGsQqc5kRs0PwOYNJHt0Y4GHYrcF8CTtPB4P23xEtelcekscfVu/ttln
   pmJXMtzcw21RpsEl9E4usA+VNRCT03AOlqCiGCt8fJR87QGPlrW754MQe
   9JnhEM+bdjElwbh2yxX3oIvXMcbZqXbGBUv6EIv03o9TTqnA71lWS4Q8e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375695385"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="375695385"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 12:04:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825441779"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="825441779"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Oct 2023 12:04:27 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrjw1-0006Xj-1a;
	Sat, 14 Oct 2023 19:04:25 +0000
Date: Sun, 15 Oct 2023 03:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1005/1018] include/linux/io_uring.h:126: multiple
 definition of `io_zc_rx_put_buf';
 kernel/fork.o:include/linux/io_uring.h:126: first defined here
Message-ID: <202310150234.HkLMAivC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: af0d7997ce7db79cf67af9211e630ac1b95a3924 [1005/1018] io_uring: add ZC pool API
config: i386-randconfig-004-20231014 (https://download.01.org/0day-ci/archive/20231015/202310150234.HkLMAivC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150234.HkLMAivC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150234.HkLMAivC-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/exit.o: in function `io_zc_rx_put_buf':
>> include/linux/io_uring.h:126: multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:include/linux/io_uring.h:126: first defined here
   ld: fs/exec.o: in function `io_zc_rx_put_buf':
>> include/linux/io_uring.h:126: multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:include/linux/io_uring.h:126: first defined here
   ld: net/socket.o: in function `io_zc_rx_put_buf':
>> include/linux/io_uring.h:126: multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:include/linux/io_uring.h:126: first defined here
   ld: net/unix/scm.o: in function `io_zc_rx_put_buf':
>> include/linux/io_uring.h:126: multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:include/linux/io_uring.h:126: first defined here


vim +126 include/linux/io_uring.h

    72	
    73	struct io_zc_rx_ifq;
    74	struct io_zc_rx_buf *io_zc_rx_get_buf(struct io_zc_rx_ifq *ifq);
    75	void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf);
    76	static inline dma_addr_t io_zc_rx_buf_dma(struct io_zc_rx_buf *buf)
    77	{
    78		return buf->dma;
    79	}
    80	static inline struct page *io_zc_rx_buf_page(struct io_zc_rx_buf *buf)
    81	{
    82		return buf->page;
    83	}
    84	static inline void io_uring_files_cancel(void)
    85	{
    86		if (current->io_uring) {
    87			io_uring_unreg_ringfd();
    88			__io_uring_cancel(false);
    89		}
    90	}
    91	static inline void io_uring_task_cancel(void)
    92	{
    93		if (current->io_uring)
    94			__io_uring_cancel(true);
    95	}
    96	static inline void io_uring_free(struct task_struct *tsk)
    97	{
    98		if (tsk->io_uring)
    99			__io_uring_free(tsk);
   100	}
   101	int io_uring_cmd_sock(struct io_uring_cmd *cmd, unsigned int issue_flags);
   102	#else
   103	static inline int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
   104				      struct iov_iter *iter, void *ioucmd)
   105	{
   106		return -EOPNOTSUPP;
   107	}
   108	static inline void io_uring_cmd_done(struct io_uring_cmd *cmd, ssize_t ret,
   109			ssize_t ret2, unsigned issue_flags)
   110	{
   111	}
   112	static inline void io_uring_cmd_complete_in_task(struct io_uring_cmd *ioucmd,
   113				void (*task_work_cb)(struct io_uring_cmd *, unsigned))
   114	{
   115	}
   116	static inline void io_uring_cmd_do_in_task_lazy(struct io_uring_cmd *ioucmd,
   117				void (*task_work_cb)(struct io_uring_cmd *, unsigned))
   118	{
   119	}
   120	static inline struct io_zc_rx_buf *io_zc_rx_get_buf(struct io_zc_rx_ifq *ifq)
   121	{
   122		return NULL;
   123	}
   124	void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf)
   125	{
 > 126	}
   127	static inline struct sock *io_uring_get_socket(struct file *file)
   128	{
   129		return NULL;
   130	}
   131	static inline void io_uring_task_cancel(void)
   132	{
   133	}
   134	static inline void io_uring_files_cancel(void)
   135	{
   136	}
   137	static inline void io_uring_free(struct task_struct *tsk)
   138	{
   139	}
   140	static inline const char *io_uring_get_opcode(u8 opcode)
   141	{
   142		return "";
   143	}
   144	static inline int io_uring_cmd_sock(struct io_uring_cmd *cmd,
   145					    unsigned int issue_flags)
   146	{
   147		return -EOPNOTSUPP;
   148	}
   149	#endif
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

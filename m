Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ABA36A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 01:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8sEjvMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697937998; x=1729473998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9UKg+Khi7KvPJ5+xFwnJPltoSDHuJGiO+ncj9xKbjzo=;
  b=l8sEjvMD0LAsd6dYrsxqQAHnmaWWDRtw8veFaCQKdFUYwLGmWB/Z2IQA
   nIigVWkkhjUVFAEGeIOjxKhiLEXl/YkrPsqZLJyQ1uxR57W1Vu2UH9ORC
   kivEeD2MHEXROpf3clurt4c8+FcE7OGNhuNo85lJXB1C89cYbmUGHuwj9
   nCmpSzDRD1yX7ZALD4ll5fTHjmucJ3kuTx3R9wsACg1aObsqjRe711VqN
   N+D4KD7akT9PAynSmh5tDhO9tOK+o73I3NcXfQC+hK8LC1dz1BoqJSLku
   3ojftqfL4DVyQImvnjy8RhQcg9FfYwSY1AWmVj0w1smlwoN/D+EmMSSVY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="386491834"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="386491834"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 18:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="757808022"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="757808022"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Oct 2023 18:26:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quNEf-0005SO-0R;
	Sun, 22 Oct 2023 01:26:33 +0000
Date: Sun, 22 Oct 2023 09:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/veth2 7/16] include/linux/io_uring.h:124:6: warning: no
 previous declaration for 'io_zc_rx_put_buf'
Message-ID: <202310220906.g1FqayXe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth2
head:   731b7375c43d08e971bcafcd9e90c1c0c8250678
commit: 799c9d0a8571dffc38eedd92abd520bb811b412a [7/16] io_uring: add ZC pool API
config: x86_64-randconfig-013-20231022 (https://download.01.org/0day-ci/archive/20231022/202310220906.g1FqayXe-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220906.g1FqayXe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220906.g1FqayXe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/unix/scm.c:11:0:
>> include/linux/io_uring.h:124:6: warning: no previous declaration for 'io_zc_rx_put_buf' [-Wmissing-declarations]
    void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf)
         ^~~~~~~~~~~~~~~~
--
   In file included from net/socket.c:91:0:
>> include/linux/io_uring.h:124:6: warning: no previous declaration for 'io_zc_rx_put_buf' [-Wmissing-declarations]
    void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf)
         ^~~~~~~~~~~~~~~~
   net/socket.c:1696:21: warning: no previous declaration for 'update_socket_protocol' [-Wmissing-declarations]
    __weak noinline int update_socket_protocol(int family, int type, int protocol)
                        ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/exec.c:64:0:
   include/linux/io_uring.h:120:60: warning: 'struct io_zc_rx_ifq' declared inside parameter list will not be visible outside of this definition or declaration
    static inline struct io_zc_rx_buf *io_zc_rx_get_buf(struct io_zc_rx_ifq *ifq)
                                                               ^~~~~~~~~~~~
   include/linux/io_uring.h:124:30: warning: 'struct io_zc_rx_ifq' declared inside parameter list will not be visible outside of this definition or declaration
    void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf)
                                 ^~~~~~~~~~~~
>> include/linux/io_uring.h:124:6: warning: no previous declaration for 'io_zc_rx_put_buf' [-Wmissing-declarations]
    void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf)
         ^~~~~~~~~~~~~~~~


vim +/io_zc_rx_put_buf +124 include/linux/io_uring.h

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
 > 124	void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf)
   125	{
   126	}
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

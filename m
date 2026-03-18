Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F4C204F93
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 03:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773805586; cv=none; b=MXXOqO5TjB/6nxE6Xm4fOMp1mb8a8gyVtv2FlSTIRupblKZMlEsQ1wvobATS/FJFE6wQuIsxGTwkQGdQ8OybXDoVd+IiLjgN+O+Wx2pTtEjKK1HSBz+07HCbDdAO8VmtLtsQ/7A+ijDDrlP4MigRB7sqj2NwDKFJ9s9KrrE0lDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773805586; c=relaxed/simple;
	bh=Dr8P1Jnj/bp1CjRpY3cSnhdOQPeAi0/GEGISjfqouOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iltXES8BlvwwzjYPt+2lwHwk59tv+XLFyZdFTepBHeo8lUljp4PztkV+usCEXNZ5BCVGL71X32yZRAf3FXPFWbuDhQsjGZVNauXa07O9yqAUNt4WHwQ0rQlwFqTE6/Bfa1XdGZ05If/KOUIJ+oJLKKjwsJX1HQ2oNdToaRN5+tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqhoKlPR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqhoKlPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773805584; x=1805341584;
  h=date:from:to:cc:subject:message-id;
  bh=Dr8P1Jnj/bp1CjRpY3cSnhdOQPeAi0/GEGISjfqouOs=;
  b=FqhoKlPR7RhhslcsnvhOE45xdXF8Ahkv2Wze7A0DYa6nORf3c0PC3S39
   eIEz4VbYVUFbUWPvClGJiMG0DxlXw9q+YPgd+LX5apdkdvHDHq4y3f5XT
   IoX/VHmwRl1aiMtNJWEFK/3xcpny0OqgAZlJnZKEFh9qVypHw6A7+gCkt
   CctFdFLCtxA5spLzYD2HeZmjgueQKTRVyxajtqAVxLncVjWQe9ru6ZpqA
   QBqyJoW4uFe3JWyAV/TUB6zi23CPcamTvXgN5WspNx7o0N1mULm1ZbyO1
   I6fywyt93rvmIXwLfnTXhPw4Rc9HWD/Pk2z4mtK4GMMB9SFA0b+i7afSA
   w==;
X-CSE-ConnectionGUID: AYcrPmTUR5Ke7/xP1AROmA==
X-CSE-MsgGUID: GZRpjq+IRbyYNqjg/mNnrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92423948"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92423948"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 20:46:21 -0700
X-CSE-ConnectionGUID: 861DUKTvRyeWyglPhFzxxg==
X-CSE-MsgGUID: dbVKxa6ORpGL/Mrku8K8zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="252948017"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Mar 2026 20:46:18 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2hrM-000000002Rz-05Pq;
	Wed, 18 Mar 2026 03:46:16 +0000
Date: Wed, 18 Mar 2026 11:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dk:rw_iter 416/471] drivers/sbus/char/oradax.c:217:16:
 error: 'dax_write_iter' undeclared here (not in a function); did you mean
 'vfs_write_iter'?
Message-ID: <202603181148.DHJEuFEM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.kernel.dk/linux rw_iter
head:   7e8e9e30f1231e9ab34d17d42798297a502683f3
commit: 1abba19b9f1ba0b7c4affe9aeec06cd924713caa [416/471] sbus: oradax: convert to read/write iterators
config: sparc64-randconfig-001-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181148.DHJEuFEM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181148.DHJEuFEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181148.DHJEuFEM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/sbus/char/oradax.c:217:16: error: 'dax_write_iter' undeclared here (not in a function); did you mean 'vfs_write_iter'?
     .write_iter = dax_write_iter,
                   ^~~~~~~~~~~~~~
                   vfs_write_iter
   In file included from include/linux/proc_fs.h:10,
                    from arch/sparc/include/asm/prom.h:18,
                    from include/linux/of.h:252,
                    from arch/sparc/include/asm/openprom.h:15,
                    from arch/sparc/include/asm/device.h:8,
                    from include/linux/device.h:34,
                    from include/linux/cdev.h:8,
                    from drivers/sbus/char/oradax.c:27:
>> drivers/sbus/char/oradax.c:639:24: warning: 'dax_write_iter' defined but not used [-Wunused-function]
    FOPS_WRITE_ITER_HELPER(dax_write);
                           ^~~~~~~~~
   include/linux/fs.h:2119:16: note: in definition of macro 'FOPS_WRITE_ITER_HELPER'
    static ssize_t name## _iter(struct kiocb *iocb, struct iov_iter *from) \
                   ^~~~


vim +217 drivers/sbus/char/oradax.c

  > 27	#include <linux/cdev.h>
    28	#include <linux/slab.h>
    29	#include <linux/mm.h>
    30	
    31	#include <asm/hypervisor.h>
    32	#include <asm/mdesc.h>
    33	#include <asm/oradax.h>
    34	
    35	MODULE_LICENSE("GPL");
    36	MODULE_DESCRIPTION("Driver for Oracle Data Analytics Accelerator");
    37	
    38	#define	DAX_DBG_FLG_BASIC	0x01
    39	#define	DAX_DBG_FLG_STAT	0x02
    40	#define	DAX_DBG_FLG_INFO	0x04
    41	#define	DAX_DBG_FLG_ALL		0xff
    42	
    43	#define	dax_err(fmt, ...)      pr_err("%s: " fmt "\n", __func__, ##__VA_ARGS__)
    44	#define	dax_info(fmt, ...)     pr_info("%s: " fmt "\n", __func__, ##__VA_ARGS__)
    45	
    46	#define	dax_dbg(fmt, ...)	do {					\
    47						if (dax_debug & DAX_DBG_FLG_BASIC)\
    48							dax_info(fmt, ##__VA_ARGS__); \
    49					} while (0)
    50	#define	dax_stat_dbg(fmt, ...)	do {					\
    51						if (dax_debug & DAX_DBG_FLG_STAT) \
    52							dax_info(fmt, ##__VA_ARGS__); \
    53					} while (0)
    54	#define	dax_info_dbg(fmt, ...)	do { \
    55						if (dax_debug & DAX_DBG_FLG_INFO) \
    56							dax_info(fmt, ##__VA_ARGS__); \
    57					} while (0)
    58	
    59	#define	DAX1_MINOR		1
    60	#define	DAX1_MAJOR		1
    61	#define	DAX2_MINOR		0
    62	#define	DAX2_MAJOR		2
    63	
    64	#define	DAX1_STR    "ORCL,sun4v-dax"
    65	#define	DAX2_STR    "ORCL,sun4v-dax2"
    66	
    67	#define	DAX_CA_ELEMS		(DAX_MMAP_LEN / sizeof(struct dax_cca))
    68	
    69	#define	DAX_CCB_USEC		100
    70	#define	DAX_CCB_RETRIES		10000
    71	
    72	/* stream types */
    73	enum {
    74		OUT,
    75		PRI,
    76		SEC,
    77		TBL,
    78		NUM_STREAM_TYPES
    79	};
    80	
    81	/* completion status */
    82	#define	CCA_STAT_NOT_COMPLETED	0
    83	#define	CCA_STAT_COMPLETED	1
    84	#define	CCA_STAT_FAILED		2
    85	#define	CCA_STAT_KILLED		3
    86	#define	CCA_STAT_NOT_RUN	4
    87	#define	CCA_STAT_PIPE_OUT	5
    88	#define	CCA_STAT_PIPE_SRC	6
    89	#define	CCA_STAT_PIPE_DST	7
    90	
    91	/* completion err */
    92	#define	CCA_ERR_SUCCESS		0x0	/* no error */
    93	#define	CCA_ERR_OVERFLOW	0x1	/* buffer overflow */
    94	#define	CCA_ERR_DECODE		0x2	/* CCB decode error */
    95	#define	CCA_ERR_PAGE_OVERFLOW	0x3	/* page overflow */
    96	#define	CCA_ERR_KILLED		0x7	/* command was killed */
    97	#define	CCA_ERR_TIMEOUT		0x8	/* Timeout */
    98	#define	CCA_ERR_ADI		0x9	/* ADI error */
    99	#define	CCA_ERR_DATA_FMT	0xA	/* data format error */
   100	#define	CCA_ERR_OTHER_NO_RETRY	0xE	/* Other error, do not retry */
   101	#define	CCA_ERR_OTHER_RETRY	0xF	/* Other error, retry */
   102	#define	CCA_ERR_PARTIAL_SYMBOL	0x80	/* QP partial symbol warning */
   103	
   104	/* CCB address types */
   105	#define	DAX_ADDR_TYPE_NONE	0
   106	#define	DAX_ADDR_TYPE_VA_ALT	1	/* secondary context */
   107	#define	DAX_ADDR_TYPE_RA	2	/* real address */
   108	#define	DAX_ADDR_TYPE_VA	3	/* virtual address */
   109	
   110	/* dax_header_t opcode */
   111	#define	DAX_OP_SYNC_NOP		0x0
   112	#define	DAX_OP_EXTRACT		0x1
   113	#define	DAX_OP_SCAN_VALUE	0x2
   114	#define	DAX_OP_SCAN_RANGE	0x3
   115	#define	DAX_OP_TRANSLATE	0x4
   116	#define	DAX_OP_SELECT		0x5
   117	#define	DAX_OP_INVERT		0x10	/* OR with translate, scan opcodes */
   118	
   119	struct dax_header {
   120		u32 ccb_version:4;	/* 31:28 CCB Version */
   121					/* 27:24 Sync Flags */
   122		u32 pipe:1;		/* Pipeline */
   123		u32 longccb:1;		/* Longccb. Set for scan with lu2, lu3, lu4. */
   124		u32 cond:1;		/* Conditional */
   125		u32 serial:1;		/* Serial */
   126		u32 opcode:8;		/* 23:16 Opcode */
   127					/* 15:0 Address Type. */
   128		u32 reserved:3;		/* 15:13 reserved */
   129		u32 table_addr_type:2;	/* 12:11 Huffman Table Address Type */
   130		u32 out_addr_type:3;	/* 10:8 Destination Address Type */
   131		u32 sec_addr_type:3;	/* 7:5 Secondary Source Address Type */
   132		u32 pri_addr_type:3;	/* 4:2 Primary Source Address Type */
   133		u32 cca_addr_type:2;	/* 1:0 Completion Address Type */
   134	};
   135	
   136	struct dax_control {
   137		u32 pri_fmt:4;		/* 31:28 Primary Input Format */
   138		u32 pri_elem_size:5;	/* 27:23 Primary Input Element Size(less1) */
   139		u32 pri_offset:3;	/* 22:20 Primary Input Starting Offset */
   140		u32 sec_encoding:1;	/* 19    Secondary Input Encoding */
   141					/*	 (must be 0 for Select) */
   142		u32 sec_offset:3;	/* 18:16 Secondary Input Starting Offset */
   143		u32 sec_elem_size:2;	/* 15:14 Secondary Input Element Size */
   144					/*	 (must be 0 for Select) */
   145		u32 out_fmt:2;		/* 13:12 Output Format */
   146		u32 out_elem_size:2;	/* 11:10 Output Element Size */
   147		u32 misc:10;		/* 9:0 Opcode specific info */
   148	};
   149	
   150	struct dax_data_access {
   151		u64 flow_ctrl:2;	/* 63:62 Flow Control Type */
   152		u64 pipe_target:2;	/* 61:60 Pipeline Target */
   153		u64 out_buf_size:20;	/* 59:40 Output Buffer Size */
   154					/*	 (cachelines less 1) */
   155		u64 unused1:8;		/* 39:32 Reserved, Set to 0 */
   156		u64 out_alloc:5;	/* 31:27 Output Allocation */
   157		u64 unused2:1;		/* 26	 Reserved */
   158		u64 pri_len_fmt:2;	/* 25:24 Input Length Format */
   159		u64 pri_len:24;		/* 23:0  Input Element/Byte/Bit Count */
   160					/*	 (less 1) */
   161	};
   162	
   163	struct dax_ccb {
   164		struct dax_header hdr;	/* CCB Header */
   165		struct dax_control ctrl;/* Control Word */
   166		void *ca;		/* Completion Address */
   167		void *pri;		/* Primary Input Address */
   168		struct dax_data_access dac; /* Data Access Control */
   169		void *sec;		/* Secondary Input Address */
   170		u64 dword5;		/* depends on opcode */
   171		void *out;		/* Output Address */
   172		void *tbl;		/* Table Address or bitmap */
   173	};
   174	
   175	struct dax_cca {
   176		u8	status;		/* user may mwait on this address */
   177		u8	err;		/* user visible error notification */
   178		u8	rsvd[2];	/* reserved */
   179		u32	n_remaining;	/* for QP partial symbol warning */
   180		u32	output_sz;	/* output in bytes */
   181		u32	rsvd2;		/* reserved */
   182		u64	run_cycles;	/* run time in OCND2 cycles */
   183		u64	run_stats;	/* nothing reported in version 1.0 */
   184		u32	n_processed;	/* number input elements */
   185		u32	rsvd3[5];	/* reserved */
   186		u64	retval;		/* command return value */
   187		u64	rsvd4[8];	/* reserved */
   188	};
   189	
   190	/* per thread CCB context */
   191	struct dax_ctx {
   192		struct dax_ccb		*ccb_buf;
   193		u64			ccb_buf_ra;	/* cached RA of ccb_buf  */
   194		struct dax_cca		*ca_buf;
   195		u64			ca_buf_ra;	/* cached RA of ca_buf   */
   196		struct page		*pages[DAX_CA_ELEMS][NUM_STREAM_TYPES];
   197							/* array of locked pages */
   198		struct task_struct	*owner;		/* thread that owns ctx  */
   199		struct task_struct	*client;	/* requesting thread     */
   200		union ccb_result	result;
   201		u32			ccb_count;
   202		u32			fail_count;
   203	};
   204	
   205	/* driver public entry points */
   206	static int dax_open(struct inode *inode, struct file *file);
   207	static ssize_t dax_read(struct kiocb *iocb, struct iov_iter *to);
   208	static ssize_t dax_write(struct file *filp, const char __user *buf,
   209				 size_t count, loff_t *ppos);
   210	static int dax_devmap(struct file *f, struct vm_area_struct *vma);
   211	static int dax_close(struct inode *i, struct file *f);
   212	
   213	static const struct file_operations dax_fops = {
   214		.owner	=	THIS_MODULE,
   215		.open	=	dax_open,
   216		.read_iter	=	dax_read,
 > 217		.write_iter	=	dax_write_iter,
   218		.mmap	=	dax_devmap,
   219		.release =	dax_close,
   220	};
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

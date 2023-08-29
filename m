Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1437B17751
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 19:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693338949; x=1724874949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kwo/MFal0hdY02DJ6Yrj+3O0hUiPkysGWmWvSOyU7m4=;
  b=eTAsdvMt47S+WImYHtJd0uD21SLpO2wg7ujcwXW1RTbdNbu1OsqbvNdy
   4UM/QsGfWnzCCxcMvTmpR9p3xs6zNoQ5ZGhJDOKVBQ6wrNmIHhpZdQexh
   30SvZi87muzoInBuBx2Z1uQPWmUIeoIxs096OzT48hFl4oF4X1O0YfA2P
   Nw1Nup5cPwk8uy8ZJU0d558KLz+UrYdZMJoeMce+hfjgNSXuru41r9qb9
   y9GY+A+eUx2y+CkbyMvNVJs4OVgcuKmpGTW+ArkaFlnskfi8C71BdB0dy
   Olojkt01gNBsU3d3sgiPd3I2L5PF/YOhpwOKe1iYEe70jZTvI7XSHlYXo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="372876969"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="372876969"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 12:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912527635"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="912527635"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Aug 2023 12:55:46 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb4oT-00092n-2G;
	Tue, 29 Aug 2023 19:55:45 +0000
Date: Wed, 30 Aug 2023 03:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 1/4] nvmet-trace: avoid dereferencing pointer too early
Message-ID: <202308300317.0x6Otev1-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on hch-configfs/for-next]
[also build test ERROR on linus/master v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Wagner/nvmet-trace-avoid-dereferencing-pointer-too-early/20230829-171734
base:   git://git.infradead.org/users/hch/configfs.git for-next
patch link:    https://lore.kernel.org/r/20230829091350.16156-2-dwagner%40suse.de
patch subject: [RFC v1 1/4] nvmet-trace: avoid dereferencing pointer too early
config: i386-randconfig-014-20230830 (https://download.01.org/0day-ci/archive/20230830/202308300317.0x6Otev1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300317.0x6Otev1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300317.0x6Otev1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/nvme/target/core.o: in function `trace_raw_output_nvmet_req_init':
>> drivers/nvme/target/./trace.h:63: undefined reference to `nvmet_trace_ctrl_id'
   ld: drivers/nvme/target/core.o: in function `trace_raw_output_nvmet_req_complete':
   drivers/nvme/target/./trace.h:105: undefined reference to `nvmet_trace_ctrl_id'


vim +63 drivers/nvme/target/./trace.h

a5448fdc469d67 Minwoo Im          2019-06-12   62  
a5448fdc469d67 Minwoo Im          2019-06-12  @63  TRACE_EVENT(nvmet_req_init,
a5448fdc469d67 Minwoo Im          2019-06-12   64  	TP_PROTO(struct nvmet_req *req, struct nvme_command *cmd),
a5448fdc469d67 Minwoo Im          2019-06-12   65  	TP_ARGS(req, cmd),
a5448fdc469d67 Minwoo Im          2019-06-12   66  	TP_STRUCT__entry(
a5448fdc469d67 Minwoo Im          2019-06-12   67  		__field(struct nvme_command *, cmd)
954c6dd2aaf3a8 Daniel Wagner      2023-08-29   68  		__field(u16, ctrl_id)
a5448fdc469d67 Minwoo Im          2019-06-12   69  		__array(char, disk, DISK_NAME_LEN)
a5448fdc469d67 Minwoo Im          2019-06-12   70  		__field(int, qid)
a5448fdc469d67 Minwoo Im          2019-06-12   71  		__field(u16, cid)
a5448fdc469d67 Minwoo Im          2019-06-12   72  		__field(u8, opcode)
a5448fdc469d67 Minwoo Im          2019-06-12   73  		__field(u8, fctype)
a5448fdc469d67 Minwoo Im          2019-06-12   74  		__field(u8, flags)
a5448fdc469d67 Minwoo Im          2019-06-12   75  		__field(u32, nsid)
a5448fdc469d67 Minwoo Im          2019-06-12   76  		__field(u64, metadata)
a5448fdc469d67 Minwoo Im          2019-06-12   77  		__array(u8, cdw10, 24)
a5448fdc469d67 Minwoo Im          2019-06-12   78  	),
a5448fdc469d67 Minwoo Im          2019-06-12   79  	TP_fast_assign(
a5448fdc469d67 Minwoo Im          2019-06-12   80  		__entry->cmd = cmd;
954c6dd2aaf3a8 Daniel Wagner      2023-08-29   81  		__entry->ctrl_id = nvmet_req_to_ctrl_id(req);
3c3751f2daf667 Chaitanya Kulkarni 2020-10-22   82  		__assign_req_name(__entry->disk, req);
a5448fdc469d67 Minwoo Im          2019-06-12   83  		__entry->qid = req->sq->qid;
a5448fdc469d67 Minwoo Im          2019-06-12   84  		__entry->cid = cmd->common.command_id;
a5448fdc469d67 Minwoo Im          2019-06-12   85  		__entry->opcode = cmd->common.opcode;
a5448fdc469d67 Minwoo Im          2019-06-12   86  		__entry->fctype = cmd->fabrics.fctype;
a5448fdc469d67 Minwoo Im          2019-06-12   87  		__entry->flags = cmd->common.flags;
a5448fdc469d67 Minwoo Im          2019-06-12   88  		__entry->nsid = le32_to_cpu(cmd->common.nsid);
a5448fdc469d67 Minwoo Im          2019-06-12   89  		__entry->metadata = le64_to_cpu(cmd->common.metadata);
a5448fdc469d67 Minwoo Im          2019-06-12   90  		memcpy(__entry->cdw10, &cmd->common.cdw10,
a5448fdc469d67 Minwoo Im          2019-06-12   91  			sizeof(__entry->cdw10));
a5448fdc469d67 Minwoo Im          2019-06-12   92  	),
a5448fdc469d67 Minwoo Im          2019-06-12   93  	TP_printk("nvmet%s: %sqid=%d, cmdid=%u, nsid=%u, flags=%#x, "
a5448fdc469d67 Minwoo Im          2019-06-12   94  		  "meta=%#llx, cmd=(%s, %s)",
954c6dd2aaf3a8 Daniel Wagner      2023-08-29   95  		__print_ctrl_id(__entry->ctrl_id),
a5448fdc469d67 Minwoo Im          2019-06-12   96  		__print_disk_name(__entry->disk),
a5448fdc469d67 Minwoo Im          2019-06-12   97  		__entry->qid, __entry->cid, __entry->nsid,
a5448fdc469d67 Minwoo Im          2019-06-12   98  		__entry->flags, __entry->metadata,
a5448fdc469d67 Minwoo Im          2019-06-12   99  		show_opcode_name(__entry->qid, __entry->opcode,
a5448fdc469d67 Minwoo Im          2019-06-12  100  				__entry->fctype),
a5448fdc469d67 Minwoo Im          2019-06-12  101  		parse_nvme_cmd(__entry->qid, __entry->opcode,
a5448fdc469d67 Minwoo Im          2019-06-12  102  				__entry->fctype, __entry->cdw10))
a5448fdc469d67 Minwoo Im          2019-06-12  103  );
a5448fdc469d67 Minwoo Im          2019-06-12  104  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

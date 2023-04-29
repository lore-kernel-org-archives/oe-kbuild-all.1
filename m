Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C0B29AD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 12:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682772245; x=1714308245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZX3NrJaMgXeX/yi75yEHcPU7PFQYORLIsY1gHdxFhLQ=;
  b=SIr0m7B5U1yTYwDpDTcSbXYYa4PAQ5d7MZnJ33tW1sl3vDRjQh60+yiA
   AnHpJcZQ2MGcVgB4UTEf9PPVlKRSFQSlBjdS1emqBrrWrtAgSoSF0sgBV
   liiJjHJ2LJfxON9Vkt5Ju1jYT37g/uAR2lf5kr8r0OGuB6l6JDYwHCBMN
   +8WtqBAVHUZnMufq0LKod722tBVeAmP/ytg8jsiAEF0no9tB44qDw00Kd
   vE6s8QV6aLjwfmmKhchd8FHiNPmrhn6S2gzTejHP0gMsDSNFK6L6NS/N/
   OCPAql+tUropz/LFlpbw/qGGU7SaA+tytNP7RvcjBXYH1S9j7rEQghl2M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="332268511"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="332268511"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 05:44:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="645513749"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="645513749"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Apr 2023 05:44:03 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psjvm-00019D-2f;
	Sat, 29 Apr 2023 12:44:02 +0000
Date: Sat, 29 Apr 2023 20:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 10/12] nvme: submisssion/completion of uring_cmd
 to/from the registered queue
Message-ID: <202304292027.TXDcGEe2-lkp@intel.com>
References: <20230429093925.133327-11-joshi.k@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429093925.133327-11-joshi.k@samsung.com>

Hi Kanchan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master next-20230428]
[cannot apply to v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230429093925.133327-11-joshi.k%40samsung.com
patch subject: [RFC PATCH 10/12] nvme: submisssion/completion of uring_cmd to/from the registered queue
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230429/202304292027.TXDcGEe2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/e06694e83e548757cf886b603579ce384d95b3ab
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
        git checkout e06694e83e548757cf886b603579ce384d95b3ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304292027.TXDcGEe2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/nvme/host/ioctl.c: In function 'nvme_uring_cmd_io_direct':
>> drivers/nvme/host/ioctl.c:668:35: error: 'const struct blk_mq_ops' has no member named 'queue_uring_cmd'
     668 |         if (q->mq_ops && q->mq_ops->queue_uring_cmd)
         |                                   ^~
   drivers/nvme/host/ioctl.c:669:33: error: 'const struct blk_mq_ops' has no member named 'queue_uring_cmd'
     669 |                 return q->mq_ops->queue_uring_cmd(ioucmd, qid);
         |                                 ^~
   drivers/nvme/host/ioctl.c: At top level:
>> drivers/nvme/host/ioctl.c:812:5: warning: no previous prototype for 'nvme_uring_cmd_iopoll_qid' [-Wmissing-prototypes]
     812 | int nvme_uring_cmd_iopoll_qid(struct request_queue *q,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c: In function 'nvme_uring_cmd_iopoll_qid':
>> drivers/nvme/host/ioctl.c:820:37: error: 'const struct blk_mq_ops' has no member named 'poll_uring_cmd'
     820 |         if (!(q->mq_ops && q->mq_ops->poll_uring_cmd))
         |                                     ^~
   drivers/nvme/host/ioctl.c:823:32: error: 'const struct blk_mq_ops' has no member named 'poll_uring_cmd'
     823 |                 ret = q->mq_ops->poll_uring_cmd(ioucmd, qid, iob);
         |                                ^~


vim +668 drivers/nvme/host/ioctl.c

   655	
   656	static int nvme_uring_cmd_io_direct(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
   657			struct io_uring_cmd *ioucmd, unsigned int issue_flags)
   658	{
   659		struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
   660		int qid = io_uring_cmd_import_qid(ioucmd);
   661		struct nvme_uring_direct_pdu *pdu =
   662			(struct nvme_uring_direct_pdu *)&ioucmd->pdu;
   663	
   664		if ((issue_flags & IO_URING_F_IOPOLL) != IO_URING_F_IOPOLL)
   665			return -EOPNOTSUPP;
   666	
   667		pdu->ns = ns;
 > 668		if (q->mq_ops && q->mq_ops->queue_uring_cmd)
   669			return q->mq_ops->queue_uring_cmd(ioucmd, qid);
   670		return -EOPNOTSUPP;
   671	}
   672	
   673	static int nvme_ctrl_ioctl(struct nvme_ctrl *ctrl, unsigned int cmd,
   674			void __user *argp, fmode_t mode)
   675	{
   676		switch (cmd) {
   677		case NVME_IOCTL_ADMIN_CMD:
   678			return nvme_user_cmd(ctrl, NULL, argp, 0, mode);
   679		case NVME_IOCTL_ADMIN64_CMD:
   680			return nvme_user_cmd64(ctrl, NULL, argp, 0, mode);
   681		default:
   682			return sed_ioctl(ctrl->opal_dev, cmd, argp);
   683		}
   684	}
   685	
   686	#ifdef COMPAT_FOR_U64_ALIGNMENT
   687	struct nvme_user_io32 {
   688		__u8	opcode;
   689		__u8	flags;
   690		__u16	control;
   691		__u16	nblocks;
   692		__u16	rsvd;
   693		__u64	metadata;
   694		__u64	addr;
   695		__u64	slba;
   696		__u32	dsmgmt;
   697		__u32	reftag;
   698		__u16	apptag;
   699		__u16	appmask;
   700	} __attribute__((__packed__));
   701	#define NVME_IOCTL_SUBMIT_IO32	_IOW('N', 0x42, struct nvme_user_io32)
   702	#endif /* COMPAT_FOR_U64_ALIGNMENT */
   703	
   704	static int nvme_ns_ioctl(struct nvme_ns *ns, unsigned int cmd,
   705			void __user *argp, unsigned int flags, fmode_t mode)
   706	{
   707		switch (cmd) {
   708		case NVME_IOCTL_ID:
   709			force_successful_syscall_return();
   710			return ns->head->ns_id;
   711		case NVME_IOCTL_IO_CMD:
   712			return nvme_user_cmd(ns->ctrl, ns, argp, flags, mode);
   713		/*
   714		 * struct nvme_user_io can have different padding on some 32-bit ABIs.
   715		 * Just accept the compat version as all fields that are used are the
   716		 * same size and at the same offset.
   717		 */
   718	#ifdef COMPAT_FOR_U64_ALIGNMENT
   719		case NVME_IOCTL_SUBMIT_IO32:
   720	#endif
   721		case NVME_IOCTL_SUBMIT_IO:
   722			return nvme_submit_io(ns, argp);
   723		case NVME_IOCTL_IO64_CMD_VEC:
   724			flags |= NVME_IOCTL_VEC;
   725			fallthrough;
   726		case NVME_IOCTL_IO64_CMD:
   727			return nvme_user_cmd64(ns->ctrl, ns, argp, flags, mode);
   728		default:
   729			return -ENOTTY;
   730		}
   731	}
   732	
   733	int nvme_ioctl(struct block_device *bdev, fmode_t mode,
   734			unsigned int cmd, unsigned long arg)
   735	{
   736		struct nvme_ns *ns = bdev->bd_disk->private_data;
   737		void __user *argp = (void __user *)arg;
   738		unsigned int flags = 0;
   739	
   740		if (bdev_is_partition(bdev))
   741			flags |= NVME_IOCTL_PARTITION;
   742	
   743		if (is_ctrl_ioctl(cmd))
   744			return nvme_ctrl_ioctl(ns->ctrl, cmd, argp, mode);
   745		return nvme_ns_ioctl(ns, cmd, argp, flags, mode);
   746	}
   747	
   748	long nvme_ns_chr_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
   749	{
   750		struct nvme_ns *ns =
   751			container_of(file_inode(file)->i_cdev, struct nvme_ns, cdev);
   752		void __user *argp = (void __user *)arg;
   753	
   754		if (is_ctrl_ioctl(cmd))
   755			return nvme_ctrl_ioctl(ns->ctrl, cmd, argp, file->f_mode);
   756		return nvme_ns_ioctl(ns, cmd, argp, 0, file->f_mode);
   757	}
   758	
   759	static int nvme_uring_cmd_checks(unsigned int issue_flags)
   760	{
   761	
   762		/* NVMe passthrough requires big SQE/CQE support */
   763		if ((issue_flags & (IO_URING_F_SQE128|IO_URING_F_CQE32)) !=
   764		    (IO_URING_F_SQE128|IO_URING_F_CQE32))
   765			return -EOPNOTSUPP;
   766		return 0;
   767	}
   768	
   769	static int nvme_ns_uring_cmd(struct nvme_ns *ns, struct io_uring_cmd *ioucmd,
   770				     unsigned int issue_flags)
   771	{
   772		struct nvme_ctrl *ctrl = ns->ctrl;
   773		int ret;
   774	
   775		BUILD_BUG_ON(sizeof(struct nvme_uring_cmd_pdu) > sizeof(ioucmd->pdu));
   776	
   777		ret = nvme_uring_cmd_checks(issue_flags);
   778		if (ret)
   779			return ret;
   780	
   781		switch (ioucmd->cmd_op) {
   782		case NVME_URING_CMD_IO:
   783			if (ioucmd->flags & IORING_URING_CMD_DIRECT) {
   784				ret = nvme_uring_cmd_io_direct(ctrl, ns, ioucmd,
   785						issue_flags);
   786				if (ret == -EIOCBQUEUED)
   787					return ret;
   788				/* in case of any error, just fallback */
   789				ioucmd->flags &= ~(IORING_URING_CMD_DIRECT);
   790			}
   791			ret = nvme_uring_cmd_io(ctrl, ns, ioucmd, issue_flags, false);
   792			break;
   793		case NVME_URING_CMD_IO_VEC:
   794			ret = nvme_uring_cmd_io(ctrl, ns, ioucmd, issue_flags, true);
   795			break;
   796		default:
   797			ret = -ENOTTY;
   798		}
   799	
   800		return ret;
   801	}
   802	
   803	int nvme_ns_chr_uring_cmd(struct io_uring_cmd *ioucmd, unsigned int issue_flags)
   804	{
   805		struct nvme_ns *ns = container_of(file_inode(ioucmd->file)->i_cdev,
   806				struct nvme_ns, cdev);
   807	
   808		return nvme_ns_uring_cmd(ns, ioucmd, issue_flags);
   809	}
   810	
   811	/* similar to blk_mq_poll; may be possible to unify */
 > 812	int nvme_uring_cmd_iopoll_qid(struct request_queue *q,
   813					 struct io_uring_cmd *ioucmd, int qid,
   814					 struct io_comp_batch *iob,
   815					 unsigned int flags)
   816	{
   817		long state = get_current_state();
   818		int ret;
   819	
 > 820		if (!(q->mq_ops && q->mq_ops->poll_uring_cmd))
   821			return 0;
   822		do {
   823			ret = q->mq_ops->poll_uring_cmd(ioucmd, qid, iob);
   824			if (ret > 0) {
   825				__set_current_state(TASK_RUNNING);
   826				return ret;
   827			}
   828			if (signal_pending_state(state, current))
   829				__set_current_state(TASK_RUNNING);
   830			if (task_is_running(current))
   831				return 1;
   832	
   833			if (ret < 0 || (flags & BLK_POLL_ONESHOT))
   834				break;
   835			cpu_relax();
   836	
   837		} while (!need_resched());
   838	
   839		__set_current_state(TASK_RUNNING);
   840		return 0;
   841	}
   842	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

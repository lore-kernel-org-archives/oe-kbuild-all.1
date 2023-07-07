Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF26882B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 07:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688716436; x=1720252436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fUQwaIIQQg6BWoxCB1iQD6C8baOzNhc7vX6RfrzEYRo=;
  b=coU7ESW9nba0BIdVhsXm5rqsXG/XZkijwBs3ziK/Vetn0hEU3VPErJxI
   rGYKtVWpAOR3QdHn7GX6lk9ujSf3WFwen+w+tiIjhuG96zooIpMsME5Mg
   aSTgD5iZBGHD4hKOfY0UmBexn7SHSnlPB07qM39E+fK3idALCETu3ri4r
   L53yYq9qwA42UbNtpb7Xq0tSmIDrnhzNhD6icYlxktZBATK66okfHRMKn
   r/PgVqaYudogYnk2Px/O6bCdMHdbItrI+37zqY0aavqmvLOa6nc72o7XF
   iNbjjgH52cWX5d32lUf+NB0F4cfzH0XMc/VFMdPxcsAQzyEn1hhJDuAdQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="366415114"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="366415114"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 00:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="749458354"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="749458354"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Jul 2023 00:53:55 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHgHq-0001sU-04;
	Fri, 07 Jul 2023 07:53:54 +0000
Date: Fri, 7 Jul 2023 15:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 32/377]
 include/linux/blktrace_api.h:88:57: warning: statement with no effect
Message-ID: <202307071521.0pMjgPmt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   91da1079a24840825fccc4b320c4a08b4b66fcdd
commit: 7dc54a5b7dbae2edce1e8bcbfa3b564bf281cc76 [32/377] block: fix blktrace debugfs entries leakage
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230707/202307071521.0pMjgPmt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071521.0pMjgPmt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071521.0pMjgPmt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/genhd.c:28:
   block/genhd.c: In function 'disk_release':
>> include/linux/blktrace_api.h:88:57: warning: statement with no effect [-Wunused-value]
      88 | # define blk_trace_remove(q)                            (-ENOTTY)
         |                                                         ^
   block/genhd.c:1185:9: note: in expansion of macro 'blk_trace_remove'
    1185 |         blk_trace_remove(disk->queue);
         |         ^~~~~~~~~~~~~~~~


vim +88 include/linux/blktrace_api.h

157f9c00e88529 Arnaldo Carvalho de Melo 2009-01-26  81  
2056a782f8e7e6 Jens Axboe               2006-03-23  82  #else /* !CONFIG_BLK_DEV_IO_TRACE */
2056a782f8e7e6 Jens Axboe               2006-03-23  83  # define blk_trace_ioctl(bdev, cmd, arg)		(-ENOTTY)
2056a782f8e7e6 Jens Axboe               2006-03-23  84  # define blk_trace_shutdown(q)				do { } while (0)
a54895fa057c67 Christoph Hellwig        2020-12-03  85  # define blk_add_driver_data(rq, data, len)		do {} while (0)
d0deef5b14af7d Shawn Du                 2009-04-14  86  # define blk_trace_setup(q, name, dev, bdev, arg)	(-ENOTTY)
6da127ad0918f9 Christof Schmitt         2008-01-11  87  # define blk_trace_startstop(q, start)			(-ENOTTY)
6da127ad0918f9 Christof Schmitt         2008-01-11 @88  # define blk_trace_remove(q)				(-ENOTTY)
9d5f09a424a67d Alan D. Brunelle         2008-05-27  89  # define blk_add_trace_msg(q, fmt, ...)			do { } while (0)
35fe6d763229e8 Shaohua Li               2017-07-12  90  # define blk_add_cgroup_trace_msg(q, cg, fmt, ...)	do { } while (0)
59fa0224cfea31 Shaohua Li               2016-05-09  91  # define blk_trace_note_message_enabled(q)		(false)
2056a782f8e7e6 Jens Axboe               2006-03-23  92  #endif /* CONFIG_BLK_DEV_IO_TRACE */
d0deef5b14af7d Shawn Du                 2009-04-14  93  

:::::: The code at line 88 was first introduced by commit
:::::: 6da127ad0918f93ea93678dad62ce15ffed18797 blktrace: Add blktrace ioctls to SCSI generic devices

:::::: TO: Christof Schmitt <christof.schmitt@de.ibm.com>
:::::: CC: Jens Axboe <jens.axboe@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931E810F6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 00:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689554918; x=1721090918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4gL4PIMSazM2PGbILCN1SjGj6z5bHGBzFIjOvvgR82I=;
  b=W3g0ekuTWaA0y+ZFKPGUD5T1vnzhJdJ0n8aPgiedtVOFEBcESDzP2TYG
   oMtlf7U6YydOiD0IlU75B57wKLLLz4MZTq36Q/H82LkgcklSMaxGHqpc/
   IhlYxsuNA4FDSejT4XGFTVPg2xBXIuA+2zY2lLPO+4s/c/GLsaIIZgLvG
   HpS9fLuoIx0A8ohSAvQ9PJqFXIW8tLe+E/3nzS8afuqaNZFOiW12EdOJ0
   p9LecvHqAWnoO20YICbc2L0yozKllWc6V+Lzj11GeEGyHy4rY7RiWF4x5
   YUCk/WwpeXCeW48cpt26qdh0vA2ccVHp0diaTYXli4kalUCrb94mo42G5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="369366004"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="369366004"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 17:48:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="897018579"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="897018579"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Jul 2023 17:48:34 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLCPh-000956-2x;
	Mon, 17 Jul 2023 00:48:33 +0000
Date: Mon, 17 Jul 2023 08:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:start-write-safe 10/10] fs/read_write.c:848:9: warning: no
 previous prototype for 'do_iter_write'
Message-ID: <202307170807.oqEI7KqL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux start-write-safe
head:   249f6fc94a26bd48f4d0903e05fb15d9e77356e2
commit: 249f6fc94a26bd48f4d0903e05fb15d9e77356e2 [10/10] fs: move file_start_write() into vfs_iter_write()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230717/202307170807.oqEI7KqL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170807.oqEI7KqL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307170807.oqEI7KqL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/read_write.c:848:9: warning: no previous prototype for 'do_iter_write' [-Wmissing-prototypes]
     848 | ssize_t do_iter_write(struct file *file, struct iov_iter *iter, loff_t *pos,
         |         ^~~~~~~~~~~~~


vim +/do_iter_write +848 fs/read_write.c

   847	
 > 848	ssize_t do_iter_write(struct file *file, struct iov_iter *iter, loff_t *pos,
   849			      rwf_t flags)
   850	{
   851		size_t tot_len;
   852		ssize_t ret = 0;
   853	
   854		if (!(file->f_mode & FMODE_WRITE))
   855			return -EBADF;
   856		if (!(file->f_mode & FMODE_CAN_WRITE))
   857			return -EINVAL;
   858	
   859		tot_len = iov_iter_count(iter);
   860		if (!tot_len)
   861			return 0;
   862		ret = rw_verify_area(WRITE, file, pos, tot_len);
   863		if (ret < 0)
   864			return ret;
   865	
   866		if (file->f_op->write_iter)
   867			ret = do_iter_readv_writev(file, iter, pos, WRITE, flags);
   868		else
   869			ret = do_loop_readv_writev(file, iter, pos, WRITE, flags);
   870		if (ret > 0)
   871			fsnotify_modify(file);
   872		return ret;
   873	}
   874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

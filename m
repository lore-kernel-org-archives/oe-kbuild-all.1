Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E985151991
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739631670; cv=none; b=uT2fYEmGnBIgGgFIVbMjxaAxAjnzro5wqDZq6iHH9h39HvDRhuQIR5Wb3ZY+sS8QmJ9tIGefWNO7u1Vc5ylqkjYTA+mt9JzF+FKFam8HvoKGB+lL3WPBcRjPdnsL2FQJv1jxcptzIwkWShZhwuTBJKTBQRZKyqllfUIBCP3b2Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739631670; c=relaxed/simple;
	bh=E2lF9cWKmltk1ixlTKhD94iKWyynULCZpIha8SGePng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yet6oeTMp/a4flcBOSI7hpGOdXQg5T66k5g+sLIvkBCkNyaZ0jz8LOtd1R84yK3PDiiitavzspay++To4OrCc09daxVJMpdSLv4TLmycSQCxi0tI2EokUi+N6YrINWLIk29JGTzZI5LV6ecLyIMqvWQ5DbR6u//eLwHZO8+vgvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MI8L7xES; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MI8L7xES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739631667; x=1771167667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E2lF9cWKmltk1ixlTKhD94iKWyynULCZpIha8SGePng=;
  b=MI8L7xESTUqBLMZddKQcLbtpd7GvN7NOLywd5REr/dWw6iYrTf8hYQMf
   qy8EGIBO9j7Oh1T3DTuAN5tWVCt0PtIUFdbOiewRrpjBHGg2jwncr1dBL
   DoQtiVBECtX2R5mpwhmgu3AX7DnLBRvCJ2DUGmYjzVxtxVlfni2UKhzUR
   nwd/xjOTT6lqiM6aH1nq2MIGJUQr7Ds8g75SR7m5TPhF0uJ0Ocvxg9wTv
   SJDJ4qYzntnaqzXc6ob3RjmOLYCxO39JojLhMCh94FAMJKZi7/AGxI7fO
   mAU7cKpLns6MO/gFTB8r98lxnIkhLP6Lj4tm1F8b8lZXh/QA3crgSG+6N
   w==;
X-CSE-ConnectionGUID: sN80mGVrRgqAQRa1l94d1A==
X-CSE-MsgGUID: 4T9YE1lwQ/uxAbvM1gTaVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="51011582"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="51011582"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 07:00:55 -0800
X-CSE-ConnectionGUID: OpTzw0WkT1qOHnQzABmRCA==
X-CSE-MsgGUID: xFjP0Xv5TCGv3wBi7Ysc6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="113446511"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Feb 2025 07:00:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjJf1-001Aup-2Q;
	Sat, 15 Feb 2025 15:00:51 +0000
Date: Sat, 15 Feb 2025 23:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv3 3/5] ublk: zc register/unregister bvec
Message-ID: <202502152224.U74NMKGI-lkp@intel.com>
References: <20250214154348.2952692-4-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214154348.2952692-4-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/io_uring-move-fixed-buffer-import-to-issue-path/20250214-234852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250214154348.2952692-4-kbusch%40meta.com
patch subject: [PATCHv3 3/5] ublk: zc register/unregister bvec
config: arm-randconfig-003-20250215 (https://download.01.org/0day-ci/archive/20250215/202502152224.U74NMKGI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502152224.U74NMKGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502152224.U74NMKGI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/ublk_drv.c: In function 'ublk_register_io_buf':
>> drivers/block/ublk_drv.c:1799:30: warning: variable 'data' set but not used [-Wunused-but-set-variable]
    1799 |         struct ublk_rq_data *data;
         |                              ^~~~
   drivers/block/ublk_drv.c: In function 'ublk_unregister_io_buf':
   drivers/block/ublk_drv.c:1828:30: warning: variable 'data' set but not used [-Wunused-but-set-variable]
    1828 |         struct ublk_rq_data *data;
         |                              ^~~~


vim +/data +1799 drivers/block/ublk_drv.c

  1790	
  1791	static int ublk_register_io_buf(struct io_uring_cmd *cmd,
  1792					struct ublk_queue *ubq, int tag,
  1793					const struct ublksrv_io_cmd *ub_cmd,
  1794					unsigned int issue_flags)
  1795	{
  1796		struct io_ring_ctx *ctx = cmd_to_io_kiocb(cmd)->ctx;
  1797		struct ublk_device *ub = cmd->file->private_data;
  1798		int index = (int)ub_cmd->addr, ret;
> 1799		struct ublk_rq_data *data;
  1800		struct request *req;
  1801	
  1802		if (!ub)
  1803			return -EPERM;
  1804	
  1805		req = __ublk_check_and_get_req(ub, ubq, tag, 0);
  1806		if (!req)
  1807			return -EINVAL;
  1808	
  1809		data = blk_mq_rq_to_pdu(req);
  1810		ret = io_buffer_register_bvec(ctx, req, ublk_io_release, index,
  1811					      issue_flags);
  1812		if (ret) {
  1813			ublk_put_req_ref(ubq, req);
  1814			return ret;
  1815		}
  1816	
  1817		return 0;
  1818	}
  1819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

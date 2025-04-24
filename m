Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92806D528
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 03:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745464469; cv=none; b=lm8i22BlZBmamt5yuBbOotXIyiXp+BDI5fZVg7/vYIkMN0ZCzXINwIZAJyvJyfWwZmMKWp0sGkVWT7mAUdSaDOH5uRpgBwOp9Rm13nDLTawUWEl/e2RlOuUh3jJ1kEvA+Z0R/fzsjfRv1AsdGIMk7CYZYuvxiHfYIncJ+WHecxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745464469; c=relaxed/simple;
	bh=NUbV7JX6qILSeirG1gT5DrzKsaEX3kzc1qg15MQ6ZiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SQJGs/dONAQsrvTt6IlPQqrnQ7BDfW4MTz/dPkwPr/90UtZHl0TLM/wkn89EVPAhWok7KUB4UfPMAgNg5TuaPXYufQkqN5+TWNrRkknPbs9fc77oD/jy5Mi2wnZI+67LZQeoW7iAmCUqBH5LtOY6TkB33cZqfaqO9XXtk9fbLGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUrLDcrE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUrLDcrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745464467; x=1777000467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUbV7JX6qILSeirG1gT5DrzKsaEX3kzc1qg15MQ6ZiQ=;
  b=DUrLDcrEKbedn8v0eCQefC4UUpdUiy9b+FXlNMlTPDluXL69kBw7z/Je
   ARbFd26GKNxrwXB33o4I1xM5/eqDvMUurT0Dt5CClDpaypWwzeRztJKUZ
   1SCfAh2UCNtNV0E6k8DzLqVnid6r0lHUb0l5E9eYptPdgqFDuOye1d3rD
   1MXVIIKvaAHdVrSFdj94wTOMvHqspReBL+KLYmtMAAGSCSAHsy4FK2+9k
   eR3bvWGOcTca1ktfMcGjmIoQbuGlxfHrWfYCeN/ro3sXZWqcfTDzHTPyV
   Al25NyDHldvRMuhbgniuADVnYeX3qjXZPE3AJ5K6U3lDMvZmpgT6CCv4D
   g==;
X-CSE-ConnectionGUID: in01Ed45T4K+pnqjSx62Eg==
X-CSE-MsgGUID: boq/PGSnTA6fllGSlXiURw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="49744526"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="49744526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 20:14:25 -0700
X-CSE-ConnectionGUID: 77MiKipdQc6+JK9EDpJ4Bw==
X-CSE-MsgGUID: 1Zdp6QYtR4O42vOz2+EIRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="169701327"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Apr 2025 20:14:23 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7n2b-0003pB-1J;
	Thu, 24 Apr 2025 03:14:21 +0000
Date: Thu, 24 Apr 2025 11:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 12/12]
 drivers/nvme/host/core.c:984:27: warning: unused variable 'ctrl'
Message-ID: <202504241106.ESa0sz2z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8dcd583e3465e0c2cdc7613c2cbbb752a196373b
commit: 8dcd583e3465e0c2cdc7613c2cbbb752a196373b [12/12] nvme: increment request genctr on completion
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250424/202504241106.ESa0sz2z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504241106.ESa0sz2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504241106.ESa0sz2z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/host/core.c: In function 'nvme_setup_cmd':
>> drivers/nvme/host/core.c:984:27: warning: unused variable 'ctrl' [-Wunused-variable]
     984 |         struct nvme_ctrl *ctrl = nvme_req(req)->ctrl;
         |                           ^~~~


vim +/ctrl +984 drivers/nvme/host/core.c

f7f1fc363aab46 Max Gurtovoy       2018-07-30   980  
fc17b6534eb839 Christoph Hellwig  2017-06-03   981  blk_status_t nvme_setup_cmd(struct nvme_ns *ns, struct request *req,
8093f7ca73c163 Ming Lin           2016-04-12   982  		struct nvme_command *cmd)
8093f7ca73c163 Ming Lin           2016-04-12   983  {
011b4de950d80d Keith Busch        2021-09-27  @984  	struct nvme_ctrl *ctrl = nvme_req(req)->ctrl;
fc17b6534eb839 Christoph Hellwig  2017-06-03   985  	blk_status_t ret = BLK_STS_OK;
8093f7ca73c163 Ming Lin           2016-04-12   986  
ba388d4e9a684f Chaitanya Kulkarni 2021-02-28   987  	if (!(req->rq_flags & RQF_DONTPREP))
bb06ec31452fb2 James Smart        2018-04-12   988  		nvme_clear_nvme_request(req);
987f699a8f6c9a Christoph Hellwig  2017-04-05   989  
1190203555ec58 Chaitanya Kulkarni 2018-10-29   990  	memset(cmd, 0, sizeof(*cmd));
aebf526b53aea1 Christoph Hellwig  2017-01-31   991  	switch (req_op(req)) {
aebf526b53aea1 Christoph Hellwig  2017-01-31   992  	case REQ_OP_DRV_IN:
aebf526b53aea1 Christoph Hellwig  2017-01-31   993  	case REQ_OP_DRV_OUT:
2bf5d3bbffad06 Logan Gunthorpe    2020-07-24   994  		nvme_setup_passthrough(req, cmd);
aebf526b53aea1 Christoph Hellwig  2017-01-31   995  		break;
aebf526b53aea1 Christoph Hellwig  2017-01-31   996  	case REQ_OP_FLUSH:
8093f7ca73c163 Ming Lin           2016-04-12   997  		nvme_setup_flush(ns, cmd);
aebf526b53aea1 Christoph Hellwig  2017-01-31   998  		break;
240e6ee272c07a Keith Busch        2020-06-29   999  	case REQ_OP_ZONE_RESET_ALL:
240e6ee272c07a Keith Busch        2020-06-29  1000  	case REQ_OP_ZONE_RESET:
240e6ee272c07a Keith Busch        2020-06-29  1001  		ret = nvme_setup_zone_mgmt_send(ns, req, cmd, NVME_ZONE_RESET);
240e6ee272c07a Keith Busch        2020-06-29  1002  		break;
240e6ee272c07a Keith Busch        2020-06-29  1003  	case REQ_OP_ZONE_OPEN:
240e6ee272c07a Keith Busch        2020-06-29  1004  		ret = nvme_setup_zone_mgmt_send(ns, req, cmd, NVME_ZONE_OPEN);
240e6ee272c07a Keith Busch        2020-06-29  1005  		break;
240e6ee272c07a Keith Busch        2020-06-29  1006  	case REQ_OP_ZONE_CLOSE:
240e6ee272c07a Keith Busch        2020-06-29  1007  		ret = nvme_setup_zone_mgmt_send(ns, req, cmd, NVME_ZONE_CLOSE);
240e6ee272c07a Keith Busch        2020-06-29  1008  		break;
240e6ee272c07a Keith Busch        2020-06-29  1009  	case REQ_OP_ZONE_FINISH:
240e6ee272c07a Keith Busch        2020-06-29  1010  		ret = nvme_setup_zone_mgmt_send(ns, req, cmd, NVME_ZONE_FINISH);
240e6ee272c07a Keith Busch        2020-06-29  1011  		break;
e850fd16f751a6 Christoph Hellwig  2017-04-05  1012  	case REQ_OP_WRITE_ZEROES:
6e02318eaea53e Chaitanya Kulkarni 2018-12-17  1013  		ret = nvme_setup_write_zeroes(ns, req, cmd);
6e02318eaea53e Chaitanya Kulkarni 2018-12-17  1014  		break;
aebf526b53aea1 Christoph Hellwig  2017-01-31  1015  	case REQ_OP_DISCARD:
8093f7ca73c163 Ming Lin           2016-04-12  1016  		ret = nvme_setup_discard(ns, req, cmd);
aebf526b53aea1 Christoph Hellwig  2017-01-31  1017  		break;
aebf526b53aea1 Christoph Hellwig  2017-01-31  1018  	case REQ_OP_READ:
240e6ee272c07a Keith Busch        2020-06-29  1019  		ret = nvme_setup_rw(ns, req, cmd, nvme_cmd_read);
240e6ee272c07a Keith Busch        2020-06-29  1020  		break;
aebf526b53aea1 Christoph Hellwig  2017-01-31  1021  	case REQ_OP_WRITE:
240e6ee272c07a Keith Busch        2020-06-29  1022  		ret = nvme_setup_rw(ns, req, cmd, nvme_cmd_write);
240e6ee272c07a Keith Busch        2020-06-29  1023  		break;
240e6ee272c07a Keith Busch        2020-06-29  1024  	case REQ_OP_ZONE_APPEND:
240e6ee272c07a Keith Busch        2020-06-29  1025  		ret = nvme_setup_rw(ns, req, cmd, nvme_cmd_zone_append);
aebf526b53aea1 Christoph Hellwig  2017-01-31  1026  		break;
aebf526b53aea1 Christoph Hellwig  2017-01-31  1027  	default:
aebf526b53aea1 Christoph Hellwig  2017-01-31  1028  		WARN_ON_ONCE(1);
fc17b6534eb839 Christoph Hellwig  2017-06-03  1029  		return BLK_STS_IOERR;
aebf526b53aea1 Christoph Hellwig  2017-01-31  1030  	}
8093f7ca73c163 Ming Lin           2016-04-12  1031  
240a7025a6f89f Sagi Grimberg      2021-06-16  1032  	cmd->common.command_id = nvme_cid(req);
5d87eb94d9ba13 Keith Busch        2018-06-29  1033  	trace_nvme_setup_cmd(req, cmd);
8093f7ca73c163 Ming Lin           2016-04-12  1034  	return ret;
8093f7ca73c163 Ming Lin           2016-04-12  1035  }
8093f7ca73c163 Ming Lin           2016-04-12  1036  EXPORT_SYMBOL_GPL(nvme_setup_cmd);
8093f7ca73c163 Ming Lin           2016-04-12  1037  

:::::: The code at line 984 was first introduced by commit
:::::: 011b4de950d80d9438e67b44622e2a587e097d56 nvme: add command id quirk for apple controllers

:::::: TO: Keith Busch <kbusch@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

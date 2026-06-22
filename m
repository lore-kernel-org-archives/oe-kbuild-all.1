Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDE83655DD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 10:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124779; cv=none; b=fB9MG4gh5F3yjujXJZQ7n0iI4L/OCdLghXunCgU7Dx30cejSVPCST90qAILRpFLoqzFwVQZoC99TEG6jD3MxQ+jm5y6pEDOKocIt33VH0SZTr+8mdeTln4xiR/XHh2gaNJYfuLKi0Pqf0cQcCIRY4aeDoiNceisJGmgkHdWmsbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124779; c=relaxed/simple;
	bh=I5qHaBtsAGxIGX5jB34MCU7chlZ3jPa7HN9/gkVxufQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pwKihBWS+Ev6b0IPtj5B5E4FQUsGgNvtHYMugllWlbR4fOBLhsxOh+VnSG9msNC61R2LKENjlkApOHrpITa30iAUNzS6w4pR5gW83MkgHZnLwXM4cda4kxGapHSygA6A397qke2ppbosjjyCMX5Ay2god9fCJRjtHmpIAmKcxcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/61mYjz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/61mYjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782124777; x=1813660777;
  h=date:from:to:cc:subject:message-id;
  bh=I5qHaBtsAGxIGX5jB34MCU7chlZ3jPa7HN9/gkVxufQ=;
  b=B/61mYjz/hao+unoRtr2Ly+0o9BOAtn35uzBw8Ii5k3hQxyob0SLQ6rY
   EfE4GEu6x9wnT7OShr0xC2qT3seA62ZF5ncYUa244UBjlnf+mk8uXv/GG
   SO7Fqv5gq3QMLphAOFaC7Wsbu6dVezmgQZDOzGgxU/pSLa2om+brI/P3L
   sNtKdlcNZKIbRGTO//A/AJBBH/EVxiivIAgXWpwfhr7aJeF61TBaMLHga
   AnY32jQbjY9qqs/qlwoyElyfaP/sDYlmxyeSDbdqMpAFOkj7pGslsXXYE
   NkeB16TG0kT9xXDkyRmaRkjX/Be6xu99ij/Qp+TypRkgD4VmV/fLHRIeP
   w==;
X-CSE-ConnectionGUID: gPzTeA+RQUGxs2J7PFgGyA==
X-CSE-MsgGUID: X9pbk3/WQZ6M1/NCQ6guVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="105645705"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="105645705"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:39:37 -0700
X-CSE-ConnectionGUID: 2nSMu4esTOeIM0ZtnQcaVQ==
X-CSE-MsgGUID: obnlTS7hQzCM/AH3JZqwew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="273265729"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 03:39:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbc3w-00000000103-3acl;
	Mon, 22 Jun 2026 10:39:32 +0000
Date: Mon, 22 Jun 2026 18:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v2 16/17]
 drivers/nvme/target/loop.c:542:50: error: invalid use of undefined type
 'struct nsproxy'
Message-ID: <202606221805.qd2sDCjv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v2
head:   e2bc6e23c907dceafa9ce30beca26cdc05bb664d
commit: 5ee9c143b806000467a489e080f5d0f7db3af48e [16/17] nvmet-loop: skip ports from wrong namespaces
config: x86_64-randconfig-013-20260622 (https://download.01.org/0day-ci/archive/20260622/202606221805.qd2sDCjv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221805.qd2sDCjv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606221805.qd2sDCjv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/target/loop.c: In function 'nvme_loop_find_port':
>> drivers/nvme/target/loop.c:542:50: error: invalid use of undefined type 'struct nsproxy'
     542 |                 if (p->net_ns != current->nsproxy->net_ns)
         |                                                  ^~


vim +542 drivers/nvme/target/loop.c

   534	
   535	static struct nvmet_port *nvme_loop_find_port(struct nvme_ctrl *ctrl)
   536	{
   537		struct nvmet_port *p, *found = NULL;
   538	
   539		mutex_lock(&nvme_loop_ports_mutex);
   540		list_for_each_entry(p, &nvme_loop_ports, entry) {
   541			/* Skip ports from non-matching namespaces */
 > 542			if (p->net_ns != current->nsproxy->net_ns)
   543				continue;
   544			/* if no transport address is specified use the first port */
   545			if ((ctrl->opts->mask & NVMF_OPT_TRADDR) &&
   546			    strcmp(ctrl->opts->traddr, p->disc_addr.traddr))
   547				continue;
   548			found = p;
   549			break;
   550		}
   551		mutex_unlock(&nvme_loop_ports_mutex);
   552		return found;
   553	}
   554	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

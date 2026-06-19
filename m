Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84ED83A14
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jun 2026 22:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781906854; cv=none; b=evfreA7vZnxyav49aymMbPQzaRqa9DJQ0HqCqXHNcaYbEdsJS/exFrizvj6tlLYZJwUfu2vEwAnaNY5JwxsM8VXZh47RW+nCm5ungzqRyvIJZOkrQXgg6Fix9DdP3G7ha4FyLgfHGnKQyepbruIHZBWwBiq1GhKHTQ66aMEGDxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781906854; c=relaxed/simple;
	bh=RMZ+X97hKS8i47efWBpTDNhGM3mn1aK09egwd53r3cg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u5IcRsT3PCYb7yBRzAdK0D31wL095Rch0OCqz0HUxf3IXSRLdttMqae81V8B7u8vrup1ICHbA97ylncmN6QCZ4VWsROr+XDn6ohJ6ogvczbV+AOQbbdPR7yY6CAv4Z6Kg5dN27zMIEHyTxRQR6MjfJt1pD7JF/2R7a2ALBwMGCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bo89qt16; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bo89qt16"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781906853; x=1813442853;
  h=date:from:to:cc:subject:message-id;
  bh=RMZ+X97hKS8i47efWBpTDNhGM3mn1aK09egwd53r3cg=;
  b=bo89qt16D9icB9RrEd67DwcplHg/f4u18kfqOPkH62mKyyZnuB9ac/Nf
   znBZOkrcjn/jInorXPSIbzQt9xho1amSALC77kLsXm0ZPRt9XyIHNtqt4
   V5p9eK5twQgeHu5/sLvGzj3UTcOJd2469El80B+teXI3VyhRVfCMXFnH2
   xUs47VYkGoKX2r7FwfzGxJdnRHpR2qn1XFg+sJe7pL/OsRenBgFZtn3QN
   pCrRHmfhGpIOvcYOMj7a5e6LOiGt5QOOtMC4kXaKGTRLf5Vr75/YaJhuP
   Bj16WuE+InhjniskL76PMOoPC5fO6UWkPgNEQFKkbsx/kY1mJoEWWyR6w
   w==;
X-CSE-ConnectionGUID: gbWso/4dT2qZQVFl4vbabg==
X-CSE-MsgGUID: lOaw5UBRR2qnxzzqWfHbjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="100178885"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="100178885"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 15:07:33 -0700
X-CSE-ConnectionGUID: o3CxkThNQqeKHPkzPjMohA==
X-CSE-MsgGUID: wrp7o4OJTcy+GBrnUcehsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="272410453"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2026 15:07:31 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wahN3-000000005gZ-07BV;
	Fri, 19 Jun 2026 22:07:29 +0000
Date: Sat, 20 Jun 2026 00:06:45 +0200
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v2 16/17]
 drivers/nvme/target/loop.c:542:50: error: invalid use of undefined type
 'struct nsproxy'
Message-ID: <202606192319.n0SQ1lZJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v2
head:   e2bc6e23c907dceafa9ce30beca26cdc05bb664d
commit: 5ee9c143b806000467a489e080f5d0f7db3af48e [16/17] nvmet-loop: skip ports from wrong namespaces
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260619/202606192319.n0SQ1lZJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260619/202606192319.n0SQ1lZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606192319.n0SQ1lZJ-lkp@intel.com/

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

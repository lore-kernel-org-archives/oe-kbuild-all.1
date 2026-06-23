Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF9925B090
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 02:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782180967; cv=none; b=ltatoy1Q3vcAkPIXdh+z+anpfYe/rMubeYiYVC58REs/Xto5bTPEjHnNUkFyiEXHpDlk4LCsdaU1+bfipW8av/RDT02Mqtt38jCiaDUygLXIQg5C5uOc/oi7k/YUb1AGIYCan/7Jt1DAWTZqfAtDsyniJSUvZtDo2YVpTojxlYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782180967; c=relaxed/simple;
	bh=BsITaoDROzpjEUG0v6o+PVGF+6aCeWnxDvcPPcM32vg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tGuFhrjqWPYVHN8aoFoRSHKuh6MQxGV+NwJrBA65vRLkjwbvqmUd8DIsY174ABalqWvRn5grgwmWUQxAcQzQbQTl7r6tRjIOB0CyZUUIgyZ5w442njzRpYIbBGv6muk3YZxknryT4JrLvEwxWPtyncR58eWNHhE70xWbIlJYHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdKTt+E8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdKTt+E8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782180965; x=1813716965;
  h=date:from:to:cc:subject:message-id;
  bh=BsITaoDROzpjEUG0v6o+PVGF+6aCeWnxDvcPPcM32vg=;
  b=bdKTt+E8hGbWqdS2FQIAVYbK+u30CR2+5OoOKqOsLflzqB5aYJVwvkp6
   yrtSqI8y/cxIHXGgDFn/96EvfGuqBdJaiA0Vz5bdHWc29GxgTas897dBs
   nx9s7SIxCru9RmNZc7o/laVAQlSnQCBlXBTEryCpRxPpLkA0h9XSWso2F
   1fEHmKMXI/zQrDKkH1Tpq4hyADbpZJSIzSVp710i8ixfxYw1L7V/89HRh
   YzmGerkSCGIcbMtIEf1YJ37m4cBpQemQ2RqdXc4ZjHRgRF9/dJ+G4l4nw
   fcVd0pCcl+Pmidr1H1Nqmw0bI37Gu6DUZgWqCN+1PcuIpGgfO3hTp5vVf
   A==;
X-CSE-ConnectionGUID: 69e4C29UQV+p1JtzgHqI4g==
X-CSE-MsgGUID: 2GHAO1WfTg6qaV/80twRtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94413986"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="94413986"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 19:16:05 -0700
X-CSE-ConnectionGUID: TTqdsM4uQ2i2m90t2TcGUA==
X-CSE-MsgGUID: 6UxF0ZuCS2qCqMCiZ496gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="254472743"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jun 2026 19:16:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbqgD-000000002Av-3GB0;
	Tue, 23 Jun 2026 02:16:01 +0000
Date: Tue, 23 Jun 2026 10:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v6 1/26]
 drivers/nvme/target/bpf_ops.c:108:33: sparse: sparse: restricted __le16
 degrades to integer
Message-ID: <202606231024.hfkoLKdf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v6
head:   22642e5d1c63efa6b484188105d45886f637d2be
commit: 95eeb6714114cd17d9c4c494a28cc11d86059eef [1/26] nvmet-bpf: eBPF struct_ops support for log pages
config: riscv-randconfig-r121-20260623 (https://download.01.org/0day-ci/archive/20260623/202606231024.hfkoLKdf-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231024.hfkoLKdf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231024.hfkoLKdf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/bpf_ops.c:108:33: sparse: sparse: restricted __le16 degrades to integer

vim +108 drivers/nvme/target/bpf_ops.c

    97	
    98	static int nvmet_bpf_reg(void *kdata, struct bpf_link *link)
    99	{
   100		struct nvmet_bpf_ops *ops = kdata;
   101		struct nvmet_port *p, *port = NULL;
   102		struct nvmet_subsys_link *s;
   103	
   104		pr_debug("%s: register %s port id %d\n",
   105			 __func__, ops->subsysnqn, ops->portid);
   106	
   107		list_for_each_entry(p, nvmet_ports, global_entry) {
 > 108			if (p->disc_addr.portid == ops->portid) {
   109				port = p;
   110				break;
   111			}
   112		}
   113		if (!port)
   114			return -EINVAL;
   115	
   116		down_write(&nvmet_config_sem);
   117		list_for_each_entry(s, &port->subsystems, entry) {
   118			if (!strncmp(s->subsys->subsysnqn, ops->subsysnqn,
   119				     NVMF_NQN_SIZE)) {
   120				s->bpf_ops = ops;
   121				ops->subsys_link = s;
   122				break;
   123			}
   124		}
   125		up_write(&nvmet_config_sem);
   126		if (ops->subsys_link) {
   127			pr_debug("%s: attached %pUb to %s\n",
   128				 __func__, &ops->uuid,
   129				 ops->subsys_link->subsys->serial);
   130			/* Raise a discovery log page changed AEN if log page is present */
   131			if (ops->log_page_supported(ops, NVME_LOG_DISC))
   132				nvmet_port_disc_changed(port, ops->subsys_link->subsys);
   133		}
   134		return ops->subsys_link ? 0 : -EINVAL;
   135	}
   136	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

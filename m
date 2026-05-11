Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C28D2FE04E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 23:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543184; cv=none; b=Oe82Ah7WKHAm/Nq8WWY7q1+pRLpajyPG4nYRXqAWavlmWUk8wLRP3o84L0098JYLFsEOaU8OVK1SKmj1MKuJkGzP3+M20NoOsqbBn+t7oIq335mncZAFIN1l3K6BZavisly2DlgWQOkvkGfICJhCwOz/myh99AWQZkvpKRmb3yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543184; c=relaxed/simple;
	bh=6QfFvd4hNVT/OFFEu3ETLdr8tjWKn7fheHATzoQOkbM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HifWaRh/2mMZtB8rdH/Y0jo0XsHLy3sIGwZVIU9UnX1blJSwAgpGiQKOrtGZ9/N2akUolbl8b9GgaNmoR8nokSbtIMJKTUqNbrPEaYTvCA5G3zo7j98DvoEcSMDDBx6XhVQs1jLyhhQUTAl7Kw/Eb+lT3eXh/ReG7pSnf7GYuY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFE9B5MN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFE9B5MN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778543184; x=1810079184;
  h=date:from:to:cc:subject:message-id;
  bh=6QfFvd4hNVT/OFFEu3ETLdr8tjWKn7fheHATzoQOkbM=;
  b=SFE9B5MNwYlrKrd4oMk5Rq+44wtYHzb/E3A6UDO06ReKtqJ0Re/Zse/v
   wv3jMa86dtMgYfkovY26mJn8Ys/QVdSCreLkTb15Mef1XKOjAD6TFs16G
   y1Ndf4r2Tz/2Zr3/UmXGJPLpzXwBUOVVuIUq+Zbx1ZQelqiSHew4+uQDv
   DaulGFecQoqQme6TvjFIkRjuJRvdXi24z6i+7mtropaZxsPKpvjsg4gvA
   OV5afgQupVUWijktLAAB/DrwObto29MqtMuM3aZ0Q74wNkNx/LMXHhhz5
   fmwBrcJfba0PAh/XVHUG1cKt7jt5L2v32UubHu61R0AY2krHIegDLWI9z
   Q==;
X-CSE-ConnectionGUID: C27GFiUqTq2kaDRWWyfijQ==
X-CSE-MsgGUID: elefQ8UKS1eh+35rar8Ljg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83060044"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="83060044"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 16:46:22 -0700
X-CSE-ConnectionGUID: T+9EwNZ2QTi+xnxxrtL80w==
X-CSE-MsgGUID: lAeCT29pSKmyy1Ew4iQpWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="242571688"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 May 2026 16:46:21 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMaKI-000000001IL-13Qt;
	Mon, 11 May 2026 23:46:18 +0000
Date: Tue, 12 May 2026 07:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v1 1/8]
 drivers/nvme/target/bpf_ops.c:108:33: sparse: sparse: restricted __le16
 degrades to integer
Message-ID: <202605120742.TeFoKFDS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v1
head:   c924e1daab3eb4efc26275918155673d5e90c6ba
commit: 95eeb6714114cd17d9c4c494a28cc11d86059eef [1/8] nvmet-bpf: eBPF struct_ops support for log pages
config: sparc64-randconfig-r132-20260512 (https://download.01.org/0day-ci/archive/20260512/202605120742.TeFoKFDS-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120742.TeFoKFDS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120742.TeFoKFDS-lkp@intel.com/

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

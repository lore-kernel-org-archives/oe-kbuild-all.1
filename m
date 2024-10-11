Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8CC1B3B2E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 17:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728666755; cv=none; b=TGEHyCjk7twZgydvx2cqoHh00zcaOdnfIt34oZ5qjV7JwtSX6gdsgpgbW+zjkHxh0jNmP0Z4REW0Hnd7KKDX71cXcyCK5p7DNoX3DZuofxkMZX3m2FKa9ywbL5uVLiBgS4m+YVHXkLgsAkHYDHmntk9qsxY3T+NAZayiy+U/Lgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728666755; c=relaxed/simple;
	bh=bp3RXhYCSr41eXrHdNkF5Ty/7bBo7bu9rMhEzmkm/5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSEQgomsCF+sos56MUOfsb8t5Y61V+psiLqz6flM6f3fgL+Wun7fxRYNVFVUHJjMGz+EqHfgrXJ039vsLhJGTyq7+eVU4BMyJbapjKEdOxU/4NxDaMO0K7ks1STahgzz3QIa4Tfk6EWO6fx1TsKy6zAkBKZ351y1HGDgJEdXK6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVClyw6y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVClyw6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728666754; x=1760202754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bp3RXhYCSr41eXrHdNkF5Ty/7bBo7bu9rMhEzmkm/5A=;
  b=KVClyw6yRtPkpnIJudRbSxmkOOiMTgLCyiN58deh/dE5n7GJoDrzUvOV
   PAkyW1Y7Jv/7Al8R8JG4LYNb666QTd1Q4YqIqf/CloK/9zJRtw40tZI6U
   yadLl1+PhdBFJ3tkcq3GAhQ1hI4jA6TjCbri2ryIDk5lyYzDnZrViWaQb
   AQbJ9tCMXTVVo/ZmWRLqg/5LfPxAVERe492rHluUu6GWJ6gr7NkEfJHUs
   uwGNWMP5dQHDlKVKkaFI4kOkmeMxeE6ARIPuuVPgmVI5d/uCJ+1Pog1Ok
   gSo+LBgEUDVj8/AQb4UpnPZOWw0BQTMREbl54rqHpkls4jm0L11uYnS+u
   A==;
X-CSE-ConnectionGUID: AMt0JtATTayQ1tDW6ntkdQ==
X-CSE-MsgGUID: AQfh+YX8TDGSmPZoTFsIPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39199842"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="39199842"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 10:12:32 -0700
X-CSE-ConnectionGUID: PTlI3y8yRcS0Sxbx54d+1Q==
X-CSE-MsgGUID: HDc5vyy2Q/WeJAj6ESrd0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="114426529"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Oct 2024 10:12:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szJBi-000CXb-1G;
	Fri, 11 Oct 2024 17:12:26 +0000
Date: Sat, 12 Oct 2024 01:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Matias =?iso-8859-1?Q?Bj=F8rling?= <m@bjorling.me>, kbusch@kernel.org,
	hch@lst.de, dlemoal@kernel.org, cassel@kernel.org,
	linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, wangyugui@e16-tech.com,
	martin.petersen@oracle.com, hare@suse.de
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3 v2] nvmet: add rotational support
Message-ID: <202410120113.A3HaEkbg-lkp@intel.com>
References: <20241010123951.1226105-4-m@bjorling.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010123951.1226105-4-m@bjorling.me>

Hi Matias,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.12-rc2]
[also build test WARNING on linus/master next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matias-Bj-rling/nvme-make-independent-ns-identify-default/20241010-204205
base:   v6.12-rc2
patch link:    https://lore.kernel.org/r/20241010123951.1226105-4-m%40bjorling.me
patch subject: [PATCH 3/3 v2] nvmet: add rotational support
config: i386-randconfig-062-20241011 (https://download.01.org/0day-ci/archive/20241012/202410120113.A3HaEkbg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120113.A3HaEkbg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410120113.A3HaEkbg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/admin-cmd.c:704:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] anagrpid @@     got unsigned int [usertype] anagrpid @@
   drivers/nvme/target/admin-cmd.c:704:22: sparse:     expected restricted __le32 [usertype] anagrpid
   drivers/nvme/target/admin-cmd.c:704:22: sparse:     got unsigned int [usertype] anagrpid

vim +704 drivers/nvme/target/admin-cmd.c

   687	
   688	static void nvmet_execute_id_cs_indep(struct nvmet_req *req)
   689	{
   690		struct nvme_id_ns_cs_indep *id;
   691		u16 status;
   692	
   693		status = nvmet_req_find_ns(req);
   694		if (status)
   695			goto out;
   696	
   697		id = kzalloc(sizeof(*id), GFP_KERNEL);
   698		if (!id) {
   699			status = NVME_SC_INTERNAL;
   700			goto out;
   701		}
   702	
   703		id->nstat = NVME_NSTAT_NRDY;
 > 704		id->anagrpid = req->ns->anagrpid;
   705		id->nmic = NVME_NS_NMIC_SHARED;
   706		if (req->ns->readonly)
   707			id->nsattr |= NVME_NS_ATTR_RO;
   708		if (req->ns->bdev && !bdev_nonrot(req->ns->bdev))
   709			id->nsfeat |= NVME_NS_ROTATIONAL;
   710	
   711		status = nvmet_copy_to_sgl(req, 0, id, sizeof(*id));
   712		kfree(id);
   713	out:
   714		nvmet_req_complete(req, status);
   715	}
   716	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E902EC08B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756984163; cv=none; b=tcKxENzVTMVZdEmLULc26e/ApmNOHPfSAOldW7nuP6Im5tUS42992dkk7XeYXjnYPq6NMgPIigmEMREVceq3jhLrCvLkC7ut0w2Z5foOlNrFS6TYgV6Mz2o/imzhxSSM35bH/3fyAtqVzd8zSgmYRgM8l0XWD7k5glBOAe/kYK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756984163; c=relaxed/simple;
	bh=5PPmPqu0VovIpappB/AX9I6iQh5WzQqjm+VtOPMx9Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ThxRLts3gDQxMWC8YL5b4NTV1gYfgOE0rg4EjUvjJwcE7aNouh8HOmbDOPjN4JZ0yxkQ8eI/JLKhBVC3sU3v+RSJB7YzhjkNX4OmDwBpS3zoq4orv+wUez6v8oyLe28vBdWeDOutUJ7T8jPHBBmQ/0hIUDL5DrNUkfvQObsFxg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjqzBKAC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjqzBKAC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756984162; x=1788520162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5PPmPqu0VovIpappB/AX9I6iQh5WzQqjm+VtOPMx9Ys=;
  b=fjqzBKACPBdI4Ay8ORctkTvIVRf+m+PBfAmOI2uDH0oIxK1zOPDEDOo/
   VChIOwjVzEekXk2bscCcPVwcYtGfDRbubxy94LuFnGaceW02zOfGzqatv
   CZhfdVq1vGBwdVKZRk4pibAS+lzatT1ptyhWieVjKXa0rZmHVLyOAtr4T
   eW+yR0vMt81nWAk1BSInmWRol4DPGWs4h4xIyBCYus32LNlexoMZGjK5u
   cxpBR5h/affjuajiSeHXrXTVecw1epa5LsZ57q4sp+i5qxJnAxYFmjyUD
   RF5DJ5LmdSrCWz4TaXMU++WezviWuzqIt4a/KCWc8btj1eVmw8pCn72MR
   g==;
X-CSE-ConnectionGUID: J+hsEjxMQpS3vaX6BpasXg==
X-CSE-MsgGUID: QqFP+i+kSa2aMwixcnvI6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63147001"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63147001"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 04:09:20 -0700
X-CSE-ConnectionGUID: YqdY5H6ATzuhKN4UqFLQwg==
X-CSE-MsgGUID: fgxTx/qrQI68gSIQXLUuKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="171742402"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Sep 2025 04:09:19 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu7q8-000583-0B;
	Thu, 04 Sep 2025 11:09:16 +0000
Date: Thu, 4 Sep 2025 19:00:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2846/2846]
 block/blk-io-hierarchy/iodump.c:188:17: error: no member named 'bi_blkg' in
 'struct bio'
Message-ID: <202509041845.IkUFt5vT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   34aca7dce8183a6832361f564e5d70abce03e657
commit: 1bf8f90fb90c600d9f372e6be4ef251cc8905f04 [2846/2846] block-io-hierarchy: core hierarchy stats and iodump implementation
config: arm64-randconfig-r121-20250904 (https://download.01.org/0day-ci/archive/20250904/202509041845.IkUFt5vT-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250904/202509041845.IkUFt5vT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509041845.IkUFt5vT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-io-hierarchy/iodump.c:188:17: error: no member named 'bi_blkg' in 'struct bio'
           blkg_path(bio->bi_blkg, path, PATH_LEN);
                     ~~~  ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +188 block/blk-io-hierarchy/iodump.c

   179	
   180	static void __hierarchy_show_bio(struct seq_file *m, struct bio *bio,
   181					 enum stage_group stage, u64 duration)
   182	{
   183		char rwbs[RWB_LEN];
   184		char path[PATH_LEN] = {0};
   185		struct task_struct *task = get_pid_task(bio->pid, PIDTYPE_PID);
   186	
   187		blk_fill_rwbs(rwbs, bio->bi_opf);
 > 188		blkg_path(bio->bi_blkg, path, PATH_LEN);
   189	
   190		seq_printf(m, "%s-%d %s stage %s bio %s %llu + %u cgroup %s started %llu ns ago\n",
   191			   task ? task->comm : "null", task ? task->pid : 0,
   192			   bio->bi_bdev->bd_disk->disk_name,
   193			   hierarchy_stage_name(stage), rwbs, bio->bi_iter.bi_sector,
   194			   bio_sectors(bio), path, duration);
   195	
   196		if (task)
   197			put_task_struct(task);
   198	}
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

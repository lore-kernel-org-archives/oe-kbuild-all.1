Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2E9200CB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742804661; cv=none; b=CSREXt9TUgx6+pxu4W9xCzSib/mRNCo0cVWTG5vEnD7w2gPyUYRUwKIZ1Dy5QqwNxqsDuFL7PQPvSSSxroUD8yFS3I07zgE45zhRHbQa5kgejMk0JzhsypABexveOaHOfCxKExJgdkq13Oybdz+P7l+GvSkGHwpsypLF/4xetVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742804661; c=relaxed/simple;
	bh=kCjt67n1elIzQ6tsGtdVaiR+3psoeyWzMWC6W7/lCJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OT/acHl5UCr1GSEw8K/kaT/JqtmEtqS1mL7Guk9A+k/KxqGQmqYAiMeW+3cixRSz3ViOO8CyC5iQc3jr79ErrQAuHdGr7yeF6cZz6QaCHaj6F0eraZD3XTzT0xv0k7AjacHA1UNuo2LRUytjNPRNVjkCtFDl60v3LoycVp1NuCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5w0VJT6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5w0VJT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742804660; x=1774340660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kCjt67n1elIzQ6tsGtdVaiR+3psoeyWzMWC6W7/lCJ8=;
  b=h5w0VJT6t0tq/OkPdw7wW8ahwumRg7peXkm8wIOYYp4BsYkjmbmIuUv5
   DGFJs3irHJhjqCPBLGkIz6JZteMAqGYhXsdaDwAnVXRPVZJ1nnG/KVSuj
   6u1rrLcyKOKQWLukj7hdsrNNTt27EnKWJ4RXWikRK3x70uHUTnCdFAk/m
   xFfDBh20bwZp8eXuPe19y3e3sHtb2ttKtwWh05o4Z2wf2RKpth1NAne1a
   rJPjI+Sx1f+c4FZ/f84LaJZTdRdqOcmsz9Q9pVPf2Cig638UmidbC7i/g
   fr3hPhFWlpeoxzFKib2RJABksExQu5QpckXRjeI/tg9CHRR1o/iPyy+B4
   A==;
X-CSE-ConnectionGUID: PRXBpWZMRb2J3FK4mzuVww==
X-CSE-MsgGUID: rYZk/giJTOaaSMVvP1Rbbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="44011190"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="44011190"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 01:24:19 -0700
X-CSE-ConnectionGUID: 0/zlCd/+QZOTL7QO351QJw==
X-CSE-MsgGUID: zgQUYkTPQiOw7fmV0K7ytA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="123697242"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Mar 2025 01:24:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twd6V-0003PE-2Y;
	Mon, 24 Mar 2025 08:24:15 +0000
Date: Mon, 24 Mar 2025 16:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1513/1513]
 include/scsi/scsi_cmnd.h:327:12: warning: 'scsi_cmnd' may be used
 uninitialized in this function
Message-ID: <202503241626.r5trN0HW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi chenxiang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   256df080c8e0f3a9c8a5cc997ffc10fd5075dc6d
commit: b4adbc622b73d2bc61e6d712e0a916e568f0ce3f [1513/1513] scsi: hisi_sas: add support for DIF/DIX feature of v3 hw
config: arm64-randconfig-002-20250324 (https://download.01.org/0day-ci/archive/20250324/202503241626.r5trN0HW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503241626.r5trN0HW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503241626.r5trN0HW-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/scsi/libsas.h:36,
                    from include/scsi/sas_ata.h:29,
                    from drivers/scsi/hisi_sas/hisi_sas.h:27,
                    from drivers/scsi/hisi_sas/hisi_sas_main.c:12:
   drivers/scsi/hisi_sas/hisi_sas_main.c: In function 'hisi_sas_dif_dma_map':
>> include/scsi/scsi_cmnd.h:327:12: warning: 'scsi_cmnd' may be used uninitialized in this function [-Wmaybe-uninitialized]
     327 |  return cmd->prot_sdb ? cmd->prot_sdb->table.sgl : NULL;
         |         ~~~^~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_main.c:412:20: note: 'scsi_cmnd' was declared here
     412 |  struct scsi_cmnd *scsi_cmnd;
         |                    ^~~~~~~~~


vim +/scsi_cmnd +327 include/scsi/scsi_cmnd.h

7027ad72a68979 Martin K. Petersen 2008-07-17  324  
7027ad72a68979 Martin K. Petersen 2008-07-17  325  static inline struct scatterlist *scsi_prot_sglist(struct scsi_cmnd *cmd)
7027ad72a68979 Martin K. Petersen 2008-07-17  326  {
7027ad72a68979 Martin K. Petersen 2008-07-17 @327  	return cmd->prot_sdb ? cmd->prot_sdb->table.sgl : NULL;
7027ad72a68979 Martin K. Petersen 2008-07-17  328  }
7027ad72a68979 Martin K. Petersen 2008-07-17  329  

:::::: The code at line 327 was first introduced by commit
:::::: 7027ad72a689797475973c6feb5f0b673382f779 [SCSI] Support devices with protection information

:::::: TO: Martin K. Petersen <martin.petersen@oracle.com>
:::::: CC: James Bottomley <James.Bottomley@HansenPartnership.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

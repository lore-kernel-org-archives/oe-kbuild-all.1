Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13EC2C235E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779553109; cv=none; b=eb1iDvPffRnEjvdzAuVRU0Pzkh+jP1tg1btrw17lmmuzNnwoGWmd4vHtXGNPQF3CubUibt+6EetyTygZkyM4xcmlNYzRyIqXCFxUb6TBxbEDreW79dfC/rm2lwd0xuRkJz7M3YjUlzslNh/0vyzbmCfmcXhXVIixMd5a/fY+nhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779553109; c=relaxed/simple;
	bh=+zEdUDZzs3IFfnc1oTfJlAFBVjslZlT3LgREYdMmtV4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZzYxBYMYLaufe5WMld53ZHoSrzZwTJJBQrjMP/CKopgvg82TydMmER9HDtby4zXc+fkC/oLZHwQ1cxf/mXaUXOBesNGZBLN8eIrqVu5E5aPc5+MnEVvjWEcGUhtCg0aCmFOTqU/OE8m4AHQTMjpA9J3iURkN82bvnoKQG/tSb7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ba30ui2A; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ba30ui2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779553106; x=1811089106;
  h=date:from:to:cc:subject:message-id;
  bh=+zEdUDZzs3IFfnc1oTfJlAFBVjslZlT3LgREYdMmtV4=;
  b=Ba30ui2Afg+kBVP+idZKNo3p7Ceg1VrL/jVU24GHvlGAuP2Pp0+7FFIt
   12B7rK1iWoGKweFsD0TaI3XjJyGEEywDh2/cdyyquMMVEJNqkAsmtcykm
   /1t+XdkOJNUklyPrlC4NPKfXw461tXBYKrVvaQG8RvXYCPs5orcb5+yl2
   oD87ykw3BcJ6NnLrYCx/dijXEP5a9qY/c7a09Z0AVVUqhica6x9+8lyeU
   9kImmdp3CsVnCbpTggqnelt9+ZYGbIMUJcSkQap/GP2U7xgK742Epyy1R
   6W7HHAuTWT8uLuEQm4vMrnIHp7Y4PU13UIMtGrUye6t4lknGRVIo8Bz+L
   A==;
X-CSE-ConnectionGUID: hvfNoWplQTmcAP2Yv7xyxA==
X-CSE-MsgGUID: LUyheobGSxqUnp/uS1l0Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91135915"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="91135915"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 09:18:25 -0700
X-CSE-ConnectionGUID: eDLEzRy3TMCMhaVA3ged7A==
X-CSE-MsgGUID: kCgS0fBETQi8gdI5iawlfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="246163058"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 May 2026 09:18:23 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQp3M-0000000009H-1dYV;
	Sat, 23 May 2026 16:18:20 +0000
Date: Sun, 24 May 2026 00:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: drivers/scsi/qedf/qedf_main.c:2218:18: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202605240047.9AdZeK4d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   79bd2dded182b1d458b18e62684b7f82ffc682e5
commit: 2aa5801ada29948ce510fc8b1e3b3ec8162423e2 RISC-V: uaccess: Wrap the get_user_8 uaccess macro
date:   12 months ago
config: riscv-randconfig-r133-20260523 (https://download.01.org/0day-ci/archive/20260524/202605240047.9AdZeK4d-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240047.9AdZeK4d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2aa5801ada29 ("RISC-V: uaccess: Wrap the get_user_8 uaccess macro")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240047.9AdZeK4d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/scsi/qedf/qedf_main.c:2218:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] prod_idx @@     got restricted __le16 @@
   drivers/scsi/qedf/qedf_main.c:2218:18: sparse:     expected unsigned short [usertype] prod_idx
   drivers/scsi/qedf/qedf_main.c:2218:18: sparse:     got restricted __le16
   drivers/scsi/qedf/qedf_main.c:2247:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] prod_idx @@     got restricted __le16 @@
   drivers/scsi/qedf/qedf_main.c:2247:18: sparse:     expected unsigned short [usertype] prod_idx
   drivers/scsi/qedf/qedf_main.c:2247:18: sparse:     got restricted __le16
>> drivers/scsi/qedf/qedf_main.c:2264:33: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedf/qedf_main.c:2282:26: sparse: sparse: restricted __le32 degrades to integer
>> drivers/scsi/qedf/qedf_main.c:2513:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] fr_crc @@     got restricted __le32 [addressable] [usertype] fcoe_crc32 @@
   drivers/scsi/qedf/qedf_main.c:2513:20: sparse:     expected unsigned int [usertype] fr_crc
   drivers/scsi/qedf/qedf_main.c:2513:20: sparse:     got restricted __le32 [addressable] [usertype] fcoe_crc32
   drivers/scsi/qedf/qedf_main.c:2709:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedf/qedf_main.c:2824:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedf/qedf_main.c:2827:18: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedf/qedf_main.c: note: in included file (through include/scsi/libfcoe.h, drivers/scsi/qedf/qedf.h):
   include/scsi/fc/fc_fcoe.h:89:36: sparse: sparse: cast truncates bits from constant value (efc becomes fc)
   include/scsi/fc/fc_fcoe.h:90:23: sparse: sparse: cast truncates bits from constant value (efc00 becomes 0)
   drivers/scsi/qedf/qedf_main.c:1868:15: sparse: sparse: memcpy with byte count of 119872

vim +2218 drivers/scsi/qedf/qedf_main.c

61d8658b4a435e Dupuis, Chad     2017-02-15  2202  
61d8658b4a435e Dupuis, Chad     2017-02-15  2203  static bool qedf_fp_has_work(struct qedf_fastpath *fp)
61d8658b4a435e Dupuis, Chad     2017-02-15  2204  {
61d8658b4a435e Dupuis, Chad     2017-02-15  2205  	struct qedf_ctx *qedf = fp->qedf;
61d8658b4a435e Dupuis, Chad     2017-02-15  2206  	struct global_queue *que;
61d8658b4a435e Dupuis, Chad     2017-02-15  2207  	struct qed_sb_info *sb_info = fp->sb_info;
fb09a1ed5c6e50 Shai Malin       2021-10-04  2208  	struct status_block *sb = sb_info->sb_virt;
61d8658b4a435e Dupuis, Chad     2017-02-15  2209  	u16 prod_idx;
61d8658b4a435e Dupuis, Chad     2017-02-15  2210  
61d8658b4a435e Dupuis, Chad     2017-02-15  2211  	/* Get the pointer to the global CQ this completion is on */
61d8658b4a435e Dupuis, Chad     2017-02-15  2212  	que = qedf->global_queues[fp->sb_id];
61d8658b4a435e Dupuis, Chad     2017-02-15  2213  
61d8658b4a435e Dupuis, Chad     2017-02-15  2214  	/* Be sure all responses have been written to PI */
61d8658b4a435e Dupuis, Chad     2017-02-15  2215  	rmb();
61d8658b4a435e Dupuis, Chad     2017-02-15  2216  
61d8658b4a435e Dupuis, Chad     2017-02-15  2217  	/* Get the current firmware producer index */
61d8658b4a435e Dupuis, Chad     2017-02-15 @2218  	prod_idx = sb->pi_array[QEDF_FCOE_PARAMS_GL_RQ_PI];
61d8658b4a435e Dupuis, Chad     2017-02-15  2219  
61d8658b4a435e Dupuis, Chad     2017-02-15  2220  	return (que->cq_prod_idx != prod_idx);
61d8658b4a435e Dupuis, Chad     2017-02-15  2221  }
61d8658b4a435e Dupuis, Chad     2017-02-15  2222  
61d8658b4a435e Dupuis, Chad     2017-02-15  2223  /*
61d8658b4a435e Dupuis, Chad     2017-02-15  2224   * Interrupt handler code.
61d8658b4a435e Dupuis, Chad     2017-02-15  2225   */
61d8658b4a435e Dupuis, Chad     2017-02-15  2226  
61d8658b4a435e Dupuis, Chad     2017-02-15  2227  /* Process completion queue and copy CQE contents for deferred processesing
61d8658b4a435e Dupuis, Chad     2017-02-15  2228   *
61d8658b4a435e Dupuis, Chad     2017-02-15  2229   * Return true if we should wake the I/O thread, false if not.
61d8658b4a435e Dupuis, Chad     2017-02-15  2230   */
61d8658b4a435e Dupuis, Chad     2017-02-15  2231  static bool qedf_process_completions(struct qedf_fastpath *fp)
61d8658b4a435e Dupuis, Chad     2017-02-15  2232  {
61d8658b4a435e Dupuis, Chad     2017-02-15  2233  	struct qedf_ctx *qedf = fp->qedf;
61d8658b4a435e Dupuis, Chad     2017-02-15  2234  	struct qed_sb_info *sb_info = fp->sb_info;
fb09a1ed5c6e50 Shai Malin       2021-10-04  2235  	struct status_block *sb = sb_info->sb_virt;
61d8658b4a435e Dupuis, Chad     2017-02-15  2236  	struct global_queue *que;
61d8658b4a435e Dupuis, Chad     2017-02-15  2237  	u16 prod_idx;
61d8658b4a435e Dupuis, Chad     2017-02-15  2238  	struct fcoe_cqe *cqe;
61d8658b4a435e Dupuis, Chad     2017-02-15  2239  	struct qedf_io_work *io_work;
61d8658b4a435e Dupuis, Chad     2017-02-15  2240  	unsigned int cpu;
61d8658b4a435e Dupuis, Chad     2017-02-15  2241  	struct qedf_ioreq *io_req = NULL;
61d8658b4a435e Dupuis, Chad     2017-02-15  2242  	u16 xid;
61d8658b4a435e Dupuis, Chad     2017-02-15  2243  	u16 new_cqes;
61d8658b4a435e Dupuis, Chad     2017-02-15  2244  	u32 comp_type;
61d8658b4a435e Dupuis, Chad     2017-02-15  2245  
61d8658b4a435e Dupuis, Chad     2017-02-15  2246  	/* Get the current firmware producer index */
61d8658b4a435e Dupuis, Chad     2017-02-15  2247  	prod_idx = sb->pi_array[QEDF_FCOE_PARAMS_GL_RQ_PI];
61d8658b4a435e Dupuis, Chad     2017-02-15  2248  
61d8658b4a435e Dupuis, Chad     2017-02-15  2249  	/* Get the pointer to the global CQ this completion is on */
61d8658b4a435e Dupuis, Chad     2017-02-15  2250  	que = qedf->global_queues[fp->sb_id];
61d8658b4a435e Dupuis, Chad     2017-02-15  2251  
61d8658b4a435e Dupuis, Chad     2017-02-15  2252  	/* Calculate the amount of new elements since last processing */
61d8658b4a435e Dupuis, Chad     2017-02-15  2253  	new_cqes = (prod_idx >= que->cq_prod_idx) ?
61d8658b4a435e Dupuis, Chad     2017-02-15  2254  	    (prod_idx - que->cq_prod_idx) :
61d8658b4a435e Dupuis, Chad     2017-02-15  2255  	    0x10000 - que->cq_prod_idx + prod_idx;
61d8658b4a435e Dupuis, Chad     2017-02-15  2256  
61d8658b4a435e Dupuis, Chad     2017-02-15  2257  	/* Save producer index */
61d8658b4a435e Dupuis, Chad     2017-02-15  2258  	que->cq_prod_idx = prod_idx;
61d8658b4a435e Dupuis, Chad     2017-02-15  2259  
61d8658b4a435e Dupuis, Chad     2017-02-15  2260  	while (new_cqes) {
61d8658b4a435e Dupuis, Chad     2017-02-15  2261  		fp->completions++;
61d8658b4a435e Dupuis, Chad     2017-02-15  2262  		cqe = &que->cq[que->cq_cons_idx];
61d8658b4a435e Dupuis, Chad     2017-02-15  2263  
61d8658b4a435e Dupuis, Chad     2017-02-15 @2264  		comp_type = (cqe->cqe_data >> FCOE_CQE_CQE_TYPE_SHIFT) &
61d8658b4a435e Dupuis, Chad     2017-02-15  2265  		    FCOE_CQE_CQE_TYPE_MASK;
61d8658b4a435e Dupuis, Chad     2017-02-15  2266  
61d8658b4a435e Dupuis, Chad     2017-02-15  2267  		/*
61d8658b4a435e Dupuis, Chad     2017-02-15  2268  		 * Process unsolicited CQEs directly in the interrupt handler
61d8658b4a435e Dupuis, Chad     2017-02-15  2269  		 * sine we need the fastpath ID
61d8658b4a435e Dupuis, Chad     2017-02-15  2270  		 */
61d8658b4a435e Dupuis, Chad     2017-02-15  2271  		if (comp_type == FCOE_UNSOLIC_CQE_TYPE) {
61d8658b4a435e Dupuis, Chad     2017-02-15  2272  			QEDF_INFO(&(qedf->dbg_ctx), QEDF_LOG_UNSOL,
61d8658b4a435e Dupuis, Chad     2017-02-15  2273  			   "Unsolicated CQE.\n");
61d8658b4a435e Dupuis, Chad     2017-02-15  2274  			qedf_process_unsol_compl(qedf, fp->sb_id, cqe);
61d8658b4a435e Dupuis, Chad     2017-02-15  2275  			/*
61d8658b4a435e Dupuis, Chad     2017-02-15  2276  			 * Don't add a work list item.  Increment consumer
61d8658b4a435e Dupuis, Chad     2017-02-15  2277  			 * consumer index and move on.
61d8658b4a435e Dupuis, Chad     2017-02-15  2278  			 */
61d8658b4a435e Dupuis, Chad     2017-02-15  2279  			goto inc_idx;
61d8658b4a435e Dupuis, Chad     2017-02-15  2280  		}
61d8658b4a435e Dupuis, Chad     2017-02-15  2281  
61d8658b4a435e Dupuis, Chad     2017-02-15  2282  		xid = cqe->cqe_data & FCOE_CQE_TASK_ID_MASK;
61d8658b4a435e Dupuis, Chad     2017-02-15  2283  		io_req = &qedf->cmd_mgr->cmds[xid];
61d8658b4a435e Dupuis, Chad     2017-02-15  2284  
61d8658b4a435e Dupuis, Chad     2017-02-15  2285  		/*
61d8658b4a435e Dupuis, Chad     2017-02-15  2286  		 * Figure out which percpu thread we should queue this I/O
61d8658b4a435e Dupuis, Chad     2017-02-15  2287  		 * on.
61d8658b4a435e Dupuis, Chad     2017-02-15  2288  		 */
61d8658b4a435e Dupuis, Chad     2017-02-15  2289  		if (!io_req)
b8c7dd15ceb87e Jesse Brandeburg 2024-06-11  2290  			/* If there is not io_req associated with this CQE
61d8658b4a435e Dupuis, Chad     2017-02-15  2291  			 * just queue it on CPU 0
61d8658b4a435e Dupuis, Chad     2017-02-15  2292  			 */
61d8658b4a435e Dupuis, Chad     2017-02-15  2293  			cpu = 0;
61d8658b4a435e Dupuis, Chad     2017-02-15  2294  		else {
61d8658b4a435e Dupuis, Chad     2017-02-15  2295  			cpu = io_req->cpu;
61d8658b4a435e Dupuis, Chad     2017-02-15  2296  			io_req->int_cpu = smp_processor_id();
61d8658b4a435e Dupuis, Chad     2017-02-15  2297  		}
61d8658b4a435e Dupuis, Chad     2017-02-15  2298  
61d8658b4a435e Dupuis, Chad     2017-02-15  2299  		io_work = mempool_alloc(qedf->io_mempool, GFP_ATOMIC);
61d8658b4a435e Dupuis, Chad     2017-02-15  2300  		if (!io_work) {
61d8658b4a435e Dupuis, Chad     2017-02-15  2301  			QEDF_WARN(&(qedf->dbg_ctx), "Could not allocate "
61d8658b4a435e Dupuis, Chad     2017-02-15  2302  				   "work for I/O completion.\n");
61d8658b4a435e Dupuis, Chad     2017-02-15  2303  			continue;
61d8658b4a435e Dupuis, Chad     2017-02-15  2304  		}
61d8658b4a435e Dupuis, Chad     2017-02-15  2305  		memset(io_work, 0, sizeof(struct qedf_io_work));
61d8658b4a435e Dupuis, Chad     2017-02-15  2306  
61d8658b4a435e Dupuis, Chad     2017-02-15  2307  		INIT_WORK(&io_work->work, qedf_fp_io_handler);
61d8658b4a435e Dupuis, Chad     2017-02-15  2308  
61d8658b4a435e Dupuis, Chad     2017-02-15  2309  		/* Copy contents of CQE for deferred processing */
61d8658b4a435e Dupuis, Chad     2017-02-15  2310  		memcpy(&io_work->cqe, cqe, sizeof(struct fcoe_cqe));
61d8658b4a435e Dupuis, Chad     2017-02-15  2311  
61d8658b4a435e Dupuis, Chad     2017-02-15  2312  		io_work->qedf = fp->qedf;
61d8658b4a435e Dupuis, Chad     2017-02-15  2313  		io_work->fp = NULL; /* Only used for unsolicited frames */
61d8658b4a435e Dupuis, Chad     2017-02-15  2314  
61d8658b4a435e Dupuis, Chad     2017-02-15  2315  		queue_work_on(cpu, qedf_io_wq, &io_work->work);
61d8658b4a435e Dupuis, Chad     2017-02-15  2316  
61d8658b4a435e Dupuis, Chad     2017-02-15  2317  inc_idx:
61d8658b4a435e Dupuis, Chad     2017-02-15  2318  		que->cq_cons_idx++;
61d8658b4a435e Dupuis, Chad     2017-02-15  2319  		if (que->cq_cons_idx == fp->cq_num_entries)
61d8658b4a435e Dupuis, Chad     2017-02-15  2320  			que->cq_cons_idx = 0;
61d8658b4a435e Dupuis, Chad     2017-02-15  2321  		new_cqes--;
61d8658b4a435e Dupuis, Chad     2017-02-15  2322  	}
61d8658b4a435e Dupuis, Chad     2017-02-15  2323  
61d8658b4a435e Dupuis, Chad     2017-02-15  2324  	return true;
61d8658b4a435e Dupuis, Chad     2017-02-15  2325  }
61d8658b4a435e Dupuis, Chad     2017-02-15  2326  

:::::: The code at line 2218 was first introduced by commit
:::::: 61d8658b4a435eac729966cc94cdda077a8df5cd scsi: qedf: Add QLogic FastLinQ offload FCoE driver framework.

:::::: TO: Dupuis, Chad <chad.dupuis@cavium.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

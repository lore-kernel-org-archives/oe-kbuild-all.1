Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7791A683A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 01:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786154063; cv=none; b=X17JYiF7RqpQqp5+MIJXfwkigGCh/QFgBD5KKWtemmcdWeWzqN4LWZ/yR/m/K9M0Z8sWsTLi/6lUQ9ZCdblPD3mw49ac2P2SVI5SbbfQjjqzTWeIolDlK/Ml0UxggA08um3zxZXV2BN23WndRU+sfyoHAZK9QL4oUXBbj9SKdI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786154063; c=relaxed/simple;
	bh=f2z4C0qf9nvodzjT8adv2g5XgFgtxJnXQ/XGWFot6OI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kVVm9EGsQBEQW6t2+Qfjx7srNE1yaWZMoBDkJUL3IQgNN3d4klDOAnmm47g+S0FRDHWLReqMer1Pg0aUkMfuwBdUn4LErp7d08mz74FNXIkkt5/TEpheMTCkzQ2ZZfqd30Y8Ss6sfcEk5CpHKyV8t1vHLH+pbIQgYrpdtS30jWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4LEs7RU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4LEs7RU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786154062; x=1817690062;
  h=date:from:to:cc:subject:message-id;
  bh=f2z4C0qf9nvodzjT8adv2g5XgFgtxJnXQ/XGWFot6OI=;
  b=H4LEs7RUGba0bU73lkPnsjDI4WCbb/nfGZQlnrGc2tUKz7u396lgm6eq
   zr52LMtBy5oShoKbB4NmMgzkqA7WeMyvSq6ZpgiHZK9GzIhXP6nNFGiZE
   VXMKZqSRUPxOZuPFxY2XRXyoqexIqdTmndRvspqSON9QrxT4knbDYO6IP
   eIRyHLkyyIkXLVMbAOBrRRhzrv3HOXgQwb/WkQqF9NzTOEOdEuHntbE0y
   SzuBrJ0q3orEEAJhzn/kSSugnzK45KXxmx7ZkuJY42d3ccbp49oHP1KGe
   3r5dYNBSQLgduhhfsbFQNJDJd9h6zY3Ohxtv1+No+v7iGlgCU3Ax/9Ddb
   w==;
X-CSE-ConnectionGUID: FYygqfwLQDCjh8ivektjgw==
X-CSE-MsgGUID: JbLc6RkMRMe8vtKj5b98ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="97118234"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="97118234"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 18:54:21 -0700
X-CSE-ConnectionGUID: WGJk+0QjRNagwxL+lkbHbw==
X-CSE-MsgGUID: /D7DKFcNRQW1b8aSnhB+Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="259233716"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2026 18:54:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsWGO-00000000JcX-1DGU;
	Sat, 08 Aug 2026 01:54:16 +0000
Date: Sat, 08 Aug 2026 09:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: Anil Gurumurthy <agurumurthy@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Martin K. Petersen (Oracle)" <mkp@kernel.org>,
 Nilesh Javali <njavali@marvell.com>, Hannes Reinecke <hare@kernel.org>
Subject: [mkp-scsi:for-next 112/210]
 drivers/scsi/qla2xxx/qla_init.c:9209:74: warning: format '%lx' expects
 argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka
 'unsigned int'}
Message-ID: <202608080957.ZTFig1A7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   15b7fe6db602d0202761902d2c50bc1e8bbe6cea
commit: b6781d71a41450418a1486122978ad5bb429136b [112/210] scsi: qla2xxx: Update IO path to use 128-byte IOCBs for 29xx
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260808/202608080957.ZTFig1A7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080957.ZTFig1A7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080957.ZTFig1A7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/qla2xxx/qla_init.c: In function 'qla29xx_process_rd_image':
>> drivers/scsi/qla2xxx/qla_init.c:9209:74: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    9209 |                             "TIM section too large (0x%x bytes, ring 0x%lx bytes).\n",
         |                                                                        ~~^
         |                                                                          |
         |                                                                          long unsigned int
         |                                                                        %x
    9210 |                             section_size,
    9211 |                             req->length * qla_req_entry_size(ha));
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~          
         |                                         |
         |                                         size_t {aka unsigned int}


vim +9209 drivers/scsi/qla2xxx/qla_init.c

c3930ec119cb91 Manish Rangankar 2026-07-23  9182  
c3930ec119cb91 Manish Rangankar 2026-07-23  9183  static int qla29xx_process_rd_image(struct scsi_qla_host *vha,
c3930ec119cb91 Manish Rangankar 2026-07-23  9184  				    struct fcop_header *header,
c3930ec119cb91 Manish Rangankar 2026-07-23  9185  				    __be32 *fwcode, int section,
c3930ec119cb91 Manish Rangankar 2026-07-23  9186  				    uint32_t risc_addr, uint32_t section_size)
c3930ec119cb91 Manish Rangankar 2026-07-23  9187  {
c3930ec119cb91 Manish Rangankar 2026-07-23  9188  	int rval = QLA_SUCCESS;
c3930ec119cb91 Manish Rangankar 2026-07-23  9189  	uint32_t *dcode = NULL;
c3930ec119cb91 Manish Rangankar 2026-07-23  9190  	struct qla_hw_data *ha = vha->hw;
c3930ec119cb91 Manish Rangankar 2026-07-23  9191  	struct req_que *req = ha->req_q_map[0];
c3930ec119cb91 Manish Rangankar 2026-07-23  9192  	int num_segments = 0, segment = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9193  	int chunks_per_segment = 0, chunk = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9194  	int is_first_chunk = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9195  	int is_last_chunk = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9196  	int is_first_segment = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9197  	int is_last_segment = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9198  	int opt = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9199  	uint32_t size = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9200  	uint32_t size_remainder = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9201  	uint32_t seg_size_remainder = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9202  	int i = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9203  
c3930ec119cb91 Manish Rangankar 2026-07-23  9204  	dcode = (uint32_t *)req->ring;
c3930ec119cb91 Manish Rangankar 2026-07-23  9205  
c3930ec119cb91 Manish Rangankar 2026-07-23  9206  	if (section == TIM) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9207  		if (section_size > req->length * qla_req_entry_size(ha)) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9208  			ql_log(ql_log_fatal, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23 @9209  			    "TIM section too large (0x%x bytes, ring 0x%lx bytes).\n",
c3930ec119cb91 Manish Rangankar 2026-07-23  9210  			    section_size,
c3930ec119cb91 Manish Rangankar 2026-07-23  9211  			    req->length * qla_req_entry_size(ha));
c3930ec119cb91 Manish Rangankar 2026-07-23  9212  			return QLA_FUNCTION_FAILED;
c3930ec119cb91 Manish Rangankar 2026-07-23  9213  		}
c3930ec119cb91 Manish Rangankar 2026-07-23  9214  
c3930ec119cb91 Manish Rangankar 2026-07-23  9215  		opt = BIT_15 | BIT_2 | BIT_1 | BIT_0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9216  		for (i = 0; i < (section_size >> 2); i++)
c3930ec119cb91 Manish Rangankar 2026-07-23  9217  			dcode[i] = swab32((__force u32)fwcode[i]);
c3930ec119cb91 Manish Rangankar 2026-07-23  9218  
c3930ec119cb91 Manish Rangankar 2026-07-23  9219  		ql_dbg(ql_dbg_init, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23  9220  		       "TIM : process_rd_image [opt 0x%x]\n", opt);
c3930ec119cb91 Manish Rangankar 2026-07-23  9221  		rval = qla2x00_load_ram(vha, req->dma, risc_addr,
c3930ec119cb91 Manish Rangankar 2026-07-23  9222  					section_size >> 2, opt);
c3930ec119cb91 Manish Rangankar 2026-07-23  9223  		if (rval) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9224  			ql_log(ql_log_fatal, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23  9225  			       "-> Failed load TIM\n");
c3930ec119cb91 Manish Rangankar 2026-07-23  9226  			return QLA_FUNCTION_FAILED;
c3930ec119cb91 Manish Rangankar 2026-07-23  9227  		}
c3930ec119cb91 Manish Rangankar 2026-07-23  9228  	} else {
c3930ec119cb91 Manish Rangankar 2026-07-23  9229  		size_remainder = section_size;
c3930ec119cb91 Manish Rangankar 2026-07-23  9230  		num_segments += (section_size % header->segment_size == 0) ?
c3930ec119cb91 Manish Rangankar 2026-07-23  9231  			(section_size / header->segment_size) :
c3930ec119cb91 Manish Rangankar 2026-07-23  9232  			(section_size / header->segment_size) + 1;
c3930ec119cb91 Manish Rangankar 2026-07-23  9233  		chunks_per_segment =
c3930ec119cb91 Manish Rangankar 2026-07-23  9234  			(header->segment_size % CHUNK_SIZE == 0) ?
c3930ec119cb91 Manish Rangankar 2026-07-23  9235  			(header->segment_size / CHUNK_SIZE) :
c3930ec119cb91 Manish Rangankar 2026-07-23  9236  			(header->segment_size / CHUNK_SIZE) + 1;
c3930ec119cb91 Manish Rangankar 2026-07-23  9237  
c3930ec119cb91 Manish Rangankar 2026-07-23  9238  		ql_dbg(ql_dbg_init, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23  9239  		       "num seg 0x%x chunk per seg 0x%x\n",
c3930ec119cb91 Manish Rangankar 2026-07-23  9240  		       num_segments, chunks_per_segment);
c3930ec119cb91 Manish Rangankar 2026-07-23  9241  
c3930ec119cb91 Manish Rangankar 2026-07-23  9242  		for (segment = 0; segment < num_segments; segment++) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9243  			for (chunk = 0; chunk < chunks_per_segment; chunk++) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9244  				is_first_chunk = (chunk == 0);
c3930ec119cb91 Manish Rangankar 2026-07-23  9245  				if (chunk == 0) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9246  					if (size_remainder >=
c3930ec119cb91 Manish Rangankar 2026-07-23  9247  					    header->segment_size)
c3930ec119cb91 Manish Rangankar 2026-07-23  9248  						seg_size_remainder =
c3930ec119cb91 Manish Rangankar 2026-07-23  9249  							header->segment_size;
c3930ec119cb91 Manish Rangankar 2026-07-23  9250  					else
c3930ec119cb91 Manish Rangankar 2026-07-23  9251  						seg_size_remainder =
c3930ec119cb91 Manish Rangankar 2026-07-23  9252  							size_remainder;
c3930ec119cb91 Manish Rangankar 2026-07-23  9253  				}
c3930ec119cb91 Manish Rangankar 2026-07-23  9254  
c3930ec119cb91 Manish Rangankar 2026-07-23  9255  				is_first_segment =
c3930ec119cb91 Manish Rangankar 2026-07-23  9256  					(section == ARR1 && segment == 0);
c3930ec119cb91 Manish Rangankar 2026-07-23  9257  				is_last_segment =
c3930ec119cb91 Manish Rangankar 2026-07-23  9258  					(section == ARR2 &&
c3930ec119cb91 Manish Rangankar 2026-07-23  9259  					 (segment == (num_segments - 1)));
c3930ec119cb91 Manish Rangankar 2026-07-23  9260  				is_last_chunk =
c3930ec119cb91 Manish Rangankar 2026-07-23  9261  					(chunk == (chunks_per_segment - 1) ||
c3930ec119cb91 Manish Rangankar 2026-07-23  9262  					 size_remainder <= CHUNK_SIZE);
c3930ec119cb91 Manish Rangankar 2026-07-23  9263  
c3930ec119cb91 Manish Rangankar 2026-07-23  9264  				if (seg_size_remainder < CHUNK_SIZE)
c3930ec119cb91 Manish Rangankar 2026-07-23  9265  					size = seg_size_remainder % CHUNK_SIZE;
c3930ec119cb91 Manish Rangankar 2026-07-23  9266  				else
c3930ec119cb91 Manish Rangankar 2026-07-23  9267  					size = CHUNK_SIZE;
c3930ec119cb91 Manish Rangankar 2026-07-23  9268  
c3930ec119cb91 Manish Rangankar 2026-07-23  9269  				ql_dbg(ql_dbg_init, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23  9270  				       "[%d]chunk 0x%x segment 0x%x first_segment 0x%x first_chunk 0x%x last_segment 0x%x last_chunk 0x%x\n",
c3930ec119cb91 Manish Rangankar 2026-07-23  9271  				       __LINE__, chunk, segment,
c3930ec119cb91 Manish Rangankar 2026-07-23  9272  				       is_first_segment, is_first_chunk,
c3930ec119cb91 Manish Rangankar 2026-07-23  9273  				       is_last_segment, is_last_chunk);
c3930ec119cb91 Manish Rangankar 2026-07-23  9274  
c3930ec119cb91 Manish Rangankar 2026-07-23  9275  				opt = BIT_2;
c3930ec119cb91 Manish Rangankar 2026-07-23  9276  				if (is_first_chunk)
c3930ec119cb91 Manish Rangankar 2026-07-23  9277  					opt |= BIT_0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9278  				if (is_last_chunk)
c3930ec119cb91 Manish Rangankar 2026-07-23  9279  					opt |= BIT_1;
c3930ec119cb91 Manish Rangankar 2026-07-23  9280  				if (is_first_segment)
c3930ec119cb91 Manish Rangankar 2026-07-23  9281  					opt |= BIT_3;
c3930ec119cb91 Manish Rangankar 2026-07-23  9282  				if (is_last_segment)
c3930ec119cb91 Manish Rangankar 2026-07-23  9283  					opt |= BIT_4;
c3930ec119cb91 Manish Rangankar 2026-07-23  9284  
c3930ec119cb91 Manish Rangankar 2026-07-23  9285  				for (i = 0; i < (size >> 2); i++)
c3930ec119cb91 Manish Rangankar 2026-07-23  9286  					dcode[i] =
c3930ec119cb91 Manish Rangankar 2026-07-23  9287  					    swab32((__force u32)fwcode[i]);
c3930ec119cb91 Manish Rangankar 2026-07-23  9288  
c3930ec119cb91 Manish Rangankar 2026-07-23  9289  				ql_dbg(ql_dbg_init, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23  9290  				       "ARR[0x%x] : opt 0x%x\n", size, opt);
c3930ec119cb91 Manish Rangankar 2026-07-23  9291  				rval = qla2x00_load_ram(vha, req->dma,
c3930ec119cb91 Manish Rangankar 2026-07-23  9292  							risc_addr,
c3930ec119cb91 Manish Rangankar 2026-07-23  9293  							size >> 2, opt);
c3930ec119cb91 Manish Rangankar 2026-07-23  9294  				if (rval) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9295  					ql_log(ql_log_fatal, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23  9296  					       "-> Failed load ram\n");
c3930ec119cb91 Manish Rangankar 2026-07-23  9297  					return QLA_FUNCTION_FAILED;
c3930ec119cb91 Manish Rangankar 2026-07-23  9298  				}
c3930ec119cb91 Manish Rangankar 2026-07-23  9299  
c3930ec119cb91 Manish Rangankar 2026-07-23  9300  				fwcode += size >> 2;
c3930ec119cb91 Manish Rangankar 2026-07-23  9301  				size_remainder -= size;
c3930ec119cb91 Manish Rangankar 2026-07-23  9302  				seg_size_remainder -= size;
c3930ec119cb91 Manish Rangankar 2026-07-23  9303  				if (size_remainder == 0)
c3930ec119cb91 Manish Rangankar 2026-07-23  9304  					break;
c3930ec119cb91 Manish Rangankar 2026-07-23  9305  			}
c3930ec119cb91 Manish Rangankar 2026-07-23  9306  			risc_addr += header->segment_size >> 2;
c3930ec119cb91 Manish Rangankar 2026-07-23  9307  		}
c3930ec119cb91 Manish Rangankar 2026-07-23  9308  	}
c3930ec119cb91 Manish Rangankar 2026-07-23  9309  	return rval;
c3930ec119cb91 Manish Rangankar 2026-07-23  9310  }
c3930ec119cb91 Manish Rangankar 2026-07-23  9311  

:::::: The code at line 9209 was first introduced by commit
:::::: c3930ec119cb916be879c017ea1e389e05dbe1aa scsi: qla2xxx: Add FC operational firmware load for 29xx

:::::: TO: Manish Rangankar <mrangankar@marvell.com>
:::::: CC: Martin K. Petersen (Oracle) <mkp@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

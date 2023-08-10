Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33531FB4A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 18:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691693060; x=1723229060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k2q0fqeqSV9fckoRT3kIVS6vWVEdF41SGnj/7WwNIV0=;
  b=O1p9xsNeSMdLTmRSKOX9vYlj+R1YNJ4on3KFev0dg5fUxyxoYxa0iLVP
   6JCZ6DD1FCzD1VRhqNqiWyOmiFKkL9hA6aUmZXia3fgWewOHg/WE5tiqd
   fWIHw5dYsJ9n5oWgNmCtr3zIW6+PevIAonxBTDG6rspj6yN+Y+qpmaH+F
   gPCVjyhGpEY/ISiyWFuFLn79t6iq6afVMAqbc7P4D53SgEcpWq3wW2J5n
   P7HLa7gYsJcId54LTqo2mY9lq91TZwqjjkRNkzjRzGJDDhWuoTS6Lz53N
   bywg5EuSJh+knb7NVzGIr8AzKkrHtjOiBlK6bOTzVwWqji1oOr2UQlxF3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="457867139"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="457867139"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 11:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="856008628"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="856008628"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Aug 2023 11:44:18 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUAds-0007Bs-38;
	Thu, 10 Aug 2023 18:44:16 +0000
Date: Fri, 11 Aug 2023 02:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Leon Romanovsky <leon@kernel.org>
Subject: [linux-next:master 5279/8441]
 drivers/infiniband/hw/irdma/uk.c:285:24: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202308110251.BV6BcwUR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 272bba19d631e21e47f6ffa5654d3c17c57ea2ac [5279/8441] RDMA: Remove unnecessary ternary operators
config: loongarch-randconfig-r091-20230810 (https://download.01.org/0day-ci/archive/20230811/202308110251.BV6BcwUR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110251.BV6BcwUR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110251.BV6BcwUR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/hw/irdma/uk.c:285:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected bool [usertype] push_wqe:1 @@     got restricted __le32 [usertype] *push_db @@
   drivers/infiniband/hw/irdma/uk.c:285:24: sparse:     expected bool [usertype] push_wqe:1
   drivers/infiniband/hw/irdma/uk.c:285:24: sparse:     got restricted __le32 [usertype] *push_db
   drivers/infiniband/hw/irdma/uk.c:386:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected bool [usertype] push_wqe:1 @@     got restricted __le32 [usertype] *push_db @@
   drivers/infiniband/hw/irdma/uk.c:386:24: sparse:     expected bool [usertype] push_wqe:1
   drivers/infiniband/hw/irdma/uk.c:386:24: sparse:     got restricted __le32 [usertype] *push_db
   drivers/infiniband/hw/irdma/uk.c:471:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected bool [usertype] push_wqe:1 @@     got restricted __le32 [usertype] *push_db @@
   drivers/infiniband/hw/irdma/uk.c:471:24: sparse:     expected bool [usertype] push_wqe:1
   drivers/infiniband/hw/irdma/uk.c:471:24: sparse:     got restricted __le32 [usertype] *push_db
   drivers/infiniband/hw/irdma/uk.c:723:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected bool [usertype] push_wqe:1 @@     got restricted __le32 [usertype] *push_db @@
   drivers/infiniband/hw/irdma/uk.c:723:24: sparse:     expected bool [usertype] push_wqe:1
   drivers/infiniband/hw/irdma/uk.c:723:24: sparse:     got restricted __le32 [usertype] *push_db
   drivers/infiniband/hw/irdma/uk.c:797:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected bool [usertype] push_wqe:1 @@     got restricted __le32 [usertype] *push_db @@
   drivers/infiniband/hw/irdma/uk.c:797:24: sparse:     expected bool [usertype] push_wqe:1
   drivers/infiniband/hw/irdma/uk.c:797:24: sparse:     got restricted __le32 [usertype] *push_db
   drivers/infiniband/hw/irdma/uk.c:875:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected bool [usertype] push_wqe:1 @@     got restricted __le32 [usertype] *push_db @@
   drivers/infiniband/hw/irdma/uk.c:875:24: sparse:     expected bool [usertype] push_wqe:1
   drivers/infiniband/hw/irdma/uk.c:875:24: sparse:     got restricted __le32 [usertype] *push_db

vim +285 drivers/infiniband/hw/irdma/uk.c

   265	
   266	/**
   267	 * irdma_uk_rdma_write - rdma write operation
   268	 * @qp: hw qp ptr
   269	 * @info: post sq information
   270	 * @post_sq: flag to post sq
   271	 */
   272	int irdma_uk_rdma_write(struct irdma_qp_uk *qp, struct irdma_post_sq_info *info,
   273				bool post_sq)
   274	{
   275		u64 hdr;
   276		__le64 *wqe;
   277		struct irdma_rdma_write *op_info;
   278		u32 i, wqe_idx;
   279		u32 total_size = 0, byte_off;
   280		int ret_code;
   281		u32 frag_cnt, addl_frag_cnt;
   282		bool read_fence = false;
   283		u16 quanta;
   284	
 > 285		info->push_wqe = qp->push_db;
   286	
   287		op_info = &info->op.rdma_write;
   288		if (op_info->num_lo_sges > qp->max_sq_frag_cnt)
   289			return -EINVAL;
   290	
   291		for (i = 0; i < op_info->num_lo_sges; i++)
   292			total_size += op_info->lo_sg_list[i].length;
   293	
   294		read_fence |= info->read_fence;
   295	
   296		if (info->imm_data_valid)
   297			frag_cnt = op_info->num_lo_sges + 1;
   298		else
   299			frag_cnt = op_info->num_lo_sges;
   300		addl_frag_cnt = frag_cnt > 1 ? (frag_cnt - 1) : 0;
   301		ret_code = irdma_fragcnt_to_quanta_sq(frag_cnt, &quanta);
   302		if (ret_code)
   303			return ret_code;
   304	
   305		wqe = irdma_qp_get_next_send_wqe(qp, &wqe_idx, quanta, total_size,
   306						 info);
   307		if (!wqe)
   308			return -ENOMEM;
   309	
   310		irdma_clr_wqes(qp, wqe_idx);
   311	
   312		set_64bit_val(wqe, 16,
   313			      FIELD_PREP(IRDMAQPSQ_FRAG_TO, op_info->rem_addr.addr));
   314	
   315		if (info->imm_data_valid) {
   316			set_64bit_val(wqe, 0,
   317				      FIELD_PREP(IRDMAQPSQ_IMMDATA, info->imm_data));
   318			i = 0;
   319		} else {
   320			qp->wqe_ops.iw_set_fragment(wqe, 0,
   321						    op_info->lo_sg_list,
   322						    qp->swqe_polarity);
   323			i = 1;
   324		}
   325	
   326		for (byte_off = 32; i < op_info->num_lo_sges; i++) {
   327			qp->wqe_ops.iw_set_fragment(wqe, byte_off,
   328						    &op_info->lo_sg_list[i],
   329						    qp->swqe_polarity);
   330			byte_off += 16;
   331		}
   332	
   333		/* if not an odd number set valid bit in next fragment */
   334		if (qp->uk_attrs->hw_rev >= IRDMA_GEN_2 && !(frag_cnt & 0x01) &&
   335		    frag_cnt) {
   336			qp->wqe_ops.iw_set_fragment(wqe, byte_off, NULL,
   337						    qp->swqe_polarity);
   338			if (qp->uk_attrs->hw_rev == IRDMA_GEN_2)
   339				++addl_frag_cnt;
   340		}
   341	
   342		hdr = FIELD_PREP(IRDMAQPSQ_REMSTAG, op_info->rem_addr.lkey) |
   343		      FIELD_PREP(IRDMAQPSQ_OPCODE, info->op_type) |
   344		      FIELD_PREP(IRDMAQPSQ_IMMDATAFLAG, info->imm_data_valid) |
   345		      FIELD_PREP(IRDMAQPSQ_REPORTRTT, info->report_rtt) |
   346		      FIELD_PREP(IRDMAQPSQ_ADDFRAGCNT, addl_frag_cnt) |
   347		      FIELD_PREP(IRDMAQPSQ_PUSHWQE, info->push_wqe) |
   348		      FIELD_PREP(IRDMAQPSQ_READFENCE, read_fence) |
   349		      FIELD_PREP(IRDMAQPSQ_LOCALFENCE, info->local_fence) |
   350		      FIELD_PREP(IRDMAQPSQ_SIGCOMPL, info->signaled) |
   351		      FIELD_PREP(IRDMAQPSQ_VALID, qp->swqe_polarity);
   352	
   353		dma_wmb(); /* make sure WQE is populated before valid bit is set */
   354	
   355		set_64bit_val(wqe, 24, hdr);
   356		if (info->push_wqe) {
   357			irdma_qp_push_wqe(qp, wqe, quanta, wqe_idx, post_sq);
   358		} else {
   359			if (post_sq)
   360				irdma_uk_qp_post_wr(qp);
   361		}
   362	
   363		return 0;
   364	}
   365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

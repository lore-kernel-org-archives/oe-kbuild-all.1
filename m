Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4061D157E9E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706776108; cv=none; b=nFiY6cythoya97l/fn/yHodjRyag+Lq27XZueWCGmbodD04NpwI737NIEuey54LKgNQWhIuS5lUWW2Ej/VdPOxHLelu+q5rDv5tyheYIKAEAgmT1dc+JIAAZZkQ5cllslLjgO4JxuYr3zinGa+MopQH/ZUwFyIvkNbQ/It98PC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706776108; c=relaxed/simple;
	bh=GYjSs0ehnuUTeW6X1fKYyfTxuB3/jGLEVPZT9eDsChM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mSw82FKHcCX8cFgTFaF7oHzUsemyE2g2KOSBIiUkXlgrIlrWWWUV046Gbx4z7+vFGEotZopox6xWCLHjzyAOlvVWEcFMyb59vYVt+YbPaiEq4jRJPylBMstlLyLnZHNQL45I60cjdnqKonXQznLDRzGkOW0W4UlgRUH8+aFT7ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ee9k6FW5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ee9k6FW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706776106; x=1738312106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GYjSs0ehnuUTeW6X1fKYyfTxuB3/jGLEVPZT9eDsChM=;
  b=Ee9k6FW5SLvkdoeEUjh09zWy+oEyqsFTQ8WkurFBSegH5Bmkxb9O8y2Z
   EinAoWIVhwVckM4TuyzZ7ld7emS3WaM25B6ppy/E4b5+n1kGI/mZNY3BT
   l1ZNUX1bc9h8UDeOuAJPCKqg2n5On6YSCRPIXK60BUQMEWDZEg7gZCgbr
   Me1OqTJfBLPO3obVuCgqPYH9mw69ulBSShr30OmQtChjidcvS+MECtHP2
   +AvWgNaqz8PV+/QYcGBXJ8TO9qn1Br1Cjpd3pInsCCXIJ2uLSvdbR8UiU
   8veqSHJIUTQb7laU46TuY5xMZX1h2i7QwPMf033SUoNwSGkhd2VXZ+lkK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="25302961"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="25302961"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 00:28:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4453556"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Feb 2024 00:28:24 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVSQl-0002Zu-2a;
	Thu, 01 Feb 2024 08:28:20 +0000
Date: Thu, 1 Feb 2024 16:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 44/54]
 drivers/net/ethernet/intel/i40e/i40e_xsk.c:464:27: error: too many arguments
 to function 'xsk_buff_add_frag'
Message-ID: <202402011625.LiOSHHeJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   b38090ce4d01e31c9d0e23222b9176297e10ccdf
commit: f060ea47534d68eac6b872953bd614962d76da90 [44/54] xsk: make xsk_buff_add_frag really add a frag via __xdp_buff_add_frag()
config: arm64-randconfig-001-20240201 (https://download.01.org/0day-ci/archive/20240201/202402011625.LiOSHHeJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402011625.LiOSHHeJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402011625.LiOSHHeJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/i40e/i40e_xsk.c: In function 'i40e_clean_rx_irq_zc':
>> drivers/net/ethernet/intel/i40e/i40e_xsk.c:464:27: error: too many arguments to function 'xsk_buff_add_frag'
     464 |                 else if (!xsk_buff_add_frag(first, bi)) {
         |                           ^~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/i40e/i40e_xsk.c:5:
   include/net/xdp_sock_drv.h:369:20: note: declared here
     369 | static inline void xsk_buff_add_frag(struct xdp_buff *xdp)
         |                    ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/i40e/i40e_xsk.c:464:26: error: invalid use of void expression
     464 |                 else if (!xsk_buff_add_frag(first, bi)) {
         |                          ^


vim +/xsk_buff_add_frag +464 drivers/net/ethernet/intel/i40e/i40e_xsk.c

   398	
   399	/**
   400	 * i40e_clean_rx_irq_zc - Consumes Rx packets from the hardware ring
   401	 * @rx_ring: Rx ring
   402	 * @budget: NAPI budget
   403	 *
   404	 * Returns amount of work completed
   405	 **/
   406	int i40e_clean_rx_irq_zc(struct i40e_ring *rx_ring, int budget)
   407	{
   408		unsigned int total_rx_bytes = 0, total_rx_packets = 0;
   409		u16 next_to_process = rx_ring->next_to_process;
   410		u16 next_to_clean = rx_ring->next_to_clean;
   411		unsigned int xdp_res, xdp_xmit = 0;
   412		struct xdp_buff *first = NULL;
   413		u32 count = rx_ring->count;
   414		struct bpf_prog *xdp_prog;
   415		u32 entries_to_alloc;
   416		bool failure = false;
   417	
   418		if (next_to_process != next_to_clean)
   419			first = *i40e_rx_bi(rx_ring, next_to_clean);
   420	
   421		/* NB! xdp_prog will always be !NULL, due to the fact that
   422		 * this path is enabled by setting an XDP program.
   423		 */
   424		xdp_prog = READ_ONCE(rx_ring->xdp_prog);
   425	
   426		while (likely(total_rx_packets < (unsigned int)budget)) {
   427			union i40e_rx_desc *rx_desc;
   428			unsigned int rx_packets;
   429			unsigned int rx_bytes;
   430			struct xdp_buff *bi;
   431			unsigned int size;
   432			u64 qword;
   433	
   434			rx_desc = I40E_RX_DESC(rx_ring, next_to_process);
   435			qword = le64_to_cpu(rx_desc->wb.qword1.status_error_len);
   436	
   437			/* This memory barrier is needed to keep us from reading
   438			 * any other fields out of the rx_desc until we have
   439			 * verified the descriptor has been written back.
   440			 */
   441			dma_rmb();
   442	
   443			if (i40e_rx_is_programming_status(qword)) {
   444				i40e_clean_programming_status(rx_ring,
   445							      rx_desc->raw.qword[0],
   446							      qword);
   447				bi = *i40e_rx_bi(rx_ring, next_to_process);
   448				xsk_buff_free(bi);
   449				if (++next_to_process == count)
   450					next_to_process = 0;
   451				continue;
   452			}
   453	
   454			size = FIELD_GET(I40E_RXD_QW1_LENGTH_PBUF_MASK, qword);
   455			if (!size)
   456				break;
   457	
   458			bi = *i40e_rx_bi(rx_ring, next_to_process);
   459			xsk_buff_set_size(bi, size);
   460			xsk_buff_dma_sync_for_cpu(bi);
   461	
   462			if (!first)
   463				first = bi;
 > 464			else if (!xsk_buff_add_frag(first, bi)) {
   465				xsk_buff_free(first);
   466				break;
   467			}
   468	
   469			if (++next_to_process == count)
   470				next_to_process = 0;
   471	
   472			if (i40e_is_non_eop(rx_ring, rx_desc))
   473				continue;
   474	
   475			xdp_res = i40e_run_xdp_zc(rx_ring, first, xdp_prog);
   476			i40e_handle_xdp_result_zc(rx_ring, first, rx_desc, &rx_packets,
   477						  &rx_bytes, xdp_res, &failure);
   478			next_to_clean = next_to_process;
   479			if (failure)
   480				break;
   481			total_rx_packets += rx_packets;
   482			total_rx_bytes += rx_bytes;
   483			xdp_xmit |= xdp_res & (I40E_XDP_TX | I40E_XDP_REDIR);
   484			first = NULL;
   485		}
   486	
   487		rx_ring->next_to_clean = next_to_clean;
   488		rx_ring->next_to_process = next_to_process;
   489	
   490		entries_to_alloc = I40E_DESC_UNUSED(rx_ring);
   491		if (entries_to_alloc >= I40E_RX_BUFFER_WRITE)
   492			failure |= !i40e_alloc_rx_buffers_zc(rx_ring, entries_to_alloc);
   493	
   494		i40e_finalize_xdp_rx(rx_ring, xdp_xmit);
   495		i40e_update_rx_stats(rx_ring, total_rx_bytes, total_rx_packets);
   496	
   497		if (xsk_uses_need_wakeup(rx_ring->xsk_pool)) {
   498			if (failure || next_to_clean == rx_ring->next_to_use)
   499				xsk_set_rx_need_wakeup(rx_ring->xsk_pool);
   500			else
   501				xsk_clear_rx_need_wakeup(rx_ring->xsk_pool);
   502	
   503			return (int)total_rx_packets;
   504		}
   505		return failure ? budget : (int)total_rx_packets;
   506	}
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

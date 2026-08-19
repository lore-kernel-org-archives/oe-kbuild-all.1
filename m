Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD4C442FC0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132403; cv=none; b=e1a3uxnKs0FM+/Cv/sRU+lmUpuosQ/CV0m6QT5HPZfC53Qt/9kyzC6DbRmhKzLBHopuU8k30TvRAbs3bFpx3FDbAnSO3egvwEMSIifizZkF4ketQcHCwl+/q1pofqYZxDbbrqkGA2yrSOTtav/gjgQ1pZkT5eBCnY1SaCL+RfyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132403; c=relaxed/simple;
	bh=xBF7fSi+bpGV1bLHIG18t4qLSEYrBO5H2/RvXYqe/Ng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UiCkKok/XjhX+NEYiQjved9XUpoI1zqBhiGhI0NVzKHS5cuE7qclO92jOE/B3o++ZG+Cogj+A4REIpok0aFuUQq0ngSUsl0elLENQcagF8stDnCcN6j6mt5tkgMLT1AiEf7gF19ifGtlUziaa7uKRlWkEejE6uMmGFq5CuJnk1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FA6Q68gL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FA6Q68gL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787132399; x=1818668399;
  h=date:from:to:cc:subject:message-id;
  bh=xBF7fSi+bpGV1bLHIG18t4qLSEYrBO5H2/RvXYqe/Ng=;
  b=FA6Q68gLrnCPXhY+oDbQaG8BT/cTsreCiCwcvgNMCjBy99+ZkrlkrKgg
   mgXCvqMI1zpVUi7r++3PclbH4zJ1TZTMZruMoT724b1Wop0ylavDTw3b3
   l3qcsuJiPj8ALFt7sCecIC/fenuD3j0A3DFIFI143T74Krfo272YuG1Ch
   7vUW772HpoemBbOs9nbil8TN+sjBJPKTa58sOK/izhwWQAc4mwTz/xLid
   ZB8Uxp4cMVsGWsutXWIvOuRPYj7D25uWPfXHRHkjn3GHYessJp+CIUB/Z
   mjb57zKaGNjzeK1MZTQGCJu908zJ5I22xbgOTLfKUXed27AYtel0k/hMm
   g==;
X-CSE-ConnectionGUID: SzqPxyI2TPudCtQf7UdlDw==
X-CSE-MsgGUID: 9HqgehFxRMiwOt6bjpLSVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="75167771"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="75167771"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 02:39:54 -0700
X-CSE-ConnectionGUID: MdAaTHveRAyAAr78L7AXig==
X-CSE-MsgGUID: LWZjBHAjSNaokCgM3WLcMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="262871711"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Aug 2026 02:39:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwclx-00000000f18-1blr;
	Wed, 19 Aug 2026 09:39:49 +0000
Date: Wed, 19 Aug 2026 17:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpib/cb7210/cb7210.c:120:32: sparse: sparse: cast to
 restricted __le16
Message-ID: <202608191709.BDqLd3DT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3a0dd7ba4f44cdc116d83712f61e7c1a95be3588
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
date:   9 months ago
config: m68k-randconfig-r113-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191709.BDqLd3DT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191709.BDqLd3DT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6ab504633e4 ("staging: gpib: Destage gpib")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191709.BDqLd3DT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpib/cb7210/cb7210.c:120:32: sparse: sparse: cast to restricted __le16
>> drivers/gpib/cb7210/cb7210.c:120:32: sparse: sparse: cast to restricted __le16
>> drivers/gpib/cb7210/cb7210.c:120:32: sparse: sparse: cast to restricted __le16
>> drivers/gpib/cb7210/cb7210.c:120:32: sparse: sparse: cast to restricted __le16
   drivers/gpib/cb7210/cb7210.c:148:24: sparse: sparse: cast to restricted __le16
   drivers/gpib/cb7210/cb7210.c:148:24: sparse: sparse: cast to restricted __le16
   drivers/gpib/cb7210/cb7210.c:148:24: sparse: sparse: cast to restricted __le16
   drivers/gpib/cb7210/cb7210.c:148:24: sparse: sparse: cast to restricted __le16
   drivers/gpib/cb7210/cb7210.c: note: in included file (through arch/m68k/include/asm/io.h, include/linux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
   arch/m68k/include/asm/io_mm.h:164:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:164:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:164:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:164:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:164:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:164:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:164:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:164:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:164:21: sparse: sparse: Using plain integer as NULL pointer

vim +120 drivers/gpib/cb7210/cb7210.c

e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   78  
e8d9c91abf5ad9 drivers/staging/gpib/cb7210/cb7210.c Michael Rubin 2025-04-09   79  static int fifo_read(struct gpib_board *board, struct cb7210_priv *cb_priv, u8 *buffer,
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   80  		     size_t length, int *end, size_t *bytes_read)
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   81  {
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   82  	ssize_t retval = 0;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   83  	struct nec7210_priv *nec_priv = &cb_priv->nec7210_priv;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   84  	int hs_status;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   85  	u16 word;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   86  	unsigned long flags;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   87  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   88  	*bytes_read = 0;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   89  	if (cb_priv->fifo_iobase == 0)	{
82e3508046f9bc drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2025-02-20   90  		dev_err(board->gpib_dev, "fifo iobase is zero!\n");
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   91  		return -EIO;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   92  	}
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   93  	*end = 0;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   94  	if (length <= cb7210_fifo_size)	{
82e3508046f9bc drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2025-02-20   95  		dev_err(board->gpib_dev, " bug! fifo read length < fifo size\n");
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   96  		return -EINVAL;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   97  	}
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   98  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18   99  	input_fifo_enable(board, 1);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  100  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  101  	while (*bytes_read + cb7210_fifo_size < length)	{
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  102  		nec7210_set_reg_bits(nec_priv, IMR2, HR_DMAI, HR_DMAI);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  103  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  104  		if (wait_event_interruptible(board->wait,
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  105  					     (cb_priv->in_fifo_half_full &&
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  106  					      have_fifo_word(cb_priv)) ||
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  107  					     test_bit(RECEIVED_END_BN, &nec_priv->state) ||
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  108  					     test_bit(DEV_CLEAR_BN, &nec_priv->state) ||
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  109  					     test_bit(TIMO_NUM, &board->status))) {
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  110  			retval = -ERESTARTSYS;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  111  			nec7210_set_reg_bits(nec_priv, IMR2, HR_DMAI, 0);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  112  			break;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  113  		}
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  114  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  115  		spin_lock_irqsave(&board->spinlock, flags);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  116  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  117  		nec7210_set_reg_bits(nec_priv, IMR2, HR_DMAI, 0);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  118  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  119  		while (have_fifo_word(cb_priv))	{
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18 @120  			word = inw(cb_priv->fifo_iobase + DIR);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  121  			buffer[(*bytes_read)++] = word & 0xff;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  122  			buffer[(*bytes_read)++] = (word >> 8) & 0xff;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  123  		}
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  124  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  125  		cb_priv->in_fifo_half_full = 0;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  126  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  127  		hs_status = cb7210_read_byte(cb_priv, HS_STATUS);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  128  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  129  		spin_unlock_irqrestore(&board->spinlock, flags);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  130  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  131  		if (test_and_clear_bit(RECEIVED_END_BN, &nec_priv->state)) {
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  132  			*end = 1;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  133  			break;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  134  		}
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  135  		if (hs_status & HS_FIFO_FULL)
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  136  			break;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  137  		if (test_bit(TIMO_NUM, &board->status))	{
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  138  			retval = -ETIMEDOUT;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  139  			break;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  140  		}
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  141  		if (test_bit(DEV_CLEAR_BN, &nec_priv->state)) {
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  142  			retval = -EINTR;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  143  			break;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  144  		}
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  145  	}
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  146  	hs_status = cb7210_read_byte(cb_priv, HS_STATUS);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  147  	if (hs_status & HS_RX_LSB_NOT_EMPTY) {
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  148  		word = inw(cb_priv->fifo_iobase + DIR);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  149  		buffer[(*bytes_read)++] = word & 0xff;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  150  	}
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  151  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  152  	input_fifo_enable(board, 0);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  153  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  154  	if (wait_event_interruptible(board->wait,
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  155  				     test_bit(READ_READY_BN, &nec_priv->state) ||
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  156  				     test_bit(RECEIVED_END_BN, &nec_priv->state) ||
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  157  				     test_bit(DEV_CLEAR_BN, &nec_priv->state) ||
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  158  				     test_bit(TIMO_NUM, &board->status))) {
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  159  		retval = -ERESTARTSYS;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  160  	}
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  161  	if (test_bit(TIMO_NUM, &board->status))
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  162  		retval = -ETIMEDOUT;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  163  	if (test_bit(DEV_CLEAR_BN, &nec_priv->state))
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  164  		retval = -EINTR;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  165  	if (test_bit(READ_READY_BN, &nec_priv->state)) {
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  166  		nec7210_set_handshake_mode(board, nec_priv, HR_HLDA);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  167  		buffer[(*bytes_read)++] = nec7210_read_data_in(board, nec_priv, end);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  168  	}
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  169  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  170  	return retval;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  171  }
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  172  

:::::: The code at line 120 was first introduced by commit
:::::: e9dc69956d4d9bf4a81d35995ce9229ff5e4cad5 staging: gpib: Add Computer Boards GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

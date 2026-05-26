Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD8F3C061E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821244; cv=none; b=S2+myJX2ZrcrQMtyd0KR0ZHDoxMI7bfuOhpTJRtVSk+tdgkJtBb9iEQLEOjiGeZ69N/uCUGbsIb9LEu7Rt+lYdP6ONcnsSZQQ9zHzAaj42UJL0fd/9NKgb//2CElh+ehOBm6IAXzJjpUfFVKkOb0eNxRIzUORq4s85wiTmoxTsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821244; c=relaxed/simple;
	bh=VVMkpZnVTVLIlYm/Khn1tiS52g9fzaPkUmg7XdA3EQI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qrd77iZR7fJ4xkj+zoao8KpqLychD/0I5Dsk5YXjaqaCBkoHKcnC7PyecJmkt+BtfhZUuWwnka4565VXHslCRwOfbFWQe3pA6RYQCxUTLU0D/wG9BBJssnvbBgdcQPGeRibbUp2rWrMHa98jMVXPyXAzS249Y+BHGa5gNvpbs1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1gUO8l+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1gUO8l+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779821241; x=1811357241;
  h=date:from:to:cc:subject:message-id;
  bh=VVMkpZnVTVLIlYm/Khn1tiS52g9fzaPkUmg7XdA3EQI=;
  b=V1gUO8l+2gEApMpSFzxYnjYwELO2O5kY3nQs1peuGnm+WZye2LJZ6Zt7
   KeBDpaa7q1u3/WLqiut0cw6WVX9gK5osxuRjgjbqjagk3ed8BrSixqJFF
   Uvp9EKmW4UuYtiOsHnf8oav1zIQGHskGPFRTBt9qoHhnYbsR0fJxKqZmo
   z3h94+Rnygv9bFqkySqlyv52FuUrTzKYsHCySTnL2858RiGn68b5wzfOc
   DmpXrKdasmI2f5LxxPprzkhnDK9LzbC0dBQEb3KYTbAdWwhN4Q0TwRI+d
   XGpNTRCn266ZMcmJJFKG8nDL8cmou85iC+u0w71oyKlO4Mb1YMjqbOyJC
   A==;
X-CSE-ConnectionGUID: QfhtuNElT9uEm6UBbWI6Hg==
X-CSE-MsgGUID: JoOV89HXR4KgWosRm1YvPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91753535"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="91753535"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 11:47:20 -0700
X-CSE-ConnectionGUID: VrNZaBA3R3GC8Zr2l539hQ==
X-CSE-MsgGUID: Fpj3PfnIRVG7onC2CuZo4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="242166550"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 May 2026 11:47:18 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRwo7-000000002wU-1jYZ;
	Tue, 26 May 2026 18:47:15 +0000
Date: Wed, 27 May 2026 02:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/gpib/cb7210/cb7210.c:120:32: sparse: sparse: cast to
 restricted __le16
Message-ID: <202605270241.UqLZ5hGH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d60ec36cab338dfe2ae40d73e9c8d6c4af70d2b8
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
date:   6 months ago
config: m68k-randconfig-r133-20260526 (https://download.01.org/0day-ci/archive/20260527/202605270241.UqLZ5hGH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270241.UqLZ5hGH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6ab504633e4 ("staging: gpib: Destage gpib")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605270241.UqLZ5hGH-lkp@intel.com/

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

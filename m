Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93DA19CC33
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 16:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737217723; cv=none; b=K96tEV6As+YdcXAD8km60EsuivIN7BjbG41dJenx3i0Ztmba3hI1zb0RqU78y+S6G1aoJEK111UabE76cUH/NJ8A5LAT9K9PzfHdOEpzA7YJsvtOGT8ertrV4Oe4LB0IwAHq8aeZcpjCiZq0BVUGN4bJ0MrnA5r5eOdfoBp0PEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737217723; c=relaxed/simple;
	bh=3NIw2Rd3SjNhkTWvrxEQSBUD24hvSs5SDqstBsCmdco=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=igF/ZR/9y5nNbtxseOyRAQ71bBOE1jjNqP44Q43jTKttdAYKRdEsWRcX3CMvc96kj46DlFaRFvkZqANupG2C4OIx6tqX52SG6C1Plo7wYfu4UbaUk3Z4Bh0640nmdO390Ht6SaUB+0PwIkw4MuA3Wqfqgf7A2xSf0gcGl3+4KCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=bae6jm/k; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="bae6jm/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yzh3R9XzBV4V5qGvJMcBz08f7nGpQkemp4WzcWsPf+Q=;
  b=bae6jm/kvu4PKYOWDqFAi6QdfmkNqmArVCFtyjuNX5/P9m+47jtDdSJv
   ur1OroZ42quhL44ysp4CtuAV73ux4lr2XBtx626uQshFUeBt7w+LJB73F
   85ZG6Kbt3AZ8umPl8f7MhvgwpYYE/v9JXeam1YrPuDw3fY1y9Vz4ykCz6
   8=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.13,215,1732575600"; 
   d="scan'208";a="106711409"
Received: from unknown (HELO hadrien) ([96.75.210.53])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 17:28:31 +0100
Date: Sat, 18 Jan 2025 11:28:27 -0500 (EST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Dave Penkler <dpenkler@gmail.com>
cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: drivers/staging/gpib/agilent_82350b/agilent_82350b.c:70:25-26:
 WARNING opportunity for min() (fwd)
Message-ID: <2c713c97-47ab-2ab-1553-60cbe976fe27@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

At least on line 70, using min might be nicer.

julia

---------- Forwarded message ----------
Date: Sat, 18 Jan 2025 21:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/staging/gpib/agilent_82350b/agilent_82350b.c:70:25-26: WARNING
    opportunity for min()

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dave Penkler <dpenkler@gmail.com>

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   595523945be0a5a2f12a1c04772383293fbc04a1
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
config: alpha-randconfig-r064-20250118 (https://download.01.org/0day-ci/archive/20250118/202501182153.qHfL4Fbc-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501182153.qHfL4Fbc-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/staging/gpib/agilent_82350b/agilent_82350b.c:70:25-26: WARNING opportunity for min()
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:203:29-30: WARNING opportunity for min()

vim +70 drivers/staging/gpib/agilent_82350b/agilent_82350b.c

09a4655ee1ebdf6 Dave Penkler 2024-09-18   21
09a4655ee1ebdf6 Dave Penkler 2024-09-18   22  int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
09a4655ee1ebdf6 Dave Penkler 2024-09-18   23  			      size_t *bytes_read)
09a4655ee1ebdf6 Dave Penkler 2024-09-18   24
09a4655ee1ebdf6 Dave Penkler 2024-09-18   25  {
09a4655ee1ebdf6 Dave Penkler 2024-09-18   26  	struct agilent_82350b_priv *a_priv = board->private_data;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   27  	struct tms9914_priv *tms_priv = &a_priv->tms9914_priv;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   28  	int retval = 0;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   29  	unsigned short event_status;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   30  	int i, num_fifo_bytes;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   31  	//hardware doesn't support checking for end-of-string character when using fifo
09a4655ee1ebdf6 Dave Penkler 2024-09-18   32  	if (tms_priv->eos_flags & REOS) {
09a4655ee1ebdf6 Dave Penkler 2024-09-18   33  		//pr_info("ag-rd: using tms9914 read for REOS %x EOS %x\n",tms_priv->eos_flags,
09a4655ee1ebdf6 Dave Penkler 2024-09-18   34  		// tms_priv->eos);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   35  		return tms9914_read(board, tms_priv, buffer, length, end, bytes_read);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   36  	}
09a4655ee1ebdf6 Dave Penkler 2024-09-18   37
09a4655ee1ebdf6 Dave Penkler 2024-09-18   38  	clear_bit(DEV_CLEAR_BN, &tms_priv->state);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   39
09a4655ee1ebdf6 Dave Penkler 2024-09-18   40  	read_and_clear_event_status(board);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   41  	*end = 0;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   42  	*bytes_read = 0;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   43  	if (length == 0)
09a4655ee1ebdf6 Dave Penkler 2024-09-18   44  		return 0;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   45  	//disable fifo for the moment
09a4655ee1ebdf6 Dave Penkler 2024-09-18   46  	writeb(DIRECTION_GPIB_TO_HOST, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   47  	// handle corner case of board not in holdoff and one byte might slip in early
09a4655ee1ebdf6 Dave Penkler 2024-09-18   48  	if (tms_priv->holdoff_active == 0 && length > 1) {
09a4655ee1ebdf6 Dave Penkler 2024-09-18   49  		size_t num_bytes;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   50
09a4655ee1ebdf6 Dave Penkler 2024-09-18   51  		retval = tms9914_read(board, tms_priv, buffer, 1, end, &num_bytes);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   52  		*bytes_read += num_bytes;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   53  		if (retval < 0)
09a4655ee1ebdf6 Dave Penkler 2024-09-18   54  			pr_err("%s: tms9914_read failed retval=%i\n", driver_name, retval);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   55  		if (retval < 0 || *end)
09a4655ee1ebdf6 Dave Penkler 2024-09-18   56  			return retval;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   57  		++buffer;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   58  		--length;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   59  	}
09a4655ee1ebdf6 Dave Penkler 2024-09-18   60  	tms9914_set_holdoff_mode(tms_priv, TMS9914_HOLDOFF_EOI);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   61  	tms9914_release_holdoff(tms_priv);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   62  	i = 0;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   63  	num_fifo_bytes = length - 1;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   64  	write_byte(tms_priv, tms_priv->imr0_bits & ~HR_BIIE, IMR0); // disable BI interrupts
09a4655ee1ebdf6 Dave Penkler 2024-09-18   65  	while (i < num_fifo_bytes && *end == 0) {
09a4655ee1ebdf6 Dave Penkler 2024-09-18   66  		int block_size;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   67  		int j;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   68  		int count;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   69
09a4655ee1ebdf6 Dave Penkler 2024-09-18  @70  		if (num_fifo_bytes - i < agilent_82350b_fifo_size)
09a4655ee1ebdf6 Dave Penkler 2024-09-18   71  			block_size = num_fifo_bytes - i;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   72  		else
09a4655ee1ebdf6 Dave Penkler 2024-09-18   73  			block_size = agilent_82350b_fifo_size;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   74  		set_transfer_counter(a_priv, block_size);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   75  		writeb(ENABLE_TI_TO_SRAM | DIRECTION_GPIB_TO_HOST,
09a4655ee1ebdf6 Dave Penkler 2024-09-18   76  		       a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   77  		if (agilent_82350b_fifo_is_halted(a_priv))
09a4655ee1ebdf6 Dave Penkler 2024-09-18   78  			writeb(RESTART_STREAM_BIT, a_priv->gpib_base + STREAM_STATUS_REG);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   79
09a4655ee1ebdf6 Dave Penkler 2024-09-18   80  		clear_bit(READ_READY_BN, &tms_priv->state);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   81
09a4655ee1ebdf6 Dave Penkler 2024-09-18   82  		retval = wait_event_interruptible(board->wait,
09a4655ee1ebdf6 Dave Penkler 2024-09-18   83  						  ((event_status =
09a4655ee1ebdf6 Dave Penkler 2024-09-18   84  						    read_and_clear_event_status(board)) &
09a4655ee1ebdf6 Dave Penkler 2024-09-18   85  						   (TERM_COUNT_STATUS_BIT |
09a4655ee1ebdf6 Dave Penkler 2024-09-18   86  						    BUFFER_END_STATUS_BIT)) ||
09a4655ee1ebdf6 Dave Penkler 2024-09-18   87  						  test_bit(DEV_CLEAR_BN, &tms_priv->state) ||
09a4655ee1ebdf6 Dave Penkler 2024-09-18   88  						  test_bit(TIMO_NUM, &board->status));
09a4655ee1ebdf6 Dave Penkler 2024-09-18   89  		if (retval) {
09a4655ee1ebdf6 Dave Penkler 2024-09-18   90  			pr_err("%s: read wait interrupted\n", driver_name);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   91  			retval = -ERESTARTSYS;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   92  			break;
09a4655ee1ebdf6 Dave Penkler 2024-09-18   93  		}
09a4655ee1ebdf6 Dave Penkler 2024-09-18   94  		count = block_size - read_transfer_counter(a_priv);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   95  		for (j = 0; j < count && i < num_fifo_bytes; ++j)
09a4655ee1ebdf6 Dave Penkler 2024-09-18   96  			buffer[i++] = readb(a_priv->sram_base + j);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   97  		if (event_status & BUFFER_END_STATUS_BIT) {
09a4655ee1ebdf6 Dave Penkler 2024-09-18   98  			clear_bit(RECEIVED_END_BN, &tms_priv->state);
09a4655ee1ebdf6 Dave Penkler 2024-09-18   99
09a4655ee1ebdf6 Dave Penkler 2024-09-18  100  			tms_priv->holdoff_active = 1;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  101  			*end = 1;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  102  		}
09a4655ee1ebdf6 Dave Penkler 2024-09-18  103  		if (test_bit(TIMO_NUM, &board->status)) {
09a4655ee1ebdf6 Dave Penkler 2024-09-18  104  			pr_err("%s: minor %i: read timed out\n", driver_name, board->minor);
09a4655ee1ebdf6 Dave Penkler 2024-09-18  105  			retval = -ETIMEDOUT;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  106  			break;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  107  		}
09a4655ee1ebdf6 Dave Penkler 2024-09-18  108  		if (test_bit(DEV_CLEAR_BN, &tms_priv->state)) {
09a4655ee1ebdf6 Dave Penkler 2024-09-18  109  			pr_err("%s: device clear interrupted read\n", driver_name);
09a4655ee1ebdf6 Dave Penkler 2024-09-18  110  			retval = -EINTR;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  111  			break;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  112  		}
09a4655ee1ebdf6 Dave Penkler 2024-09-18  113  	}
09a4655ee1ebdf6 Dave Penkler 2024-09-18  114  	write_byte(tms_priv, tms_priv->imr0_bits, IMR0); // re-enable BI interrupts
09a4655ee1ebdf6 Dave Penkler 2024-09-18  115  	*bytes_read += i;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  116  	buffer += i;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  117  	length -= i;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  118  	writeb(DIRECTION_GPIB_TO_HOST, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
09a4655ee1ebdf6 Dave Penkler 2024-09-18  119  	if (retval < 0)
09a4655ee1ebdf6 Dave Penkler 2024-09-18  120  		return retval;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  121  	// read last bytes if we havn't received an END yet
09a4655ee1ebdf6 Dave Penkler 2024-09-18  122  	if (*end == 0) {
09a4655ee1ebdf6 Dave Penkler 2024-09-18  123  		size_t num_bytes;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  124  		// try to make sure we holdoff after last byte read
09a4655ee1ebdf6 Dave Penkler 2024-09-18  125  		retval = tms9914_read(board, tms_priv, buffer, length, end, &num_bytes);
09a4655ee1ebdf6 Dave Penkler 2024-09-18  126  		*bytes_read += num_bytes;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  127  		if (retval < 0)
09a4655ee1ebdf6 Dave Penkler 2024-09-18  128  			return retval;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  129  	}
09a4655ee1ebdf6 Dave Penkler 2024-09-18  130  	return 0;
09a4655ee1ebdf6 Dave Penkler 2024-09-18  131  }
09a4655ee1ebdf6 Dave Penkler 2024-09-18  132

:::::: The code at line 70 was first introduced by commit
:::::: 09a4655ee1ebdf64d1ffae063c1e13c4cc17bf04 staging: gpib: Add HP/Agilent/Keysight 8235xx PCI GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

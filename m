Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCA41BDD5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 03:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712113824; cv=none; b=tASlezvMvIZRmkCGvJ2foP7gknihHCAm25yYgmtZpZdw4X2WKtc+DKFTwz4doSmp+TycUAt7JByyw/pfLvciGmQ+0maWsbppDmFYq7SmdrlQuqaEjjJFWgnqs/7hMCPmxDP/Iyg8E+zRDQwmGX7mbxzVOykK9iHcYQDaQX2LbvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712113824; c=relaxed/simple;
	bh=fTRbdwAtdAN04rV7aRq/uF1QvCUEnWcV87B8lm4qVRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HVB7no87wCxIz8b1cy4oa+lq2uTrxzFZnl5sS9uzBA0t6zIVFzFEb3dRS9YqWuGXSBBXzGPKMdt28yMdxZZvpqBhZ84BaPReRI/Tp9WDbH+wOEaLIg8j4FsJadAOJh8xYTUoMNwInOD21N0YAyG9b6LYmVfNczdTE1eHQ56QQ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iF9SVYEu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iF9SVYEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712113823; x=1743649823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fTRbdwAtdAN04rV7aRq/uF1QvCUEnWcV87B8lm4qVRo=;
  b=iF9SVYEu3lZ3GnFYHJNt+qeR90388YBm3KIDgog/JSXx+qcy0Ju3KUwn
   4Bpnj6j7dmkHL1oJ0BgLXxue8lcyKhHLNB79cu7OGSyBEnqx7qSfpjML9
   YqLAYuvdnLUNOcrQmYGHTNBWguKALfs3Xm+DG65SXSIq/U26vQmPEDfS1
   7FXfTqybemp/adpUae9c9Hpgem1K1gTXiJopQX8jwS6q2ipM88QQmSAQq
   Q3eUqgNeSwLUGX2xYsleuay0VIDEuk74LOApXNwRh+BtDXy5QQCU72x8o
   5HMjs3vz0N7TnCIGWoZwzP9RTVl0iCU0nqd5uCM0e/hChcjZHvdZh6X43
   w==;
X-CSE-ConnectionGUID: zU1NOGtxSIKipTy/EbdeBQ==
X-CSE-MsgGUID: n0SO7ikGQK6wKVGmnLM8cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="24819367"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="24819367"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 20:10:22 -0700
X-CSE-ConnectionGUID: u22ditsoQOqI4hgMJeZSsg==
X-CSE-MsgGUID: aUUMzkJkSw2TNJyuIbH3Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18392261"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Apr 2024 20:10:21 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrr10-0001nl-2r;
	Wed, 03 Apr 2024 03:10:18 +0000
Date: Wed, 3 Apr 2024 11:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and-v4 36/51]
 drivers/mailbox/bcm-flexrm-mailbox.c:992:17: error: implicit declaration of
 function 'find_and_set_bit'; did you mean 'test_and_set_bit'?
Message-ID: <202404031030.V1YjNagD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and-v4
head:   db33a7d65f9e64f900f68e46da4f113fbe6a7faa
commit: ce62c4a76d0d34497ad14b008272c52cc283de66 [36/51] bcm-flexrm-mailbox
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240403/202404031030.V1YjNagD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031030.V1YjNagD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031030.V1YjNagD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/mailbox/bcm-flexrm-mailbox.c: In function 'flexrm_new_request':
>> drivers/mailbox/bcm-flexrm-mailbox.c:992:17: error: implicit declaration of function 'find_and_set_bit'; did you mean 'test_and_set_bit'? [-Werror=implicit-function-declaration]
     992 |         reqid = find_and_set_bit(ring->requests_bmap, RING_MAX_REQ_COUNT);
         |                 ^~~~~~~~~~~~~~~~
         |                 test_and_set_bit
>> drivers/mailbox/bcm-flexrm-mailbox.c:980:23: warning: unused variable 'flags' [-Wunused-variable]
     980 |         unsigned long flags;
         |                       ^~~~~
   cc1: some warnings being treated as errors


vim +992 drivers/mailbox/bcm-flexrm-mailbox.c

   974	
   975	static int flexrm_new_request(struct flexrm_ring *ring,
   976					struct brcm_message *batch_msg,
   977					struct brcm_message *msg)
   978	{
   979		void *next;
 > 980		unsigned long flags;
   981		u32 val, count, nhcnt;
   982		u32 read_offset, write_offset;
   983		bool exit_cleanup = false;
   984		int ret = 0, reqid;
   985	
   986		/* Do sanity check on message */
   987		if (!flexrm_sanity_check(msg))
   988			return -EIO;
   989		msg->error = 0;
   990	
   991		/* If no requests possible then save data pointer and goto done. */
 > 992		reqid = find_and_set_bit(ring->requests_bmap, RING_MAX_REQ_COUNT);
   993		if (reqid >= RING_MAX_REQ_COUNT)
   994			return -ENOSPC;
   995	
   996		ring->requests[reqid] = msg;
   997	
   998		/* Do DMA mappings for the message */
   999		ret = flexrm_dma_map(ring->mbox->dev, msg);
  1000		if (ret < 0) {
  1001			ring->requests[reqid] = NULL;
  1002			clear_bit(reqid, ring->requests_bmap);
  1003			return ret;
  1004		}
  1005	
  1006		/* Determine current HW BD read offset */
  1007		read_offset = readl_relaxed(ring->regs + RING_BD_READ_PTR);
  1008		val = readl_relaxed(ring->regs + RING_BD_START_ADDR);
  1009		read_offset *= RING_DESC_SIZE;
  1010		read_offset += (u32)(BD_START_ADDR_DECODE(val) - ring->bd_dma_base);
  1011	
  1012		/*
  1013		 * Number required descriptors = number of non-header descriptors +
  1014		 *				 number of header descriptors +
  1015		 *				 1x null descriptor
  1016		 */
  1017		nhcnt = flexrm_estimate_nonheader_desc_count(msg);
  1018		count = flexrm_estimate_header_desc_count(nhcnt) + nhcnt + 1;
  1019	
  1020		/* Check for available descriptor space. */
  1021		write_offset = ring->bd_write_offset;
  1022		while (count) {
  1023			if (!flexrm_is_next_table_desc(ring->bd_base + write_offset))
  1024				count--;
  1025			write_offset += RING_DESC_SIZE;
  1026			if (write_offset == RING_BD_SIZE)
  1027				write_offset = 0x0;
  1028			if (write_offset == read_offset)
  1029				break;
  1030		}
  1031		if (count) {
  1032			ret = -ENOSPC;
  1033			exit_cleanup = true;
  1034			goto exit;
  1035		}
  1036	
  1037		/* Write descriptors to ring */
  1038		next = flexrm_write_descs(msg, nhcnt, reqid,
  1039				ring->bd_base + ring->bd_write_offset,
  1040				RING_BD_TOGGLE_VALID(ring->bd_write_offset),
  1041				ring->bd_base, ring->bd_base + RING_BD_SIZE);
  1042		if (IS_ERR(next)) {
  1043			ret = PTR_ERR(next);
  1044			exit_cleanup = true;
  1045			goto exit;
  1046		}
  1047	
  1048		/* Save ring BD write offset */
  1049		ring->bd_write_offset = (unsigned long)(next - ring->bd_base);
  1050	
  1051		/* Increment number of messages sent */
  1052		atomic_inc_return(&ring->msg_send_count);
  1053	
  1054	exit:
  1055		/* Update error status in message */
  1056		msg->error = ret;
  1057	
  1058		/* Cleanup if we failed */
  1059		if (exit_cleanup) {
  1060			flexrm_dma_unmap(ring->mbox->dev, msg);
  1061			ring->requests[reqid] = NULL;
  1062			clear_bit(reqid, ring->requests_bmap);
  1063		}
  1064	
  1065		return ret;
  1066	}
  1067	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

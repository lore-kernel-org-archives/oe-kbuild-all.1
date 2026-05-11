Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9613624A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 23:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543788; cv=none; b=YAMBXTtrJ9c1i+nRoOH5oYMn6eNW75QhVdow0Aqqe06DiDwVg+bvq4WX8bJcQ15ZjnB0aFsbCyhuUJyrgTdoCfO652Jskeb1ZS86dFMI84sv1eIfh4Btt5G+jzWQCgMGQXpc1e2iCDAPrCs5ijXHlaOGHSdKGQlJDmedsG3LyB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543788; c=relaxed/simple;
	bh=LWrUe8mgG9JHb2TfIPXRgVkqqLU2BnxSLOVC9kWraIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A5zv21RCg6g8HQeu1+5BZaTXCsaeK+XvTt00OSKpLop2IxOND7/Le/LoiWH0TwwOYnZzWBO/H5UOvqLLz7uXo1UyFfx9sJL9fwS3l0iLnS4lPOchngoaoQ4H7ZaZVha7HNBaAlmZ+yu84Cd/jiGA6iMcmADKSnY/Rxmcd6W1/lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOnrYynY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOnrYynY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778543785; x=1810079785;
  h=date:from:to:cc:subject:message-id;
  bh=LWrUe8mgG9JHb2TfIPXRgVkqqLU2BnxSLOVC9kWraIM=;
  b=VOnrYynY2gfagcwfBsLxT2rF76Y/PA+LZGeHCpJVEpqCZMnbiSM4QsAg
   Kyk7QEge+xB80zV0FHgfjACYsIWG0H/HE3TMR/HDNxf+G1UDeG6RU3p1L
   CpuubDOeLfSdC0xEyQW1vuih94YMon7lCtIhon25wW7jmuTMzBJ78ot82
   lOLbcwLOEqfisANLCs2juOU/Jz5OD7wtUHLYYBoPoeF/OvIHf1a88exZ+
   viwDsv15Ar8dR1oHxriNvX2+PebMUWuwUE/IG/zyZF4YA82EHyNnvAOFp
   tCL5axm3LIPzXYfvHtKv4EQh+YZbbDAoZ27hJk0DdA6IkyVB5jTDRtcr7
   A==;
X-CSE-ConnectionGUID: 4fqfVTGpR+K1yy7TwLPnWA==
X-CSE-MsgGUID: iGCEqnZeQWCSVB5UDRf4eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90545078"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="90545078"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 16:56:24 -0700
X-CSE-ConnectionGUID: rbu3AzRoQ0+ooUN5XlDcxg==
X-CSE-MsgGUID: 4ve/FDeFTGG0l76pnO/ArA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="234549572"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 May 2026 16:56:22 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMaTz-000000001Iv-1EiV;
	Mon, 11 May 2026 23:56:19 +0000
Date: Tue, 12 May 2026 07:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Johannes Berg <johannes.berg@intel.com>
Subject: arch/um/drivers/vector_kern.c:989:69: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202605120745.X3rQwSOV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5d6919055dec134de3c40167a490f33c74c12581
commit: b555cb66583e99158cfef8e91c025252cefae55b um: vector: Eliminate the dependency on uml_net
date:   1 year ago
config: um-randconfig-r131-20260512 (https://download.01.org/0day-ci/archive/20260512/202605120745.X3rQwSOV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120745.X3rQwSOV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b555cb66583e ("um: vector: Eliminate the dependency on uml_net")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120745.X3rQwSOV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/um/drivers/vector_transports.c:73:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:73:38: sparse:     expected unsigned int [usertype]
   arch/um/drivers/vector_transports.c:73:38: sparse:     got restricted __be32 [usertype]
   arch/um/drivers/vector_transports.c:90:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:90:34: sparse:     expected unsigned int [usertype]
   arch/um/drivers/vector_transports.c:90:34: sparse:     got restricted __be32 [usertype]
   arch/um/drivers/vector_transports.c:109:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:109:35: sparse:     expected unsigned int [usertype]
   arch/um/drivers/vector_transports.c:109:35: sparse:     got restricted __be32 [usertype]
>> arch/um/drivers/vector_transports.c:254:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] arptype @@     got restricted __be16 [usertype] @@
   arch/um/drivers/vector_transports.c:254:37: sparse:     expected unsigned short [usertype] arptype
   arch/um/drivers/vector_transports.c:254:37: sparse:     got restricted __be16 [usertype]
>> arch/um/drivers/vector_transports.c:273:52: sparse: sparse: invalid assignment: |=
   arch/um/drivers/vector_transports.c:273:52: sparse:    left side has type unsigned short
   arch/um/drivers/vector_transports.c:273:52: sparse:    right side has type restricted __be16
>> arch/um/drivers/vector_transports.c:274:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] rx_key @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:274:36: sparse:     expected unsigned int [usertype] rx_key
   arch/um/drivers/vector_transports.c:274:36: sparse:     got restricted __be32 [usertype]
>> arch/um/drivers/vector_transports.c:275:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] tx_key @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:275:36: sparse:     expected unsigned int [usertype] tx_key
   arch/um/drivers/vector_transports.c:275:36: sparse:     got restricted __be32 [usertype]
   arch/um/drivers/vector_transports.c:288:52: sparse: sparse: invalid assignment: |=
   arch/um/drivers/vector_transports.c:288:52: sparse:    left side has type unsigned short
   arch/um/drivers/vector_transports.c:288:52: sparse:    right side has type restricted __be16
>> arch/um/drivers/vector_transports.c:336:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] tx_session @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:336:40: sparse:     expected unsigned long long [usertype] tx_session
   arch/um/drivers/vector_transports.c:336:40: sparse:     got restricted __be32 [usertype]
>> arch/um/drivers/vector_transports.c:337:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] rx_session @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:337:40: sparse:     expected unsigned long long [usertype] rx_session
   arch/um/drivers/vector_transports.c:337:40: sparse:     got restricted __be32 [usertype]
>> arch/um/drivers/vector_transports.c:355:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] rx_cookie @@     got restricted __be64 [usertype] @@
   arch/um/drivers/vector_transports.c:355:47: sparse:     expected unsigned long long [usertype] rx_cookie
   arch/um/drivers/vector_transports.c:355:47: sparse:     got restricted __be64 [usertype]
>> arch/um/drivers/vector_transports.c:356:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] tx_cookie @@     got restricted __be64 [usertype] @@
   arch/um/drivers/vector_transports.c:356:47: sparse:     expected unsigned long long [usertype] tx_cookie
   arch/um/drivers/vector_transports.c:356:47: sparse:     got restricted __be64 [usertype]
>> arch/um/drivers/vector_transports.c:360:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] rx_cookie @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:360:47: sparse:     expected unsigned long long [usertype] rx_cookie
   arch/um/drivers/vector_transports.c:360:47: sparse:     got restricted __be32 [usertype]
>> arch/um/drivers/vector_transports.c:361:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] tx_cookie @@     got restricted __be32 [usertype] @@
   arch/um/drivers/vector_transports.c:361:47: sparse:     expected unsigned long long [usertype] tx_cookie
   arch/um/drivers/vector_transports.c:361:47: sparse:     got restricted __be32 [usertype]
--
>> arch/um/drivers/vector_kern.c:989:69: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned char [usertype] *header @@     got void [noderef] __user *[noderef] __user iov_base @@
   arch/um/drivers/vector_kern.c:989:69: sparse:     expected unsigned char [usertype] *header
   arch/um/drivers/vector_kern.c:989:69: sparse:     got void [noderef] __user *[noderef] __user iov_base
>> arch/um/drivers/vector_kern.c:297:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned char [usertype] *header @@     got void [noderef] __user *iov_base @@
   arch/um/drivers/vector_kern.c:297:47: sparse:     expected unsigned char [usertype] *header
   arch/um/drivers/vector_kern.c:297:47: sparse:     got void [noderef] __user *iov_base
>> arch/um/drivers/vector_kern.c:300:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *iov_base @@     got unsigned char *data @@
   arch/um/drivers/vector_kern.c:300:33: sparse:     expected void [noderef] __user *iov_base
   arch/um/drivers/vector_kern.c:300:33: sparse:     got unsigned char *data
>> arch/um/drivers/vector_kern.c:309:41: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *iov_base @@     got void * @@
   arch/um/drivers/vector_kern.c:309:41: sparse:     expected void [noderef] __user *iov_base
   arch/um/drivers/vector_kern.c:309:41: sparse:     got void *
>> arch/um/drivers/vector_kern.c:344:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct iovec *iov @@     got struct iovec [noderef] __user *msg_iov @@
   arch/um/drivers/vector_kern.c:344:45: sparse:     expected struct iovec *iov
   arch/um/drivers/vector_kern.c:344:45: sparse:     got struct iovec [noderef] __user *msg_iov
>> arch/um/drivers/vector_kern.c:349:47: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *msg_name @@     got void *remote_addr @@
   arch/um/drivers/vector_kern.c:349:47: sparse:     expected void [noderef] __user *msg_name
   arch/um/drivers/vector_kern.c:349:47: sparse:     got void *remote_addr
>> arch/um/drivers/vector_kern.c:487:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iovec *iov @@     got struct iovec [noderef] __user *msg_iov @@
   arch/um/drivers/vector_kern.c:487:29: sparse:     expected struct iovec *iov
   arch/um/drivers/vector_kern.c:487:29: sparse:     got struct iovec [noderef] __user *msg_iov
>> arch/um/drivers/vector_kern.c:491:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got void [noderef] __user *iov_base @@
   arch/um/drivers/vector_kern.c:491:50: sparse:     expected void const *objp
   arch/um/drivers/vector_kern.c:491:50: sparse:     got void [noderef] __user *iov_base
>> arch/um/drivers/vector_kern.c:555:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iovec [noderef] __user *msg_iov @@     got struct iovec *[assigned] iov @@
   arch/um/drivers/vector_kern.c:555:46: sparse:     expected struct iovec [noderef] __user *msg_iov
   arch/um/drivers/vector_kern.c:555:46: sparse:     got struct iovec *[assigned] iov
>> arch/um/drivers/vector_kern.c:563:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *iov_base @@     got void *[assigned] _res @@
   arch/um/drivers/vector_kern.c:563:39: sparse:     expected void [noderef] __user *iov_base
   arch/um/drivers/vector_kern.c:563:39: sparse:     got void *[assigned] _res
>> arch/um/drivers/vector_kern.c:606:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct iovec *iov @@     got struct iovec [noderef] __user *msg_iov @@
   arch/um/drivers/vector_kern.c:606:32: sparse:     expected struct iovec *iov
   arch/um/drivers/vector_kern.c:606:32: sparse:     got struct iovec [noderef] __user *msg_iov
   arch/um/drivers/vector_kern.c:635:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *iov_base @@     got unsigned char *data @@
   arch/um/drivers/vector_kern.c:635:33: sparse:     expected void [noderef] __user *iov_base
   arch/um/drivers/vector_kern.c:635:33: sparse:     got unsigned char *data
   arch/um/drivers/vector_kern.c:642:41: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *iov_base @@     got void * @@
   arch/um/drivers/vector_kern.c:642:41: sparse:     expected void [noderef] __user *iov_base
   arch/um/drivers/vector_kern.c:642:41: sparse:     got void *
>> arch/um/drivers/vector_kern.c:841:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iovec [noderef] __user *[assigned] msg_iov @@     got struct iovec * @@
   arch/um/drivers/vector_kern.c:841:21: sparse:     expected struct iovec [noderef] __user *[assigned] msg_iov
   arch/um/drivers/vector_kern.c:841:21: sparse:     got struct iovec *
>> arch/um/drivers/vector_kern.c:847:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *iov_base @@     got void *header_rxbuffer @@
   arch/um/drivers/vector_kern.c:847:33: sparse:     expected void [noderef] __user *iov_base
   arch/um/drivers/vector_kern.c:847:33: sparse:     got void *header_rxbuffer
>> arch/um/drivers/vector_kern.c:857:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *iov_base @@     got char *static [toplevel] drop_buffer @@
   arch/um/drivers/vector_kern.c:857:38: sparse:     expected void [noderef] __user *iov_base
   arch/um/drivers/vector_kern.c:857:38: sparse:     got char *static [toplevel] drop_buffer
>> arch/um/drivers/vector_kern.c:909:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *iov_base @@     got void *header_txbuffer @@
   arch/um/drivers/vector_kern.c:909:25: sparse:     expected void [noderef] __user *iov_base
   arch/um/drivers/vector_kern.c:909:25: sparse:     got void *header_txbuffer
>> arch/um/drivers/vector_kern.c:1143:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct sock_filter [noderef] __user *filter @@
   arch/um/drivers/vector_kern.c:1143:30: sparse:     expected void const *objp
   arch/um/drivers/vector_kern.c:1143:30: sparse:     got struct sock_filter [noderef] __user *filter
   arch/um/drivers/vector_kern.c:1382:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct sock_filter [noderef] __user *filter @@
   arch/um/drivers/vector_kern.c:1382:30: sparse:     expected void const *objp
   arch/um/drivers/vector_kern.c:1382:30: sparse:     got struct sock_filter [noderef] __user *filter
>> arch/um/drivers/vector_kern.c:1397:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sock_filter [noderef] __user *filter @@     got void *[assigned] _res @@
   arch/um/drivers/vector_kern.c:1397:25: sparse:     expected struct sock_filter [noderef] __user *filter
   arch/um/drivers/vector_kern.c:1397:25: sparse:     got void *[assigned] _res
   arch/um/drivers/vector_kern.c:1414:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct sock_filter [noderef] __user *filter @@
   arch/um/drivers/vector_kern.c:1414:30: sparse:     expected void const *objp
   arch/um/drivers/vector_kern.c:1414:30: sparse:     got struct sock_filter [noderef] __user *filter
>> arch/um/drivers/vector_kern.c:989:61: sparse: sparse: dereference of noderef expression

vim +989 arch/um/drivers/vector_kern.c

49da7e64f33e80 Anton Ivanov    2017-11-20   825  
49da7e64f33e80 Anton Ivanov    2017-11-20   826  /* Bog standard recv using recvmsg - not used normally unless the user
49da7e64f33e80 Anton Ivanov    2017-11-20   827   * explicitly specifies not to use recvmmsg vector RX.
49da7e64f33e80 Anton Ivanov    2017-11-20   828   */
49da7e64f33e80 Anton Ivanov    2017-11-20   829  
49da7e64f33e80 Anton Ivanov    2017-11-20   830  static int vector_legacy_rx(struct vector_private *vp)
49da7e64f33e80 Anton Ivanov    2017-11-20   831  {
49da7e64f33e80 Anton Ivanov    2017-11-20   832  	int pkt_len;
49da7e64f33e80 Anton Ivanov    2017-11-20   833  	struct user_msghdr hdr;
49da7e64f33e80 Anton Ivanov    2017-11-20   834  	struct iovec iov[2 + MAX_IOV_SIZE]; /* header + data use case only */
49da7e64f33e80 Anton Ivanov    2017-11-20   835  	int iovpos = 0;
49da7e64f33e80 Anton Ivanov    2017-11-20   836  	struct sk_buff *skb;
49da7e64f33e80 Anton Ivanov    2017-11-20   837  	int header_check;
49da7e64f33e80 Anton Ivanov    2017-11-20   838  
49da7e64f33e80 Anton Ivanov    2017-11-20   839  	hdr.msg_name = NULL;
49da7e64f33e80 Anton Ivanov    2017-11-20   840  	hdr.msg_namelen = 0;
49da7e64f33e80 Anton Ivanov    2017-11-20  @841  	hdr.msg_iov = (struct iovec *) &iov;
49da7e64f33e80 Anton Ivanov    2017-11-20   842  	hdr.msg_control = NULL;
49da7e64f33e80 Anton Ivanov    2017-11-20   843  	hdr.msg_controllen = 0;
49da7e64f33e80 Anton Ivanov    2017-11-20   844  	hdr.msg_flags = 0;
49da7e64f33e80 Anton Ivanov    2017-11-20   845  
49da7e64f33e80 Anton Ivanov    2017-11-20   846  	if (vp->header_size > 0) {
49da7e64f33e80 Anton Ivanov    2017-11-20  @847  		iov[0].iov_base = vp->header_rxbuffer;
49da7e64f33e80 Anton Ivanov    2017-11-20   848  		iov[0].iov_len = vp->header_size;
49da7e64f33e80 Anton Ivanov    2017-11-20   849  	}
49da7e64f33e80 Anton Ivanov    2017-11-20   850  
49da7e64f33e80 Anton Ivanov    2017-11-20   851  	skb = prep_skb(vp, &hdr);
49da7e64f33e80 Anton Ivanov    2017-11-20   852  
49da7e64f33e80 Anton Ivanov    2017-11-20   853  	if (skb == NULL) {
49da7e64f33e80 Anton Ivanov    2017-11-20   854  		/* Read a packet into drop_buffer and don't do
49da7e64f33e80 Anton Ivanov    2017-11-20   855  		 * anything with it.
49da7e64f33e80 Anton Ivanov    2017-11-20   856  		 */
49da7e64f33e80 Anton Ivanov    2017-11-20  @857  		iov[iovpos].iov_base = drop_buffer;
49da7e64f33e80 Anton Ivanov    2017-11-20   858  		iov[iovpos].iov_len = DROP_BUFFER_SIZE;
49da7e64f33e80 Anton Ivanov    2017-11-20   859  		hdr.msg_iovlen = 1;
49da7e64f33e80 Anton Ivanov    2017-11-20   860  		vp->dev->stats.rx_dropped++;
49da7e64f33e80 Anton Ivanov    2017-11-20   861  	}
49da7e64f33e80 Anton Ivanov    2017-11-20   862  
49da7e64f33e80 Anton Ivanov    2017-11-20   863  	pkt_len = uml_vector_recvmsg(vp->fds->rx_fd, &hdr, 0);
d47761db97d35c Anton Ivanov    2019-08-09   864  	if (pkt_len < 0) {
d47761db97d35c Anton Ivanov    2019-08-09   865  		vp->in_error = true;
d47761db97d35c Anton Ivanov    2019-08-09   866  		return pkt_len;
d47761db97d35c Anton Ivanov    2019-08-09   867  	}
49da7e64f33e80 Anton Ivanov    2017-11-20   868  
49da7e64f33e80 Anton Ivanov    2017-11-20   869  	if (skb != NULL) {
49da7e64f33e80 Anton Ivanov    2017-11-20   870  		if (pkt_len > vp->header_size) {
49da7e64f33e80 Anton Ivanov    2017-11-20   871  			if (vp->header_size > 0) {
49da7e64f33e80 Anton Ivanov    2017-11-20   872  				header_check = vp->verify_header(
49da7e64f33e80 Anton Ivanov    2017-11-20   873  					vp->header_rxbuffer, skb, vp);
49da7e64f33e80 Anton Ivanov    2017-11-20   874  				if (header_check < 0) {
49da7e64f33e80 Anton Ivanov    2017-11-20   875  					dev_kfree_skb_irq(skb);
49da7e64f33e80 Anton Ivanov    2017-11-20   876  					vp->dev->stats.rx_dropped++;
49da7e64f33e80 Anton Ivanov    2017-11-20   877  					vp->estats.rx_encaps_errors++;
49da7e64f33e80 Anton Ivanov    2017-11-20   878  					return 0;
49da7e64f33e80 Anton Ivanov    2017-11-20   879  				}
49da7e64f33e80 Anton Ivanov    2017-11-20   880  				if (header_check > 0) {
49da7e64f33e80 Anton Ivanov    2017-11-20   881  					vp->estats.rx_csum_offload_good++;
49da7e64f33e80 Anton Ivanov    2017-11-20   882  					skb->ip_summed = CHECKSUM_UNNECESSARY;
49da7e64f33e80 Anton Ivanov    2017-11-20   883  				}
49da7e64f33e80 Anton Ivanov    2017-11-20   884  			}
49da7e64f33e80 Anton Ivanov    2017-11-20   885  			pskb_trim(skb, pkt_len - vp->rx_header_size);
49da7e64f33e80 Anton Ivanov    2017-11-20   886  			skb->protocol = eth_type_trans(skb, skb->dev);
49da7e64f33e80 Anton Ivanov    2017-11-20   887  			vp->dev->stats.rx_bytes += skb->len;
49da7e64f33e80 Anton Ivanov    2017-11-20   888  			vp->dev->stats.rx_packets++;
b35507a4cfb26b Anton Ivanov    2022-01-21   889  			napi_gro_receive(&vp->napi, skb);
49da7e64f33e80 Anton Ivanov    2017-11-20   890  		} else {
49da7e64f33e80 Anton Ivanov    2017-11-20   891  			dev_kfree_skb_irq(skb);
49da7e64f33e80 Anton Ivanov    2017-11-20   892  		}
49da7e64f33e80 Anton Ivanov    2017-11-20   893  	}
49da7e64f33e80 Anton Ivanov    2017-11-20   894  	return pkt_len;
49da7e64f33e80 Anton Ivanov    2017-11-20   895  }
49da7e64f33e80 Anton Ivanov    2017-11-20   896  
49da7e64f33e80 Anton Ivanov    2017-11-20   897  /*
49da7e64f33e80 Anton Ivanov    2017-11-20   898   * Packet at a time TX which falls back to vector TX if the
49da7e64f33e80 Anton Ivanov    2017-11-20   899   * underlying transport is busy.
49da7e64f33e80 Anton Ivanov    2017-11-20   900   */
49da7e64f33e80 Anton Ivanov    2017-11-20   901  
49da7e64f33e80 Anton Ivanov    2017-11-20   902  
49da7e64f33e80 Anton Ivanov    2017-11-20   903  
49da7e64f33e80 Anton Ivanov    2017-11-20   904  static int writev_tx(struct vector_private *vp, struct sk_buff *skb)
49da7e64f33e80 Anton Ivanov    2017-11-20   905  {
49da7e64f33e80 Anton Ivanov    2017-11-20   906  	struct iovec iov[3 + MAX_IOV_SIZE];
49da7e64f33e80 Anton Ivanov    2017-11-20   907  	int iov_count, pkt_len = 0;
49da7e64f33e80 Anton Ivanov    2017-11-20   908  
49da7e64f33e80 Anton Ivanov    2017-11-20  @909  	iov[0].iov_base = vp->header_txbuffer;
49da7e64f33e80 Anton Ivanov    2017-11-20   910  	iov_count = prep_msg(vp, skb, (struct iovec *) &iov);
49da7e64f33e80 Anton Ivanov    2017-11-20   911  
49da7e64f33e80 Anton Ivanov    2017-11-20   912  	if (iov_count < 1)
49da7e64f33e80 Anton Ivanov    2017-11-20   913  		goto drop;
d47761db97d35c Anton Ivanov    2019-08-09   914  
49da7e64f33e80 Anton Ivanov    2017-11-20   915  	pkt_len = uml_vector_writev(
49da7e64f33e80 Anton Ivanov    2017-11-20   916  		vp->fds->tx_fd,
49da7e64f33e80 Anton Ivanov    2017-11-20   917  		(struct iovec *) &iov,
49da7e64f33e80 Anton Ivanov    2017-11-20   918  		iov_count
49da7e64f33e80 Anton Ivanov    2017-11-20   919  	);
49da7e64f33e80 Anton Ivanov    2017-11-20   920  
d47761db97d35c Anton Ivanov    2019-08-09   921  	if (pkt_len < 0)
d47761db97d35c Anton Ivanov    2019-08-09   922  		goto drop;
d47761db97d35c Anton Ivanov    2019-08-09   923  
49da7e64f33e80 Anton Ivanov    2017-11-20   924  	netif_trans_update(vp->dev);
49da7e64f33e80 Anton Ivanov    2017-11-20   925  	netif_wake_queue(vp->dev);
49da7e64f33e80 Anton Ivanov    2017-11-20   926  
49da7e64f33e80 Anton Ivanov    2017-11-20   927  	if (pkt_len > 0) {
49da7e64f33e80 Anton Ivanov    2017-11-20   928  		vp->dev->stats.tx_bytes += skb->len;
49da7e64f33e80 Anton Ivanov    2017-11-20   929  		vp->dev->stats.tx_packets++;
49da7e64f33e80 Anton Ivanov    2017-11-20   930  	} else {
49da7e64f33e80 Anton Ivanov    2017-11-20   931  		vp->dev->stats.tx_dropped++;
49da7e64f33e80 Anton Ivanov    2017-11-20   932  	}
49da7e64f33e80 Anton Ivanov    2017-11-20   933  	consume_skb(skb);
49da7e64f33e80 Anton Ivanov    2017-11-20   934  	return pkt_len;
49da7e64f33e80 Anton Ivanov    2017-11-20   935  drop:
49da7e64f33e80 Anton Ivanov    2017-11-20   936  	vp->dev->stats.tx_dropped++;
49da7e64f33e80 Anton Ivanov    2017-11-20   937  	consume_skb(skb);
d47761db97d35c Anton Ivanov    2019-08-09   938  	if (pkt_len < 0)
d47761db97d35c Anton Ivanov    2019-08-09   939  		vp->in_error = true;
49da7e64f33e80 Anton Ivanov    2017-11-20   940  	return pkt_len;
49da7e64f33e80 Anton Ivanov    2017-11-20   941  }
49da7e64f33e80 Anton Ivanov    2017-11-20   942  
49da7e64f33e80 Anton Ivanov    2017-11-20   943  /*
49da7e64f33e80 Anton Ivanov    2017-11-20   944   * Receive as many messages as we can in one call using the special
49da7e64f33e80 Anton Ivanov    2017-11-20   945   * mmsg vector matched to an skb vector which we prepared earlier.
49da7e64f33e80 Anton Ivanov    2017-11-20   946   */
49da7e64f33e80 Anton Ivanov    2017-11-20   947  
b35507a4cfb26b Anton Ivanov    2022-01-21   948  static int vector_mmsg_rx(struct vector_private *vp, int budget)
49da7e64f33e80 Anton Ivanov    2017-11-20   949  {
49da7e64f33e80 Anton Ivanov    2017-11-20   950  	int packet_count, i;
49da7e64f33e80 Anton Ivanov    2017-11-20   951  	struct vector_queue *qi = vp->rx_queue;
49da7e64f33e80 Anton Ivanov    2017-11-20   952  	struct sk_buff *skb;
49da7e64f33e80 Anton Ivanov    2017-11-20   953  	struct mmsghdr *mmsg_vector = qi->mmsg_vector;
49da7e64f33e80 Anton Ivanov    2017-11-20   954  	void **skbuff_vector = qi->skbuff_vector;
49da7e64f33e80 Anton Ivanov    2017-11-20   955  	int header_check;
49da7e64f33e80 Anton Ivanov    2017-11-20   956  
49da7e64f33e80 Anton Ivanov    2017-11-20   957  	/* Refresh the vector and make sure it is with new skbs and the
49da7e64f33e80 Anton Ivanov    2017-11-20   958  	 * iovs are updated to point to them.
49da7e64f33e80 Anton Ivanov    2017-11-20   959  	 */
49da7e64f33e80 Anton Ivanov    2017-11-20   960  
49da7e64f33e80 Anton Ivanov    2017-11-20   961  	prep_queue_for_rx(qi);
49da7e64f33e80 Anton Ivanov    2017-11-20   962  
49da7e64f33e80 Anton Ivanov    2017-11-20   963  	/* Fire the Lazy Gun - get as many packets as we can in one go. */
49da7e64f33e80 Anton Ivanov    2017-11-20   964  
b35507a4cfb26b Anton Ivanov    2022-01-21   965  	if (budget > qi->max_depth)
b35507a4cfb26b Anton Ivanov    2022-01-21   966  		budget = qi->max_depth;
b35507a4cfb26b Anton Ivanov    2022-01-21   967  
49da7e64f33e80 Anton Ivanov    2017-11-20   968  	packet_count = uml_vector_recvmmsg(
671cd5eed9db34 Anton Ivanov    2024-07-06   969  		vp->fds->rx_fd, qi->mmsg_vector, budget, 0);
49da7e64f33e80 Anton Ivanov    2017-11-20   970  
d47761db97d35c Anton Ivanov    2019-08-09   971  	if (packet_count < 0)
d47761db97d35c Anton Ivanov    2019-08-09   972  		vp->in_error = true;
d47761db97d35c Anton Ivanov    2019-08-09   973  
49da7e64f33e80 Anton Ivanov    2017-11-20   974  	if (packet_count <= 0)
49da7e64f33e80 Anton Ivanov    2017-11-20   975  		return packet_count;
49da7e64f33e80 Anton Ivanov    2017-11-20   976  
49da7e64f33e80 Anton Ivanov    2017-11-20   977  	/* We treat packet processing as enqueue, buffer refresh as dequeue
49da7e64f33e80 Anton Ivanov    2017-11-20   978  	 * The queue_depth tells us how many buffers have been used and how
49da7e64f33e80 Anton Ivanov    2017-11-20   979  	 * many do we need to prep the next time prep_queue_for_rx() is called.
49da7e64f33e80 Anton Ivanov    2017-11-20   980  	 */
49da7e64f33e80 Anton Ivanov    2017-11-20   981  
612a8c8e0b43ba Anton Ivanov    2024-07-05   982  	atomic_add(packet_count, &qi->queue_depth);
49da7e64f33e80 Anton Ivanov    2017-11-20   983  
49da7e64f33e80 Anton Ivanov    2017-11-20   984  	for (i = 0; i < packet_count; i++) {
49da7e64f33e80 Anton Ivanov    2017-11-20   985  		skb = (*skbuff_vector);
49da7e64f33e80 Anton Ivanov    2017-11-20   986  		if (mmsg_vector->msg_len > vp->header_size) {
49da7e64f33e80 Anton Ivanov    2017-11-20   987  			if (vp->header_size > 0) {
49da7e64f33e80 Anton Ivanov    2017-11-20   988  				header_check = vp->verify_header(
49da7e64f33e80 Anton Ivanov    2017-11-20  @989  					mmsg_vector->msg_hdr.msg_iov->iov_base,
49da7e64f33e80 Anton Ivanov    2017-11-20   990  					skb,
49da7e64f33e80 Anton Ivanov    2017-11-20   991  					vp
49da7e64f33e80 Anton Ivanov    2017-11-20   992  				);
49da7e64f33e80 Anton Ivanov    2017-11-20   993  				if (header_check < 0) {
49da7e64f33e80 Anton Ivanov    2017-11-20   994  				/* Overlay header failed to verify - discard.
49da7e64f33e80 Anton Ivanov    2017-11-20   995  				 * We can actually keep this skb and reuse it,
49da7e64f33e80 Anton Ivanov    2017-11-20   996  				 * but that will make the prep logic too
49da7e64f33e80 Anton Ivanov    2017-11-20   997  				 * complex.
49da7e64f33e80 Anton Ivanov    2017-11-20   998  				 */
49da7e64f33e80 Anton Ivanov    2017-11-20   999  					dev_kfree_skb_irq(skb);
49da7e64f33e80 Anton Ivanov    2017-11-20  1000  					vp->estats.rx_encaps_errors++;
49da7e64f33e80 Anton Ivanov    2017-11-20  1001  					continue;
49da7e64f33e80 Anton Ivanov    2017-11-20  1002  				}
49da7e64f33e80 Anton Ivanov    2017-11-20  1003  				if (header_check > 0) {
49da7e64f33e80 Anton Ivanov    2017-11-20  1004  					vp->estats.rx_csum_offload_good++;
49da7e64f33e80 Anton Ivanov    2017-11-20  1005  					skb->ip_summed = CHECKSUM_UNNECESSARY;
49da7e64f33e80 Anton Ivanov    2017-11-20  1006  				}
49da7e64f33e80 Anton Ivanov    2017-11-20  1007  			}
49da7e64f33e80 Anton Ivanov    2017-11-20  1008  			pskb_trim(skb,
49da7e64f33e80 Anton Ivanov    2017-11-20  1009  				mmsg_vector->msg_len - vp->rx_header_size);
49da7e64f33e80 Anton Ivanov    2017-11-20  1010  			skb->protocol = eth_type_trans(skb, skb->dev);
49da7e64f33e80 Anton Ivanov    2017-11-20  1011  			/*
49da7e64f33e80 Anton Ivanov    2017-11-20  1012  			 * We do not need to lock on updating stats here
49da7e64f33e80 Anton Ivanov    2017-11-20  1013  			 * The interrupt loop is non-reentrant.
49da7e64f33e80 Anton Ivanov    2017-11-20  1014  			 */
49da7e64f33e80 Anton Ivanov    2017-11-20  1015  			vp->dev->stats.rx_bytes += skb->len;
49da7e64f33e80 Anton Ivanov    2017-11-20  1016  			vp->dev->stats.rx_packets++;
b35507a4cfb26b Anton Ivanov    2022-01-21  1017  			napi_gro_receive(&vp->napi, skb);
49da7e64f33e80 Anton Ivanov    2017-11-20  1018  		} else {
49da7e64f33e80 Anton Ivanov    2017-11-20  1019  			/* Overlay header too short to do anything - discard.
49da7e64f33e80 Anton Ivanov    2017-11-20  1020  			 * We can actually keep this skb and reuse it,
49da7e64f33e80 Anton Ivanov    2017-11-20  1021  			 * but that will make the prep logic too complex.
49da7e64f33e80 Anton Ivanov    2017-11-20  1022  			 */
49da7e64f33e80 Anton Ivanov    2017-11-20  1023  			if (skb != NULL)
49da7e64f33e80 Anton Ivanov    2017-11-20  1024  				dev_kfree_skb_irq(skb);
49da7e64f33e80 Anton Ivanov    2017-11-20  1025  		}
49da7e64f33e80 Anton Ivanov    2017-11-20  1026  		(*skbuff_vector) = NULL;
49da7e64f33e80 Anton Ivanov    2017-11-20  1027  		/* Move to the next buffer element */
49da7e64f33e80 Anton Ivanov    2017-11-20  1028  		mmsg_vector++;
49da7e64f33e80 Anton Ivanov    2017-11-20  1029  		skbuff_vector++;
49da7e64f33e80 Anton Ivanov    2017-11-20  1030  	}
49da7e64f33e80 Anton Ivanov    2017-11-20  1031  	if (packet_count > 0) {
49da7e64f33e80 Anton Ivanov    2017-11-20  1032  		if (vp->estats.rx_queue_max < packet_count)
49da7e64f33e80 Anton Ivanov    2017-11-20  1033  			vp->estats.rx_queue_max = packet_count;
49da7e64f33e80 Anton Ivanov    2017-11-20  1034  		vp->estats.rx_queue_running_average =
49da7e64f33e80 Anton Ivanov    2017-11-20  1035  			(vp->estats.rx_queue_running_average + packet_count) >> 1;
49da7e64f33e80 Anton Ivanov    2017-11-20  1036  	}
49da7e64f33e80 Anton Ivanov    2017-11-20  1037  	return packet_count;
49da7e64f33e80 Anton Ivanov    2017-11-20  1038  }
49da7e64f33e80 Anton Ivanov    2017-11-20  1039  
49da7e64f33e80 Anton Ivanov    2017-11-20  1040  static int vector_net_start_xmit(struct sk_buff *skb, struct net_device *dev)
49da7e64f33e80 Anton Ivanov    2017-11-20  1041  {
49da7e64f33e80 Anton Ivanov    2017-11-20  1042  	struct vector_private *vp = netdev_priv(dev);
49da7e64f33e80 Anton Ivanov    2017-11-20  1043  	int queue_depth = 0;
49da7e64f33e80 Anton Ivanov    2017-11-20  1044  
d47761db97d35c Anton Ivanov    2019-08-09  1045  	if (vp->in_error) {
d47761db97d35c Anton Ivanov    2019-08-09  1046  		deactivate_fd(vp->fds->rx_fd, vp->rx_irq);
d47761db97d35c Anton Ivanov    2019-08-09  1047  		if ((vp->fds->rx_fd != vp->fds->tx_fd) && (vp->tx_irq != 0))
d47761db97d35c Anton Ivanov    2019-08-09  1048  			deactivate_fd(vp->fds->tx_fd, vp->tx_irq);
d47761db97d35c Anton Ivanov    2019-08-09  1049  		return NETDEV_TX_BUSY;
d47761db97d35c Anton Ivanov    2019-08-09  1050  	}
d47761db97d35c Anton Ivanov    2019-08-09  1051  
49da7e64f33e80 Anton Ivanov    2017-11-20  1052  	if ((vp->options & VECTOR_TX) == 0) {
49da7e64f33e80 Anton Ivanov    2017-11-20  1053  		writev_tx(vp, skb);
49da7e64f33e80 Anton Ivanov    2017-11-20  1054  		return NETDEV_TX_OK;
49da7e64f33e80 Anton Ivanov    2017-11-20  1055  	}
49da7e64f33e80 Anton Ivanov    2017-11-20  1056  
49da7e64f33e80 Anton Ivanov    2017-11-20  1057  	/* We do BQL only in the vector path, no point doing it in
49da7e64f33e80 Anton Ivanov    2017-11-20  1058  	 * packet at a time mode as there is no device queue
49da7e64f33e80 Anton Ivanov    2017-11-20  1059  	 */
49da7e64f33e80 Anton Ivanov    2017-11-20  1060  
49da7e64f33e80 Anton Ivanov    2017-11-20  1061  	netdev_sent_queue(vp->dev, skb->len);
49da7e64f33e80 Anton Ivanov    2017-11-20  1062  	queue_depth = vector_enqueue(vp->tx_queue, skb);
49da7e64f33e80 Anton Ivanov    2017-11-20  1063  
b35507a4cfb26b Anton Ivanov    2022-01-21  1064  	if (queue_depth < vp->tx_queue->max_depth && netdev_xmit_more()) {
49da7e64f33e80 Anton Ivanov    2017-11-20  1065  		mod_timer(&vp->tl, vp->coalesce);
49da7e64f33e80 Anton Ivanov    2017-11-20  1066  		return NETDEV_TX_OK;
b35507a4cfb26b Anton Ivanov    2022-01-21  1067  	} else {
b35507a4cfb26b Anton Ivanov    2022-01-21  1068  		queue_depth = vector_send(vp->tx_queue);
b35507a4cfb26b Anton Ivanov    2022-01-21  1069  		if (queue_depth > 0)
b35507a4cfb26b Anton Ivanov    2022-01-21  1070  			napi_schedule(&vp->napi);
49da7e64f33e80 Anton Ivanov    2017-11-20  1071  	}
b35507a4cfb26b Anton Ivanov    2022-01-21  1072  
49da7e64f33e80 Anton Ivanov    2017-11-20  1073  	return NETDEV_TX_OK;
49da7e64f33e80 Anton Ivanov    2017-11-20  1074  }
49da7e64f33e80 Anton Ivanov    2017-11-20  1075  
49da7e64f33e80 Anton Ivanov    2017-11-20  1076  static irqreturn_t vector_rx_interrupt(int irq, void *dev_id)
49da7e64f33e80 Anton Ivanov    2017-11-20  1077  {
49da7e64f33e80 Anton Ivanov    2017-11-20  1078  	struct net_device *dev = dev_id;
49da7e64f33e80 Anton Ivanov    2017-11-20  1079  	struct vector_private *vp = netdev_priv(dev);
49da7e64f33e80 Anton Ivanov    2017-11-20  1080  
49da7e64f33e80 Anton Ivanov    2017-11-20  1081  	if (!netif_running(dev))
49da7e64f33e80 Anton Ivanov    2017-11-20  1082  		return IRQ_NONE;
b35507a4cfb26b Anton Ivanov    2022-01-21  1083  	napi_schedule(&vp->napi);
49da7e64f33e80 Anton Ivanov    2017-11-20  1084  	return IRQ_HANDLED;
49da7e64f33e80 Anton Ivanov    2017-11-20  1085  
49da7e64f33e80 Anton Ivanov    2017-11-20  1086  }
49da7e64f33e80 Anton Ivanov    2017-11-20  1087  
49da7e64f33e80 Anton Ivanov    2017-11-20  1088  static irqreturn_t vector_tx_interrupt(int irq, void *dev_id)
49da7e64f33e80 Anton Ivanov    2017-11-20  1089  {
49da7e64f33e80 Anton Ivanov    2017-11-20  1090  	struct net_device *dev = dev_id;
49da7e64f33e80 Anton Ivanov    2017-11-20  1091  	struct vector_private *vp = netdev_priv(dev);
49da7e64f33e80 Anton Ivanov    2017-11-20  1092  
49da7e64f33e80 Anton Ivanov    2017-11-20  1093  	if (!netif_running(dev))
49da7e64f33e80 Anton Ivanov    2017-11-20  1094  		return IRQ_NONE;
49da7e64f33e80 Anton Ivanov    2017-11-20  1095  	/* We need to pay attention to it only if we got
49da7e64f33e80 Anton Ivanov    2017-11-20  1096  	 * -EAGAIN or -ENOBUFFS from sendmmsg. Otherwise
49da7e64f33e80 Anton Ivanov    2017-11-20  1097  	 * we ignore it. In the future, it may be worth
49da7e64f33e80 Anton Ivanov    2017-11-20  1098  	 * it to improve the IRQ controller a bit to make
49da7e64f33e80 Anton Ivanov    2017-11-20  1099  	 * tweaking the IRQ mask less costly
49da7e64f33e80 Anton Ivanov    2017-11-20  1100  	 */
49da7e64f33e80 Anton Ivanov    2017-11-20  1101  
b35507a4cfb26b Anton Ivanov    2022-01-21  1102  	napi_schedule(&vp->napi);
49da7e64f33e80 Anton Ivanov    2017-11-20  1103  	return IRQ_HANDLED;
49da7e64f33e80 Anton Ivanov    2017-11-20  1104  
49da7e64f33e80 Anton Ivanov    2017-11-20  1105  }
49da7e64f33e80 Anton Ivanov    2017-11-20  1106  
49da7e64f33e80 Anton Ivanov    2017-11-20  1107  static int irq_rr;
49da7e64f33e80 Anton Ivanov    2017-11-20  1108  
49da7e64f33e80 Anton Ivanov    2017-11-20  1109  static int vector_net_close(struct net_device *dev)
49da7e64f33e80 Anton Ivanov    2017-11-20  1110  {
49da7e64f33e80 Anton Ivanov    2017-11-20  1111  	struct vector_private *vp = netdev_priv(dev);
49da7e64f33e80 Anton Ivanov    2017-11-20  1112  
49da7e64f33e80 Anton Ivanov    2017-11-20  1113  	netif_stop_queue(dev);
8fa7292fee5c52 Thomas Gleixner 2025-04-05  1114  	timer_delete(&vp->tl);
49da7e64f33e80 Anton Ivanov    2017-11-20  1115  
98ff534ec2cd02 Johannes Berg   2024-07-03  1116  	vp->opened = false;
98ff534ec2cd02 Johannes Berg   2024-07-03  1117  
49da7e64f33e80 Anton Ivanov    2017-11-20  1118  	if (vp->fds == NULL)
49da7e64f33e80 Anton Ivanov    2017-11-20  1119  		return 0;
49da7e64f33e80 Anton Ivanov    2017-11-20  1120  
49da7e64f33e80 Anton Ivanov    2017-11-20  1121  	/* Disable and free all IRQS */
49da7e64f33e80 Anton Ivanov    2017-11-20  1122  	if (vp->rx_irq > 0) {
49da7e64f33e80 Anton Ivanov    2017-11-20  1123  		um_free_irq(vp->rx_irq, dev);
49da7e64f33e80 Anton Ivanov    2017-11-20  1124  		vp->rx_irq = 0;
49da7e64f33e80 Anton Ivanov    2017-11-20  1125  	}
49da7e64f33e80 Anton Ivanov    2017-11-20  1126  	if (vp->tx_irq > 0) {
49da7e64f33e80 Anton Ivanov    2017-11-20  1127  		um_free_irq(vp->tx_irq, dev);
49da7e64f33e80 Anton Ivanov    2017-11-20  1128  		vp->tx_irq = 0;
49da7e64f33e80 Anton Ivanov    2017-11-20  1129  	}
b35507a4cfb26b Anton Ivanov    2022-01-21  1130  	napi_disable(&vp->napi);
b35507a4cfb26b Anton Ivanov    2022-01-21  1131  	netif_napi_del(&vp->napi);
49da7e64f33e80 Anton Ivanov    2017-11-20  1132  	if (vp->fds->rx_fd > 0) {
9807019a62dc67 Anton Ivanov    2019-10-02  1133  		if (vp->bpf)
9807019a62dc67 Anton Ivanov    2019-10-02  1134  			uml_vector_detach_bpf(vp->fds->rx_fd, vp->bpf);
49da7e64f33e80 Anton Ivanov    2017-11-20  1135  		os_close_file(vp->fds->rx_fd);
49da7e64f33e80 Anton Ivanov    2017-11-20  1136  		vp->fds->rx_fd = -1;
49da7e64f33e80 Anton Ivanov    2017-11-20  1137  	}
49da7e64f33e80 Anton Ivanov    2017-11-20  1138  	if (vp->fds->tx_fd > 0) {
49da7e64f33e80 Anton Ivanov    2017-11-20  1139  		os_close_file(vp->fds->tx_fd);
49da7e64f33e80 Anton Ivanov    2017-11-20  1140  		vp->fds->tx_fd = -1;
49da7e64f33e80 Anton Ivanov    2017-11-20  1141  	}
9807019a62dc67 Anton Ivanov    2019-10-02  1142  	if (vp->bpf != NULL)
9807019a62dc67 Anton Ivanov    2019-10-02 @1143  		kfree(vp->bpf->filter);
49da7e64f33e80 Anton Ivanov    2017-11-20  1144  	kfree(vp->bpf);
9807019a62dc67 Anton Ivanov    2019-10-02  1145  	vp->bpf = NULL;
49da7e64f33e80 Anton Ivanov    2017-11-20  1146  	kfree(vp->fds->remote_addr);
49da7e64f33e80 Anton Ivanov    2017-11-20  1147  	kfree(vp->transport_data);
49da7e64f33e80 Anton Ivanov    2017-11-20  1148  	kfree(vp->header_rxbuffer);
49da7e64f33e80 Anton Ivanov    2017-11-20  1149  	kfree(vp->header_txbuffer);
49da7e64f33e80 Anton Ivanov    2017-11-20  1150  	if (vp->rx_queue != NULL)
49da7e64f33e80 Anton Ivanov    2017-11-20  1151  		destroy_queue(vp->rx_queue);
49da7e64f33e80 Anton Ivanov    2017-11-20  1152  	if (vp->tx_queue != NULL)
49da7e64f33e80 Anton Ivanov    2017-11-20  1153  		destroy_queue(vp->tx_queue);
49da7e64f33e80 Anton Ivanov    2017-11-20  1154  	kfree(vp->fds);
49da7e64f33e80 Anton Ivanov    2017-11-20  1155  	vp->fds = NULL;
d47761db97d35c Anton Ivanov    2019-08-09  1156  	vp->in_error = false;
49da7e64f33e80 Anton Ivanov    2017-11-20  1157  	return 0;
49da7e64f33e80 Anton Ivanov    2017-11-20  1158  }
49da7e64f33e80 Anton Ivanov    2017-11-20  1159  

:::::: The code at line 989 was first introduced by commit
:::::: 49da7e64f33e80edffb1a9eeb230fa4c3f42dffb High Performance UML Vector Network Driver

:::::: TO: Anton Ivanov <anton.ivanov@cambridgegreys.com>
:::::: CC: Richard Weinberger <richard@nod.at>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

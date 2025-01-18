Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276612F50
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737208459; cv=none; b=dk4EuWyaY1kN/CPtwxhbaIs9VvakQLgFNnGW8M+iA8YLndy7baJCOTvCGE4ayRDPCYi0dm1nx3rDrmA+OC0V35ygwKx8b592RqotlnANZH+6XWDDuQ7LREWfn5buOqjrjLhBnmV3jf2qBVv/fgbcLI4D26OxhdHhWhw94EXEUUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737208459; c=relaxed/simple;
	bh=grnZHMKKzAIHLhf7Br7XzHkFw8ggtj1ZSuXi6yoCTUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p0U2fnTuanQ+YcQZFyESqwXqIAXW/JAbpGRjTkvWm3Wy63CDZuDijUP/rGJaVO2wKr/ZmximNn9Q5GlawaZ3mHywjibhc8Y5Udepk5+kM39VnE61BV68EFx1cbNysLJmtHgaXWKjkXH+46Hwy5Z9BWAFBUZJw9NwRP04iu+pTkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSt7QK7M; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSt7QK7M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737208457; x=1768744457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=grnZHMKKzAIHLhf7Br7XzHkFw8ggtj1ZSuXi6yoCTUc=;
  b=YSt7QK7ME/IvU8g/0YudGcBU5s6cpKfp8UI/nPjznB/qTmxL7HgyfLQU
   XuVtfxLzU8qnjIeGpkb7KhBFFNNEOa0stxn1/IcrE8qx4eWfNONLDwHog
   CiVnSHIwdWDEf/kUJYdXo3FEmdoVkG49sC9nAFm6i+H5HLMYkfSnzNO20
   0qKr0vgKJPEBz3u58xIzCvGIgMTGOjdGXfBydwnCv464ryl5KauvOe8yb
   aAsgSqBUK/e8yY8cY2+OVTKLfz77xII1RmLZc12PSQVZ5LzLS2EuV/aZF
   n+j9bNw4ARnzeqAC5a8Hb8IOpm9hx89MJZ2bsMJ/DWM89wiJ1lBUd8Nd5
   Q==;
X-CSE-ConnectionGUID: lX0jgaLpQtWp4J8vcJDYEA==
X-CSE-MsgGUID: kNMaLBtSQBC9BSCVgtAfBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37791295"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="37791295"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 05:54:16 -0800
X-CSE-ConnectionGUID: 3gLCZLzTQmK87NwYFPNHVQ==
X-CSE-MsgGUID: HNe/6uqASL6H6rySEMQS0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105905932"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Jan 2025 05:54:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ9HA-000UU5-2f;
	Sat, 18 Jan 2025 13:54:12 +0000
Date: Sat, 18 Jan 2025 21:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 324/324]
 drivers/rpmsg/mtk_rpmsg_mbox.c:33:5: warning: no previous prototype for
 function 'mtk_mbox_send'
Message-ID: <202501182118.bGnCZiM8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c5c75fa9e727eeea4f1aac71a5838a1bdc76d0dd
commit: 0b263763b3a9ab1dd29c899035ef2660eea35d14 [324/324] CHROMIUM: mailbox: add tinysys mailbox
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250118/202501182118.bGnCZiM8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501182118.bGnCZiM8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501182118.bGnCZiM8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rpmsg/mtk_rpmsg_mbox.c:33:5: warning: no previous prototype for function 'mtk_mbox_send' [-Wmissing-prototypes]
      33 | int mtk_mbox_send(struct mtk_rpmsg_endpoint *mept,
         |     ^
   drivers/rpmsg/mtk_rpmsg_mbox.c:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | int mtk_mbox_send(struct mtk_rpmsg_endpoint *mept,
         | ^
         | static 
   1 warning generated.
--
>> drivers/soc/mediatek/mtk-mbox.c:23:6: warning: no previous prototype for function 'mtk_memcpy_to_tinysys' [-Wmissing-prototypes]
      23 | void mtk_memcpy_to_tinysys(void __iomem *dest, const void *src, uint32_t size)
         |      ^
   drivers/soc/mediatek/mtk-mbox.c:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      23 | void mtk_memcpy_to_tinysys(void __iomem *dest, const void *src, uint32_t size)
         | ^
         | static 
>> drivers/soc/mediatek/mtk-mbox.c:39:6: warning: no previous prototype for function 'mtk_memcpy_from_tinysys' [-Wmissing-prototypes]
      39 | void mtk_memcpy_from_tinysys(void *dest, const void __iomem *src, uint32_t size)
         |      ^
   drivers/soc/mediatek/mtk-mbox.c:39:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      39 | void mtk_memcpy_from_tinysys(void *dest, const void __iomem *src, uint32_t size)
         | ^
         | static 
>> drivers/soc/mediatek/mtk-mbox.c:356:5: warning: no previous prototype for function 'mtk_mbox_set_base_reg' [-Wmissing-prototypes]
     356 | int mtk_mbox_set_base_reg(struct mtk_mbox_device *mbdev, unsigned int mbox,
         |     ^
   drivers/soc/mediatek/mtk-mbox.c:356:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     356 | int mtk_mbox_set_base_reg(struct mtk_mbox_device *mbdev, unsigned int mbox,
         | ^
         | static 
>> drivers/soc/mediatek/mtk-mbox.c:846:6: warning: no previous prototype for function 'mtk_mbox_print_recv' [-Wmissing-prototypes]
     846 | void mtk_mbox_print_recv(struct mtk_mbox_device *mbdev,
         |      ^
   drivers/soc/mediatek/mtk-mbox.c:846:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     846 | void mtk_mbox_print_recv(struct mtk_mbox_device *mbdev,
         | ^
         | static 
>> drivers/soc/mediatek/mtk-mbox.c:864:6: warning: no previous prototype for function 'mtk_mbox_print_send' [-Wmissing-prototypes]
     864 | void mtk_mbox_print_send(struct mtk_mbox_device *mbdev,
         |      ^
   drivers/soc/mediatek/mtk-mbox.c:864:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     864 | void mtk_mbox_print_send(struct mtk_mbox_device *mbdev,
         | ^
         | static 
>> drivers/soc/mediatek/mtk-mbox.c:876:6: warning: no previous prototype for function 'mtk_mbox_print_minfo' [-Wmissing-prototypes]
     876 | void mtk_mbox_print_minfo(struct mtk_mbox_device *mbdev,
         |      ^
   drivers/soc/mediatek/mtk-mbox.c:876:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     876 | void mtk_mbox_print_minfo(struct mtk_mbox_device *mbdev,
         | ^
         | static 
   6 warnings generated.


vim +/mtk_mbox_send +33 drivers/rpmsg/mtk_rpmsg_mbox.c

    32	
  > 33	int mtk_mbox_send(struct mtk_rpmsg_endpoint *mept,
    34			    struct mtk_rpmsg_channel_info_mbox *mchan, void *buf,
    35			    unsigned int len, unsigned int wait)
    36	{
    37		struct mtk_mbox_device *mbdev;
    38		unsigned int status;
    39		unsigned long flags;
    40		int ret;
    41	
    42		if (WARN_ON(len > mchan->send_slot_size) || WARN_ON(!buf))
    43			return -EINVAL;
    44	
    45		mbdev = mept->mdev->mbdev;
    46	
    47		spin_lock_irqsave(&mchan->channel_lock, flags);
    48		status = mtk_mbox_check_send_irq(mbdev, mchan->mbox,
    49						 mchan->send_pin_index);
    50		if (status != 0) {
    51			spin_unlock_irqrestore(&mchan->channel_lock, flags);
    52			return MBOX_PIN_BUSY;
    53		}
    54		spin_unlock_irqrestore(&mchan->channel_lock, flags);
    55	
    56		ret = mtk_mbox_write(mbdev, mchan->mbox, mchan->send_slot, buf,
    57				     len * MBOX_SLOT_SIZE);
    58		if (ret != MBOX_DONE)
    59			return ret;
    60	
    61		/*
    62		 * Ensure that all writes to SRAM are committed before sending the
    63		 * interrupt to mbox.
    64		 */
    65		mb();
    66	
    67		ret = mtk_mbox_trigger_irq(mbdev, mchan->mbox,
    68					   BIT(mchan->send_pin_index));
    69		if (ret != MBOX_DONE)
    70			return ret;
    71	
    72		return ret;
    73	}
    74	EXPORT_SYMBOL_GPL(mtk_mbox_send);
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

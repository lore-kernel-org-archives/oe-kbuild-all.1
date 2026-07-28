Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BEE2FD69D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 02:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785205296; cv=none; b=I39X0m9uAPbZnQuoWraIUGnZg+SMLo41bmfA1xLm//fRQ8bp+z5xlPtpPx8YFMtzgjnaE18AWzGVPg+QTE9VWrh0BGSPFH+upzLhQ4Ror+ApZQWWzBnZL5c8IWRxyFMr6NdrPB0Szof0xPBolCBt1YjB9AjXUV+q6IpBhMSrw44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785205296; c=relaxed/simple;
	bh=HkcLxIbzd+t2GPNN6LHD0TuJpooR4LDrFzVOlkjOt4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RXjoQrQGX0DKplUFKHfrCf+M3LWPqGjA5XvapkAFeNtfMfzIyrq9hN/8RITyQIzo3yRva4O5OUUTL0Z9BGxKclQOKzxwgo/FB634ygobvIS9cgnzjkJx2Ursd1d2XjkJoPx8W6ZP/IjX5d+eYmcTc/XE1a7GoRAJ8BkB1Vp+NMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sqk8i04H; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sqk8i04H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785205294; x=1816741294;
  h=date:from:to:cc:subject:message-id;
  bh=HkcLxIbzd+t2GPNN6LHD0TuJpooR4LDrFzVOlkjOt4c=;
  b=Sqk8i04HaQanwjbgqnYsAgF9Umyeb3gEq2aNRvA7vHBB9Ku3v7pjb4EG
   5shGuchjJRTGcpVgSruIQtoRVAnxlkNbQqrzsUPN3tq76q7oDLOU5bZ6h
   O1CMWi0y++SatmVRa6laR7CNqyNMREBp/XXs6lCITnHS1gy7o519a1eMr
   q3NLtY3ncebtgCcqc7aOqZDNNXYgI1h/Jj5d9kB2NVz9oIQ2802fpwN2U
   6YcuI5bXpAbdw4tEgQQYmlAszBpxvrgH5NeXqMdFcBftbrgjGDLTARMub
   rfl2EX32KdfhDx6pUtbDr70DxwXJbsLfedhAjsH8wRN8bxUhF8ULY9F/t
   Q==;
X-CSE-ConnectionGUID: e/sRrDjvSGeMG1upWe4cXg==
X-CSE-MsgGUID: ax0QMyBtSoavQjVQozkjBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103324430"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="103324430"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 19:21:31 -0700
X-CSE-ConnectionGUID: ZMeG1KxuS8uByjepQNBE2w==
X-CSE-MsgGUID: hlB/yNrjQwK6JildLY+5cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="284109887"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jul 2026 19:21:31 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woXRg-000000001pc-1tIE;
	Tue, 28 Jul 2026 02:21:28 +0000
Date: Tue, 28 Jul 2026 04:20:42 +0200
From: kernel test robot <lkp@intel.com>
To: Alyssa Milburn <amilburn@zall.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Sasha Finkelstein <k@chaosmail.tech>
Subject: drivers/usb/typec/tipd/tps6598x.h:278:9: error: unknown type
 name 'irq_handler_t'
Message-ID: <202607280438.1eFxz2WN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sasha-Finkelstein/dt-bindings-usb-tps6598x-Add-sn201202x-ACE3/20260728-021733
head:   120b1ba9159f9fe3394ca9ec5dec17ceb36a95b8
commit: 133e6f453965860e6a9335187d55789b988fd111 usb: typec: tipd: Factor out i2c specifics
date:   8 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260728/202607280438.1eFxz2WN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280438.1eFxz2WN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280438.1eFxz2WN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/usb/typec/tipd/trace.h:15,
                    from drivers/usb/typec/tipd/trace.c:9:
>> drivers/usb/typec/tipd/tps6598x.h:278:9: error: unknown type name 'irq_handler_t'
     278 |         irq_handler_t irq_handler;
         |         ^~~~~~~~~~~~~


vim +/irq_handler_t +278 drivers/usb/typec/tipd/tps6598x.h

   276	
   277	struct tipd_data {
 > 278		irq_handler_t irq_handler;
   279		u64 irq_mask1;
   280		size_t tps_struct_size;
   281		void (*remove)(struct tps6598x *tps);
   282		int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
   283		void (*unregister_port)(struct tps6598x *tps);
   284		void (*trace_data_status)(u32 status);
   285		void (*trace_power_status)(u16 status);
   286		void (*trace_status)(u32 status);
   287		int (*apply_patch)(struct tps6598x *tps);
   288		int (*init)(struct tps6598x *tps);
   289		int (*switch_power_state)(struct tps6598x *tps, u8 target_state);
   290		bool (*read_data_status)(struct tps6598x *tps);
   291		int (*reset)(struct tps6598x *tps);
   292		int (*connect)(struct tps6598x *tps, u32 status);
   293	};
   294	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7611B18B0A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 21:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786917090; cv=none; b=gzsxsUeI3Tl95zDDCKqDg8ACyFH1iplbEMA554R5qRtIksnmdXpxLvPgA3VOSS93+i/GEStKpXAm6lntNm5CYjq29hEv7y4tky9dhyGSGwQyBkMWjToCF0bFrvy+ye1VWD7K3pCkGQ3EffUwErK1b6a7zSUq2DuKDjkF/9Zs+Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786917090; c=relaxed/simple;
	bh=CtqEFv68O0/6jfD9J4yny3PjNUVsgd4jzK5J41RFoBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmcmS1vrc3uQ9ZyS2CLd6fsKbFegECX4p1b1NMpTdA4AL+dLhKe4XNM3tQ9yYpvIiZa6ewtVUJ5lbG7br+KERQPTj1YndTZu74fcPPT+QYwksxjcMOodrv4WF4PJFU9k6PY6oZkvjJc/CVXAzah9bR+PaKF/sWEUAEjmWwaN0J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9tNQ9lg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9tNQ9lg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786917088; x=1818453088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CtqEFv68O0/6jfD9J4yny3PjNUVsgd4jzK5J41RFoBs=;
  b=K9tNQ9lgVLUOeT6VoOA2OdV//B1V19ejaDhAkO2TQMVTZNuKmUpVXs/a
   3AN6m8LM3HSbw7E4jLlt/gjAaRN6e9SR4qBFVi0meu5OxWN8us5hclmsi
   3QD6fjCm8glDlr2MvRarGpO+1868DDnY0+VcwO31uC4waLizN2eS7PXfK
   ZDYTq4o8/4rX0k1ZNhoQ0qnm9K30y9wfEZU9290SgaaRth6ljNp1R0m5r
   DSCGwfPtWUoZk8Hcob6x2A8G5ALk9oLixUsKQuxBfjd7HykHGYeKIAdcj
   27Gp6M/gh1Te8LNpeKjrFUMigjioCuU6ky4fw+48Q7HH/caH41OUM79RL
   Q==;
X-CSE-ConnectionGUID: xnxzOt7iRq6+yMWRdUqa6w==
X-CSE-MsgGUID: rIbO3u8dRI+LNUA81ks6Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98760716"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="98760716"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 14:51:27 -0700
X-CSE-ConnectionGUID: z0cJomoVTfi5OwCwsfsmRg==
X-CSE-MsgGUID: X+zZ3OAaQ/WuiBIz3IPM3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="288213754"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Aug 2026 14:51:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvilI-00000000d74-0xN1;
	Sun, 16 Aug 2026 21:51:24 +0000
Date: Mon, 17 Aug 2026 05:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] x86/VMBus: DMA transfer with encrypted memory in
 Coco VM
Message-ID: <202608170501.Y5JDNZFt-lkp@intel.com>
References: <20260803033520.12930-1-tiala@microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803033520.12930-1-tiala@microsoft.com>

Hi Tianyu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.2-rc7 next-20260814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/x86-VMBus-DMA-transfer-with-encrypted-memory-in-Coco-VM/20260814-182223
base:   linus/master
patch link:    https://lore.kernel.org/r/20260803033520.12930-1-tiala%40microsoft.com
patch subject: [RFC PATCH 1/1] x86/VMBus: DMA transfer with encrypted memory in Coco VM
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260817/202608170501.Y5JDNZFt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170501.Y5JDNZFt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170501.Y5JDNZFt-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/hv/vmbus_drv.c:1471:6: warning: no previous prototype for 'is_vmbus_dev' [-Wmissing-prototypes]
1471 | bool is_vmbus_dev(struct device *dev)
|      ^~~~~~~~~~~~
--
>> ERROR: modpost: "hyperv_dma_ops" [drivers/hv/hv_vmbus.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

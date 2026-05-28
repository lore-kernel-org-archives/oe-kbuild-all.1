Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8F11DE8BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 04:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779941353; cv=none; b=ipfT4LdNKvTQGnuiES1an38U3ZqkSsPmyMFOAOSbuEE7g1WY+na8Ai5+gh+989sOeTnRXXcRlEHuh2utir2xubD/wSbiTdRr1V/utoUoTFv3j3deONqrKFM9ikjZnuYevqMugfOG6idrUULd90IKwWQ3Q211nbWIOdit1Z6k8UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779941353; c=relaxed/simple;
	bh=tH9A3MNvl2a6azFgxxTYX5M0ETyR1C70l3QunYaJvlM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p3jKIlIjswxBBfX3ip7I0662JPNOgxIMcQZLrC/UuqudqPwmYUQJh3EcRif6YG0Oz9UsGxxy9exfs6IzVvTjAkkppPUdkGR0wouynGxkymGlhvZUFVr6Lg2yzT0qAz2XswceN0CxcvY4PTmGDTBg+ZGddFggmmoMwMQfNVbDrqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAZEOzpw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAZEOzpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779941351; x=1811477351;
  h=date:from:to:cc:subject:message-id;
  bh=tH9A3MNvl2a6azFgxxTYX5M0ETyR1C70l3QunYaJvlM=;
  b=IAZEOzpw61ys8Sz9FDp2SZUq4mq6xViorVIoxAUzz0bIwSAT1lb/HRcQ
   LX25HDK7/SxrR316mH9P4v/eZ0Qr+w7Nfk3aNEC+ZyVDXYu2/VeCCdjO8
   kKT1t0kwmv3fHiO+wr9uqYRIFbZvoj+oTirCrz9OxyjBOx1Wu1MaAD4t6
   zpjvPVPjdUM5+12ZrE1ww9O+deNUbzbqowN2nRaofSn2tIlNhMwbQkFdp
   yDltHLpQxOYHuF0WjCgt5jXZkDzlTMzeEZW7u4Jj9wq7ZJGluvvGQjyAO
   icBOjtVsZ/5JSFtDn4yFXmYyTWPN6SI3XV0WNVr39Sc/bTcwOhNWzFuUd
   Q==;
X-CSE-ConnectionGUID: f2J2nRaCRxSgrb/43FpQHg==
X-CSE-MsgGUID: gRXvag3PRWixkjIvt0HHrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92255680"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="92255680"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 21:09:11 -0700
X-CSE-ConnectionGUID: y/nFnYuXQrmu9wOxWoZchQ==
X-CSE-MsgGUID: H3ytlRz5TqCexUjcaNnoOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="242520189"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 27 May 2026 21:09:07 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSS3N-000000000HV-0EUh;
	Thu, 28 May 2026 04:09:05 +0000
Date: Thu, 28 May 2026 06:08:38 +0200
From: kernel test robot <lkp@intel.com>
To: Karan Tilak Kumar <kartilak@cisco.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 Arulprabhu Ponnusamy <arulponn@cisco.com>,
 Gian Carlo Boffa <gcboffa@cisco.com>, Arun Easi <aeasi@cisco.com>,
 Hannes Reinecke <hare@kernel.org>, Lee Duncan <lduncan@suse.com>
Subject: drivers/scsi/fnic/fdls_fc.h:260:1: warning: alignment 1 of
 'struct fc_std_ls_req' is less than 8
Message-ID: <202605280619.pmobiDWp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Karan-Tilak-Kumar/scsi-fnic-Make-debug-logging-protocol-independent/20260528-040540
head:   36a4121c6d75bc8b76d0f8211fb04fb4957393e1
commit: a54275319b24362d4d0e2483b0bbe01a77f966f1 scsi: fnic: Send NVMe LS requests through FDLS
date:   8 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260528/202605280619.pmobiDWp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280619.pmobiDWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605280619.pmobiDWp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/fnic/fnic_fdls.h:11,
                    from drivers/scsi/fnic/fnic_io.h:11,
                    from drivers/scsi/fnic/fnic.h:17,
                    from drivers/scsi/fnic/fip.c:6:
>> drivers/scsi/fnic/fdls_fc.h:260:1: warning: alignment 1 of 'struct fc_std_ls_req' is less than 8 [-Wpacked-not-aligned]
     260 | } __packed;
         | ^
--
   In file included from drivers/scsi/fnic/fnic_fdls.h:11,
                    from drivers/scsi/fnic/fnic_io.h:11,
                    from drivers/scsi/fnic/fnic.h:17,
                    from drivers/scsi/fnic/fnic_nvme.c:21:
>> drivers/scsi/fnic/fdls_fc.h:260:1: warning: alignment 1 of 'struct fc_std_ls_req' is less than 8 [-Wpacked-not-aligned]
     260 | } __packed;
         | ^
   drivers/scsi/fnic/fnic_nvme.c: In function 'nvfnic_queuecommand':
   drivers/scsi/fnic/fnic_nvme.c:227:13: warning: variable 'idx' set but not used [-Wunused-but-set-variable]
     227 |         int idx;
         |             ^~~
   drivers/scsi/fnic/fnic_nvme.c: In function 'nvfnic_fcpio_nvme_fast_cmpl_handler':
   drivers/scsi/fnic/fnic_nvme.c:373:30: warning: variable 'tport' set but not used [-Wunused-but-set-variable]
     373 |         struct fnic_tport_s *tport;
         |                              ^~~~~
   drivers/scsi/fnic/fnic_nvme.c: In function 'nvfnic_fcpio_ersp_cmpl_handler':
   drivers/scsi/fnic/fnic_nvme.c:509:30: warning: variable 'tport' set but not used [-Wunused-but-set-variable]
     509 |         struct fnic_tport_s *tport;
         |                              ^~~~~
   drivers/scsi/fnic/fnic_nvme.c: In function 'nvfnic_fcpio_nvme_itmf_cmpl_handler':
   drivers/scsi/fnic/fnic_nvme.c:666:30: warning: variable 'tport' set but not used [-Wunused-but-set-variable]
     666 |         struct fnic_tport_s *tport;
         |                              ^~~~~
   drivers/scsi/fnic/fnic_nvme.c:664:23: warning: variable 'start_time' set but not used [-Wunused-but-set-variable]
     664 |         unsigned long start_time;
         |                       ^~~~~~~~~~


vim +260 drivers/scsi/fnic/fdls_fc.h

   256	
   257	struct fc_std_ls_req {
   258		struct fc_frame_header fchdr;
   259		struct nvmefc_ls_req ls_req;
 > 260	} __packed;
   261	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

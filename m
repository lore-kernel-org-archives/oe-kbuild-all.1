Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9680130C15F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 02:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779157513; cv=none; b=V4NCwGBYZvyCOMWff2Nkc0G+45IpCAa4waOBMNuuaq5T5HxXqPfTh6OjF3pjBNC6Z4wYPoJEkg64w0nZw587YpNDy+UVVvj4VCUnFLGG7K6jdSaBOqRcPQ+Zj56pBjzHIcBIsVTH5fEKbt8+ns19bOKC0cIdvSfw/vkEY/QDxEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779157513; c=relaxed/simple;
	bh=MoIXejZK4DvCKnusDXVOW365/fP17BOFe6YxOv5nHiU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RPCUxsVUU2T0ODnMuHkEwtng8fenRz9s+ig5Z+JQP7eCji6EhZo9WaRJ+tMwUFTD6p+zH1JC2eeOIr2QxEvaJ32VGvXFuPLWNJYmwkcTxydhHKrlG3c4YNhqKyR5ucDcFIFyjrPe95ct4NuNYOAUC7ISNPVzcShtu8RU78caQcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iq/TS0IV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iq/TS0IV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779157512; x=1810693512;
  h=date:from:to:cc:subject:message-id;
  bh=MoIXejZK4DvCKnusDXVOW365/fP17BOFe6YxOv5nHiU=;
  b=iq/TS0IVFJ7zyarVP7yP/jnnuiv3+DvSkctgbB07bb94E2fLZqKKgc5s
   ACPZWAzMRCcALrgukh2zUy24a632wuh9XiH9lAczTzBkZPOeAblHLNlOz
   d3swGr8LTU9RVKYjUAidfwX9oTN2N3htVJFLcS/ZFcGJt2/RoTP5Ebtl2
   84ZjvZ94n0cWayqoNOeKgzcoVLfgw8LbfJDJfPLEcyypRPwQmtV1bkV8X
   XsP/ZlEPwUc/A3Dqk4BhvkPzxJldKz0aqsg77k8EEXSS8TGmw5lCzFFzL
   IzXBkWRkdWAs5ZLgdc1X1TsQyb1k/u2i+xzRyM6qB50lkA8EMI75bxZ/U
   w==;
X-CSE-ConnectionGUID: PaP4ElMNREWtbjYJAOFtUg==
X-CSE-MsgGUID: CRQxYX5ESlWxTsnU8lXGOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91419232"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91419232"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:25:11 -0700
X-CSE-ConnectionGUID: AFPjFgnOR8O7zyZW+frENQ==
X-CSE-MsgGUID: tPIrIzFJRdOqMNAgP6Wvsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263142011"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 18 May 2026 19:25:10 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPA8p-00000000A3p-2udK;
	Tue, 19 May 2026 02:25:07 +0000
Date: Tue, 19 May 2026 04:24:43 +0200
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 43/43] s390x-linux-gnu-ld:
 kernel/time/timekeeping.c:2375:undefined reference to `ntp_get_time_state'
Message-ID: <202605190452.eN5D6EtP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   123146665ac9426e106557f5c14f8743b128a6b2
commit: 123146665ac9426e106557f5c14f8743b128a6b2 [43/43] kernel/time: Add /dev/vmclock_host miscdev
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260519/202605190452.eN5D6EtP-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190452.eN5D6EtP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190452.eN5D6EtP-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-gnu-ld: kernel/time/timekeeping.o: in function `timekeeping_adjust':
   kernel/time/timekeeping.c:2374:(.text+0x864): undefined reference to `ntp_get_status'
>> s390x-linux-gnu-ld: kernel/time/timekeeping.c:2375:(.text+0x874): undefined reference to `ntp_get_time_state'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258730;
	b=h59zJKjRRwGdAqAEEgE5v19PL8tb5O2SJFId5Ik1dsr42LNpeMYxNVuaNWgIne6Xicp7
	 3BXikkyAuYDQNWOIHDPCcvWzvBu73i+XpuPnVwhN9qq1d+x2Cuu6PsVwM1obYF+U65/wL
	 9msTXN5a5x6kdok5sQYe+QHOcfkGzOz0YR2W24hV45sYHlXDLbvyJfa+s8vBHj7QU8LgG
	 a3toc9UX0eRKiOf62yZkU5qBpeLNhYLRHtf2RvW7ZM+MxtJuokps+swnSt0heHZ59ZDJj
	 1FPRL5BgPYz6YsdAaZtpQz5cMaMVqGWS90U4NkVz6oU6OCcnRiF7UZofaPCJLiHLZ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258730;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=81LJPDvx89CoZT4hf8Pu1pH44fBggMLuvFdmRZ6jqX8=;
	b=5S46ahsY6htL4K5vPPj+mjfkw3qc+kR1YH1lHCR3t9+l3JnJgYM65wLKVeteb+myP29n
	 f0JhQQ/CFcvt7h9I9on8JBhNiCkoNYTeDxIKmQVv18WDiFEtdYR/hidh0M728emsT8G8P
	 OJQcStv0nAFs0BEnk3AUP+y08Chrn1ce5FSvJBvEbxi0ik60If/4rjK45LSJFLxZ9ZfEw
	 Hn2LDVuSLYj79cKgwPagEzEv+IXIkrOHBzmEzvVOOlL+1pD5BiSyD63LCX2mSa3+jIB+j
	 YA/BJn2BbYHHrLoqNWANpGOzB61HHp1Lq8SywI66xxRVmvWEYV5NfXGV5Q5Imz8HkDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F3eSB+VK;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CDD606A321
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 21:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15CDD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F3eSB+VK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794258730; x=1825794730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gxYtxO+2eMGpONGrNp4PBU06L5SiPEzU67NeCyIQNk4=;
  b=F3eSB+VK7d0z6nOlNRWjW0W7AtWysXGYmvugH5DCrLPP9ykjzJumUB04
   spmashQEdy48ab84aKEChYtg37O0ORharFc2kszwv8k52mFE4hfXBvMMf
   5f+K7dGRMyjaW7A0OTOOhFspwnOF/6uBdFksxsdt1PB+M8Tf7zsuAo2nl
   yKfjBWF41IUtPmRRFH/NUtKLbDeW8h5yMF/d3urmrtLmM61erjqDE3q8x
   9cR2B53yZu7088WVI2BDEVizJ0C8le+/CwHYc5+Ac1BVo/xm/KWDW2tfe
   YrmdLxVAN4Ba6Hu2p5B3ukPABaTXGgemlkQnJTz4pG3Oc6G50TNTy0DTW
   Q==;
X-CSE-ConnectionGUID: ibzAT7EmSxGxb6oMeHVoWw==
X-CSE-MsgGUID: WIdQNGa8SFyBbM4umPypMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2992806"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2992806"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 13:12:10 -0800
X-CSE-ConnectionGUID: WWEop3DfSBmVu73bsAIzIw==
X-CSE-MsgGUID: uTY2yx17T9id0b+s2yJ5Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8279553"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Nov 2026 13:12:07 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQWeq-00000000vKd-2HSm;
	Mon, 09 Nov 2026 21:12:04 +0000
Date: Tue, 10 Nov 2026 05:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Baorui.Liu" <baorliu@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	acpica-devel@lists.linuxfoundation.org,
	kernel test robot <lkp@intel.com>, "Baorui.Liu" <baorliu@amd.com>
Subject: Re: [PATCH v7] ACPI: button: Report wakeup key only for power button
 wakeups
Message-ID: <202611100542.1xljQv20-lkp@intel.com>
References: <20261109082832.496-1-baorliu@amd.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109082832.496-1-baorliu@amd.com>

Hi Baorui.Liu,

kernel test robot noticed the following build errors:

[auto build test ERROR on ee3b82351a306b559fd132b9b168185fee641a18]

url:    https://github.com/intel-lab-lkp/linux/commits/Baorui-Liu/ACPI-button-Report-wakeup-key-only-for-power-button-wakeups/20261109-162832
base:   ee3b82351a306b559fd132b9b168185fee641a18
patch link:    https://lore.kernel.org/r/20261109082832.496-1-baorliu%40amd.com
patch subject: [PATCH v7] ACPI: button: Report wakeup key only for power button wakeups
config: x86_64-randconfig-1015-20261109 (https://download.01.org/0day-ci/archive/20261110/202611100542.1xljQv20-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611100542.1xljQv20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611100542.1xljQv20-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/acpi/button.o: in function `acpi_button_resume':
>> drivers/acpi/button.c:568:(.text+0x2384): undefined reference to `acpi_sleep_pwr_btn_wakeup_pending'


vim +568 drivers/acpi/button.c

   544	
   545	static int acpi_button_resume(struct device *dev)
   546	{
   547		struct acpi_button *button = dev_get_drvdata(dev);
   548		struct input_dev *input;
   549		bool report_wakeup = false;
   550	
   551		/*
   552		 * Drain notify work queued while suspended so a late power-button
   553		 * notify still observes suspended == true, sets wakeup_pending, and
   554		 * does not synthesize KEY_POWER for userspace.
   555		 */
   556		acpi_os_wait_events_complete();
   557	
   558		/*
   559		 * Sample and report KEY_WAKEUP before clearing suspended. Otherwise a
   560		 * notify that arrives after sampling but before suspended is cleared
   561		 * can set wakeup_pending and then be dropped without KEY_WAKEUP or
   562		 * KEY_POWER. Clear suspended before wakeup_pending so a new SCI sees
   563		 * suspended == false and takes the normal KEY_POWER path; barrier()
   564		 * keeps that store order.
   565		 */
   566		if (button->type == ACPI_BUTTON_TYPE_POWER) {
   567			report_wakeup = READ_ONCE(button->wakeup_pending) ||
 > 568					acpi_sleep_pwr_btn_wakeup_pending();
   569			if (report_wakeup) {
   570				input = button->input;
   571				input_report_key(input, KEY_WAKEUP, 1);
   572				input_sync(input);
   573				input_report_key(input, KEY_WAKEUP, 0);
   574				input_sync(input);
   575			}
   576		}
   577	
   578		WRITE_ONCE(button->suspended, false);
   579		barrier();
   580		WRITE_ONCE(button->wakeup_pending, false);
   581	
   582		if (button->type == ACPI_BUTTON_TYPE_LID) {
   583			button->last_state = !!acpi_lid_evaluate_state(ACPI_HANDLE(dev));
   584			button->last_time = ktime_get();
   585			acpi_lid_initialize_state(button);
   586		}
   587	
   588		return 0;
   589	}
   590	#endif
   591	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FF93A63EC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 19:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788288; cv=none; b=lhDz8rU0V/4bU/mxvT+NjFqT3xSjEVwXCPidzX85flJbsouQulCHY71gLCC1uNAD9LHXt3NyJQCXDAfDoo2ZR+uv7+vogvI8hFgsGwoOnVVkHGxxafnv/swUK6bUzj55Spl7atCL2D4s62ZmOVxkTipvhu5o81AlNScm1SvhUp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788288; c=relaxed/simple;
	bh=f7yZtzD2D4biq1GymvpnYZFUf9TCiHRo0pX+HUR8WaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LeNzWbORQTdanW4GH2WtcBQo2ufCNWQdI+LPSTTAFQIrmJqYf/tw68zN2ECgD7Y3ZVlMASh/uY8OM/8IuCQbpooU0deOPQ+LxUBssh6c15LqWQVDUFv4cmltg7a8JaROpRqUTQ5HpH0NhGSYKu7GJmh45Z/qanciICWJhpM1Zc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYoh3s+H; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYoh3s+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778788287; x=1810324287;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=f7yZtzD2D4biq1GymvpnYZFUf9TCiHRo0pX+HUR8WaQ=;
  b=PYoh3s+HqjWqyAsdRBnFLd3rCgBGtILnqmkrGGFTzpWpft22c3boSTCg
   MOha3E4UjlKHXI7FqkkffYwrcBRfdyzwdWNFv+YA53BXLSD5cprzOkWX4
   fkjfr74diGWrYhnONlbowWEicscHOeS8Is4J80PH0anZ/PuQZA57gViC6
   WnWOTkyYc0j9P3c9sHUkWo5ioC9pEcy5VVw3xfzl7ZZUfvBEA2mKMTkhm
   ybdDw9k+xDzgzOfQdZqi1rP6AUCya/DwbDY3JWxX5zw2yi7KWwPBHN/Ur
   0djClmv654iJfHg7vY7Yfg+Olnf9hv22rFHE0LIFsVdr5SqgTxaT72/6f
   w==;
X-CSE-ConnectionGUID: n73fczg1TQa/bLzNDNtX9g==
X-CSE-MsgGUID: YkEZhJLQTg22CHlnJmriIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79771376"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79771376"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 12:51:27 -0700
X-CSE-ConnectionGUID: EBZwBntsRFGYsmy/AodNZg==
X-CSE-MsgGUID: m0qldoyRTlCiVNj1XehBnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="243457563"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 May 2026 12:51:24 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNc5a-0000000072n-1zVd;
	Thu, 14 May 2026 19:51:22 +0000
Date: Fri, 15 May 2026 03:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jork Loeser <jloeser@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
 "Anirudh Rayabharam (Microsoft)" <anirudh@anirudhrb.com>,
 Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Subject: [hyperv:hyperv-fixes 4/8]
 drivers/hv/mshv_synic.c:591:undefined reference to `hv_vmbus_exists'
Message-ID: <202605150351.zra956jl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hy=
perv-fixes
head:   8b35874f56ded0cc1a90a25b87411249a86246cd
commit: f1a9e67c11388965802a61922c313bfc43272afe [4/8] mshv: limit SynIC ma=
nagement to MSHV-owned resources
config: x86_64-randconfig-072-20260514 (https://download.01.org/0day-ci/arc=
hive/20260515/202605150351.zra956jl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260515/202605150351.zra956jl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150351.zra956jl-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `mshv_synic_cpu_exit':
>> drivers/hv/mshv_synic.c:591:(.text+0x1f57f97): undefined reference to `h=
v_vmbus_exists'
   ld: vmlinux.o: in function `mshv_synic_cpu_init':
   drivers/hv/mshv_synic.c:470:(.text+0x1f58229): undefined reference to `h=
v_vmbus_exists'


vim +591 drivers/hv/mshv_synic.c

   579=09
   580	static int mshv_synic_cpu_exit(unsigned int cpu)
   581	{
   582		union hv_synic_sint sint;
   583		union hv_synic_sirbp sirbp;
   584		struct hv_synic_pages *spages =3D this_cpu_ptr(synic_pages);
   585		struct hv_message_page **msg_page =3D &spages->hyp_synic_message_pa=
ge;
   586		struct hv_synic_event_flags_page **event_flags_page =3D
   587			&spages->synic_event_flags_page;
   588		struct hv_synic_event_ring_page **event_ring_page =3D
   589			&spages->synic_event_ring_page;
   590		/* VMBus owns SIMP/SIEFP/SCONTROL when it is active */
 > 591		bool vmbus_active =3D hv_vmbus_exists();
   592=09
   593		/* Disable the interrupt */
   594		sint.as_uint64 =3D hv_get_non_nested_msr(HV_MSR_SINT0 + HV_SYNIC_IN=
TERCEPTION_SINT_INDEX);
   595		sint.masked =3D true;
   596		hv_set_non_nested_msr(HV_MSR_SINT0 + HV_SYNIC_INTERCEPTION_SINT_IND=
EX,
   597				      sint.as_uint64);
   598=09
   599		/* Disable Doorbell SINT */
   600		sint.as_uint64 =3D hv_get_non_nested_msr(HV_MSR_SINT0 + HV_SYNIC_DO=
ORBELL_SINT_INDEX);
   601		sint.masked =3D true;
   602		hv_set_non_nested_msr(HV_MSR_SINT0 + HV_SYNIC_DOORBELL_SINT_INDEX,
   603				      sint.as_uint64);
   604=09
   605		if (mshv_sint_irq !=3D -1)
   606			disable_percpu_irq(mshv_sint_irq);
   607=09
   608		/* Disable SYNIC event ring page owned by MSHV */
   609		sirbp.as_uint64 =3D hv_get_non_nested_msr(HV_MSR_SIRBP);
   610		sirbp.sirbp_enabled =3D false;
   611=09
   612		if (hv_root_partition()) {
   613			hv_set_non_nested_msr(HV_MSR_SIRBP, sirbp.as_uint64);
   614			memunmap(*event_ring_page);
   615		} else {
   616			sirbp.base_sirbp_gpa =3D 0;
   617			hv_set_non_nested_msr(HV_MSR_SIRBP, sirbp.as_uint64);
   618			free_page((unsigned long)*event_ring_page);
   619		}
   620=09
   621		/*
   622		 * Release our mappings of the message and event flags pages.
   623		 * When VMBus is not active, we enabled SIMP/SIEFP =E2=80=94 disable
   624		 * them. Otherwise VMBus owns the MSRs =E2=80=94 leave them.
   625		 */
   626		memunmap(*event_flags_page);
   627		if (!vmbus_active) {
   628			union hv_synic_simp simp;
   629			union hv_synic_siefp siefp;
   630=09
   631			siefp.as_uint64 =3D hv_get_non_nested_msr(HV_MSR_SIEFP);
   632			siefp.siefp_enabled =3D false;
   633			hv_set_non_nested_msr(HV_MSR_SIEFP, siefp.as_uint64);
   634=09
   635			simp.as_uint64 =3D hv_get_non_nested_msr(HV_MSR_SIMP);
   636			simp.simp_enabled =3D false;
   637			hv_set_non_nested_msr(HV_MSR_SIMP, simp.as_uint64);
   638		}
   639		memunmap(*msg_page);
   640=09
   641		/* When VMBus is active it owns SCONTROL =E2=80=94 leave it. */
   642		if (!vmbus_active) {
   643			union hv_synic_scontrol sctrl;
   644=09
   645			sctrl.as_uint64 =3D hv_get_non_nested_msr(HV_MSR_SCONTROL);
   646			sctrl.enable =3D 0;
   647			hv_set_non_nested_msr(HV_MSR_SCONTROL, sctrl.as_uint64);
   648		}
   649=09
   650		return 0;
   651	}
   652=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

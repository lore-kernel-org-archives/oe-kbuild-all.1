Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECDB3A7D63
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 05:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785217422; cv=none; b=swDvMfJ3JkeK04fxhQJv8en2mE7fKtVCdAqcz2WmaXEYfgKj/xM15dlyunJineZmG9Vk9Uryme5OrX+y4heEY2XlBX0ljTFX9BazWQw1SrqCA3JSo6pKZ2ocaM2M0i8ib8T6mDGFWgvUMQ4nVNil07a2qcJsDXUU4wG5kqOWbE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785217422; c=relaxed/simple;
	bh=F9yEtZyeho+FY12MENJKS7bgNWiXDCvFOAX2HwQwedc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gc+oAf9TRRSUyoT92a38fUjiZxVVWq8uQDQ9xMrfevEdAHawHNOAV7t7L37Msymnd/SmyYm7LWtcioduyvfhiYPJv3aZG8dUVsGD6XaVlpA3aK6ehgq9MFh4KWgyNb+7jobxBpx8j4235sdQPrMRzf9AQn0WXlpYLPgWgo2rRPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPa/SJLR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPa/SJLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785217419; x=1816753419;
  h=date:from:to:cc:subject:message-id;
  bh=F9yEtZyeho+FY12MENJKS7bgNWiXDCvFOAX2HwQwedc=;
  b=ZPa/SJLRIf1m8/YFJBynK1R5agTVVP3Fy35P1LQ3G0+9NkOnetXzpRfv
   F3wsRXu2oRBmL5gfxaQioOCsTYL3I/IRmjSQLEak70v5eHZXHCkyMKsNm
   ZEgM6xvfmUfpUbjzLFtjD/cjGjUc0amFpuL2wX4AVYfQutbL3ad9X+pN8
   PfmhaARgbEM1D0rLBHBKqTcOvwwZeJZErCgJrUyp5PdAK8JLxNCRcT4AG
   XfZ8T/LQwz8TtohbfbASeHs+N+vYWAGNQQEta390X2pg5xHi9+RKm3jV4
   HRBFOOLWQnBjChNVzJ/Ir4bKFTYSYqFAlQoVKmZ2znc7WnPVei64LyP5k
   g==;
X-CSE-ConnectionGUID: kHexAYVxSbu4XSL8lRtNmg==
X-CSE-MsgGUID: SMHmpLQWT0ulFebxLTUsCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84919780"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="84919780"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 22:43:38 -0700
X-CSE-ConnectionGUID: uD0qElgJT1SwJ4pJS40Raw==
X-CSE-MsgGUID: t3F+Q3pqRPuh2QzDv2HPLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="256941276"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jul 2026 22:43:36 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woabG-000000001sO-2Yxo;
	Tue, 28 Jul 2026 05:43:34 +0000
Date: Tue, 28 Jul 2026 07:43:13 +0200
From: kernel test robot <lkp@intel.com>
To: Jack Allister <jalliste@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [sean-jc:rev/get_set_guest_clock 112/112]
 usr/include/asm/kvm.h:15:10: fatal error: asm/pvclock-abi.h: No such file or
 directory
Message-ID: <202607280712.Keg8YVi4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux rev/get_set_guest_clock
head:   9796c520977c647c82515987b362119c7c4593ed
commit: 9796c520977c647c82515987b362119c7c4593ed [112/112] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for accurate KVM clock migration
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260728/202607280712.Keg8YVi4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280712.Keg8YVi4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280712.Keg8YVi4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/kvm.h:16,
                    from <command-line>:
>> usr/include/asm/kvm.h:15:10: fatal error: asm/pvclock-abi.h: No such file or directory
      15 | #include <asm/pvclock-abi.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from <command-line>:
>> ./usr/include/asm/kvm.h:15:10: fatal error: asm/pvclock-abi.h: No such file or directory
      15 | #include <asm/pvclock-abi.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC9345CBC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785609563; cv=none; b=fkHar2ZxVNqlB6Y29Xwhxge76x/OaLbQut+fbAeIg/k0EZ5CtUqKjHJqR/a2auQ6I7cIuV5XcZ0Qx8Qz37QtiQkOjd4nFWIscrBLob670cbV5cSRliwa5uMER2xBaocbxA/bMZEhHCe8ZZqO0sbbN9ckpUtjG7+izPJLjRUbnK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785609563; c=relaxed/simple;
	bh=V58I2MZwmdNoiOtAXI+euH5bowG4h3ZoF95zX3OtP4E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XIJHSpFmJdlmCxBQo9Nq2TGxqj4triiaPVVnX/MU8HZUxqZbvDh897+bHhJ16Ro+ZfLBcro7WDIaVQ3ZMUqnRCyQEjbfbKF14+QIK4EAciHWEhIqJMUGtjyrfUW34Yu1OrzwV285hHce00u/EX1j3yeiZQCm4+RAn5xD4DsOMaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/goDT25; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/goDT25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785609562; x=1817145562;
  h=date:from:to:cc:subject:message-id;
  bh=V58I2MZwmdNoiOtAXI+euH5bowG4h3ZoF95zX3OtP4E=;
  b=c/goDT25ilIOw0k1d1Zf+QV/M0NEiu5RUUAMPWzxbZYeAAzmENfC8STU
   8srCriRRPtau1QJJrWEsFVLhkN8b5q//ahj6mvlAbWu3/qM/DGxO2Wohw
   CcOKjEKOX8GABdUxXLaSn8CGW3DeT8AVnyLIiWLqQuaOWrJSqJ4OLvYs+
   pA6tha8VVJS0xwzc6AoAURjcD6nBj5HmX92zDjPRA27MyobJyO6y2Ndtu
   ElOPhlMgvA0oNWoQdNeIIMuGy1SYoU0kz8MjDy7n12FA5MA853nRI66LZ
   4gs9iMQa5do+29LWbWc5JjMq9s+eQs2SsZxBqqmHoyoEI9VosM11OUsYk
   w==;
X-CSE-ConnectionGUID: V0DvhvyaTCyKE9TS6ZDi9w==
X-CSE-MsgGUID: na0nKt9HQhyd7+Bt7iemDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="96869785"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="96869785"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 11:39:21 -0700
X-CSE-ConnectionGUID: Gz9T53c2SNKWBjnW2kL5+g==
X-CSE-MsgGUID: Mk7YE4aISk+2YDceVind6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="259606622"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Aug 2026 11:39:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqEc8-000000003l9-3b3i;
	Sat, 01 Aug 2026 18:39:16 +0000
Date: Sun, 02 Aug 2026 02:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Allister <jalliste@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [sean-jc:rev/get_set_guest_clock 112/112]
 usr/include/asm/kvm.h:15:10: fatal error: asm/pvclock-abi.h: No such file or
 directory
Message-ID: <202608020215.xizWrvGn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux rev/get_set_guest_clock
head:   9796c520977c647c82515987b362119c7c4593ed
commit: 9796c520977c647c82515987b362119c7c4593ed [112/112] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for accurate KVM clock migration
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260802/202608020215.xizWrvGn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020215.xizWrvGn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020215.xizWrvGn-lkp@intel.com/

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
